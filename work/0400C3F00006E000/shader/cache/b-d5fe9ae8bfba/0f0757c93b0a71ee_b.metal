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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _1201 = false;
    bool _763 = false;
    bool _653 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2495 = as_type<float>(_103);
        out.gl_Position.z = _2495;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_139);
        out.gl_Position.z = _2564;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = in.m_49.y;
    float _145 = in.m_49.z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = 0.0;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_157)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_157;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _147 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _147);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_157;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _147 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _161 = _233;
    }
    float _235 = _161;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _249 = _239;
    float _251 = _243;
    if (!_157)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_157)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_157;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _121);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _261);
    float _309 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _259);
    float _313 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _317 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _319 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _313);
    float _323 = _313;
    if (!_157)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_157;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _121 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _329 = _349;
    }
    float _351 = _329;
    float _353 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _315);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _357 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    float _359 = fma(_235, _143, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _143, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _141, _263);
    float _369 = fma(_351, _141, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _145, _307);
    float _377 = fma(_351, _145, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_51.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = in.m_44.x;
    float _399 = in.m_44.y;
    float _401 = in.m_44.z;
    float _403 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_389, _389, _393);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _409 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _415 = sqrt(_405);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _419 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_415);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _431 = fma(_367, _385, _397);
    float _433 = fma(_359, _385, _399);
    float _435 = fma(_375, _385, _401);
    float _437 = _409;
    float _439 = _429;
    float _441 = _417;
    if (_427)
    {
        _437 = _413;
    }
    float _443 = _437;
    float _445 = _443;
    if (!_427)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _461);
            float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _471 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _469);
            float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _471);
            float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
            float _481 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
            float _483 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _477);
            float _485 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _439 = _499;
            _445 = _497;
            _441 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _143 * _143;
            float _507 = fma(_141, _141, _505);
            float _509 = fma(_145, _145, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _399 * _399;
                float _525 = fma(_397, _397, _523);
                float _527 = fma(_401, _401, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                if (!_539)
                {
                    float _541 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _541);
                    float _545 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _555 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _553;
                    _445 = _551;
                    _441 = _555;
                    _503 = true;
                }
                else
                {
                    float _557 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _559 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _561 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _563 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                    float _565 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                    float _567 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                    float _569 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                    float _571 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                    float _573 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                    float _575 = _569 * _569;
                    float _577 = fma(_571, _571, _575);
                    float _579 = fma(_573, _573, _577);
                    float _581 = rsqrt(_579);
                    float _583 = _581 * 9.9999999747524270787835121154785e-07;
                    float _585 = _571 * _583;
                    float _587 = _569 * _583;
                    float _589 = _573 * _583;
                    _439 = _587;
                    _445 = _585;
                    _441 = _589;
                    _503 = true;
                }
            }
            else
            {
                float _591 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
                float _609 = _603 * _603;
                float _611 = fma(_605, _605, _609);
                float _613 = fma(_607, _607, _611);
                float _615 = rsqrt(_613);
                float _617 = _615 * 9.9999999747524270787835121154785e-07;
                float _619 = _605 * _617;
                float _621 = _603 * _617;
                float _623 = _607 * _617;
                _439 = _621;
                _445 = _619;
                _441 = _623;
            }
        }
    }
    _503 = false;
    float _625 = _439;
    float _627 = _445;
    float _629 = _441;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _633 = !_631;
    float _651;
    if (!_633)
    {
        float _635 = in.m_53.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_87);
        float _657 = 1.0 / _655;
        float _659 = _121 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _665 = _661 + _663;
    float _667 = in.m_51.x;
    float _669 = in.m_51.y;
    bool _671 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_661);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    bool _687 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_661);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _665 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _725 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _723 * _711;
    float _729 = _725 * _711;
    float _731 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _739 = _735 * _667;
    float _741 = _737 * _669;
    bool _743 = !_709;
    float _761;
    if (!_743)
    {
        float _745 = in.m_53.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_87);
        float _767 = 1.0 / _765;
        float _769 = _121 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = 1.0 / _783;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _811 = 1.0 / _791;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _827 = 1.0 / _787;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _771 + _829;
    float _833 = _775 * _801;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _837 = _771 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _839;
    float _843 = 1.0 / _795;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _847 = _771 + _845;
    float _849 = _831 * _811;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _863;
    float _867 = 1.0 / _805;
    bool _869 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _871 = isnan(_771);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _847 * _827;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    float _887 = 1.0 / _799;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _891 = _771 + _889;
    float _893 = _837 * _843;
    bool _895 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _897 = isnan(_771);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _861 * _885;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _909;
    float _913 = 1.0 / _809;
    float _915 = _891 * _867;
    float _917 = -_861;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _923 = _771 + _921;
    float _925 = -_905;
    float _927 = _925 + 1.0;
    float _929 = _905 * _919;
    bool _931 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _933 = isnan(_771);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _779 * _887;
    bool _945 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _947 = isnan(_771);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = fma(_959, _881, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _971 = _955 * _927;
    float _973 = _923 * _913;
    float _975 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    float _981 = fma(_865, _881, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _991 = _941 * _979;
    bool _993 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _995 = isnan(_771);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = fma(_963, _849, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1007 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1009 = isnan(_771);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = fma(_985, _849, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1021 = fma(_989, _849, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1023 = _823 * _967;
    float _1025 = -_823;
    float _1027 = _1025 + 1.0;
    float _1029 = -_1017;
    float _1031 = _1029 + 1.0;
    float _1033 = _1017 * _1027;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1035;
    float _1039 = _1003 * _1031;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1041;
    float _1045 = -_1003;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1037, _833, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1051 = _975 * _1039;
    float _1053 = fma(_1043, _833, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1055 = fma(_841, _833, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1057 = _969 * _1039;
    float _1059 = _981 * _1039;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1067 = _1065 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1057);
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1051);
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1059);
    float _1079 = fma(_1063, _943, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1081 = fma(_1067, _943, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1083 = fma(_1071, _943, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1085 = fma(_1005, _1033, _1073);
    float _1087 = fma(_1019, _1033, _1075);
    float _1089 = fma(_1021, _1033, _1077);
    float _1091 = fma(_1049, _1023, _1085);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1093;
    float _1097 = fma(_1053, _1023, _1087);
    float _1099 = fma(_1055, _1023, _1089);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1121 = fma(_1095, _915, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1123 = fma(_1103, _915, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1125 = fma(_1107, _915, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1127 = fma(_1111, _973, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1129 = fma(_1115, _973, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1131 = fma(_1119, _973, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1133 = fma(_1079, _991, _1091);
    float _1135 = fma(_1081, _991, _1097);
    float _1137 = fma(_1083, _991, _1099);
    float _1139 = fma(_1121, _971, _1133);
    float _1141 = fma(_1123, _971, _1135);
    float _1143 = fma(_1125, _971, _1137);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1149;
    float _1153 = fma(_1127, _929, _1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1155;
    float _1159 = fma(_1147, _893, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1161 = fma(_1151, _893, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1163 = fma(_1129, _929, _1141);
    float _1165 = fma(_1157, _893, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1167 = fma(_1131, _929, _1143);
    float _1169 = fma(_1159, _907, _1153);
    float _1171 = fma(_1161, _907, _1163);
    float _1173 = fma(_1165, _907, _1167);
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1169);
    float _1177 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1171);
    float _1179 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1173);
    bool _1181 = !_825;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_53.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_87);
        float _1205 = 1.0 / _1203;
        float _1207 = _121 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1215 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1217 = as_type<float>(int(gl_VertexIndex));
    float _1219 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1221 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1213);
    float _1223 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1215);
    float _1225 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1219);
    float _1229 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1221);
    float _1231 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1235 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1237 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1239 + _1249;
    float _1253 = _1243 * _1243;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1209 + _1255;
    bool _1259 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1261 = isnan(_1209);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1247, _1247, _1253);
    float _1273 = _625 * _625;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1279 = as_type<int>(_1217) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1217) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = fma(_1251, _1251, _1271);
    float _1289 = fma(_627, _627, _1273);
    bool _1291 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1293 = isnan(_1209);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = 1.0 / _1277;
    float _1305 = fma(_629, _629, _1289);
    float _1307 = rsqrt(_1287);
    float _1309 = rsqrt(_1305);
    float _1311 = _1243 * _1307;
    float _1313 = _1247 * _1307;
    float _1315 = -_1311;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1319 = -_1313;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1323 = _1309 * _629;
    float _1325 = _1309 * _627;
    float _1327 = _1309 * _625;
    float _1329 = _1317 * _1317;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1333 = _1323 * _1331;
    float _1335 = _1251 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1339 = _1327 * _1337;
    float _1341 = fma(_1321, _1321, _1329);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1343, _1345);
    float _1349 = -_1335;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1353 = in.m_53.x;
    float _1355 = in.m_53.y;
    float _1357 = in.m_53.z;
    float _1359 = in.m_53.w;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1363 = _1325 * _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = -_1339;
    float _1369 = fma(_1323, _1365, _1367);
    float _1371 = _1347 * _1347;
    float _1373 = fma(_1351, _1351, _1341);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = -_1363;
    float _1379 = fma(_1327, _1375, _1377);
    float _1381 = fma(_1369, _1369, _1371);
    float _1383 = sqrt(_1373);
    float _1385 = fma(_1379, _1379, _1381);
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1397 = _1395 != 0;
    float _1399 = rsqrt(_1385);
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1285;
    float _1407 = _1405 ? (-0.5) : 0.5;
    float _1409 = _1307 * _1383;
    bool _1411 = _1353 > 0.5;
    bool _1413 = !_1281;
    float _1415 = _1413 ? (-0.5) : 0.5;
    float _1417 = _1225 * _1409;
    bool _1419 = _1357 > 0.5;
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1407);
    bool _1423 = _1355 > 0.5;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1415);
    float _1427 = _1233 * _1409;
    float _1429 = _1347 * _1399;
    float _1431 = _1379 * _1399;
    float _1433 = _1417 * _1421;
    float _1435 = _1369 * _1399;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1441 = _1427 * _1425;
    float _1443 = _1327 * _1431;
    float _1445 = _1433 * _1325;
    float _1447 = _1325 * _1429;
    float _1449 = _1433 * _1323;
    float _1451 = 1.0 / _1439;
    float _1453 = -_1443;
    float _1455 = fma(_1323, _1429, _1453);
    float _1457 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1459 = _1457 * 0.5;
    float _1461 = fma(_1441, _1435, _1445);
    float _1463 = fma(_1441, _1431, _1449);
    float _1465 = -_1415;
    int _1467 = _1411 ? as_type<int>(_1465) : as_type<int>(_1415);
    float _1469 = _1323 * _1435;
    float _1471 = fma(_1459, _1455, _1461);
    float _1473 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = -_1447;
    float _1479 = fma(_1327, _1435, _1477);
    float _1481 = _1237 + _1471;
    bool _1483 = _1359 > 0.5;
    float _1485 = fma(_1459, _1479, _1463);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1487;
    float _1491 = fma(_1475, -0.64999997615814208984375, 1.0);
    float _1493 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1495 = _1481 + _1493;
    float _1497 = _1239 + _1485;
    float _1499 = _1489 * _1451;
    float _1501 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1503 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1505 = _1497 + _1503;
    bool _1507 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1509 = isnan(_1209);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1501 + _1523;
    float _1527 = fma(_1505, _1491, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1529 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1531 = isnan(_1209);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = 1.0 / _1521;
    float _1543 = _1525 * _1525;
    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1547 = _1527 + _1545;
    float _1549 = -_1517;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1539;
    float _1555 = _1553 + 1.0;
    float _1557 = _1433 * _1327;
    float _1559 = _1547 * _1547;
    float _1561 = _1539 * _1551;
    float _1563 = -_1469;
    float _1565 = fma(_1325, _1431, _1563);
    float _1567 = _1543 + _1559;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = fma(_1441, _1429, _1557);
    float _1575 = fma(_1499, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1577 = sqrt(_1567);
    float _1579 = _1269 * _1555;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1209 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1585;
    float _1589 = -_1269;
    float _1591 = _1589 + 1.0;
    float _1593 = _1571 * _1541;
    float _1595 = fma(_1459, _1565, _1573);
    bool _1597 = !_1389;
    float _1599 = _1597 ? _1415 : as_type<float>(_1467);
    float _1601 = _1587 * _1303;
    float _1603 = _1301 * _1591;
    float _1605 = fma(_1593, _1583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1607 = _1235 + _1595;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1209 + _1611;
    float _1615 = _1575 * _1603;
    float _1617 = -_1301;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1625 = _1607 + _1623;
    float _1627 = fma(_1601, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1615);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1633 = fma(_1625, _1491, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1635 = -_1415;
    int _1637 = _1419 ? as_type<int>(_1635) : as_type<int>(_1415);
    float _1639 = fma(_1605, _1579, _1629);
    bool _1641 = !_1397;
    float _1643 = _1641 ? _1415 : as_type<float>(_1637);
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1647 = _1491;
    float _1649 = _1625;
    float _1651 = _1543;
    float _1653 = _1559;
    float _1655 = _1441;
    if (!_1621)
    {
        _1647 = _1559;
    }
    float _1657 = _1647;
    float _1659 = _1657;
    if (!_1621)
    {
        _1649 = _1543;
    }
    float _1661 = _1649;
    float _1663 = _1661;
    if (!_1621)
    {
        _1651 = _1501;
    }
    float _1665 = _1651;
    float _1667 = _1665;
    if (!_1621)
    {
        _1653 = _1527;
    }
    float _1669 = _1653;
    float _1671 = _1669;
    if (!_1621)
    {
        _1655 = _1633;
    }
    float _1673 = _1655;
    bool _1675 = !_1621;
    float _1677 = _1673;
    if (!_1675)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1683 = _1577 + _1681;
        float _1685 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = rsqrt(_1567);
        float _1689 = _1683 * _1679;
        float _1691 = _1689 * 0.15915493667125701904296875;
        float _1693 = _1691 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = _1687 * _1701;
        float _1705 = _1699 + (-1.0);
        float _1707 = fma(_1525, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1547, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1715 = _1707 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1719 = _1709 + _1717;
        float _1721 = fma(_1633, _1699, _1711);
        float _1723 = _1715 * _1715;
        float _1725 = _1719 * _1719;
        _1677 = _1721;
        _1663 = _1723;
        _1659 = _1725;
        _1667 = _1707;
        _1671 = _1709;
    }
    float _1727 = _1677;
    float _1729 = _1663;
    float _1731 = _1659;
    float _1733 = _1667;
    float _1735 = _1671;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1739 = _1727 + _1737;
    float _1741 = -_1407;
    int _1743 = _1423 ? as_type<int>(_1741) : as_type<int>(_1407);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1747 = -_1407;
    int _1749 = _1483 ? as_type<int>(_1747) : as_type<int>(_1407);
    float _1751 = fma(_1739, _1739, _1729);
    bool _1753 = !_1393;
    float _1755 = _1753 ? _1407 : as_type<float>(_1743);
    float _1757 = fma(_1627, _1561, _1639);
    bool _1759 = !_1403;
    float _1761 = _1759 ? _1407 : as_type<float>(_1749);
    float _1763 = _1751 + _1731;
    float _1765 = _1643 + 0.5;
    float _1767 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1757);
    float _1769 = -_1755;
    float _1771 = _1769 + 0.5;
    float _1773 = -_1761;
    float _1775 = _1773 + 0.5;
    float _1777 = _1599 + 0.5;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1781 = sqrt(_1763);
    float _1783 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1789 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1791 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1793 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1801 = _1779 * _1631;
    float _1803 = _1783 * _1645;
    float _1805 = _1785 * _1745;
    float _1807 = _1787 * _1609;
    float _1809 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1807;
    out.m_58.y = _1801;
    out.m_58.z = _1803;
    out.m_58.w = _1805;
    bool _1823 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1825 = isnan(_1781);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1831 = _1827 || _1829;
    out.m_60.x = _1813;
    out.m_60.y = _1815;
    out.m_60.z = _1817;
    out.m_62.x = _1809;
    out.m_62.y = _1811;
    out.m_62.z = _1819;
    out.m_62.w = _1821;
    out.m_64.x = _1427;
    out.m_64.y = _1417;
    float _1833 = _1791;
    float _1835 = _1811;
    float _1837 = _1781;
    float _1839 = _1821;
    if (!_1831)
    {
        _1833 = 1.0;
    }
    float _1841 = _1833;
    bool _1843 = !_1831;
    float _1845 = _1841;
    if (!_1843)
    {
        bool _1847 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1849 = isnan(_1781);
        bool _1851 = _1847 || _1849;
        bool _1853 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1855 = _1851 || _1853;
        if (!_1855)
        {
            float _1857 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1859 = _1781 + _1857;
            float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1863 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1861;
            float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1869 = 1.0 / _1863;
            float _1871 = _1859 * _1869;
            float _1873 = fma(_1871, _1867, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1845 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1879 = isnan(_1781);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1889 = _1781 + _1887;
                float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1893 = _1891 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1895 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1897 = _1895 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1899 = 1.0 / _1893;
                float _1901 = _1889 * _1899;
                float _1903 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1845 = _1903;
                _1875 = true;
            }
            else
            {
                _1845 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1875 = false;
    float _1905 = _1845;
    float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1909 = _1727 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1733 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1735 + _1915;
    float _1919 = fma(_1909, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1921 = fma(_1913, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1923 = -_1311;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _1927 = fma(_1917, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1929 = -_1313;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1935 = _1925 + _1933;
    float _1937 = -_1335;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1927);
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1931 + _1941;
    float _1945 = _1935 * _1935;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1949 = _1939 + _1947;
    float _1951 = fma(_1943, _1943, _1945);
    float _1953 = fma(_1949, _1949, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1949 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1949;
    float _1979 = _1967;
    float _1981 = _1975;
    float _1983 = _1959;
    if (_1971)
    {
        float _1985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1985;
    }
    float _1987 = _1977;
    if (_1971)
    {
        float _1989 = rsqrt(_1967);
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1971)
    {
        float _1993 = _1975 * _1987;
        _1981 = _1993;
    }
    float _1995 = _1981;
    if (_1971)
    {
        float _1997 = _1995 * 0.15915493667125701904296875;
        _1835 = _1997;
    }
    float _1999 = _1835;
    float _2001 = _1789;
    float _2003 = _1999;
    if (_1971)
    {
        float _2005 = _1999 * 6.283185482025146484375;
        float _2007 = sin(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2013 = precise::max(0.0, _2011);
    float _2015 = _1955;
    float _2017 = _2013;
    float _2019 = _2011;
    if (_1971)
    {
        float _2021 = _1999 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2015 = _2023;
    }
    float _2025 = _2015;
    float _2027 = -_1957;
    float _2029 = -_2013;
    float _2031 = fma(_1935, _2027, _2029);
    if (_1971)
    {
        float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2033;
    }
    float _2035 = _2017;
    float _2037 = _2035;
    if (!_1971)
    {
        _2003 = _1963;
    }
    float _2039 = _2003;
    float _2041 = sqrt(_1953);
    float _2043 = _2009;
    float _2045 = _2039;
    if (_1971)
    {
        float _2047 = fma(_2009, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2037 = _2047;
    }
    float _2049 = _2037;
    float _2051 = _2049;
    if (!_1971)
    {
        _2043 = _2031;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (_1971)
    {
        float _2057 = _2025 + (-1.0);
        _2019 = _2057;
    }
    float _2059 = _2019;
    float _2061 = _2059;
    if (_1971)
    {
        float _2063 = _1991 * _2049;
        _1837 = _2063;
    }
    float _2065 = _1837;
    if (!_1971)
    {
        _2051 = _1961;
    }
    float _2067 = _2051;
    float _2069 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = _2067;
    if (_1971)
    {
        float _2073 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _2073;
    }
    float _2075 = _1839;
    if (_1971)
    {
        float _2077 = _1959 * _2065;
        _1983 = _2077;
    }
    float _2079 = _1983;
    if (_1971)
    {
        float _2081 = _1961 * _2065;
        _2071 = _2081;
    }
    float _2083 = _2071;
    if (!_1971)
    {
        _2061 = _1965;
    }
    float _2085 = _2061;
    float _2087 = _2085;
    if (_1971)
    {
        float _2089 = fma(_2031, _2025, _2075);
        _2055 = _2089;
    }
    float _2091 = _2055;
    if (_1971)
    {
        float _2093 = _2079 * _2079;
        _2045 = _2093;
    }
    float _2095 = _2045;
    if (_1971)
    {
        float _2097 = _2083 * _2083;
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2103 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = fma(_2091, _2091, _2095);
    float _2109 = -_2105;
    float _2111 = _2109 + 1.0;
    float _2113 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2107 + _2099;
    float _2117 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = rsqrt(_2115);
    float _2123 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2125 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2129 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2133 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2135 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2139 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2131);
    float _2141 = abs(_2111);
    float _2143 = log2(_2141);
    float _2145 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2151 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2121 * _2079;
    float _2155 = _2121 * _2091;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = -_2147;
    float _2161 = fma(_2159, _2119, 1.0);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2165 = _2121 * _2083;
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = -_2163;
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2171);
    float _2175 = log2(_2161);
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = -_2165;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2173);
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2187 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2189 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2191 = fma(_2183, -0.5, 0.5);
    float _2193 = exp2(_2185);
    float _2195 = fma(_2183, 0.5, 0.5);
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2199 = _2155 + 1.0;
    float _2201 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2203 = 1.0 / _2189;
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2187);
    float _2207 = fma(_2195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2209 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = _2175 * 0.693147182464599609375;
    float _2213 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2195, _2207, -0.212114393711090087890625);
    float _2217 = sqrt(_2191);
    float _2219 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2221 = -_2155;
    float _2223 = fma(_2193, _2199, _2221);
    float _2225 = fma(_2195, _2215, 1.570728778839111328125);
    float _2227 = fma(_2223, 0.5, 0.5);
    float _2229 = _2209 * _2203;
    float _2231 = _2219 * _2203;
    float _2233 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2235 = fma(_2229, 0.5, 0.5);
    float _2237 = fma(_2231, -0.5, 0.5);
    float _2239 = _2217 * 0.636619746685028076171875;
    float _2241 = -_2225;
    float _2243 = fma(_2239, _2241, 1.0);
    float3 _6091 = float3(_2235, _2237, _2233);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).x;
    float3 _6102 = float3(_2235, _2237, _2233);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6102, float3(0.0), isnan(_6102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6102, float3(0.0), isnan(_6102)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _6119 = float2(_2243, _2227);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6119, float2(0.0), isnan(_6119)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6119, float2(0.0), isnan(_6119)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = -_1311;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _2272 = -_1313;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _2276 = -_1335;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _2280 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2286 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2280);
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2290 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2284);
    float _2292 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2288);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2290);
    float _2298 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2300 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2302 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = exp2(_2298);
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2308 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.5);
    bool _2316 = _2312 || _2314;
    float _2318 = _2306 + _2302;
    float _2320 = 1.0 / _2302;
    float _2322 = _2318 * _2320;
    float _2324 = _2322 * 0.5;
    float _2326 = _2320;
    if (_2316)
    {
        _2326 = 1.0;
    }
    float _2328 = _2326;
    float _2330 = _2328;
    if (!_2316)
    {
        float _2332 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2336 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
        float _2338 = _2332 * 0.15915493667125701904296875;
        float _2340 = _2338 * 6.283185482025146484375;
        float _2342 = cos(_2340);
        float _2344 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2346 = _2344 * 0.15915493667125701904296875;
        float _2348 = _2338 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = 1.0 / _2342;
        float _2354 = _2346 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2350 * _2352;
        float _2360 = 1.0 / _2336;
        float _2362 = _2356 * _2358;
        float _2364 = _2346 * 6.283185482025146484375;
        float _2366 = sin(_2364);
        float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2370 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2368;
        float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2374 = _2360 * _2372;
        float _2376 = 1.0 / _2362;
        float _2378 = 1.0 / _2370;
        float _2380 = _2366 * _2376;
        float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2384 = fma(_2380, _2374, _2382);
        float _2386 = _2384 * _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + 1.0;
        _2330 = _2392;
    }
    float _2394 = _2330;
    float _2396 = -_2304;
    float _2398 = _2396 + 1.0;
    float _2400 = _2300 + _2189;
    bool _2402 = _2394 > 0.0;
    bool _2404 = isnan(_2394);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan(0.0);
    bool _2410 = _2406 || _2408;
    float _2412 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2414 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2416 = _2400 * 0.5;
    float _2418 = _2414 * _2245;
    float _2420 = -_2414;
    float _2422 = _2420 + 1.0;
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2300;
    out.gl_Position.w = _2189;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2426 = _2256 * _2418;
    float _2428 = _2266 * _2418;
    out.m_66.z = _2416;
    out.m_66.w = _2189;
    float _2430 = fma(_2262, _2426, _2250);
    float _2432 = fma(_2264, _2426, _2252);
    float _2434 = _2256 * _2422;
    float _2436 = fma(_2256, _2428, _2254);
    out.m_47.x = _2424;
    out.m_68.x = _2430;
    out.m_68.y = _2432;
    out.m_68.z = _2436;
    out.m_68.w = _2434;
    if (_2410)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2438;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _1201 = false;
    bool _763 = false;
    bool _653 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2495 = as_type<float>(_103);
        out.gl_Position.z = _2495;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_139);
        out.gl_Position.z = _2564;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = in.m_49.y;
    float _145 = in.m_49.z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = 0.0;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_157)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_157;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _147 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _147);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_157;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _147 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _161 = _233;
    }
    float _235 = _161;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _249 = _239;
    float _251 = _243;
    if (!_157)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_157)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_157;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _121);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _261);
    float _309 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _259);
    float _313 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _317 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _319 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _313);
    float _323 = _313;
    if (!_157)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_157;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _121 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _329 = _349;
    }
    float _351 = _329;
    float _353 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _315);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _357 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    float _359 = fma(_235, _143, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _143, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _141, _263);
    float _369 = fma(_351, _141, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _145, _307);
    float _377 = fma(_351, _145, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_51.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = in.m_44.x;
    float _399 = in.m_44.y;
    float _401 = in.m_44.z;
    float _403 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_389, _389, _393);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _409 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _415 = sqrt(_405);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _419 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_415);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _431 = fma(_367, _385, _397);
    float _433 = fma(_359, _385, _399);
    float _435 = fma(_375, _385, _401);
    float _437 = _409;
    float _439 = _429;
    float _441 = _417;
    if (_427)
    {
        _437 = _413;
    }
    float _443 = _437;
    float _445 = _443;
    if (!_427)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _461);
            float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _471 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _469);
            float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _471);
            float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
            float _481 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
            float _483 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _477);
            float _485 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _439 = _499;
            _445 = _497;
            _441 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _143 * _143;
            float _507 = fma(_141, _141, _505);
            float _509 = fma(_145, _145, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _399 * _399;
                float _525 = fma(_397, _397, _523);
                float _527 = fma(_401, _401, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                if (!_539)
                {
                    float _541 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _541);
                    float _545 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _555 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _553;
                    _445 = _551;
                    _441 = _555;
                    _503 = true;
                }
                else
                {
                    float _557 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _559 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _561 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _563 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                    float _565 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                    float _567 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                    float _569 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                    float _571 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                    float _573 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                    float _575 = _569 * _569;
                    float _577 = fma(_571, _571, _575);
                    float _579 = fma(_573, _573, _577);
                    float _581 = rsqrt(_579);
                    float _583 = _581 * 9.9999999747524270787835121154785e-07;
                    float _585 = _571 * _583;
                    float _587 = _569 * _583;
                    float _589 = _573 * _583;
                    _439 = _587;
                    _445 = _585;
                    _441 = _589;
                    _503 = true;
                }
            }
            else
            {
                float _591 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
                float _609 = _603 * _603;
                float _611 = fma(_605, _605, _609);
                float _613 = fma(_607, _607, _611);
                float _615 = rsqrt(_613);
                float _617 = _615 * 9.9999999747524270787835121154785e-07;
                float _619 = _605 * _617;
                float _621 = _603 * _617;
                float _623 = _607 * _617;
                _439 = _621;
                _445 = _619;
                _441 = _623;
            }
        }
    }
    _503 = false;
    float _625 = _439;
    float _627 = _445;
    float _629 = _441;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _633 = !_631;
    float _651;
    if (!_633)
    {
        float _635 = in.m_53.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_87);
        float _657 = 1.0 / _655;
        float _659 = _121 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _665 = _661 + _663;
    float _667 = in.m_51.x;
    float _669 = in.m_51.y;
    bool _671 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_661);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    bool _687 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_661);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _665 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _725 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _723 * _711;
    float _729 = _725 * _711;
    float _731 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _739 = _735 * _667;
    float _741 = _737 * _669;
    bool _743 = !_709;
    float _761;
    if (!_743)
    {
        float _745 = in.m_53.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_87);
        float _767 = 1.0 / _765;
        float _769 = _121 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = 1.0 / _783;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _811 = 1.0 / _791;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _827 = 1.0 / _787;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _771 + _829;
    float _833 = _775 * _801;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _837 = _771 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _839;
    float _843 = 1.0 / _795;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _847 = _771 + _845;
    float _849 = _831 * _811;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _863;
    float _867 = 1.0 / _805;
    bool _869 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _871 = isnan(_771);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _847 * _827;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    float _887 = 1.0 / _799;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _891 = _771 + _889;
    float _893 = _837 * _843;
    bool _895 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _897 = isnan(_771);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _861 * _885;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _909;
    float _913 = 1.0 / _809;
    float _915 = _891 * _867;
    float _917 = -_861;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _923 = _771 + _921;
    float _925 = -_905;
    float _927 = _925 + 1.0;
    float _929 = _905 * _919;
    bool _931 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _933 = isnan(_771);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _779 * _887;
    bool _945 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _947 = isnan(_771);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = fma(_959, _881, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _971 = _955 * _927;
    float _973 = _923 * _913;
    float _975 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    float _981 = fma(_865, _881, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _991 = _941 * _979;
    bool _993 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _995 = isnan(_771);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = fma(_963, _849, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1007 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1009 = isnan(_771);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = fma(_985, _849, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1021 = fma(_989, _849, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1023 = _823 * _967;
    float _1025 = -_823;
    float _1027 = _1025 + 1.0;
    float _1029 = -_1017;
    float _1031 = _1029 + 1.0;
    float _1033 = _1017 * _1027;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1035;
    float _1039 = _1003 * _1031;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1041;
    float _1045 = -_1003;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1037, _833, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1051 = _975 * _1039;
    float _1053 = fma(_1043, _833, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1055 = fma(_841, _833, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1057 = _969 * _1039;
    float _1059 = _981 * _1039;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1067 = _1065 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1057);
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1051);
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1059);
    float _1079 = fma(_1063, _943, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1081 = fma(_1067, _943, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1083 = fma(_1071, _943, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1085 = fma(_1005, _1033, _1073);
    float _1087 = fma(_1019, _1033, _1075);
    float _1089 = fma(_1021, _1033, _1077);
    float _1091 = fma(_1049, _1023, _1085);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1093;
    float _1097 = fma(_1053, _1023, _1087);
    float _1099 = fma(_1055, _1023, _1089);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1121 = fma(_1095, _915, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1123 = fma(_1103, _915, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1125 = fma(_1107, _915, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1127 = fma(_1111, _973, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1129 = fma(_1115, _973, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1131 = fma(_1119, _973, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1133 = fma(_1079, _991, _1091);
    float _1135 = fma(_1081, _991, _1097);
    float _1137 = fma(_1083, _991, _1099);
    float _1139 = fma(_1121, _971, _1133);
    float _1141 = fma(_1123, _971, _1135);
    float _1143 = fma(_1125, _971, _1137);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1149;
    float _1153 = fma(_1127, _929, _1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1155;
    float _1159 = fma(_1147, _893, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1161 = fma(_1151, _893, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1163 = fma(_1129, _929, _1141);
    float _1165 = fma(_1157, _893, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1167 = fma(_1131, _929, _1143);
    float _1169 = fma(_1159, _907, _1153);
    float _1171 = fma(_1161, _907, _1163);
    float _1173 = fma(_1165, _907, _1167);
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1169);
    float _1177 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1171);
    float _1179 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1173);
    bool _1181 = !_825;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_53.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_87);
        float _1205 = 1.0 / _1203;
        float _1207 = _121 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1215 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1217 = as_type<float>(int(gl_VertexIndex));
    float _1219 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1221 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1213);
    float _1223 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1215);
    float _1225 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1219);
    float _1229 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1221);
    float _1231 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1235 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1237 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1239 + _1249;
    float _1253 = _1243 * _1243;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1209 + _1255;
    bool _1259 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1261 = isnan(_1209);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1247, _1247, _1253);
    float _1273 = _625 * _625;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1279 = as_type<int>(_1217) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1217) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = fma(_1251, _1251, _1271);
    float _1289 = fma(_627, _627, _1273);
    bool _1291 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1293 = isnan(_1209);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = 1.0 / _1277;
    float _1305 = fma(_629, _629, _1289);
    float _1307 = rsqrt(_1287);
    float _1309 = rsqrt(_1305);
    float _1311 = _1243 * _1307;
    float _1313 = _1247 * _1307;
    float _1315 = -_1311;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1319 = -_1313;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1323 = _1309 * _629;
    float _1325 = _1309 * _627;
    float _1327 = _1309 * _625;
    float _1329 = _1317 * _1317;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1333 = _1323 * _1331;
    float _1335 = _1251 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1339 = _1327 * _1337;
    float _1341 = fma(_1321, _1321, _1329);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1343, _1345);
    float _1349 = -_1335;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1353 = in.m_53.x;
    float _1355 = in.m_53.y;
    float _1357 = in.m_53.z;
    float _1359 = in.m_53.w;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1363 = _1325 * _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = -_1339;
    float _1369 = fma(_1323, _1365, _1367);
    float _1371 = _1347 * _1347;
    float _1373 = fma(_1351, _1351, _1341);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = -_1363;
    float _1379 = fma(_1327, _1375, _1377);
    float _1381 = fma(_1369, _1369, _1371);
    float _1383 = sqrt(_1373);
    float _1385 = fma(_1379, _1379, _1381);
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1397 = _1395 != 0;
    float _1399 = rsqrt(_1385);
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1285;
    float _1407 = _1405 ? (-0.5) : 0.5;
    float _1409 = _1307 * _1383;
    bool _1411 = _1353 > 0.5;
    bool _1413 = !_1281;
    float _1415 = _1413 ? (-0.5) : 0.5;
    float _1417 = _1225 * _1409;
    bool _1419 = _1357 > 0.5;
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1407);
    bool _1423 = _1355 > 0.5;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1415);
    float _1427 = _1233 * _1409;
    float _1429 = _1347 * _1399;
    float _1431 = _1379 * _1399;
    float _1433 = _1417 * _1421;
    float _1435 = _1369 * _1399;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1441 = _1427 * _1425;
    float _1443 = _1327 * _1431;
    float _1445 = _1433 * _1325;
    float _1447 = _1325 * _1429;
    float _1449 = _1433 * _1323;
    float _1451 = 1.0 / _1439;
    float _1453 = -_1443;
    float _1455 = fma(_1323, _1429, _1453);
    float _1457 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1459 = _1457 * 0.5;
    float _1461 = fma(_1441, _1435, _1445);
    float _1463 = fma(_1441, _1431, _1449);
    float _1465 = -_1415;
    int _1467 = _1411 ? as_type<int>(_1465) : as_type<int>(_1415);
    float _1469 = _1323 * _1435;
    float _1471 = fma(_1459, _1455, _1461);
    float _1473 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = -_1447;
    float _1479 = fma(_1327, _1435, _1477);
    float _1481 = _1237 + _1471;
    bool _1483 = _1359 > 0.5;
    float _1485 = fma(_1459, _1479, _1463);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1487;
    float _1491 = fma(_1475, -0.64999997615814208984375, 1.0);
    float _1493 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1495 = _1481 + _1493;
    float _1497 = _1239 + _1485;
    float _1499 = _1489 * _1451;
    float _1501 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1503 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1505 = _1497 + _1503;
    bool _1507 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1509 = isnan(_1209);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1501 + _1523;
    float _1527 = fma(_1505, _1491, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1529 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1531 = isnan(_1209);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = 1.0 / _1521;
    float _1543 = _1525 * _1525;
    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1547 = _1527 + _1545;
    float _1549 = -_1517;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1539;
    float _1555 = _1553 + 1.0;
    float _1557 = _1433 * _1327;
    float _1559 = _1547 * _1547;
    float _1561 = _1539 * _1551;
    float _1563 = -_1469;
    float _1565 = fma(_1325, _1431, _1563);
    float _1567 = _1543 + _1559;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = fma(_1441, _1429, _1557);
    float _1575 = fma(_1499, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1577 = sqrt(_1567);
    float _1579 = _1269 * _1555;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1209 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1585;
    float _1589 = -_1269;
    float _1591 = _1589 + 1.0;
    float _1593 = _1571 * _1541;
    float _1595 = fma(_1459, _1565, _1573);
    bool _1597 = !_1389;
    float _1599 = _1597 ? _1415 : as_type<float>(_1467);
    float _1601 = _1587 * _1303;
    float _1603 = _1301 * _1591;
    float _1605 = fma(_1593, _1583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1607 = _1235 + _1595;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1209 + _1611;
    float _1615 = _1575 * _1603;
    float _1617 = -_1301;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1625 = _1607 + _1623;
    float _1627 = fma(_1601, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1615);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1633 = fma(_1625, _1491, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1635 = -_1415;
    int _1637 = _1419 ? as_type<int>(_1635) : as_type<int>(_1415);
    float _1639 = fma(_1605, _1579, _1629);
    bool _1641 = !_1397;
    float _1643 = _1641 ? _1415 : as_type<float>(_1637);
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1647 = _1491;
    float _1649 = _1625;
    float _1651 = _1543;
    float _1653 = _1559;
    float _1655 = _1441;
    if (!_1621)
    {
        _1647 = _1559;
    }
    float _1657 = _1647;
    float _1659 = _1657;
    if (!_1621)
    {
        _1649 = _1543;
    }
    float _1661 = _1649;
    float _1663 = _1661;
    if (!_1621)
    {
        _1651 = _1501;
    }
    float _1665 = _1651;
    float _1667 = _1665;
    if (!_1621)
    {
        _1653 = _1527;
    }
    float _1669 = _1653;
    float _1671 = _1669;
    if (!_1621)
    {
        _1655 = _1633;
    }
    float _1673 = _1655;
    bool _1675 = !_1621;
    float _1677 = _1673;
    if (!_1675)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1683 = _1577 + _1681;
        float _1685 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = rsqrt(_1567);
        float _1689 = _1683 * _1679;
        float _1691 = _1689 * 0.15915493667125701904296875;
        float _1693 = _1691 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = _1687 * _1701;
        float _1705 = _1699 + (-1.0);
        float _1707 = fma(_1525, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1547, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1715 = _1707 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1719 = _1709 + _1717;
        float _1721 = fma(_1633, _1699, _1711);
        float _1723 = _1715 * _1715;
        float _1725 = _1719 * _1719;
        _1677 = _1721;
        _1663 = _1723;
        _1659 = _1725;
        _1667 = _1707;
        _1671 = _1709;
    }
    float _1727 = _1677;
    float _1729 = _1663;
    float _1731 = _1659;
    float _1733 = _1667;
    float _1735 = _1671;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1739 = _1727 + _1737;
    float _1741 = -_1407;
    int _1743 = _1423 ? as_type<int>(_1741) : as_type<int>(_1407);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1747 = -_1407;
    int _1749 = _1483 ? as_type<int>(_1747) : as_type<int>(_1407);
    float _1751 = fma(_1739, _1739, _1729);
    bool _1753 = !_1393;
    float _1755 = _1753 ? _1407 : as_type<float>(_1743);
    float _1757 = fma(_1627, _1561, _1639);
    bool _1759 = !_1403;
    float _1761 = _1759 ? _1407 : as_type<float>(_1749);
    float _1763 = _1751 + _1731;
    float _1765 = _1643 + 0.5;
    float _1767 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1757);
    float _1769 = -_1755;
    float _1771 = _1769 + 0.5;
    float _1773 = -_1761;
    float _1775 = _1773 + 0.5;
    float _1777 = _1599 + 0.5;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1781 = sqrt(_1763);
    float _1783 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1789 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1791 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1793 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1801 = _1779 * _1631;
    float _1803 = _1783 * _1645;
    float _1805 = _1785 * _1745;
    float _1807 = _1787 * _1609;
    float _1809 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1807;
    out.m_58.y = _1801;
    out.m_58.z = _1803;
    out.m_58.w = _1805;
    bool _1823 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1825 = isnan(_1781);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1831 = _1827 || _1829;
    out.m_60.x = _1813;
    out.m_60.y = _1815;
    out.m_60.z = _1817;
    out.m_62.x = _1809;
    out.m_62.y = _1811;
    out.m_62.z = _1819;
    out.m_62.w = _1821;
    out.m_64.x = _1427;
    out.m_64.y = _1417;
    float _1833 = _1791;
    float _1835 = _1811;
    float _1837 = _1781;
    float _1839 = _1821;
    if (!_1831)
    {
        _1833 = 1.0;
    }
    float _1841 = _1833;
    bool _1843 = !_1831;
    float _1845 = _1841;
    if (!_1843)
    {
        bool _1847 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1849 = isnan(_1781);
        bool _1851 = _1847 || _1849;
        bool _1853 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1855 = _1851 || _1853;
        if (!_1855)
        {
            float _1857 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1859 = _1781 + _1857;
            float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1863 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1861;
            float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1869 = 1.0 / _1863;
            float _1871 = _1859 * _1869;
            float _1873 = fma(_1871, _1867, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1845 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1879 = isnan(_1781);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1889 = _1781 + _1887;
                float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1893 = _1891 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1895 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1897 = _1895 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1899 = 1.0 / _1893;
                float _1901 = _1889 * _1899;
                float _1903 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1845 = _1903;
                _1875 = true;
            }
            else
            {
                _1845 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1875 = false;
    float _1905 = _1845;
    float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1909 = _1727 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1733 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1735 + _1915;
    float _1919 = fma(_1909, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1921 = fma(_1913, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1923 = -_1311;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _1927 = fma(_1917, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1929 = -_1313;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1935 = _1925 + _1933;
    float _1937 = -_1335;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1927);
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1931 + _1941;
    float _1945 = _1935 * _1935;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1949 = _1939 + _1947;
    float _1951 = fma(_1943, _1943, _1945);
    float _1953 = fma(_1949, _1949, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1949 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1949;
    float _1979 = _1967;
    float _1981 = _1975;
    float _1983 = _1959;
    if (_1971)
    {
        float _1985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1985;
    }
    float _1987 = _1977;
    if (_1971)
    {
        float _1989 = rsqrt(_1967);
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1971)
    {
        float _1993 = _1975 * _1987;
        _1981 = _1993;
    }
    float _1995 = _1981;
    if (_1971)
    {
        float _1997 = _1995 * 0.15915493667125701904296875;
        _1835 = _1997;
    }
    float _1999 = _1835;
    float _2001 = _1789;
    float _2003 = _1999;
    if (_1971)
    {
        float _2005 = _1999 * 6.283185482025146484375;
        float _2007 = sin(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2013 = precise::max(0.0, _2011);
    float _2015 = _1955;
    float _2017 = _2013;
    float _2019 = _2011;
    if (_1971)
    {
        float _2021 = _1999 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2015 = _2023;
    }
    float _2025 = _2015;
    float _2027 = -_1957;
    float _2029 = -_2013;
    float _2031 = fma(_1935, _2027, _2029);
    if (_1971)
    {
        float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2033;
    }
    float _2035 = _2017;
    float _2037 = _2035;
    if (!_1971)
    {
        _2003 = _1963;
    }
    float _2039 = _2003;
    float _2041 = sqrt(_1953);
    float _2043 = _2009;
    float _2045 = _2039;
    if (_1971)
    {
        float _2047 = fma(_2009, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2037 = _2047;
    }
    float _2049 = _2037;
    float _2051 = _2049;
    if (!_1971)
    {
        _2043 = _2031;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (_1971)
    {
        float _2057 = _2025 + (-1.0);
        _2019 = _2057;
    }
    float _2059 = _2019;
    float _2061 = _2059;
    if (_1971)
    {
        float _2063 = _1991 * _2049;
        _1837 = _2063;
    }
    float _2065 = _1837;
    if (!_1971)
    {
        _2051 = _1961;
    }
    float _2067 = _2051;
    float _2069 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = _2067;
    if (_1971)
    {
        float _2073 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _2073;
    }
    float _2075 = _1839;
    if (_1971)
    {
        float _2077 = _1959 * _2065;
        _1983 = _2077;
    }
    float _2079 = _1983;
    if (_1971)
    {
        float _2081 = _1961 * _2065;
        _2071 = _2081;
    }
    float _2083 = _2071;
    if (!_1971)
    {
        _2061 = _1965;
    }
    float _2085 = _2061;
    float _2087 = _2085;
    if (_1971)
    {
        float _2089 = fma(_2031, _2025, _2075);
        _2055 = _2089;
    }
    float _2091 = _2055;
    if (_1971)
    {
        float _2093 = _2079 * _2079;
        _2045 = _2093;
    }
    float _2095 = _2045;
    if (_1971)
    {
        float _2097 = _2083 * _2083;
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2103 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = fma(_2091, _2091, _2095);
    float _2109 = -_2105;
    float _2111 = _2109 + 1.0;
    float _2113 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2107 + _2099;
    float _2117 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = rsqrt(_2115);
    float _2123 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2125 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2129 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2133 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2135 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2139 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2131);
    float _2141 = abs(_2111);
    float _2143 = log2(_2141);
    float _2145 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2151 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2121 * _2079;
    float _2155 = _2121 * _2091;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = -_2147;
    float _2161 = fma(_2159, _2119, 1.0);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2165 = _2121 * _2083;
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = -_2163;
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2171);
    float _2175 = log2(_2161);
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = -_2165;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2173);
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2187 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2189 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2191 = fma(_2183, -0.5, 0.5);
    float _2193 = exp2(_2185);
    float _2195 = fma(_2183, 0.5, 0.5);
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2199 = _2155 + 1.0;
    float _2201 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2203 = 1.0 / _2189;
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2187);
    float _2207 = fma(_2195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2209 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = _2175 * 0.693147182464599609375;
    float _2213 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2195, _2207, -0.212114393711090087890625);
    float _2217 = sqrt(_2191);
    float _2219 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2221 = -_2155;
    float _2223 = fma(_2193, _2199, _2221);
    float _2225 = fma(_2195, _2215, 1.570728778839111328125);
    float _2227 = fma(_2223, 0.5, 0.5);
    float _2229 = _2209 * _2203;
    float _2231 = _2219 * _2203;
    float _2233 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2235 = fma(_2229, 0.5, 0.5);
    float _2237 = fma(_2231, -0.5, 0.5);
    float _2239 = _2217 * 0.636619746685028076171875;
    float _2241 = -_2225;
    float _2243 = fma(_2239, _2241, 1.0);
    float3 _6091 = float3(_2235, _2237, _2233);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).x;
    float3 _6102 = float3(_2235, _2237, _2233);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6102, float3(0.0), isnan(_6102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6102, float3(0.0), isnan(_6102)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _6119 = float2(_2243, _2227);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6119, float2(0.0), isnan(_6119)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6119, float2(0.0), isnan(_6119)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = -_1311;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _2272 = -_1313;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _2276 = -_1335;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _2280 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2286 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2280);
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2290 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2284);
    float _2292 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2288);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2290);
    float _2298 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2300 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2302 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = exp2(_2298);
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2308 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.5);
    bool _2316 = _2312 || _2314;
    float _2318 = _2306 + _2302;
    float _2320 = 1.0 / _2302;
    float _2322 = _2318 * _2320;
    float _2324 = _2322 * 0.5;
    float _2326 = _2320;
    if (_2316)
    {
        _2326 = 1.0;
    }
    float _2328 = _2326;
    float _2330 = _2328;
    if (!_2316)
    {
        float _2332 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2336 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
        float _2338 = _2332 * 0.15915493667125701904296875;
        float _2340 = _2338 * 6.283185482025146484375;
        float _2342 = cos(_2340);
        float _2344 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2346 = _2344 * 0.15915493667125701904296875;
        float _2348 = _2338 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = 1.0 / _2342;
        float _2354 = _2346 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2350 * _2352;
        float _2360 = 1.0 / _2336;
        float _2362 = _2356 * _2358;
        float _2364 = _2346 * 6.283185482025146484375;
        float _2366 = sin(_2364);
        float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2370 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2368;
        float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2374 = _2360 * _2372;
        float _2376 = 1.0 / _2362;
        float _2378 = 1.0 / _2370;
        float _2380 = _2366 * _2376;
        float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2384 = fma(_2380, _2374, _2382);
        float _2386 = _2384 * _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + 1.0;
        _2330 = _2392;
    }
    float _2394 = _2330;
    float _2396 = -_2304;
    float _2398 = _2396 + 1.0;
    float _2400 = _2300 + _2189;
    bool _2402 = _2394 > 0.0;
    bool _2404 = isnan(_2394);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan(0.0);
    bool _2410 = _2406 || _2408;
    float _2412 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2414 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2416 = _2400 * 0.5;
    float _2418 = _2414 * _2245;
    float _2420 = -_2414;
    float _2422 = _2420 + 1.0;
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2300;
    out.gl_Position.w = _2189;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2426 = _2256 * _2418;
    float _2428 = _2266 * _2418;
    out.m_66.z = _2416;
    out.m_66.w = _2189;
    float _2430 = fma(_2262, _2426, _2250);
    float _2432 = fma(_2264, _2426, _2252);
    float _2434 = _2256 * _2422;
    float _2436 = fma(_2256, _2428, _2254);
    out.m_47.x = _2424;
    out.m_68.x = _2430;
    out.m_68.y = _2432;
    out.m_68.z = _2436;
    out.m_68.w = _2434;
    if (_2410)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2438;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1875 = false;
    bool _1201 = false;
    bool _763 = false;
    bool _653 = false;
    bool _503 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2495 = as_type<float>(_103);
        out.gl_Position.z = _2495;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_139);
        out.gl_Position.z = _2564;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = in.m_49.y;
    float _145 = in.m_49.z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = 0.0;
    float _161 = _147;
    if (!_157)
    {
        float _163 = _147 * _147;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_157)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_157;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _147 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _147);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_157;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _147 * _217;
        float _227 = exp2(_225);
        float _229 = -_227;
        float _231 = _229 + 1.0;
        float _233 = _231 * _223;
        _161 = _233;
    }
    float _235 = _161;
    float _237 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _239 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _241 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _243 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _211 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].x, _239);
    float _249 = _239;
    float _251 = _243;
    if (!_157)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_157)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_157;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _121);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _307 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _261);
    float _309 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].y, _259);
    float _313 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _317 = _305 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _319 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _313);
    float _323 = _313;
    if (!_157)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_157;
    float _329 = _325;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _121 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _329 = _349;
    }
    float _351 = _329;
    float _353 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _315);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _357 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _317);
    float _359 = fma(_235, _143, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _143, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _141, _263);
    float _369 = fma(_351, _141, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _145, _307);
    float _377 = fma(_351, _145, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_51.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = in.m_44.x;
    float _399 = in.m_44.y;
    float _401 = in.m_44.z;
    float _403 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = fma(_389, _389, _393);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _409 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _407);
    float _415 = sqrt(_405);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _419 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _421 = isnan(_415);
    bool _423 = _419 || _421;
    bool _425 = isnan(9.9999999747524270787835121154785e-07);
    bool _427 = _423 || _425;
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _431 = fma(_367, _385, _397);
    float _433 = fma(_359, _385, _399);
    float _435 = fma(_375, _385, _401);
    float _437 = _409;
    float _439 = _429;
    float _441 = _417;
    if (_427)
    {
        _437 = _413;
    }
    float _443 = _437;
    float _445 = _443;
    if (!_427)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _461);
            float _469 = _463 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _471 = _463 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _473 = _463 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _469);
            float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _471);
            float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _473);
            float _481 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _475);
            float _483 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _477);
            float _485 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _479);
            float _487 = _481 * _481;
            float _489 = fma(_483, _483, _487);
            float _491 = fma(_485, _485, _489);
            float _493 = rsqrt(_491);
            float _495 = _493 * 9.9999999747524270787835121154785e-07;
            float _497 = _483 * _495;
            float _499 = _481 * _495;
            float _501 = _485 * _495;
            _439 = _499;
            _445 = _497;
            _441 = _501;
            _503 = true;
        }
        else
        {
            float _505 = _143 * _143;
            float _507 = fma(_141, _141, _505);
            float _509 = fma(_145, _145, _507);
            float _511 = sqrt(_509);
            bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
            bool _515 = isnan(_511);
            bool _517 = _513 || _515;
            bool _519 = isnan(9.9999999747524270787835121154785e-07);
            bool _521 = _517 || _519;
            if (!_521)
            {
                float _523 = _399 * _399;
                float _525 = fma(_397, _397, _523);
                float _527 = fma(_401, _401, _525);
                float _529 = sqrt(_527);
                bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
                bool _533 = isnan(_529);
                bool _535 = _531 || _533;
                bool _537 = isnan(9.9999999747524270787835121154785e-07);
                bool _539 = _535 || _537;
                if (!_539)
                {
                    float _541 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _541);
                    float _545 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _543);
                    float _547 = rsqrt(_545);
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    float _551 = _549 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _549 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _555 = _549 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _553;
                    _445 = _551;
                    _441 = _555;
                    _503 = true;
                }
                else
                {
                    float _557 = _399 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _559 = _399 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _561 = _399 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _563 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].x, _557);
                    float _565 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].x, _559);
                    float _567 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].x, _561);
                    float _569 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _563);
                    float _571 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _565);
                    float _573 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _567);
                    float _575 = _569 * _569;
                    float _577 = fma(_571, _571, _575);
                    float _579 = fma(_573, _573, _577);
                    float _581 = rsqrt(_579);
                    float _583 = _581 * 9.9999999747524270787835121154785e-07;
                    float _585 = _571 * _583;
                    float _587 = _569 * _583;
                    float _589 = _573 * _583;
                    _439 = _587;
                    _445 = _585;
                    _441 = _589;
                    _503 = true;
                }
            }
            else
            {
                float _591 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
                float _609 = _603 * _603;
                float _611 = fma(_605, _605, _609);
                float _613 = fma(_607, _607, _611);
                float _615 = rsqrt(_613);
                float _617 = _615 * 9.9999999747524270787835121154785e-07;
                float _619 = _605 * _617;
                float _621 = _603 * _617;
                float _623 = _607 * _617;
                _439 = _621;
                _445 = _619;
                _441 = _623;
            }
        }
    }
    _503 = false;
    float _625 = _439;
    float _627 = _445;
    float _629 = _441;
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _633 = !_631;
    float _651;
    if (!_633)
    {
        float _635 = in.m_53.x;
        float _637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _639 = _635 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _643 = _641 * _637;
        float _645 = floor(_643);
        float _647 = -_645;
        float _649 = _643 + _647;
        _651 = _649;
        _653 = true;
    }
    else
    {
        float _655 = float(_87);
        float _657 = 1.0 / _655;
        float _659 = _121 * _657;
        _651 = _659;
    }
    _653 = false;
    float _661 = _651;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _665 = _661 + _663;
    float _667 = in.m_51.x;
    float _669 = in.m_51.y;
    bool _671 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_661);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _683;
    bool _687 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_661);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _703;
    float _707 = 1.0 / _685;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _711 = _697 * _701;
    float _713 = -_697;
    float _715 = _713 + 1.0;
    float _717 = _665 * _707;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _719;
    float _723 = fma(_705, _717, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _725 = fma(_721, _717, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _723 * _711;
    float _729 = _725 * _711;
    float _731 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _727);
    float _733 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _735 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _739 = _735 * _667;
    float _741 = _737 * _669;
    bool _743 = !_709;
    float _761;
    if (!_743)
    {
        float _745 = in.m_53.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_87);
        float _767 = 1.0 / _765;
        float _769 = _121 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _775 = _771 + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _779 = _771 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _785;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = 1.0 / _783;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _811 = 1.0 / _791;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    bool _825 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _827 = 1.0 / _787;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _831 = _771 + _829;
    float _833 = _775 * _801;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _837 = _771 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _839;
    float _843 = 1.0 / _795;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _847 = _771 + _845;
    float _849 = _831 * _811;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _863;
    float _867 = 1.0 / _805;
    bool _869 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _871 = isnan(_771);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _847 * _827;
    float _883 = -_879;
    float _885 = _883 + 1.0;
    float _887 = 1.0 / _799;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _891 = _771 + _889;
    float _893 = _837 * _843;
    bool _895 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _897 = isnan(_771);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _861 * _885;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _909;
    float _913 = 1.0 / _809;
    float _915 = _891 * _867;
    float _917 = -_861;
    float _919 = _917 + 1.0;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _923 = _771 + _921;
    float _925 = -_905;
    float _927 = _925 + 1.0;
    float _929 = _905 * _919;
    bool _931 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _933 = isnan(_771);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _779 * _887;
    bool _945 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _947 = isnan(_771);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _957;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _965 = -_941;
    float _967 = _965 + 1.0;
    float _969 = fma(_959, _881, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _971 = _955 * _927;
    float _973 = _923 * _913;
    float _975 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _977 = -_955;
    float _979 = _977 + 1.0;
    float _981 = fma(_865, _881, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _991 = _941 * _979;
    bool _993 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _995 = isnan(_771);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = fma(_963, _849, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    bool _1007 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1009 = isnan(_771);
    bool _1011 = _1007 || _1009;
    bool _1013 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1015 = _1011 || _1013;
    float _1017 = float(_1015);
    float _1019 = fma(_985, _849, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1021 = fma(_989, _849, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1023 = _823 * _967;
    float _1025 = -_823;
    float _1027 = _1025 + 1.0;
    float _1029 = -_1017;
    float _1031 = _1029 + 1.0;
    float _1033 = _1017 * _1027;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1035;
    float _1039 = _1003 * _1031;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1041;
    float _1045 = -_1003;
    float _1047 = _1045 + 1.0;
    float _1049 = fma(_1037, _833, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1051 = _975 * _1039;
    float _1053 = fma(_1043, _833, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1055 = fma(_841, _833, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1057 = _969 * _1039;
    float _1059 = _981 * _1039;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1063 = _1061 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1067 = _1065 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1071 = _1069 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1073 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1057);
    float _1075 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1051);
    float _1077 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1059);
    float _1079 = fma(_1063, _943, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1081 = fma(_1067, _943, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1083 = fma(_1071, _943, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1085 = fma(_1005, _1033, _1073);
    float _1087 = fma(_1019, _1033, _1075);
    float _1089 = fma(_1021, _1033, _1077);
    float _1091 = fma(_1049, _1023, _1085);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1093;
    float _1097 = fma(_1053, _1023, _1087);
    float _1099 = fma(_1055, _1023, _1089);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1121 = fma(_1095, _915, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1123 = fma(_1103, _915, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1125 = fma(_1107, _915, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1127 = fma(_1111, _973, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1129 = fma(_1115, _973, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1131 = fma(_1119, _973, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1133 = fma(_1079, _991, _1091);
    float _1135 = fma(_1081, _991, _1097);
    float _1137 = fma(_1083, _991, _1099);
    float _1139 = fma(_1121, _971, _1133);
    float _1141 = fma(_1123, _971, _1135);
    float _1143 = fma(_1125, _971, _1137);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1145;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1149;
    float _1153 = fma(_1127, _929, _1139);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1155;
    float _1159 = fma(_1147, _893, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1161 = fma(_1151, _893, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1163 = fma(_1129, _929, _1141);
    float _1165 = fma(_1157, _893, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1167 = fma(_1131, _929, _1143);
    float _1169 = fma(_1159, _907, _1153);
    float _1171 = fma(_1161, _907, _1163);
    float _1173 = fma(_1165, _907, _1167);
    float _1175 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1169);
    float _1177 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1171);
    float _1179 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1173);
    bool _1181 = !_825;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_53.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_87);
        float _1205 = 1.0 / _1203;
        float _1207 = _121 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1213 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1215 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1217 = as_type<float>(int(gl_VertexIndex));
    float _1219 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1211);
    float _1221 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1213);
    float _1223 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1215);
    float _1225 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1227 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1219);
    float _1229 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1221);
    float _1231 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1237 = _1229 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1239 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1235 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1237 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1251 = _1239 + _1249;
    float _1253 = _1243 * _1243;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1209 + _1255;
    bool _1259 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1261 = isnan(_1209);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1247, _1247, _1253);
    float _1273 = _625 * _625;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1279 = as_type<int>(_1217) & 1;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>(_1217) & 2;
    bool _1285 = _1283 != 0;
    float _1287 = fma(_1251, _1251, _1271);
    float _1289 = fma(_627, _627, _1273);
    bool _1291 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1293 = isnan(_1209);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = 1.0 / _1277;
    float _1305 = fma(_629, _629, _1289);
    float _1307 = rsqrt(_1287);
    float _1309 = rsqrt(_1305);
    float _1311 = _1243 * _1307;
    float _1313 = _1247 * _1307;
    float _1315 = -_1311;
    float _1317 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1319 = -_1313;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1323 = _1309 * _629;
    float _1325 = _1309 * _627;
    float _1327 = _1309 * _625;
    float _1329 = _1317 * _1317;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1333 = _1323 * _1331;
    float _1335 = _1251 * _1307;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1339 = _1327 * _1337;
    float _1341 = fma(_1321, _1321, _1329);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1345 = -_1333;
    float _1347 = fma(_1325, _1343, _1345);
    float _1349 = -_1335;
    float _1351 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1353 = in.m_53.x;
    float _1355 = in.m_53.y;
    float _1357 = in.m_53.z;
    float _1359 = in.m_53.w;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1363 = _1325 * _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1367 = -_1339;
    float _1369 = fma(_1323, _1365, _1367);
    float _1371 = _1347 * _1347;
    float _1373 = fma(_1351, _1351, _1341);
    float _1375 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1377 = -_1363;
    float _1379 = fma(_1327, _1375, _1377);
    float _1381 = fma(_1369, _1369, _1371);
    float _1383 = sqrt(_1373);
    float _1385 = fma(_1379, _1379, _1381);
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1397 = _1395 != 0;
    float _1399 = rsqrt(_1385);
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1285;
    float _1407 = _1405 ? (-0.5) : 0.5;
    float _1409 = _1307 * _1383;
    bool _1411 = _1353 > 0.5;
    bool _1413 = !_1281;
    float _1415 = _1413 ? (-0.5) : 0.5;
    float _1417 = _1225 * _1409;
    bool _1419 = _1357 > 0.5;
    float _1421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1407);
    bool _1423 = _1355 > 0.5;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1415);
    float _1427 = _1233 * _1409;
    float _1429 = _1347 * _1399;
    float _1431 = _1379 * _1399;
    float _1433 = _1417 * _1421;
    float _1435 = _1369 * _1399;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1439 = _1437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1441 = _1427 * _1425;
    float _1443 = _1327 * _1431;
    float _1445 = _1433 * _1325;
    float _1447 = _1325 * _1429;
    float _1449 = _1433 * _1323;
    float _1451 = 1.0 / _1439;
    float _1453 = -_1443;
    float _1455 = fma(_1323, _1429, _1453);
    float _1457 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1459 = _1457 * 0.5;
    float _1461 = fma(_1441, _1435, _1445);
    float _1463 = fma(_1441, _1431, _1449);
    float _1465 = -_1415;
    int _1467 = _1411 ? as_type<int>(_1465) : as_type<int>(_1415);
    float _1469 = _1323 * _1435;
    float _1471 = fma(_1459, _1455, _1461);
    float _1473 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = -_1447;
    float _1479 = fma(_1327, _1435, _1477);
    float _1481 = _1237 + _1471;
    bool _1483 = _1359 > 0.5;
    float _1485 = fma(_1459, _1479, _1463);
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1487;
    float _1491 = fma(_1475, -0.64999997615814208984375, 1.0);
    float _1493 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1495 = _1481 + _1493;
    float _1497 = _1239 + _1485;
    float _1499 = _1489 * _1451;
    float _1501 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1503 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1505 = _1497 + _1503;
    bool _1507 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1509 = isnan(_1209);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1515 = _1511 || _1513;
    float _1517 = float(_1515);
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1501 + _1523;
    float _1527 = fma(_1505, _1491, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1529 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1531 = isnan(_1209);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = 1.0 / _1521;
    float _1543 = _1525 * _1525;
    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1547 = _1527 + _1545;
    float _1549 = -_1517;
    float _1551 = _1549 + 1.0;
    float _1553 = -_1539;
    float _1555 = _1553 + 1.0;
    float _1557 = _1433 * _1327;
    float _1559 = _1547 * _1547;
    float _1561 = _1539 * _1551;
    float _1563 = -_1469;
    float _1565 = fma(_1325, _1431, _1563);
    float _1567 = _1543 + _1559;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1573 = fma(_1441, _1429, _1557);
    float _1575 = fma(_1499, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1577 = sqrt(_1567);
    float _1579 = _1269 * _1555;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1209 + _1581;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1585;
    float _1589 = -_1269;
    float _1591 = _1589 + 1.0;
    float _1593 = _1571 * _1541;
    float _1595 = fma(_1459, _1565, _1573);
    bool _1597 = !_1389;
    float _1599 = _1597 ? _1415 : as_type<float>(_1467);
    float _1601 = _1587 * _1303;
    float _1603 = _1301 * _1591;
    float _1605 = fma(_1593, _1583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1607 = _1235 + _1595;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1209 + _1611;
    float _1615 = _1575 * _1603;
    float _1617 = -_1301;
    float _1619 = _1617 + 1.0;
    bool _1621 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1623 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1625 = _1607 + _1623;
    float _1627 = fma(_1601, _1613, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1615);
    float _1631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1633 = fma(_1625, _1491, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1635 = -_1415;
    int _1637 = _1419 ? as_type<int>(_1635) : as_type<int>(_1415);
    float _1639 = fma(_1605, _1579, _1629);
    bool _1641 = !_1397;
    float _1643 = _1641 ? _1415 : as_type<float>(_1637);
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1647 = _1491;
    float _1649 = _1625;
    float _1651 = _1543;
    float _1653 = _1559;
    float _1655 = _1441;
    if (!_1621)
    {
        _1647 = _1559;
    }
    float _1657 = _1647;
    float _1659 = _1657;
    if (!_1621)
    {
        _1649 = _1543;
    }
    float _1661 = _1649;
    float _1663 = _1661;
    if (!_1621)
    {
        _1651 = _1501;
    }
    float _1665 = _1651;
    float _1667 = _1665;
    if (!_1621)
    {
        _1653 = _1527;
    }
    float _1669 = _1653;
    float _1671 = _1669;
    if (!_1621)
    {
        _1655 = _1633;
    }
    float _1673 = _1655;
    bool _1675 = !_1621;
    float _1677 = _1673;
    if (!_1675)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1683 = _1577 + _1681;
        float _1685 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = rsqrt(_1567);
        float _1689 = _1683 * _1679;
        float _1691 = _1689 * 0.15915493667125701904296875;
        float _1693 = _1691 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = fma(_1695, _1685, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1703 = _1687 * _1701;
        float _1705 = _1699 + (-1.0);
        float _1707 = fma(_1525, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1709 = fma(_1547, _1703, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1715 = _1707 + _1713;
        float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1719 = _1709 + _1717;
        float _1721 = fma(_1633, _1699, _1711);
        float _1723 = _1715 * _1715;
        float _1725 = _1719 * _1719;
        _1677 = _1721;
        _1663 = _1723;
        _1659 = _1725;
        _1667 = _1707;
        _1671 = _1709;
    }
    float _1727 = _1677;
    float _1729 = _1663;
    float _1731 = _1659;
    float _1733 = _1667;
    float _1735 = _1671;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1739 = _1727 + _1737;
    float _1741 = -_1407;
    int _1743 = _1423 ? as_type<int>(_1741) : as_type<int>(_1407);
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1747 = -_1407;
    int _1749 = _1483 ? as_type<int>(_1747) : as_type<int>(_1407);
    float _1751 = fma(_1739, _1739, _1729);
    bool _1753 = !_1393;
    float _1755 = _1753 ? _1407 : as_type<float>(_1743);
    float _1757 = fma(_1627, _1561, _1639);
    bool _1759 = !_1403;
    float _1761 = _1759 ? _1407 : as_type<float>(_1749);
    float _1763 = _1751 + _1731;
    float _1765 = _1643 + 0.5;
    float _1767 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1757);
    float _1769 = -_1755;
    float _1771 = _1769 + 0.5;
    float _1773 = -_1761;
    float _1775 = _1773 + 0.5;
    float _1777 = _1599 + 0.5;
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1781 = sqrt(_1763);
    float _1783 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1785 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1789 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1791 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1793 = _1179 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1801 = _1779 * _1631;
    float _1803 = _1783 * _1645;
    float _1805 = _1785 * _1745;
    float _1807 = _1787 * _1609;
    float _1809 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1821 = _1767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1807;
    out.m_58.y = _1801;
    out.m_58.z = _1803;
    out.m_58.w = _1805;
    bool _1823 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1825 = isnan(_1781);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1831 = _1827 || _1829;
    out.m_60.x = _1813;
    out.m_60.y = _1815;
    out.m_60.z = _1817;
    out.m_62.x = _1809;
    out.m_62.y = _1811;
    out.m_62.z = _1819;
    out.m_62.w = _1821;
    out.m_64.x = _1427;
    out.m_64.y = _1417;
    float _1833 = _1791;
    float _1835 = _1811;
    float _1837 = _1781;
    float _1839 = _1821;
    if (!_1831)
    {
        _1833 = 1.0;
    }
    float _1841 = _1833;
    bool _1843 = !_1831;
    float _1845 = _1841;
    if (!_1843)
    {
        bool _1847 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1849 = isnan(_1781);
        bool _1851 = _1847 || _1849;
        bool _1853 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1855 = _1851 || _1853;
        if (!_1855)
        {
            float _1857 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1859 = _1781 + _1857;
            float _1861 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1863 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1861;
            float _1865 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1869 = 1.0 / _1863;
            float _1871 = _1859 * _1869;
            float _1873 = fma(_1871, _1867, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1845 = _1873;
            _1875 = true;
        }
        else
        {
            bool _1877 = _1781 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1879 = isnan(_1781);
            bool _1881 = _1877 || _1879;
            bool _1883 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1885 = _1881 || _1883;
            if (!_1885)
            {
                float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1889 = _1781 + _1887;
                float _1891 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1893 = _1891 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1895 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1897 = _1895 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1899 = 1.0 / _1893;
                float _1901 = _1889 * _1899;
                float _1903 = fma(_1901, _1897, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1845 = _1903;
                _1875 = true;
            }
            else
            {
                _1845 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1875 = false;
    float _1905 = _1845;
    float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1909 = _1727 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1913 = _1733 + _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1917 = _1735 + _1915;
    float _1919 = fma(_1909, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1921 = fma(_1913, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1923 = -_1311;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1919);
    float _1927 = fma(_1917, _1905, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1929 = -_1313;
    float _1931 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1921);
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1935 = _1925 + _1933;
    float _1937 = -_1335;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1927);
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1943 = _1931 + _1941;
    float _1945 = _1935 * _1935;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1949 = _1939 + _1947;
    float _1951 = fma(_1943, _1943, _1945);
    float _1953 = fma(_1949, _1949, _1951);
    float _1955 = rsqrt(_1953);
    float _1957 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1959 = _1943 * _1957;
    float _1961 = _1949 * _1957;
    float _1963 = _1959 * _1959;
    float _1965 = _1961 * _1961;
    float _1967 = _1963 + _1965;
    float _1969 = sqrt(_1967);
    bool _1971 = _1969 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1975 = _1969 + _1973;
    float _1977 = _1949;
    float _1979 = _1967;
    float _1981 = _1975;
    float _1983 = _1959;
    if (_1971)
    {
        float _1985 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1977 = _1985;
    }
    float _1987 = _1977;
    if (_1971)
    {
        float _1989 = rsqrt(_1967);
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1971)
    {
        float _1993 = _1975 * _1987;
        _1981 = _1993;
    }
    float _1995 = _1981;
    if (_1971)
    {
        float _1997 = _1995 * 0.15915493667125701904296875;
        _1835 = _1997;
    }
    float _1999 = _1835;
    float _2001 = _1789;
    float _2003 = _1999;
    if (_1971)
    {
        float _2005 = _1999 * 6.283185482025146484375;
        float _2007 = sin(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2013 = precise::max(0.0, _2011);
    float _2015 = _1955;
    float _2017 = _2013;
    float _2019 = _2011;
    if (_1971)
    {
        float _2021 = _1999 * 6.283185482025146484375;
        float _2023 = cos(_2021);
        _2015 = _2023;
    }
    float _2025 = _2015;
    float _2027 = -_1957;
    float _2029 = -_2013;
    float _2031 = fma(_1935, _2027, _2029);
    if (_1971)
    {
        float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2017 = _2033;
    }
    float _2035 = _2017;
    float _2037 = _2035;
    if (!_1971)
    {
        _2003 = _1963;
    }
    float _2039 = _2003;
    float _2041 = sqrt(_1953);
    float _2043 = _2009;
    float _2045 = _2039;
    if (_1971)
    {
        float _2047 = fma(_2009, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2037 = _2047;
    }
    float _2049 = _2037;
    float _2051 = _2049;
    if (!_1971)
    {
        _2043 = _2031;
    }
    float _2053 = _2043;
    float _2055 = _2053;
    if (_1971)
    {
        float _2057 = _2025 + (-1.0);
        _2019 = _2057;
    }
    float _2059 = _2019;
    float _2061 = _2059;
    if (_1971)
    {
        float _2063 = _1991 * _2049;
        _1837 = _2063;
    }
    float _2065 = _1837;
    if (!_1971)
    {
        _2051 = _1961;
    }
    float _2067 = _2051;
    float _2069 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2071 = _2067;
    if (_1971)
    {
        float _2073 = _2059 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1839 = _2073;
    }
    float _2075 = _1839;
    if (_1971)
    {
        float _2077 = _1959 * _2065;
        _1983 = _2077;
    }
    float _2079 = _1983;
    if (_1971)
    {
        float _2081 = _1961 * _2065;
        _2071 = _2081;
    }
    float _2083 = _2071;
    if (!_1971)
    {
        _2061 = _1965;
    }
    float _2085 = _2061;
    float _2087 = _2085;
    if (_1971)
    {
        float _2089 = fma(_2031, _2025, _2075);
        _2055 = _2089;
    }
    float _2091 = _2055;
    if (_1971)
    {
        float _2093 = _2079 * _2079;
        _2045 = _2093;
    }
    float _2095 = _2045;
    if (_1971)
    {
        float _2097 = _2083 * _2083;
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2103 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2101);
    float _2105 = precise::clamp(_2103, 0.0, 1.0);
    float _2107 = fma(_2091, _2091, _2095);
    float _2109 = -_2105;
    float _2111 = _2109 + 1.0;
    float _2113 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = _2107 + _2099;
    float _2117 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = rsqrt(_2115);
    float _2123 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2117);
    float _2125 = _1925 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2129 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2133 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2069);
    float _2135 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2127);
    float _2137 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2139 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2131);
    float _2141 = abs(_2111);
    float _2143 = log2(_2141);
    float _2145 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2147 = _2137 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2151 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2153 = _2121 * _2079;
    float _2155 = _2121 * _2091;
    float _2157 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = -_2147;
    float _2161 = fma(_2159, _2119, 1.0);
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2165 = _2121 * _2083;
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = -_2163;
    float _2173 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2171);
    float _2175 = log2(_2161);
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2179 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = -_2165;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2173);
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2187 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2189 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2191 = fma(_2183, -0.5, 0.5);
    float _2193 = exp2(_2185);
    float _2195 = fma(_2183, 0.5, 0.5);
    float _2197 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2177);
    float _2199 = _2155 + 1.0;
    float _2201 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2203 = 1.0 / _2189;
    float _2205 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2187);
    float _2207 = fma(_2195, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2209 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2201);
    float _2211 = _2175 * 0.693147182464599609375;
    float _2213 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2215 = fma(_2195, _2207, -0.212114393711090087890625);
    float _2217 = sqrt(_2191);
    float _2219 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2213);
    float _2221 = -_2155;
    float _2223 = fma(_2193, _2199, _2221);
    float _2225 = fma(_2195, _2215, 1.570728778839111328125);
    float _2227 = fma(_2223, 0.5, 0.5);
    float _2229 = _2209 * _2203;
    float _2231 = _2219 * _2203;
    float _2233 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2235 = fma(_2229, 0.5, 0.5);
    float _2237 = fma(_2231, -0.5, 0.5);
    float _2239 = _2217 * 0.636619746685028076171875;
    float _2241 = -_2225;
    float _2243 = fma(_2239, _2241, 1.0);
    float3 _6091 = float3(_2235, _2237, _2233);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6091, float3(0.0), isnan(_6091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6091, float3(0.0), isnan(_6091)), level(0.0)).x;
    float3 _6102 = float3(_2235, _2237, _2233);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6102, float3(0.0), isnan(_6102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6102, float3(0.0), isnan(_6102)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _6119 = float2(_2243, _2227);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6119, float2(0.0), isnan(_6119)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6119, float2(0.0), isnan(_6119)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = -_1311;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1235);
    float _2272 = -_1313;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1237);
    float _2276 = -_1335;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1239);
    float _2280 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2282 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2286 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2280);
    float _2288 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2282);
    float _2290 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2284);
    float _2292 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2294 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2288);
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2290);
    float _2298 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2300 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2302 = _2294 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = exp2(_2298);
    float _2306 = _2296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2308 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.5);
    bool _2316 = _2312 || _2314;
    float _2318 = _2306 + _2302;
    float _2320 = 1.0 / _2302;
    float _2322 = _2318 * _2320;
    float _2324 = _2322 * 0.5;
    float _2326 = _2320;
    if (_2316)
    {
        _2326 = 1.0;
    }
    float _2328 = _2326;
    float _2330 = _2328;
    if (!_2316)
    {
        float _2332 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2336 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2334);
        float _2338 = _2332 * 0.15915493667125701904296875;
        float _2340 = _2338 * 6.283185482025146484375;
        float _2342 = cos(_2340);
        float _2344 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2346 = _2344 * 0.15915493667125701904296875;
        float _2348 = _2338 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = 1.0 / _2342;
        float _2354 = _2346 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2350 * _2352;
        float _2360 = 1.0 / _2336;
        float _2362 = _2356 * _2358;
        float _2364 = _2346 * 6.283185482025146484375;
        float _2366 = sin(_2364);
        float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2370 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2368;
        float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2374 = _2360 * _2372;
        float _2376 = 1.0 / _2362;
        float _2378 = 1.0 / _2370;
        float _2380 = _2366 * _2376;
        float _2382 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2384 = fma(_2380, _2374, _2382);
        float _2386 = _2384 * _2378;
        float _2388 = precise::clamp(_2386, 0.0, 1.0);
        float _2390 = -_2388;
        float _2392 = _2390 + 1.0;
        _2330 = _2392;
    }
    float _2394 = _2330;
    float _2396 = -_2304;
    float _2398 = _2396 + 1.0;
    float _2400 = _2300 + _2189;
    bool _2402 = _2394 > 0.0;
    bool _2404 = isnan(_2394);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan(0.0);
    bool _2410 = _2406 || _2408;
    float _2412 = _2394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2414 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2416 = _2400 * 0.5;
    float _2418 = _2414 * _2245;
    float _2420 = -_2414;
    float _2422 = _2420 + 1.0;
    out.gl_Position.x = _2209;
    out.gl_Position.y = _2219;
    out.gl_Position.z = _2300;
    out.gl_Position.w = _2189;
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2426 = _2256 * _2418;
    float _2428 = _2266 * _2418;
    out.m_66.z = _2416;
    out.m_66.w = _2189;
    float _2430 = fma(_2262, _2426, _2250);
    float _2432 = fma(_2264, _2426, _2252);
    float _2434 = _2256 * _2422;
    float _2436 = fma(_2256, _2428, _2254);
    out.m_47.x = _2424;
    out.m_68.x = _2430;
    out.m_68.y = _2432;
    out.m_68.z = _2436;
    out.m_68.w = _2434;
    if (_2410)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2438;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

