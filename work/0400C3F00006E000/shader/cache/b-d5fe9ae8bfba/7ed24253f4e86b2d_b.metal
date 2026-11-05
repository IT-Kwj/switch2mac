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
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _833 = false;
    bool _631 = false;
    bool _481 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_143);
        out.gl_Position.z = _1978;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _149;
    if (!_165)
    {
        float _169 = _149 * _149;
        float _171 = _169 * 0.5;
        _145 = _171;
    }
    float _173 = _145;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    int _189 = as_type<int>(_147) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_147) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_165;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _149 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _149);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _227;
        _207 = _237;
        _125 = _225;
    }
    float _239 = _123;
    float _241 = _207;
    float _243 = _125;
    bool _245 = !_165;
    float _247 = _239;
    float _249 = _243;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _247 = _263;
        _249 = _257;
        _167 = _269;
    }
    float _271 = _247;
    float _273 = _249;
    float _275 = _167;
    float _277 = _273;
    float _279 = _271;
    if (!_165)
    {
        _277 = _121;
    }
    float _281 = _277;
    float _283 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _281;
    if (!_165)
    {
        float _287 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _287;
    }
    float _289 = _279;
    bool _291 = !_165;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _121 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _121);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_165;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _121 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_275, _153, _283);
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_349, _153, _351);
    float _361 = fma(_275, _151, _353);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _151, _357);
    float _367 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = -_359;
    float _371 = _355 + _369;
    float _373 = fma(_349, _155, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = fma(_275, _155, _367);
    float _381 = _371 * _371;
    float _383 = in.m_52.w;
    float _385 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = -_373;
    float _389 = _379 + _387;
    float _391 = fma(_377, _377, _381);
    float _393 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _399 = fma(_389, _389, _391);
    float _401 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = in.m_42.z;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _413 = sqrt(_399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    bool _419 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_413);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_361, _383, _403);
    float _431 = fma(_355, _383, _405);
    float _433 = fma(_379, _383, _407);
    float _435 = _415;
    float _437 = _411;
    float _439 = _417;
    float _441 = _379;
    if (!_427)
    {
        bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _445 = !_443;
        if (!_445)
        {
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
            float _465 = _459 * _459;
            float _467 = fma(_461, _461, _465);
            float _469 = fma(_463, _463, _467);
            float _471 = rsqrt(_469);
            float _473 = _471 * 9.9999999747524270787835121154785e-07;
            float _475 = _461 * _473;
            float _477 = _459 * _473;
            float _479 = _463 * _473;
            _435 = _477;
            _437 = _475;
            _439 = _479;
            _481 = true;
        }
        else
        {
            float _483 = _153 * _153;
            float _485 = fma(_151, _151, _483);
            float _487 = fma(_155, _155, _485);
            float _489 = sqrt(_487);
            bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
            bool _493 = isnan(_489);
            bool _495 = _491 || _493;
            bool _497 = isnan(9.9999999747524270787835121154785e-07);
            bool _499 = _495 || _497;
            if (!_499)
            {
                float _501 = _405 * _405;
                float _503 = fma(_403, _403, _501);
                float _505 = fma(_407, _407, _503);
                float _507 = sqrt(_505);
                bool _509 = _507 >= 9.9999999747524270787835121154785e-07;
                bool _511 = isnan(_507);
                bool _513 = _509 || _511;
                bool _515 = isnan(9.9999999747524270787835121154785e-07);
                bool _517 = _513 || _515;
                if (!_517)
                {
                    float _519 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _519);
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _527 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _527 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _527 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _531;
                    _437 = _529;
                    _439 = _533;
                    _481 = true;
                }
                else
                {
                    float _535 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _539 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _541 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                    float _551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                    float _553 = _547 * _547;
                    float _555 = fma(_549, _549, _553);
                    float _557 = fma(_551, _551, _555);
                    float _559 = rsqrt(_557);
                    float _561 = _559 * 9.9999999747524270787835121154785e-07;
                    float _563 = _549 * _561;
                    float _565 = _547 * _561;
                    float _567 = _551 * _561;
                    _435 = _565;
                    _437 = _563;
                    _439 = _567;
                    _481 = true;
                }
            }
            else
            {
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _571 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _573 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _575);
                float _583 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _577);
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
                float _587 = _581 * _581;
                float _589 = fma(_583, _583, _587);
                float _591 = fma(_585, _585, _589);
                float _593 = rsqrt(_591);
                float _595 = _593 * 9.9999999747524270787835121154785e-07;
                float _597 = _583 * _595;
                float _599 = _581 * _595;
                float _601 = _585 * _595;
                _435 = _599;
                _437 = _597;
                _439 = _601;
            }
        }
    }
    _481 = false;
    float _603 = _435;
    float _605 = _437;
    float _607 = _439;
    bool _609 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _611 = !_609;
    float _629;
    if (!_611)
    {
        float _613 = in.m_54.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_87);
        float _635 = 1.0 / _633;
        float _637 = _121 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = _639 + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _639 + _645;
    bool _649 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _651 = isnan(_639);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _669;
    float _673 = 1.0 / _667;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _677 = 1.0 / _663;
    float _679 = 1.0 / _671;
    float _681 = _643 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _685 = _639 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = _685 * _673;
    float _693 = -_659;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _697;
    float _701 = _647 * _679;
    bool _703 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_639);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_689, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _717 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_639);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _733 = fma(_699, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _735 = _713 * _695;
    bool _737 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _739 = isnan(_639);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -_713;
    float _751 = _749 + 1.0;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    float _761 = _727 * _751;
    float _763 = fma(_755, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = fma(_731, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _767 = _747 * _759;
    float _769 = in.m_52.x;
    float _771 = in.m_52.y;
    float _773 = -_747;
    float _775 = _773 + 1.0;
    float _777 = _715 * _767;
    float _779 = _733 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _785;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _777);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _793 = fma(_783, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _795 = fma(_787, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _797 = fma(_763, _761, _789);
    float _799 = fma(_765, _761, _791);
    float _801 = fma(_793, _735, _797);
    float _803 = fma(_795, _735, _799);
    float _805 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _807 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].y, _803);
    float _809 = _805 * _769;
    float _811 = _807 * _771;
    bool _813 = !_675;
    float _831;
    if (!_813)
    {
        float _815 = in.m_54.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_87);
        float _837 = 1.0 / _835;
        float _839 = _121 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _847 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _849 = _603 * _603;
    float _851 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _853 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _855 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _847);
    float _857 = fma(_605, _605, _849);
    float _859 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    float _861 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _863 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    float _865 = fma(_607, _607, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _873 = rsqrt(_865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _867 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _869 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _871 + _883;
    float _887 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _877 * _877;
    float _891 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _893 = fma(_881, _881, _889);
    float _895 = fma(_885, _885, _893);
    float _897 = _873 * _607;
    float _899 = _873 * _605;
    float _901 = _873 * _603;
    float _903 = rsqrt(_895);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _907 = _897 * _905;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _911 = _901 * _909;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _915 = -_907;
    float _917 = fma(_899, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _899 * _919;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _925 = -_911;
    float _927 = fma(_897, _923, _925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _933 = -_921;
    float _935 = fma(_901, _931, _933);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _939 = _877 * _903;
    float _941 = _881 * _903;
    float _943 = -_939;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _947 = -_941;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _951 = _945 * _945;
    float _953 = fma(_949, _949, _951);
    float _955 = _885 * _903;
    float _957 = _917 * _917;
    float _959 = -_955;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _963 = fma(_961, _961, _953);
    float _965 = fma(_927, _927, _957);
    float _967 = sqrt(_963);
    float _969 = fma(_935, _935, _965);
    float _971 = rsqrt(_969);
    float _973 = _903 * _967;
    float _975 = _887 * _973;
    float _977 = _891 * _973;
    float _979 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _981 = _979 * 0.5;
    float _983 = _917 * _971;
    float _985 = _975 * _937;
    float _987 = _935 * _971;
    float _989 = _977 * _929;
    float _991 = _927 * _971;
    float _993 = _899 * _983;
    float _995 = _985 * _897;
    float _997 = _901 * _987;
    float _999 = _985 * _899;
    float _1001 = -_993;
    float _1003 = fma(_901, _991, _1001);
    float _1005 = fma(_989, _987, _995);
    float _1007 = -_997;
    float _1009 = fma(_897, _983, _1007);
    float _1011 = fma(_989, _991, _999);
    float _1013 = _897 * _991;
    float _1015 = fma(_981, _1003, _1005);
    float _1017 = _985 * _901;
    float _1019 = fma(_981, _1009, _1011);
    float _1021 = -_1013;
    float _1023 = fma(_899, _987, _1021);
    float _1025 = _871 + _1015;
    float _1027 = fma(_989, _983, _1017);
    float _1029 = _869 + _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = fma(_981, _1023, _1027);
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = _867 + _1035;
    float _1045 = fma(_1039, _1039, _1041);
    float _1047 = sqrt(_1045);
    bool _1049 = _1047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = _1041;
    float _1053 = _1035;
    float _1055 = _867;
    float _1057 = _1025;
    float _1059 = _1045;
    if (!_1049)
    {
        _1051 = _1029;
    }
    float _1061 = _1051;
    float _1063 = _1061;
    if (!_1049)
    {
        _1053 = _1025;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (!_1049)
    {
        _1055 = _1043;
    }
    float _1069 = _1055;
    bool _1071 = !_1049;
    float _1073 = _1069;
    if (!_1071)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1079 = _1047 + _1077;
        float _1081 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = rsqrt(_1045);
        float _1085 = _1079 * _1075;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = _1087 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1091 + (-1.0);
        float _1099 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = fma(_1095, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1103 = fma(_1043, _1091, _1099);
        float _1105 = _1083 * _1101;
        float _1107 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1109 = fma(_1033, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1103;
        _1063 = _1107;
        _1067 = _1109;
        _1057 = _1087;
    }
    float _1111 = _1073;
    float _1113 = _1063;
    float _1115 = _1067;
    float _1117 = _1057;
    float _1119 = -_939;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1123 = -_941;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1113);
    float _1127 = -_955;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1121 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1125 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1153 = _1137 * _1151;
    float _1155 = _1141 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 * _1155;
    float _1161 = _1157 + _1159;
    float _1163 = sqrt(_1161);
    bool _1165 = _1163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = _1163 + _1167;
    float _1171 = _1145;
    float _1173 = _1161;
    float _1175 = _1169;
    float _1177 = _1151;
    if (_1165)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1179;
    }
    float _1181 = _1171;
    if (_1165)
    {
        float _1183 = rsqrt(_1161);
        _1173 = _1183;
    }
    float _1185 = _1173;
    float _1187 = _1181;
    float _1189 = _1185;
    if (_1165)
    {
        float _1191 = _1169 * _1181;
        _1175 = _1191;
    }
    float _1193 = _1175;
    if (_1165)
    {
        float _1195 = _1193 * 0.15915493667125701904296875;
        _1059 = _1195;
    }
    float _1197 = _1059;
    float _1199 = _1117;
    if (_1165)
    {
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1209 = precise::max(0.0, _1207);
    float _1211 = _1033;
    float _1213 = _1209;
    if (_1165)
    {
        float _1215 = _1197 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = -_1151;
    float _1223 = -_1209;
    float _1225 = fma(_1133, _1221, _1223);
    if (_1165)
    {
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1227;
    }
    float _1229 = _1187;
    float _1231 = sqrt(_1147);
    float _1233 = _1205;
    float _1235 = _1229;
    if (_1165)
    {
        float _1237 = fma(_1205, _1229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = _1239;
    if (!_1165)
    {
        _1235 = _1153;
    }
    float _1243 = _1235;
    float _1245 = _1243;
    float _1247 = _1219;
    if (_1165)
    {
        float _1249 = _1219 + (-1.0);
        _1213 = _1249;
    }
    float _1251 = _1213;
    float _1253 = _1251;
    if (_1165)
    {
        float _1255 = _1185 * _1239;
        _441 = _1255;
    }
    float _1257 = _441;
    if (!_1165)
    {
        _1241 = _1225;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (_1165)
    {
        float _1263 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1263;
    }
    float _1265 = _1177;
    if (_1165)
    {
        float _1267 = _1153 * _1257;
        _1245 = _1267;
    }
    float _1269 = _1245;
    if (!_1165)
    {
        _1253 = _1155;
    }
    float _1271 = _1253;
    float _1273 = _1271;
    if (_1165)
    {
        float _1275 = _1155 * _1257;
        _1273 = _1275;
    }
    float _1277 = _1273;
    if (!_1165)
    {
        _1189 = _1157;
    }
    float _1279 = _1189;
    float _1281 = _1279;
    if (_1165)
    {
        float _1283 = fma(_1225, _1219, _1265);
        _1261 = _1283;
    }
    float _1285 = _1261;
    if (_1165)
    {
        float _1287 = _1269 * _1269;
        _1281 = _1287;
    }
    float _1289 = _1281;
    if (!_1165)
    {
        _1247 = _1159;
    }
    float _1291 = _1247;
    float _1293 = _1291;
    if (_1165)
    {
        float _1295 = _1277 * _1277;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = -_1309;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1325 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1321);
    float _1331 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1333 = abs(_1319);
    float _1335 = log2(_1333);
    float _1337 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1331);
    float _1343 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1345 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1349 = _1313 * _1269;
    float _1351 = _1313 * _1285;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1359 = _1313 * _1277;
    float _1361 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1347);
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = -_1357;
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1365);
    float _1369 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1323, 1.0);
    float _1377 = -_1359;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1367);
    float _1381 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1385 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = fma(_1379, -0.5, 0.5);
    float _1389 = log2(_1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1379, 0.5, 0.5);
    float _1397 = _1351 + 1.0;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = 1.0 / _1383;
    float _1405 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1407 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1409 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1411 = exp2(_1381);
    float _1413 = _1389 * 0.693147182464599609375;
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1417 = sqrt(_1387);
    float _1419 = fma(_1395, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1421 = _1407 * _1403;
    float _1423 = _1409 * _1403;
    float _1425 = fma(_1395, _1419, -0.212114393711090087890625);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = fma(_1423, -0.5, 0.5);
    float _1431 = -_1351;
    float _1433 = fma(_1411, _1397, _1431);
    float _1435 = fma(_1395, _1425, 1.570728778839111328125);
    float _1437 = _1417 * 0.636619746685028076171875;
    float _1439 = fma(_1433, 0.5, 0.5);
    float _1441 = -_1435;
    float _1443 = fma(_1437, _1441, 1.0);
    float3 _4102 = float3(_1427, _1429, _1415);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).x;
    float3 _4113 = float3(_1427, _1429, _1415);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4113, float3(0.0), isnan(_4113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4113, float3(0.0), isnan(_4113)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _4130 = float2(_1443, _1439);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4130, float2(0.0), isnan(_4130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4130, float2(0.0), isnan(_4130)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_54.x;
    float _1470 = in.m_54.y;
    float _1472 = in.m_54.z;
    float _1474 = in.m_54.w;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1478 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1482 = _1480 != 0;
    out.m_56.x = _1137;
    out.m_56.y = _1133;
    out.m_56.z = _1141;
    float _1484 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1486 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1500 = 1.0 / _1490;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1510 = _1508 != 0;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1506);
    float _1518 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1520 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1522 = _1474 > 0.5;
    float _1524 = _1516 + _1383;
    float _1526 = fma(_1518, -2.0, _1492);
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1530 = -_1498;
    float _1532 = fma(_1520, 2.0, _1530);
    float _1534 = _1520;
    float _1536 = _1528;
    float _1538 = _1490;
    if (!_1482)
    {
        _1534 = _1470;
    }
    float _1540 = _1534;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1544 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1528);
    bool _1546 = _1468 > 0.5;
    float _1548 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1526);
    float _1550 = _1540;
    if (_1482)
    {
        _1550 = _1468;
    }
    float _1552 = _1550;
    float _1554 = _203 * _887;
    float _1556 = _1554;
    if (!_1482)
    {
        _1536 = _1472;
    }
    float _1558 = _1536;
    float _1560 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    float _1562 = _1558;
    if (!_1482)
    {
        _1538 = _1472;
    }
    float _1564 = _1538;
    float _1566 = _1524 * 0.5;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    float _1572 = _1564;
    if (_1482)
    {
        _1562 = _1470;
    }
    float _1574 = _1562;
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _1516;
    out.gl_Position.w = _1383;
    if (_1482)
    {
        _1572 = _1470;
    }
    float _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1580 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1582 = _1470 > 0.5;
    float _1584 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1578);
    float _1586 = -_199;
    int _1588 = _1546 ? as_type<int>(_1586) : as_type<int>(_199);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1590;
    if (_1496)
    {
        float _1594 = -_1554;
        float _1596 = _1582 ? _1594 : _1554;
        _1556 = _1596;
    }
    float _1598 = _1556;
    float _1600 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1592 * _1500;
    bool _1604 = _1472 > 0.5;
    float _1606 = _1598 + (-0.5);
    bool _1608 = !_1504;
    float _1610 = _1608 ? _199 : as_type<float>(_1588);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1614 = _841 + _1612;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1618 = -_121;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1532);
    float _1622 = -_1600;
    float _1624 = -_1548;
    float _1626 = fma(_1622, _1606, _1624);
    float _1628 = _1610 + 0.5;
    float _1630 = fma(_1602, _1614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1616);
    bool _1634 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_841);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = fma(_1580, _1628, _1620);
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1650 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_841);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -_1644;
    float _1664 = _1662 + 1.0;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1668 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1584);
    float _1670 = _1660 * _1664;
    float _1672 = -_203;
    int _1674 = _1522 ? as_type<int>(_1672) : as_type<int>(_203);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1666);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1680 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = _1630 * _1670;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = -_1678;
    float _1690 = fma(_1680, 2.0, _1688);
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1514;
    float _1698 = _1696 ? _203 : as_type<float>(_1674);
    float _1700 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1702 = fma(_1694, _1598, _1626);
    float _1704 = -_199;
    int _1706 = _1604 ? as_type<int>(_1704) : as_type<int>(_199);
    float _1708 = -_1570;
    float _1710 = fma(_1610, _1708, _1646);
    float _1712 = _899 * _1700;
    float _1714 = exp2(_1486);
    bool _1716 = !_1510;
    float _1718 = _1716 ? _199 : as_type<float>(_1706);
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1722 = _901 * _1700;
    float _1724 = _897 * _1700;
    float _1726 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1682, -2.0, _1720);
    float _1730 = _1718 + 0.5;
    float _1732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1676);
    float _1734 = -_121;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1690);
    float _1738 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1632);
    float _1740 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    float _1742 = -_1732;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1726, _1730, _1736);
    float _1748 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1750 = _1698 + (-0.5);
    float _1752 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1754 = -_1744;
    float _1756 = fma(_1718, _1754, _1746);
    float _1758 = -_1748;
    float _1760 = -_1740;
    float _1762 = fma(_1758, _1750, _1760);
    float _1764 = fma(_987, _1752, _1724);
    float _1766 = -_1714;
    float _1768 = _1766 + 1.0;
    float _1770 = fma(_991, _1752, _1712);
    float _1772 = -_1738;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1778 = -_1660;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_983, _1752, _1722);
    float _1784 = _1003 + _1764;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1788 = _1407 + _1383;
    float _1790 = fma(_1698, _1774, _1762);
    float _1792 = _1009 + _1770;
    float _1794 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1684);
    float _1798 = _1023 + _1782;
    float _1800 = _1788 * 0.5;
    out.m_58.x = _1710;
    out.m_58.y = _1702;
    out.m_58.z = _1756;
    out.m_58.w = _1790;
    float _1802 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1796);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1814 = _1383 * 0.5;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1826 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1832 = fma(_1409, -0.5, _1814);
    out.m_60.x = _1822;
    out.m_60.y = _1794;
    out.m_60.z = _1826;
    out.m_60.w = _1816;
    out.m_62.x = _1818;
    out.m_62.y = _1820;
    out.m_62.z = _1828;
    out.m_62.w = _1830;
    out.m_64.x = _1792;
    out.m_64.y = _1798;
    out.m_64.z = _1784;
    out.m_66.x = _1800;
    out.m_66.y = _1832;
    out.m_66.z = _1566;
    out.m_66.w = _1383;
    out.m_45.x = _1824;
    float _1834 = _1786 * _1445;
    float _1836 = -_1786;
    float _1838 = _1836 + 1.0;
    float _1840 = _1456 * _1834;
    float _1842 = _1466 * _1834;
    float _1844 = _1456 * _1838;
    float _1846 = fma(_1462, _1840, _1450);
    float _1848 = fma(_1464, _1840, _1452);
    float _1850 = fma(_1456, _1842, _1454);
    out.m_68.x = _1846;
    out.m_68.y = _1848;
    out.m_68.z = _1850;
    out.m_68.w = _1844;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _833 = false;
    bool _631 = false;
    bool _481 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_143);
        out.gl_Position.z = _1978;
    }
    if (_135)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _149;
    if (!_165)
    {
        float _169 = _149 * _149;
        float _171 = _169 * 0.5;
        _145 = _171;
    }
    float _173 = _145;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    int _189 = as_type<int>(_147) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_147) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_165;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _149 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _149);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _227;
        _207 = _237;
        _125 = _225;
    }
    float _239 = _123;
    float _241 = _207;
    float _243 = _125;
    bool _245 = !_165;
    float _247 = _239;
    float _249 = _243;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _247 = _263;
        _249 = _257;
        _167 = _269;
    }
    float _271 = _247;
    float _273 = _249;
    float _275 = _167;
    float _277 = _273;
    float _279 = _271;
    if (!_165)
    {
        _277 = _121;
    }
    float _281 = _277;
    float _283 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _281;
    if (!_165)
    {
        float _287 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _287;
    }
    float _289 = _279;
    bool _291 = !_165;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _121 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _121);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_165;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _121 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_275, _153, _283);
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_349, _153, _351);
    float _361 = fma(_275, _151, _353);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _151, _357);
    float _367 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = -_359;
    float _371 = _355 + _369;
    float _373 = fma(_349, _155, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = fma(_275, _155, _367);
    float _381 = _371 * _371;
    float _383 = in.m_52.w;
    float _385 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = -_373;
    float _389 = _379 + _387;
    float _391 = fma(_377, _377, _381);
    float _393 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _399 = fma(_389, _389, _391);
    float _401 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = in.m_42.z;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _413 = sqrt(_399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    bool _419 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_413);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_361, _383, _403);
    float _431 = fma(_355, _383, _405);
    float _433 = fma(_379, _383, _407);
    float _435 = _415;
    float _437 = _411;
    float _439 = _417;
    float _441 = _379;
    if (!_427)
    {
        bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _445 = !_443;
        if (!_445)
        {
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
            float _465 = _459 * _459;
            float _467 = fma(_461, _461, _465);
            float _469 = fma(_463, _463, _467);
            float _471 = rsqrt(_469);
            float _473 = _471 * 9.9999999747524270787835121154785e-07;
            float _475 = _461 * _473;
            float _477 = _459 * _473;
            float _479 = _463 * _473;
            _435 = _477;
            _437 = _475;
            _439 = _479;
            _481 = true;
        }
        else
        {
            float _483 = _153 * _153;
            float _485 = fma(_151, _151, _483);
            float _487 = fma(_155, _155, _485);
            float _489 = sqrt(_487);
            bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
            bool _493 = isnan(_489);
            bool _495 = _491 || _493;
            bool _497 = isnan(9.9999999747524270787835121154785e-07);
            bool _499 = _495 || _497;
            if (!_499)
            {
                float _501 = _405 * _405;
                float _503 = fma(_403, _403, _501);
                float _505 = fma(_407, _407, _503);
                float _507 = sqrt(_505);
                bool _509 = _507 >= 9.9999999747524270787835121154785e-07;
                bool _511 = isnan(_507);
                bool _513 = _509 || _511;
                bool _515 = isnan(9.9999999747524270787835121154785e-07);
                bool _517 = _513 || _515;
                if (!_517)
                {
                    float _519 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _519);
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _527 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _527 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _527 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _531;
                    _437 = _529;
                    _439 = _533;
                    _481 = true;
                }
                else
                {
                    float _535 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _539 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _541 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                    float _551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                    float _553 = _547 * _547;
                    float _555 = fma(_549, _549, _553);
                    float _557 = fma(_551, _551, _555);
                    float _559 = rsqrt(_557);
                    float _561 = _559 * 9.9999999747524270787835121154785e-07;
                    float _563 = _549 * _561;
                    float _565 = _547 * _561;
                    float _567 = _551 * _561;
                    _435 = _565;
                    _437 = _563;
                    _439 = _567;
                    _481 = true;
                }
            }
            else
            {
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _571 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _573 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _575);
                float _583 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _577);
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
                float _587 = _581 * _581;
                float _589 = fma(_583, _583, _587);
                float _591 = fma(_585, _585, _589);
                float _593 = rsqrt(_591);
                float _595 = _593 * 9.9999999747524270787835121154785e-07;
                float _597 = _583 * _595;
                float _599 = _581 * _595;
                float _601 = _585 * _595;
                _435 = _599;
                _437 = _597;
                _439 = _601;
            }
        }
    }
    _481 = false;
    float _603 = _435;
    float _605 = _437;
    float _607 = _439;
    bool _609 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _611 = !_609;
    float _629;
    if (!_611)
    {
        float _613 = in.m_54.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_87);
        float _635 = 1.0 / _633;
        float _637 = _121 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = _639 + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _639 + _645;
    bool _649 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _651 = isnan(_639);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _669;
    float _673 = 1.0 / _667;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _677 = 1.0 / _663;
    float _679 = 1.0 / _671;
    float _681 = _643 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _685 = _639 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = _685 * _673;
    float _693 = -_659;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _697;
    float _701 = _647 * _679;
    bool _703 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_639);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_689, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _717 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_639);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _733 = fma(_699, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _735 = _713 * _695;
    bool _737 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _739 = isnan(_639);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -_713;
    float _751 = _749 + 1.0;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    float _761 = _727 * _751;
    float _763 = fma(_755, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = fma(_731, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _767 = _747 * _759;
    float _769 = in.m_52.x;
    float _771 = in.m_52.y;
    float _773 = -_747;
    float _775 = _773 + 1.0;
    float _777 = _715 * _767;
    float _779 = _733 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _785;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _777);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _793 = fma(_783, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _795 = fma(_787, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _797 = fma(_763, _761, _789);
    float _799 = fma(_765, _761, _791);
    float _801 = fma(_793, _735, _797);
    float _803 = fma(_795, _735, _799);
    float _805 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _807 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].y, _803);
    float _809 = _805 * _769;
    float _811 = _807 * _771;
    bool _813 = !_675;
    float _831;
    if (!_813)
    {
        float _815 = in.m_54.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_87);
        float _837 = 1.0 / _835;
        float _839 = _121 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _847 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _849 = _603 * _603;
    float _851 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _853 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _855 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _847);
    float _857 = fma(_605, _605, _849);
    float _859 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    float _861 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _863 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    float _865 = fma(_607, _607, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _873 = rsqrt(_865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _867 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _869 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _871 + _883;
    float _887 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _877 * _877;
    float _891 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _893 = fma(_881, _881, _889);
    float _895 = fma(_885, _885, _893);
    float _897 = _873 * _607;
    float _899 = _873 * _605;
    float _901 = _873 * _603;
    float _903 = rsqrt(_895);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _907 = _897 * _905;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _911 = _901 * _909;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _915 = -_907;
    float _917 = fma(_899, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _899 * _919;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _925 = -_911;
    float _927 = fma(_897, _923, _925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _933 = -_921;
    float _935 = fma(_901, _931, _933);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _939 = _877 * _903;
    float _941 = _881 * _903;
    float _943 = -_939;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _947 = -_941;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _951 = _945 * _945;
    float _953 = fma(_949, _949, _951);
    float _955 = _885 * _903;
    float _957 = _917 * _917;
    float _959 = -_955;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _963 = fma(_961, _961, _953);
    float _965 = fma(_927, _927, _957);
    float _967 = sqrt(_963);
    float _969 = fma(_935, _935, _965);
    float _971 = rsqrt(_969);
    float _973 = _903 * _967;
    float _975 = _887 * _973;
    float _977 = _891 * _973;
    float _979 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _981 = _979 * 0.5;
    float _983 = _917 * _971;
    float _985 = _975 * _937;
    float _987 = _935 * _971;
    float _989 = _977 * _929;
    float _991 = _927 * _971;
    float _993 = _899 * _983;
    float _995 = _985 * _897;
    float _997 = _901 * _987;
    float _999 = _985 * _899;
    float _1001 = -_993;
    float _1003 = fma(_901, _991, _1001);
    float _1005 = fma(_989, _987, _995);
    float _1007 = -_997;
    float _1009 = fma(_897, _983, _1007);
    float _1011 = fma(_989, _991, _999);
    float _1013 = _897 * _991;
    float _1015 = fma(_981, _1003, _1005);
    float _1017 = _985 * _901;
    float _1019 = fma(_981, _1009, _1011);
    float _1021 = -_1013;
    float _1023 = fma(_899, _987, _1021);
    float _1025 = _871 + _1015;
    float _1027 = fma(_989, _983, _1017);
    float _1029 = _869 + _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = fma(_981, _1023, _1027);
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = _867 + _1035;
    float _1045 = fma(_1039, _1039, _1041);
    float _1047 = sqrt(_1045);
    bool _1049 = _1047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = _1041;
    float _1053 = _1035;
    float _1055 = _867;
    float _1057 = _1025;
    float _1059 = _1045;
    if (!_1049)
    {
        _1051 = _1029;
    }
    float _1061 = _1051;
    float _1063 = _1061;
    if (!_1049)
    {
        _1053 = _1025;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (!_1049)
    {
        _1055 = _1043;
    }
    float _1069 = _1055;
    bool _1071 = !_1049;
    float _1073 = _1069;
    if (!_1071)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1079 = _1047 + _1077;
        float _1081 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = rsqrt(_1045);
        float _1085 = _1079 * _1075;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = _1087 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1091 + (-1.0);
        float _1099 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = fma(_1095, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1103 = fma(_1043, _1091, _1099);
        float _1105 = _1083 * _1101;
        float _1107 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1109 = fma(_1033, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1103;
        _1063 = _1107;
        _1067 = _1109;
        _1057 = _1087;
    }
    float _1111 = _1073;
    float _1113 = _1063;
    float _1115 = _1067;
    float _1117 = _1057;
    float _1119 = -_939;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1123 = -_941;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1113);
    float _1127 = -_955;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1121 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1125 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1153 = _1137 * _1151;
    float _1155 = _1141 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 * _1155;
    float _1161 = _1157 + _1159;
    float _1163 = sqrt(_1161);
    bool _1165 = _1163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = _1163 + _1167;
    float _1171 = _1145;
    float _1173 = _1161;
    float _1175 = _1169;
    float _1177 = _1151;
    if (_1165)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1179;
    }
    float _1181 = _1171;
    if (_1165)
    {
        float _1183 = rsqrt(_1161);
        _1173 = _1183;
    }
    float _1185 = _1173;
    float _1187 = _1181;
    float _1189 = _1185;
    if (_1165)
    {
        float _1191 = _1169 * _1181;
        _1175 = _1191;
    }
    float _1193 = _1175;
    if (_1165)
    {
        float _1195 = _1193 * 0.15915493667125701904296875;
        _1059 = _1195;
    }
    float _1197 = _1059;
    float _1199 = _1117;
    if (_1165)
    {
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1209 = precise::max(0.0, _1207);
    float _1211 = _1033;
    float _1213 = _1209;
    if (_1165)
    {
        float _1215 = _1197 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = -_1151;
    float _1223 = -_1209;
    float _1225 = fma(_1133, _1221, _1223);
    if (_1165)
    {
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1227;
    }
    float _1229 = _1187;
    float _1231 = sqrt(_1147);
    float _1233 = _1205;
    float _1235 = _1229;
    if (_1165)
    {
        float _1237 = fma(_1205, _1229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = _1239;
    if (!_1165)
    {
        _1235 = _1153;
    }
    float _1243 = _1235;
    float _1245 = _1243;
    float _1247 = _1219;
    if (_1165)
    {
        float _1249 = _1219 + (-1.0);
        _1213 = _1249;
    }
    float _1251 = _1213;
    float _1253 = _1251;
    if (_1165)
    {
        float _1255 = _1185 * _1239;
        _441 = _1255;
    }
    float _1257 = _441;
    if (!_1165)
    {
        _1241 = _1225;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (_1165)
    {
        float _1263 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1263;
    }
    float _1265 = _1177;
    if (_1165)
    {
        float _1267 = _1153 * _1257;
        _1245 = _1267;
    }
    float _1269 = _1245;
    if (!_1165)
    {
        _1253 = _1155;
    }
    float _1271 = _1253;
    float _1273 = _1271;
    if (_1165)
    {
        float _1275 = _1155 * _1257;
        _1273 = _1275;
    }
    float _1277 = _1273;
    if (!_1165)
    {
        _1189 = _1157;
    }
    float _1279 = _1189;
    float _1281 = _1279;
    if (_1165)
    {
        float _1283 = fma(_1225, _1219, _1265);
        _1261 = _1283;
    }
    float _1285 = _1261;
    if (_1165)
    {
        float _1287 = _1269 * _1269;
        _1281 = _1287;
    }
    float _1289 = _1281;
    if (!_1165)
    {
        _1247 = _1159;
    }
    float _1291 = _1247;
    float _1293 = _1291;
    if (_1165)
    {
        float _1295 = _1277 * _1277;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = -_1309;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1325 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1321);
    float _1331 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1333 = abs(_1319);
    float _1335 = log2(_1333);
    float _1337 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1331);
    float _1343 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1345 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1349 = _1313 * _1269;
    float _1351 = _1313 * _1285;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1359 = _1313 * _1277;
    float _1361 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1347);
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = -_1357;
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1365);
    float _1369 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1323, 1.0);
    float _1377 = -_1359;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1367);
    float _1381 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1385 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = fma(_1379, -0.5, 0.5);
    float _1389 = log2(_1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1379, 0.5, 0.5);
    float _1397 = _1351 + 1.0;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = 1.0 / _1383;
    float _1405 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1407 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1409 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1411 = exp2(_1381);
    float _1413 = _1389 * 0.693147182464599609375;
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1417 = sqrt(_1387);
    float _1419 = fma(_1395, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1421 = _1407 * _1403;
    float _1423 = _1409 * _1403;
    float _1425 = fma(_1395, _1419, -0.212114393711090087890625);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = fma(_1423, -0.5, 0.5);
    float _1431 = -_1351;
    float _1433 = fma(_1411, _1397, _1431);
    float _1435 = fma(_1395, _1425, 1.570728778839111328125);
    float _1437 = _1417 * 0.636619746685028076171875;
    float _1439 = fma(_1433, 0.5, 0.5);
    float _1441 = -_1435;
    float _1443 = fma(_1437, _1441, 1.0);
    float3 _4102 = float3(_1427, _1429, _1415);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).x;
    float3 _4113 = float3(_1427, _1429, _1415);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4113, float3(0.0), isnan(_4113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4113, float3(0.0), isnan(_4113)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _4130 = float2(_1443, _1439);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4130, float2(0.0), isnan(_4130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4130, float2(0.0), isnan(_4130)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_54.x;
    float _1470 = in.m_54.y;
    float _1472 = in.m_54.z;
    float _1474 = in.m_54.w;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1478 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1482 = _1480 != 0;
    out.m_56.x = _1137;
    out.m_56.y = _1133;
    out.m_56.z = _1141;
    float _1484 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1486 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1500 = 1.0 / _1490;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1510 = _1508 != 0;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1506);
    float _1518 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1520 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1522 = _1474 > 0.5;
    float _1524 = _1516 + _1383;
    float _1526 = fma(_1518, -2.0, _1492);
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1530 = -_1498;
    float _1532 = fma(_1520, 2.0, _1530);
    float _1534 = _1520;
    float _1536 = _1528;
    float _1538 = _1490;
    if (!_1482)
    {
        _1534 = _1470;
    }
    float _1540 = _1534;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1544 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1528);
    bool _1546 = _1468 > 0.5;
    float _1548 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1526);
    float _1550 = _1540;
    if (_1482)
    {
        _1550 = _1468;
    }
    float _1552 = _1550;
    float _1554 = _203 * _887;
    float _1556 = _1554;
    if (!_1482)
    {
        _1536 = _1472;
    }
    float _1558 = _1536;
    float _1560 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    float _1562 = _1558;
    if (!_1482)
    {
        _1538 = _1472;
    }
    float _1564 = _1538;
    float _1566 = _1524 * 0.5;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    float _1572 = _1564;
    if (_1482)
    {
        _1562 = _1470;
    }
    float _1574 = _1562;
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _1516;
    out.gl_Position.w = _1383;
    if (_1482)
    {
        _1572 = _1470;
    }
    float _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1580 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1582 = _1470 > 0.5;
    float _1584 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1578);
    float _1586 = -_199;
    int _1588 = _1546 ? as_type<int>(_1586) : as_type<int>(_199);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1590;
    if (_1496)
    {
        float _1594 = -_1554;
        float _1596 = _1582 ? _1594 : _1554;
        _1556 = _1596;
    }
    float _1598 = _1556;
    float _1600 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1592 * _1500;
    bool _1604 = _1472 > 0.5;
    float _1606 = _1598 + (-0.5);
    bool _1608 = !_1504;
    float _1610 = _1608 ? _199 : as_type<float>(_1588);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1614 = _841 + _1612;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1618 = -_121;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1532);
    float _1622 = -_1600;
    float _1624 = -_1548;
    float _1626 = fma(_1622, _1606, _1624);
    float _1628 = _1610 + 0.5;
    float _1630 = fma(_1602, _1614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1616);
    bool _1634 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_841);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = fma(_1580, _1628, _1620);
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1650 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_841);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -_1644;
    float _1664 = _1662 + 1.0;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1668 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1584);
    float _1670 = _1660 * _1664;
    float _1672 = -_203;
    int _1674 = _1522 ? as_type<int>(_1672) : as_type<int>(_203);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1666);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1680 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = _1630 * _1670;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = -_1678;
    float _1690 = fma(_1680, 2.0, _1688);
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1514;
    float _1698 = _1696 ? _203 : as_type<float>(_1674);
    float _1700 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1702 = fma(_1694, _1598, _1626);
    float _1704 = -_199;
    int _1706 = _1604 ? as_type<int>(_1704) : as_type<int>(_199);
    float _1708 = -_1570;
    float _1710 = fma(_1610, _1708, _1646);
    float _1712 = _899 * _1700;
    float _1714 = exp2(_1486);
    bool _1716 = !_1510;
    float _1718 = _1716 ? _199 : as_type<float>(_1706);
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1722 = _901 * _1700;
    float _1724 = _897 * _1700;
    float _1726 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1682, -2.0, _1720);
    float _1730 = _1718 + 0.5;
    float _1732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1676);
    float _1734 = -_121;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1690);
    float _1738 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1632);
    float _1740 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    float _1742 = -_1732;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1726, _1730, _1736);
    float _1748 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1750 = _1698 + (-0.5);
    float _1752 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1754 = -_1744;
    float _1756 = fma(_1718, _1754, _1746);
    float _1758 = -_1748;
    float _1760 = -_1740;
    float _1762 = fma(_1758, _1750, _1760);
    float _1764 = fma(_987, _1752, _1724);
    float _1766 = -_1714;
    float _1768 = _1766 + 1.0;
    float _1770 = fma(_991, _1752, _1712);
    float _1772 = -_1738;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1778 = -_1660;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_983, _1752, _1722);
    float _1784 = _1003 + _1764;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1788 = _1407 + _1383;
    float _1790 = fma(_1698, _1774, _1762);
    float _1792 = _1009 + _1770;
    float _1794 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1684);
    float _1798 = _1023 + _1782;
    float _1800 = _1788 * 0.5;
    out.m_58.x = _1710;
    out.m_58.y = _1702;
    out.m_58.z = _1756;
    out.m_58.w = _1790;
    float _1802 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1796);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1814 = _1383 * 0.5;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1826 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1832 = fma(_1409, -0.5, _1814);
    out.m_60.x = _1822;
    out.m_60.y = _1794;
    out.m_60.z = _1826;
    out.m_60.w = _1816;
    out.m_62.x = _1818;
    out.m_62.y = _1820;
    out.m_62.z = _1828;
    out.m_62.w = _1830;
    out.m_64.x = _1792;
    out.m_64.y = _1798;
    out.m_64.z = _1784;
    out.m_66.x = _1800;
    out.m_66.y = _1832;
    out.m_66.z = _1566;
    out.m_66.w = _1383;
    out.m_45.x = _1824;
    float _1834 = _1786 * _1445;
    float _1836 = -_1786;
    float _1838 = _1836 + 1.0;
    float _1840 = _1456 * _1834;
    float _1842 = _1466 * _1834;
    float _1844 = _1456 * _1838;
    float _1846 = fma(_1462, _1840, _1450);
    float _1848 = fma(_1464, _1840, _1452);
    float _1850 = fma(_1456, _1842, _1454);
    out.m_68.x = _1846;
    out.m_68.y = _1848;
    out.m_68.z = _1850;
    out.m_68.w = _1844;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _833 = false;
    bool _631 = false;
    bool _481 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_103);
        out.gl_Position.z = _1907;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1978 = as_type<float>(_143);
        out.gl_Position.z = _1978;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = _149;
    if (!_165)
    {
        float _169 = _149 * _149;
        float _171 = _169 * 0.5;
        _145 = _171;
    }
    float _173 = _145;
    float _175 = 0.0;
    float _177 = _173;
    if (!_165)
    {
        float _179 = _121 * _121;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    if (!_165)
    {
        float _185 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _185;
    }
    float _187 = _177;
    int _189 = as_type<int>(_147) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_147) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_165;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _149 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _149);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _227;
        _207 = _237;
        _125 = _225;
    }
    float _239 = _123;
    float _241 = _207;
    float _243 = _125;
    bool _245 = !_165;
    float _247 = _239;
    float _249 = _243;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _247 = _263;
        _249 = _257;
        _167 = _269;
    }
    float _271 = _247;
    float _273 = _249;
    float _275 = _167;
    float _277 = _273;
    float _279 = _271;
    if (!_165)
    {
        _277 = _121;
    }
    float _281 = _277;
    float _283 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _281;
    if (!_165)
    {
        float _287 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _287;
    }
    float _289 = _279;
    bool _291 = !_165;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _121 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _121);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_165;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _121 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_275, _153, _283);
    float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_349, _153, _351);
    float _361 = fma(_275, _151, _353);
    float _363 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_349, _151, _357);
    float _367 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = -_359;
    float _371 = _355 + _369;
    float _373 = fma(_349, _155, _363);
    float _375 = -_365;
    float _377 = _361 + _375;
    float _379 = fma(_275, _155, _367);
    float _381 = _371 * _371;
    float _383 = in.m_52.w;
    float _385 = _371 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _387 = -_373;
    float _389 = _379 + _387;
    float _391 = fma(_377, _377, _381);
    float _393 = _371 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _371 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _385);
    float _399 = fma(_389, _389, _391);
    float _401 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = in.m_42.z;
    float _409 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _413 = sqrt(_399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    bool _419 = _413 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_413);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_361, _383, _403);
    float _431 = fma(_355, _383, _405);
    float _433 = fma(_379, _383, _407);
    float _435 = _415;
    float _437 = _411;
    float _439 = _417;
    float _441 = _379;
    if (!_427)
    {
        bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _445 = !_443;
        if (!_445)
        {
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _449 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _457);
            float _465 = _459 * _459;
            float _467 = fma(_461, _461, _465);
            float _469 = fma(_463, _463, _467);
            float _471 = rsqrt(_469);
            float _473 = _471 * 9.9999999747524270787835121154785e-07;
            float _475 = _461 * _473;
            float _477 = _459 * _473;
            float _479 = _463 * _473;
            _435 = _477;
            _437 = _475;
            _439 = _479;
            _481 = true;
        }
        else
        {
            float _483 = _153 * _153;
            float _485 = fma(_151, _151, _483);
            float _487 = fma(_155, _155, _485);
            float _489 = sqrt(_487);
            bool _491 = _489 >= 9.9999999747524270787835121154785e-07;
            bool _493 = isnan(_489);
            bool _495 = _491 || _493;
            bool _497 = isnan(9.9999999747524270787835121154785e-07);
            bool _499 = _495 || _497;
            if (!_499)
            {
                float _501 = _405 * _405;
                float _503 = fma(_403, _403, _501);
                float _505 = fma(_407, _407, _503);
                float _507 = sqrt(_505);
                bool _509 = _507 >= 9.9999999747524270787835121154785e-07;
                bool _511 = isnan(_507);
                bool _513 = _509 || _511;
                bool _515 = isnan(9.9999999747524270787835121154785e-07);
                bool _517 = _513 || _515;
                if (!_517)
                {
                    float _519 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _521 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _519);
                    float _523 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _521);
                    float _525 = rsqrt(_523);
                    float _527 = _525 * 9.9999999747524270787835121154785e-07;
                    float _529 = _527 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _527 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _527 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _435 = _531;
                    _437 = _529;
                    _439 = _533;
                    _481 = true;
                }
                else
                {
                    float _535 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _539 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _541 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].x, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
                    float _551 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
                    float _553 = _547 * _547;
                    float _555 = fma(_549, _549, _553);
                    float _557 = fma(_551, _551, _555);
                    float _559 = rsqrt(_557);
                    float _561 = _559 * 9.9999999747524270787835121154785e-07;
                    float _563 = _549 * _561;
                    float _565 = _547 * _561;
                    float _567 = _551 * _561;
                    _435 = _565;
                    _437 = _563;
                    _439 = _567;
                    _481 = true;
                }
            }
            else
            {
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _571 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _573 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _575);
                float _583 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _577);
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _579);
                float _587 = _581 * _581;
                float _589 = fma(_583, _583, _587);
                float _591 = fma(_585, _585, _589);
                float _593 = rsqrt(_591);
                float _595 = _593 * 9.9999999747524270787835121154785e-07;
                float _597 = _583 * _595;
                float _599 = _581 * _595;
                float _601 = _585 * _595;
                _435 = _599;
                _437 = _597;
                _439 = _601;
            }
        }
    }
    _481 = false;
    float _603 = _435;
    float _605 = _437;
    float _607 = _439;
    bool _609 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _611 = !_609;
    float _629;
    if (!_611)
    {
        float _613 = in.m_54.x;
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _617 = _613 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_87);
        float _635 = 1.0 / _633;
        float _637 = _121 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = _639 + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _639 + _645;
    bool _649 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _651 = isnan(_639);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _669;
    float _673 = 1.0 / _667;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _677 = 1.0 / _663;
    float _679 = 1.0 / _671;
    float _681 = _643 * _677;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _685 = _639 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _687;
    float _691 = _685 * _673;
    float _693 = -_659;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _697;
    float _701 = _647 * _679;
    bool _703 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_639);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_689, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _717 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_639);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _733 = fma(_699, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _735 = _713 * _695;
    bool _737 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _739 = isnan(_639);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = -_713;
    float _751 = _749 + 1.0;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _757 = -_727;
    float _759 = _757 + 1.0;
    float _761 = _727 * _751;
    float _763 = fma(_755, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = fma(_731, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _767 = _747 * _759;
    float _769 = in.m_52.x;
    float _771 = in.m_52.y;
    float _773 = -_747;
    float _775 = _773 + 1.0;
    float _777 = _715 * _767;
    float _779 = _733 * _767;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _785;
    float _789 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].x, _777);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[143].y, _779);
    float _793 = fma(_783, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _795 = fma(_787, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _797 = fma(_763, _761, _789);
    float _799 = fma(_765, _761, _791);
    float _801 = fma(_793, _735, _797);
    float _803 = fma(_795, _735, _799);
    float _805 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _807 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[146].y, _803);
    float _809 = _805 * _769;
    float _811 = _807 * _771;
    bool _813 = !_675;
    float _831;
    if (!_813)
    {
        float _815 = in.m_54.x;
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _819 = _815 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _821 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _823 = _821 * _817;
        float _825 = floor(_823);
        float _827 = -_825;
        float _829 = _823 + _827;
        _831 = _829;
        _833 = true;
    }
    else
    {
        float _835 = float(_87);
        float _837 = 1.0 / _835;
        float _839 = _121 * _837;
        _831 = _839;
    }
    _833 = false;
    float _841 = _831;
    float _843 = _431 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _845 = _431 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _847 = _431 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _849 = _603 * _603;
    float _851 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].x, _843);
    float _853 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].x, _845);
    float _855 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].x, _847);
    float _857 = fma(_605, _605, _849);
    float _859 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _851);
    float _861 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _853);
    float _863 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _855);
    float _865 = fma(_607, _607, _857);
    float _867 = _859 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _861 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _873 = rsqrt(_865);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _877 = _867 + _875;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _869 + _879;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _871 + _883;
    float _887 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _889 = _877 * _877;
    float _891 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _893 = fma(_881, _881, _889);
    float _895 = fma(_885, _885, _893);
    float _897 = _873 * _607;
    float _899 = _873 * _605;
    float _901 = _873 * _603;
    float _903 = rsqrt(_895);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _907 = _897 * _905;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _911 = _901 * _909;
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _915 = -_907;
    float _917 = fma(_899, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _921 = _899 * _919;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _925 = -_911;
    float _927 = fma(_897, _923, _925);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _933 = -_921;
    float _935 = fma(_901, _931, _933);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _939 = _877 * _903;
    float _941 = _881 * _903;
    float _943 = -_939;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _947 = -_941;
    float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _951 = _945 * _945;
    float _953 = fma(_949, _949, _951);
    float _955 = _885 * _903;
    float _957 = _917 * _917;
    float _959 = -_955;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _885);
    float _963 = fma(_961, _961, _953);
    float _965 = fma(_927, _927, _957);
    float _967 = sqrt(_963);
    float _969 = fma(_935, _935, _965);
    float _971 = rsqrt(_969);
    float _973 = _903 * _967;
    float _975 = _887 * _973;
    float _977 = _891 * _973;
    float _979 = _973 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _981 = _979 * 0.5;
    float _983 = _917 * _971;
    float _985 = _975 * _937;
    float _987 = _935 * _971;
    float _989 = _977 * _929;
    float _991 = _927 * _971;
    float _993 = _899 * _983;
    float _995 = _985 * _897;
    float _997 = _901 * _987;
    float _999 = _985 * _899;
    float _1001 = -_993;
    float _1003 = fma(_901, _991, _1001);
    float _1005 = fma(_989, _987, _995);
    float _1007 = -_997;
    float _1009 = fma(_897, _983, _1007);
    float _1011 = fma(_989, _991, _999);
    float _1013 = _897 * _991;
    float _1015 = fma(_981, _1003, _1005);
    float _1017 = _985 * _901;
    float _1019 = fma(_981, _1009, _1011);
    float _1021 = -_1013;
    float _1023 = fma(_899, _987, _1021);
    float _1025 = _871 + _1015;
    float _1027 = fma(_989, _983, _1017);
    float _1029 = _869 + _1019;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = fma(_981, _1023, _1027);
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = _867 + _1035;
    float _1045 = fma(_1039, _1039, _1041);
    float _1047 = sqrt(_1045);
    bool _1049 = _1047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1051 = _1041;
    float _1053 = _1035;
    float _1055 = _867;
    float _1057 = _1025;
    float _1059 = _1045;
    if (!_1049)
    {
        _1051 = _1029;
    }
    float _1061 = _1051;
    float _1063 = _1061;
    if (!_1049)
    {
        _1053 = _1025;
    }
    float _1065 = _1053;
    float _1067 = _1065;
    if (!_1049)
    {
        _1055 = _1043;
    }
    float _1069 = _1055;
    bool _1071 = !_1049;
    float _1073 = _1069;
    if (!_1071)
    {
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1079 = _1047 + _1077;
        float _1081 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = rsqrt(_1045);
        float _1085 = _1079 * _1075;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = _1087 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1091 + (-1.0);
        float _1099 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1101 = fma(_1095, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1103 = fma(_1043, _1091, _1099);
        float _1105 = _1083 * _1101;
        float _1107 = fma(_1039, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1109 = fma(_1033, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1073 = _1103;
        _1063 = _1107;
        _1067 = _1109;
        _1057 = _1087;
    }
    float _1111 = _1073;
    float _1113 = _1063;
    float _1115 = _1067;
    float _1117 = _1057;
    float _1119 = -_939;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1123 = -_941;
    float _1125 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1113);
    float _1127 = -_955;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1121 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1125 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1153 = _1137 * _1151;
    float _1155 = _1141 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 * _1155;
    float _1161 = _1157 + _1159;
    float _1163 = sqrt(_1161);
    bool _1165 = _1163 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1169 = _1163 + _1167;
    float _1171 = _1145;
    float _1173 = _1161;
    float _1175 = _1169;
    float _1177 = _1151;
    if (_1165)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1171 = _1179;
    }
    float _1181 = _1171;
    if (_1165)
    {
        float _1183 = rsqrt(_1161);
        _1173 = _1183;
    }
    float _1185 = _1173;
    float _1187 = _1181;
    float _1189 = _1185;
    if (_1165)
    {
        float _1191 = _1169 * _1181;
        _1175 = _1191;
    }
    float _1193 = _1175;
    if (_1165)
    {
        float _1195 = _1193 * 0.15915493667125701904296875;
        _1059 = _1195;
    }
    float _1197 = _1059;
    float _1199 = _1117;
    if (_1165)
    {
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1209 = precise::max(0.0, _1207);
    float _1211 = _1033;
    float _1213 = _1209;
    if (_1165)
    {
        float _1215 = _1197 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1211 = _1217;
    }
    float _1219 = _1211;
    float _1221 = -_1151;
    float _1223 = -_1209;
    float _1225 = fma(_1133, _1221, _1223);
    if (_1165)
    {
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1227;
    }
    float _1229 = _1187;
    float _1231 = sqrt(_1147);
    float _1233 = _1205;
    float _1235 = _1229;
    if (_1165)
    {
        float _1237 = fma(_1205, _1229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = _1239;
    if (!_1165)
    {
        _1235 = _1153;
    }
    float _1243 = _1235;
    float _1245 = _1243;
    float _1247 = _1219;
    if (_1165)
    {
        float _1249 = _1219 + (-1.0);
        _1213 = _1249;
    }
    float _1251 = _1213;
    float _1253 = _1251;
    if (_1165)
    {
        float _1255 = _1185 * _1239;
        _441 = _1255;
    }
    float _1257 = _441;
    if (!_1165)
    {
        _1241 = _1225;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (_1165)
    {
        float _1263 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1263;
    }
    float _1265 = _1177;
    if (_1165)
    {
        float _1267 = _1153 * _1257;
        _1245 = _1267;
    }
    float _1269 = _1245;
    if (!_1165)
    {
        _1253 = _1155;
    }
    float _1271 = _1253;
    float _1273 = _1271;
    if (_1165)
    {
        float _1275 = _1155 * _1257;
        _1273 = _1275;
    }
    float _1277 = _1273;
    if (!_1165)
    {
        _1189 = _1157;
    }
    float _1279 = _1189;
    float _1281 = _1279;
    if (_1165)
    {
        float _1283 = fma(_1225, _1219, _1265);
        _1261 = _1283;
    }
    float _1285 = _1261;
    if (_1165)
    {
        float _1287 = _1269 * _1269;
        _1281 = _1287;
    }
    float _1289 = _1281;
    if (!_1165)
    {
        _1247 = _1159;
    }
    float _1291 = _1247;
    float _1293 = _1291;
    if (_1165)
    {
        float _1295 = _1277 * _1277;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1231, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = -_1309;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1311);
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1325 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1321);
    float _1331 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1333 = abs(_1319);
    float _1335 = log2(_1333);
    float _1337 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1339 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1341 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1331);
    float _1343 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1345 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1349 = _1313 * _1269;
    float _1351 = _1313 * _1285;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1359 = _1313 * _1277;
    float _1361 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1347);
    float _1363 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1365 = -_1357;
    float _1367 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1365);
    float _1369 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1373, _1323, 1.0);
    float _1377 = -_1359;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1367);
    float _1381 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1385 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1387 = fma(_1379, -0.5, 0.5);
    float _1389 = log2(_1375);
    float _1391 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1385);
    float _1395 = fma(_1379, 0.5, 0.5);
    float _1397 = _1351 + 1.0;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1393);
    float _1403 = 1.0 / _1383;
    float _1405 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1407 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1401);
    float _1409 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1411 = exp2(_1381);
    float _1413 = _1389 * 0.693147182464599609375;
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1417 = sqrt(_1387);
    float _1419 = fma(_1395, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1421 = _1407 * _1403;
    float _1423 = _1409 * _1403;
    float _1425 = fma(_1395, _1419, -0.212114393711090087890625);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = fma(_1423, -0.5, 0.5);
    float _1431 = -_1351;
    float _1433 = fma(_1411, _1397, _1431);
    float _1435 = fma(_1395, _1425, 1.570728778839111328125);
    float _1437 = _1417 * 0.636619746685028076171875;
    float _1439 = fma(_1433, 0.5, 0.5);
    float _1441 = -_1435;
    float _1443 = fma(_1437, _1441, 1.0);
    float3 _4102 = float3(_1427, _1429, _1415);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4102, float3(0.0), isnan(_4102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4102, float3(0.0), isnan(_4102)), level(0.0)).x;
    float3 _4113 = float3(_1427, _1429, _1415);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4113, float3(0.0), isnan(_4113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4113, float3(0.0), isnan(_4113)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _4130 = float2(_1443, _1439);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4130, float2(0.0), isnan(_4130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4130, float2(0.0), isnan(_4130)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_54.x;
    float _1470 = in.m_54.y;
    float _1472 = in.m_54.z;
    float _1474 = in.m_54.w;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1478 = _1339 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1482 = _1480 != 0;
    out.m_56.x = _1137;
    out.m_56.y = _1133;
    out.m_56.z = _1141;
    float _1484 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1486 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1496 = _1494 != 0;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1500 = 1.0 / _1490;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1504 = _1502 != 0;
    float _1506 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1484);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1510 = _1508 != 0;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1514 = _1512 != 0;
    float _1516 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1506);
    float _1518 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1520 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1522 = _1474 > 0.5;
    float _1524 = _1516 + _1383;
    float _1526 = fma(_1518, -2.0, _1492);
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1530 = -_1498;
    float _1532 = fma(_1520, 2.0, _1530);
    float _1534 = _1520;
    float _1536 = _1528;
    float _1538 = _1490;
    if (!_1482)
    {
        _1534 = _1470;
    }
    float _1540 = _1534;
    float _1542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1544 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1528);
    bool _1546 = _1468 > 0.5;
    float _1548 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1526);
    float _1550 = _1540;
    if (_1482)
    {
        _1550 = _1468;
    }
    float _1552 = _1550;
    float _1554 = _203 * _887;
    float _1556 = _1554;
    if (!_1482)
    {
        _1536 = _1472;
    }
    float _1558 = _1536;
    float _1560 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    float _1562 = _1558;
    if (!_1482)
    {
        _1538 = _1472;
    }
    float _1564 = _1538;
    float _1566 = _1524 * 0.5;
    float _1568 = -_1560;
    float _1570 = _1568 + 1.0;
    float _1572 = _1564;
    if (_1482)
    {
        _1562 = _1470;
    }
    float _1574 = _1562;
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _1516;
    out.gl_Position.w = _1383;
    if (_1482)
    {
        _1572 = _1470;
    }
    float _1576 = _1572;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1580 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1582 = _1470 > 0.5;
    float _1584 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1578);
    float _1586 = -_199;
    int _1588 = _1546 ? as_type<int>(_1586) : as_type<int>(_199);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1590;
    if (_1496)
    {
        float _1594 = -_1554;
        float _1596 = _1582 ? _1594 : _1554;
        _1556 = _1596;
    }
    float _1598 = _1556;
    float _1600 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1602 = _1592 * _1500;
    bool _1604 = _1472 > 0.5;
    float _1606 = _1598 + (-0.5);
    bool _1608 = !_1504;
    float _1610 = _1608 ? _199 : as_type<float>(_1588);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1614 = _841 + _1612;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1618 = -_121;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1532);
    float _1622 = -_1600;
    float _1624 = -_1548;
    float _1626 = fma(_1622, _1606, _1624);
    float _1628 = _1610 + 0.5;
    float _1630 = fma(_1602, _1614, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1632 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1616);
    bool _1634 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_841);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = fma(_1580, _1628, _1620);
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1650 = _841 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1652 = isnan(_841);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1658 = _1654 || _1656;
    float _1660 = float(_1658);
    float _1662 = -_1644;
    float _1664 = _1662 + 1.0;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1668 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1584);
    float _1670 = _1660 * _1664;
    float _1672 = -_203;
    int _1674 = _1522 ? as_type<int>(_1672) : as_type<int>(_203);
    float _1676 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1666);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1680 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = _1630 * _1670;
    float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1688 = -_1678;
    float _1690 = fma(_1680, 2.0, _1688);
    float _1692 = -_1668;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1514;
    float _1698 = _1696 ? _203 : as_type<float>(_1674);
    float _1700 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1702 = fma(_1694, _1598, _1626);
    float _1704 = -_199;
    int _1706 = _1604 ? as_type<int>(_1704) : as_type<int>(_199);
    float _1708 = -_1570;
    float _1710 = fma(_1610, _1708, _1646);
    float _1712 = _899 * _1700;
    float _1714 = exp2(_1486);
    bool _1716 = !_1510;
    float _1718 = _1716 ? _199 : as_type<float>(_1706);
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1722 = _901 * _1700;
    float _1724 = _897 * _1700;
    float _1726 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1682, -2.0, _1720);
    float _1730 = _1718 + 0.5;
    float _1732 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1676);
    float _1734 = -_121;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1690);
    float _1738 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1632);
    float _1740 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    float _1742 = -_1732;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1726, _1730, _1736);
    float _1748 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1750 = _1698 + (-0.5);
    float _1752 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1754 = -_1744;
    float _1756 = fma(_1718, _1754, _1746);
    float _1758 = -_1748;
    float _1760 = -_1740;
    float _1762 = fma(_1758, _1750, _1760);
    float _1764 = fma(_987, _1752, _1724);
    float _1766 = -_1714;
    float _1768 = _1766 + 1.0;
    float _1770 = fma(_991, _1752, _1712);
    float _1772 = -_1738;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1778 = -_1660;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_983, _1752, _1722);
    float _1784 = _1003 + _1764;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1788 = _1407 + _1383;
    float _1790 = fma(_1698, _1774, _1762);
    float _1792 = _1009 + _1770;
    float _1794 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1684);
    float _1798 = _1023 + _1782;
    float _1800 = _1788 * 0.5;
    out.m_58.x = _1710;
    out.m_58.y = _1702;
    out.m_58.z = _1756;
    out.m_58.w = _1790;
    float _1802 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1796);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1814 = _1383 * 0.5;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1824 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1826 = _1812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1828 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1830 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1832 = fma(_1409, -0.5, _1814);
    out.m_60.x = _1822;
    out.m_60.y = _1794;
    out.m_60.z = _1826;
    out.m_60.w = _1816;
    out.m_62.x = _1818;
    out.m_62.y = _1820;
    out.m_62.z = _1828;
    out.m_62.w = _1830;
    out.m_64.x = _1792;
    out.m_64.y = _1798;
    out.m_64.z = _1784;
    out.m_66.x = _1800;
    out.m_66.y = _1832;
    out.m_66.z = _1566;
    out.m_66.w = _1383;
    out.m_45.x = _1824;
    float _1834 = _1786 * _1445;
    float _1836 = -_1786;
    float _1838 = _1836 + 1.0;
    float _1840 = _1456 * _1834;
    float _1842 = _1466 * _1834;
    float _1844 = _1456 * _1838;
    float _1846 = fma(_1462, _1840, _1450);
    float _1848 = fma(_1464, _1840, _1452);
    float _1850 = fma(_1456, _1842, _1454);
    out.m_68.x = _1846;
    out.m_68.y = _1848;
    out.m_68.z = _1850;
    out.m_68.w = _1844;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

