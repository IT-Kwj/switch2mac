#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_66 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1201 = false;
    bool _1049 = false;
    bool _935 = false;
    bool _641 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_101);
        out.gl_Position.z = _3500;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_139);
        out.gl_Position.z = _3571;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _143;
    float _205 = _183;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _225;
        _205 = _235;
        _121 = _223;
    }
    float _237 = _203;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _163 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _163;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = fma(_273, _147, _281);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _385;
    float _435 = _409;
    float _437 = _415;
    if (_425)
    {
        _433 = _409;
    }
    float _439 = _433;
    float _441 = _439;
    if (_425)
    {
        _435 = _413;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_425)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _441 = _481;
            _437 = _479;
            _445 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _149 * _149;
            float _489 = fma(_147, _147, _487);
            float _491 = fma(_151, _151, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _403 * _403;
                float _507 = fma(_401, _401, _505);
                float _509 = fma(_405, _405, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _535;
                    _437 = _533;
                    _445 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _441 = _569;
                    _437 = _567;
                    _445 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _441 = _603;
                _437 = _601;
                _445 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _441;
    float _609 = _437;
    float _611 = _445;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _617 = _607;
    float _619 = _609;
    float _621 = _611;
    float _639;
    if (!_615)
    {
        float _623 = in.m_54.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_85);
        float _645 = 1.0 / _643;
        float _647 = _119 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _673;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_687;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _661;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = _649 + _695;
    bool _699 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _701 = 1.0 / _665;
    float _703 = _697 * _671;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _707 = _649 + _705;
    float _709 = 1.0 / _669;
    float _711 = _653 * _693;
    bool _713 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _715 = isnan(_649);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _649 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _731 = _649 + _729;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _707 * _701;
    float _739 = 1.0 / _675;
    bool _741 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_649);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -_751;
    float _755 = _753 + 1.0;
    float _757 = _727 * _709;
    float _759 = _751 * _735;
    bool _761 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_649);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _687 * _755;
    bool _775 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _777 = isnan(_649);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _787;
    bool _791 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_649);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _691;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = _731 * _739;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = fma(_789, _703, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _811;
    float _827 = fma(_817, _703, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _829 = _785 * _807;
    float _831 = fma(_821, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _833;
    float _837 = _823 * _825;
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = _827 * _825;
    float _849 = fma(_835, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _853 = fma(_845, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _861 = in.m_52.x;
    float _863 = in.m_52.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _873 = fma(_831, _829, _851);
    float _875 = fma(_857, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_853, _829, _859);
    float _879 = fma(_867, _757, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = fma(_871, _757, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _883;
    float _887 = fma(_849, _803, _873);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _889;
    float _893 = fma(_875, _803, _877);
    float _895 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _897 = fma(_879, _773, _887);
    float _899 = fma(_891, _813, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _901 = fma(_881, _773, _893);
    float _903 = fma(_895, _759, _897);
    float _905 = fma(_899, _759, _901);
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].x, _903);
    float _909 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].y, _905);
    float _911 = _907 * _861;
    float _913 = _909 * _863;
    bool _915 = !_699;
    float _933;
    if (!_915)
    {
        float _917 = in.m_54.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        float _937 = float(_85);
        float _939 = 1.0 / _937;
        float _941 = _119 * _939;
        _933 = _941;
    }
    _935 = false;
    float _943 = _933;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _947 = _943 + _945;
    bool _949 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _961;
    bool _965 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _967 = isnan(_943);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_959;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _981;
    float _985 = 1.0 / _963;
    bool _987 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _989 = _975 * _979;
    float _991 = -_975;
    float _993 = _991 + 1.0;
    float _995 = _947 * _985;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _997;
    float _1001 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = fma(_999, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1009 = _1001 * _989;
    float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1013 = _1007 * _989;
    float _1015 = _1011 * _989;
    float _1017 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1009);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1021 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1013);
    float _1023 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1017);
    float _1025 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1021);
    bool _1029 = !_987;
    float _1047;
    if (!_1029)
    {
        float _1031 = in.m_54.x;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1035 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1039 = _1037 * _1033;
        float _1041 = floor(_1039);
        float _1043 = -_1041;
        float _1045 = _1039 + _1043;
        _1047 = _1045;
        _1049 = true;
    }
    else
    {
        float _1051 = float(_85);
        float _1053 = 1.0 / _1051;
        float _1055 = _119 * _1053;
        _1047 = _1055;
    }
    _1049 = false;
    float _1057 = _1047;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1057 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1069 = isnan(_1057);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1095;
    bool _1099 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1101 = isnan(_1057);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1065;
    float _1113 = -_1077;
    float _1115 = _1113 + 1.0;
    bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1119 = 1.0 / _1081;
    float _1121 = _1097 * _1111;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = -_1109;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1121, _1061, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1133 = _1093 * _1115;
    float _1135 = -_1093;
    float _1137 = _1135 + 1.0;
    float _1139 = _1077 * _1129;
    float _1141 = _1125 * _1119;
    float _1143 = _1131 * _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1057 + _1145;
    float _1149 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    float _1155 = fma(_1141, _1147, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1155, _1139, _1153);
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1161);
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1159;
    out.m_56.y = _1165;
    out.m_56.z = _1167;
    out.m_56.w = _1169;
    bool _1171 = !_1117;
    float _1195;
    float _1197;
    float _1199;
    if (!_1171)
    {
        float _1173 = in.m_54.x;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1177 = float(_85);
        float _1179 = 1.0 / _1177;
        float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1183 = _119 * _1179;
        float _1185 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1187 = _1185 * _1175;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1183;
        _1197 = _1177;
        _1199 = _1193;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_85);
        float _1205 = 1.0 / _1203;
        float _1207 = _119 * _1205;
        _1195 = _1207;
        _1197 = _1203;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1195;
    float _1211 = _1197;
    float _1213 = _1199;
    float _1215 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1217 = int(_1215);
    float _1219 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1221 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1223 = _911 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1225 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1227 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1231 = int(_1229);
    float _1233 = _1223 * _1225;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1237 = _1209 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1243;
    float _1247 = float(_1217);
    float _1249 = 1.0 / _1211;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1251;
    bool _1255 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1257 = isnan(_1209);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = float(uint(_1231));
    float _1269 = 1.0 / _1247;
    int _1271 = ~_1231;
    int _1273 = _1271 + 1;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    int _1279 = ~_1231;
    int _1281 = _1279 + 1;
    int _1283 = ~_1231;
    int _1285 = _1283 + 1;
    float _1287 = 1.0 / _1267;
    float _1289 = _119 * _1269;
    float _1291 = 1.0 / _1241;
    int _1293 = as_type<int>(_1287) + (-2);
    float _1295 = trunc(_1289);
    int _1297 = int(_1295);
    float _1299 = float(uint(_1297));
    float _1301 = float(_1297);
    float _1303 = as_type<float>(_1293) * _1299;
    int _1305 = ~_1231;
    int _1307 = _1305 + 1;
    float _1309 = trunc(_1303);
    float _1311 = precise::max(_1309, 0.0);
    uint _1314 = uint(_1311);
    int _1316 = _1307 * int(_1314);
    int _1318 = _1316 + _1297;
    float _1320 = float(uint(_1318));
    float _1322 = as_type<float>(_1293) * _1320;
    float _1324 = in.m_54.x;
    float _1326 = in.m_54.y;
    float _1328 = in.m_54.z;
    float _1330 = in.m_54.w;
    float _1332 = trunc(_1322);
    float _1334 = precise::max(_1332, 0.0);
    uint _1336 = uint(_1334);
    int _1338 = int(_1314) + int(_1336);
    bool _1340 = _1330 > 0.5;
    int _1342 = _1273 * _1338;
    int _1344 = _1342 + _1297;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1348 = _1346 != 0;
    bool _1350 = uint(_1344) >= uint(_1231);
    bool _1352 = !_1348;
    float _1354 = _1352 ? 1.2345600128173828125 : 1.0;
    bool _1356 = !_1348;
    float _1358 = _1356 ? _1326 : _1324;
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    float _1380 = _1358 * _1354;
    float _1382 = -_199;
    int _1384 = _1340 ? as_type<int>(_1382) : as_type<int>(_199);
    float _1386 = floor(_1380);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1390 = _1388 != 0;
    bool _1392 = !_1370;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1390;
    float _1398 = _1396 ? _199 : as_type<float>(_1384);
    float _1400 = float(_1231);
    bool _1402 = !_1366;
    int _1404 = _1402 ? 0 : 1;
    bool _1406 = !_1374;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = _1301 >= _1400;
    bool _1416 = isnan(_1301);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1400);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1219);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1430 = _1428 != 0;
    float _1432 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1221);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = -_1386;
    float _1440 = _1380 + _1438;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = trunc(_1424);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1440 * _1400;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1458 = _1456 != 0;
    float _1460 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1462 = ~_1338;
    int _1464 = _1462 + _1362;
    int _1466 = _1464 + 1;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1460);
    float _1474 = _119 * _1400;
    bool _1476 = _1324 > 0.5;
    int _1478 = _1231 * _1466;
    int _1480 = _1478 + _1297;
    float _1482 = trunc(_1454);
    int _1484 = int(_1482);
    float _1486 = _1474 * _1249;
    float _1488 = -_195;
    int _1490 = _1476 ? as_type<int>(_1488) : as_type<int>(_195);
    bool _1492 = _1326 > 0.5;
    int _1494 = abs(_1470);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1498 = -_199;
    int _1500 = _1492 ? as_type<int>(_1498) : as_type<int>(_199);
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = _1231 == 0;
    float _1508 = _1227 * _1496;
    int _1510 = ~_1448;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    bool _1516 = !_1506;
    int _1518 = _1516 ? _1480 : (-1);
    int _1520 = _1484 * _1494;
    int _1522 = _1520 + _1297;
    int _1524 = abs(_1404);
    int _1526 = _1518 * _1514;
    int _1528 = _1231 + (-1);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1534 = abs(_1394);
    int _1536 = _1448 * _1528;
    int _1538 = _1536 + _1526;
    int _1540 = abs(_1408);
    float _1542 = 1.0 / _1532;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1548 = _1538 * _1534;
    int _1550 = abs(_1412);
    int _1552 = _1504 * _1524;
    int _1554 = _1552 + _1548;
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1558 = _1522 * _1540;
    int _1560 = _1558 + _1554;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1568 = -_1562;
    float _1570 = fma(_1556, 2.0, _1568);
    int _1572 = _1484 * _1550;
    int _1574 = _1572 + _1560;
    float _1576 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1472);
    float _1578 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1426);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1584 = float(uint(_1574));
    float _1586 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1594 = 1.0 / _1566;
    float _1596 = as_type<float>(_1293) * _1584;
    float _1598 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1604 = ~_1231;
    int _1606 = _1604 + 1;
    float _1608 = fma(_1598, -2.0, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1614 = 1.0 / _1582;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1618 = _1213 + _1616;
    float _1620 = _1602 * _1542;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1622;
    float _1626 = _1618 * _1291;
    float _1628 = -_119;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1570);
    float _1632 = trunc(_1596);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = _1624 * _1594;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1644 = !_1444;
    float _1646 = _1644 ? _199 : as_type<float>(_1500);
    float _1648 = _1586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1650 = _1328 > 0.5;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1654 = 1.0 / _1612;
    float _1656 = _1245 * _1614;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1658;
    float _1662 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = fma(_1656, _1237, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1668 = _1209 + _1666;
    float _1670 = 1.0 / _1546;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1680 = _1606 * int(_1636);
    int _1682 = _1680 + _1574;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1686 = 1.0 / _1642;
    float _1688 = _1678 * _1654;
    float _1690 = -_195;
    int _1692 = _1650 ? as_type<int>(_1690) : as_type<int>(_195);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1694;
    float _1698 = float(uint(_1682));
    bool _1700 = !_1436;
    float _1702 = _1700 ? _195 : as_type<float>(_1490);
    bool _1704 = !_1452;
    float _1706 = _1704 ? _195 : as_type<float>(_1692);
    float _1708 = as_type<float>(_1293) * _1698;
    float _1710 = _1660 * _1670;
    float _1712 = 1.0 / _1590;
    float _1714 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = fma(_1696, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1718 = fma(_1710, _1668, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1720 = _1674 * _1686;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1722;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[158].x;
    float _1728 = _1328;
    if (!_1348)
    {
        _1726 = _1326;
    }
    float _1730 = _1726;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1734 = _1209 + _1732;
    float _1736 = trunc(_1708);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = _1730;
    if (_1348)
    {
        _1742 = _1324;
    }
    float _1744 = _1742;
    float _1746 = fma(_1688, _1734, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    float _1754 = _1724 * _1712;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1758 = fma(_1752, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1760 = fma(_1253, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1762 = float(uint(_1522));
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1766 = int(_1636) + int(_1740);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1770 = _1209 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1774 = _1209 + _1772;
    float _1776 = as_type<float>(_1293) * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1348)
    {
        _1778 = _1328;
    }
    float _1780 = _1778;
    int _1782 = _1281 * _1766;
    int _1784 = _1782 + _1574;
    float _1786 = fma(_1620, _1770, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1788 = fma(_1720, _1774, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1764);
    bool _1798 = uint(_1784) >= uint(_1231);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1802 = _1209 + _1800;
    float _1804 = _1780;
    if (_1348)
    {
        _1804 = _1326;
    }
    float _1806 = _1804;
    bool _1808 = !_1798;
    int _1810 = _1808 ? 0 : (-1);
    float _1812 = fma(_1638, _1802, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_1348)
    {
        _1728 = _1326;
    }
    float _1814 = _1728;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1818 = ~_1766;
    int _1820 = _1818 + _1810;
    int _1822 = _1820 + 1;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1826 = _1209 + _1824;
    int _1828 = ~_1231;
    int _1830 = _1828 + 1;
    float _1832 = _1646 + (-0.5);
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1836 = _1231 * _1822;
    int _1838 = _1836 + _1574;
    float _1840 = fma(_1754, _1826, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1830 * int(_1794);
    int _1846 = _1844 + _1522;
    float _1848 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1608);
    bool _1850 = !_1506;
    int _1852 = _1850 ? _1838 : (-1);
    float _1854 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1756);
    bool _1856 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1858 = isnan(_1209);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    int _1868 = _1852 >> 31;
    float _1870 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1872 = float(uint(_1846));
    float _1874 = _1702 + 0.5;
    int _1876 = _1868 & 3;
    int _1878 = _1852 & 3;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_1293) * _1872;
    bool _1884 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1886 = isnan(_1213);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = -_1866;
    float _1900 = _1898 + 1.0;
    float _1902 = trunc(_1882);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1852 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = fma(_1896, _1874, _1630);
    int _1914 = _1852 + _1876;
    float _1916 = -_1870;
    float _1918 = -_1848;
    float _1920 = fma(_1916, _1832, _1918);
    bool _1922 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1924 = isnan(_1213);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    int _1934 = _1914 >> 2;
    bool _1936 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1938 = isnan(_1209);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    int _1952 = _1934 << 4;
    int _1954 = _1952 + 512;
    bool _1956 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1958 = isnan(_1209);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1894 * _1950;
    float _1970 = -_1946;
    float _1972 = _1970 + 1.0;
    uint _1974 = uint(int(uint(_1954) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1794) + int(_1906);
    float _1992 = _1758 * _1968;
    float _1994 = _1716 * _1968;
    float _1996 = _1760 * _1968;
    bool _1998 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2000 = isnan(_1209);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1966 * _1277;
    float _2012 = -_1966;
    float _2014 = _2012 + 1.0;
    float _2016 = _1866 * _1972;
    float _2018 = _1265 * _1900;
    float _2020 = -_2008;
    float _2022 = _2020 + 1.0;
    float _2024 = _2008 * _2014;
    bool _2026 = uint(_1908) > 1u;
    int _2028 = _1954 + 8;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    uint _2032 = uint(int(uint(int(_2030)) >> uint(2)));
    int _2034 = int(_2030) & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    int _2038 = int(_2030) + 1;
    uint _2040 = uint(int(uint(_2038) >> uint(2)));
    int _2042 = _2038 & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2048 = isnan(_1209);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2054 = _2050 || _2052;
    float _2056 = float(_2054);
    int _2058 = _1285 * _1990;
    int _2060 = _2058 + _1522;
    int _2062 = _1880 ? 0 : 1;
    bool _2064 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2066 = isnan(_1209);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    bool _2076 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2078 = isnan(_1209);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_2056;
    float _2090 = _2088 + 1.0;
    int _2092 = ~_2062;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    float _2098 = _2074 * _2022;
    bool _2100 = uint(_2060) >= uint(_1231);
    float _2102 = _2086 * _2090;
    int _2104 = _2096;
    if (!_2026)
    {
        int _2106 = ~_2062;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = -_2074;
    float _2114 = _2112 + 1.0;
    bool _2116 = !_1910;
    int _2118 = _2116 ? 0 : 1;
    float _2120 = _1664 * _2102;
    int _2122 = abs(_2110);
    float _2124 = _2056 * _2114;
    bool _2126 = _1908 != 3;
    float _2128 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2130 = int(_2128);
    int _2132 = abs(_2118);
    float _2134 = -_2086;
    float _2136 = _2134 + 1.0;
    bool _2138 = uint(_1908) >= 2u;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2120);
    int _2142 = ~_2122;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _2138 ? 0 : 1;
    float _2150 = fma(_1786, _2124, _2140);
    int _2152 = ~_2132;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    bool _2158 = !_2100;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_1718, _2098, _2150);
    int _2164 = ~_2148;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    int _2170 = _2146 * as_type<int>(_1988);
    bool _2172 = _1908 != 3;
    float _2174 = _607 * _607;
    int _2176 = _2168;
    if (_2126)
    {
        int _2178 = ~_2148;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    int _2184 = _2156 * as_type<int>(_1980);
    int _2186 = _2184 + _2170;
    bool _2188 = !_2172;
    int _2190 = _2188 ? 0 : (-1);
    float _2192 = fma(_609, _609, _2174);
    int _2194 = abs(_2182);
    float _2196 = -_1894;
    float _2198 = _2196 + 1.0;
    int _2200 = ~_1990;
    int _2202 = _2200 + _2160;
    int _2204 = _2202 + 1;
    float _2206 = fma(_611, _611, _2192);
    bool _2208 = !_1430;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = fma(_1788, _2024, _2162);
    int _2214 = abs(_2130);
    int _2216 = _1231 * _2204;
    int _2218 = _2216 + _1522;
    float _2220 = float(uint(_2130));
    float _2222 = rsqrt(_2206);
    int _2224 = abs(_2190);
    float _2226 = fma(_1812, _2010, _2212);
    int _2228 = ~_2194;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1992);
    int _2236 = abs(_2210);
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1994);
    int _2240 = _2232 * as_type<int>(_2036);
    int _2242 = _2240 + _2186;
    int _2244 = ~_2224;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = 1.0 / _2220;
    float _2252 = float(uint(_2214));
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1996);
    int _2256 = ~_2236;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2248 * as_type<int>(_2044);
    int _2264 = _2262 + _2242;
    bool _2266 = !_1506;
    int _2268 = _2266 ? _2218 : (-1);
    float _2270 = _2222 * _611;
    float _2272 = 1.0 / _2252;
    int _2274 = _2264 * _2260;
    float _2276 = _2222 * _609;
    float _2278 = _2222 * _607;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2282 = _2270 * _2280;
    int _2284 = _2268 * _2236;
    int _2286 = _2284 + _2274;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2292 = _2278 * _2290;
    int _2294 = as_type<int>(_2250) + (-2);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2298 = -_2282;
    float _2300 = fma(_2276, _2296, _2298);
    float _2302 = float(uint(_2286));
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2306 = abs(_2286);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = _2276 * _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2314 = -_2292;
    float _2316 = fma(_2270, _2312, _2314);
    float _2318 = as_type<float>(_2294) * _2302;
    int _2320 = as_type<int>(_2272) + (-2);
    float _2322 = _2300 * _2300;
    float _2324 = float(uint(_2306));
    float _2326 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2288);
    float _2328 = -_2304;
    float _2330 = fma(_1748, 2.0, _2328);
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2334 = -_2310;
    float _2336 = fma(_2278, _2332, _2334);
    float _2338 = fma(_2316, _2316, _2322);
    float _2340 = as_type<float>(_2320) * _2324;
    int _2342 = ~_2214;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2318);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    float _2352 = fma(_2336, _2336, _2338);
    int _2354 = ~_2130;
    int _2356 = _2354 + 1;
    float _2358 = _1508 * _2278;
    float _2360 = _1508 * _2276;
    float _2362 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2238);
    int _2364 = ~_2214;
    int _2366 = _2364 + 1;
    float _2368 = trunc(_2340);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    float _2374 = -_119;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2330);
    bool _2378 = _2130 == 0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2382 = rsqrt(_2352);
    int _2384 = _2356 * int(_2350);
    int _2386 = _2384 + _2286;
    float _2388 = fma(_1834, -2.0, _2380);
    float _2390 = float(uint(_2386));
    int _2392 = _2344 * int(_2372);
    int _2394 = _2392 + _2306;
    float _2396 = as_type<float>(_2294) * _2390;
    float _2398 = float(uint(_2394));
    float _2400 = trunc(_2396);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = _2300 * _2382;
    float _2408 = _2336 * _2382;
    float _2410 = as_type<float>(_2320) * _2398;
    float _2412 = _2316 * _2382;
    float _2414 = _2276 * _2406;
    float _2416 = _1508 * _2270;
    float _2418 = _2278 * _2408;
    float _2420 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2422 = trunc(_2410);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    float _2428 = -_2414;
    float _2430 = fma(_2278, _2412, _2428);
    float _2432 = fma(_1233, _2408, _2416);
    float _2434 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2234);
    float _2436 = fma(_1233, _2412, _2360);
    float _2438 = fma(_1746, _2018, _2226);
    float _2440 = -_2418;
    float _2442 = fma(_2270, _2406, _2440);
    float _2444 = fma(_2420, _2430, _2432);
    int _2446 = ~_2130;
    int _2448 = _2446 + 1;
    float _2450 = fma(_1233, _2406, _2358);
    float _2452 = fma(_2420, _2442, _2436);
    float _2454 = _1648 + _2444;
    int _2456 = int(_2350) + int(_2404);
    float _2458 = fma(_1840, _2016, _2438);
    float _2460 = _1652 + _2452;
    int _2462 = _2286 ^ _2130;
    float _2464 = _2270 * _2412;
    int _2466 = int(_2372) + int(_2426);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    int _2472 = _2448 * _2456;
    int _2474 = _2472 + _2286;
    float _2476 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2254);
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2480 = _2366 * _2466;
    int _2482 = _2480 + _2306;
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2486 = _2454 + _2484;
    bool _2488 = uint(_2474) >= uint(_2130);
    float _2490 = -_2464;
    float _2492 = fma(_2276, _2408, _2490);
    uint _2494 = uint(int(uint(_2462) >> uint(31)));
    float _2496 = _2486 * _2486;
    bool _2498 = uint(_2482) >= uint(_2214);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = fma(_2470, _2470, _2496);
    bool _2508 = !_2498;
    int _2510 = _2508 ? 0 : (-1);
    float _2512 = fma(_2420, _2492, _2450);
    int _2514 = ~int(_2494);
    int _2516 = _2514 + 1;
    float _2518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2388);
    int _2520 = ~_2510;
    int _2522 = _2466 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = sqrt(_2506);
    int _2528 = ~_2456;
    int _2530 = _2528 + _2504;
    int _2532 = _2530 + 1;
    float _2534 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2524 ^ _2516;
    float _2538 = _1662 + _2512;
    bool _2540 = _2130 == 0;
    int _2542 = _2130 * _2532;
    int _2544 = _2542 + _2286;
    int _2546 = ~_2516;
    int _2548 = _2546 + _2536;
    int _2550 = _2548 + 1;
    float _2552 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2554 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2458);
    bool _2556 = !_2378;
    int _2558 = _2556 ? _2550 : (-1);
    bool _2560 = !_2540;
    int _2562 = _2560 ? _2544 : (-1);
    float _2564 = float(_2558);
    bool _2566 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2568 = float(_2562);
    float _2570 = -_2518;
    float _2572 = fma(_2534, _2564, _2570);
    float _2574 = _1706 + 0.5;
    float _2576 = _1398 + (-0.5);
    float _2578 = fma(_2552, _2568, _2376);
    float _2580 = _2388;
    float _2582 = _2458;
    float _2584 = _2454;
    float _2586 = _2206;
    if (!_2566)
    {
        _2580 = _2460;
    }
    float _2588 = _2580;
    float _2590 = _2588;
    if (!_2566)
    {
        _2582 = _2538;
    }
    float _2592 = _2582;
    bool _2594 = !_2566;
    float _2596 = _2592;
    if (!_2594)
    {
        float _2598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2602 = _2526 + _2600;
        float _2604 = rsqrt(_2506);
        float _2606 = _2602 * _2598;
        float _2608 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2606 * 0.15915493667125701904296875;
        float _2612 = _2610 * 6.283185482025146484375;
        float _2614 = cos(_2612);
        float _2616 = _2610 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2614 + (-1.0);
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = fma(_2618, _2608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2626 = fma(_2538, _2614, _2622);
        float _2628 = _2604 * _2624;
        float _2630 = fma(_2470, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2632 = fma(_2486, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2596 = _2626;
        _2590 = _2630;
        _2584 = _2632;
    }
    float _2634 = _2596;
    float _2636 = _2590;
    float _2638 = _2584;
    float _2640 = fma(_2552, _2574, _2578);
    float _2642 = -_1662;
    float _2644 = _2642 + _2634;
    float _2646 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1796);
    float _2648 = -_1652;
    float _2650 = _2648 + _2636;
    float _2652 = -_2534;
    float _2654 = fma(_2652, _2576, _2572);
    float _2656 = _2644 * _2644;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    float _2662 = -_1648;
    float _2664 = _2662 + _2638;
    float _2666 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    float _2668 = fma(_2650, _2650, _2656);
    float _2670 = fma(_1646, _2660, _1920);
    float _2672 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2326);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2664, _2664, _2668);
    float _2680 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1854);
    float _2682 = -_2676;
    float _2684 = fma(_1702, _2682, _1912);
    float _2686 = sqrt(_2678);
    float _2688 = -_2672;
    float _2690 = _2688 + 1.0;
    float _2692 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2694 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2696 = _2476 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2698 = -_2680;
    float _2700 = _2698 + 1.0;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2706 = _2694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2710 = -_2690;
    float _2712 = fma(_1706, _2710, _2640);
    float _2714 = fma(_1398, _2700, _2654);
    out.m_58.x = _2554;
    out.m_60.x = _2704;
    out.m_60.y = _2706;
    out.m_60.z = _2708;
    out.m_60.w = _2702;
    bool _2716 = _2686 > 0.0;
    out.m_62.x = _2684;
    out.m_62.y = _2670;
    out.m_62.z = _2712;
    out.m_62.w = _2714;
    bool _2718 = !_2716;
    float _2720 = _2714;
    float _2722 = _2684;
    float _2724 = _2670;
    float _2726 = _2634;
    float _2728 = _2636;
    float _2730 = _2638;
    float _2732 = _2670;
    float _2734 = _2684;
    if (!_2718)
    {
        bool _2736 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2738 = _2712;
        if (_2736)
        {
            float _2740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2738 = _2740;
        }
        float _2742 = _2738;
        if (_2736)
        {
            float _2744 = _2742 * _609;
            _2720 = _2744;
        }
        float _2746 = _2720;
        float _2748 = _2746;
        if (_2736)
        {
            float _2750 = _2742 * _607;
            _2722 = _2750;
        }
        float _2752 = _2722;
        float _2754 = _2752;
        float _2756 = _2752;
        if (_2736)
        {
            float _2758 = _2742 * _611;
            _2724 = _2758;
        }
        float _2760 = _2724;
        float _2762 = _2760;
        if (!_2736)
        {
            float _2764 = _119 + 1.0;
            float _2766 = _2764;
            if (!_161)
            {
                float _2768 = _2764 * _2764;
                float _2770 = _2768 * 0.5;
                _2754 = _2770;
            }
            float _2772 = _2754;
            float _2774 = _2772;
            if (!_161)
            {
                float _2776 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2776;
            }
            float _2778 = _2774;
            bool _2780 = !_161;
            float _2782 = _2778;
            if (!_2780)
            {
                float _2784 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = log2(_2784);
                float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2790 = _2788 + 1.0;
                float _2792 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2794 = _2786 * _2764;
                float _2796 = 1.0 / _2790;
                float _2798 = _2792 * 0.693147182464599609375;
                float _2800 = exp2(_2794);
                float _2802 = 1.0 / _2798;
                float _2804 = _2800 + (-1.0);
                float _2806 = -_2804;
                float _2808 = fma(_2806, _2802, _2764);
                float _2810 = _2808 * _2796;
                float _2812 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2782 = _2812;
            }
            float _2814 = _2782;
            float _2816 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2818 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2820 = !_161;
            if (!_2820)
            {
                float _2822 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2824 = log2(_2822);
                float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2828 = _2826 + 1.0;
                float _2830 = 1.0 / _2828;
                float _2832 = _2824 * _2764;
                float _2834 = exp2(_2832);
                float _2836 = -_2834;
                float _2838 = _2836 + 1.0;
                float _2840 = _2838 * _2830;
                _2766 = _2840;
            }
            float _2842 = _2766;
            float _2844 = fma(_2842, _149, _2818);
            float _2846 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2848 = fma(_2842, _147, _2816);
            float _2850 = -_359;
            float _2852 = _2850 + _2844;
            float _2854 = fma(_2842, _151, _2846);
            float _2856 = -_365;
            float _2858 = _2856 + _2848;
            float _2860 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2862 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = -_373;
            float _2866 = _2864 + _2854;
            float _2868 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2860);
            float _2872 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2868);
            float _2876 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2870);
            float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2874);
            float _2882 = _2876 * _2876;
            float _2884 = fma(_2878, _2878, _2882);
            float _2886 = fma(_2880, _2880, _2884);
            _2586 = _2886;
            _617 = _2876;
            _619 = _2878;
            _621 = _2880;
            _2748 = _2878;
            _2756 = _2876;
            _2762 = _2880;
        }
        float _2888 = _2586;
        float _2890 = _617;
        float _2892 = _619;
        float _2894 = _621;
        float _2896 = _2748;
        float _2898 = _2756;
        float _2900 = _2762;
        float _2902 = sqrt(_2888);
        float _2904 = rsqrt(_2678);
        bool _2906 = _2902 > 0.0;
        float _2908 = _2650 * _2904;
        float _2910 = _2644 * _2904;
        float _2912 = _2664 * _2904;
        bool _2914 = !_2906;
        _2732 = _2900;
        _2734 = _2898;
        if (!_2914)
        {
            float _2916 = rsqrt(_2888);
            float _2918 = _2916 * _2890;
            float _2920 = _2916 * _2892;
            float _2922 = _2910 * _2918;
            float _2924 = _2916 * _2894;
            float _2926 = fma(_2908, _2920, _2922);
            float _2928 = fma(_2912, _2924, _2926);
            float _2930 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2932 = fma(_2896, _2930, _2636);
            float _2934 = fma(_2898, _2930, _2634);
            float _2936 = fma(_2900, _2930, _2638);
            _2726 = _2934;
            _2728 = _2932;
            _2730 = _2936;
        }
    }
    float _2938 = _2726;
    float _2940 = _2728;
    float _2942 = _2730;
    float _2944 = _2732;
    float _2946 = _2734;
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2938 + _2948;
    float _2952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2954 = _2940 + _2952;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2942 + _2956;
    float _2960 = _2950 * _2950;
    float _2962 = fma(_2954, _2954, _2960);
    float _2964 = fma(_2958, _2958, _2962);
    float _2966 = rsqrt(_2964);
    float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2970 = _2954 * _2968;
    float _2972 = _2958 * _2968;
    float _2974 = _2970 * _2970;
    float _2976 = _2972 * _2972;
    float _2978 = _2974 + _2976;
    float _2980 = sqrt(_2978);
    bool _2982 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2986 = _2980 + _2984;
    float _2988 = _2966;
    float _2990 = _2946;
    float _2992 = _2986;
    float _2994 = _2944;
    float _2996 = _2950;
    float _2998 = _2968;
    if (_2982)
    {
        float _3000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2988 = _3000;
    }
    float _3002 = _2988;
    if (_2982)
    {
        float _3004 = rsqrt(_2978);
        _2990 = _3004;
    }
    float _3006 = _2990;
    float _3008 = _3006;
    if (_2982)
    {
        float _3010 = _2986 * _3002;
        _2992 = _3010;
    }
    float _3012 = _2992;
    float _3014 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2982)
    {
        float _3016 = _3012 * 0.15915493667125701904296875;
        _2994 = _3016;
    }
    float _3018 = _2994;
    float _3020 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = _3002;
    float _3024 = _3018;
    if (_2982)
    {
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = sin(_3026);
        _3022 = _3028;
    }
    float _3030 = _3022;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3034 = precise::max(0.0, _3032);
    float _3036 = _2958;
    float _3038 = _3034;
    if (_2982)
    {
        float _3040 = _3018 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = -_2968;
    float _3048 = -_3034;
    float _3050 = fma(_2950, _3046, _3048);
    if (_2982)
    {
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3052;
    }
    float _3054 = _3038;
    float _3056 = _3030;
    float _3058 = _3054;
    if (_2982)
    {
        float _3060 = fma(_3030, _3054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2996 = _3060;
    }
    float _3062 = _2996;
    float _3064 = _3062;
    if (!_2982)
    {
        _3056 = _2970;
    }
    float _3066 = _3056;
    float _3068 = _3066;
    if (_2982)
    {
        float _3070 = _3044 + (-1.0);
        _3058 = _3070;
    }
    float _3072 = _3058;
    float _3074 = _3072;
    if (_2982)
    {
        float _3076 = _3006 * _3062;
        _2998 = _3076;
    }
    float _3078 = _2998;
    if (!_2982)
    {
        _3008 = _3050;
    }
    float _3080 = _3008;
    float _3082 = _3080;
    if (_2982)
    {
        float _3084 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3084;
    }
    float _3086 = _3024;
    float _3088 = _3086;
    if (_2982)
    {
        float _3090 = _2970 * _3078;
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2982)
    {
        _3064 = _2972;
    }
    float _3094 = _3064;
    float _3096 = _3094;
    if (_2982)
    {
        float _3098 = _2972 * _3078;
        _3096 = _3098;
    }
    float _3100 = _3096;
    if (_2982)
    {
        float _3102 = fma(_3050, _3044, _3086);
        _3082 = _3102;
    }
    float _3104 = _3082;
    if (!_2982)
    {
        _3088 = _2974;
    }
    float _3106 = _3088;
    float _3108 = _3106;
    if (_2982)
    {
        float _3110 = _3092 * _3092;
        _3108 = _3110;
    }
    float _3112 = _3108;
    float _3114 = sqrt(_2964);
    if (!_2982)
    {
        _3074 = _2976;
    }
    float _3116 = _3074;
    float _3118 = _3116;
    if (_2982)
    {
        float _3120 = _3100 * _3100;
        _3118 = _3120;
    }
    float _3122 = _3118;
    float _3124 = fma(_3104, _3104, _3112);
    float _3126 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3128 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3130 = _3124 + _3122;
    float _3132 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3126);
    float _3134 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3128);
    float _3136 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3138 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    float _3140 = rsqrt(_3130);
    float _3142 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3134);
    float _3144 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3136);
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3148 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3146);
    float _3150 = precise::clamp(_3148, 0.0, 1.0);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3156 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3158 = -_3150;
    float _3160 = _3158 + 1.0;
    float _3162 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3166 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3144);
    float _3168 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = abs(_3160);
    float _3172 = log2(_3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3176 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3178 = _3140 * _3092;
    float _3180 = _3140 * _3104;
    float _3182 = _3140 * _3100;
    float _3184 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3174);
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3188 = -_3168;
    float _3190 = fma(_3188, _3152, 1.0);
    float _3192 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3184);
    float _3194 = -_3186;
    float _3196 = fma(_3180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3194);
    float _3198 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3192);
    float _3200 = -_3182;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3196);
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = log2(_3190);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3210 = fma(_3202, -0.5, 0.5);
    float _3212 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3214 = fma(_3202, 0.5, 0.5);
    float _3216 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3208);
    float _3218 = _3180 + 1.0;
    float _3220 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3212);
    float _3222 = exp2(_3204);
    float _3224 = fma(_3214, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3226 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3216);
    float _3228 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3220);
    float _3230 = fma(_3214, _3224, -0.212114393711090087890625);
    float _3232 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3226);
    float _3234 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3228);
    float _3236 = 1.0 / _3198;
    float _3238 = _3206 * 0.693147182464599609375;
    float _3240 = fma(_3214, _3230, 1.570728778839111328125);
    float _3242 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3244 = sqrt(_3210);
    float _3246 = -_3180;
    float _3248 = fma(_3222, _3218, _3246);
    float _3250 = fma(_3248, 0.5, 0.5);
    float _3252 = _3232 * _3236;
    float _3254 = _3234 * _3236;
    float _3256 = fma(_3252, 0.5, 0.5);
    float _3258 = fma(_3254, -0.5, 0.5);
    float _3260 = _3244 * 0.636619746685028076171875;
    float _3262 = -_3240;
    float _3264 = fma(_3260, _3262, 1.0);
    float3 _8434 = float3(_3256, _3258, _3242);
    float _3266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8434, float3(0.0), isnan(_8434)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8434, float3(0.0), isnan(_8434)), level(0.0)).x;
    float3 _8445 = float3(_3256, _3258, _3242);
    float4 _3269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8445, float3(0.0), isnan(_8445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8445, float3(0.0), isnan(_8445)), level(0.0)).xyzw;
    float _3271 = _3269.x;
    float _3273 = _3269.y;
    float _3275 = _3269.z;
    float _3277 = _3269.w;
    float2 _8462 = float2(_3264, _3250);
    float3 _3281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8462, float2(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8462, float2(0.0), isnan(_8462)), level(0.0)).xyz;
    float _3283 = _3281.x;
    float _3285 = _3281.y;
    float _3287 = _3281.z;
    float _3289 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3291 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3295 = isnan(0.5);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3301 = _3297 || _3299;
    float _3303 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3289);
    float _3305 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3291);
    float _3307 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3303);
    float _3309 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3305);
    float _3311 = _3307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3313 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3315 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3317 = _3309 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3319 = 1.0 / _3311;
    float _3321 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3315);
    float _3323 = _3317 + _3311;
    float _3325 = _3156;
    if (_3301)
    {
        _3325 = 1.0;
    }
    float _3327 = _3325;
    float _3329 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3321);
    float _3331 = exp2(_3313);
    float _3333 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3329);
    float _3335 = _3323 * _3319;
    float _3337 = _3335 * 0.5;
    float _3339 = _3327;
    if (!_3301)
    {
        float _3341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3343 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3345 = _3341 * 0.15915493667125701904296875;
        float _3347 = _3343 * 0.15915493667125701904296875;
        float _3349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3351 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3349);
        float _3353 = _3345 * 6.283185482025146484375;
        float _3355 = cos(_3353);
        float _3357 = _3345 * 6.283185482025146484375;
        float _3359 = sin(_3357);
        float _3361 = 1.0 / _3355;
        float _3363 = _3347 * 6.283185482025146484375;
        float _3365 = cos(_3363);
        float _3367 = _3359 * _3361;
        float _3369 = _3347 * 6.283185482025146484375;
        float _3371 = sin(_3369);
        float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3375 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3373;
        float _3377 = _3365 * _3367;
        float _3379 = 1.0 / _3351;
        float _3381 = 1.0 / _3377;
        float _3383 = 1.0 / _3375;
        float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3387 = _3379 * _3385;
        float _3389 = _3371 * _3381;
        float _3391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3393 = fma(_3389, _3387, _3391);
        float _3395 = _3393 * _3383;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        _3339 = _3397;
    }
    float _3399 = _3339;
    float _3401 = -_3331;
    float _3403 = _3401 + 1.0;
    float _3405 = _3333 + _3198;
    bool _3407 = _3399 > 0.0;
    bool _3409 = isnan(_3399);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan(0.0);
    bool _3415 = _3411 || _3413;
    float _3417 = _3403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3419 = _3399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3421 = _3405 * 0.5;
    out.gl_Position.x = _3232;
    out.gl_Position.y = _3234;
    out.gl_Position.z = _3333;
    out.gl_Position.w = _3198;
    float _3423 = _3417 * _3266;
    float _3425 = -_3417;
    float _3427 = _3425 + 1.0;
    float _3429 = _3419 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3431 = _3277 * _3423;
    float _3433 = _3287 * _3423;
    float _3435 = _3277 * _3427;
    out.m_45.x = _3429;
    float _3437 = fma(_3283, _3431, _3271);
    float _3439 = fma(_3285, _3431, _3273);
    float _3441 = fma(_3277, _3433, _3275);
    out.m_64.z = _3421;
    out.m_64.w = _3198;
    out.m_66.x = _3437;
    out.m_66.y = _3439;
    out.m_66.z = _3441;
    out.m_66.w = _3435;
    if (_3415)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3443;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1201 = false;
    bool _1049 = false;
    bool _935 = false;
    bool _641 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_101);
        out.gl_Position.z = _3500;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_139);
        out.gl_Position.z = _3571;
    }
    if (_131)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _143;
    float _205 = _183;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _225;
        _205 = _235;
        _121 = _223;
    }
    float _237 = _203;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _163 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _163;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = fma(_273, _147, _281);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _385;
    float _435 = _409;
    float _437 = _415;
    if (_425)
    {
        _433 = _409;
    }
    float _439 = _433;
    float _441 = _439;
    if (_425)
    {
        _435 = _413;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_425)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _441 = _481;
            _437 = _479;
            _445 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _149 * _149;
            float _489 = fma(_147, _147, _487);
            float _491 = fma(_151, _151, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _403 * _403;
                float _507 = fma(_401, _401, _505);
                float _509 = fma(_405, _405, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _535;
                    _437 = _533;
                    _445 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _441 = _569;
                    _437 = _567;
                    _445 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _441 = _603;
                _437 = _601;
                _445 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _441;
    float _609 = _437;
    float _611 = _445;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _617 = _607;
    float _619 = _609;
    float _621 = _611;
    float _639;
    if (!_615)
    {
        float _623 = in.m_54.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_85);
        float _645 = 1.0 / _643;
        float _647 = _119 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _673;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_687;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _661;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = _649 + _695;
    bool _699 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _701 = 1.0 / _665;
    float _703 = _697 * _671;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _707 = _649 + _705;
    float _709 = 1.0 / _669;
    float _711 = _653 * _693;
    bool _713 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _715 = isnan(_649);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _649 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _731 = _649 + _729;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _707 * _701;
    float _739 = 1.0 / _675;
    bool _741 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_649);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -_751;
    float _755 = _753 + 1.0;
    float _757 = _727 * _709;
    float _759 = _751 * _735;
    bool _761 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_649);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _687 * _755;
    bool _775 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _777 = isnan(_649);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _787;
    bool _791 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_649);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _691;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = _731 * _739;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = fma(_789, _703, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _811;
    float _827 = fma(_817, _703, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _829 = _785 * _807;
    float _831 = fma(_821, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _833;
    float _837 = _823 * _825;
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = _827 * _825;
    float _849 = fma(_835, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _853 = fma(_845, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _861 = in.m_52.x;
    float _863 = in.m_52.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _873 = fma(_831, _829, _851);
    float _875 = fma(_857, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_853, _829, _859);
    float _879 = fma(_867, _757, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = fma(_871, _757, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _883;
    float _887 = fma(_849, _803, _873);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _889;
    float _893 = fma(_875, _803, _877);
    float _895 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _897 = fma(_879, _773, _887);
    float _899 = fma(_891, _813, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _901 = fma(_881, _773, _893);
    float _903 = fma(_895, _759, _897);
    float _905 = fma(_899, _759, _901);
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].x, _903);
    float _909 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].y, _905);
    float _911 = _907 * _861;
    float _913 = _909 * _863;
    bool _915 = !_699;
    float _933;
    if (!_915)
    {
        float _917 = in.m_54.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        float _937 = float(_85);
        float _939 = 1.0 / _937;
        float _941 = _119 * _939;
        _933 = _941;
    }
    _935 = false;
    float _943 = _933;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _947 = _943 + _945;
    bool _949 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _961;
    bool _965 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _967 = isnan(_943);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_959;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _981;
    float _985 = 1.0 / _963;
    bool _987 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _989 = _975 * _979;
    float _991 = -_975;
    float _993 = _991 + 1.0;
    float _995 = _947 * _985;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _997;
    float _1001 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = fma(_999, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1009 = _1001 * _989;
    float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1013 = _1007 * _989;
    float _1015 = _1011 * _989;
    float _1017 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1009);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1021 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1013);
    float _1023 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1017);
    float _1025 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1021);
    bool _1029 = !_987;
    float _1047;
    if (!_1029)
    {
        float _1031 = in.m_54.x;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1035 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1039 = _1037 * _1033;
        float _1041 = floor(_1039);
        float _1043 = -_1041;
        float _1045 = _1039 + _1043;
        _1047 = _1045;
        _1049 = true;
    }
    else
    {
        float _1051 = float(_85);
        float _1053 = 1.0 / _1051;
        float _1055 = _119 * _1053;
        _1047 = _1055;
    }
    _1049 = false;
    float _1057 = _1047;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1057 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1069 = isnan(_1057);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1095;
    bool _1099 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1101 = isnan(_1057);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1065;
    float _1113 = -_1077;
    float _1115 = _1113 + 1.0;
    bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1119 = 1.0 / _1081;
    float _1121 = _1097 * _1111;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = -_1109;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1121, _1061, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1133 = _1093 * _1115;
    float _1135 = -_1093;
    float _1137 = _1135 + 1.0;
    float _1139 = _1077 * _1129;
    float _1141 = _1125 * _1119;
    float _1143 = _1131 * _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1057 + _1145;
    float _1149 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    float _1155 = fma(_1141, _1147, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1155, _1139, _1153);
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1161);
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1159;
    out.m_56.y = _1165;
    out.m_56.z = _1167;
    out.m_56.w = _1169;
    bool _1171 = !_1117;
    float _1195;
    float _1197;
    float _1199;
    if (!_1171)
    {
        float _1173 = in.m_54.x;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1177 = float(_85);
        float _1179 = 1.0 / _1177;
        float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1183 = _119 * _1179;
        float _1185 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1187 = _1185 * _1175;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1183;
        _1197 = _1177;
        _1199 = _1193;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_85);
        float _1205 = 1.0 / _1203;
        float _1207 = _119 * _1205;
        _1195 = _1207;
        _1197 = _1203;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1195;
    float _1211 = _1197;
    float _1213 = _1199;
    float _1215 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1217 = int(_1215);
    float _1219 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1221 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1223 = _911 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1225 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1227 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1231 = int(_1229);
    float _1233 = _1223 * _1225;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1237 = _1209 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1243;
    float _1247 = float(_1217);
    float _1249 = 1.0 / _1211;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1251;
    bool _1255 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1257 = isnan(_1209);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = float(uint(_1231));
    float _1269 = 1.0 / _1247;
    int _1271 = ~_1231;
    int _1273 = _1271 + 1;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    int _1279 = ~_1231;
    int _1281 = _1279 + 1;
    int _1283 = ~_1231;
    int _1285 = _1283 + 1;
    float _1287 = 1.0 / _1267;
    float _1289 = _119 * _1269;
    float _1291 = 1.0 / _1241;
    int _1293 = as_type<int>(_1287) + (-2);
    float _1295 = trunc(_1289);
    int _1297 = int(_1295);
    float _1299 = float(uint(_1297));
    float _1301 = float(_1297);
    float _1303 = as_type<float>(_1293) * _1299;
    int _1305 = ~_1231;
    int _1307 = _1305 + 1;
    float _1309 = trunc(_1303);
    float _1311 = precise::max(_1309, 0.0);
    uint _1314 = uint(_1311);
    int _1316 = _1307 * int(_1314);
    int _1318 = _1316 + _1297;
    float _1320 = float(uint(_1318));
    float _1322 = as_type<float>(_1293) * _1320;
    float _1324 = in.m_54.x;
    float _1326 = in.m_54.y;
    float _1328 = in.m_54.z;
    float _1330 = in.m_54.w;
    float _1332 = trunc(_1322);
    float _1334 = precise::max(_1332, 0.0);
    uint _1336 = uint(_1334);
    int _1338 = int(_1314) + int(_1336);
    bool _1340 = _1330 > 0.5;
    int _1342 = _1273 * _1338;
    int _1344 = _1342 + _1297;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1348 = _1346 != 0;
    bool _1350 = uint(_1344) >= uint(_1231);
    bool _1352 = !_1348;
    float _1354 = _1352 ? 1.2345600128173828125 : 1.0;
    bool _1356 = !_1348;
    float _1358 = _1356 ? _1326 : _1324;
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    float _1380 = _1358 * _1354;
    float _1382 = -_199;
    int _1384 = _1340 ? as_type<int>(_1382) : as_type<int>(_199);
    float _1386 = floor(_1380);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1390 = _1388 != 0;
    bool _1392 = !_1370;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1390;
    float _1398 = _1396 ? _199 : as_type<float>(_1384);
    float _1400 = float(_1231);
    bool _1402 = !_1366;
    int _1404 = _1402 ? 0 : 1;
    bool _1406 = !_1374;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = _1301 >= _1400;
    bool _1416 = isnan(_1301);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1400);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1219);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1430 = _1428 != 0;
    float _1432 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1221);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = -_1386;
    float _1440 = _1380 + _1438;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = trunc(_1424);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1440 * _1400;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1458 = _1456 != 0;
    float _1460 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1462 = ~_1338;
    int _1464 = _1462 + _1362;
    int _1466 = _1464 + 1;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1460);
    float _1474 = _119 * _1400;
    bool _1476 = _1324 > 0.5;
    int _1478 = _1231 * _1466;
    int _1480 = _1478 + _1297;
    float _1482 = trunc(_1454);
    int _1484 = int(_1482);
    float _1486 = _1474 * _1249;
    float _1488 = -_195;
    int _1490 = _1476 ? as_type<int>(_1488) : as_type<int>(_195);
    bool _1492 = _1326 > 0.5;
    int _1494 = abs(_1470);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1498 = -_199;
    int _1500 = _1492 ? as_type<int>(_1498) : as_type<int>(_199);
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = _1231 == 0;
    float _1508 = _1227 * _1496;
    int _1510 = ~_1448;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    bool _1516 = !_1506;
    int _1518 = _1516 ? _1480 : (-1);
    int _1520 = _1484 * _1494;
    int _1522 = _1520 + _1297;
    int _1524 = abs(_1404);
    int _1526 = _1518 * _1514;
    int _1528 = _1231 + (-1);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1534 = abs(_1394);
    int _1536 = _1448 * _1528;
    int _1538 = _1536 + _1526;
    int _1540 = abs(_1408);
    float _1542 = 1.0 / _1532;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1548 = _1538 * _1534;
    int _1550 = abs(_1412);
    int _1552 = _1504 * _1524;
    int _1554 = _1552 + _1548;
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1558 = _1522 * _1540;
    int _1560 = _1558 + _1554;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1568 = -_1562;
    float _1570 = fma(_1556, 2.0, _1568);
    int _1572 = _1484 * _1550;
    int _1574 = _1572 + _1560;
    float _1576 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1472);
    float _1578 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1426);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1584 = float(uint(_1574));
    float _1586 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1594 = 1.0 / _1566;
    float _1596 = as_type<float>(_1293) * _1584;
    float _1598 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1604 = ~_1231;
    int _1606 = _1604 + 1;
    float _1608 = fma(_1598, -2.0, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1614 = 1.0 / _1582;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1618 = _1213 + _1616;
    float _1620 = _1602 * _1542;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1622;
    float _1626 = _1618 * _1291;
    float _1628 = -_119;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1570);
    float _1632 = trunc(_1596);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = _1624 * _1594;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1644 = !_1444;
    float _1646 = _1644 ? _199 : as_type<float>(_1500);
    float _1648 = _1586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1650 = _1328 > 0.5;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1654 = 1.0 / _1612;
    float _1656 = _1245 * _1614;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1658;
    float _1662 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = fma(_1656, _1237, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1668 = _1209 + _1666;
    float _1670 = 1.0 / _1546;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1680 = _1606 * int(_1636);
    int _1682 = _1680 + _1574;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1686 = 1.0 / _1642;
    float _1688 = _1678 * _1654;
    float _1690 = -_195;
    int _1692 = _1650 ? as_type<int>(_1690) : as_type<int>(_195);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1694;
    float _1698 = float(uint(_1682));
    bool _1700 = !_1436;
    float _1702 = _1700 ? _195 : as_type<float>(_1490);
    bool _1704 = !_1452;
    float _1706 = _1704 ? _195 : as_type<float>(_1692);
    float _1708 = as_type<float>(_1293) * _1698;
    float _1710 = _1660 * _1670;
    float _1712 = 1.0 / _1590;
    float _1714 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = fma(_1696, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1718 = fma(_1710, _1668, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1720 = _1674 * _1686;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1722;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[158].x;
    float _1728 = _1328;
    if (!_1348)
    {
        _1726 = _1326;
    }
    float _1730 = _1726;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1734 = _1209 + _1732;
    float _1736 = trunc(_1708);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = _1730;
    if (_1348)
    {
        _1742 = _1324;
    }
    float _1744 = _1742;
    float _1746 = fma(_1688, _1734, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    float _1754 = _1724 * _1712;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1758 = fma(_1752, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1760 = fma(_1253, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1762 = float(uint(_1522));
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1766 = int(_1636) + int(_1740);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1770 = _1209 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1774 = _1209 + _1772;
    float _1776 = as_type<float>(_1293) * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1348)
    {
        _1778 = _1328;
    }
    float _1780 = _1778;
    int _1782 = _1281 * _1766;
    int _1784 = _1782 + _1574;
    float _1786 = fma(_1620, _1770, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1788 = fma(_1720, _1774, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1764);
    bool _1798 = uint(_1784) >= uint(_1231);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1802 = _1209 + _1800;
    float _1804 = _1780;
    if (_1348)
    {
        _1804 = _1326;
    }
    float _1806 = _1804;
    bool _1808 = !_1798;
    int _1810 = _1808 ? 0 : (-1);
    float _1812 = fma(_1638, _1802, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_1348)
    {
        _1728 = _1326;
    }
    float _1814 = _1728;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1818 = ~_1766;
    int _1820 = _1818 + _1810;
    int _1822 = _1820 + 1;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1826 = _1209 + _1824;
    int _1828 = ~_1231;
    int _1830 = _1828 + 1;
    float _1832 = _1646 + (-0.5);
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1836 = _1231 * _1822;
    int _1838 = _1836 + _1574;
    float _1840 = fma(_1754, _1826, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1830 * int(_1794);
    int _1846 = _1844 + _1522;
    float _1848 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1608);
    bool _1850 = !_1506;
    int _1852 = _1850 ? _1838 : (-1);
    float _1854 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1756);
    bool _1856 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1858 = isnan(_1209);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    int _1868 = _1852 >> 31;
    float _1870 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1872 = float(uint(_1846));
    float _1874 = _1702 + 0.5;
    int _1876 = _1868 & 3;
    int _1878 = _1852 & 3;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_1293) * _1872;
    bool _1884 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1886 = isnan(_1213);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = -_1866;
    float _1900 = _1898 + 1.0;
    float _1902 = trunc(_1882);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1852 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = fma(_1896, _1874, _1630);
    int _1914 = _1852 + _1876;
    float _1916 = -_1870;
    float _1918 = -_1848;
    float _1920 = fma(_1916, _1832, _1918);
    bool _1922 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1924 = isnan(_1213);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    int _1934 = _1914 >> 2;
    bool _1936 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1938 = isnan(_1209);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    int _1952 = _1934 << 4;
    int _1954 = _1952 + 512;
    bool _1956 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1958 = isnan(_1209);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1894 * _1950;
    float _1970 = -_1946;
    float _1972 = _1970 + 1.0;
    uint _1974 = uint(int(uint(_1954) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1794) + int(_1906);
    float _1992 = _1758 * _1968;
    float _1994 = _1716 * _1968;
    float _1996 = _1760 * _1968;
    bool _1998 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2000 = isnan(_1209);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1966 * _1277;
    float _2012 = -_1966;
    float _2014 = _2012 + 1.0;
    float _2016 = _1866 * _1972;
    float _2018 = _1265 * _1900;
    float _2020 = -_2008;
    float _2022 = _2020 + 1.0;
    float _2024 = _2008 * _2014;
    bool _2026 = uint(_1908) > 1u;
    int _2028 = _1954 + 8;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    uint _2032 = uint(int(uint(int(_2030)) >> uint(2)));
    int _2034 = int(_2030) & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    int _2038 = int(_2030) + 1;
    uint _2040 = uint(int(uint(_2038) >> uint(2)));
    int _2042 = _2038 & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2048 = isnan(_1209);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2054 = _2050 || _2052;
    float _2056 = float(_2054);
    int _2058 = _1285 * _1990;
    int _2060 = _2058 + _1522;
    int _2062 = _1880 ? 0 : 1;
    bool _2064 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2066 = isnan(_1209);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    bool _2076 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2078 = isnan(_1209);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_2056;
    float _2090 = _2088 + 1.0;
    int _2092 = ~_2062;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    float _2098 = _2074 * _2022;
    bool _2100 = uint(_2060) >= uint(_1231);
    float _2102 = _2086 * _2090;
    int _2104 = _2096;
    if (!_2026)
    {
        int _2106 = ~_2062;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = -_2074;
    float _2114 = _2112 + 1.0;
    bool _2116 = !_1910;
    int _2118 = _2116 ? 0 : 1;
    float _2120 = _1664 * _2102;
    int _2122 = abs(_2110);
    float _2124 = _2056 * _2114;
    bool _2126 = _1908 != 3;
    float _2128 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2130 = int(_2128);
    int _2132 = abs(_2118);
    float _2134 = -_2086;
    float _2136 = _2134 + 1.0;
    bool _2138 = uint(_1908) >= 2u;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2120);
    int _2142 = ~_2122;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _2138 ? 0 : 1;
    float _2150 = fma(_1786, _2124, _2140);
    int _2152 = ~_2132;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    bool _2158 = !_2100;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_1718, _2098, _2150);
    int _2164 = ~_2148;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    int _2170 = _2146 * as_type<int>(_1988);
    bool _2172 = _1908 != 3;
    float _2174 = _607 * _607;
    int _2176 = _2168;
    if (_2126)
    {
        int _2178 = ~_2148;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    int _2184 = _2156 * as_type<int>(_1980);
    int _2186 = _2184 + _2170;
    bool _2188 = !_2172;
    int _2190 = _2188 ? 0 : (-1);
    float _2192 = fma(_609, _609, _2174);
    int _2194 = abs(_2182);
    float _2196 = -_1894;
    float _2198 = _2196 + 1.0;
    int _2200 = ~_1990;
    int _2202 = _2200 + _2160;
    int _2204 = _2202 + 1;
    float _2206 = fma(_611, _611, _2192);
    bool _2208 = !_1430;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = fma(_1788, _2024, _2162);
    int _2214 = abs(_2130);
    int _2216 = _1231 * _2204;
    int _2218 = _2216 + _1522;
    float _2220 = float(uint(_2130));
    float _2222 = rsqrt(_2206);
    int _2224 = abs(_2190);
    float _2226 = fma(_1812, _2010, _2212);
    int _2228 = ~_2194;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1992);
    int _2236 = abs(_2210);
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1994);
    int _2240 = _2232 * as_type<int>(_2036);
    int _2242 = _2240 + _2186;
    int _2244 = ~_2224;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = 1.0 / _2220;
    float _2252 = float(uint(_2214));
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1996);
    int _2256 = ~_2236;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2248 * as_type<int>(_2044);
    int _2264 = _2262 + _2242;
    bool _2266 = !_1506;
    int _2268 = _2266 ? _2218 : (-1);
    float _2270 = _2222 * _611;
    float _2272 = 1.0 / _2252;
    int _2274 = _2264 * _2260;
    float _2276 = _2222 * _609;
    float _2278 = _2222 * _607;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2282 = _2270 * _2280;
    int _2284 = _2268 * _2236;
    int _2286 = _2284 + _2274;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2292 = _2278 * _2290;
    int _2294 = as_type<int>(_2250) + (-2);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2298 = -_2282;
    float _2300 = fma(_2276, _2296, _2298);
    float _2302 = float(uint(_2286));
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2306 = abs(_2286);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = _2276 * _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2314 = -_2292;
    float _2316 = fma(_2270, _2312, _2314);
    float _2318 = as_type<float>(_2294) * _2302;
    int _2320 = as_type<int>(_2272) + (-2);
    float _2322 = _2300 * _2300;
    float _2324 = float(uint(_2306));
    float _2326 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2288);
    float _2328 = -_2304;
    float _2330 = fma(_1748, 2.0, _2328);
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2334 = -_2310;
    float _2336 = fma(_2278, _2332, _2334);
    float _2338 = fma(_2316, _2316, _2322);
    float _2340 = as_type<float>(_2320) * _2324;
    int _2342 = ~_2214;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2318);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    float _2352 = fma(_2336, _2336, _2338);
    int _2354 = ~_2130;
    int _2356 = _2354 + 1;
    float _2358 = _1508 * _2278;
    float _2360 = _1508 * _2276;
    float _2362 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2238);
    int _2364 = ~_2214;
    int _2366 = _2364 + 1;
    float _2368 = trunc(_2340);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    float _2374 = -_119;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2330);
    bool _2378 = _2130 == 0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2382 = rsqrt(_2352);
    int _2384 = _2356 * int(_2350);
    int _2386 = _2384 + _2286;
    float _2388 = fma(_1834, -2.0, _2380);
    float _2390 = float(uint(_2386));
    int _2392 = _2344 * int(_2372);
    int _2394 = _2392 + _2306;
    float _2396 = as_type<float>(_2294) * _2390;
    float _2398 = float(uint(_2394));
    float _2400 = trunc(_2396);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = _2300 * _2382;
    float _2408 = _2336 * _2382;
    float _2410 = as_type<float>(_2320) * _2398;
    float _2412 = _2316 * _2382;
    float _2414 = _2276 * _2406;
    float _2416 = _1508 * _2270;
    float _2418 = _2278 * _2408;
    float _2420 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2422 = trunc(_2410);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    float _2428 = -_2414;
    float _2430 = fma(_2278, _2412, _2428);
    float _2432 = fma(_1233, _2408, _2416);
    float _2434 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2234);
    float _2436 = fma(_1233, _2412, _2360);
    float _2438 = fma(_1746, _2018, _2226);
    float _2440 = -_2418;
    float _2442 = fma(_2270, _2406, _2440);
    float _2444 = fma(_2420, _2430, _2432);
    int _2446 = ~_2130;
    int _2448 = _2446 + 1;
    float _2450 = fma(_1233, _2406, _2358);
    float _2452 = fma(_2420, _2442, _2436);
    float _2454 = _1648 + _2444;
    int _2456 = int(_2350) + int(_2404);
    float _2458 = fma(_1840, _2016, _2438);
    float _2460 = _1652 + _2452;
    int _2462 = _2286 ^ _2130;
    float _2464 = _2270 * _2412;
    int _2466 = int(_2372) + int(_2426);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    int _2472 = _2448 * _2456;
    int _2474 = _2472 + _2286;
    float _2476 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2254);
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2480 = _2366 * _2466;
    int _2482 = _2480 + _2306;
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2486 = _2454 + _2484;
    bool _2488 = uint(_2474) >= uint(_2130);
    float _2490 = -_2464;
    float _2492 = fma(_2276, _2408, _2490);
    uint _2494 = uint(int(uint(_2462) >> uint(31)));
    float _2496 = _2486 * _2486;
    bool _2498 = uint(_2482) >= uint(_2214);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = fma(_2470, _2470, _2496);
    bool _2508 = !_2498;
    int _2510 = _2508 ? 0 : (-1);
    float _2512 = fma(_2420, _2492, _2450);
    int _2514 = ~int(_2494);
    int _2516 = _2514 + 1;
    float _2518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2388);
    int _2520 = ~_2510;
    int _2522 = _2466 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = sqrt(_2506);
    int _2528 = ~_2456;
    int _2530 = _2528 + _2504;
    int _2532 = _2530 + 1;
    float _2534 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2524 ^ _2516;
    float _2538 = _1662 + _2512;
    bool _2540 = _2130 == 0;
    int _2542 = _2130 * _2532;
    int _2544 = _2542 + _2286;
    int _2546 = ~_2516;
    int _2548 = _2546 + _2536;
    int _2550 = _2548 + 1;
    float _2552 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2554 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2458);
    bool _2556 = !_2378;
    int _2558 = _2556 ? _2550 : (-1);
    bool _2560 = !_2540;
    int _2562 = _2560 ? _2544 : (-1);
    float _2564 = float(_2558);
    bool _2566 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2568 = float(_2562);
    float _2570 = -_2518;
    float _2572 = fma(_2534, _2564, _2570);
    float _2574 = _1706 + 0.5;
    float _2576 = _1398 + (-0.5);
    float _2578 = fma(_2552, _2568, _2376);
    float _2580 = _2388;
    float _2582 = _2458;
    float _2584 = _2454;
    float _2586 = _2206;
    if (!_2566)
    {
        _2580 = _2460;
    }
    float _2588 = _2580;
    float _2590 = _2588;
    if (!_2566)
    {
        _2582 = _2538;
    }
    float _2592 = _2582;
    bool _2594 = !_2566;
    float _2596 = _2592;
    if (!_2594)
    {
        float _2598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2602 = _2526 + _2600;
        float _2604 = rsqrt(_2506);
        float _2606 = _2602 * _2598;
        float _2608 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2606 * 0.15915493667125701904296875;
        float _2612 = _2610 * 6.283185482025146484375;
        float _2614 = cos(_2612);
        float _2616 = _2610 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2614 + (-1.0);
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = fma(_2618, _2608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2626 = fma(_2538, _2614, _2622);
        float _2628 = _2604 * _2624;
        float _2630 = fma(_2470, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2632 = fma(_2486, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2596 = _2626;
        _2590 = _2630;
        _2584 = _2632;
    }
    float _2634 = _2596;
    float _2636 = _2590;
    float _2638 = _2584;
    float _2640 = fma(_2552, _2574, _2578);
    float _2642 = -_1662;
    float _2644 = _2642 + _2634;
    float _2646 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1796);
    float _2648 = -_1652;
    float _2650 = _2648 + _2636;
    float _2652 = -_2534;
    float _2654 = fma(_2652, _2576, _2572);
    float _2656 = _2644 * _2644;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    float _2662 = -_1648;
    float _2664 = _2662 + _2638;
    float _2666 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    float _2668 = fma(_2650, _2650, _2656);
    float _2670 = fma(_1646, _2660, _1920);
    float _2672 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2326);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2664, _2664, _2668);
    float _2680 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1854);
    float _2682 = -_2676;
    float _2684 = fma(_1702, _2682, _1912);
    float _2686 = sqrt(_2678);
    float _2688 = -_2672;
    float _2690 = _2688 + 1.0;
    float _2692 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2694 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2696 = _2476 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2698 = -_2680;
    float _2700 = _2698 + 1.0;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2706 = _2694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2710 = -_2690;
    float _2712 = fma(_1706, _2710, _2640);
    float _2714 = fma(_1398, _2700, _2654);
    out.m_58.x = _2554;
    out.m_60.x = _2704;
    out.m_60.y = _2706;
    out.m_60.z = _2708;
    out.m_60.w = _2702;
    bool _2716 = _2686 > 0.0;
    out.m_62.x = _2684;
    out.m_62.y = _2670;
    out.m_62.z = _2712;
    out.m_62.w = _2714;
    bool _2718 = !_2716;
    float _2720 = _2714;
    float _2722 = _2684;
    float _2724 = _2670;
    float _2726 = _2634;
    float _2728 = _2636;
    float _2730 = _2638;
    float _2732 = _2670;
    float _2734 = _2684;
    if (!_2718)
    {
        bool _2736 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2738 = _2712;
        if (_2736)
        {
            float _2740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2738 = _2740;
        }
        float _2742 = _2738;
        if (_2736)
        {
            float _2744 = _2742 * _609;
            _2720 = _2744;
        }
        float _2746 = _2720;
        float _2748 = _2746;
        if (_2736)
        {
            float _2750 = _2742 * _607;
            _2722 = _2750;
        }
        float _2752 = _2722;
        float _2754 = _2752;
        float _2756 = _2752;
        if (_2736)
        {
            float _2758 = _2742 * _611;
            _2724 = _2758;
        }
        float _2760 = _2724;
        float _2762 = _2760;
        if (!_2736)
        {
            float _2764 = _119 + 1.0;
            float _2766 = _2764;
            if (!_161)
            {
                float _2768 = _2764 * _2764;
                float _2770 = _2768 * 0.5;
                _2754 = _2770;
            }
            float _2772 = _2754;
            float _2774 = _2772;
            if (!_161)
            {
                float _2776 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2776;
            }
            float _2778 = _2774;
            bool _2780 = !_161;
            float _2782 = _2778;
            if (!_2780)
            {
                float _2784 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = log2(_2784);
                float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2790 = _2788 + 1.0;
                float _2792 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2794 = _2786 * _2764;
                float _2796 = 1.0 / _2790;
                float _2798 = _2792 * 0.693147182464599609375;
                float _2800 = exp2(_2794);
                float _2802 = 1.0 / _2798;
                float _2804 = _2800 + (-1.0);
                float _2806 = -_2804;
                float _2808 = fma(_2806, _2802, _2764);
                float _2810 = _2808 * _2796;
                float _2812 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2782 = _2812;
            }
            float _2814 = _2782;
            float _2816 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2818 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2820 = !_161;
            if (!_2820)
            {
                float _2822 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2824 = log2(_2822);
                float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2828 = _2826 + 1.0;
                float _2830 = 1.0 / _2828;
                float _2832 = _2824 * _2764;
                float _2834 = exp2(_2832);
                float _2836 = -_2834;
                float _2838 = _2836 + 1.0;
                float _2840 = _2838 * _2830;
                _2766 = _2840;
            }
            float _2842 = _2766;
            float _2844 = fma(_2842, _149, _2818);
            float _2846 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2848 = fma(_2842, _147, _2816);
            float _2850 = -_359;
            float _2852 = _2850 + _2844;
            float _2854 = fma(_2842, _151, _2846);
            float _2856 = -_365;
            float _2858 = _2856 + _2848;
            float _2860 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2862 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = -_373;
            float _2866 = _2864 + _2854;
            float _2868 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2860);
            float _2872 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2868);
            float _2876 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2870);
            float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2874);
            float _2882 = _2876 * _2876;
            float _2884 = fma(_2878, _2878, _2882);
            float _2886 = fma(_2880, _2880, _2884);
            _2586 = _2886;
            _617 = _2876;
            _619 = _2878;
            _621 = _2880;
            _2748 = _2878;
            _2756 = _2876;
            _2762 = _2880;
        }
        float _2888 = _2586;
        float _2890 = _617;
        float _2892 = _619;
        float _2894 = _621;
        float _2896 = _2748;
        float _2898 = _2756;
        float _2900 = _2762;
        float _2902 = sqrt(_2888);
        float _2904 = rsqrt(_2678);
        bool _2906 = _2902 > 0.0;
        float _2908 = _2650 * _2904;
        float _2910 = _2644 * _2904;
        float _2912 = _2664 * _2904;
        bool _2914 = !_2906;
        _2732 = _2900;
        _2734 = _2898;
        if (!_2914)
        {
            float _2916 = rsqrt(_2888);
            float _2918 = _2916 * _2890;
            float _2920 = _2916 * _2892;
            float _2922 = _2910 * _2918;
            float _2924 = _2916 * _2894;
            float _2926 = fma(_2908, _2920, _2922);
            float _2928 = fma(_2912, _2924, _2926);
            float _2930 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2932 = fma(_2896, _2930, _2636);
            float _2934 = fma(_2898, _2930, _2634);
            float _2936 = fma(_2900, _2930, _2638);
            _2726 = _2934;
            _2728 = _2932;
            _2730 = _2936;
        }
    }
    float _2938 = _2726;
    float _2940 = _2728;
    float _2942 = _2730;
    float _2944 = _2732;
    float _2946 = _2734;
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2938 + _2948;
    float _2952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2954 = _2940 + _2952;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2942 + _2956;
    float _2960 = _2950 * _2950;
    float _2962 = fma(_2954, _2954, _2960);
    float _2964 = fma(_2958, _2958, _2962);
    float _2966 = rsqrt(_2964);
    float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2970 = _2954 * _2968;
    float _2972 = _2958 * _2968;
    float _2974 = _2970 * _2970;
    float _2976 = _2972 * _2972;
    float _2978 = _2974 + _2976;
    float _2980 = sqrt(_2978);
    bool _2982 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2986 = _2980 + _2984;
    float _2988 = _2966;
    float _2990 = _2946;
    float _2992 = _2986;
    float _2994 = _2944;
    float _2996 = _2950;
    float _2998 = _2968;
    if (_2982)
    {
        float _3000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2988 = _3000;
    }
    float _3002 = _2988;
    if (_2982)
    {
        float _3004 = rsqrt(_2978);
        _2990 = _3004;
    }
    float _3006 = _2990;
    float _3008 = _3006;
    if (_2982)
    {
        float _3010 = _2986 * _3002;
        _2992 = _3010;
    }
    float _3012 = _2992;
    float _3014 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2982)
    {
        float _3016 = _3012 * 0.15915493667125701904296875;
        _2994 = _3016;
    }
    float _3018 = _2994;
    float _3020 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = _3002;
    float _3024 = _3018;
    if (_2982)
    {
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = sin(_3026);
        _3022 = _3028;
    }
    float _3030 = _3022;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3034 = precise::max(0.0, _3032);
    float _3036 = _2958;
    float _3038 = _3034;
    if (_2982)
    {
        float _3040 = _3018 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = -_2968;
    float _3048 = -_3034;
    float _3050 = fma(_2950, _3046, _3048);
    if (_2982)
    {
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3052;
    }
    float _3054 = _3038;
    float _3056 = _3030;
    float _3058 = _3054;
    if (_2982)
    {
        float _3060 = fma(_3030, _3054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2996 = _3060;
    }
    float _3062 = _2996;
    float _3064 = _3062;
    if (!_2982)
    {
        _3056 = _2970;
    }
    float _3066 = _3056;
    float _3068 = _3066;
    if (_2982)
    {
        float _3070 = _3044 + (-1.0);
        _3058 = _3070;
    }
    float _3072 = _3058;
    float _3074 = _3072;
    if (_2982)
    {
        float _3076 = _3006 * _3062;
        _2998 = _3076;
    }
    float _3078 = _2998;
    if (!_2982)
    {
        _3008 = _3050;
    }
    float _3080 = _3008;
    float _3082 = _3080;
    if (_2982)
    {
        float _3084 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3084;
    }
    float _3086 = _3024;
    float _3088 = _3086;
    if (_2982)
    {
        float _3090 = _2970 * _3078;
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2982)
    {
        _3064 = _2972;
    }
    float _3094 = _3064;
    float _3096 = _3094;
    if (_2982)
    {
        float _3098 = _2972 * _3078;
        _3096 = _3098;
    }
    float _3100 = _3096;
    if (_2982)
    {
        float _3102 = fma(_3050, _3044, _3086);
        _3082 = _3102;
    }
    float _3104 = _3082;
    if (!_2982)
    {
        _3088 = _2974;
    }
    float _3106 = _3088;
    float _3108 = _3106;
    if (_2982)
    {
        float _3110 = _3092 * _3092;
        _3108 = _3110;
    }
    float _3112 = _3108;
    float _3114 = sqrt(_2964);
    if (!_2982)
    {
        _3074 = _2976;
    }
    float _3116 = _3074;
    float _3118 = _3116;
    if (_2982)
    {
        float _3120 = _3100 * _3100;
        _3118 = _3120;
    }
    float _3122 = _3118;
    float _3124 = fma(_3104, _3104, _3112);
    float _3126 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3128 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3130 = _3124 + _3122;
    float _3132 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3126);
    float _3134 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3128);
    float _3136 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3138 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    float _3140 = rsqrt(_3130);
    float _3142 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3134);
    float _3144 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3136);
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3148 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3146);
    float _3150 = precise::clamp(_3148, 0.0, 1.0);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3156 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3158 = -_3150;
    float _3160 = _3158 + 1.0;
    float _3162 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3166 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3144);
    float _3168 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = abs(_3160);
    float _3172 = log2(_3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3176 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3178 = _3140 * _3092;
    float _3180 = _3140 * _3104;
    float _3182 = _3140 * _3100;
    float _3184 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3174);
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3188 = -_3168;
    float _3190 = fma(_3188, _3152, 1.0);
    float _3192 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3184);
    float _3194 = -_3186;
    float _3196 = fma(_3180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3194);
    float _3198 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3192);
    float _3200 = -_3182;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3196);
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = log2(_3190);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3210 = fma(_3202, -0.5, 0.5);
    float _3212 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3214 = fma(_3202, 0.5, 0.5);
    float _3216 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3208);
    float _3218 = _3180 + 1.0;
    float _3220 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3212);
    float _3222 = exp2(_3204);
    float _3224 = fma(_3214, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3226 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3216);
    float _3228 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3220);
    float _3230 = fma(_3214, _3224, -0.212114393711090087890625);
    float _3232 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3226);
    float _3234 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3228);
    float _3236 = 1.0 / _3198;
    float _3238 = _3206 * 0.693147182464599609375;
    float _3240 = fma(_3214, _3230, 1.570728778839111328125);
    float _3242 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3244 = sqrt(_3210);
    float _3246 = -_3180;
    float _3248 = fma(_3222, _3218, _3246);
    float _3250 = fma(_3248, 0.5, 0.5);
    float _3252 = _3232 * _3236;
    float _3254 = _3234 * _3236;
    float _3256 = fma(_3252, 0.5, 0.5);
    float _3258 = fma(_3254, -0.5, 0.5);
    float _3260 = _3244 * 0.636619746685028076171875;
    float _3262 = -_3240;
    float _3264 = fma(_3260, _3262, 1.0);
    float3 _8434 = float3(_3256, _3258, _3242);
    float _3266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8434, float3(0.0), isnan(_8434)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8434, float3(0.0), isnan(_8434)), level(0.0)).x;
    float3 _8445 = float3(_3256, _3258, _3242);
    float4 _3269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8445, float3(0.0), isnan(_8445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8445, float3(0.0), isnan(_8445)), level(0.0)).xyzw;
    float _3271 = _3269.x;
    float _3273 = _3269.y;
    float _3275 = _3269.z;
    float _3277 = _3269.w;
    float2 _8462 = float2(_3264, _3250);
    float3 _3281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8462, float2(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8462, float2(0.0), isnan(_8462)), level(0.0)).xyz;
    float _3283 = _3281.x;
    float _3285 = _3281.y;
    float _3287 = _3281.z;
    float _3289 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3291 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3295 = isnan(0.5);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3301 = _3297 || _3299;
    float _3303 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3289);
    float _3305 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3291);
    float _3307 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3303);
    float _3309 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3305);
    float _3311 = _3307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3313 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3315 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3317 = _3309 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3319 = 1.0 / _3311;
    float _3321 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3315);
    float _3323 = _3317 + _3311;
    float _3325 = _3156;
    if (_3301)
    {
        _3325 = 1.0;
    }
    float _3327 = _3325;
    float _3329 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3321);
    float _3331 = exp2(_3313);
    float _3333 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3329);
    float _3335 = _3323 * _3319;
    float _3337 = _3335 * 0.5;
    float _3339 = _3327;
    if (!_3301)
    {
        float _3341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3343 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3345 = _3341 * 0.15915493667125701904296875;
        float _3347 = _3343 * 0.15915493667125701904296875;
        float _3349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3351 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3349);
        float _3353 = _3345 * 6.283185482025146484375;
        float _3355 = cos(_3353);
        float _3357 = _3345 * 6.283185482025146484375;
        float _3359 = sin(_3357);
        float _3361 = 1.0 / _3355;
        float _3363 = _3347 * 6.283185482025146484375;
        float _3365 = cos(_3363);
        float _3367 = _3359 * _3361;
        float _3369 = _3347 * 6.283185482025146484375;
        float _3371 = sin(_3369);
        float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3375 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3373;
        float _3377 = _3365 * _3367;
        float _3379 = 1.0 / _3351;
        float _3381 = 1.0 / _3377;
        float _3383 = 1.0 / _3375;
        float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3387 = _3379 * _3385;
        float _3389 = _3371 * _3381;
        float _3391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3393 = fma(_3389, _3387, _3391);
        float _3395 = _3393 * _3383;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        _3339 = _3397;
    }
    float _3399 = _3339;
    float _3401 = -_3331;
    float _3403 = _3401 + 1.0;
    float _3405 = _3333 + _3198;
    bool _3407 = _3399 > 0.0;
    bool _3409 = isnan(_3399);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan(0.0);
    bool _3415 = _3411 || _3413;
    float _3417 = _3403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3419 = _3399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3421 = _3405 * 0.5;
    out.gl_Position.x = _3232;
    out.gl_Position.y = _3234;
    out.gl_Position.z = _3333;
    out.gl_Position.w = _3198;
    float _3423 = _3417 * _3266;
    float _3425 = -_3417;
    float _3427 = _3425 + 1.0;
    float _3429 = _3419 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3431 = _3277 * _3423;
    float _3433 = _3287 * _3423;
    float _3435 = _3277 * _3427;
    out.m_45.x = _3429;
    float _3437 = fma(_3283, _3431, _3271);
    float _3439 = fma(_3285, _3431, _3273);
    float _3441 = fma(_3277, _3433, _3275);
    out.m_64.z = _3421;
    out.m_64.w = _3198;
    out.m_66.x = _3437;
    out.m_66.y = _3439;
    out.m_66.z = _3441;
    out.m_66.w = _3435;
    if (_3415)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3443;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1201 = false;
    bool _1049 = false;
    bool _935 = false;
    bool _641 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3500 = as_type<float>(_101);
        out.gl_Position.z = _3500;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_139);
        out.gl_Position.z = _3571;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _143;
    float _205 = _183;
    if (!_201)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _225;
        _205 = _235;
        _121 = _223;
    }
    float _237 = _203;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _163 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _163;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = fma(_273, _147, _281);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _385;
    float _435 = _409;
    float _437 = _415;
    if (_425)
    {
        _433 = _409;
    }
    float _439 = _433;
    float _441 = _439;
    if (_425)
    {
        _435 = _413;
    }
    float _443 = _435;
    float _445 = _443;
    if (!_425)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _441 = _481;
            _437 = _479;
            _445 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _149 * _149;
            float _489 = fma(_147, _147, _487);
            float _491 = fma(_151, _151, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _403 * _403;
                float _507 = fma(_401, _401, _505);
                float _509 = fma(_405, _405, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _535;
                    _437 = _533;
                    _445 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _441 = _569;
                    _437 = _567;
                    _445 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _441 = _603;
                _437 = _601;
                _445 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _441;
    float _609 = _437;
    float _611 = _445;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _617 = _607;
    float _619 = _609;
    float _621 = _611;
    float _639;
    if (!_615)
    {
        float _623 = in.m_54.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_85);
        float _645 = 1.0 / _643;
        float _647 = _119 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _671 = 1.0 / _657;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _673;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_687;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _661;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = _649 + _695;
    bool _699 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _701 = 1.0 / _665;
    float _703 = _697 * _671;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _707 = _649 + _705;
    float _709 = 1.0 / _669;
    float _711 = _653 * _693;
    bool _713 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _715 = isnan(_649);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _649 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _731 = _649 + _729;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _707 * _701;
    float _739 = 1.0 / _675;
    bool _741 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_649);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = -_751;
    float _755 = _753 + 1.0;
    float _757 = _727 * _709;
    float _759 = _751 * _735;
    bool _761 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _763 = isnan(_649);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = _687 * _755;
    bool _775 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _777 = isnan(_649);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _787;
    bool _791 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_649);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _771 * _691;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = _731 * _739;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = fma(_789, _703, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _825 = _801 * _811;
    float _827 = fma(_817, _703, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _829 = _785 * _807;
    float _831 = fma(_821, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _833;
    float _837 = _823 * _825;
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _847 = _827 * _825;
    float _849 = fma(_835, _737, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _851 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].x, _837);
    float _853 = fma(_845, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[143].y, _847);
    float _861 = in.m_52.x;
    float _863 = in.m_52.y;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _873 = fma(_831, _829, _851);
    float _875 = fma(_857, _737, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _877 = fma(_853, _829, _859);
    float _879 = fma(_867, _757, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _881 = fma(_871, _757, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _883;
    float _887 = fma(_849, _803, _873);
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _889;
    float _893 = fma(_875, _803, _877);
    float _895 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _897 = fma(_879, _773, _887);
    float _899 = fma(_891, _813, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _901 = fma(_881, _773, _893);
    float _903 = fma(_895, _759, _897);
    float _905 = fma(_899, _759, _901);
    float _907 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].x, _903);
    float _909 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[148].y, _905);
    float _911 = _907 * _861;
    float _913 = _909 * _863;
    bool _915 = !_699;
    float _933;
    if (!_915)
    {
        float _917 = in.m_54.x;
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _921 = _917 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _923 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _925 = _923 * _919;
        float _927 = floor(_925);
        float _929 = -_927;
        float _931 = _925 + _929;
        _933 = _931;
        _935 = true;
    }
    else
    {
        float _937 = float(_85);
        float _939 = 1.0 / _937;
        float _941 = _119 * _939;
        _933 = _941;
    }
    _935 = false;
    float _943 = _933;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _947 = _943 + _945;
    bool _949 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _961;
    bool _965 = _943 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _967 = isnan(_943);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = -_959;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _981;
    float _985 = 1.0 / _963;
    bool _987 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _989 = _975 * _979;
    float _991 = -_975;
    float _993 = _991 + 1.0;
    float _995 = _947 * _985;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _997;
    float _1001 = fma(_983, _995, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = fma(_999, _995, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1009 = _1001 * _989;
    float _1011 = fma(_1005, _995, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1013 = _1007 * _989;
    float _1015 = _1011 * _989;
    float _1017 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1009);
    float _1019 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1015);
    float _1021 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1013);
    float _1023 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1017);
    float _1025 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1019);
    float _1027 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1021);
    bool _1029 = !_987;
    float _1047;
    if (!_1029)
    {
        float _1031 = in.m_54.x;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1035 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1039 = _1037 * _1033;
        float _1041 = floor(_1039);
        float _1043 = -_1041;
        float _1045 = _1039 + _1043;
        _1047 = _1045;
        _1049 = true;
    }
    else
    {
        float _1051 = float(_85);
        float _1053 = 1.0 / _1051;
        float _1055 = _119 * _1053;
        _1047 = _1055;
    }
    _1049 = false;
    float _1057 = _1047;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1061 = _1057 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1067 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1069 = isnan(_1057);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1095;
    bool _1099 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1101 = isnan(_1057);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1065;
    float _1113 = -_1077;
    float _1115 = _1113 + 1.0;
    bool _1117 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1119 = 1.0 / _1081;
    float _1121 = _1097 * _1111;
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1125 = _1123 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = -_1109;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1121, _1061, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1133 = _1093 * _1115;
    float _1135 = -_1093;
    float _1137 = _1135 + 1.0;
    float _1139 = _1077 * _1129;
    float _1141 = _1125 * _1119;
    float _1143 = _1131 * _1133;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = _1057 + _1145;
    float _1149 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1153 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1143);
    float _1155 = fma(_1141, _1147, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1157 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = fma(_1155, _1139, _1153);
    float _1163 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1161);
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1159;
    out.m_56.y = _1165;
    out.m_56.z = _1167;
    out.m_56.w = _1169;
    bool _1171 = !_1117;
    float _1195;
    float _1197;
    float _1199;
    if (!_1171)
    {
        float _1173 = in.m_54.x;
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1177 = float(_85);
        float _1179 = 1.0 / _1177;
        float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1183 = _119 * _1179;
        float _1185 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1187 = _1185 * _1175;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1183;
        _1197 = _1177;
        _1199 = _1193;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_85);
        float _1205 = 1.0 / _1203;
        float _1207 = _119 * _1205;
        _1195 = _1207;
        _1197 = _1203;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1195;
    float _1211 = _1197;
    float _1213 = _1199;
    float _1215 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1217 = int(_1215);
    float _1219 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1221 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1223 = _911 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1225 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1227 = _913 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1229 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1231 = int(_1229);
    float _1233 = _1223 * _1225;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1237 = _1209 + _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1239;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1243;
    float _1247 = float(_1217);
    float _1249 = 1.0 / _1211;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1251;
    bool _1255 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1257 = isnan(_1209);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = float(uint(_1231));
    float _1269 = 1.0 / _1247;
    int _1271 = ~_1231;
    int _1273 = _1271 + 1;
    float _1275 = -_1265;
    float _1277 = _1275 + 1.0;
    int _1279 = ~_1231;
    int _1281 = _1279 + 1;
    int _1283 = ~_1231;
    int _1285 = _1283 + 1;
    float _1287 = 1.0 / _1267;
    float _1289 = _119 * _1269;
    float _1291 = 1.0 / _1241;
    int _1293 = as_type<int>(_1287) + (-2);
    float _1295 = trunc(_1289);
    int _1297 = int(_1295);
    float _1299 = float(uint(_1297));
    float _1301 = float(_1297);
    float _1303 = as_type<float>(_1293) * _1299;
    int _1305 = ~_1231;
    int _1307 = _1305 + 1;
    float _1309 = trunc(_1303);
    float _1311 = precise::max(_1309, 0.0);
    uint _1314 = uint(_1311);
    int _1316 = _1307 * int(_1314);
    int _1318 = _1316 + _1297;
    float _1320 = float(uint(_1318));
    float _1322 = as_type<float>(_1293) * _1320;
    float _1324 = in.m_54.x;
    float _1326 = in.m_54.y;
    float _1328 = in.m_54.z;
    float _1330 = in.m_54.w;
    float _1332 = trunc(_1322);
    float _1334 = precise::max(_1332, 0.0);
    uint _1336 = uint(_1334);
    int _1338 = int(_1314) + int(_1336);
    bool _1340 = _1330 > 0.5;
    int _1342 = _1273 * _1338;
    int _1344 = _1342 + _1297;
    int _1346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1348 = _1346 != 0;
    bool _1350 = uint(_1344) >= uint(_1231);
    bool _1352 = !_1348;
    float _1354 = _1352 ? 1.2345600128173828125 : 1.0;
    bool _1356 = !_1348;
    float _1358 = _1356 ? _1326 : _1324;
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1378 = _1376 != 0;
    float _1380 = _1358 * _1354;
    float _1382 = -_199;
    int _1384 = _1340 ? as_type<int>(_1382) : as_type<int>(_199);
    float _1386 = floor(_1380);
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1390 = _1388 != 0;
    bool _1392 = !_1370;
    int _1394 = _1392 ? 0 : 1;
    bool _1396 = !_1390;
    float _1398 = _1396 ? _199 : as_type<float>(_1384);
    float _1400 = float(_1231);
    bool _1402 = !_1366;
    int _1404 = _1402 ? 0 : 1;
    bool _1406 = !_1374;
    int _1408 = _1406 ? 0 : 1;
    bool _1410 = !_1378;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = _1301 >= _1400;
    bool _1416 = isnan(_1301);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(_1400);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1219);
    int _1428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1430 = _1428 != 0;
    float _1432 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1221);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = -_1386;
    float _1440 = _1380 + _1438;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1444 = _1442 != 0;
    float _1446 = trunc(_1424);
    int _1448 = int(_1446);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1452 = _1450 != 0;
    float _1454 = _1440 * _1400;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1458 = _1456 != 0;
    float _1460 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1462 = ~_1338;
    int _1464 = _1462 + _1362;
    int _1466 = _1464 + 1;
    bool _1468 = !_1458;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1460);
    float _1474 = _119 * _1400;
    bool _1476 = _1324 > 0.5;
    int _1478 = _1231 * _1466;
    int _1480 = _1478 + _1297;
    float _1482 = trunc(_1454);
    int _1484 = int(_1482);
    float _1486 = _1474 * _1249;
    float _1488 = -_195;
    int _1490 = _1476 ? as_type<int>(_1488) : as_type<int>(_195);
    bool _1492 = _1326 > 0.5;
    int _1494 = abs(_1470);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1498 = -_199;
    int _1500 = _1492 ? as_type<int>(_1498) : as_type<int>(_199);
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = _1231 == 0;
    float _1508 = _1227 * _1496;
    int _1510 = ~_1448;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    bool _1516 = !_1506;
    int _1518 = _1516 ? _1480 : (-1);
    int _1520 = _1484 * _1494;
    int _1522 = _1520 + _1297;
    int _1524 = abs(_1404);
    int _1526 = _1518 * _1514;
    int _1528 = _1231 + (-1);
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1532 = _1530 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1534 = abs(_1394);
    int _1536 = _1448 * _1528;
    int _1538 = _1536 + _1526;
    int _1540 = abs(_1408);
    float _1542 = 1.0 / _1532;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1548 = _1538 * _1534;
    int _1550 = abs(_1412);
    int _1552 = _1504 * _1524;
    int _1554 = _1552 + _1548;
    float _1556 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1558 = _1522 * _1540;
    int _1560 = _1558 + _1554;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1568 = -_1562;
    float _1570 = fma(_1556, 2.0, _1568);
    int _1572 = _1484 * _1550;
    int _1574 = _1572 + _1560;
    float _1576 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1472);
    float _1578 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1426);
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1582 = _1580 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1584 = float(uint(_1574));
    float _1586 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1594 = 1.0 / _1566;
    float _1596 = as_type<float>(_1293) * _1584;
    float _1598 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1604 = ~_1231;
    int _1606 = _1604 + 1;
    float _1608 = fma(_1598, -2.0, _1592);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1614 = 1.0 / _1582;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1618 = _1213 + _1616;
    float _1620 = _1602 * _1542;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1622;
    float _1626 = _1618 * _1291;
    float _1628 = -_119;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1570);
    float _1632 = trunc(_1596);
    float _1634 = precise::max(_1632, 0.0);
    uint _1636 = uint(_1634);
    float _1638 = _1624 * _1594;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1644 = !_1444;
    float _1646 = _1644 ? _199 : as_type<float>(_1500);
    float _1648 = _1586 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1650 = _1328 > 0.5;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1654 = 1.0 / _1612;
    float _1656 = _1245 * _1614;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1658;
    float _1662 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1664 = fma(_1656, _1237, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1668 = _1209 + _1666;
    float _1670 = 1.0 / _1546;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _1680 = _1606 * int(_1636);
    int _1682 = _1680 + _1574;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1686 = 1.0 / _1642;
    float _1688 = _1678 * _1654;
    float _1690 = -_195;
    int _1692 = _1650 ? as_type<int>(_1690) : as_type<int>(_195);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1694;
    float _1698 = float(uint(_1682));
    bool _1700 = !_1436;
    float _1702 = _1700 ? _195 : as_type<float>(_1490);
    bool _1704 = !_1452;
    float _1706 = _1704 ? _195 : as_type<float>(_1692);
    float _1708 = as_type<float>(_1293) * _1698;
    float _1710 = _1660 * _1670;
    float _1712 = 1.0 / _1590;
    float _1714 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = fma(_1696, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1718 = fma(_1710, _1668, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1720 = _1674 * _1686;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1722;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[158].x;
    float _1728 = _1328;
    if (!_1348)
    {
        _1726 = _1326;
    }
    float _1730 = _1726;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1734 = _1209 + _1732;
    float _1736 = trunc(_1708);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = _1730;
    if (_1348)
    {
        _1742 = _1324;
    }
    float _1744 = _1742;
    float _1746 = fma(_1688, _1734, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1748 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1752 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1750;
    float _1754 = _1724 * _1712;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1758 = fma(_1752, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1760 = fma(_1253, _1626, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1762 = float(uint(_1522));
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1766 = int(_1636) + int(_1740);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1770 = _1209 + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1774 = _1209 + _1772;
    float _1776 = as_type<float>(_1293) * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1348)
    {
        _1778 = _1328;
    }
    float _1780 = _1778;
    int _1782 = _1281 * _1766;
    int _1784 = _1782 + _1574;
    float _1786 = fma(_1620, _1770, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1788 = fma(_1720, _1774, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1764);
    bool _1798 = uint(_1784) >= uint(_1231);
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1802 = _1209 + _1800;
    float _1804 = _1780;
    if (_1348)
    {
        _1804 = _1326;
    }
    float _1806 = _1804;
    bool _1808 = !_1798;
    int _1810 = _1808 ? 0 : (-1);
    float _1812 = fma(_1638, _1802, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (_1348)
    {
        _1728 = _1326;
    }
    float _1814 = _1728;
    float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1818 = ~_1766;
    int _1820 = _1818 + _1810;
    int _1822 = _1820 + 1;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1826 = _1209 + _1824;
    int _1828 = ~_1231;
    int _1830 = _1828 + 1;
    float _1832 = _1646 + (-0.5);
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1836 = _1231 * _1822;
    int _1838 = _1836 + _1574;
    float _1840 = fma(_1754, _1826, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1830 * int(_1794);
    int _1846 = _1844 + _1522;
    float _1848 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1608);
    bool _1850 = !_1506;
    int _1852 = _1850 ? _1838 : (-1);
    float _1854 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1756);
    bool _1856 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1858 = isnan(_1209);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    int _1868 = _1852 >> 31;
    float _1870 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1872 = float(uint(_1846));
    float _1874 = _1702 + 0.5;
    int _1876 = _1868 & 3;
    int _1878 = _1852 & 3;
    bool _1880 = _1878 != 0;
    float _1882 = as_type<float>(_1293) * _1872;
    bool _1884 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1886 = isnan(_1213);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1898 = -_1866;
    float _1900 = _1898 + 1.0;
    float _1902 = trunc(_1882);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1852 & 3;
    bool _1910 = _1908 != 0;
    float _1912 = fma(_1896, _1874, _1630);
    int _1914 = _1852 + _1876;
    float _1916 = -_1870;
    float _1918 = -_1848;
    float _1920 = fma(_1916, _1832, _1918);
    bool _1922 = _1213 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1924 = isnan(_1213);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1930 = _1926 || _1928;
    float _1932 = float(_1930);
    int _1934 = _1914 >> 2;
    bool _1936 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1938 = isnan(_1209);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    float _1948 = -_1932;
    float _1950 = _1948 + 1.0;
    int _1952 = _1934 << 4;
    int _1954 = _1952 + 512;
    bool _1956 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1958 = isnan(_1209);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = _1894 * _1950;
    float _1970 = -_1946;
    float _1972 = _1970 + 1.0;
    uint _1974 = uint(int(uint(_1954) >> uint(2)));
    uint _1976 = uint(int(uint(int(_1974)) >> uint(2)));
    int _1978 = int(_1974) & 3;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[int(_1976)][_1978];
    int _1982 = int(_1974) + 1;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    int _1986 = _1982 & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    int _1990 = int(_1794) + int(_1906);
    float _1992 = _1758 * _1968;
    float _1994 = _1716 * _1968;
    float _1996 = _1760 * _1968;
    bool _1998 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2000 = isnan(_1209);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2006 = _2002 || _2004;
    float _2008 = float(_2006);
    float _2010 = _1966 * _1277;
    float _2012 = -_1966;
    float _2014 = _2012 + 1.0;
    float _2016 = _1866 * _1972;
    float _2018 = _1265 * _1900;
    float _2020 = -_2008;
    float _2022 = _2020 + 1.0;
    float _2024 = _2008 * _2014;
    bool _2026 = uint(_1908) > 1u;
    int _2028 = _1954 + 8;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    uint _2032 = uint(int(uint(int(_2030)) >> uint(2)));
    int _2034 = int(_2030) & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    int _2038 = int(_2030) + 1;
    uint _2040 = uint(int(uint(_2038) >> uint(2)));
    int _2042 = _2038 & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2048 = isnan(_1209);
    bool _2050 = _2046 || _2048;
    bool _2052 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2054 = _2050 || _2052;
    float _2056 = float(_2054);
    int _2058 = _1285 * _1990;
    int _2060 = _2058 + _1522;
    int _2062 = _1880 ? 0 : 1;
    bool _2064 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2066 = isnan(_1209);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    bool _2076 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2078 = isnan(_1209);
    bool _2080 = _2076 || _2078;
    bool _2082 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2084 = _2080 || _2082;
    float _2086 = float(_2084);
    float _2088 = -_2056;
    float _2090 = _2088 + 1.0;
    int _2092 = ~_2062;
    int _2094 = _2092 + 1;
    int _2096 = _2094 + 1;
    float _2098 = _2074 * _2022;
    bool _2100 = uint(_2060) >= uint(_1231);
    float _2102 = _2086 * _2090;
    int _2104 = _2096;
    if (!_2026)
    {
        int _2106 = ~_2062;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    float _2112 = -_2074;
    float _2114 = _2112 + 1.0;
    bool _2116 = !_1910;
    int _2118 = _2116 ? 0 : 1;
    float _2120 = _1664 * _2102;
    int _2122 = abs(_2110);
    float _2124 = _2056 * _2114;
    bool _2126 = _1908 != 3;
    float _2128 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2130 = int(_2128);
    int _2132 = abs(_2118);
    float _2134 = -_2086;
    float _2136 = _2134 + 1.0;
    bool _2138 = uint(_1908) >= 2u;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2120);
    int _2142 = ~_2122;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _2138 ? 0 : 1;
    float _2150 = fma(_1786, _2124, _2140);
    int _2152 = ~_2132;
    int _2154 = _2152 + 1;
    int _2156 = _2154 + 1;
    bool _2158 = !_2100;
    int _2160 = _2158 ? 0 : (-1);
    float _2162 = fma(_1718, _2098, _2150);
    int _2164 = ~_2148;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    int _2170 = _2146 * as_type<int>(_1988);
    bool _2172 = _1908 != 3;
    float _2174 = _607 * _607;
    int _2176 = _2168;
    if (_2126)
    {
        int _2178 = ~_2148;
        int _2180 = _2178 + 1;
        _2176 = _2180;
    }
    int _2182 = _2176;
    int _2184 = _2156 * as_type<int>(_1980);
    int _2186 = _2184 + _2170;
    bool _2188 = !_2172;
    int _2190 = _2188 ? 0 : (-1);
    float _2192 = fma(_609, _609, _2174);
    int _2194 = abs(_2182);
    float _2196 = -_1894;
    float _2198 = _2196 + 1.0;
    int _2200 = ~_1990;
    int _2202 = _2200 + _2160;
    int _2204 = _2202 + 1;
    float _2206 = fma(_611, _611, _2192);
    bool _2208 = !_1430;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = fma(_1788, _2024, _2162);
    int _2214 = abs(_2130);
    int _2216 = _1231 * _2204;
    int _2218 = _2216 + _1522;
    float _2220 = float(uint(_2130));
    float _2222 = rsqrt(_2206);
    int _2224 = abs(_2190);
    float _2226 = fma(_1812, _2010, _2212);
    int _2228 = ~_2194;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1992);
    int _2236 = abs(_2210);
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1994);
    int _2240 = _2232 * as_type<int>(_2036);
    int _2242 = _2240 + _2186;
    int _2244 = ~_2224;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = 1.0 / _2220;
    float _2252 = float(uint(_2214));
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1996);
    int _2256 = ~_2236;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2248 * as_type<int>(_2044);
    int _2264 = _2262 + _2242;
    bool _2266 = !_1506;
    int _2268 = _2266 ? _2218 : (-1);
    float _2270 = _2222 * _611;
    float _2272 = 1.0 / _2252;
    int _2274 = _2264 * _2260;
    float _2276 = _2222 * _609;
    float _2278 = _2222 * _607;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2282 = _2270 * _2280;
    int _2284 = _2268 * _2236;
    int _2286 = _2284 + _2274;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2290 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2292 = _2278 * _2290;
    int _2294 = as_type<int>(_2250) + (-2);
    float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2298 = -_2282;
    float _2300 = fma(_2276, _2296, _2298);
    float _2302 = float(uint(_2286));
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2306 = abs(_2286);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = _2276 * _2308;
    float _2312 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2314 = -_2292;
    float _2316 = fma(_2270, _2312, _2314);
    float _2318 = as_type<float>(_2294) * _2302;
    int _2320 = as_type<int>(_2272) + (-2);
    float _2322 = _2300 * _2300;
    float _2324 = float(uint(_2306));
    float _2326 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2288);
    float _2328 = -_2304;
    float _2330 = fma(_1748, 2.0, _2328);
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2334 = -_2310;
    float _2336 = fma(_2278, _2332, _2334);
    float _2338 = fma(_2316, _2316, _2322);
    float _2340 = as_type<float>(_2320) * _2324;
    int _2342 = ~_2214;
    int _2344 = _2342 + 1;
    float _2346 = trunc(_2318);
    float _2348 = precise::max(_2346, 0.0);
    uint _2350 = uint(_2348);
    float _2352 = fma(_2336, _2336, _2338);
    int _2354 = ~_2130;
    int _2356 = _2354 + 1;
    float _2358 = _1508 * _2278;
    float _2360 = _1508 * _2276;
    float _2362 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2238);
    int _2364 = ~_2214;
    int _2366 = _2364 + 1;
    float _2368 = trunc(_2340);
    float _2370 = precise::max(_2368, 0.0);
    uint _2372 = uint(_2370);
    float _2374 = -_119;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2330);
    bool _2378 = _2130 == 0;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2382 = rsqrt(_2352);
    int _2384 = _2356 * int(_2350);
    int _2386 = _2384 + _2286;
    float _2388 = fma(_1834, -2.0, _2380);
    float _2390 = float(uint(_2386));
    int _2392 = _2344 * int(_2372);
    int _2394 = _2392 + _2306;
    float _2396 = as_type<float>(_2294) * _2390;
    float _2398 = float(uint(_2394));
    float _2400 = trunc(_2396);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = _2300 * _2382;
    float _2408 = _2336 * _2382;
    float _2410 = as_type<float>(_2320) * _2398;
    float _2412 = _2316 * _2382;
    float _2414 = _2276 * _2406;
    float _2416 = _1508 * _2270;
    float _2418 = _2278 * _2408;
    float _2420 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2422 = trunc(_2410);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    float _2428 = -_2414;
    float _2430 = fma(_2278, _2412, _2428);
    float _2432 = fma(_1233, _2408, _2416);
    float _2434 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2234);
    float _2436 = fma(_1233, _2412, _2360);
    float _2438 = fma(_1746, _2018, _2226);
    float _2440 = -_2418;
    float _2442 = fma(_2270, _2406, _2440);
    float _2444 = fma(_2420, _2430, _2432);
    int _2446 = ~_2130;
    int _2448 = _2446 + 1;
    float _2450 = fma(_1233, _2406, _2358);
    float _2452 = fma(_2420, _2442, _2436);
    float _2454 = _1648 + _2444;
    int _2456 = int(_2350) + int(_2404);
    float _2458 = fma(_1840, _2016, _2438);
    float _2460 = _1652 + _2452;
    int _2462 = _2286 ^ _2130;
    float _2464 = _2270 * _2412;
    int _2466 = int(_2372) + int(_2426);
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2470 = _2460 + _2468;
    int _2472 = _2448 * _2456;
    int _2474 = _2472 + _2286;
    float _2476 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2254);
    float _2478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2480 = _2366 * _2466;
    int _2482 = _2480 + _2306;
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2486 = _2454 + _2484;
    bool _2488 = uint(_2474) >= uint(_2130);
    float _2490 = -_2464;
    float _2492 = fma(_2276, _2408, _2490);
    uint _2494 = uint(int(uint(_2462) >> uint(31)));
    float _2496 = _2486 * _2486;
    bool _2498 = uint(_2482) >= uint(_2214);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    float _2506 = fma(_2470, _2470, _2496);
    bool _2508 = !_2498;
    int _2510 = _2508 ? 0 : (-1);
    float _2512 = fma(_2420, _2492, _2450);
    int _2514 = ~int(_2494);
    int _2516 = _2514 + 1;
    float _2518 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2388);
    int _2520 = ~_2510;
    int _2522 = _2466 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = sqrt(_2506);
    int _2528 = ~_2456;
    int _2530 = _2528 + _2504;
    int _2532 = _2530 + 1;
    float _2534 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2536 = _2524 ^ _2516;
    float _2538 = _1662 + _2512;
    bool _2540 = _2130 == 0;
    int _2542 = _2130 * _2532;
    int _2544 = _2542 + _2286;
    int _2546 = ~_2516;
    int _2548 = _2546 + _2536;
    int _2550 = _2548 + 1;
    float _2552 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2554 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2458);
    bool _2556 = !_2378;
    int _2558 = _2556 ? _2550 : (-1);
    bool _2560 = !_2540;
    int _2562 = _2560 ? _2544 : (-1);
    float _2564 = float(_2558);
    bool _2566 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2568 = float(_2562);
    float _2570 = -_2518;
    float _2572 = fma(_2534, _2564, _2570);
    float _2574 = _1706 + 0.5;
    float _2576 = _1398 + (-0.5);
    float _2578 = fma(_2552, _2568, _2376);
    float _2580 = _2388;
    float _2582 = _2458;
    float _2584 = _2454;
    float _2586 = _2206;
    if (!_2566)
    {
        _2580 = _2460;
    }
    float _2588 = _2580;
    float _2590 = _2588;
    if (!_2566)
    {
        _2582 = _2538;
    }
    float _2592 = _2582;
    bool _2594 = !_2566;
    float _2596 = _2592;
    if (!_2594)
    {
        float _2598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2602 = _2526 + _2600;
        float _2604 = rsqrt(_2506);
        float _2606 = _2602 * _2598;
        float _2608 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2610 = _2606 * 0.15915493667125701904296875;
        float _2612 = _2610 * 6.283185482025146484375;
        float _2614 = cos(_2612);
        float _2616 = _2610 * 6.283185482025146484375;
        float _2618 = sin(_2616);
        float _2620 = _2614 + (-1.0);
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = fma(_2618, _2608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2626 = fma(_2538, _2614, _2622);
        float _2628 = _2604 * _2624;
        float _2630 = fma(_2470, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2632 = fma(_2486, _2628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2596 = _2626;
        _2590 = _2630;
        _2584 = _2632;
    }
    float _2634 = _2596;
    float _2636 = _2590;
    float _2638 = _2584;
    float _2640 = fma(_2552, _2574, _2578);
    float _2642 = -_1662;
    float _2644 = _2642 + _2634;
    float _2646 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1796);
    float _2648 = -_1652;
    float _2650 = _2648 + _2636;
    float _2652 = -_2534;
    float _2654 = fma(_2652, _2576, _2572);
    float _2656 = _2644 * _2644;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    float _2662 = -_1648;
    float _2664 = _2662 + _2638;
    float _2666 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    float _2668 = fma(_2650, _2650, _2656);
    float _2670 = fma(_1646, _2660, _1920);
    float _2672 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2326);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2664, _2664, _2668);
    float _2680 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1854);
    float _2682 = -_2676;
    float _2684 = fma(_1702, _2682, _1912);
    float _2686 = sqrt(_2678);
    float _2688 = -_2672;
    float _2690 = _2688 + 1.0;
    float _2692 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2694 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2696 = _2476 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2698 = -_2680;
    float _2700 = _2698 + 1.0;
    float _2702 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = _2692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2706 = _2694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2710 = -_2690;
    float _2712 = fma(_1706, _2710, _2640);
    float _2714 = fma(_1398, _2700, _2654);
    out.m_58.x = _2554;
    out.m_60.x = _2704;
    out.m_60.y = _2706;
    out.m_60.z = _2708;
    out.m_60.w = _2702;
    bool _2716 = _2686 > 0.0;
    out.m_62.x = _2684;
    out.m_62.y = _2670;
    out.m_62.z = _2712;
    out.m_62.w = _2714;
    bool _2718 = !_2716;
    float _2720 = _2714;
    float _2722 = _2684;
    float _2724 = _2670;
    float _2726 = _2634;
    float _2728 = _2636;
    float _2730 = _2638;
    float _2732 = _2670;
    float _2734 = _2684;
    if (!_2718)
    {
        bool _2736 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2738 = _2712;
        if (_2736)
        {
            float _2740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2738 = _2740;
        }
        float _2742 = _2738;
        if (_2736)
        {
            float _2744 = _2742 * _609;
            _2720 = _2744;
        }
        float _2746 = _2720;
        float _2748 = _2746;
        if (_2736)
        {
            float _2750 = _2742 * _607;
            _2722 = _2750;
        }
        float _2752 = _2722;
        float _2754 = _2752;
        float _2756 = _2752;
        if (_2736)
        {
            float _2758 = _2742 * _611;
            _2724 = _2758;
        }
        float _2760 = _2724;
        float _2762 = _2760;
        if (!_2736)
        {
            float _2764 = _119 + 1.0;
            float _2766 = _2764;
            if (!_161)
            {
                float _2768 = _2764 * _2764;
                float _2770 = _2768 * 0.5;
                _2754 = _2770;
            }
            float _2772 = _2754;
            float _2774 = _2772;
            if (!_161)
            {
                float _2776 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2776;
            }
            float _2778 = _2774;
            bool _2780 = !_161;
            float _2782 = _2778;
            if (!_2780)
            {
                float _2784 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = log2(_2784);
                float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2790 = _2788 + 1.0;
                float _2792 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2794 = _2786 * _2764;
                float _2796 = 1.0 / _2790;
                float _2798 = _2792 * 0.693147182464599609375;
                float _2800 = exp2(_2794);
                float _2802 = 1.0 / _2798;
                float _2804 = _2800 + (-1.0);
                float _2806 = -_2804;
                float _2808 = fma(_2806, _2802, _2764);
                float _2810 = _2808 * _2796;
                float _2812 = _2810 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2782 = _2812;
            }
            float _2814 = _2782;
            float _2816 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2818 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2820 = !_161;
            if (!_2820)
            {
                float _2822 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2824 = log2(_2822);
                float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2828 = _2826 + 1.0;
                float _2830 = 1.0 / _2828;
                float _2832 = _2824 * _2764;
                float _2834 = exp2(_2832);
                float _2836 = -_2834;
                float _2838 = _2836 + 1.0;
                float _2840 = _2838 * _2830;
                _2766 = _2840;
            }
            float _2842 = _2766;
            float _2844 = fma(_2842, _149, _2818);
            float _2846 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2848 = fma(_2842, _147, _2816);
            float _2850 = -_359;
            float _2852 = _2850 + _2844;
            float _2854 = fma(_2842, _151, _2846);
            float _2856 = -_365;
            float _2858 = _2856 + _2848;
            float _2860 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2862 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = -_373;
            float _2866 = _2864 + _2854;
            float _2868 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2860);
            float _2872 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2868);
            float _2876 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2870);
            float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2866, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2874);
            float _2882 = _2876 * _2876;
            float _2884 = fma(_2878, _2878, _2882);
            float _2886 = fma(_2880, _2880, _2884);
            _2586 = _2886;
            _617 = _2876;
            _619 = _2878;
            _621 = _2880;
            _2748 = _2878;
            _2756 = _2876;
            _2762 = _2880;
        }
        float _2888 = _2586;
        float _2890 = _617;
        float _2892 = _619;
        float _2894 = _621;
        float _2896 = _2748;
        float _2898 = _2756;
        float _2900 = _2762;
        float _2902 = sqrt(_2888);
        float _2904 = rsqrt(_2678);
        bool _2906 = _2902 > 0.0;
        float _2908 = _2650 * _2904;
        float _2910 = _2644 * _2904;
        float _2912 = _2664 * _2904;
        bool _2914 = !_2906;
        _2732 = _2900;
        _2734 = _2898;
        if (!_2914)
        {
            float _2916 = rsqrt(_2888);
            float _2918 = _2916 * _2890;
            float _2920 = _2916 * _2892;
            float _2922 = _2910 * _2918;
            float _2924 = _2916 * _2894;
            float _2926 = fma(_2908, _2920, _2922);
            float _2928 = fma(_2912, _2924, _2926);
            float _2930 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2932 = fma(_2896, _2930, _2636);
            float _2934 = fma(_2898, _2930, _2634);
            float _2936 = fma(_2900, _2930, _2638);
            _2726 = _2934;
            _2728 = _2932;
            _2730 = _2936;
        }
    }
    float _2938 = _2726;
    float _2940 = _2728;
    float _2942 = _2730;
    float _2944 = _2732;
    float _2946 = _2734;
    float _2948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2950 = _2938 + _2948;
    float _2952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2954 = _2940 + _2952;
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2942 + _2956;
    float _2960 = _2950 * _2950;
    float _2962 = fma(_2954, _2954, _2960);
    float _2964 = fma(_2958, _2958, _2962);
    float _2966 = rsqrt(_2964);
    float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2970 = _2954 * _2968;
    float _2972 = _2958 * _2968;
    float _2974 = _2970 * _2970;
    float _2976 = _2972 * _2972;
    float _2978 = _2974 + _2976;
    float _2980 = sqrt(_2978);
    bool _2982 = _2980 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2986 = _2980 + _2984;
    float _2988 = _2966;
    float _2990 = _2946;
    float _2992 = _2986;
    float _2994 = _2944;
    float _2996 = _2950;
    float _2998 = _2968;
    if (_2982)
    {
        float _3000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2988 = _3000;
    }
    float _3002 = _2988;
    if (_2982)
    {
        float _3004 = rsqrt(_2978);
        _2990 = _3004;
    }
    float _3006 = _2990;
    float _3008 = _3006;
    if (_2982)
    {
        float _3010 = _2986 * _3002;
        _2992 = _3010;
    }
    float _3012 = _2992;
    float _3014 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_2982)
    {
        float _3016 = _3012 * 0.15915493667125701904296875;
        _2994 = _3016;
    }
    float _3018 = _2994;
    float _3020 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3014);
    float _3022 = _3002;
    float _3024 = _3018;
    if (_2982)
    {
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = sin(_3026);
        _3022 = _3028;
    }
    float _3030 = _3022;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3034 = precise::max(0.0, _3032);
    float _3036 = _2958;
    float _3038 = _3034;
    if (_2982)
    {
        float _3040 = _3018 * 6.283185482025146484375;
        float _3042 = cos(_3040);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = -_2968;
    float _3048 = -_3034;
    float _3050 = fma(_2950, _3046, _3048);
    if (_2982)
    {
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3038 = _3052;
    }
    float _3054 = _3038;
    float _3056 = _3030;
    float _3058 = _3054;
    if (_2982)
    {
        float _3060 = fma(_3030, _3054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2996 = _3060;
    }
    float _3062 = _2996;
    float _3064 = _3062;
    if (!_2982)
    {
        _3056 = _2970;
    }
    float _3066 = _3056;
    float _3068 = _3066;
    if (_2982)
    {
        float _3070 = _3044 + (-1.0);
        _3058 = _3070;
    }
    float _3072 = _3058;
    float _3074 = _3072;
    if (_2982)
    {
        float _3076 = _3006 * _3062;
        _2998 = _3076;
    }
    float _3078 = _2998;
    if (!_2982)
    {
        _3008 = _3050;
    }
    float _3080 = _3008;
    float _3082 = _3080;
    if (_2982)
    {
        float _3084 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3024 = _3084;
    }
    float _3086 = _3024;
    float _3088 = _3086;
    if (_2982)
    {
        float _3090 = _2970 * _3078;
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2982)
    {
        _3064 = _2972;
    }
    float _3094 = _3064;
    float _3096 = _3094;
    if (_2982)
    {
        float _3098 = _2972 * _3078;
        _3096 = _3098;
    }
    float _3100 = _3096;
    if (_2982)
    {
        float _3102 = fma(_3050, _3044, _3086);
        _3082 = _3102;
    }
    float _3104 = _3082;
    if (!_2982)
    {
        _3088 = _2974;
    }
    float _3106 = _3088;
    float _3108 = _3106;
    if (_2982)
    {
        float _3110 = _3092 * _3092;
        _3108 = _3110;
    }
    float _3112 = _3108;
    float _3114 = sqrt(_2964);
    if (!_2982)
    {
        _3074 = _2976;
    }
    float _3116 = _3074;
    float _3118 = _3116;
    if (_2982)
    {
        float _3120 = _3100 * _3100;
        _3118 = _3120;
    }
    float _3122 = _3118;
    float _3124 = fma(_3104, _3104, _3112);
    float _3126 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3128 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3130 = _3124 + _3122;
    float _3132 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3126);
    float _3134 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3128);
    float _3136 = _2938 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3138 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3132);
    float _3140 = rsqrt(_3130);
    float _3142 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3134);
    float _3144 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3136);
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3148 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3146);
    float _3150 = precise::clamp(_3148, 0.0, 1.0);
    float _3152 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3154 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3020);
    float _3156 = _3142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3158 = -_3150;
    float _3160 = _3158 + 1.0;
    float _3162 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3166 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3144);
    float _3168 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3170 = abs(_3160);
    float _3172 = log2(_3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3176 = _3166 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3178 = _3140 * _3092;
    float _3180 = _3140 * _3104;
    float _3182 = _3140 * _3100;
    float _3184 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3174);
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3188 = -_3168;
    float _3190 = fma(_3188, _3152, 1.0);
    float _3192 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3184);
    float _3194 = -_3186;
    float _3196 = fma(_3180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3194);
    float _3198 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3192);
    float _3200 = -_3182;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3196);
    float _3204 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3206 = log2(_3190);
    float _3208 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3210 = fma(_3202, -0.5, 0.5);
    float _3212 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3214 = fma(_3202, 0.5, 0.5);
    float _3216 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3208);
    float _3218 = _3180 + 1.0;
    float _3220 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3212);
    float _3222 = exp2(_3204);
    float _3224 = fma(_3214, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3226 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3216);
    float _3228 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3220);
    float _3230 = fma(_3214, _3224, -0.212114393711090087890625);
    float _3232 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3226);
    float _3234 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3228);
    float _3236 = 1.0 / _3198;
    float _3238 = _3206 * 0.693147182464599609375;
    float _3240 = fma(_3214, _3230, 1.570728778839111328125);
    float _3242 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3244 = sqrt(_3210);
    float _3246 = -_3180;
    float _3248 = fma(_3222, _3218, _3246);
    float _3250 = fma(_3248, 0.5, 0.5);
    float _3252 = _3232 * _3236;
    float _3254 = _3234 * _3236;
    float _3256 = fma(_3252, 0.5, 0.5);
    float _3258 = fma(_3254, -0.5, 0.5);
    float _3260 = _3244 * 0.636619746685028076171875;
    float _3262 = -_3240;
    float _3264 = fma(_3260, _3262, 1.0);
    float3 _8434 = float3(_3256, _3258, _3242);
    float _3266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8434, float3(0.0), isnan(_8434)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8434, float3(0.0), isnan(_8434)), level(0.0)).x;
    float3 _8445 = float3(_3256, _3258, _3242);
    float4 _3269 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8445, float3(0.0), isnan(_8445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8445, float3(0.0), isnan(_8445)), level(0.0)).xyzw;
    float _3271 = _3269.x;
    float _3273 = _3269.y;
    float _3275 = _3269.z;
    float _3277 = _3269.w;
    float2 _8462 = float2(_3264, _3250);
    float3 _3281 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8462, float2(0.0), isnan(_8462)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8462, float2(0.0), isnan(_8462)), level(0.0)).xyz;
    float _3283 = _3281.x;
    float _3285 = _3281.y;
    float _3287 = _3281.z;
    float _3289 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3291 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3293 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3295 = isnan(0.5);
    bool _3297 = _3293 || _3295;
    bool _3299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3301 = _3297 || _3299;
    float _3303 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3289);
    float _3305 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3291);
    float _3307 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3303);
    float _3309 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3305);
    float _3311 = _3307 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3313 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3315 = _3164 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3317 = _3309 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3319 = 1.0 / _3311;
    float _3321 = fma(_3156, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3315);
    float _3323 = _3317 + _3311;
    float _3325 = _3156;
    if (_3301)
    {
        _3325 = 1.0;
    }
    float _3327 = _3325;
    float _3329 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3321);
    float _3331 = exp2(_3313);
    float _3333 = fma(_3176, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3329);
    float _3335 = _3323 * _3319;
    float _3337 = _3335 * 0.5;
    float _3339 = _3327;
    if (!_3301)
    {
        float _3341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3343 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3345 = _3341 * 0.15915493667125701904296875;
        float _3347 = _3343 * 0.15915493667125701904296875;
        float _3349 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3351 = fma(_3337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3349);
        float _3353 = _3345 * 6.283185482025146484375;
        float _3355 = cos(_3353);
        float _3357 = _3345 * 6.283185482025146484375;
        float _3359 = sin(_3357);
        float _3361 = 1.0 / _3355;
        float _3363 = _3347 * 6.283185482025146484375;
        float _3365 = cos(_3363);
        float _3367 = _3359 * _3361;
        float _3369 = _3347 * 6.283185482025146484375;
        float _3371 = sin(_3369);
        float _3373 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3375 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3373;
        float _3377 = _3365 * _3367;
        float _3379 = 1.0 / _3351;
        float _3381 = 1.0 / _3377;
        float _3383 = 1.0 / _3375;
        float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3387 = _3379 * _3385;
        float _3389 = _3371 * _3381;
        float _3391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3393 = fma(_3389, _3387, _3391);
        float _3395 = _3393 * _3383;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        _3339 = _3397;
    }
    float _3399 = _3339;
    float _3401 = -_3331;
    float _3403 = _3401 + 1.0;
    float _3405 = _3333 + _3198;
    bool _3407 = _3399 > 0.0;
    bool _3409 = isnan(_3399);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan(0.0);
    bool _3415 = _3411 || _3413;
    float _3417 = _3403 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3419 = _3399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3421 = _3405 * 0.5;
    out.gl_Position.x = _3232;
    out.gl_Position.y = _3234;
    out.gl_Position.z = _3333;
    out.gl_Position.w = _3198;
    float _3423 = _3417 * _3266;
    float _3425 = -_3417;
    float _3427 = _3425 + 1.0;
    float _3429 = _3419 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3431 = _3277 * _3423;
    float _3433 = _3287 * _3423;
    float _3435 = _3277 * _3427;
    out.m_45.x = _3429;
    float _3437 = fma(_3283, _3431, _3271);
    float _3439 = fma(_3285, _3431, _3273);
    float _3441 = fma(_3277, _3433, _3275);
    out.m_64.z = _3421;
    out.m_64.w = _3198;
    out.m_66.x = _3437;
    out.m_66.y = _3439;
    out.m_66.z = _3441;
    out.m_66.w = _3435;
    if (_3415)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3443;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

