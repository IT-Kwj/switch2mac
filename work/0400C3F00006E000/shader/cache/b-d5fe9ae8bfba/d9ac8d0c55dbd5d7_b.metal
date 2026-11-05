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
    bool _1605 = false;
    bool _931 = false;
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
    float _105 = as_type<float>(_103);
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_103);
        out.gl_Position.z = _2226;
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
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_141);
        out.gl_Position.z = _2294;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _105 = _165;
    }
    float _167 = _105;
    float _169 = _167;
    if (!_159)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_159;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _149 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _149);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_159;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _149 * _217;
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
    if (!_159)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_159)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = exp2(_283);
        float _287 = _281 * 0.693147182464599609375;
        float _289 = 1.0 / _287;
        float _291 = 1.0 / _279;
        float _293 = _285 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _289, _121);
        float _299 = _297 * _291;
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
    if (!_159)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_159;
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
    float _359 = fma(_235, _145, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _145, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _143, _263);
    float _369 = fma(_351, _143, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _147, _307);
    float _377 = fma(_351, _147, _365);
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
            float _505 = _145 * _145;
            float _507 = fma(_143, _143, _505);
            float _509 = fma(_147, _147, _507);
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
                float _591 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
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
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _771 + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / _811;
    float _827 = -_823;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _833 = _803 * _829;
    float _835 = -_803;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _807;
    float _841 = _791 * _825;
    float _843 = _775 * _839;
    float _845 = -_787;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = _823 * _847;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = fma(_851, _843, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _865 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = _863 * _833;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _875 = _865 * _833;
    float _877 = _867 * _833;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _887 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _889 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].y, _869);
    float _891 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = fma(_873, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _895 = fma(_885, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _897 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _899 = fma(_891, _853, _887);
    float _901 = fma(_893, _853, _889);
    float _903 = fma(_895, _853, _897);
    float _905 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].x, _899);
    float _907 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].y, _901);
    float _909 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].z, _903);
    bool _911 = !_831;
    float _929;
    if (!_911)
    {
        float _913 = in.m_53.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_87);
        float _935 = 1.0 / _933;
        float _937 = _121 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _945 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _947 = as_type<float>(int(gl_VertexIndex));
    float _949 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _943);
    float _953 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _945);
    float _955 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _957 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _959 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _951);
    float _961 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _953);
    float _963 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = _957 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _965 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _967 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _969 + _979;
    float _983 = _973 * _973;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _987 = _939 + _985;
    bool _989 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_939);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_977, _977, _983);
    float _1003 = _625 * _625;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1009 = as_type<int>(_947) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>(_947) & 2;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_981, _981, _1001);
    float _1019 = fma(_627, _627, _1003);
    bool _1021 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1023 = isnan(_939);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = 1.0 / _1007;
    float _1035 = fma(_629, _629, _1019);
    float _1037 = rsqrt(_1017);
    float _1039 = rsqrt(_1035);
    float _1041 = _973 * _1037;
    float _1043 = _977 * _1037;
    float _1045 = -_1041;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1049 = -_1043;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1053 = _1039 * _629;
    float _1055 = _1039 * _627;
    float _1057 = _1039 * _625;
    float _1059 = _1047 * _1047;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1063 = _1053 * _1061;
    float _1065 = _981 * _1037;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1069 = _1057 * _1067;
    float _1071 = fma(_1051, _1051, _1059);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1075 = -_1063;
    float _1077 = fma(_1055, _1073, _1075);
    float _1079 = -_1065;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1083 = in.m_53.x;
    float _1085 = in.m_53.y;
    float _1087 = in.m_53.z;
    float _1089 = in.m_53.w;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = _1055 * _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1069;
    float _1099 = fma(_1053, _1095, _1097);
    float _1101 = _1077 * _1077;
    float _1103 = fma(_1081, _1081, _1071);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1107 = -_1093;
    float _1109 = fma(_1057, _1105, _1107);
    float _1111 = fma(_1099, _1099, _1101);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1109, _1109, _1111);
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1127 = _1125 != 0;
    float _1129 = rsqrt(_1115);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1133 = _1131 != 0;
    bool _1135 = !_1015;
    float _1137 = _1135 ? (-0.5) : 0.5;
    float _1139 = _1037 * _1113;
    bool _1141 = _1083 > 0.5;
    bool _1143 = !_1011;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = _955 * _1139;
    bool _1149 = _1087 > 0.5;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    bool _1153 = _1085 > 0.5;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1157 = _963 * _1139;
    float _1159 = _1077 * _1129;
    float _1161 = _1109 * _1129;
    float _1163 = _1147 * _1151;
    float _1165 = _1099 * _1129;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1157 * _1155;
    float _1173 = _1057 * _1161;
    float _1175 = _1163 * _1055;
    float _1177 = _1055 * _1159;
    float _1179 = _1163 * _1053;
    float _1181 = 1.0 / _1169;
    float _1183 = -_1173;
    float _1185 = fma(_1053, _1159, _1183);
    float _1187 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1189 = _1187 * 0.5;
    float _1191 = fma(_1171, _1165, _1175);
    float _1193 = fma(_1171, _1161, _1179);
    float _1195 = -_1145;
    int _1197 = _1141 ? as_type<int>(_1195) : as_type<int>(_1145);
    float _1199 = _1053 * _1165;
    float _1201 = fma(_1189, _1185, _1191);
    float _1203 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1177;
    float _1209 = fma(_1057, _1165, _1207);
    float _1211 = _967 + _1201;
    bool _1213 = _1089 > 0.5;
    float _1215 = fma(_1189, _1209, _1193);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = fma(_1205, -0.64999997615814208984375, 1.0);
    float _1223 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1225 = _1211 + _1223;
    float _1227 = _969 + _1215;
    float _1229 = _1219 * _1181;
    float _1231 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1227 + _1233;
    bool _1237 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1239 = isnan(_939);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1231 + _1253;
    float _1257 = fma(_1235, _1221, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1259 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1261 = isnan(_939);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = 1.0 / _1251;
    float _1273 = _1255 * _1255;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1257 + _1275;
    float _1279 = -_1247;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1269;
    float _1285 = _1283 + 1.0;
    float _1287 = _1163 * _1057;
    float _1289 = _1277 * _1277;
    float _1291 = _1269 * _1281;
    float _1293 = -_1199;
    float _1295 = fma(_1055, _1161, _1293);
    float _1297 = _1273 + _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1303 = fma(_1171, _1159, _1287);
    float _1305 = fma(_1229, _987, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1307 = sqrt(_1297);
    float _1309 = _999 * _1285;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _939 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1315;
    float _1319 = -_999;
    float _1321 = _1319 + 1.0;
    float _1323 = _1301 * _1271;
    float _1325 = fma(_1189, _1295, _1303);
    bool _1327 = !_1119;
    float _1329 = _1327 ? _1145 : as_type<float>(_1197);
    float _1331 = _1317 * _1033;
    float _1333 = _1031 * _1321;
    float _1335 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1337 = _965 + _1325;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1343 = _939 + _1341;
    float _1345 = _1305 * _1333;
    float _1347 = -_1031;
    float _1349 = _1347 + 1.0;
    bool _1351 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = _1337 + _1353;
    float _1357 = fma(_1331, _1343, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1345);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1363 = fma(_1355, _1221, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1365 = -_1145;
    int _1367 = _1149 ? as_type<int>(_1365) : as_type<int>(_1145);
    float _1369 = fma(_1335, _1309, _1359);
    bool _1371 = !_1127;
    float _1373 = _1371 ? _1145 : as_type<float>(_1367);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1377 = _1221;
    float _1379 = _1355;
    float _1381 = _1273;
    float _1383 = _1289;
    float _1385 = _1171;
    if (!_1351)
    {
        _1377 = _1289;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1351)
    {
        _1379 = _1273;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (!_1351)
    {
        _1381 = _1231;
    }
    float _1395 = _1381;
    float _1397 = _1395;
    if (!_1351)
    {
        _1383 = _1257;
    }
    float _1399 = _1383;
    float _1401 = _1399;
    if (!_1351)
    {
        _1385 = _1363;
    }
    float _1403 = _1385;
    bool _1405 = !_1351;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1307 + _1411;
        float _1415 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1297);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = fma(_1425, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1433 = _1417 * _1431;
        float _1435 = _1429 + (-1.0);
        float _1437 = fma(_1255, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = fma(_1277, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1449 = _1439 + _1447;
        float _1451 = fma(_1363, _1429, _1441);
        float _1453 = _1445 * _1445;
        float _1455 = _1449 * _1449;
        _1407 = _1451;
        _1393 = _1453;
        _1389 = _1455;
        _1397 = _1437;
        _1401 = _1439;
    }
    float _1457 = _1407;
    float _1459 = _1393;
    float _1461 = _1389;
    float _1463 = _1397;
    float _1465 = _1401;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1469 = _1457 + _1467;
    float _1471 = -_1137;
    int _1473 = _1153 ? as_type<int>(_1471) : as_type<int>(_1137);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1477 = -_1137;
    int _1479 = _1213 ? as_type<int>(_1477) : as_type<int>(_1137);
    float _1481 = fma(_1469, _1469, _1459);
    bool _1483 = !_1123;
    float _1485 = _1483 ? _1137 : as_type<float>(_1473);
    float _1487 = fma(_1357, _1291, _1369);
    bool _1489 = !_1133;
    float _1491 = _1489 ? _1137 : as_type<float>(_1479);
    float _1493 = _1481 + _1461;
    float _1495 = _1373 + 0.5;
    float _1497 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1487);
    float _1499 = -_1485;
    float _1501 = _1499 + 0.5;
    float _1503 = -_1491;
    float _1505 = _1503 + 0.5;
    float _1507 = _1329 + 0.5;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = sqrt(_1493);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1521 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1531 = _1509 * _1361;
    float _1533 = _1513 * _1375;
    float _1535 = _1515 * _1475;
    float _1537 = _1517 * _1339;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1537;
    out.m_58.y = _1531;
    out.m_58.z = _1533;
    out.m_58.w = _1535;
    bool _1553 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1555 = isnan(_1511);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1561 = _1557 || _1559;
    out.m_60.x = _1543;
    out.m_60.y = _1545;
    out.m_60.z = _1547;
    out.m_62.x = _1539;
    out.m_62.y = _1541;
    out.m_62.z = _1549;
    out.m_62.w = _1551;
    out.m_64.x = _1157;
    out.m_64.y = _1147;
    float _1563 = _1523;
    float _1565 = _1541;
    float _1567 = _1511;
    float _1569 = _1551;
    if (!_1561)
    {
        _1563 = 1.0;
    }
    float _1571 = _1563;
    bool _1573 = !_1561;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1511);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1511 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1511);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1511 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1457 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1643 = _1463 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1647 = _1465 + _1645;
    float _1649 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = -_1041;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1657 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_1043;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1665 = _1655 + _1663;
    float _1667 = -_1065;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1657);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1661 + _1671;
    float _1675 = _1665 * _1665;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = _1669 + _1677;
    float _1681 = fma(_1673, _1673, _1675);
    float _1683 = fma(_1679, _1679, _1681);
    float _1685 = rsqrt(_1683);
    float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1689 = _1673 * _1687;
    float _1691 = _1679 * _1687;
    float _1693 = _1689 * _1689;
    float _1695 = _1691 * _1691;
    float _1697 = _1693 + _1695;
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1705 = _1699 + _1703;
    float _1707 = _1679;
    float _1709 = _1697;
    float _1711 = _1705;
    float _1713 = _1689;
    if (_1701)
    {
        float _1715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1707 = _1715;
    }
    float _1717 = _1707;
    if (_1701)
    {
        float _1719 = rsqrt(_1697);
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (_1701)
    {
        float _1723 = _1705 * _1717;
        _1711 = _1723;
    }
    float _1725 = _1711;
    if (_1701)
    {
        float _1727 = _1725 * 0.15915493667125701904296875;
        _1565 = _1727;
    }
    float _1729 = _1565;
    float _1731 = _1521;
    float _1733 = _1729;
    if (_1701)
    {
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1743 = precise::max(0.0, _1741);
    float _1745 = _1685;
    float _1747 = _1743;
    float _1749 = _1741;
    if (_1701)
    {
        float _1751 = _1729 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = -_1687;
    float _1759 = -_1743;
    float _1761 = fma(_1665, _1757, _1759);
    if (_1701)
    {
        float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1747 = _1763;
    }
    float _1765 = _1747;
    float _1767 = _1765;
    if (!_1701)
    {
        _1733 = _1693;
    }
    float _1769 = _1733;
    float _1771 = sqrt(_1683);
    float _1773 = _1739;
    float _1775 = _1769;
    if (_1701)
    {
        float _1777 = fma(_1739, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1777;
    }
    float _1779 = _1767;
    float _1781 = _1779;
    if (!_1701)
    {
        _1773 = _1761;
    }
    float _1783 = _1773;
    float _1785 = _1783;
    if (_1701)
    {
        float _1787 = _1755 + (-1.0);
        _1749 = _1787;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1701)
    {
        float _1793 = _1721 * _1779;
        _1567 = _1793;
    }
    float _1795 = _1567;
    if (!_1701)
    {
        _1781 = _1691;
    }
    float _1797 = _1781;
    float _1799 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797;
    if (_1701)
    {
        float _1803 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1569 = _1803;
    }
    float _1805 = _1569;
    if (_1701)
    {
        float _1807 = _1689 * _1795;
        _1713 = _1807;
    }
    float _1809 = _1713;
    if (_1701)
    {
        float _1811 = _1691 * _1795;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1701)
    {
        _1791 = _1695;
    }
    float _1815 = _1791;
    float _1817 = _1815;
    if (_1701)
    {
        float _1819 = fma(_1761, _1755, _1805);
        _1785 = _1819;
    }
    float _1821 = _1785;
    if (_1701)
    {
        float _1823 = _1809 * _1809;
        _1775 = _1823;
    }
    float _1825 = _1775;
    if (_1701)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1833 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1831);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = fma(_1821, _1821, _1825);
    float _1839 = -_1835;
    float _1841 = _1839 + 1.0;
    float _1843 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1837 + _1829;
    float _1847 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1851 = rsqrt(_1845);
    float _1853 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1855 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1857 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1859 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1855);
    float _1863 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1865 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1857);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = abs(_1841);
    float _1873 = log2(_1871);
    float _1875 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1881 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1883 = _1851 * _1809;
    float _1885 = _1851 * _1821;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1849, 1.0);
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * _1813;
    float _1897 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1899 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1887);
    float _1901 = -_1893;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = log2(_1891);
    float _1907 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1909 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1899);
    float _1911 = -_1895;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1915 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1909);
    float _1921 = fma(_1913, -0.5, 0.5);
    float _1923 = exp2(_1915);
    float _1925 = fma(_1913, 0.5, 0.5);
    float _1927 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1907);
    float _1929 = _1885 + 1.0;
    float _1931 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1927);
    float _1933 = 1.0 / _1919;
    float _1935 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1939 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1931);
    float _1941 = _1905 * 0.693147182464599609375;
    float _1943 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1945 = fma(_1925, _1937, -0.212114393711090087890625);
    float _1947 = sqrt(_1921);
    float _1949 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1943);
    float _1951 = -_1885;
    float _1953 = fma(_1923, _1929, _1951);
    float _1955 = fma(_1925, _1945, 1.570728778839111328125);
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = _1939 * _1933;
    float _1961 = _1949 * _1933;
    float _1963 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = fma(_1961, -0.5, 0.5);
    float _1969 = _1947 * 0.636619746685028076171875;
    float _1971 = -_1955;
    float _1973 = fma(_1969, _1971, 1.0);
    float3 _5366 = float3(_1965, _1967, _1963);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1965, _1967, _1963);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float2 _5394 = float2(_1973, _1957);
    float3 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = -_1041;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2002 = -_1043;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _2006 = -_1065;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _2010 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2016 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2018 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2012);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2014);
    float _2022 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2016);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2018);
    float _2026 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2034 = exp2(_2028);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2038 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    float _2048 = _2036 + _2032;
    float _2050 = 1.0 / _2032;
    float _2052 = _2048 * _2050;
    float _2054 = _2052 * 0.5;
    float _2056 = _2050;
    if (_2046)
    {
        _2056 = 1.0;
    }
    float _2058 = _2056;
    float _2060 = _2058;
    if (!_2046)
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2066 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2064);
        float _2068 = _2062 * 0.15915493667125701904296875;
        float _2070 = _2068 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2076 = _2074 * 0.15915493667125701904296875;
        float _2078 = _2068 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = 1.0 / _2072;
        float _2084 = _2076 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = _2080 * _2082;
        float _2090 = 1.0 / _2066;
        float _2092 = _2086 * _2088;
        float _2094 = _2076 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2100 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2104 = _2090 * _2102;
        float _2106 = 1.0 / _2092;
        float _2108 = 1.0 / _2100;
        float _2110 = _2096 * _2106;
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2114 = fma(_2110, _2104, _2112);
        float _2116 = _2114 * _2108;
        float _2118 = precise::clamp(_2116, 0.0, 1.0);
        float _2120 = -_2118;
        float _2122 = _2120 + 1.0;
        _2060 = _2122;
    }
    float _2124 = _2060;
    float _2126 = -_2034;
    float _2128 = _2126 + 1.0;
    float _2130 = _2030 + _1919;
    bool _2132 = _2124 > 0.0;
    bool _2134 = isnan(_2124);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = _2124 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2146 = _2130 * 0.5;
    float _2148 = _2144 * _1975;
    float _2150 = -_2144;
    float _2152 = _2150 + 1.0;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1949;
    out.gl_Position.z = _2030;
    out.gl_Position.w = _1919;
    float _2154 = _2142 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = _1986 * _2148;
    float _2158 = _1996 * _2148;
    out.m_66.z = _2146;
    out.m_66.w = _1919;
    float _2160 = fma(_1992, _2156, _1980);
    float _2162 = fma(_1994, _2156, _1982);
    float _2164 = _1986 * _2152;
    float _2166 = fma(_1986, _2158, _1984);
    out.m_47.x = _2154;
    out.m_68.x = _2160;
    out.m_68.y = _2162;
    out.m_68.z = _2166;
    out.m_68.w = _2164;
    if (_2140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2168;
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
    bool _1605 = false;
    bool _931 = false;
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
    float _105 = as_type<float>(_103);
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_103);
        out.gl_Position.z = _2226;
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
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_141);
        out.gl_Position.z = _2294;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _105 = _165;
    }
    float _167 = _105;
    float _169 = _167;
    if (!_159)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_159;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _149 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _149);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_159;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _149 * _217;
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
    if (!_159)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_159)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = exp2(_283);
        float _287 = _281 * 0.693147182464599609375;
        float _289 = 1.0 / _287;
        float _291 = 1.0 / _279;
        float _293 = _285 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _289, _121);
        float _299 = _297 * _291;
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
    if (!_159)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_159;
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
    float _359 = fma(_235, _145, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _145, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _143, _263);
    float _369 = fma(_351, _143, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _147, _307);
    float _377 = fma(_351, _147, _365);
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
            float _505 = _145 * _145;
            float _507 = fma(_143, _143, _505);
            float _509 = fma(_147, _147, _507);
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
                float _591 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
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
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _771 + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / _811;
    float _827 = -_823;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _833 = _803 * _829;
    float _835 = -_803;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _807;
    float _841 = _791 * _825;
    float _843 = _775 * _839;
    float _845 = -_787;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = _823 * _847;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = fma(_851, _843, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _865 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = _863 * _833;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _875 = _865 * _833;
    float _877 = _867 * _833;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _887 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _889 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].y, _869);
    float _891 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = fma(_873, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _895 = fma(_885, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _897 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _899 = fma(_891, _853, _887);
    float _901 = fma(_893, _853, _889);
    float _903 = fma(_895, _853, _897);
    float _905 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].x, _899);
    float _907 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].y, _901);
    float _909 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].z, _903);
    bool _911 = !_831;
    float _929;
    if (!_911)
    {
        float _913 = in.m_53.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_87);
        float _935 = 1.0 / _933;
        float _937 = _121 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _945 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _947 = as_type<float>(int(gl_VertexIndex));
    float _949 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _943);
    float _953 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _945);
    float _955 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _957 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _959 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _951);
    float _961 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _953);
    float _963 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = _957 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _965 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _967 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _969 + _979;
    float _983 = _973 * _973;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _987 = _939 + _985;
    bool _989 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_939);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_977, _977, _983);
    float _1003 = _625 * _625;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1009 = as_type<int>(_947) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>(_947) & 2;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_981, _981, _1001);
    float _1019 = fma(_627, _627, _1003);
    bool _1021 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1023 = isnan(_939);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = 1.0 / _1007;
    float _1035 = fma(_629, _629, _1019);
    float _1037 = rsqrt(_1017);
    float _1039 = rsqrt(_1035);
    float _1041 = _973 * _1037;
    float _1043 = _977 * _1037;
    float _1045 = -_1041;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1049 = -_1043;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1053 = _1039 * _629;
    float _1055 = _1039 * _627;
    float _1057 = _1039 * _625;
    float _1059 = _1047 * _1047;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1063 = _1053 * _1061;
    float _1065 = _981 * _1037;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1069 = _1057 * _1067;
    float _1071 = fma(_1051, _1051, _1059);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1075 = -_1063;
    float _1077 = fma(_1055, _1073, _1075);
    float _1079 = -_1065;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1083 = in.m_53.x;
    float _1085 = in.m_53.y;
    float _1087 = in.m_53.z;
    float _1089 = in.m_53.w;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = _1055 * _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1069;
    float _1099 = fma(_1053, _1095, _1097);
    float _1101 = _1077 * _1077;
    float _1103 = fma(_1081, _1081, _1071);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1107 = -_1093;
    float _1109 = fma(_1057, _1105, _1107);
    float _1111 = fma(_1099, _1099, _1101);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1109, _1109, _1111);
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1127 = _1125 != 0;
    float _1129 = rsqrt(_1115);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1133 = _1131 != 0;
    bool _1135 = !_1015;
    float _1137 = _1135 ? (-0.5) : 0.5;
    float _1139 = _1037 * _1113;
    bool _1141 = _1083 > 0.5;
    bool _1143 = !_1011;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = _955 * _1139;
    bool _1149 = _1087 > 0.5;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    bool _1153 = _1085 > 0.5;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1157 = _963 * _1139;
    float _1159 = _1077 * _1129;
    float _1161 = _1109 * _1129;
    float _1163 = _1147 * _1151;
    float _1165 = _1099 * _1129;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1157 * _1155;
    float _1173 = _1057 * _1161;
    float _1175 = _1163 * _1055;
    float _1177 = _1055 * _1159;
    float _1179 = _1163 * _1053;
    float _1181 = 1.0 / _1169;
    float _1183 = -_1173;
    float _1185 = fma(_1053, _1159, _1183);
    float _1187 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1189 = _1187 * 0.5;
    float _1191 = fma(_1171, _1165, _1175);
    float _1193 = fma(_1171, _1161, _1179);
    float _1195 = -_1145;
    int _1197 = _1141 ? as_type<int>(_1195) : as_type<int>(_1145);
    float _1199 = _1053 * _1165;
    float _1201 = fma(_1189, _1185, _1191);
    float _1203 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1177;
    float _1209 = fma(_1057, _1165, _1207);
    float _1211 = _967 + _1201;
    bool _1213 = _1089 > 0.5;
    float _1215 = fma(_1189, _1209, _1193);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = fma(_1205, -0.64999997615814208984375, 1.0);
    float _1223 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1225 = _1211 + _1223;
    float _1227 = _969 + _1215;
    float _1229 = _1219 * _1181;
    float _1231 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1227 + _1233;
    bool _1237 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1239 = isnan(_939);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1231 + _1253;
    float _1257 = fma(_1235, _1221, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1259 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1261 = isnan(_939);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = 1.0 / _1251;
    float _1273 = _1255 * _1255;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1257 + _1275;
    float _1279 = -_1247;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1269;
    float _1285 = _1283 + 1.0;
    float _1287 = _1163 * _1057;
    float _1289 = _1277 * _1277;
    float _1291 = _1269 * _1281;
    float _1293 = -_1199;
    float _1295 = fma(_1055, _1161, _1293);
    float _1297 = _1273 + _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1303 = fma(_1171, _1159, _1287);
    float _1305 = fma(_1229, _987, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1307 = sqrt(_1297);
    float _1309 = _999 * _1285;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _939 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1315;
    float _1319 = -_999;
    float _1321 = _1319 + 1.0;
    float _1323 = _1301 * _1271;
    float _1325 = fma(_1189, _1295, _1303);
    bool _1327 = !_1119;
    float _1329 = _1327 ? _1145 : as_type<float>(_1197);
    float _1331 = _1317 * _1033;
    float _1333 = _1031 * _1321;
    float _1335 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1337 = _965 + _1325;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1343 = _939 + _1341;
    float _1345 = _1305 * _1333;
    float _1347 = -_1031;
    float _1349 = _1347 + 1.0;
    bool _1351 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = _1337 + _1353;
    float _1357 = fma(_1331, _1343, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1345);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1363 = fma(_1355, _1221, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1365 = -_1145;
    int _1367 = _1149 ? as_type<int>(_1365) : as_type<int>(_1145);
    float _1369 = fma(_1335, _1309, _1359);
    bool _1371 = !_1127;
    float _1373 = _1371 ? _1145 : as_type<float>(_1367);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1377 = _1221;
    float _1379 = _1355;
    float _1381 = _1273;
    float _1383 = _1289;
    float _1385 = _1171;
    if (!_1351)
    {
        _1377 = _1289;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1351)
    {
        _1379 = _1273;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (!_1351)
    {
        _1381 = _1231;
    }
    float _1395 = _1381;
    float _1397 = _1395;
    if (!_1351)
    {
        _1383 = _1257;
    }
    float _1399 = _1383;
    float _1401 = _1399;
    if (!_1351)
    {
        _1385 = _1363;
    }
    float _1403 = _1385;
    bool _1405 = !_1351;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1307 + _1411;
        float _1415 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1297);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = fma(_1425, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1433 = _1417 * _1431;
        float _1435 = _1429 + (-1.0);
        float _1437 = fma(_1255, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = fma(_1277, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1449 = _1439 + _1447;
        float _1451 = fma(_1363, _1429, _1441);
        float _1453 = _1445 * _1445;
        float _1455 = _1449 * _1449;
        _1407 = _1451;
        _1393 = _1453;
        _1389 = _1455;
        _1397 = _1437;
        _1401 = _1439;
    }
    float _1457 = _1407;
    float _1459 = _1393;
    float _1461 = _1389;
    float _1463 = _1397;
    float _1465 = _1401;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1469 = _1457 + _1467;
    float _1471 = -_1137;
    int _1473 = _1153 ? as_type<int>(_1471) : as_type<int>(_1137);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1477 = -_1137;
    int _1479 = _1213 ? as_type<int>(_1477) : as_type<int>(_1137);
    float _1481 = fma(_1469, _1469, _1459);
    bool _1483 = !_1123;
    float _1485 = _1483 ? _1137 : as_type<float>(_1473);
    float _1487 = fma(_1357, _1291, _1369);
    bool _1489 = !_1133;
    float _1491 = _1489 ? _1137 : as_type<float>(_1479);
    float _1493 = _1481 + _1461;
    float _1495 = _1373 + 0.5;
    float _1497 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1487);
    float _1499 = -_1485;
    float _1501 = _1499 + 0.5;
    float _1503 = -_1491;
    float _1505 = _1503 + 0.5;
    float _1507 = _1329 + 0.5;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = sqrt(_1493);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1521 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1531 = _1509 * _1361;
    float _1533 = _1513 * _1375;
    float _1535 = _1515 * _1475;
    float _1537 = _1517 * _1339;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1537;
    out.m_58.y = _1531;
    out.m_58.z = _1533;
    out.m_58.w = _1535;
    bool _1553 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1555 = isnan(_1511);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1561 = _1557 || _1559;
    out.m_60.x = _1543;
    out.m_60.y = _1545;
    out.m_60.z = _1547;
    out.m_62.x = _1539;
    out.m_62.y = _1541;
    out.m_62.z = _1549;
    out.m_62.w = _1551;
    out.m_64.x = _1157;
    out.m_64.y = _1147;
    float _1563 = _1523;
    float _1565 = _1541;
    float _1567 = _1511;
    float _1569 = _1551;
    if (!_1561)
    {
        _1563 = 1.0;
    }
    float _1571 = _1563;
    bool _1573 = !_1561;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1511);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1511 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1511);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1511 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1457 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1643 = _1463 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1647 = _1465 + _1645;
    float _1649 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = -_1041;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1657 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_1043;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1665 = _1655 + _1663;
    float _1667 = -_1065;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1657);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1661 + _1671;
    float _1675 = _1665 * _1665;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = _1669 + _1677;
    float _1681 = fma(_1673, _1673, _1675);
    float _1683 = fma(_1679, _1679, _1681);
    float _1685 = rsqrt(_1683);
    float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1689 = _1673 * _1687;
    float _1691 = _1679 * _1687;
    float _1693 = _1689 * _1689;
    float _1695 = _1691 * _1691;
    float _1697 = _1693 + _1695;
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1705 = _1699 + _1703;
    float _1707 = _1679;
    float _1709 = _1697;
    float _1711 = _1705;
    float _1713 = _1689;
    if (_1701)
    {
        float _1715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1707 = _1715;
    }
    float _1717 = _1707;
    if (_1701)
    {
        float _1719 = rsqrt(_1697);
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (_1701)
    {
        float _1723 = _1705 * _1717;
        _1711 = _1723;
    }
    float _1725 = _1711;
    if (_1701)
    {
        float _1727 = _1725 * 0.15915493667125701904296875;
        _1565 = _1727;
    }
    float _1729 = _1565;
    float _1731 = _1521;
    float _1733 = _1729;
    if (_1701)
    {
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1743 = precise::max(0.0, _1741);
    float _1745 = _1685;
    float _1747 = _1743;
    float _1749 = _1741;
    if (_1701)
    {
        float _1751 = _1729 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = -_1687;
    float _1759 = -_1743;
    float _1761 = fma(_1665, _1757, _1759);
    if (_1701)
    {
        float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1747 = _1763;
    }
    float _1765 = _1747;
    float _1767 = _1765;
    if (!_1701)
    {
        _1733 = _1693;
    }
    float _1769 = _1733;
    float _1771 = sqrt(_1683);
    float _1773 = _1739;
    float _1775 = _1769;
    if (_1701)
    {
        float _1777 = fma(_1739, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1777;
    }
    float _1779 = _1767;
    float _1781 = _1779;
    if (!_1701)
    {
        _1773 = _1761;
    }
    float _1783 = _1773;
    float _1785 = _1783;
    if (_1701)
    {
        float _1787 = _1755 + (-1.0);
        _1749 = _1787;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1701)
    {
        float _1793 = _1721 * _1779;
        _1567 = _1793;
    }
    float _1795 = _1567;
    if (!_1701)
    {
        _1781 = _1691;
    }
    float _1797 = _1781;
    float _1799 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797;
    if (_1701)
    {
        float _1803 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1569 = _1803;
    }
    float _1805 = _1569;
    if (_1701)
    {
        float _1807 = _1689 * _1795;
        _1713 = _1807;
    }
    float _1809 = _1713;
    if (_1701)
    {
        float _1811 = _1691 * _1795;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1701)
    {
        _1791 = _1695;
    }
    float _1815 = _1791;
    float _1817 = _1815;
    if (_1701)
    {
        float _1819 = fma(_1761, _1755, _1805);
        _1785 = _1819;
    }
    float _1821 = _1785;
    if (_1701)
    {
        float _1823 = _1809 * _1809;
        _1775 = _1823;
    }
    float _1825 = _1775;
    if (_1701)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1833 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1831);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = fma(_1821, _1821, _1825);
    float _1839 = -_1835;
    float _1841 = _1839 + 1.0;
    float _1843 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1837 + _1829;
    float _1847 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1851 = rsqrt(_1845);
    float _1853 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1855 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1857 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1859 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1855);
    float _1863 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1865 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1857);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = abs(_1841);
    float _1873 = log2(_1871);
    float _1875 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1881 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1883 = _1851 * _1809;
    float _1885 = _1851 * _1821;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1849, 1.0);
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * _1813;
    float _1897 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1899 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1887);
    float _1901 = -_1893;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = log2(_1891);
    float _1907 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1909 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1899);
    float _1911 = -_1895;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1915 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1909);
    float _1921 = fma(_1913, -0.5, 0.5);
    float _1923 = exp2(_1915);
    float _1925 = fma(_1913, 0.5, 0.5);
    float _1927 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1907);
    float _1929 = _1885 + 1.0;
    float _1931 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1927);
    float _1933 = 1.0 / _1919;
    float _1935 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1939 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1931);
    float _1941 = _1905 * 0.693147182464599609375;
    float _1943 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1945 = fma(_1925, _1937, -0.212114393711090087890625);
    float _1947 = sqrt(_1921);
    float _1949 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1943);
    float _1951 = -_1885;
    float _1953 = fma(_1923, _1929, _1951);
    float _1955 = fma(_1925, _1945, 1.570728778839111328125);
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = _1939 * _1933;
    float _1961 = _1949 * _1933;
    float _1963 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = fma(_1961, -0.5, 0.5);
    float _1969 = _1947 * 0.636619746685028076171875;
    float _1971 = -_1955;
    float _1973 = fma(_1969, _1971, 1.0);
    float3 _5366 = float3(_1965, _1967, _1963);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1965, _1967, _1963);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float2 _5394 = float2(_1973, _1957);
    float3 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = -_1041;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2002 = -_1043;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _2006 = -_1065;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _2010 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2016 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2018 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2012);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2014);
    float _2022 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2016);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2018);
    float _2026 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2034 = exp2(_2028);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2038 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    float _2048 = _2036 + _2032;
    float _2050 = 1.0 / _2032;
    float _2052 = _2048 * _2050;
    float _2054 = _2052 * 0.5;
    float _2056 = _2050;
    if (_2046)
    {
        _2056 = 1.0;
    }
    float _2058 = _2056;
    float _2060 = _2058;
    if (!_2046)
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2066 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2064);
        float _2068 = _2062 * 0.15915493667125701904296875;
        float _2070 = _2068 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2076 = _2074 * 0.15915493667125701904296875;
        float _2078 = _2068 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = 1.0 / _2072;
        float _2084 = _2076 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = _2080 * _2082;
        float _2090 = 1.0 / _2066;
        float _2092 = _2086 * _2088;
        float _2094 = _2076 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2100 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2104 = _2090 * _2102;
        float _2106 = 1.0 / _2092;
        float _2108 = 1.0 / _2100;
        float _2110 = _2096 * _2106;
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2114 = fma(_2110, _2104, _2112);
        float _2116 = _2114 * _2108;
        float _2118 = precise::clamp(_2116, 0.0, 1.0);
        float _2120 = -_2118;
        float _2122 = _2120 + 1.0;
        _2060 = _2122;
    }
    float _2124 = _2060;
    float _2126 = -_2034;
    float _2128 = _2126 + 1.0;
    float _2130 = _2030 + _1919;
    bool _2132 = _2124 > 0.0;
    bool _2134 = isnan(_2124);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = _2124 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2146 = _2130 * 0.5;
    float _2148 = _2144 * _1975;
    float _2150 = -_2144;
    float _2152 = _2150 + 1.0;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1949;
    out.gl_Position.z = _2030;
    out.gl_Position.w = _1919;
    float _2154 = _2142 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = _1986 * _2148;
    float _2158 = _1996 * _2148;
    out.m_66.z = _2146;
    out.m_66.w = _1919;
    float _2160 = fma(_1992, _2156, _1980);
    float _2162 = fma(_1994, _2156, _1982);
    float _2164 = _1986 * _2152;
    float _2166 = fma(_1986, _2158, _1984);
    out.m_47.x = _2154;
    out.m_68.x = _2160;
    out.m_68.y = _2162;
    out.m_68.z = _2166;
    out.m_68.w = _2164;
    if (_2140)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2168;
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
    bool _1605 = false;
    bool _931 = false;
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
    float _105 = as_type<float>(_103);
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2226 = as_type<float>(_103);
        out.gl_Position.z = _2226;
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
    float _123 = 0.0;
    if (_117)
    {
        float _125 = float(_87);
        _123 = _125;
    }
    float _127 = _123;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    if (_133)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _97;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    int _137 = 0;
    if (_133)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2294 = as_type<float>(_141);
        out.gl_Position.z = _2294;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _105 = _165;
    }
    float _167 = _105;
    float _169 = _167;
    if (!_159)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    bool _175 = !_159;
    float _177 = _173;
    if (!_175)
    {
        float _179 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = log2(_179);
        float _183 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _185 = _183 + 1.0;
        float _187 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = _149 * _181;
        float _191 = 1.0 / _185;
        float _193 = _187 * 0.693147182464599609375;
        float _195 = exp2(_189);
        float _197 = 1.0 / _193;
        float _199 = _195 + (-1.0);
        float _201 = -_199;
        float _203 = fma(_201, _197, _149);
        float _205 = _203 * _191;
        float _207 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _207;
    }
    float _209 = _177;
    float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _213 = !_159;
    if (!_213)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = 1.0 / _221;
        float _225 = _149 * _217;
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
    if (!_159)
    {
        float _253 = _121 * _121;
        float _255 = _253 * 0.5;
        _249 = _255;
    }
    float _257 = _249;
    float _259 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _263 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    if (!_159)
    {
        float _265 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _121 * _275;
        float _285 = exp2(_283);
        float _287 = _281 * 0.693147182464599609375;
        float _289 = 1.0 / _287;
        float _291 = 1.0 / _279;
        float _293 = _285 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _289, _121);
        float _299 = _297 * _291;
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
    if (!_159)
    {
        _323 = _121;
    }
    float _325 = _323;
    bool _327 = !_159;
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
    float _359 = fma(_235, _145, _311);
    float _361 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _363 = fma(_351, _145, _355);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _367 = fma(_235, _143, _263);
    float _369 = fma(_351, _143, _361);
    float _371 = -_363;
    float _373 = _359 + _371;
    float _375 = fma(_235, _147, _307);
    float _377 = fma(_351, _147, _365);
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
            float _505 = _145 * _145;
            float _507 = fma(_143, _143, _505);
            float _509 = fma(_147, _147, _507);
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
                float _591 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _593 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _595 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _597 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
                float _599 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _593);
                float _601 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
                float _603 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
                float _605 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
                float _607 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
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
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _791 = _771 + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _813 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _815 = isnan(_771);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / _811;
    float _827 = -_823;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _833 = _803 * _829;
    float _835 = -_803;
    float _837 = _835 + 1.0;
    float _839 = 1.0 / _807;
    float _841 = _791 * _825;
    float _843 = _775 * _839;
    float _845 = -_787;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _849;
    float _853 = _823 * _847;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _859;
    float _863 = fma(_851, _843, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _865 = fma(_857, _843, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _867 = fma(_861, _843, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _869 = _863 * _833;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _875 = _865 * _833;
    float _877 = _867 * _833;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _887 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].x, _875);
    float _889 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].y, _869);
    float _891 = fma(_881, _841, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = fma(_873, _841, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _895 = fma(_885, _841, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _897 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[107].z, _877);
    float _899 = fma(_891, _853, _887);
    float _901 = fma(_893, _853, _889);
    float _903 = fma(_895, _853, _897);
    float _905 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].x, _899);
    float _907 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].y, _901);
    float _909 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[109].z, _903);
    bool _911 = !_831;
    float _929;
    if (!_911)
    {
        float _913 = in.m_53.x;
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _917 = _913 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _921 = _919 * _915;
        float _923 = floor(_921);
        float _925 = -_923;
        float _927 = _921 + _925;
        _929 = _927;
        _931 = true;
    }
    else
    {
        float _933 = float(_87);
        float _935 = 1.0 / _933;
        float _937 = _121 * _935;
        _929 = _937;
    }
    _931 = false;
    float _939 = _929;
    float _941 = _433 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _433 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _945 = _433 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _947 = as_type<float>(int(gl_VertexIndex));
    float _949 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _943);
    float _953 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _945);
    float _955 = _741 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _957 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _959 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].z, _951);
    float _961 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].z, _953);
    float _963 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _965 = _957 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _967 = _959 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _973 = _965 + _971;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _977 = _967 + _975;
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _981 = _969 + _979;
    float _983 = _973 * _973;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _987 = _939 + _985;
    bool _989 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_939);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_977, _977, _983);
    float _1003 = _625 * _625;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1009 = as_type<int>(_947) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>(_947) & 2;
    bool _1015 = _1013 != 0;
    float _1017 = fma(_981, _981, _1001);
    float _1019 = fma(_627, _627, _1003);
    bool _1021 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1023 = isnan(_939);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = 1.0 / _1007;
    float _1035 = fma(_629, _629, _1019);
    float _1037 = rsqrt(_1017);
    float _1039 = rsqrt(_1035);
    float _1041 = _973 * _1037;
    float _1043 = _977 * _1037;
    float _1045 = -_1041;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1049 = -_1043;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    float _1053 = _1039 * _629;
    float _1055 = _1039 * _627;
    float _1057 = _1039 * _625;
    float _1059 = _1047 * _1047;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1063 = _1053 * _1061;
    float _1065 = _981 * _1037;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1069 = _1057 * _1067;
    float _1071 = fma(_1051, _1051, _1059);
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1075 = -_1063;
    float _1077 = fma(_1055, _1073, _1075);
    float _1079 = -_1065;
    float _1081 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[18].w, _981);
    float _1083 = in.m_53.x;
    float _1085 = in.m_53.y;
    float _1087 = in.m_53.z;
    float _1089 = in.m_53.w;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1093 = _1055 * _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1069;
    float _1099 = fma(_1053, _1095, _1097);
    float _1101 = _1077 * _1077;
    float _1103 = fma(_1081, _1081, _1071);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1107 = -_1093;
    float _1109 = fma(_1057, _1105, _1107);
    float _1111 = fma(_1099, _1099, _1101);
    float _1113 = sqrt(_1103);
    float _1115 = fma(_1109, _1109, _1111);
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1119 = _1117 != 0;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1123 = _1121 != 0;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1127 = _1125 != 0;
    float _1129 = rsqrt(_1115);
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1133 = _1131 != 0;
    bool _1135 = !_1015;
    float _1137 = _1135 ? (-0.5) : 0.5;
    float _1139 = _1037 * _1113;
    bool _1141 = _1083 > 0.5;
    bool _1143 = !_1011;
    float _1145 = _1143 ? (-0.5) : 0.5;
    float _1147 = _955 * _1139;
    bool _1149 = _1087 > 0.5;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    bool _1153 = _1085 > 0.5;
    float _1155 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1157 = _963 * _1139;
    float _1159 = _1077 * _1129;
    float _1161 = _1109 * _1129;
    float _1163 = _1147 * _1151;
    float _1165 = _1099 * _1129;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1157 * _1155;
    float _1173 = _1057 * _1161;
    float _1175 = _1163 * _1055;
    float _1177 = _1055 * _1159;
    float _1179 = _1163 * _1053;
    float _1181 = 1.0 / _1169;
    float _1183 = -_1173;
    float _1185 = fma(_1053, _1159, _1183);
    float _1187 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1189 = _1187 * 0.5;
    float _1191 = fma(_1171, _1165, _1175);
    float _1193 = fma(_1171, _1161, _1179);
    float _1195 = -_1145;
    int _1197 = _1141 ? as_type<int>(_1195) : as_type<int>(_1145);
    float _1199 = _1053 * _1165;
    float _1201 = fma(_1189, _1185, _1191);
    float _1203 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1177;
    float _1209 = fma(_1057, _1165, _1207);
    float _1211 = _967 + _1201;
    bool _1213 = _1089 > 0.5;
    float _1215 = fma(_1189, _1209, _1193);
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1217;
    float _1221 = fma(_1205, -0.64999997615814208984375, 1.0);
    float _1223 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1225 = _1211 + _1223;
    float _1227 = _969 + _1215;
    float _1229 = _1219 * _1181;
    float _1231 = fma(_1225, _1221, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1227 + _1233;
    bool _1237 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1239 = isnan(_939);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1231 + _1253;
    float _1257 = fma(_1235, _1221, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _1259 = _939 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1261 = isnan(_939);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = 1.0 / _1251;
    float _1273 = _1255 * _1255;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1257 + _1275;
    float _1279 = -_1247;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1269;
    float _1285 = _1283 + 1.0;
    float _1287 = _1163 * _1057;
    float _1289 = _1277 * _1277;
    float _1291 = _1269 * _1281;
    float _1293 = -_1199;
    float _1295 = fma(_1055, _1161, _1293);
    float _1297 = _1273 + _1289;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1303 = fma(_1171, _1159, _1287);
    float _1305 = fma(_1229, _987, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1307 = sqrt(_1297);
    float _1309 = _999 * _1285;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1313 = _939 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1315;
    float _1319 = -_999;
    float _1321 = _1319 + 1.0;
    float _1323 = _1301 * _1271;
    float _1325 = fma(_1189, _1295, _1303);
    bool _1327 = !_1119;
    float _1329 = _1327 ? _1145 : as_type<float>(_1197);
    float _1331 = _1317 * _1033;
    float _1333 = _1031 * _1321;
    float _1335 = fma(_1323, _1313, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1337 = _965 + _1325;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1343 = _939 + _1341;
    float _1345 = _1305 * _1333;
    float _1347 = -_1031;
    float _1349 = _1347 + 1.0;
    bool _1351 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1353 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1355 = _1337 + _1353;
    float _1357 = fma(_1331, _1343, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1359 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1345);
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1363 = fma(_1355, _1221, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1365 = -_1145;
    int _1367 = _1149 ? as_type<int>(_1365) : as_type<int>(_1145);
    float _1369 = fma(_1335, _1309, _1359);
    bool _1371 = !_1127;
    float _1373 = _1371 ? _1145 : as_type<float>(_1367);
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1377 = _1221;
    float _1379 = _1355;
    float _1381 = _1273;
    float _1383 = _1289;
    float _1385 = _1171;
    if (!_1351)
    {
        _1377 = _1289;
    }
    float _1387 = _1377;
    float _1389 = _1387;
    if (!_1351)
    {
        _1379 = _1273;
    }
    float _1391 = _1379;
    float _1393 = _1391;
    if (!_1351)
    {
        _1381 = _1231;
    }
    float _1395 = _1381;
    float _1397 = _1395;
    if (!_1351)
    {
        _1383 = _1257;
    }
    float _1399 = _1383;
    float _1401 = _1399;
    if (!_1351)
    {
        _1385 = _1363;
    }
    float _1403 = _1385;
    bool _1405 = !_1351;
    float _1407 = _1403;
    if (!_1405)
    {
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1413 = _1307 + _1411;
        float _1415 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = rsqrt(_1297);
        float _1419 = _1413 * _1409;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1421 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = fma(_1425, _1415, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1433 = _1417 * _1431;
        float _1435 = _1429 + (-1.0);
        float _1437 = fma(_1255, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = fma(_1277, _1433, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1449 = _1439 + _1447;
        float _1451 = fma(_1363, _1429, _1441);
        float _1453 = _1445 * _1445;
        float _1455 = _1449 * _1449;
        _1407 = _1451;
        _1393 = _1453;
        _1389 = _1455;
        _1397 = _1437;
        _1401 = _1439;
    }
    float _1457 = _1407;
    float _1459 = _1393;
    float _1461 = _1389;
    float _1463 = _1397;
    float _1465 = _1401;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1469 = _1457 + _1467;
    float _1471 = -_1137;
    int _1473 = _1153 ? as_type<int>(_1471) : as_type<int>(_1137);
    float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1477 = -_1137;
    int _1479 = _1213 ? as_type<int>(_1477) : as_type<int>(_1137);
    float _1481 = fma(_1469, _1469, _1459);
    bool _1483 = !_1123;
    float _1485 = _1483 ? _1137 : as_type<float>(_1473);
    float _1487 = fma(_1357, _1291, _1369);
    bool _1489 = !_1133;
    float _1491 = _1489 ? _1137 : as_type<float>(_1479);
    float _1493 = _1481 + _1461;
    float _1495 = _1373 + 0.5;
    float _1497 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1487);
    float _1499 = -_1485;
    float _1501 = _1499 + 0.5;
    float _1503 = -_1491;
    float _1505 = _1503 + 0.5;
    float _1507 = _1329 + 0.5;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1511 = sqrt(_1493);
    float _1513 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1519 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1521 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = _909 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1531 = _1509 * _1361;
    float _1533 = _1513 * _1375;
    float _1535 = _1515 * _1475;
    float _1537 = _1517 * _1339;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1541 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1537;
    out.m_58.y = _1531;
    out.m_58.z = _1533;
    out.m_58.w = _1535;
    bool _1553 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1555 = isnan(_1511);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1561 = _1557 || _1559;
    out.m_60.x = _1543;
    out.m_60.y = _1545;
    out.m_60.z = _1547;
    out.m_62.x = _1539;
    out.m_62.y = _1541;
    out.m_62.z = _1549;
    out.m_62.w = _1551;
    out.m_64.x = _1157;
    out.m_64.y = _1147;
    float _1563 = _1523;
    float _1565 = _1541;
    float _1567 = _1511;
    float _1569 = _1551;
    if (!_1561)
    {
        _1563 = 1.0;
    }
    float _1571 = _1563;
    bool _1573 = !_1561;
    float _1575 = _1571;
    if (!_1573)
    {
        bool _1577 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1579 = isnan(_1511);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = _1511 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1597 = _1595 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1599 = 1.0 / _1593;
            float _1601 = _1589 * _1599;
            float _1603 = fma(_1601, _1597, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1575 = _1603;
            _1605 = true;
        }
        else
        {
            bool _1607 = _1511 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1609 = isnan(_1511);
            bool _1611 = _1607 || _1609;
            bool _1613 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1615 = _1611 || _1613;
            if (!_1615)
            {
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1511 + _1617;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1629 = 1.0 / _1623;
                float _1631 = _1619 * _1629;
                float _1633 = fma(_1631, _1627, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1575 = _1633;
                _1605 = true;
            }
            else
            {
                _1575 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1605 = false;
    float _1635 = _1575;
    float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1639 = _1457 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1643 = _1463 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1647 = _1465 + _1645;
    float _1649 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1651 = fma(_1643, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1653 = -_1041;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1649);
    float _1657 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1659 = -_1043;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1651);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1665 = _1655 + _1663;
    float _1667 = -_1065;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1657);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1673 = _1661 + _1671;
    float _1675 = _1665 * _1665;
    float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1679 = _1669 + _1677;
    float _1681 = fma(_1673, _1673, _1675);
    float _1683 = fma(_1679, _1679, _1681);
    float _1685 = rsqrt(_1683);
    float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1689 = _1673 * _1687;
    float _1691 = _1679 * _1687;
    float _1693 = _1689 * _1689;
    float _1695 = _1691 * _1691;
    float _1697 = _1693 + _1695;
    float _1699 = sqrt(_1697);
    bool _1701 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1705 = _1699 + _1703;
    float _1707 = _1679;
    float _1709 = _1697;
    float _1711 = _1705;
    float _1713 = _1689;
    if (_1701)
    {
        float _1715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1707 = _1715;
    }
    float _1717 = _1707;
    if (_1701)
    {
        float _1719 = rsqrt(_1697);
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (_1701)
    {
        float _1723 = _1705 * _1717;
        _1711 = _1723;
    }
    float _1725 = _1711;
    if (_1701)
    {
        float _1727 = _1725 * 0.15915493667125701904296875;
        _1565 = _1727;
    }
    float _1729 = _1565;
    float _1731 = _1521;
    float _1733 = _1729;
    if (_1701)
    {
        float _1735 = _1729 * 6.283185482025146484375;
        float _1737 = sin(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1743 = precise::max(0.0, _1741);
    float _1745 = _1685;
    float _1747 = _1743;
    float _1749 = _1741;
    if (_1701)
    {
        float _1751 = _1729 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        _1745 = _1753;
    }
    float _1755 = _1745;
    float _1757 = -_1687;
    float _1759 = -_1743;
    float _1761 = fma(_1665, _1757, _1759);
    if (_1701)
    {
        float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1747 = _1763;
    }
    float _1765 = _1747;
    float _1767 = _1765;
    if (!_1701)
    {
        _1733 = _1693;
    }
    float _1769 = _1733;
    float _1771 = sqrt(_1683);
    float _1773 = _1739;
    float _1775 = _1769;
    if (_1701)
    {
        float _1777 = fma(_1739, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1767 = _1777;
    }
    float _1779 = _1767;
    float _1781 = _1779;
    if (!_1701)
    {
        _1773 = _1761;
    }
    float _1783 = _1773;
    float _1785 = _1783;
    if (_1701)
    {
        float _1787 = _1755 + (-1.0);
        _1749 = _1787;
    }
    float _1789 = _1749;
    float _1791 = _1789;
    if (_1701)
    {
        float _1793 = _1721 * _1779;
        _1567 = _1793;
    }
    float _1795 = _1567;
    if (!_1701)
    {
        _1781 = _1691;
    }
    float _1797 = _1781;
    float _1799 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1801 = _1797;
    if (_1701)
    {
        float _1803 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1569 = _1803;
    }
    float _1805 = _1569;
    if (_1701)
    {
        float _1807 = _1689 * _1795;
        _1713 = _1807;
    }
    float _1809 = _1713;
    if (_1701)
    {
        float _1811 = _1691 * _1795;
        _1801 = _1811;
    }
    float _1813 = _1801;
    if (!_1701)
    {
        _1791 = _1695;
    }
    float _1815 = _1791;
    float _1817 = _1815;
    if (_1701)
    {
        float _1819 = fma(_1761, _1755, _1805);
        _1785 = _1819;
    }
    float _1821 = _1785;
    if (_1701)
    {
        float _1823 = _1809 * _1809;
        _1775 = _1823;
    }
    float _1825 = _1775;
    if (_1701)
    {
        float _1827 = _1813 * _1813;
        _1817 = _1827;
    }
    float _1829 = _1817;
    float _1831 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1833 = fma(_1771, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1831);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = fma(_1821, _1821, _1825);
    float _1839 = -_1835;
    float _1841 = _1839 + 1.0;
    float _1843 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1845 = _1837 + _1829;
    float _1847 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1851 = rsqrt(_1845);
    float _1853 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1847);
    float _1855 = _1655 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1857 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1843);
    float _1859 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1855);
    float _1863 = fma(_1661, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1799);
    float _1865 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1857);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = abs(_1841);
    float _1873 = log2(_1871);
    float _1875 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1863);
    float _1877 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1881 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1883 = _1851 * _1809;
    float _1885 = _1851 * _1821;
    float _1887 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1889 = -_1877;
    float _1891 = fma(_1889, _1849, 1.0);
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * _1813;
    float _1897 = _1875 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1899 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1887);
    float _1901 = -_1893;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = log2(_1891);
    float _1907 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1909 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1899);
    float _1911 = -_1895;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1915 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1917 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1919 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1909);
    float _1921 = fma(_1913, -0.5, 0.5);
    float _1923 = exp2(_1915);
    float _1925 = fma(_1913, 0.5, 0.5);
    float _1927 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1907);
    float _1929 = _1885 + 1.0;
    float _1931 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1927);
    float _1933 = 1.0 / _1919;
    float _1935 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1917);
    float _1937 = fma(_1925, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1939 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1931);
    float _1941 = _1905 * 0.693147182464599609375;
    float _1943 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1935);
    float _1945 = fma(_1925, _1937, -0.212114393711090087890625);
    float _1947 = sqrt(_1921);
    float _1949 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1943);
    float _1951 = -_1885;
    float _1953 = fma(_1923, _1929, _1951);
    float _1955 = fma(_1925, _1945, 1.570728778839111328125);
    float _1957 = fma(_1953, 0.5, 0.5);
    float _1959 = _1939 * _1933;
    float _1961 = _1949 * _1933;
    float _1963 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1965 = fma(_1959, 0.5, 0.5);
    float _1967 = fma(_1961, -0.5, 0.5);
    float _1969 = _1947 * 0.636619746685028076171875;
    float _1971 = -_1955;
    float _1973 = fma(_1969, _1971, 1.0);
    float3 _5366 = float3(_1965, _1967, _1963);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1965, _1967, _1963);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float2 _5394 = float2(_1973, _1957);
    float3 _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1992 = _1990.x;
    float _1994 = _1990.y;
    float _1996 = _1990.z;
    float _1998 = -_1041;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2002 = -_1043;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _967);
    float _2006 = -_1065;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _2010 = _1879 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2014 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2016 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2010);
    float _2018 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2012);
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2014);
    float _2022 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2016);
    float _2024 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2018);
    float _2026 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1873 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2034 = exp2(_2028);
    float _2036 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2038 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2040 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2042 = _2038 || _2040;
    bool _2044 = isnan(0.5);
    bool _2046 = _2042 || _2044;
    float _2048 = _2036 + _2032;
    float _2050 = 1.0 / _2032;
    float _2052 = _2048 * _2050;
    float _2054 = _2052 * 0.5;
    float _2056 = _2050;
    if (_2046)
    {
        _2056 = 1.0;
    }
    float _2058 = _2056;
    float _2060 = _2058;
    if (!_2046)
    {
        float _2062 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2066 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2064);
        float _2068 = _2062 * 0.15915493667125701904296875;
        float _2070 = _2068 * 6.283185482025146484375;
        float _2072 = cos(_2070);
        float _2074 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2076 = _2074 * 0.15915493667125701904296875;
        float _2078 = _2068 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = 1.0 / _2072;
        float _2084 = _2076 * 6.283185482025146484375;
        float _2086 = cos(_2084);
        float _2088 = _2080 * _2082;
        float _2090 = 1.0 / _2066;
        float _2092 = _2086 * _2088;
        float _2094 = _2076 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2100 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2104 = _2090 * _2102;
        float _2106 = 1.0 / _2092;
        float _2108 = 1.0 / _2100;
        float _2110 = _2096 * _2106;
        float _2112 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2114 = fma(_2110, _2104, _2112);
        float _2116 = _2114 * _2108;
        float _2118 = precise::clamp(_2116, 0.0, 1.0);
        float _2120 = -_2118;
        float _2122 = _2120 + 1.0;
        _2060 = _2122;
    }
    float _2124 = _2060;
    float _2126 = -_2034;
    float _2128 = _2126 + 1.0;
    float _2130 = _2030 + _1919;
    bool _2132 = _2124 > 0.0;
    bool _2134 = isnan(_2124);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = _2124 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2146 = _2130 * 0.5;
    float _2148 = _2144 * _1975;
    float _2150 = -_2144;
    float _2152 = _2150 + 1.0;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1949;
    out.gl_Position.z = _2030;
    out.gl_Position.w = _1919;
    float _2154 = _2142 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2156 = _1986 * _2148;
    float _2158 = _1996 * _2148;
    out.m_66.z = _2146;
    out.m_66.w = _1919;
    float _2160 = fma(_1992, _2156, _1980);
    float _2162 = fma(_1994, _2156, _1982);
    float _2164 = _1986 * _2152;
    float _2166 = fma(_1986, _2158, _1984);
    out.m_47.x = _2154;
    out.m_68.x = _2160;
    out.m_68.y = _2162;
    out.m_68.z = _2166;
    out.m_68.w = _2164;
    if (_2140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2168;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

