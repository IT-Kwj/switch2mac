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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_58 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1045 = false;
    bool _895 = false;
    bool _647 = false;
    bool _491 = false;
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
        float _2821 = as_type<float>(_101);
        out.gl_Position.z = _2821;
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
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
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
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = sqrt(_397);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_413);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _381;
    float _439 = _359;
    if (_425)
    {
        _433 = _409;
    }
    float _441 = _433;
    float _443 = _441;
    if (_425)
    {
        _435 = _411;
    }
    float _445 = _435;
    float _447 = _445;
    if (_425)
    {
        _437 = _415;
    }
    float _449 = _437;
    float _451 = _449;
    if (!_425)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _447 = _487;
            _443 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _149 * _149;
            float _495 = fma(_147, _147, _493);
            float _497 = fma(_151, _151, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _403 * _403;
                float _513 = fma(_401, _401, _511);
                float _515 = fma(_405, _405, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _447 = _541;
                    _443 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _447 = _575;
                    _443 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _447 = _609;
                _443 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _447;
    float _615 = _443;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _623 = _613;
    float _625 = _615;
    float _627 = _617;
    float _645;
    if (!_621)
    {
        float _629 = in.m_54.x;
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _633 = _629 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_85);
        float _651 = 1.0 / _649;
        float _653 = _119 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = _655 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _693 = 1.0 / _683;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _679;
    float _699 = 1.0 / _687;
    float _701 = _663 * _693;
    bool _703 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_655);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_675;
    float _717 = _715 + 1.0;
    float _719 = _713 * _717;
    float _721 = 1.0 / _691;
    float _723 = _659 * _697;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _655 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _731 = _655 + _729;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _727 * _699;
    bool _747 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _749 = isnan(_655);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _759;
    float _763 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _769 = _731 * _721;
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -_757;
    float _785 = _783 + 1.0;
    float _787 = _757 * _773;
    float _789 = fma(_777, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _791 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_655);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _743 * _785;
    float _805 = -_743;
    float _807 = _805 + 1.0;
    float _809 = fma(_767, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_781, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _813 = _801 * _807;
    float _815 = -_801;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _819;
    float _823 = in.m_52.x;
    float _825 = in.m_52.y;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = _763 * _813;
    float _833 = _789 * _813;
    float _835 = fma(_821, _745, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _837 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _851 = fma(_809, _803, _839);
    float _853 = fma(_811, _803, _841);
    float _855 = fma(_845, _769, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _857 = fma(_849, _769, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _859 = fma(_837, _787, _851);
    float _861 = fma(_835, _787, _853);
    float _863 = fma(_855, _719, _859);
    float _865 = fma(_857, _719, _861);
    float _867 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].x, _863);
    float _869 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _871 = _867 * _823;
    float _873 = _869 * _825;
    bool _875 = !_695;
    float _893;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _893 = _891;
        _895 = true;
    }
    else
    {
        float _897 = float(_85);
        float _899 = 1.0 / _897;
        float _901 = _119 * _899;
        _893 = _901;
    }
    _895 = false;
    float _903 = _893;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _903 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _913 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _915 = isnan(_903);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _929 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _931 = isnan(_903);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _941;
    bool _945 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_903);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = 1.0 / _911;
    float _959 = -_923;
    float _961 = _959 + 1.0;
    bool _963 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _965 = _939 * _961;
    float _967 = -_939;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _927;
    float _973 = _943 * _957;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _971;
    float _983 = _979 * _965;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _991 = _903 + _989;
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _995 = _923 * _987;
    float _997 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = fma(_997, _995, _993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1001);
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1009;
    out.m_56.y = _1011;
    out.m_56.z = _1013;
    out.m_56.w = _1015;
    bool _1017 = !_963;
    float _1041;
    float _1043;
    if (!_1017)
    {
        float _1019 = in.m_54.x;
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1023 = float(_85);
        float _1025 = 1.0 / _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1029 = _119 * _1025;
        float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1033 = _1031 * _1021;
        float _1035 = floor(_1033);
        float _1037 = -_1035;
        float _1039 = _1033 + _1037;
        _1041 = _1039;
        _1043 = _1029;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_85);
        float _1049 = 1.0 / _1047;
        float _1051 = _119 * _1049;
        _1041 = _1051;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1041;
    float _1055 = _1043;
    float _1057 = in.m_54.x;
    float _1059 = in.m_54.y;
    float _1061 = in.m_54.z;
    float _1063 = in.m_54.w;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1053 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1071 = _1053 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1085 = 1.0 / _1075;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1089 = _1055 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1093 = _1055 + _1091;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / _1079;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1113 = _1111 != 0;
    float _1115 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1117 = _1063 > 0.5;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1123 = _1057 > 0.5;
    float _1125 = 1.0 / _1083;
    float _1127 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1129 = -_195;
    int _1131 = _1123 ? as_type<int>(_1129) : as_type<int>(_195);
    float _1133 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1141 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = 1.0 / _1121;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1149 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1151 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1139);
    float _1153 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1155 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1127);
    float _1157 = -_1105;
    float _1159 = fma(_1149, 2.0, _1157);
    float _1161 = 1.0 / _1147;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1167 = _1067 * _1103;
    float _1169 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1175 = 1.0 / _1165;
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1187 = _1071 * _1085;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1189;
    float _1193 = 1.0 / _1173;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1203 = _1185 * _1161;
    float _1205 = _1181 * _1143;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1169 + _1207;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = 1.0 / _1197;
    float _1215 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = fma(_1133, -2.0, _1211);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1227 = _1053 + _1225;
    float _1229 = 1.0 / _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1235 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1243 = 1.0 / _1233;
    float _1245 = _1191 * _1213;
    float _1247 = _1209 * _1209;
    float _1249 = _1227 * _1125;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1255;
    float _1259 = _1201 * _1229;
    float _1261 = _1233;
    float _1263 = _1241;
    float _1265 = _1061;
    if (!_1137)
    {
        _1261 = _1059;
    }
    float _1267 = _1261;
    float _1269 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    float _1271 = _1267;
    if (_1137)
    {
        _1271 = _1057;
    }
    float _1273 = _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1279 = !_1097;
    float _1281 = _1279 ? _195 : as_type<float>(_1131);
    float _1283 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1285 = _1059 > 0.5;
    float _1287 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1137)
    {
        _1263 = _1061;
    }
    float _1289 = _1263;
    float _1291 = _1239 * _1243;
    float _1293 = -_199;
    int _1295 = _1285 ? as_type<int>(_1293) : as_type<int>(_199);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _1287 + _1297;
    bool _1301 = _1061 > 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1303;
    float _1307 = _1289;
    if (_1137)
    {
        _1307 = _1059;
    }
    float _1309 = _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1137)
    {
        _1265 = _1059;
    }
    float _1315 = _1265;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1319 = _1283 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1321;
    float _1325 = fma(_1253, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1327 = fma(_1257, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1329 = fma(_1319, _1319, _1247);
    float _1331 = fma(_1305, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1333 = fma(_1277, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1335 = fma(_1299, _1299, _1329);
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = fma(_1313, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1343 = _1323 * _1175;
    float _1345 = fma(_1339, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = rsqrt(_1335);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1355 = _1055 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1361;
    float _1365 = _1351 * _1193;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1369 = _1055 + _1367;
    float _1371 = fma(_1343, _1355, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1373 = fma(_1363, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1375 = fma(_1359, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1379 = _1055 + _1377;
    float _1381 = fma(_1365, _1369, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1383 = fma(_1205, _1089, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1385 = fma(_1245, _1379, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1387 = _1209 * _1347;
    float _1389 = _1319 * _1347;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1393 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1395 = isnan(_1053);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = -_1387;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1409 = -_1389;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1415 = _1055 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1417;
    float _1421 = _1407 * _1407;
    float _1423 = _1299 * _1347;
    float _1425 = fma(_1259, _1415, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1427 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1391);
    float _1429 = fma(_1411, _1411, _1421);
    float _1431 = _613 * _613;
    float _1433 = -_1423;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1439 = _1055 + _1437;
    float _1441 = fma(_1419, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1443 = fma(_615, _615, _1431);
    float _1445 = fma(_1435, _1435, _1429);
    float _1447 = fma(_1291, _1439, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1449 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1451 = isnan(_1055);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = fma(_617, _617, _1443);
    bool _1463 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1465 = isnan(_1055);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = fma(_1203, _1093, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1477 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1479 = isnan(_1055);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = rsqrt(_1461);
    bool _1491 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1493 = isnan(_1053);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1499 = _1495 || _1497;
    float _1501 = float(_1499);
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1509 = isnan(_1053);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -_1487;
    float _1521 = _1519 + 1.0;
    bool _1523 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1525 = isnan(_1053);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = -_1473;
    float _1537 = _1535 + 1.0;
    bool _1539 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1541 = isnan(_1055);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1473 * _1505;
    float _1553 = -_1517;
    float _1555 = _1553 + 1.0;
    float _1557 = _1487 * _1537;
    float _1559 = -_1533;
    float _1561 = _1559 + 1.0;
    float _1563 = _1549 * _1521;
    float _1565 = -_1549;
    float _1567 = _1565 + 1.0;
    bool _1569 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1571 = isnan(_1055);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1517 * _1561;
    float _1583 = _1489 * _617;
    float _1585 = _1489 * _613;
    float _1587 = _1489 * _615;
    bool _1589 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1591 = isnan(_1055);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1603 = _1583 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1607 = _1585 * _1605;
    bool _1609 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1611 = isnan(_1055);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1625 = -_1603;
    float _1627 = fma(_1587, _1623, _1625);
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1631 = -_1607;
    float _1633 = fma(_1583, _1629, _1631);
    bool _1635 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1637 = isnan(_1055);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1649 = _1587 * _1647;
    float _1651 = _1627 * _1627;
    float _1653 = _1403 * _1555;
    float _1655 = -_1403;
    float _1657 = _1655 + 1.0;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1661 = -_1649;
    float _1663 = fma(_1585, _1659, _1661);
    float _1665 = fma(_1633, _1633, _1651);
    float _1667 = sqrt(_1445);
    float _1669 = -_1645;
    float _1671 = _1669 + 1.0;
    float _1673 = _1645 * _1567;
    float _1675 = fma(_1663, _1663, _1665);
    float _1677 = -_1619;
    float _1679 = _1677 + 1.0;
    float _1681 = _1619 * _1671;
    bool _1683 = !_1101;
    float _1685 = _1683 ? _199 : as_type<float>(_1295);
    float _1687 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1691 = -_119;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1159);
    float _1695 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1697 = _1685 + (-0.5);
    float _1699 = _1501 * _1657;
    float _1701 = -_195;
    int _1703 = _1301 ? as_type<int>(_1701) : as_type<int>(_195);
    float _1705 = _1599 * _1679;
    float _1707 = -_1599;
    float _1709 = _1707 + 1.0;
    float _1711 = rsqrt(_1675);
    float _1713 = -_1687;
    float _1715 = -_1695;
    float _1717 = fma(_1713, _1697, _1715);
    float _1719 = _1347 * _1667;
    float _1721 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1723 = !_1109;
    float _1725 = _1723 ? _195 : as_type<float>(_1703);
    float _1727 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1729 = -_199;
    int _1731 = _1117 ? as_type<int>(_1729) : as_type<int>(_199);
    float _1733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1735 = _1721 * _1719;
    bool _1737 = !_1113;
    float _1739 = _1737 ? _199 : as_type<float>(_1731);
    float _1741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1743 = _1727 * _1719;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1747 = _1281 + 0.5;
    float _1749 = _1325 * _1699;
    float _1751 = _1627 * _1711;
    float _1753 = _1743 * _1741;
    float _1755 = _1327 * _1699;
    float _1757 = _1331 * _1699;
    float _1759 = _1633 * _1711;
    float _1761 = _1663 * _1711;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1765 = _1735 * _1733;
    float _1767 = _1587 * _1751;
    float _1769 = _1753 * _1583;
    float _1771 = fma(_1745, _1747, _1693);
    float _1773 = _1579 * _1709;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1777 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1763);
    float _1779 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1781 = _1585 * _1761;
    float _1783 = -_1767;
    float _1785 = fma(_1585, _1759, _1783);
    float _1787 = _1753 * _1587;
    float _1789 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1791 = _1789 * 0.5;
    float _1793 = fma(_1765, _1761, _1769);
    float _1795 = _1383 * _1773;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1799 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1801 = -_1781;
    float _1803 = fma(_1583, _1751, _1801);
    float _1805 = -_1775;
    float _1807 = fma(_1779, 2.0, _1805);
    float _1809 = fma(_1765, _1759, _1787);
    float _1811 = fma(_1791, _1785, _1793);
    float _1813 = fma(_1799, -2.0, _1797);
    float _1815 = -_1501;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1791, _1803, _1809);
    float _1821 = _1287 + _1811;
    float _1823 = -_1579;
    float _1825 = _1823 + 1.0;
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1829 = _1283 + _1819;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1833 = _1821 + _1831;
    float _1835 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1795);
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1749);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1841 = _1829 + _1839;
    float _1843 = _1833 * _1833;
    float _1845 = fma(_1475, _1705, _1835);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1755);
    float _1851 = fma(_1841, _1841, _1843);
    float _1853 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1855 = fma(_1333, _1653, _1837);
    float _1857 = fma(_1341, _1653, _1849);
    float _1859 = -_119;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1807);
    float _1863 = fma(_1345, _1653, _1853);
    float _1865 = sqrt(_1851);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1869 = _1725 + 0.5;
    float _1871 = fma(_1371, _1681, _1845);
    float _1873 = fma(_1375, _1581, _1855);
    float _1875 = fma(_1373, _1581, _1857);
    float _1877 = fma(_1441, _1581, _1863);
    float _1879 = fma(_1381, _1673, _1871);
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1883 = _1739 + (-0.5);
    float _1885 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1813);
    float _1887 = fma(_1385, _1563, _1879);
    float _1889 = fma(_1881, _1869, _1861);
    float _1891 = _1583 * _1759;
    float _1893 = _1753 * _1585;
    float _1895 = fma(_1425, _1557, _1887);
    bool _1897 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -_1891;
    float _1901 = fma(_1587, _1761, _1899);
    float _1903 = fma(_1765, _1751, _1893);
    float _1905 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1875);
    float _1907 = -_1867;
    float _1909 = -_1885;
    float _1911 = fma(_1907, _1883, _1909);
    float _1913 = fma(_1791, _1901, _1903);
    float _1915 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1269);
    float _1917 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1873);
    float _1919 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1877);
    float _1921 = _1169 + _1913;
    float _1923 = fma(_1447, _1551, _1895);
    float _1925 = -_1915;
    float _1927 = _1925 + 1.0;
    float _1929 = _1895;
    float _1931 = _1551;
    float _1933 = _1829;
    float _1935 = _1461;
    if (!_1897)
    {
        _1929 = _1821;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    if (!_1897)
    {
        _1931 = _1921;
    }
    float _1941 = _1931;
    bool _1943 = !_1897;
    float _1945 = _1941;
    if (!_1943)
    {
        float _1947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1951 = _1865 + _1949;
        float _1953 = rsqrt(_1851);
        float _1955 = _1951 * _1947;
        float _1957 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = _1955 * 0.15915493667125701904296875;
        float _1961 = _1959 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1975 = _1953 * _1971;
        float _1977 = fma(_1921, _1963, _1973);
        float _1979 = fma(_1841, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1833, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1945 = _1977;
        _1933 = _1979;
        _1939 = _1981;
    }
    float _1983 = _1945;
    float _1985 = _1933;
    float _1987 = _1939;
    float _1989 = -_1169;
    float _1991 = _1989 + _1983;
    float _1993 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1235);
    float _1995 = -_1927;
    float _1997 = fma(_1281, _1995, _1771);
    float _1999 = -_1283;
    float _2001 = _1999 + _1985;
    float _2003 = _1991 * _1991;
    float _2005 = -_1993;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1777);
    float _2011 = -_1287;
    float _2013 = _2011 + _1987;
    float _2015 = fma(_2001, _2001, _2003);
    float _2017 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1427);
    float _2019 = -_2009;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1685, _2007, _1717);
    float _2025 = fma(_2013, _2013, _2015);
    float _2027 = -_2017;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2021;
    float _2033 = fma(_1725, _2031, _1889);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_1739, _2029, _1911);
    float _2039 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2041 = _1905 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2043 = _1919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    out.m_58.x = _1997;
    out.m_58.y = _2023;
    out.m_58.z = _2033;
    out.m_58.w = _2037;
    out.m_60.x = _2047;
    out.m_60.y = _2049;
    out.m_60.z = _2051;
    out.m_60.w = _2045;
    bool _2055 = _2035 > 0.0;
    out.m_62.x = _2053;
    bool _2057 = !_2055;
    float _2059 = _2047;
    float _2061 = _2033;
    float _2063 = _1985;
    float _2065 = _1983;
    float _2067 = _1987;
    float _2069 = _2047;
    if (!_2057)
    {
        bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2073 = _1997;
        if (_2071)
        {
            float _2075 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2073 = _2075;
        }
        float _2077 = _2073;
        float _2079 = _2077;
        if (_2071)
        {
            float _2081 = _2077 * _615;
            _2059 = _2081;
        }
        float _2083 = _2059;
        float _2085 = _2083;
        if (_2071)
        {
            float _2087 = _2077 * _613;
            _2061 = _2087;
        }
        float _2089 = _2061;
        float _2091 = _2089;
        if (_2071)
        {
            float _2093 = _2077 * _617;
            _2079 = _2093;
        }
        float _2095 = _2079;
        float _2097 = _2095;
        float _2099 = _2095;
        if (!_2071)
        {
            float _2101 = _119 + 1.0;
            float _2103 = _2101;
            if (!_161)
            {
                float _2105 = _2101 * _2101;
                float _2107 = _2105 * 0.5;
                _2097 = _2107;
            }
            float _2109 = _2097;
            float _2111 = _2109;
            if (!_161)
            {
                float _2113 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2111 = _2113;
            }
            float _2115 = _2111;
            bool _2117 = !_161;
            float _2119 = _2115;
            if (!_2117)
            {
                float _2121 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2123 = log2(_2121);
                float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2127 = _2125 + 1.0;
                float _2129 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2131 = _2123 * _2101;
                float _2133 = 1.0 / _2127;
                float _2135 = _2129 * 0.693147182464599609375;
                float _2137 = exp2(_2131);
                float _2139 = 1.0 / _2135;
                float _2141 = _2137 + (-1.0);
                float _2143 = -_2141;
                float _2145 = fma(_2143, _2139, _2101);
                float _2147 = _2145 * _2133;
                float _2149 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2119 = _2149;
            }
            float _2151 = _2119;
            float _2153 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2155 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2157 = !_161;
            if (!_2157)
            {
                float _2159 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2161 = log2(_2159);
                float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2165 = _2163 + 1.0;
                float _2167 = 1.0 / _2165;
                float _2169 = _2161 * _2101;
                float _2171 = exp2(_2169);
                float _2173 = -_2171;
                float _2175 = _2173 + 1.0;
                float _2177 = _2175 * _2167;
                _2103 = _2177;
            }
            float _2179 = _2103;
            float _2181 = fma(_2179, _149, _2155);
            float _2183 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2185 = fma(_2179, _147, _2153);
            float _2187 = -_359;
            float _2189 = _2187 + _2181;
            float _2191 = fma(_2179, _151, _2183);
            float _2193 = -_365;
            float _2195 = _2193 + _2185;
            float _2197 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2199 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2201 = -_373;
            float _2203 = _2201 + _2191;
            float _2205 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2197);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2199);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2205);
            float _2213 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2207);
            float _2215 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
            float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _1935 = _2223;
            _623 = _2213;
            _625 = _2215;
            _627 = _2217;
            _2085 = _2215;
            _2091 = _2213;
            _2099 = _2217;
        }
        float _2225 = _1935;
        float _2227 = _623;
        float _2229 = _625;
        float _2231 = _627;
        float _2233 = _2085;
        float _2235 = _2091;
        float _2237 = _2099;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2025);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2001 * _2241;
        float _2247 = _1991 * _2241;
        float _2249 = _2013 * _2241;
        bool _2251 = !_2243;
        _2069 = _2233;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2253 * _2231;
            float _2261 = _2247 * _2255;
            float _2263 = fma(_2245, _2257, _2261);
            float _2265 = fma(_2249, _2259, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1985);
            float _2271 = fma(_2235, _2267, _1983);
            float _2273 = fma(_2237, _2267, _1987);
            _2063 = _2269;
            _2065 = _2271;
            _2067 = _2273;
        }
    }
    float _2275 = _2063;
    float _2277 = _2065;
    float _2279 = _2067;
    float _2281 = _2069;
    bool _2283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2285 = isnan(0.5);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2291 = _2287 || _2289;
    float _2293 = -_1389;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2297 = -_1387;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2301 = -_1423;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2305 = _2299;
    float _2307 = _2295;
    float _2309 = _2303;
    float _2311 = _2281;
    if (!_2291)
    {
        float _2313 = -_1387;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
        float _2317 = -_1389;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
        float _2321 = -_1423;
        float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2329 = _2315 + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2333 = _2319 + _2331;
        float _2335 = -_1287;
        float _2337 = _2335 + _2279;
        float _2339 = -_1169;
        float _2341 = _2339 + _2277;
        float _2343 = _2329 * _2329;
        float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2347 = _2323 + _2345;
        float _2349 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2351 = fma(_2333, _2333, _2343);
        float _2353 = fma(_2347, _2347, _2351);
        float _2355 = 1.0 / _1719;
        float _2357 = sqrt(_2353);
        float _2359 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2361 = precise::min(_2357, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2363 = _2361 * _2325;
        float _2365 = -_1283;
        float _2367 = _2365 + _2275;
        float _2369 = _2363 * _2355;
        float _2371 = _2359 * _2369;
        float _2373 = _2337 * _2369;
        float _2375 = fma(_2367, _2371, _2319);
        float _2377 = fma(_2341, _2371, _2315);
        float _2379 = fma(_2359, _2373, _2323);
        _2305 = _2377;
        _2307 = _2375;
        _2309 = _2379;
    }
    float _2381 = _2305;
    float _2383 = _2307;
    float _2385 = _2309;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2389 = _2381 + _2387;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2393 = _2383 + _2391;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2397 = _2385 + _2395;
    float _2399 = _2389 * _2389;
    float _2401 = fma(_2393, _2393, _2399);
    float _2403 = fma(_2397, _2397, _2401);
    float _2405 = rsqrt(_2403);
    float _2407 = sqrt(_2403);
    float _2409 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2411 = _2393 * _2409;
    float _2413 = _2397 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 * _2413;
    float _2419 = _2415 + _2417;
    float _2421 = sqrt(_2419);
    bool _2423 = _2421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2427 = _2421 + _2425;
    float _2429 = _2405;
    float _2431 = _2419;
    float _2433 = _2427;
    float _2435 = _2389;
    if (_2423)
    {
        float _2437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (_2423)
    {
        float _2441 = rsqrt(_2419);
        _2431 = _2441;
    }
    float _2443 = _2431;
    float _2445 = _2443;
    if (_2423)
    {
        float _2447 = _2427 * _2439;
        _2433 = _2447;
    }
    float _2449 = _2433;
    if (_2423)
    {
        float _2451 = _2449 * 0.15915493667125701904296875;
        _2311 = _2451;
    }
    float _2453 = _2311;
    float _2455 = _2397;
    float _2457 = _2453;
    if (_2423)
    {
        float _2459 = _2453 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2467 = precise::max(0.0, _2465);
    float _2469 = _2439;
    float _2471 = _2467;
    if (_2423)
    {
        float _2473 = _2453 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = -_2409;
    float _2481 = -_2467;
    float _2483 = fma(_2389, _2479, _2481);
    if (_2423)
    {
        float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2485;
    }
    float _2487 = _2435;
    float _2489 = _2487;
    float _2491 = _2463;
    if (_2423)
    {
        float _2493 = fma(_2463, _2487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = _2495;
    if (!_2423)
    {
        _2491 = _2411;
    }
    float _2499 = _2491;
    float _2501 = _2499;
    float _2503 = _2477;
    if (_2423)
    {
        float _2505 = _2477 + (-1.0);
        _2471 = _2505;
    }
    float _2507 = _2471;
    float _2509 = _2507;
    if (_2423)
    {
        float _2511 = _2443 * _2495;
        _439 = _2511;
    }
    float _2513 = _439;
    if (!_2423)
    {
        _2497 = _2483;
    }
    float _2515 = _2497;
    float _2517 = _2515;
    if (_2423)
    {
        float _2519 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2519;
    }
    float _2521 = _2457;
    if (_2423)
    {
        float _2523 = _2411 * _2513;
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (!_2423)
    {
        _2509 = _2413;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2423)
    {
        float _2531 = _2413 * _2513;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (!_2423)
    {
        _2445 = _2415;
    }
    float _2535 = _2445;
    float _2537 = _2535;
    if (_2423)
    {
        float _2539 = fma(_2483, _2477, _2521);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (_2423)
    {
        float _2543 = _2525 * _2525;
        _2537 = _2543;
    }
    float _2545 = _2537;
    if (!_2423)
    {
        _2503 = _2417;
    }
    float _2547 = _2503;
    float _2549 = _2547;
    if (_2423)
    {
        float _2551 = _2533 * _2533;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = fma(_2541, _2541, _2545);
    float _2557 = _2555 + _2553;
    float _2559 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2563 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2561);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2571 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2559);
    float _2573 = rsqrt(_2557);
    float _2575 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2567);
    float _2577 = -_2565;
    float _2579 = _2577 + 1.0;
    float _2581 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2571);
    float _2583 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2587 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2575);
    float _2589 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2591 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2593 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2585);
    float _2595 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2597 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2599 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2591);
    float _2601 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2593);
    float _2603 = abs(_2579);
    float _2605 = log2(_2603);
    float _2607 = -_2597;
    float _2609 = fma(_2607, _2569, 1.0);
    float _2611 = _2573 * _2525;
    float _2613 = _2599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2615 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2617 = _2573 * _2541;
    float _2619 = _2573 * _2533;
    float _2621 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2615);
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2627 = log2(_2609);
    float _2629 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2631 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2623);
    float _2633 = -_2625;
    float _2635 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2633);
    float _2637 = _2617 + 1.0;
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2631);
    float _2641 = -_2619;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2635);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2647 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2649 = 1.0 / _2639;
    float _2651 = fma(_2643, -0.5, 0.5);
    float _2653 = fma(_2643, 0.5, 0.5);
    float _2655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2647);
    float _2657 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2629);
    float _2659 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2655);
    float _2661 = exp2(_2645);
    float _2663 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2657);
    float _2665 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2659);
    float _2667 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2627 * 0.693147182464599609375;
    float _2671 = sqrt(_2651);
    float _2673 = fma(_2653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2675 = _2665 * _2649;
    float _2677 = _2667 * _2649;
    float _2679 = fma(_2653, _2673, -0.212114393711090087890625);
    float _2681 = fma(_2675, 0.5, 0.5);
    float _2683 = fma(_2677, -0.5, 0.5);
    float _2685 = -_2617;
    float _2687 = fma(_2661, _2637, _2685);
    float _2689 = fma(_2653, _2679, 1.570728778839111328125);
    float _2691 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2687, 0.5, 0.5);
    float _2695 = _2671 * 0.636619746685028076171875;
    float3 _7040 = float3(_2681, _2683, _2691);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).x;
    float _2699 = -_2689;
    float _2701 = fma(_2695, _2699, 1.0);
    float3 _7056 = float3(_2681, _2683, _2691);
    float4 _2704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7056, float3(0.0), isnan(_7056)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7056, float3(0.0), isnan(_7056)), level(0.0)).xyzw;
    float _2706 = _2704.x;
    float _2708 = _2704.y;
    float _2710 = _2704.z;
    float _2712 = _2704.w;
    float2 _7073 = float2(_2701, _2693);
    float3 _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7073, float2(0.0), isnan(_7073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7073, float2(0.0), isnan(_7073)), level(0.0)).xyz;
    float _2718 = _2716.x;
    float _2720 = _2716.y;
    float _2722 = _2716.z;
    float _2724 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2726 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2730 = exp2(_2724);
    float _2732 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2736 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2734);
    out.m_45.x = _2732;
    float _2738 = _2736 + _2639;
    out.gl_Position.x = _2665;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2736;
    out.gl_Position.w = _2639;
    float _2740 = _2738 * 0.5;
    float _2742 = -_2730;
    float _2744 = _2742 + 1.0;
    float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2740;
    out.m_64.w = _2639;
    float _2748 = _2746 * _2697;
    float _2750 = -_2746;
    float _2752 = _2750 + 1.0;
    float _2754 = _2712 * _2748;
    float _2756 = _2712 * _2752;
    float _2758 = _2722 * _2748;
    float _2760 = fma(_2718, _2754, _2706);
    float _2762 = fma(_2720, _2754, _2708);
    float _2764 = fma(_2712, _2758, _2710);
    out.m_66.x = _2760;
    out.m_66.y = _2762;
    out.m_66.z = _2764;
    out.m_66.w = _2756;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1045 = false;
    bool _895 = false;
    bool _647 = false;
    bool _491 = false;
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
        float _2821 = as_type<float>(_101);
        out.gl_Position.z = _2821;
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
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
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
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = sqrt(_397);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_413);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _381;
    float _439 = _359;
    if (_425)
    {
        _433 = _409;
    }
    float _441 = _433;
    float _443 = _441;
    if (_425)
    {
        _435 = _411;
    }
    float _445 = _435;
    float _447 = _445;
    if (_425)
    {
        _437 = _415;
    }
    float _449 = _437;
    float _451 = _449;
    if (!_425)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _447 = _487;
            _443 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _149 * _149;
            float _495 = fma(_147, _147, _493);
            float _497 = fma(_151, _151, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _403 * _403;
                float _513 = fma(_401, _401, _511);
                float _515 = fma(_405, _405, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _447 = _541;
                    _443 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _447 = _575;
                    _443 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _447 = _609;
                _443 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _447;
    float _615 = _443;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _623 = _613;
    float _625 = _615;
    float _627 = _617;
    float _645;
    if (!_621)
    {
        float _629 = in.m_54.x;
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _633 = _629 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_85);
        float _651 = 1.0 / _649;
        float _653 = _119 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = _655 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _693 = 1.0 / _683;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _679;
    float _699 = 1.0 / _687;
    float _701 = _663 * _693;
    bool _703 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_655);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_675;
    float _717 = _715 + 1.0;
    float _719 = _713 * _717;
    float _721 = 1.0 / _691;
    float _723 = _659 * _697;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _655 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _731 = _655 + _729;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _727 * _699;
    bool _747 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _749 = isnan(_655);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _759;
    float _763 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _769 = _731 * _721;
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -_757;
    float _785 = _783 + 1.0;
    float _787 = _757 * _773;
    float _789 = fma(_777, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _791 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_655);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _743 * _785;
    float _805 = -_743;
    float _807 = _805 + 1.0;
    float _809 = fma(_767, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_781, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _813 = _801 * _807;
    float _815 = -_801;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _819;
    float _823 = in.m_52.x;
    float _825 = in.m_52.y;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = _763 * _813;
    float _833 = _789 * _813;
    float _835 = fma(_821, _745, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _837 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _851 = fma(_809, _803, _839);
    float _853 = fma(_811, _803, _841);
    float _855 = fma(_845, _769, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _857 = fma(_849, _769, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _859 = fma(_837, _787, _851);
    float _861 = fma(_835, _787, _853);
    float _863 = fma(_855, _719, _859);
    float _865 = fma(_857, _719, _861);
    float _867 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].x, _863);
    float _869 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _871 = _867 * _823;
    float _873 = _869 * _825;
    bool _875 = !_695;
    float _893;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _893 = _891;
        _895 = true;
    }
    else
    {
        float _897 = float(_85);
        float _899 = 1.0 / _897;
        float _901 = _119 * _899;
        _893 = _901;
    }
    _895 = false;
    float _903 = _893;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _903 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _913 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _915 = isnan(_903);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _929 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _931 = isnan(_903);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _941;
    bool _945 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_903);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = 1.0 / _911;
    float _959 = -_923;
    float _961 = _959 + 1.0;
    bool _963 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _965 = _939 * _961;
    float _967 = -_939;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _927;
    float _973 = _943 * _957;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _971;
    float _983 = _979 * _965;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _991 = _903 + _989;
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _995 = _923 * _987;
    float _997 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = fma(_997, _995, _993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1001);
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1009;
    out.m_56.y = _1011;
    out.m_56.z = _1013;
    out.m_56.w = _1015;
    bool _1017 = !_963;
    float _1041;
    float _1043;
    if (!_1017)
    {
        float _1019 = in.m_54.x;
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1023 = float(_85);
        float _1025 = 1.0 / _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1029 = _119 * _1025;
        float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1033 = _1031 * _1021;
        float _1035 = floor(_1033);
        float _1037 = -_1035;
        float _1039 = _1033 + _1037;
        _1041 = _1039;
        _1043 = _1029;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_85);
        float _1049 = 1.0 / _1047;
        float _1051 = _119 * _1049;
        _1041 = _1051;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1041;
    float _1055 = _1043;
    float _1057 = in.m_54.x;
    float _1059 = in.m_54.y;
    float _1061 = in.m_54.z;
    float _1063 = in.m_54.w;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1053 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1071 = _1053 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1085 = 1.0 / _1075;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1089 = _1055 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1093 = _1055 + _1091;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / _1079;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1113 = _1111 != 0;
    float _1115 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1117 = _1063 > 0.5;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1123 = _1057 > 0.5;
    float _1125 = 1.0 / _1083;
    float _1127 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1129 = -_195;
    int _1131 = _1123 ? as_type<int>(_1129) : as_type<int>(_195);
    float _1133 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1141 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = 1.0 / _1121;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1149 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1151 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1139);
    float _1153 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1155 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1127);
    float _1157 = -_1105;
    float _1159 = fma(_1149, 2.0, _1157);
    float _1161 = 1.0 / _1147;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1167 = _1067 * _1103;
    float _1169 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1175 = 1.0 / _1165;
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1187 = _1071 * _1085;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1189;
    float _1193 = 1.0 / _1173;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1203 = _1185 * _1161;
    float _1205 = _1181 * _1143;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1169 + _1207;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = 1.0 / _1197;
    float _1215 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = fma(_1133, -2.0, _1211);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1227 = _1053 + _1225;
    float _1229 = 1.0 / _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1235 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1243 = 1.0 / _1233;
    float _1245 = _1191 * _1213;
    float _1247 = _1209 * _1209;
    float _1249 = _1227 * _1125;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1255;
    float _1259 = _1201 * _1229;
    float _1261 = _1233;
    float _1263 = _1241;
    float _1265 = _1061;
    if (!_1137)
    {
        _1261 = _1059;
    }
    float _1267 = _1261;
    float _1269 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    float _1271 = _1267;
    if (_1137)
    {
        _1271 = _1057;
    }
    float _1273 = _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1279 = !_1097;
    float _1281 = _1279 ? _195 : as_type<float>(_1131);
    float _1283 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1285 = _1059 > 0.5;
    float _1287 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1137)
    {
        _1263 = _1061;
    }
    float _1289 = _1263;
    float _1291 = _1239 * _1243;
    float _1293 = -_199;
    int _1295 = _1285 ? as_type<int>(_1293) : as_type<int>(_199);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _1287 + _1297;
    bool _1301 = _1061 > 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1303;
    float _1307 = _1289;
    if (_1137)
    {
        _1307 = _1059;
    }
    float _1309 = _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1137)
    {
        _1265 = _1059;
    }
    float _1315 = _1265;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1319 = _1283 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1321;
    float _1325 = fma(_1253, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1327 = fma(_1257, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1329 = fma(_1319, _1319, _1247);
    float _1331 = fma(_1305, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1333 = fma(_1277, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1335 = fma(_1299, _1299, _1329);
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = fma(_1313, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1343 = _1323 * _1175;
    float _1345 = fma(_1339, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = rsqrt(_1335);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1355 = _1055 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1361;
    float _1365 = _1351 * _1193;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1369 = _1055 + _1367;
    float _1371 = fma(_1343, _1355, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1373 = fma(_1363, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1375 = fma(_1359, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1379 = _1055 + _1377;
    float _1381 = fma(_1365, _1369, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1383 = fma(_1205, _1089, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1385 = fma(_1245, _1379, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1387 = _1209 * _1347;
    float _1389 = _1319 * _1347;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1393 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1395 = isnan(_1053);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = -_1387;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1409 = -_1389;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1415 = _1055 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1417;
    float _1421 = _1407 * _1407;
    float _1423 = _1299 * _1347;
    float _1425 = fma(_1259, _1415, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1427 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1391);
    float _1429 = fma(_1411, _1411, _1421);
    float _1431 = _613 * _613;
    float _1433 = -_1423;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1439 = _1055 + _1437;
    float _1441 = fma(_1419, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1443 = fma(_615, _615, _1431);
    float _1445 = fma(_1435, _1435, _1429);
    float _1447 = fma(_1291, _1439, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1449 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1451 = isnan(_1055);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = fma(_617, _617, _1443);
    bool _1463 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1465 = isnan(_1055);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = fma(_1203, _1093, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1477 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1479 = isnan(_1055);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = rsqrt(_1461);
    bool _1491 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1493 = isnan(_1053);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1499 = _1495 || _1497;
    float _1501 = float(_1499);
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1509 = isnan(_1053);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -_1487;
    float _1521 = _1519 + 1.0;
    bool _1523 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1525 = isnan(_1053);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = -_1473;
    float _1537 = _1535 + 1.0;
    bool _1539 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1541 = isnan(_1055);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1473 * _1505;
    float _1553 = -_1517;
    float _1555 = _1553 + 1.0;
    float _1557 = _1487 * _1537;
    float _1559 = -_1533;
    float _1561 = _1559 + 1.0;
    float _1563 = _1549 * _1521;
    float _1565 = -_1549;
    float _1567 = _1565 + 1.0;
    bool _1569 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1571 = isnan(_1055);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1517 * _1561;
    float _1583 = _1489 * _617;
    float _1585 = _1489 * _613;
    float _1587 = _1489 * _615;
    bool _1589 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1591 = isnan(_1055);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1603 = _1583 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1607 = _1585 * _1605;
    bool _1609 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1611 = isnan(_1055);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1625 = -_1603;
    float _1627 = fma(_1587, _1623, _1625);
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1631 = -_1607;
    float _1633 = fma(_1583, _1629, _1631);
    bool _1635 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1637 = isnan(_1055);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1649 = _1587 * _1647;
    float _1651 = _1627 * _1627;
    float _1653 = _1403 * _1555;
    float _1655 = -_1403;
    float _1657 = _1655 + 1.0;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1661 = -_1649;
    float _1663 = fma(_1585, _1659, _1661);
    float _1665 = fma(_1633, _1633, _1651);
    float _1667 = sqrt(_1445);
    float _1669 = -_1645;
    float _1671 = _1669 + 1.0;
    float _1673 = _1645 * _1567;
    float _1675 = fma(_1663, _1663, _1665);
    float _1677 = -_1619;
    float _1679 = _1677 + 1.0;
    float _1681 = _1619 * _1671;
    bool _1683 = !_1101;
    float _1685 = _1683 ? _199 : as_type<float>(_1295);
    float _1687 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1691 = -_119;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1159);
    float _1695 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1697 = _1685 + (-0.5);
    float _1699 = _1501 * _1657;
    float _1701 = -_195;
    int _1703 = _1301 ? as_type<int>(_1701) : as_type<int>(_195);
    float _1705 = _1599 * _1679;
    float _1707 = -_1599;
    float _1709 = _1707 + 1.0;
    float _1711 = rsqrt(_1675);
    float _1713 = -_1687;
    float _1715 = -_1695;
    float _1717 = fma(_1713, _1697, _1715);
    float _1719 = _1347 * _1667;
    float _1721 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1723 = !_1109;
    float _1725 = _1723 ? _195 : as_type<float>(_1703);
    float _1727 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1729 = -_199;
    int _1731 = _1117 ? as_type<int>(_1729) : as_type<int>(_199);
    float _1733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1735 = _1721 * _1719;
    bool _1737 = !_1113;
    float _1739 = _1737 ? _199 : as_type<float>(_1731);
    float _1741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1743 = _1727 * _1719;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1747 = _1281 + 0.5;
    float _1749 = _1325 * _1699;
    float _1751 = _1627 * _1711;
    float _1753 = _1743 * _1741;
    float _1755 = _1327 * _1699;
    float _1757 = _1331 * _1699;
    float _1759 = _1633 * _1711;
    float _1761 = _1663 * _1711;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1765 = _1735 * _1733;
    float _1767 = _1587 * _1751;
    float _1769 = _1753 * _1583;
    float _1771 = fma(_1745, _1747, _1693);
    float _1773 = _1579 * _1709;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1777 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1763);
    float _1779 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1781 = _1585 * _1761;
    float _1783 = -_1767;
    float _1785 = fma(_1585, _1759, _1783);
    float _1787 = _1753 * _1587;
    float _1789 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1791 = _1789 * 0.5;
    float _1793 = fma(_1765, _1761, _1769);
    float _1795 = _1383 * _1773;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1799 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1801 = -_1781;
    float _1803 = fma(_1583, _1751, _1801);
    float _1805 = -_1775;
    float _1807 = fma(_1779, 2.0, _1805);
    float _1809 = fma(_1765, _1759, _1787);
    float _1811 = fma(_1791, _1785, _1793);
    float _1813 = fma(_1799, -2.0, _1797);
    float _1815 = -_1501;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1791, _1803, _1809);
    float _1821 = _1287 + _1811;
    float _1823 = -_1579;
    float _1825 = _1823 + 1.0;
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1829 = _1283 + _1819;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1833 = _1821 + _1831;
    float _1835 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1795);
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1749);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1841 = _1829 + _1839;
    float _1843 = _1833 * _1833;
    float _1845 = fma(_1475, _1705, _1835);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1755);
    float _1851 = fma(_1841, _1841, _1843);
    float _1853 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1855 = fma(_1333, _1653, _1837);
    float _1857 = fma(_1341, _1653, _1849);
    float _1859 = -_119;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1807);
    float _1863 = fma(_1345, _1653, _1853);
    float _1865 = sqrt(_1851);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1869 = _1725 + 0.5;
    float _1871 = fma(_1371, _1681, _1845);
    float _1873 = fma(_1375, _1581, _1855);
    float _1875 = fma(_1373, _1581, _1857);
    float _1877 = fma(_1441, _1581, _1863);
    float _1879 = fma(_1381, _1673, _1871);
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1883 = _1739 + (-0.5);
    float _1885 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1813);
    float _1887 = fma(_1385, _1563, _1879);
    float _1889 = fma(_1881, _1869, _1861);
    float _1891 = _1583 * _1759;
    float _1893 = _1753 * _1585;
    float _1895 = fma(_1425, _1557, _1887);
    bool _1897 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -_1891;
    float _1901 = fma(_1587, _1761, _1899);
    float _1903 = fma(_1765, _1751, _1893);
    float _1905 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1875);
    float _1907 = -_1867;
    float _1909 = -_1885;
    float _1911 = fma(_1907, _1883, _1909);
    float _1913 = fma(_1791, _1901, _1903);
    float _1915 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1269);
    float _1917 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1873);
    float _1919 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1877);
    float _1921 = _1169 + _1913;
    float _1923 = fma(_1447, _1551, _1895);
    float _1925 = -_1915;
    float _1927 = _1925 + 1.0;
    float _1929 = _1895;
    float _1931 = _1551;
    float _1933 = _1829;
    float _1935 = _1461;
    if (!_1897)
    {
        _1929 = _1821;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    if (!_1897)
    {
        _1931 = _1921;
    }
    float _1941 = _1931;
    bool _1943 = !_1897;
    float _1945 = _1941;
    if (!_1943)
    {
        float _1947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1951 = _1865 + _1949;
        float _1953 = rsqrt(_1851);
        float _1955 = _1951 * _1947;
        float _1957 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = _1955 * 0.15915493667125701904296875;
        float _1961 = _1959 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1975 = _1953 * _1971;
        float _1977 = fma(_1921, _1963, _1973);
        float _1979 = fma(_1841, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1833, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1945 = _1977;
        _1933 = _1979;
        _1939 = _1981;
    }
    float _1983 = _1945;
    float _1985 = _1933;
    float _1987 = _1939;
    float _1989 = -_1169;
    float _1991 = _1989 + _1983;
    float _1993 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1235);
    float _1995 = -_1927;
    float _1997 = fma(_1281, _1995, _1771);
    float _1999 = -_1283;
    float _2001 = _1999 + _1985;
    float _2003 = _1991 * _1991;
    float _2005 = -_1993;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1777);
    float _2011 = -_1287;
    float _2013 = _2011 + _1987;
    float _2015 = fma(_2001, _2001, _2003);
    float _2017 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1427);
    float _2019 = -_2009;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1685, _2007, _1717);
    float _2025 = fma(_2013, _2013, _2015);
    float _2027 = -_2017;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2021;
    float _2033 = fma(_1725, _2031, _1889);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_1739, _2029, _1911);
    float _2039 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2041 = _1905 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2043 = _1919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    out.m_58.x = _1997;
    out.m_58.y = _2023;
    out.m_58.z = _2033;
    out.m_58.w = _2037;
    out.m_60.x = _2047;
    out.m_60.y = _2049;
    out.m_60.z = _2051;
    out.m_60.w = _2045;
    bool _2055 = _2035 > 0.0;
    out.m_62.x = _2053;
    bool _2057 = !_2055;
    float _2059 = _2047;
    float _2061 = _2033;
    float _2063 = _1985;
    float _2065 = _1983;
    float _2067 = _1987;
    float _2069 = _2047;
    if (!_2057)
    {
        bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2073 = _1997;
        if (_2071)
        {
            float _2075 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2073 = _2075;
        }
        float _2077 = _2073;
        float _2079 = _2077;
        if (_2071)
        {
            float _2081 = _2077 * _615;
            _2059 = _2081;
        }
        float _2083 = _2059;
        float _2085 = _2083;
        if (_2071)
        {
            float _2087 = _2077 * _613;
            _2061 = _2087;
        }
        float _2089 = _2061;
        float _2091 = _2089;
        if (_2071)
        {
            float _2093 = _2077 * _617;
            _2079 = _2093;
        }
        float _2095 = _2079;
        float _2097 = _2095;
        float _2099 = _2095;
        if (!_2071)
        {
            float _2101 = _119 + 1.0;
            float _2103 = _2101;
            if (!_161)
            {
                float _2105 = _2101 * _2101;
                float _2107 = _2105 * 0.5;
                _2097 = _2107;
            }
            float _2109 = _2097;
            float _2111 = _2109;
            if (!_161)
            {
                float _2113 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2111 = _2113;
            }
            float _2115 = _2111;
            bool _2117 = !_161;
            float _2119 = _2115;
            if (!_2117)
            {
                float _2121 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2123 = log2(_2121);
                float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2127 = _2125 + 1.0;
                float _2129 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2131 = _2123 * _2101;
                float _2133 = 1.0 / _2127;
                float _2135 = _2129 * 0.693147182464599609375;
                float _2137 = exp2(_2131);
                float _2139 = 1.0 / _2135;
                float _2141 = _2137 + (-1.0);
                float _2143 = -_2141;
                float _2145 = fma(_2143, _2139, _2101);
                float _2147 = _2145 * _2133;
                float _2149 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2119 = _2149;
            }
            float _2151 = _2119;
            float _2153 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2155 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2157 = !_161;
            if (!_2157)
            {
                float _2159 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2161 = log2(_2159);
                float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2165 = _2163 + 1.0;
                float _2167 = 1.0 / _2165;
                float _2169 = _2161 * _2101;
                float _2171 = exp2(_2169);
                float _2173 = -_2171;
                float _2175 = _2173 + 1.0;
                float _2177 = _2175 * _2167;
                _2103 = _2177;
            }
            float _2179 = _2103;
            float _2181 = fma(_2179, _149, _2155);
            float _2183 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2185 = fma(_2179, _147, _2153);
            float _2187 = -_359;
            float _2189 = _2187 + _2181;
            float _2191 = fma(_2179, _151, _2183);
            float _2193 = -_365;
            float _2195 = _2193 + _2185;
            float _2197 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2199 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2201 = -_373;
            float _2203 = _2201 + _2191;
            float _2205 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2197);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2199);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2205);
            float _2213 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2207);
            float _2215 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
            float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _1935 = _2223;
            _623 = _2213;
            _625 = _2215;
            _627 = _2217;
            _2085 = _2215;
            _2091 = _2213;
            _2099 = _2217;
        }
        float _2225 = _1935;
        float _2227 = _623;
        float _2229 = _625;
        float _2231 = _627;
        float _2233 = _2085;
        float _2235 = _2091;
        float _2237 = _2099;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2025);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2001 * _2241;
        float _2247 = _1991 * _2241;
        float _2249 = _2013 * _2241;
        bool _2251 = !_2243;
        _2069 = _2233;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2253 * _2231;
            float _2261 = _2247 * _2255;
            float _2263 = fma(_2245, _2257, _2261);
            float _2265 = fma(_2249, _2259, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1985);
            float _2271 = fma(_2235, _2267, _1983);
            float _2273 = fma(_2237, _2267, _1987);
            _2063 = _2269;
            _2065 = _2271;
            _2067 = _2273;
        }
    }
    float _2275 = _2063;
    float _2277 = _2065;
    float _2279 = _2067;
    float _2281 = _2069;
    bool _2283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2285 = isnan(0.5);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2291 = _2287 || _2289;
    float _2293 = -_1389;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2297 = -_1387;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2301 = -_1423;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2305 = _2299;
    float _2307 = _2295;
    float _2309 = _2303;
    float _2311 = _2281;
    if (!_2291)
    {
        float _2313 = -_1387;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
        float _2317 = -_1389;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
        float _2321 = -_1423;
        float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2329 = _2315 + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2333 = _2319 + _2331;
        float _2335 = -_1287;
        float _2337 = _2335 + _2279;
        float _2339 = -_1169;
        float _2341 = _2339 + _2277;
        float _2343 = _2329 * _2329;
        float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2347 = _2323 + _2345;
        float _2349 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2351 = fma(_2333, _2333, _2343);
        float _2353 = fma(_2347, _2347, _2351);
        float _2355 = 1.0 / _1719;
        float _2357 = sqrt(_2353);
        float _2359 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2361 = precise::min(_2357, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2363 = _2361 * _2325;
        float _2365 = -_1283;
        float _2367 = _2365 + _2275;
        float _2369 = _2363 * _2355;
        float _2371 = _2359 * _2369;
        float _2373 = _2337 * _2369;
        float _2375 = fma(_2367, _2371, _2319);
        float _2377 = fma(_2341, _2371, _2315);
        float _2379 = fma(_2359, _2373, _2323);
        _2305 = _2377;
        _2307 = _2375;
        _2309 = _2379;
    }
    float _2381 = _2305;
    float _2383 = _2307;
    float _2385 = _2309;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2389 = _2381 + _2387;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2393 = _2383 + _2391;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2397 = _2385 + _2395;
    float _2399 = _2389 * _2389;
    float _2401 = fma(_2393, _2393, _2399);
    float _2403 = fma(_2397, _2397, _2401);
    float _2405 = rsqrt(_2403);
    float _2407 = sqrt(_2403);
    float _2409 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2411 = _2393 * _2409;
    float _2413 = _2397 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 * _2413;
    float _2419 = _2415 + _2417;
    float _2421 = sqrt(_2419);
    bool _2423 = _2421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2427 = _2421 + _2425;
    float _2429 = _2405;
    float _2431 = _2419;
    float _2433 = _2427;
    float _2435 = _2389;
    if (_2423)
    {
        float _2437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (_2423)
    {
        float _2441 = rsqrt(_2419);
        _2431 = _2441;
    }
    float _2443 = _2431;
    float _2445 = _2443;
    if (_2423)
    {
        float _2447 = _2427 * _2439;
        _2433 = _2447;
    }
    float _2449 = _2433;
    if (_2423)
    {
        float _2451 = _2449 * 0.15915493667125701904296875;
        _2311 = _2451;
    }
    float _2453 = _2311;
    float _2455 = _2397;
    float _2457 = _2453;
    if (_2423)
    {
        float _2459 = _2453 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2467 = precise::max(0.0, _2465);
    float _2469 = _2439;
    float _2471 = _2467;
    if (_2423)
    {
        float _2473 = _2453 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = -_2409;
    float _2481 = -_2467;
    float _2483 = fma(_2389, _2479, _2481);
    if (_2423)
    {
        float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2485;
    }
    float _2487 = _2435;
    float _2489 = _2487;
    float _2491 = _2463;
    if (_2423)
    {
        float _2493 = fma(_2463, _2487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = _2495;
    if (!_2423)
    {
        _2491 = _2411;
    }
    float _2499 = _2491;
    float _2501 = _2499;
    float _2503 = _2477;
    if (_2423)
    {
        float _2505 = _2477 + (-1.0);
        _2471 = _2505;
    }
    float _2507 = _2471;
    float _2509 = _2507;
    if (_2423)
    {
        float _2511 = _2443 * _2495;
        _439 = _2511;
    }
    float _2513 = _439;
    if (!_2423)
    {
        _2497 = _2483;
    }
    float _2515 = _2497;
    float _2517 = _2515;
    if (_2423)
    {
        float _2519 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2519;
    }
    float _2521 = _2457;
    if (_2423)
    {
        float _2523 = _2411 * _2513;
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (!_2423)
    {
        _2509 = _2413;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2423)
    {
        float _2531 = _2413 * _2513;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (!_2423)
    {
        _2445 = _2415;
    }
    float _2535 = _2445;
    float _2537 = _2535;
    if (_2423)
    {
        float _2539 = fma(_2483, _2477, _2521);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (_2423)
    {
        float _2543 = _2525 * _2525;
        _2537 = _2543;
    }
    float _2545 = _2537;
    if (!_2423)
    {
        _2503 = _2417;
    }
    float _2547 = _2503;
    float _2549 = _2547;
    if (_2423)
    {
        float _2551 = _2533 * _2533;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = fma(_2541, _2541, _2545);
    float _2557 = _2555 + _2553;
    float _2559 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2563 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2561);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2571 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2559);
    float _2573 = rsqrt(_2557);
    float _2575 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2567);
    float _2577 = -_2565;
    float _2579 = _2577 + 1.0;
    float _2581 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2571);
    float _2583 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2587 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2575);
    float _2589 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2591 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2593 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2585);
    float _2595 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2597 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2599 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2591);
    float _2601 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2593);
    float _2603 = abs(_2579);
    float _2605 = log2(_2603);
    float _2607 = -_2597;
    float _2609 = fma(_2607, _2569, 1.0);
    float _2611 = _2573 * _2525;
    float _2613 = _2599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2615 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2617 = _2573 * _2541;
    float _2619 = _2573 * _2533;
    float _2621 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2615);
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2627 = log2(_2609);
    float _2629 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2631 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2623);
    float _2633 = -_2625;
    float _2635 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2633);
    float _2637 = _2617 + 1.0;
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2631);
    float _2641 = -_2619;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2635);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2647 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2649 = 1.0 / _2639;
    float _2651 = fma(_2643, -0.5, 0.5);
    float _2653 = fma(_2643, 0.5, 0.5);
    float _2655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2647);
    float _2657 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2629);
    float _2659 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2655);
    float _2661 = exp2(_2645);
    float _2663 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2657);
    float _2665 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2659);
    float _2667 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2627 * 0.693147182464599609375;
    float _2671 = sqrt(_2651);
    float _2673 = fma(_2653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2675 = _2665 * _2649;
    float _2677 = _2667 * _2649;
    float _2679 = fma(_2653, _2673, -0.212114393711090087890625);
    float _2681 = fma(_2675, 0.5, 0.5);
    float _2683 = fma(_2677, -0.5, 0.5);
    float _2685 = -_2617;
    float _2687 = fma(_2661, _2637, _2685);
    float _2689 = fma(_2653, _2679, 1.570728778839111328125);
    float _2691 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2687, 0.5, 0.5);
    float _2695 = _2671 * 0.636619746685028076171875;
    float3 _7040 = float3(_2681, _2683, _2691);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).x;
    float _2699 = -_2689;
    float _2701 = fma(_2695, _2699, 1.0);
    float3 _7056 = float3(_2681, _2683, _2691);
    float4 _2704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7056, float3(0.0), isnan(_7056)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7056, float3(0.0), isnan(_7056)), level(0.0)).xyzw;
    float _2706 = _2704.x;
    float _2708 = _2704.y;
    float _2710 = _2704.z;
    float _2712 = _2704.w;
    float2 _7073 = float2(_2701, _2693);
    float3 _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7073, float2(0.0), isnan(_7073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7073, float2(0.0), isnan(_7073)), level(0.0)).xyz;
    float _2718 = _2716.x;
    float _2720 = _2716.y;
    float _2722 = _2716.z;
    float _2724 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2726 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2730 = exp2(_2724);
    float _2732 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2736 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2734);
    out.m_45.x = _2732;
    float _2738 = _2736 + _2639;
    out.gl_Position.x = _2665;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2736;
    out.gl_Position.w = _2639;
    float _2740 = _2738 * 0.5;
    float _2742 = -_2730;
    float _2744 = _2742 + 1.0;
    float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2740;
    out.m_64.w = _2639;
    float _2748 = _2746 * _2697;
    float _2750 = -_2746;
    float _2752 = _2750 + 1.0;
    float _2754 = _2712 * _2748;
    float _2756 = _2712 * _2752;
    float _2758 = _2722 * _2748;
    float _2760 = fma(_2718, _2754, _2706);
    float _2762 = fma(_2720, _2754, _2708);
    float _2764 = fma(_2712, _2758, _2710);
    out.m_66.x = _2760;
    out.m_66.y = _2762;
    out.m_66.z = _2764;
    out.m_66.w = _2756;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1045 = false;
    bool _895 = false;
    bool _647 = false;
    bool _491 = false;
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
        float _2821 = as_type<float>(_101);
        out.gl_Position.z = _2821;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2892 = as_type<float>(_139);
        out.gl_Position.z = _2892;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = sqrt(_397);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_413);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_361, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _381;
    float _439 = _359;
    if (_425)
    {
        _433 = _409;
    }
    float _441 = _433;
    float _443 = _441;
    if (_425)
    {
        _435 = _411;
    }
    float _445 = _435;
    float _447 = _445;
    if (_425)
    {
        _437 = _415;
    }
    float _449 = _437;
    float _451 = _449;
    if (!_425)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _447 = _487;
            _443 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _149 * _149;
            float _495 = fma(_147, _147, _493);
            float _497 = fma(_151, _151, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _403 * _403;
                float _513 = fma(_401, _401, _511);
                float _515 = fma(_405, _405, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _447 = _541;
                    _443 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _447 = _575;
                    _443 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _447 = _609;
                _443 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _447;
    float _615 = _443;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _623 = _613;
    float _625 = _615;
    float _627 = _617;
    float _645;
    if (!_621)
    {
        float _629 = in.m_54.x;
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _633 = _629 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_85);
        float _651 = 1.0 / _649;
        float _653 = _119 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = _655 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _689 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _693 = 1.0 / _683;
    bool _695 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _697 = 1.0 / _679;
    float _699 = 1.0 / _687;
    float _701 = _663 * _693;
    bool _703 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_655);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -_675;
    float _717 = _715 + 1.0;
    float _719 = _713 * _717;
    float _721 = 1.0 / _691;
    float _723 = _659 * _697;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _655 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _731 = _655 + _729;
    bool _733 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_655);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _727 * _699;
    bool _747 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _749 = isnan(_655);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _759;
    float _763 = fma(_761, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _769 = _731 * _721;
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -_757;
    float _785 = _783 + 1.0;
    float _787 = _757 * _773;
    float _789 = fma(_777, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _791 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _793 = isnan(_655);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = _743 * _785;
    float _805 = -_743;
    float _807 = _805 + 1.0;
    float _809 = fma(_767, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _811 = fma(_781, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _813 = _801 * _807;
    float _815 = -_801;
    float _817 = _815 + 1.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _819;
    float _823 = in.m_52.x;
    float _825 = in.m_52.y;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _827;
    float _831 = _763 * _813;
    float _833 = _789 * _813;
    float _835 = fma(_821, _745, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _837 = fma(_829, _745, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _839 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _831);
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _833);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _851 = fma(_809, _803, _839);
    float _853 = fma(_811, _803, _841);
    float _855 = fma(_845, _769, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _857 = fma(_849, _769, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _859 = fma(_837, _787, _851);
    float _861 = fma(_835, _787, _853);
    float _863 = fma(_855, _719, _859);
    float _865 = fma(_857, _719, _861);
    float _867 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].x, _863);
    float _869 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[147].y, _865);
    float _871 = _867 * _823;
    float _873 = _869 * _825;
    bool _875 = !_695;
    float _893;
    if (!_875)
    {
        float _877 = in.m_54.x;
        float _879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _881 = _877 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _885 = _883 * _879;
        float _887 = floor(_885);
        float _889 = -_887;
        float _891 = _885 + _889;
        _893 = _891;
        _895 = true;
    }
    else
    {
        float _897 = float(_85);
        float _899 = 1.0 / _897;
        float _901 = _119 * _899;
        _893 = _901;
    }
    _895 = false;
    float _903 = _893;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _903 + _905;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _913 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _915 = isnan(_903);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _929 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _931 = isnan(_903);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _941;
    bool _945 = _903 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_903);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = 1.0 / _911;
    float _959 = -_923;
    float _961 = _959 + 1.0;
    bool _963 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _965 = _939 * _961;
    float _967 = -_939;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _927;
    float _973 = _943 * _957;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _971;
    float _983 = _979 * _965;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _991 = _903 + _989;
    float _993 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _983);
    float _995 = _923 * _987;
    float _997 = fma(_981, _991, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = fma(_997, _995, _993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1001);
    float _1009 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1009;
    out.m_56.y = _1011;
    out.m_56.z = _1013;
    out.m_56.w = _1015;
    bool _1017 = !_963;
    float _1041;
    float _1043;
    if (!_1017)
    {
        float _1019 = in.m_54.x;
        float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1023 = float(_85);
        float _1025 = 1.0 / _1023;
        float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1029 = _119 * _1025;
        float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1033 = _1031 * _1021;
        float _1035 = floor(_1033);
        float _1037 = -_1035;
        float _1039 = _1033 + _1037;
        _1041 = _1039;
        _1043 = _1029;
        _1045 = true;
    }
    else
    {
        float _1047 = float(_85);
        float _1049 = 1.0 / _1047;
        float _1051 = _119 * _1049;
        _1041 = _1051;
        _1043 = _1051;
    }
    _1045 = false;
    float _1053 = _1041;
    float _1055 = _1043;
    float _1057 = in.m_54.x;
    float _1059 = in.m_54.y;
    float _1061 = in.m_54.z;
    float _1063 = in.m_54.w;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1067 = _1053 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1071 = _1053 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1083 = _1081 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1085 = 1.0 / _1075;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1089 = _1055 + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1093 = _1055 + _1091;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / _1079;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1113 = _1111 != 0;
    float _1115 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1117 = _1063 > 0.5;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1123 = _1057 > 0.5;
    float _1125 = 1.0 / _1083;
    float _1127 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1129 = -_195;
    int _1131 = _1123 ? as_type<int>(_1129) : as_type<int>(_195);
    float _1133 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1137 = _1135 != 0;
    float _1139 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1141 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1143 = 1.0 / _1121;
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1147 = _1145 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1149 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1151 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1139);
    float _1153 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1141);
    float _1155 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1127);
    float _1157 = -_1105;
    float _1159 = fma(_1149, 2.0, _1157);
    float _1161 = 1.0 / _1147;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1167 = _1067 * _1103;
    float _1169 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1175 = 1.0 / _1165;
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1151);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1187 = _1071 * _1085;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1189;
    float _1193 = 1.0 / _1173;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1203 = _1185 * _1161;
    float _1205 = _1181 * _1143;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1209 = _1169 + _1207;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = 1.0 / _1197;
    float _1215 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1219 = _1217 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = fma(_1133, -2.0, _1211);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1227 = _1053 + _1225;
    float _1229 = 1.0 / _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1235 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1237;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1243 = 1.0 / _1233;
    float _1245 = _1191 * _1213;
    float _1247 = _1209 * _1209;
    float _1249 = _1227 * _1125;
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1255;
    float _1259 = _1201 * _1229;
    float _1261 = _1233;
    float _1263 = _1241;
    float _1265 = _1061;
    if (!_1137)
    {
        _1261 = _1059;
    }
    float _1267 = _1261;
    float _1269 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1241);
    float _1271 = _1267;
    if (_1137)
    {
        _1271 = _1057;
    }
    float _1273 = _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1279 = !_1097;
    float _1281 = _1279 ? _195 : as_type<float>(_1131);
    float _1283 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1285 = _1059 > 0.5;
    float _1287 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_1137)
    {
        _1263 = _1061;
    }
    float _1289 = _1263;
    float _1291 = _1239 * _1243;
    float _1293 = -_199;
    int _1295 = _1285 ? as_type<int>(_1293) : as_type<int>(_199);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1299 = _1287 + _1297;
    bool _1301 = _1061 > 0.5;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1303;
    float _1307 = _1289;
    if (_1137)
    {
        _1307 = _1059;
    }
    float _1309 = _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1137)
    {
        _1265 = _1059;
    }
    float _1315 = _1265;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1319 = _1283 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1321;
    float _1325 = fma(_1253, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1327 = fma(_1257, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1329 = fma(_1319, _1319, _1247);
    float _1331 = fma(_1305, _1167, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1333 = fma(_1277, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1335 = fma(_1299, _1299, _1329);
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = fma(_1313, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1343 = _1323 * _1175;
    float _1345 = fma(_1339, _1249, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = rsqrt(_1335);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1355 = _1055 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1361;
    float _1365 = _1351 * _1193;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1369 = _1055 + _1367;
    float _1371 = fma(_1343, _1355, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1373 = fma(_1363, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1375 = fma(_1359, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1379 = _1055 + _1377;
    float _1381 = fma(_1365, _1369, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1383 = fma(_1205, _1089, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1385 = fma(_1245, _1379, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1387 = _1209 * _1347;
    float _1389 = _1319 * _1347;
    float _1391 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1393 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1395 = isnan(_1053);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = -_1387;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1409 = -_1389;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1415 = _1055 + _1413;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1417;
    float _1421 = _1407 * _1407;
    float _1423 = _1299 * _1347;
    float _1425 = fma(_1259, _1415, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1427 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1391);
    float _1429 = fma(_1411, _1411, _1421);
    float _1431 = _613 * _613;
    float _1433 = -_1423;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1439 = _1055 + _1437;
    float _1441 = fma(_1419, _1187, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1443 = fma(_615, _615, _1431);
    float _1445 = fma(_1435, _1435, _1429);
    float _1447 = fma(_1291, _1439, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1449 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1451 = isnan(_1055);
    bool _1453 = _1449 || _1451;
    bool _1455 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1457 = _1453 || _1455;
    float _1459 = float(_1457);
    float _1461 = fma(_617, _617, _1443);
    bool _1463 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1465 = isnan(_1055);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1471 = _1467 || _1469;
    float _1473 = float(_1471);
    float _1475 = fma(_1203, _1093, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1477 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1479 = isnan(_1055);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = rsqrt(_1461);
    bool _1491 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1493 = isnan(_1053);
    bool _1495 = _1491 || _1493;
    bool _1497 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1499 = _1495 || _1497;
    float _1501 = float(_1499);
    float _1503 = -_1459;
    float _1505 = _1503 + 1.0;
    bool _1507 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1509 = isnan(_1053);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -_1487;
    float _1521 = _1519 + 1.0;
    bool _1523 = _1053 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1525 = isnan(_1053);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = -_1473;
    float _1537 = _1535 + 1.0;
    bool _1539 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1541 = isnan(_1055);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = _1473 * _1505;
    float _1553 = -_1517;
    float _1555 = _1553 + 1.0;
    float _1557 = _1487 * _1537;
    float _1559 = -_1533;
    float _1561 = _1559 + 1.0;
    float _1563 = _1549 * _1521;
    float _1565 = -_1549;
    float _1567 = _1565 + 1.0;
    bool _1569 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1571 = isnan(_1055);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1577 = _1573 || _1575;
    float _1579 = float(_1577);
    float _1581 = _1517 * _1561;
    float _1583 = _1489 * _617;
    float _1585 = _1489 * _613;
    float _1587 = _1489 * _615;
    bool _1589 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1591 = isnan(_1055);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1603 = _1583 * _1601;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1607 = _1585 * _1605;
    bool _1609 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1611 = isnan(_1055);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1625 = -_1603;
    float _1627 = fma(_1587, _1623, _1625);
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1631 = -_1607;
    float _1633 = fma(_1583, _1629, _1631);
    bool _1635 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1637 = isnan(_1055);
    bool _1639 = _1635 || _1637;
    bool _1641 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1643 = _1639 || _1641;
    float _1645 = float(_1643);
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1649 = _1587 * _1647;
    float _1651 = _1627 * _1627;
    float _1653 = _1403 * _1555;
    float _1655 = -_1403;
    float _1657 = _1655 + 1.0;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1661 = -_1649;
    float _1663 = fma(_1585, _1659, _1661);
    float _1665 = fma(_1633, _1633, _1651);
    float _1667 = sqrt(_1445);
    float _1669 = -_1645;
    float _1671 = _1669 + 1.0;
    float _1673 = _1645 * _1567;
    float _1675 = fma(_1663, _1663, _1665);
    float _1677 = -_1619;
    float _1679 = _1677 + 1.0;
    float _1681 = _1619 * _1671;
    bool _1683 = !_1101;
    float _1685 = _1683 ? _199 : as_type<float>(_1295);
    float _1687 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1691 = -_119;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1159);
    float _1695 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1697 = _1685 + (-0.5);
    float _1699 = _1501 * _1657;
    float _1701 = -_195;
    int _1703 = _1301 ? as_type<int>(_1701) : as_type<int>(_195);
    float _1705 = _1599 * _1679;
    float _1707 = -_1599;
    float _1709 = _1707 + 1.0;
    float _1711 = rsqrt(_1675);
    float _1713 = -_1687;
    float _1715 = -_1695;
    float _1717 = fma(_1713, _1697, _1715);
    float _1719 = _1347 * _1667;
    float _1721 = _871 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1723 = !_1109;
    float _1725 = _1723 ? _195 : as_type<float>(_1703);
    float _1727 = _873 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1729 = -_199;
    int _1731 = _1117 ? as_type<int>(_1729) : as_type<int>(_199);
    float _1733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1735 = _1721 * _1719;
    bool _1737 = !_1113;
    float _1739 = _1737 ? _199 : as_type<float>(_1731);
    float _1741 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1743 = _1727 * _1719;
    float _1745 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1747 = _1281 + 0.5;
    float _1749 = _1325 * _1699;
    float _1751 = _1627 * _1711;
    float _1753 = _1743 * _1741;
    float _1755 = _1327 * _1699;
    float _1757 = _1331 * _1699;
    float _1759 = _1633 * _1711;
    float _1761 = _1663 * _1711;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1765 = _1735 * _1733;
    float _1767 = _1587 * _1751;
    float _1769 = _1753 * _1583;
    float _1771 = fma(_1745, _1747, _1693);
    float _1773 = _1579 * _1709;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1777 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1763);
    float _1779 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1781 = _1585 * _1761;
    float _1783 = -_1767;
    float _1785 = fma(_1585, _1759, _1783);
    float _1787 = _1753 * _1587;
    float _1789 = _1719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1791 = _1789 * 0.5;
    float _1793 = fma(_1765, _1761, _1769);
    float _1795 = _1383 * _1773;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1799 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1801 = -_1781;
    float _1803 = fma(_1583, _1751, _1801);
    float _1805 = -_1775;
    float _1807 = fma(_1779, 2.0, _1805);
    float _1809 = fma(_1765, _1759, _1787);
    float _1811 = fma(_1791, _1785, _1793);
    float _1813 = fma(_1799, -2.0, _1797);
    float _1815 = -_1501;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1791, _1803, _1809);
    float _1821 = _1287 + _1811;
    float _1823 = -_1579;
    float _1825 = _1823 + 1.0;
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1829 = _1283 + _1819;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1833 = _1821 + _1831;
    float _1835 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1795);
    float _1837 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1749);
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1841 = _1829 + _1839;
    float _1843 = _1833 * _1833;
    float _1845 = fma(_1475, _1705, _1835);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1849 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1755);
    float _1851 = fma(_1841, _1841, _1843);
    float _1853 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1757);
    float _1855 = fma(_1333, _1653, _1837);
    float _1857 = fma(_1341, _1653, _1849);
    float _1859 = -_119;
    float _1861 = fma(_1859, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1807);
    float _1863 = fma(_1345, _1653, _1853);
    float _1865 = sqrt(_1851);
    float _1867 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1869 = _1725 + 0.5;
    float _1871 = fma(_1371, _1681, _1845);
    float _1873 = fma(_1375, _1581, _1855);
    float _1875 = fma(_1373, _1581, _1857);
    float _1877 = fma(_1441, _1581, _1863);
    float _1879 = fma(_1381, _1673, _1871);
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1883 = _1739 + (-0.5);
    float _1885 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1813);
    float _1887 = fma(_1385, _1563, _1879);
    float _1889 = fma(_1881, _1869, _1861);
    float _1891 = _1583 * _1759;
    float _1893 = _1753 * _1585;
    float _1895 = fma(_1425, _1557, _1887);
    bool _1897 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -_1891;
    float _1901 = fma(_1587, _1761, _1899);
    float _1903 = fma(_1765, _1751, _1893);
    float _1905 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1875);
    float _1907 = -_1867;
    float _1909 = -_1885;
    float _1911 = fma(_1907, _1883, _1909);
    float _1913 = fma(_1791, _1901, _1903);
    float _1915 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1269);
    float _1917 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1873);
    float _1919 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1877);
    float _1921 = _1169 + _1913;
    float _1923 = fma(_1447, _1551, _1895);
    float _1925 = -_1915;
    float _1927 = _1925 + 1.0;
    float _1929 = _1895;
    float _1931 = _1551;
    float _1933 = _1829;
    float _1935 = _1461;
    if (!_1897)
    {
        _1929 = _1821;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    if (!_1897)
    {
        _1931 = _1921;
    }
    float _1941 = _1931;
    bool _1943 = !_1897;
    float _1945 = _1941;
    if (!_1943)
    {
        float _1947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1951 = _1865 + _1949;
        float _1953 = rsqrt(_1851);
        float _1955 = _1951 * _1947;
        float _1957 = _1921 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1959 = _1955 * 0.15915493667125701904296875;
        float _1961 = _1959 * 6.283185482025146484375;
        float _1963 = cos(_1961);
        float _1965 = _1959 * 6.283185482025146484375;
        float _1967 = sin(_1965);
        float _1969 = _1963 + (-1.0);
        float _1971 = fma(_1967, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1975 = _1953 * _1971;
        float _1977 = fma(_1921, _1963, _1973);
        float _1979 = fma(_1841, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1981 = fma(_1833, _1975, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1945 = _1977;
        _1933 = _1979;
        _1939 = _1981;
    }
    float _1983 = _1945;
    float _1985 = _1933;
    float _1987 = _1939;
    float _1989 = -_1169;
    float _1991 = _1989 + _1983;
    float _1993 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1235);
    float _1995 = -_1927;
    float _1997 = fma(_1281, _1995, _1771);
    float _1999 = -_1283;
    float _2001 = _1999 + _1985;
    float _2003 = _1991 * _1991;
    float _2005 = -_1993;
    float _2007 = _2005 + 1.0;
    float _2009 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1777);
    float _2011 = -_1287;
    float _2013 = _2011 + _1987;
    float _2015 = fma(_2001, _2001, _2003);
    float _2017 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1427);
    float _2019 = -_2009;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1685, _2007, _1717);
    float _2025 = fma(_2013, _2013, _2015);
    float _2027 = -_2017;
    float _2029 = _2027 + 1.0;
    float _2031 = -_2021;
    float _2033 = fma(_1725, _2031, _1889);
    float _2035 = sqrt(_2025);
    float _2037 = fma(_1739, _2029, _1911);
    float _2039 = _1917 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2041 = _1905 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2043 = _1919 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2047 = _2039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2053 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    out.m_58.x = _1997;
    out.m_58.y = _2023;
    out.m_58.z = _2033;
    out.m_58.w = _2037;
    out.m_60.x = _2047;
    out.m_60.y = _2049;
    out.m_60.z = _2051;
    out.m_60.w = _2045;
    bool _2055 = _2035 > 0.0;
    out.m_62.x = _2053;
    bool _2057 = !_2055;
    float _2059 = _2047;
    float _2061 = _2033;
    float _2063 = _1985;
    float _2065 = _1983;
    float _2067 = _1987;
    float _2069 = _2047;
    if (!_2057)
    {
        bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2073 = _1997;
        if (_2071)
        {
            float _2075 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2073 = _2075;
        }
        float _2077 = _2073;
        float _2079 = _2077;
        if (_2071)
        {
            float _2081 = _2077 * _615;
            _2059 = _2081;
        }
        float _2083 = _2059;
        float _2085 = _2083;
        if (_2071)
        {
            float _2087 = _2077 * _613;
            _2061 = _2087;
        }
        float _2089 = _2061;
        float _2091 = _2089;
        if (_2071)
        {
            float _2093 = _2077 * _617;
            _2079 = _2093;
        }
        float _2095 = _2079;
        float _2097 = _2095;
        float _2099 = _2095;
        if (!_2071)
        {
            float _2101 = _119 + 1.0;
            float _2103 = _2101;
            if (!_161)
            {
                float _2105 = _2101 * _2101;
                float _2107 = _2105 * 0.5;
                _2097 = _2107;
            }
            float _2109 = _2097;
            float _2111 = _2109;
            if (!_161)
            {
                float _2113 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2111 = _2113;
            }
            float _2115 = _2111;
            bool _2117 = !_161;
            float _2119 = _2115;
            if (!_2117)
            {
                float _2121 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2123 = log2(_2121);
                float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2127 = _2125 + 1.0;
                float _2129 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2131 = _2123 * _2101;
                float _2133 = 1.0 / _2127;
                float _2135 = _2129 * 0.693147182464599609375;
                float _2137 = exp2(_2131);
                float _2139 = 1.0 / _2135;
                float _2141 = _2137 + (-1.0);
                float _2143 = -_2141;
                float _2145 = fma(_2143, _2139, _2101);
                float _2147 = _2145 * _2133;
                float _2149 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2119 = _2149;
            }
            float _2151 = _2119;
            float _2153 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2155 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2157 = !_161;
            if (!_2157)
            {
                float _2159 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2161 = log2(_2159);
                float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2165 = _2163 + 1.0;
                float _2167 = 1.0 / _2165;
                float _2169 = _2161 * _2101;
                float _2171 = exp2(_2169);
                float _2173 = -_2171;
                float _2175 = _2173 + 1.0;
                float _2177 = _2175 * _2167;
                _2103 = _2177;
            }
            float _2179 = _2103;
            float _2181 = fma(_2179, _149, _2155);
            float _2183 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2185 = fma(_2179, _147, _2153);
            float _2187 = -_359;
            float _2189 = _2187 + _2181;
            float _2191 = fma(_2179, _151, _2183);
            float _2193 = -_365;
            float _2195 = _2193 + _2185;
            float _2197 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2199 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2201 = -_373;
            float _2203 = _2201 + _2191;
            float _2205 = _2189 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2197);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2199);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2205);
            float _2213 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2207);
            float _2215 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
            float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _1935 = _2223;
            _623 = _2213;
            _625 = _2215;
            _627 = _2217;
            _2085 = _2215;
            _2091 = _2213;
            _2099 = _2217;
        }
        float _2225 = _1935;
        float _2227 = _623;
        float _2229 = _625;
        float _2231 = _627;
        float _2233 = _2085;
        float _2235 = _2091;
        float _2237 = _2099;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2025);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2001 * _2241;
        float _2247 = _1991 * _2241;
        float _2249 = _2013 * _2241;
        bool _2251 = !_2243;
        _2069 = _2233;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2253 * _2231;
            float _2261 = _2247 * _2255;
            float _2263 = fma(_2245, _2257, _2261);
            float _2265 = fma(_2249, _2259, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1985);
            float _2271 = fma(_2235, _2267, _1983);
            float _2273 = fma(_2237, _2267, _1987);
            _2063 = _2269;
            _2065 = _2271;
            _2067 = _2273;
        }
    }
    float _2275 = _2063;
    float _2277 = _2065;
    float _2279 = _2067;
    float _2281 = _2069;
    bool _2283 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2285 = isnan(0.5);
    bool _2287 = _2283 || _2285;
    bool _2289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2291 = _2287 || _2289;
    float _2293 = -_1389;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2297 = -_1387;
    float _2299 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2301 = -_1423;
    float _2303 = fma(_2301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2305 = _2299;
    float _2307 = _2295;
    float _2309 = _2303;
    float _2311 = _2281;
    if (!_2291)
    {
        float _2313 = -_1387;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
        float _2317 = -_1389;
        float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
        float _2321 = -_1423;
        float _2323 = fma(_2321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
        float _2325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2329 = _2315 + _2327;
        float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2333 = _2319 + _2331;
        float _2335 = -_1287;
        float _2337 = _2335 + _2279;
        float _2339 = -_1169;
        float _2341 = _2339 + _2277;
        float _2343 = _2329 * _2329;
        float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2347 = _2323 + _2345;
        float _2349 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2351 = fma(_2333, _2333, _2343);
        float _2353 = fma(_2347, _2347, _2351);
        float _2355 = 1.0 / _1719;
        float _2357 = sqrt(_2353);
        float _2359 = _2349 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2361 = precise::min(_2357, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2363 = _2361 * _2325;
        float _2365 = -_1283;
        float _2367 = _2365 + _2275;
        float _2369 = _2363 * _2355;
        float _2371 = _2359 * _2369;
        float _2373 = _2337 * _2369;
        float _2375 = fma(_2367, _2371, _2319);
        float _2377 = fma(_2341, _2371, _2315);
        float _2379 = fma(_2359, _2373, _2323);
        _2305 = _2377;
        _2307 = _2375;
        _2309 = _2379;
    }
    float _2381 = _2305;
    float _2383 = _2307;
    float _2385 = _2309;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2389 = _2381 + _2387;
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2393 = _2383 + _2391;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2397 = _2385 + _2395;
    float _2399 = _2389 * _2389;
    float _2401 = fma(_2393, _2393, _2399);
    float _2403 = fma(_2397, _2397, _2401);
    float _2405 = rsqrt(_2403);
    float _2407 = sqrt(_2403);
    float _2409 = _2405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2411 = _2393 * _2409;
    float _2413 = _2397 * _2409;
    float _2415 = _2411 * _2411;
    float _2417 = _2413 * _2413;
    float _2419 = _2415 + _2417;
    float _2421 = sqrt(_2419);
    bool _2423 = _2421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2427 = _2421 + _2425;
    float _2429 = _2405;
    float _2431 = _2419;
    float _2433 = _2427;
    float _2435 = _2389;
    if (_2423)
    {
        float _2437 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (_2423)
    {
        float _2441 = rsqrt(_2419);
        _2431 = _2441;
    }
    float _2443 = _2431;
    float _2445 = _2443;
    if (_2423)
    {
        float _2447 = _2427 * _2439;
        _2433 = _2447;
    }
    float _2449 = _2433;
    if (_2423)
    {
        float _2451 = _2449 * 0.15915493667125701904296875;
        _2311 = _2451;
    }
    float _2453 = _2311;
    float _2455 = _2397;
    float _2457 = _2453;
    if (_2423)
    {
        float _2459 = _2453 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        _2455 = _2461;
    }
    float _2463 = _2455;
    float _2465 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2467 = precise::max(0.0, _2465);
    float _2469 = _2439;
    float _2471 = _2467;
    if (_2423)
    {
        float _2473 = _2453 * 6.283185482025146484375;
        float _2475 = cos(_2473);
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = -_2409;
    float _2481 = -_2467;
    float _2483 = fma(_2389, _2479, _2481);
    if (_2423)
    {
        float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2485;
    }
    float _2487 = _2435;
    float _2489 = _2487;
    float _2491 = _2463;
    if (_2423)
    {
        float _2493 = fma(_2463, _2487, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2489 = _2493;
    }
    float _2495 = _2489;
    float _2497 = _2495;
    if (!_2423)
    {
        _2491 = _2411;
    }
    float _2499 = _2491;
    float _2501 = _2499;
    float _2503 = _2477;
    if (_2423)
    {
        float _2505 = _2477 + (-1.0);
        _2471 = _2505;
    }
    float _2507 = _2471;
    float _2509 = _2507;
    if (_2423)
    {
        float _2511 = _2443 * _2495;
        _439 = _2511;
    }
    float _2513 = _439;
    if (!_2423)
    {
        _2497 = _2483;
    }
    float _2515 = _2497;
    float _2517 = _2515;
    if (_2423)
    {
        float _2519 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2457 = _2519;
    }
    float _2521 = _2457;
    if (_2423)
    {
        float _2523 = _2411 * _2513;
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (!_2423)
    {
        _2509 = _2413;
    }
    float _2527 = _2509;
    float _2529 = _2527;
    if (_2423)
    {
        float _2531 = _2413 * _2513;
        _2529 = _2531;
    }
    float _2533 = _2529;
    if (!_2423)
    {
        _2445 = _2415;
    }
    float _2535 = _2445;
    float _2537 = _2535;
    if (_2423)
    {
        float _2539 = fma(_2483, _2477, _2521);
        _2517 = _2539;
    }
    float _2541 = _2517;
    if (_2423)
    {
        float _2543 = _2525 * _2525;
        _2537 = _2543;
    }
    float _2545 = _2537;
    if (!_2423)
    {
        _2503 = _2417;
    }
    float _2547 = _2503;
    float _2549 = _2547;
    if (_2423)
    {
        float _2551 = _2533 * _2533;
        _2549 = _2551;
    }
    float _2553 = _2549;
    float _2555 = fma(_2541, _2541, _2545);
    float _2557 = _2555 + _2553;
    float _2559 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2563 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2561);
    float _2565 = precise::clamp(_2563, 0.0, 1.0);
    float _2567 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2571 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2559);
    float _2573 = rsqrt(_2557);
    float _2575 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2567);
    float _2577 = -_2565;
    float _2579 = _2577 + 1.0;
    float _2581 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2571);
    float _2583 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2585 = _2381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2587 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2575);
    float _2589 = _2581 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2591 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2583);
    float _2593 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2585);
    float _2595 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2597 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2599 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2591);
    float _2601 = fma(_2385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2593);
    float _2603 = abs(_2579);
    float _2605 = log2(_2603);
    float _2607 = -_2597;
    float _2609 = fma(_2607, _2569, 1.0);
    float _2611 = _2573 * _2525;
    float _2613 = _2599 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2615 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2617 = _2573 * _2541;
    float _2619 = _2573 * _2533;
    float _2621 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2615);
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2627 = log2(_2609);
    float _2629 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2631 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2623);
    float _2633 = -_2625;
    float _2635 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2633);
    float _2637 = _2617 + 1.0;
    float _2639 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2631);
    float _2641 = -_2619;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2635);
    float _2645 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2647 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2649 = 1.0 / _2639;
    float _2651 = fma(_2643, -0.5, 0.5);
    float _2653 = fma(_2643, 0.5, 0.5);
    float _2655 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2647);
    float _2657 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2629);
    float _2659 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2655);
    float _2661 = exp2(_2645);
    float _2663 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2657);
    float _2665 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2659);
    float _2667 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2663);
    float _2669 = _2627 * 0.693147182464599609375;
    float _2671 = sqrt(_2651);
    float _2673 = fma(_2653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2675 = _2665 * _2649;
    float _2677 = _2667 * _2649;
    float _2679 = fma(_2653, _2673, -0.212114393711090087890625);
    float _2681 = fma(_2675, 0.5, 0.5);
    float _2683 = fma(_2677, -0.5, 0.5);
    float _2685 = -_2617;
    float _2687 = fma(_2661, _2637, _2685);
    float _2689 = fma(_2653, _2679, 1.570728778839111328125);
    float _2691 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2693 = fma(_2687, 0.5, 0.5);
    float _2695 = _2671 * 0.636619746685028076171875;
    float3 _7040 = float3(_2681, _2683, _2691);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).x;
    float _2699 = -_2689;
    float _2701 = fma(_2695, _2699, 1.0);
    float3 _7056 = float3(_2681, _2683, _2691);
    float4 _2704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7056, float3(0.0), isnan(_7056)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7056, float3(0.0), isnan(_7056)), level(0.0)).xyzw;
    float _2706 = _2704.x;
    float _2708 = _2704.y;
    float _2710 = _2704.z;
    float _2712 = _2704.w;
    float2 _7073 = float2(_2701, _2693);
    float3 _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7073, float2(0.0), isnan(_7073)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7073, float2(0.0), isnan(_7073)), level(0.0)).xyz;
    float _2718 = _2716.x;
    float _2720 = _2716.y;
    float _2722 = _2716.z;
    float _2724 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2726 = _2595 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2728 = fma(_2613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2726);
    float _2730 = exp2(_2724);
    float _2732 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2728);
    float _2736 = fma(_2621, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2734);
    out.m_45.x = _2732;
    float _2738 = _2736 + _2639;
    out.gl_Position.x = _2665;
    out.gl_Position.y = _2667;
    out.gl_Position.z = _2736;
    out.gl_Position.w = _2639;
    float _2740 = _2738 * 0.5;
    float _2742 = -_2730;
    float _2744 = _2742 + 1.0;
    float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2740;
    out.m_64.w = _2639;
    float _2748 = _2746 * _2697;
    float _2750 = -_2746;
    float _2752 = _2750 + 1.0;
    float _2754 = _2712 * _2748;
    float _2756 = _2712 * _2752;
    float _2758 = _2722 * _2748;
    float _2760 = fma(_2718, _2754, _2706);
    float _2762 = fma(_2720, _2754, _2708);
    float _2764 = fma(_2712, _2758, _2710);
    out.m_66.x = _2760;
    out.m_66.y = _2762;
    out.m_66.z = _2764;
    out.m_66.w = _2756;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

