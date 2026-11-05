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
    float4 m_60 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _1059 = false;
    bool _905 = false;
    bool _567 = false;
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
        float _2277 = as_type<float>(_103);
        out.gl_Position.z = _2277;
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
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_139);
        out.gl_Position.z = _2345;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _165 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _163);
    float _169 = _163;
    float _171 = _143;
    if (!_159)
    {
        float _173 = _143 * _143;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_159)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _165);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _183;
    float _209 = 0.0;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _143 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _143);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _237;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    if (!_245)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _143 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _171 = _267;
    }
    float _269 = _171;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _271;
    float _279 = _275;
    if (!_159)
    {
        float _281 = _121 * _121;
        float _283 = _281 * 0.5;
        _247 = _283;
    }
    float _285 = _247;
    float _287 = fma(_269, _145, _271);
    float _289 = fma(_269, _147, _273);
    float _291 = fma(_269, _149, _275);
    if (!_159)
    {
        float _293 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _293;
    }
    float _295 = _277;
    bool _297 = !_159;
    float _299 = _295;
    if (!_297)
    {
        float _301 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = log2(_301);
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _121 * _303;
        float _313 = 1.0 / _307;
        float _315 = _309 * 0.693147182464599609375;
        float _317 = exp2(_311);
        float _319 = 1.0 / _315;
        float _321 = _317 + (-1.0);
        float _323 = -_321;
        float _325 = fma(_323, _319, _121);
        float _327 = _325 * _313;
        float _329 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _299 = _329;
        _279 = _317;
    }
    float _331 = _299;
    float _333 = _279;
    float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _333;
    if (!_159)
    {
        _337 = _121;
    }
    float _339 = _337;
    bool _341 = !_159;
    float _343 = _339;
    if (!_341)
    {
        float _345 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = log2(_345);
        float _349 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _351 = _349 + 1.0;
        float _353 = 1.0 / _351;
        float _355 = _121 * _347;
        float _357 = exp2(_355);
        float _359 = -_357;
        float _361 = _359 + 1.0;
        float _363 = _361 * _353;
        _343 = _363;
    }
    float _365 = _343;
    float _367 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_365, _147, _335);
    float _371 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_365, _145, _367);
    float _375 = -_369;
    float _377 = _289 + _375;
    float _379 = fma(_365, _149, _371);
    float _381 = -_373;
    float _383 = _287 + _381;
    float _385 = _377 * _377;
    float _387 = -_379;
    float _389 = _291 + _387;
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = fma(_383, _383, _385);
    float _395 = sqrt(_195);
    float _397 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _399 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _401 = fma(_389, _389, _393);
    float _403 = in.m_52.w;
    float _405 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _397);
    float _407 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = sqrt(_167);
    float _413 = in.m_42.x;
    float _415 = in.m_42.y;
    float _417 = in.m_42.z;
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].y, _407);
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].x, _399);
    float _423 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _425 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _419);
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _431 = sqrt(_401);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].w, _423);
    float _435 = _395 * _427;
    float _437 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _441 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = sqrt(_405);
    float _447 = _411 * _429;
    float _449 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _455 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    bool _457 = _431 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_291, _403, _417);
    float _469 = _445 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _455);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = fma(_287, _403, _413);
    float _485 = fma(_289, _403, _415);
    float _487 = _479;
    float _489 = _477;
    float _491 = _481;
    if (!_465)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _395 * _509;
            float _519 = _411 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _445 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _533 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].w, _539);
            float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].w, _543);
            float _551 = _545 * _545;
            float _553 = fma(_547, _547, _551);
            float _555 = fma(_549, _549, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _545 * _559;
            float _565 = _549 * _559;
            _487 = _563;
            _489 = _561;
            _491 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _147 * _147;
            float _571 = fma(_145, _145, _569);
            float _573 = fma(_149, _149, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _415 * _415;
                float _589 = fma(_413, _413, _587);
                float _591 = fma(_417, _417, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _395 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _411 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _487 = _647;
                    _489 = _645;
                    _491 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _395 * _667;
                    float _677 = _411 * _669;
                    float _679 = _445 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
                    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
                    float _699 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _697);
                    float _705 = _699 * _699;
                    float _707 = fma(_701, _701, _705);
                    float _709 = fma(_703, _703, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _699 * _713;
                    float _719 = _703 * _713;
                    _487 = _717;
                    _489 = _715;
                    _491 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _395 * _737;
                float _747 = _411 * _739;
                float _749 = _445 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _487 = _787;
                _489 = _785;
                _491 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _487;
    float _793 = _489;
    float _795 = _491;
    float _797 = in.m_54.x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _801 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _803 = _801 * _799;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[20].x, _803);
    float _807 = _805 * 6.283185482025146484375;
    float _809 = floor(_805);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _817 = _815 != 0;
    float _819 = _807 * 0.15915493667125701904296875;
    bool _821 = !_813;
    int _823 = _821 ? 0 : 1;
    int _825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _827 = _825 != 0;
    float _829 = _819 * 6.283185482025146484375;
    float _831 = cos(_829);
    int _833 = abs(_823);
    bool _835 = !_827;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_817;
    int _841 = _839 ? 0 : 1;
    float _843 = -_809;
    float _845 = _805 + _843;
    int _847 = abs(_837);
    int _849 = abs(_841);
    float _851 = -_845;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = float(_833);
    bool _857 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _859 = fma(_831, 0.5, 0.5);
    float _861 = abs(_853);
    float _863 = _855 * _861;
    bool _865 = _845 < 0.5;
    float _867 = float(_865);
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _873 = float(_847);
    float _875 = -_867;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _879 = float(_849);
    float _881 = fma(_873, _871, _863);
    float _883 = abs(_877);
    float _885 = fma(_879, _883, _881);
    bool _887 = !_857;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _891 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_87);
        float _909 = 1.0 / _907;
        float _911 = _121 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _917 = _913 + _915;
    bool _919 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _921 = isnan(_913);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _933 = _913 + _931;
    bool _935 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_913);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / _953;
    bool _961 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _963 = isnan(_913);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _945 * _957;
    float _975 = -_945;
    float _977 = _975 + 1.0;
    bool _979 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _981 = _971 * _977;
    float _983 = 1.0 / _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _985;
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _997 = _933 * _959;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1003 = fma(_995, _997, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1005 = fma(_1001, _997, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1007 = _917 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1009;
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_987, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1019 = fma(_1011, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1021 = _1017 * _981;
    float _1023 = _1019 * _981;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1023);
    float _1027 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1021);
    float _1029 = fma(_1005, _973, _1025);
    float _1031 = fma(_1003, _973, _1027);
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1029);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1031);
    float _1037 = _1033 * _1013;
    float _1039 = _1035 * _1015;
    bool _1041 = !_979;
    float _1057;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1045 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_87);
        float _1063 = 1.0 / _1061;
        float _1065 = _121 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1071 = _1067 + _1069;
    bool _1073 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1075 = isnan(_1067);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1087 = _1067 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = 1.0 / _1091;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1105 = 1.0 / _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1107;
    float _1111 = _1071 * _1101;
    bool _1113 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1115 = isnan(_1067);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1125;
    bool _1129 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1131 = isnan(_1067);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = fma(_1109, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1143 = fma(_1127, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1145 = _1139 * _1099;
    float _1147 = -_1139;
    float _1149 = _1147 + 1.0;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1151;
    float _1155 = _1087 * _1105;
    float _1157 = _1123 * _1149;
    float _1159 = fma(_1153, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1161 = -_1123;
    float _1163 = _1161 + 1.0;
    float _1165 = _1141 * _1157;
    float _1167 = _1159 * _1157;
    float _1169 = _1143 * _1157;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1167);
    float _1185 = fma(_1173, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1165);
    float _1189 = fma(_1177, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1191 = fma(_1181, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1193 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1169);
    float _1195 = fma(_1185, _1145, _1183);
    float _1197 = fma(_1189, _1145, _1187);
    float _1199 = fma(_1191, _1145, _1193);
    float _1201 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1195);
    float _1203 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1197);
    float _1205 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1199);
    bool _1207 = !_1103;
    float _1223;
    if (!_1207)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1211 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1215 = _1213 * _1209;
        float _1217 = floor(_1215);
        float _1219 = -_1217;
        float _1221 = _1215 + _1219;
        _1223 = _1221;
        _1225 = true;
    }
    else
    {
        float _1227 = float(_87);
        float _1229 = 1.0 / _1227;
        float _1231 = _121 * _1229;
        _1223 = _1231;
    }
    _1225 = false;
    float _1233 = _1223;
    float _1235 = _791 * _791;
    float _1237 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1239 = _885 * _1037;
    float _1241 = _885 * _1039;
    float _1243 = fma(_793, _793, _1235);
    float _1245 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1247 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1249 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1251 = fma(_795, _795, _1243);
    float _1253 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1257 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1265 = _1261 || _1263;
    float _1267 = rsqrt(_1251);
    float _1269 = _1267 * _795;
    float _1271 = _1267 * _793;
    float _1273 = _1267 * _791;
    float _1275 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1245);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1269 * _1277;
    float _1281 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1285 = _1273 * _1283;
    float _1287 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1275);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1291 = -_1279;
    float _1293 = fma(_1271, _1289, _1291);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1297 = _1271 * _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1301 = -_1285;
    float _1303 = fma(_1269, _1299, _1301);
    float _1305 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1237);
    float _1307 = _1293 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1311 = -_1297;
    float _1313 = fma(_1273, _1309, _1311);
    float _1315 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1247);
    float _1317 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1305);
    float _1319 = fma(_1303, _1303, _1307);
    float _1321 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1249);
    float _1323 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1327 = fma(_1313, _1313, _1319);
    float _1329 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1321);
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1333 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1335 = _395 * _1325;
    float _1337 = _1281 * _1253;
    float _1339 = rsqrt(_1327);
    float _1341 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1343 = _1255 * _1331;
    float _1345 = _411 * _1333;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1349 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = _445 * _1341;
    float _1353 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1347);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1359 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1343 * _1271;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1357);
    float _1367 = _1343 * _1269;
    float _1369 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1293 * _1339;
    float _1373 = _1313 * _1339;
    float _1375 = _1303 * _1339;
    float _1377 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1365);
    float _1379 = _1271 * _1371;
    float _1381 = fma(_1337, _1373, _1367);
    float _1383 = _1273 * _1373;
    float _1385 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1363);
    float _1387 = -_1379;
    float _1389 = fma(_1273, _1375, _1387);
    float _1391 = _1377 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1393 = fma(_1337, _1375, _1361);
    float _1395 = -_1383;
    float _1397 = fma(_1269, _1371, _1395);
    float _1399 = fma(_1359, _1389, _1381);
    float _1401 = _1385 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1403 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1405 = fma(_1359, _1397, _1393);
    float _1407 = _1391 + _1399;
    float _1409 = _1343 * _1273;
    float _1411 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1413 = _1401 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1417 = _1407 + _1415;
    float _1419 = _1269 * _1375;
    float _1421 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1417 * _1417;
    float _1429 = fma(_1337, _1371, _1409);
    float _1431 = -_1419;
    float _1433 = fma(_1271, _1373, _1431);
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1437 = fma(_1425, _1425, _1427);
    float _1439 = fma(_1359, _1433, _1429);
    float _1441 = sqrt(_1437);
    float _1443 = _1435 + _1439;
    bool _1445 = _1441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1345;
    float _1449 = _1377;
    float _1451 = _1413;
    float _1453 = _1359;
    float _1455 = _1407;
    float _1457 = _1403;
    if (!_1445)
    {
        _1447 = _1407;
    }
    float _1459 = _1447;
    float _1461 = _1459;
    if (!_1445)
    {
        _1449 = _1443;
    }
    float _1463 = _1449;
    bool _1465 = !_1445;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1473 = _1441 + _1471;
        float _1475 = rsqrt(_1437);
        float _1477 = _1473 * _1469;
        float _1479 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = _1477 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = fma(_1485, _1479, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1475 * _1491;
        float _1495 = _1489 + (-1.0);
        float _1497 = fma(_1425, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1417, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1501 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1443, _1489, _1501);
        _1451 = _1497;
        _1467 = _1503;
        _1461 = _1499;
    }
    float _1505 = _1451;
    float _1507 = _1467;
    float _1509 = _1461;
    float _1511 = _1507;
    float _1513 = _1505;
    float _1515 = _1509;
    if (!_1265)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1435 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _1401 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = -_1401;
        float _1529 = _1527 + _1505;
        float _1531 = _1519 * _1519;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1535 = _1391 + _1533;
        float _1537 = -_1435;
        float _1539 = _1537 + _1507;
        float _1541 = -_1391;
        float _1543 = _1541 + _1509;
        float _1545 = fma(_1523, _1523, _1531);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1549 = fma(_1535, _1535, _1545);
        float _1551 = sqrt(_1549);
        float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1555 = precise::min(_1551, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1557 = _1555 * _1547;
        float _1559 = _1553 * _1557;
        float _1561 = fma(_1529, _1559, _1401);
        float _1563 = fma(_1539, _1559, _1435);
        float _1565 = fma(_1543, _1559, _1391);
        _1511 = _1563;
        _1513 = _1561;
        _1515 = _1565;
        _1453 = _1525;
    }
    float _1567 = _1511;
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1453;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1567 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1571 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1573;
    float _1619 = _1615;
    float _1621 = _1597;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    if (_1611)
    {
        float _1627 = rsqrt(_1607);
        _1455 = _1627;
    }
    float _1629 = _1455;
    float _1631 = _1629;
    if (_1611)
    {
        float _1633 = _1615 * _1625;
        _1619 = _1633;
    }
    float _1635 = _1619;
    float _1637 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1611)
    {
        float _1639 = _1635 * 0.15915493667125701904296875;
        _1457 = _1639;
    }
    float _1641 = _1457;
    float _1643 = _1443;
    if (_1611)
    {
        float _1645 = _1641 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1643 = _1647;
    }
    float _1649 = _1643;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _1353;
    float _1657 = _1651;
    float _1659 = _1653;
    if (_1611)
    {
        float _1661 = _1641 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1655 = _1663;
    }
    float _1665 = _1655;
    if (!_1611)
    {
        _1657 = _1599;
    }
    float _1667 = _1657;
    float _1669 = -_1597;
    float _1671 = -_1653;
    float _1673 = fma(_1577, _1669, _1671);
    float _1675 = _1667;
    if (_1611)
    {
        float _1677 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1679;
    float _1683 = _1649;
    if (_1611)
    {
        float _1685 = fma(_1649, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = _1687;
    float _1691 = _1665;
    if (_1611)
    {
        float _1693 = _1665 + (-1.0);
        _1683 = _1693;
    }
    float _1695 = _1683;
    float _1697 = _1695;
    if (_1611)
    {
        float _1699 = _1629 * _1687;
        _1621 = _1699;
    }
    float _1701 = _1621;
    if (!_1611)
    {
        _1689 = _1673;
    }
    float _1703 = _1689;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1709;
    if (_1611)
    {
        float _1713 = _1599 * _1701;
        _1675 = _1713;
    }
    float _1715 = _1675;
    if (!_1611)
    {
        _1697 = _1601;
    }
    float _1717 = _1697;
    float _1719 = _1717;
    if (_1611)
    {
        float _1721 = _1601 * _1701;
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (_1611)
    {
        float _1725 = fma(_1673, _1665, _1709);
        _1705 = _1725;
    }
    float _1727 = _1705;
    if (!_1611)
    {
        _1711 = _1603;
    }
    float _1729 = _1711;
    float _1731 = _1729;
    if (_1611)
    {
        float _1733 = _1715 * _1715;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1611)
    {
        _1691 = _1605;
    }
    float _1739 = _1691;
    float _1741 = _1739;
    if (_1611)
    {
        float _1743 = _1723 * _1723;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1727, _1727, _1735);
    float _1749 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1755 = _1747 + _1745;
    float _1757 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1637);
    float _1761 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1751);
    float _1763 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1753);
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = rsqrt(_1755);
    float _1773 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1775 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1777 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1769;
    float _1781 = _1779 + 1.0;
    float _1783 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1789 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1793 = abs(_1781);
    float _1795 = log2(_1793);
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1803 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1805 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1771 * _1715;
    float _1809 = _1771 * _1723;
    float _1811 = -_1801;
    float _1813 = fma(_1811, _1791, 1.0);
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1771 * _1727;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = 1.0 / _1815;
    float _1823 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1803);
    float _1825 = -_1819;
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = -_1809;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = log2(_1813);
    float _1841 = _1817 + 1.0;
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1849 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = exp2(_1829);
    float _1853 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1845, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1859 = fma(_1845, _1855, 1.570728778839111328125);
    float _1861 = sqrt(_1843);
    float _1863 = _1839 * 0.693147182464599609375;
    float _1865 = _1857 * _1821;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1865, 0.5, 0.5);
    float _1871 = -_1817;
    float _1873 = fma(_1851, _1841, _1871);
    float _1875 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1877 = _1875 * _1821;
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = fma(_1873, 0.5, 0.5);
    float _1885 = -_1859;
    float _1887 = fma(_1879, _1885, 1.0);
    float3 _5314 = float3(_1869, _1881, _1867);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5314, float3(0.0), isnan(_5314)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5314, float3(0.0), isnan(_5314)), level(0.0)).x;
    float3 _5325 = float3(_1869, _1881, _1867);
    float4 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).xyzw;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1892.w;
    float2 _5342 = float2(_1887, _1883);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = in.m_54.y;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1916 = _1233 + _1914;
    bool _1918 = _797 > 0.5;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1930 = 1.0 / _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1936 = _1934 != 0;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1942 = _1940 != 0;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1912 > 0.5;
    out.m_56.x = _1946;
    out.m_56.y = _1948;
    out.m_56.z = _1952;
    float _1962 = _1926 * _1930;
    bool _1964 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1966 = isnan(_1233);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = exp2(_1956);
    float _1978 = -_203;
    int _1980 = _1960 ? as_type<int>(_1978) : as_type<int>(_203);
    float _1982 = fma(_1962, _1916, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1984 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1986 = isnan(_1233);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    bool _1998 = !_1942;
    float _2000 = _1998 ? _203 : as_type<float>(_1980);
    float _2002 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = -_1994;
    float _2006 = _2004 + 1.0;
    float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2010 = _1271 * _2002;
    float _2012 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2014 = _1974 * _2006;
    float _2016 = -_1974;
    float _2018 = _2016 + 1.0;
    float _2020 = _1273 * _2002;
    float _2022 = _1269 * _2002;
    float _2024 = _1982 * _2014;
    float _2026 = -_199;
    int _2028 = _1918 ? as_type<int>(_2026) : as_type<int>(_199);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2032 = -_2000;
    float _2034 = _2032 + 0.5;
    float _2036 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2024);
    bool _2038 = !_1936;
    float _2040 = _2038 ? _199 : as_type<float>(_2028);
    float _2042 = fma(_1375, _2012, _2010);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2036);
    float _2048 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2040 + 0.5;
    float _2052 = _1397 + _2042;
    float _2054 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2068 = _2064 || _2066;
    float _2070 = fma(_1371, _2012, _2020);
    float _2072 = fma(_1373, _2012, _2022);
    float _2074 = _2058 * _2008;
    float _2076 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2078 = _2044 * _2030;
    float _2080 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2082 = _1433 + _2070;
    float _2084 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2076);
    float _2086 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _2074;
    out.m_58.y = _2078;
    float _2088 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2080);
    float _2090 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2084);
    float _2092 = _1389 + _2072;
    out.m_60.x = _2048;
    out.m_60.y = _2054;
    out.m_60.z = _2086;
    out.m_60.w = _2056;
    float _2094 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2088);
    float _2096 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2098 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    out.m_62.x = _2052;
    out.m_62.y = _2082;
    out.m_62.z = _2092;
    float _2100 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2102 = 1.0 / _2096;
    float _2104 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2098);
    float _2106 = _2100 + _2096;
    float _2108 = _2052;
    if (_2068)
    {
        _2108 = 1.0;
    }
    float _2110 = _2108;
    float _2112 = _2106 * _2102;
    float _2114 = _2112 * 0.5;
    float _2116 = _2110;
    if (!_2068)
    {
        float _2118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2122 = _2118 * 0.15915493667125701904296875;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2128 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2126);
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2122 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2132;
        float _2140 = _2124 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2124 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = 1.0 / _2128;
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2154;
        float _2158 = 1.0 / _2150;
        float _2160 = 1.0 / _2156;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2164 = _2152 * _2162;
        float _2166 = _2148 * _2158;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2166, _2164, _2168);
        float _2172 = _2170 * _2160;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2116 = _2174;
    }
    float _2176 = _2116;
    float _2178 = _2104 + _1815;
    float _2180 = -_1976;
    float _2182 = _2180 + 1.0;
    bool _2184 = _2176 > 0.0;
    bool _2186 = isnan(_2176);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2196 = _2178 * 0.5;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1581;
    out.m_64.y = _1577;
    out.m_64.z = _1585;
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2202 = _2198 * _1889;
    float _2204 = -_2198;
    float _2206 = _2204 + 1.0;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1875;
    out.gl_Position.z = _2104;
    out.gl_Position.w = _1815;
    float _2208 = _1900 * _2202;
    float _2210 = _1910 * _2202;
    out.m_66.z = _2196;
    out.m_66.w = _1815;
    float _2212 = fma(_1906, _2208, _1894);
    float _2214 = fma(_1908, _2208, _1896);
    float _2216 = _1900 * _2206;
    float _2218 = fma(_1900, _2210, _1898);
    out.m_45.x = _2200;
    out.m_68.x = _2212;
    out.m_68.y = _2214;
    out.m_68.z = _2218;
    out.m_68.w = _2216;
    if (_2192)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2220;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _1059 = false;
    bool _905 = false;
    bool _567 = false;
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
        float _2277 = as_type<float>(_103);
        out.gl_Position.z = _2277;
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
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_139);
        out.gl_Position.z = _2345;
    }
    if (_133)
    {
        return out;
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _165 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _163);
    float _169 = _163;
    float _171 = _143;
    if (!_159)
    {
        float _173 = _143 * _143;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_159)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _165);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _183;
    float _209 = 0.0;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _143 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _143);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _237;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    if (!_245)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _143 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _171 = _267;
    }
    float _269 = _171;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _271;
    float _279 = _275;
    if (!_159)
    {
        float _281 = _121 * _121;
        float _283 = _281 * 0.5;
        _247 = _283;
    }
    float _285 = _247;
    float _287 = fma(_269, _145, _271);
    float _289 = fma(_269, _147, _273);
    float _291 = fma(_269, _149, _275);
    if (!_159)
    {
        float _293 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _293;
    }
    float _295 = _277;
    bool _297 = !_159;
    float _299 = _295;
    if (!_297)
    {
        float _301 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = log2(_301);
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _121 * _303;
        float _313 = 1.0 / _307;
        float _315 = _309 * 0.693147182464599609375;
        float _317 = exp2(_311);
        float _319 = 1.0 / _315;
        float _321 = _317 + (-1.0);
        float _323 = -_321;
        float _325 = fma(_323, _319, _121);
        float _327 = _325 * _313;
        float _329 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _299 = _329;
        _279 = _317;
    }
    float _331 = _299;
    float _333 = _279;
    float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _333;
    if (!_159)
    {
        _337 = _121;
    }
    float _339 = _337;
    bool _341 = !_159;
    float _343 = _339;
    if (!_341)
    {
        float _345 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = log2(_345);
        float _349 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _351 = _349 + 1.0;
        float _353 = 1.0 / _351;
        float _355 = _121 * _347;
        float _357 = exp2(_355);
        float _359 = -_357;
        float _361 = _359 + 1.0;
        float _363 = _361 * _353;
        _343 = _363;
    }
    float _365 = _343;
    float _367 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_365, _147, _335);
    float _371 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_365, _145, _367);
    float _375 = -_369;
    float _377 = _289 + _375;
    float _379 = fma(_365, _149, _371);
    float _381 = -_373;
    float _383 = _287 + _381;
    float _385 = _377 * _377;
    float _387 = -_379;
    float _389 = _291 + _387;
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = fma(_383, _383, _385);
    float _395 = sqrt(_195);
    float _397 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _399 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _401 = fma(_389, _389, _393);
    float _403 = in.m_52.w;
    float _405 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _397);
    float _407 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = sqrt(_167);
    float _413 = in.m_42.x;
    float _415 = in.m_42.y;
    float _417 = in.m_42.z;
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].y, _407);
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].x, _399);
    float _423 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _425 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _419);
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _431 = sqrt(_401);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].w, _423);
    float _435 = _395 * _427;
    float _437 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _441 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = sqrt(_405);
    float _447 = _411 * _429;
    float _449 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _455 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    bool _457 = _431 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_291, _403, _417);
    float _469 = _445 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _455);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = fma(_287, _403, _413);
    float _485 = fma(_289, _403, _415);
    float _487 = _479;
    float _489 = _477;
    float _491 = _481;
    if (!_465)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _395 * _509;
            float _519 = _411 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _445 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _533 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].w, _539);
            float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].w, _543);
            float _551 = _545 * _545;
            float _553 = fma(_547, _547, _551);
            float _555 = fma(_549, _549, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _545 * _559;
            float _565 = _549 * _559;
            _487 = _563;
            _489 = _561;
            _491 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _147 * _147;
            float _571 = fma(_145, _145, _569);
            float _573 = fma(_149, _149, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _415 * _415;
                float _589 = fma(_413, _413, _587);
                float _591 = fma(_417, _417, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _395 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _411 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _487 = _647;
                    _489 = _645;
                    _491 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _395 * _667;
                    float _677 = _411 * _669;
                    float _679 = _445 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
                    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
                    float _699 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _697);
                    float _705 = _699 * _699;
                    float _707 = fma(_701, _701, _705);
                    float _709 = fma(_703, _703, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _699 * _713;
                    float _719 = _703 * _713;
                    _487 = _717;
                    _489 = _715;
                    _491 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _395 * _737;
                float _747 = _411 * _739;
                float _749 = _445 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _487 = _787;
                _489 = _785;
                _491 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _487;
    float _793 = _489;
    float _795 = _491;
    float _797 = in.m_54.x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _801 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _803 = _801 * _799;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[20].x, _803);
    float _807 = _805 * 6.283185482025146484375;
    float _809 = floor(_805);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _817 = _815 != 0;
    float _819 = _807 * 0.15915493667125701904296875;
    bool _821 = !_813;
    int _823 = _821 ? 0 : 1;
    int _825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _827 = _825 != 0;
    float _829 = _819 * 6.283185482025146484375;
    float _831 = cos(_829);
    int _833 = abs(_823);
    bool _835 = !_827;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_817;
    int _841 = _839 ? 0 : 1;
    float _843 = -_809;
    float _845 = _805 + _843;
    int _847 = abs(_837);
    int _849 = abs(_841);
    float _851 = -_845;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = float(_833);
    bool _857 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _859 = fma(_831, 0.5, 0.5);
    float _861 = abs(_853);
    float _863 = _855 * _861;
    bool _865 = _845 < 0.5;
    float _867 = float(_865);
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _873 = float(_847);
    float _875 = -_867;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _879 = float(_849);
    float _881 = fma(_873, _871, _863);
    float _883 = abs(_877);
    float _885 = fma(_879, _883, _881);
    bool _887 = !_857;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _891 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_87);
        float _909 = 1.0 / _907;
        float _911 = _121 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _917 = _913 + _915;
    bool _919 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _921 = isnan(_913);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _933 = _913 + _931;
    bool _935 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_913);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / _953;
    bool _961 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _963 = isnan(_913);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _945 * _957;
    float _975 = -_945;
    float _977 = _975 + 1.0;
    bool _979 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _981 = _971 * _977;
    float _983 = 1.0 / _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _985;
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _997 = _933 * _959;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1003 = fma(_995, _997, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1005 = fma(_1001, _997, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1007 = _917 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1009;
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_987, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1019 = fma(_1011, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1021 = _1017 * _981;
    float _1023 = _1019 * _981;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1023);
    float _1027 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1021);
    float _1029 = fma(_1005, _973, _1025);
    float _1031 = fma(_1003, _973, _1027);
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1029);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1031);
    float _1037 = _1033 * _1013;
    float _1039 = _1035 * _1015;
    bool _1041 = !_979;
    float _1057;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1045 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_87);
        float _1063 = 1.0 / _1061;
        float _1065 = _121 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1071 = _1067 + _1069;
    bool _1073 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1075 = isnan(_1067);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1087 = _1067 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = 1.0 / _1091;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1105 = 1.0 / _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1107;
    float _1111 = _1071 * _1101;
    bool _1113 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1115 = isnan(_1067);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1125;
    bool _1129 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1131 = isnan(_1067);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = fma(_1109, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1143 = fma(_1127, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1145 = _1139 * _1099;
    float _1147 = -_1139;
    float _1149 = _1147 + 1.0;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1151;
    float _1155 = _1087 * _1105;
    float _1157 = _1123 * _1149;
    float _1159 = fma(_1153, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1161 = -_1123;
    float _1163 = _1161 + 1.0;
    float _1165 = _1141 * _1157;
    float _1167 = _1159 * _1157;
    float _1169 = _1143 * _1157;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1167);
    float _1185 = fma(_1173, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1165);
    float _1189 = fma(_1177, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1191 = fma(_1181, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1193 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1169);
    float _1195 = fma(_1185, _1145, _1183);
    float _1197 = fma(_1189, _1145, _1187);
    float _1199 = fma(_1191, _1145, _1193);
    float _1201 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1195);
    float _1203 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1197);
    float _1205 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1199);
    bool _1207 = !_1103;
    float _1223;
    if (!_1207)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1211 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1215 = _1213 * _1209;
        float _1217 = floor(_1215);
        float _1219 = -_1217;
        float _1221 = _1215 + _1219;
        _1223 = _1221;
        _1225 = true;
    }
    else
    {
        float _1227 = float(_87);
        float _1229 = 1.0 / _1227;
        float _1231 = _121 * _1229;
        _1223 = _1231;
    }
    _1225 = false;
    float _1233 = _1223;
    float _1235 = _791 * _791;
    float _1237 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1239 = _885 * _1037;
    float _1241 = _885 * _1039;
    float _1243 = fma(_793, _793, _1235);
    float _1245 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1247 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1249 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1251 = fma(_795, _795, _1243);
    float _1253 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1257 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1265 = _1261 || _1263;
    float _1267 = rsqrt(_1251);
    float _1269 = _1267 * _795;
    float _1271 = _1267 * _793;
    float _1273 = _1267 * _791;
    float _1275 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1245);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1269 * _1277;
    float _1281 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1285 = _1273 * _1283;
    float _1287 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1275);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1291 = -_1279;
    float _1293 = fma(_1271, _1289, _1291);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1297 = _1271 * _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1301 = -_1285;
    float _1303 = fma(_1269, _1299, _1301);
    float _1305 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1237);
    float _1307 = _1293 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1311 = -_1297;
    float _1313 = fma(_1273, _1309, _1311);
    float _1315 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1247);
    float _1317 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1305);
    float _1319 = fma(_1303, _1303, _1307);
    float _1321 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1249);
    float _1323 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1327 = fma(_1313, _1313, _1319);
    float _1329 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1321);
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1333 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1335 = _395 * _1325;
    float _1337 = _1281 * _1253;
    float _1339 = rsqrt(_1327);
    float _1341 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1343 = _1255 * _1331;
    float _1345 = _411 * _1333;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1349 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = _445 * _1341;
    float _1353 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1347);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1359 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1343 * _1271;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1357);
    float _1367 = _1343 * _1269;
    float _1369 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1293 * _1339;
    float _1373 = _1313 * _1339;
    float _1375 = _1303 * _1339;
    float _1377 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1365);
    float _1379 = _1271 * _1371;
    float _1381 = fma(_1337, _1373, _1367);
    float _1383 = _1273 * _1373;
    float _1385 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1363);
    float _1387 = -_1379;
    float _1389 = fma(_1273, _1375, _1387);
    float _1391 = _1377 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1393 = fma(_1337, _1375, _1361);
    float _1395 = -_1383;
    float _1397 = fma(_1269, _1371, _1395);
    float _1399 = fma(_1359, _1389, _1381);
    float _1401 = _1385 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1403 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1405 = fma(_1359, _1397, _1393);
    float _1407 = _1391 + _1399;
    float _1409 = _1343 * _1273;
    float _1411 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1413 = _1401 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1417 = _1407 + _1415;
    float _1419 = _1269 * _1375;
    float _1421 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1417 * _1417;
    float _1429 = fma(_1337, _1371, _1409);
    float _1431 = -_1419;
    float _1433 = fma(_1271, _1373, _1431);
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1437 = fma(_1425, _1425, _1427);
    float _1439 = fma(_1359, _1433, _1429);
    float _1441 = sqrt(_1437);
    float _1443 = _1435 + _1439;
    bool _1445 = _1441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1345;
    float _1449 = _1377;
    float _1451 = _1413;
    float _1453 = _1359;
    float _1455 = _1407;
    float _1457 = _1403;
    if (!_1445)
    {
        _1447 = _1407;
    }
    float _1459 = _1447;
    float _1461 = _1459;
    if (!_1445)
    {
        _1449 = _1443;
    }
    float _1463 = _1449;
    bool _1465 = !_1445;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1473 = _1441 + _1471;
        float _1475 = rsqrt(_1437);
        float _1477 = _1473 * _1469;
        float _1479 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = _1477 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = fma(_1485, _1479, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1475 * _1491;
        float _1495 = _1489 + (-1.0);
        float _1497 = fma(_1425, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1417, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1501 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1443, _1489, _1501);
        _1451 = _1497;
        _1467 = _1503;
        _1461 = _1499;
    }
    float _1505 = _1451;
    float _1507 = _1467;
    float _1509 = _1461;
    float _1511 = _1507;
    float _1513 = _1505;
    float _1515 = _1509;
    if (!_1265)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1435 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _1401 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = -_1401;
        float _1529 = _1527 + _1505;
        float _1531 = _1519 * _1519;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1535 = _1391 + _1533;
        float _1537 = -_1435;
        float _1539 = _1537 + _1507;
        float _1541 = -_1391;
        float _1543 = _1541 + _1509;
        float _1545 = fma(_1523, _1523, _1531);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1549 = fma(_1535, _1535, _1545);
        float _1551 = sqrt(_1549);
        float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1555 = precise::min(_1551, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1557 = _1555 * _1547;
        float _1559 = _1553 * _1557;
        float _1561 = fma(_1529, _1559, _1401);
        float _1563 = fma(_1539, _1559, _1435);
        float _1565 = fma(_1543, _1559, _1391);
        _1511 = _1563;
        _1513 = _1561;
        _1515 = _1565;
        _1453 = _1525;
    }
    float _1567 = _1511;
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1453;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1567 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1571 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1573;
    float _1619 = _1615;
    float _1621 = _1597;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    if (_1611)
    {
        float _1627 = rsqrt(_1607);
        _1455 = _1627;
    }
    float _1629 = _1455;
    float _1631 = _1629;
    if (_1611)
    {
        float _1633 = _1615 * _1625;
        _1619 = _1633;
    }
    float _1635 = _1619;
    float _1637 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1611)
    {
        float _1639 = _1635 * 0.15915493667125701904296875;
        _1457 = _1639;
    }
    float _1641 = _1457;
    float _1643 = _1443;
    if (_1611)
    {
        float _1645 = _1641 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1643 = _1647;
    }
    float _1649 = _1643;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _1353;
    float _1657 = _1651;
    float _1659 = _1653;
    if (_1611)
    {
        float _1661 = _1641 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1655 = _1663;
    }
    float _1665 = _1655;
    if (!_1611)
    {
        _1657 = _1599;
    }
    float _1667 = _1657;
    float _1669 = -_1597;
    float _1671 = -_1653;
    float _1673 = fma(_1577, _1669, _1671);
    float _1675 = _1667;
    if (_1611)
    {
        float _1677 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1679;
    float _1683 = _1649;
    if (_1611)
    {
        float _1685 = fma(_1649, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = _1687;
    float _1691 = _1665;
    if (_1611)
    {
        float _1693 = _1665 + (-1.0);
        _1683 = _1693;
    }
    float _1695 = _1683;
    float _1697 = _1695;
    if (_1611)
    {
        float _1699 = _1629 * _1687;
        _1621 = _1699;
    }
    float _1701 = _1621;
    if (!_1611)
    {
        _1689 = _1673;
    }
    float _1703 = _1689;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1709;
    if (_1611)
    {
        float _1713 = _1599 * _1701;
        _1675 = _1713;
    }
    float _1715 = _1675;
    if (!_1611)
    {
        _1697 = _1601;
    }
    float _1717 = _1697;
    float _1719 = _1717;
    if (_1611)
    {
        float _1721 = _1601 * _1701;
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (_1611)
    {
        float _1725 = fma(_1673, _1665, _1709);
        _1705 = _1725;
    }
    float _1727 = _1705;
    if (!_1611)
    {
        _1711 = _1603;
    }
    float _1729 = _1711;
    float _1731 = _1729;
    if (_1611)
    {
        float _1733 = _1715 * _1715;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1611)
    {
        _1691 = _1605;
    }
    float _1739 = _1691;
    float _1741 = _1739;
    if (_1611)
    {
        float _1743 = _1723 * _1723;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1727, _1727, _1735);
    float _1749 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1755 = _1747 + _1745;
    float _1757 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1637);
    float _1761 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1751);
    float _1763 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1753);
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = rsqrt(_1755);
    float _1773 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1775 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1777 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1769;
    float _1781 = _1779 + 1.0;
    float _1783 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1789 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1793 = abs(_1781);
    float _1795 = log2(_1793);
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1803 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1805 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1771 * _1715;
    float _1809 = _1771 * _1723;
    float _1811 = -_1801;
    float _1813 = fma(_1811, _1791, 1.0);
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1771 * _1727;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = 1.0 / _1815;
    float _1823 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1803);
    float _1825 = -_1819;
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = -_1809;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = log2(_1813);
    float _1841 = _1817 + 1.0;
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1849 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = exp2(_1829);
    float _1853 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1845, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1859 = fma(_1845, _1855, 1.570728778839111328125);
    float _1861 = sqrt(_1843);
    float _1863 = _1839 * 0.693147182464599609375;
    float _1865 = _1857 * _1821;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1865, 0.5, 0.5);
    float _1871 = -_1817;
    float _1873 = fma(_1851, _1841, _1871);
    float _1875 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1877 = _1875 * _1821;
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = fma(_1873, 0.5, 0.5);
    float _1885 = -_1859;
    float _1887 = fma(_1879, _1885, 1.0);
    float3 _5314 = float3(_1869, _1881, _1867);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5314, float3(0.0), isnan(_5314)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5314, float3(0.0), isnan(_5314)), level(0.0)).x;
    float3 _5325 = float3(_1869, _1881, _1867);
    float4 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).xyzw;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1892.w;
    float2 _5342 = float2(_1887, _1883);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = in.m_54.y;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1916 = _1233 + _1914;
    bool _1918 = _797 > 0.5;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1930 = 1.0 / _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1936 = _1934 != 0;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1942 = _1940 != 0;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1912 > 0.5;
    out.m_56.x = _1946;
    out.m_56.y = _1948;
    out.m_56.z = _1952;
    float _1962 = _1926 * _1930;
    bool _1964 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1966 = isnan(_1233);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = exp2(_1956);
    float _1978 = -_203;
    int _1980 = _1960 ? as_type<int>(_1978) : as_type<int>(_203);
    float _1982 = fma(_1962, _1916, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1984 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1986 = isnan(_1233);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    bool _1998 = !_1942;
    float _2000 = _1998 ? _203 : as_type<float>(_1980);
    float _2002 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = -_1994;
    float _2006 = _2004 + 1.0;
    float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2010 = _1271 * _2002;
    float _2012 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2014 = _1974 * _2006;
    float _2016 = -_1974;
    float _2018 = _2016 + 1.0;
    float _2020 = _1273 * _2002;
    float _2022 = _1269 * _2002;
    float _2024 = _1982 * _2014;
    float _2026 = -_199;
    int _2028 = _1918 ? as_type<int>(_2026) : as_type<int>(_199);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2032 = -_2000;
    float _2034 = _2032 + 0.5;
    float _2036 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2024);
    bool _2038 = !_1936;
    float _2040 = _2038 ? _199 : as_type<float>(_2028);
    float _2042 = fma(_1375, _2012, _2010);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2036);
    float _2048 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2040 + 0.5;
    float _2052 = _1397 + _2042;
    float _2054 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2068 = _2064 || _2066;
    float _2070 = fma(_1371, _2012, _2020);
    float _2072 = fma(_1373, _2012, _2022);
    float _2074 = _2058 * _2008;
    float _2076 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2078 = _2044 * _2030;
    float _2080 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2082 = _1433 + _2070;
    float _2084 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2076);
    float _2086 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _2074;
    out.m_58.y = _2078;
    float _2088 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2080);
    float _2090 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2084);
    float _2092 = _1389 + _2072;
    out.m_60.x = _2048;
    out.m_60.y = _2054;
    out.m_60.z = _2086;
    out.m_60.w = _2056;
    float _2094 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2088);
    float _2096 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2098 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    out.m_62.x = _2052;
    out.m_62.y = _2082;
    out.m_62.z = _2092;
    float _2100 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2102 = 1.0 / _2096;
    float _2104 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2098);
    float _2106 = _2100 + _2096;
    float _2108 = _2052;
    if (_2068)
    {
        _2108 = 1.0;
    }
    float _2110 = _2108;
    float _2112 = _2106 * _2102;
    float _2114 = _2112 * 0.5;
    float _2116 = _2110;
    if (!_2068)
    {
        float _2118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2122 = _2118 * 0.15915493667125701904296875;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2128 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2126);
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2122 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2132;
        float _2140 = _2124 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2124 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = 1.0 / _2128;
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2154;
        float _2158 = 1.0 / _2150;
        float _2160 = 1.0 / _2156;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2164 = _2152 * _2162;
        float _2166 = _2148 * _2158;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2166, _2164, _2168);
        float _2172 = _2170 * _2160;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2116 = _2174;
    }
    float _2176 = _2116;
    float _2178 = _2104 + _1815;
    float _2180 = -_1976;
    float _2182 = _2180 + 1.0;
    bool _2184 = _2176 > 0.0;
    bool _2186 = isnan(_2176);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2196 = _2178 * 0.5;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1581;
    out.m_64.y = _1577;
    out.m_64.z = _1585;
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2202 = _2198 * _1889;
    float _2204 = -_2198;
    float _2206 = _2204 + 1.0;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1875;
    out.gl_Position.z = _2104;
    out.gl_Position.w = _1815;
    float _2208 = _1900 * _2202;
    float _2210 = _1910 * _2202;
    out.m_66.z = _2196;
    out.m_66.w = _1815;
    float _2212 = fma(_1906, _2208, _1894);
    float _2214 = fma(_1908, _2208, _1896);
    float _2216 = _1900 * _2206;
    float _2218 = fma(_1900, _2210, _1898);
    out.m_45.x = _2200;
    out.m_68.x = _2212;
    out.m_68.y = _2214;
    out.m_68.z = _2218;
    out.m_68.w = _2216;
    if (_2192)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2220;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1225 = false;
    bool _1059 = false;
    bool _905 = false;
    bool _567 = false;
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
        float _2277 = as_type<float>(_103);
        out.gl_Position.z = _2277;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2345 = as_type<float>(_139);
        out.gl_Position.z = _2345;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _165 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _163);
    float _169 = _163;
    float _171 = _143;
    if (!_159)
    {
        float _173 = _143 * _143;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    float _179 = _177;
    if (!_159)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_141) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_141) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _165);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _183;
    float _209 = 0.0;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _143 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _143);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _237;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    if (!_245)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _143 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _171 = _267;
    }
    float _269 = _171;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _271;
    float _279 = _275;
    if (!_159)
    {
        float _281 = _121 * _121;
        float _283 = _281 * 0.5;
        _247 = _283;
    }
    float _285 = _247;
    float _287 = fma(_269, _145, _271);
    float _289 = fma(_269, _147, _273);
    float _291 = fma(_269, _149, _275);
    if (!_159)
    {
        float _293 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _293;
    }
    float _295 = _277;
    bool _297 = !_159;
    float _299 = _295;
    if (!_297)
    {
        float _301 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = log2(_301);
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _121 * _303;
        float _313 = 1.0 / _307;
        float _315 = _309 * 0.693147182464599609375;
        float _317 = exp2(_311);
        float _319 = 1.0 / _315;
        float _321 = _317 + (-1.0);
        float _323 = -_321;
        float _325 = fma(_323, _319, _121);
        float _327 = _325 * _313;
        float _329 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _299 = _329;
        _279 = _317;
    }
    float _331 = _299;
    float _333 = _279;
    float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _337 = _333;
    if (!_159)
    {
        _337 = _121;
    }
    float _339 = _337;
    bool _341 = !_159;
    float _343 = _339;
    if (!_341)
    {
        float _345 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = log2(_345);
        float _349 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _351 = _349 + 1.0;
        float _353 = 1.0 / _351;
        float _355 = _121 * _347;
        float _357 = exp2(_355);
        float _359 = -_357;
        float _361 = _359 + 1.0;
        float _363 = _361 * _353;
        _343 = _363;
    }
    float _365 = _343;
    float _367 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_365, _147, _335);
    float _371 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = fma(_365, _145, _367);
    float _375 = -_369;
    float _377 = _289 + _375;
    float _379 = fma(_365, _149, _371);
    float _381 = -_373;
    float _383 = _287 + _381;
    float _385 = _377 * _377;
    float _387 = -_379;
    float _389 = _291 + _387;
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = fma(_383, _383, _385);
    float _395 = sqrt(_195);
    float _397 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _399 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _401 = fma(_389, _389, _393);
    float _403 = in.m_52.w;
    float _405 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _397);
    float _407 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _409 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = sqrt(_167);
    float _413 = in.m_42.x;
    float _415 = in.m_42.y;
    float _417 = in.m_42.z;
    float _419 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].y, _407);
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].x, _399);
    float _423 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _425 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _419);
    float _429 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _431 = sqrt(_401);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[14].w, _423);
    float _435 = _395 * _427;
    float _437 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _441 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _443 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = sqrt(_405);
    float _447 = _411 * _429;
    float _449 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[24].x, _441);
    float _453 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _455 = fma(_447, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    bool _457 = _431 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_431);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_291, _403, _417);
    float _469 = _445 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _451);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _453);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _455);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _481 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _483 = fma(_287, _403, _413);
    float _485 = fma(_289, _403, _415);
    float _487 = _479;
    float _489 = _477;
    float _491 = _481;
    if (!_465)
    {
        bool _493 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _495 = !_493;
        if (!_495)
        {
            float _497 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _499 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _503 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _497);
            float _505 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _499);
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _505);
            float _513 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _507);
            float _517 = _395 * _509;
            float _519 = _411 * _511;
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _513);
            float _523 = _445 * _515;
            float _525 = _517 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _527 = _517 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _529 = _517 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _521);
            float _533 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[25].x, _525);
            float _535 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[24].x, _527);
            float _537 = fma(_519, (*spvDescriptorSet0.vp_c8)._m0[26].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _533);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _535);
            float _543 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _537);
            float _545 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[25].w, _539);
            float _547 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[24].w, _541);
            float _549 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[26].w, _543);
            float _551 = _545 * _545;
            float _553 = fma(_547, _547, _551);
            float _555 = fma(_549, _549, _553);
            float _557 = rsqrt(_555);
            float _559 = _557 * 9.9999999747524270787835121154785e-07;
            float _561 = _547 * _559;
            float _563 = _545 * _559;
            float _565 = _549 * _559;
            _487 = _563;
            _489 = _561;
            _491 = _565;
            _567 = true;
        }
        else
        {
            float _569 = _147 * _147;
            float _571 = fma(_145, _145, _569);
            float _573 = fma(_149, _149, _571);
            float _575 = sqrt(_573);
            bool _577 = _575 >= 9.9999999747524270787835121154785e-07;
            bool _579 = isnan(_575);
            bool _581 = _577 || _579;
            bool _583 = isnan(9.9999999747524270787835121154785e-07);
            bool _585 = _581 || _583;
            if (!_585)
            {
                float _587 = _415 * _415;
                float _589 = fma(_413, _413, _587);
                float _591 = fma(_417, _417, _589);
                float _593 = sqrt(_591);
                bool _595 = _593 >= 9.9999999747524270787835121154785e-07;
                bool _597 = isnan(_593);
                bool _599 = _595 || _597;
                bool _601 = isnan(9.9999999747524270787835121154785e-07);
                bool _603 = _599 || _601;
                if (!_603)
                {
                    float _605 = _395 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _607 = _411 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _609 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _611 = _605 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _613 = _605 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _615 = _605 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _617 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[25].x, _611);
                    float _619 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[24].x, _613);
                    float _621 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[26].x, _615);
                    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _617);
                    float _625 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _619);
                    float _627 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
                    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _623);
                    float _631 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _627);
                    float _635 = _629 * _629;
                    float _637 = fma(_631, _631, _635);
                    float _639 = fma(_633, _633, _637);
                    float _641 = rsqrt(_639);
                    float _643 = _641 * 9.9999999747524270787835121154785e-07;
                    float _645 = _631 * _643;
                    float _647 = _629 * _643;
                    float _649 = _633 * _643;
                    _487 = _647;
                    _489 = _645;
                    _491 = _649;
                    _567 = true;
                }
                else
                {
                    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _653 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _655 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _657 = _415 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].y, _651);
                    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].x, _653);
                    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].z, _655);
                    float _665 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[14].w, _657);
                    float _667 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].y, _659);
                    float _669 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].x, _661);
                    float _671 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].z, _663);
                    float _673 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[16].w, _665);
                    float _675 = _395 * _667;
                    float _677 = _411 * _669;
                    float _679 = _445 * _671;
                    float _681 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _683 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _685 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _687 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].x, _681);
                    float _689 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].x, _683);
                    float _691 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
                    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _687);
                    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _689);
                    float _697 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _691);
                    float _699 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[25].w, _693);
                    float _701 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[24].w, _695);
                    float _703 = fma(_673, (*spvDescriptorSet0.vp_c8)._m0[26].w, _697);
                    float _705 = _699 * _699;
                    float _707 = fma(_701, _701, _705);
                    float _709 = fma(_703, _703, _707);
                    float _711 = rsqrt(_709);
                    float _713 = _711 * 9.9999999747524270787835121154785e-07;
                    float _715 = _701 * _713;
                    float _717 = _699 * _713;
                    float _719 = _703 * _713;
                    _487 = _717;
                    _489 = _715;
                    _491 = _719;
                    _567 = true;
                }
            }
            else
            {
                float _721 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _723 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _729 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _721);
                float _731 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _723);
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _727);
                float _737 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _729);
                float _739 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _735);
                float _745 = _395 * _737;
                float _747 = _411 * _739;
                float _749 = _445 * _741;
                float _751 = _745 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _753 = _745 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _755 = _745 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
                float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _753);
                float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _755);
                float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].z, _757);
                float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].z, _759);
                float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].z, _761);
                float _769 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[25].w, _763);
                float _771 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[24].w, _765);
                float _773 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[26].w, _767);
                float _775 = _769 * _769;
                float _777 = fma(_771, _771, _775);
                float _779 = fma(_773, _773, _777);
                float _781 = rsqrt(_779);
                float _783 = _781 * 9.9999999747524270787835121154785e-07;
                float _785 = _771 * _783;
                float _787 = _769 * _783;
                float _789 = _773 * _783;
                _487 = _787;
                _489 = _785;
                _491 = _789;
            }
        }
    }
    _567 = false;
    float _791 = _487;
    float _793 = _489;
    float _795 = _491;
    float _797 = in.m_54.x;
    float _799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _801 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _803 = _801 * _799;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[20].x, _803);
    float _807 = _805 * 6.283185482025146484375;
    float _809 = floor(_805);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _817 = _815 != 0;
    float _819 = _807 * 0.15915493667125701904296875;
    bool _821 = !_813;
    int _823 = _821 ? 0 : 1;
    int _825 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _827 = _825 != 0;
    float _829 = _819 * 6.283185482025146484375;
    float _831 = cos(_829);
    int _833 = abs(_823);
    bool _835 = !_827;
    int _837 = _835 ? 0 : 1;
    bool _839 = !_817;
    int _841 = _839 ? 0 : 1;
    float _843 = -_809;
    float _845 = _805 + _843;
    int _847 = abs(_837);
    int _849 = abs(_841);
    float _851 = -_845;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _855 = float(_833);
    bool _857 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _859 = fma(_831, 0.5, 0.5);
    float _861 = abs(_853);
    float _863 = _855 * _861;
    bool _865 = _845 < 0.5;
    float _867 = float(_865);
    float _869 = -_859;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _873 = float(_847);
    float _875 = -_867;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _879 = float(_849);
    float _881 = fma(_873, _871, _863);
    float _883 = abs(_877);
    float _885 = fma(_879, _883, _881);
    bool _887 = !_857;
    float _903;
    if (!_887)
    {
        float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _891 = _797 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _895 = _893 * _889;
        float _897 = floor(_895);
        float _899 = -_897;
        float _901 = _895 + _899;
        _903 = _901;
        _905 = true;
    }
    else
    {
        float _907 = float(_87);
        float _909 = 1.0 / _907;
        float _911 = _121 * _909;
        _903 = _911;
    }
    _905 = false;
    float _913 = _903;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _917 = _913 + _915;
    bool _919 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _921 = isnan(_913);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _933 = _913 + _931;
    bool _935 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_913);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _955 = -_929;
    float _957 = _955 + 1.0;
    float _959 = 1.0 / _953;
    bool _961 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _963 = isnan(_913);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _945 * _957;
    float _975 = -_945;
    float _977 = _975 + 1.0;
    bool _979 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _981 = _971 * _977;
    float _983 = 1.0 / _949;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _985;
    float _989 = -_971;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _997 = _933 * _959;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1001 = _999 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1003 = fma(_995, _997, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1005 = fma(_1001, _997, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1007 = _917 * _983;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1009;
    float _1013 = in.m_52.x;
    float _1015 = in.m_52.y;
    float _1017 = fma(_987, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1019 = fma(_1011, _1007, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1021 = _1017 * _981;
    float _1023 = _1019 * _981;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1023);
    float _1027 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1021);
    float _1029 = fma(_1005, _973, _1025);
    float _1031 = fma(_1003, _973, _1027);
    float _1033 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1029);
    float _1035 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1031);
    float _1037 = _1033 * _1013;
    float _1039 = _1035 * _1015;
    bool _1041 = !_979;
    float _1057;
    if (!_1041)
    {
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1045 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_87);
        float _1063 = 1.0 / _1061;
        float _1065 = _121 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1071 = _1067 + _1069;
    bool _1073 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1075 = isnan(_1067);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1087 = _1067 + _1085;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1097 = -_1083;
    float _1099 = _1097 + 1.0;
    float _1101 = 1.0 / _1091;
    bool _1103 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1105 = 1.0 / _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1107;
    float _1111 = _1071 * _1101;
    bool _1113 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1115 = isnan(_1067);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1125;
    bool _1129 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1131 = isnan(_1067);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1137 = _1133 || _1135;
    float _1139 = float(_1137);
    float _1141 = fma(_1109, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1143 = fma(_1127, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1145 = _1139 * _1099;
    float _1147 = -_1139;
    float _1149 = _1147 + 1.0;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1151;
    float _1155 = _1087 * _1105;
    float _1157 = _1123 * _1149;
    float _1159 = fma(_1153, _1111, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1161 = -_1123;
    float _1163 = _1161 + 1.0;
    float _1165 = _1141 * _1157;
    float _1167 = _1159 * _1157;
    float _1169 = _1143 * _1157;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1173 = _1171 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1183 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1167);
    float _1185 = fma(_1173, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1187 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1165);
    float _1189 = fma(_1177, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1191 = fma(_1181, _1155, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1193 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1169);
    float _1195 = fma(_1185, _1145, _1183);
    float _1197 = fma(_1189, _1145, _1187);
    float _1199 = fma(_1191, _1145, _1193);
    float _1201 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1195);
    float _1203 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1197);
    float _1205 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1199);
    bool _1207 = !_1103;
    float _1223;
    if (!_1207)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1211 = _797 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1215 = _1213 * _1209;
        float _1217 = floor(_1215);
        float _1219 = -_1217;
        float _1221 = _1215 + _1219;
        _1223 = _1221;
        _1225 = true;
    }
    else
    {
        float _1227 = float(_87);
        float _1229 = 1.0 / _1227;
        float _1231 = _121 * _1229;
        _1223 = _1231;
    }
    _1225 = false;
    float _1233 = _1223;
    float _1235 = _791 * _791;
    float _1237 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1239 = _885 * _1037;
    float _1241 = _885 * _1039;
    float _1243 = fma(_793, _793, _1235);
    float _1245 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1247 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1249 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1251 = fma(_795, _795, _1243);
    float _1253 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1257 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1265 = _1261 || _1263;
    float _1267 = rsqrt(_1251);
    float _1269 = _1267 * _795;
    float _1271 = _1267 * _793;
    float _1273 = _1267 * _791;
    float _1275 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1245);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1279 = _1269 * _1277;
    float _1281 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1285 = _1273 * _1283;
    float _1287 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1275);
    float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1291 = -_1279;
    float _1293 = fma(_1271, _1289, _1291);
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1297 = _1271 * _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1301 = -_1285;
    float _1303 = fma(_1269, _1299, _1301);
    float _1305 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1237);
    float _1307 = _1293 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1311 = -_1297;
    float _1313 = fma(_1273, _1309, _1311);
    float _1315 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1247);
    float _1317 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1305);
    float _1319 = fma(_1303, _1303, _1307);
    float _1321 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1249);
    float _1323 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1327 = fma(_1313, _1313, _1319);
    float _1329 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1321);
    float _1331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1333 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1335 = _395 * _1325;
    float _1337 = _1281 * _1253;
    float _1339 = rsqrt(_1327);
    float _1341 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1343 = _1255 * _1331;
    float _1345 = _411 * _1333;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1349 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = _445 * _1341;
    float _1353 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1347);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1359 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1361 = _1343 * _1271;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1355);
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1357);
    float _1367 = _1343 * _1269;
    float _1369 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = _1293 * _1339;
    float _1373 = _1313 * _1339;
    float _1375 = _1303 * _1339;
    float _1377 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1365);
    float _1379 = _1271 * _1371;
    float _1381 = fma(_1337, _1373, _1367);
    float _1383 = _1273 * _1373;
    float _1385 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1363);
    float _1387 = -_1379;
    float _1389 = fma(_1273, _1375, _1387);
    float _1391 = _1377 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1393 = fma(_1337, _1375, _1361);
    float _1395 = -_1383;
    float _1397 = fma(_1269, _1371, _1395);
    float _1399 = fma(_1359, _1389, _1381);
    float _1401 = _1385 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1403 = fma(_1345, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1405 = fma(_1359, _1397, _1393);
    float _1407 = _1391 + _1399;
    float _1409 = _1343 * _1273;
    float _1411 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1403);
    float _1413 = _1401 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1417 = _1407 + _1415;
    float _1419 = _1269 * _1375;
    float _1421 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1411);
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1425 = _1413 + _1423;
    float _1427 = _1417 * _1417;
    float _1429 = fma(_1337, _1371, _1409);
    float _1431 = -_1419;
    float _1433 = fma(_1271, _1373, _1431);
    float _1435 = _1421 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1437 = fma(_1425, _1425, _1427);
    float _1439 = fma(_1359, _1433, _1429);
    float _1441 = sqrt(_1437);
    float _1443 = _1435 + _1439;
    bool _1445 = _1441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1447 = _1345;
    float _1449 = _1377;
    float _1451 = _1413;
    float _1453 = _1359;
    float _1455 = _1407;
    float _1457 = _1403;
    if (!_1445)
    {
        _1447 = _1407;
    }
    float _1459 = _1447;
    float _1461 = _1459;
    if (!_1445)
    {
        _1449 = _1443;
    }
    float _1463 = _1449;
    bool _1465 = !_1445;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1473 = _1441 + _1471;
        float _1475 = rsqrt(_1437);
        float _1477 = _1473 * _1469;
        float _1479 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1481 = _1477 * 0.15915493667125701904296875;
        float _1483 = _1481 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1481 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = fma(_1485, _1479, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1493 = _1475 * _1491;
        float _1495 = _1489 + (-1.0);
        float _1497 = fma(_1425, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1499 = fma(_1417, _1493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1501 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1503 = fma(_1443, _1489, _1501);
        _1451 = _1497;
        _1467 = _1503;
        _1461 = _1499;
    }
    float _1505 = _1451;
    float _1507 = _1467;
    float _1509 = _1461;
    float _1511 = _1507;
    float _1513 = _1505;
    float _1515 = _1509;
    if (!_1265)
    {
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1519 = _1435 + _1517;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1523 = _1401 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = -_1401;
        float _1529 = _1527 + _1505;
        float _1531 = _1519 * _1519;
        float _1533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1535 = _1391 + _1533;
        float _1537 = -_1435;
        float _1539 = _1537 + _1507;
        float _1541 = -_1391;
        float _1543 = _1541 + _1509;
        float _1545 = fma(_1523, _1523, _1531);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1549 = fma(_1535, _1535, _1545);
        float _1551 = sqrt(_1549);
        float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1555 = precise::min(_1551, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1557 = _1555 * _1547;
        float _1559 = _1553 * _1557;
        float _1561 = fma(_1529, _1559, _1401);
        float _1563 = fma(_1539, _1559, _1435);
        float _1565 = fma(_1543, _1559, _1391);
        _1511 = _1563;
        _1513 = _1561;
        _1515 = _1565;
        _1453 = _1525;
    }
    float _1567 = _1511;
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1453;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1577 = _1567 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1581 = _1569 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1585 = _1571 + _1583;
    float _1587 = _1577 * _1577;
    float _1589 = fma(_1581, _1581, _1587);
    float _1591 = fma(_1585, _1585, _1589);
    float _1593 = rsqrt(_1591);
    float _1595 = sqrt(_1591);
    float _1597 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1599 = _1581 * _1597;
    float _1601 = _1585 * _1597;
    float _1603 = _1599 * _1599;
    float _1605 = _1601 * _1601;
    float _1607 = _1603 + _1605;
    float _1609 = sqrt(_1607);
    bool _1611 = _1609 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1615 = _1609 + _1613;
    float _1617 = _1573;
    float _1619 = _1615;
    float _1621 = _1597;
    if (_1611)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1617 = _1623;
    }
    float _1625 = _1617;
    if (_1611)
    {
        float _1627 = rsqrt(_1607);
        _1455 = _1627;
    }
    float _1629 = _1455;
    float _1631 = _1629;
    if (_1611)
    {
        float _1633 = _1615 * _1625;
        _1619 = _1633;
    }
    float _1635 = _1619;
    float _1637 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1611)
    {
        float _1639 = _1635 * 0.15915493667125701904296875;
        _1457 = _1639;
    }
    float _1641 = _1457;
    float _1643 = _1443;
    if (_1611)
    {
        float _1645 = _1641 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        _1643 = _1647;
    }
    float _1649 = _1643;
    float _1651 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1653 = precise::max(0.0, _1651);
    float _1655 = _1353;
    float _1657 = _1651;
    float _1659 = _1653;
    if (_1611)
    {
        float _1661 = _1641 * 6.283185482025146484375;
        float _1663 = cos(_1661);
        _1655 = _1663;
    }
    float _1665 = _1655;
    if (!_1611)
    {
        _1657 = _1599;
    }
    float _1667 = _1657;
    float _1669 = -_1597;
    float _1671 = -_1653;
    float _1673 = fma(_1577, _1669, _1671);
    float _1675 = _1667;
    if (_1611)
    {
        float _1677 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1679;
    float _1683 = _1649;
    if (_1611)
    {
        float _1685 = fma(_1649, _1679, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1681 = _1685;
    }
    float _1687 = _1681;
    float _1689 = _1687;
    float _1691 = _1665;
    if (_1611)
    {
        float _1693 = _1665 + (-1.0);
        _1683 = _1693;
    }
    float _1695 = _1683;
    float _1697 = _1695;
    if (_1611)
    {
        float _1699 = _1629 * _1687;
        _1621 = _1699;
    }
    float _1701 = _1621;
    if (!_1611)
    {
        _1689 = _1673;
    }
    float _1703 = _1689;
    float _1705 = _1703;
    if (_1611)
    {
        float _1707 = _1695 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1631 = _1707;
    }
    float _1709 = _1631;
    float _1711 = _1709;
    if (_1611)
    {
        float _1713 = _1599 * _1701;
        _1675 = _1713;
    }
    float _1715 = _1675;
    if (!_1611)
    {
        _1697 = _1601;
    }
    float _1717 = _1697;
    float _1719 = _1717;
    if (_1611)
    {
        float _1721 = _1601 * _1701;
        _1719 = _1721;
    }
    float _1723 = _1719;
    if (_1611)
    {
        float _1725 = fma(_1673, _1665, _1709);
        _1705 = _1725;
    }
    float _1727 = _1705;
    if (!_1611)
    {
        _1711 = _1603;
    }
    float _1729 = _1711;
    float _1731 = _1729;
    if (_1611)
    {
        float _1733 = _1715 * _1715;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1611)
    {
        _1691 = _1605;
    }
    float _1739 = _1691;
    float _1741 = _1739;
    if (_1611)
    {
        float _1743 = _1723 * _1723;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1727, _1727, _1735);
    float _1749 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1751 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1753 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1737);
    float _1755 = _1747 + _1745;
    float _1757 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1749);
    float _1759 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1637);
    float _1761 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1751);
    float _1763 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1753);
    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1767 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1765);
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = rsqrt(_1755);
    float _1773 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1759);
    float _1775 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1757);
    float _1777 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1769;
    float _1781 = _1779 + 1.0;
    float _1783 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1785 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1787 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1789 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1791 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1793 = abs(_1781);
    float _1795 = log2(_1793);
    float _1797 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1787);
    float _1799 = _1789 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1803 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1805 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1807 = _1771 * _1715;
    float _1809 = _1771 * _1723;
    float _1811 = -_1801;
    float _1813 = fma(_1811, _1791, 1.0);
    float _1815 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1771 * _1727;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = 1.0 / _1815;
    float _1823 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1803);
    float _1825 = -_1819;
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1825);
    float _1829 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1831 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1823);
    float _1833 = -_1809;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1827);
    float _1837 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = log2(_1813);
    float _1841 = _1817 + 1.0;
    float _1843 = fma(_1835, -0.5, 0.5);
    float _1845 = fma(_1835, 0.5, 0.5);
    float _1847 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1849 = fma(_1845, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1851 = exp2(_1829);
    float _1853 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1847);
    float _1855 = fma(_1845, _1849, -0.212114393711090087890625);
    float _1857 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1853);
    float _1859 = fma(_1845, _1855, 1.570728778839111328125);
    float _1861 = sqrt(_1843);
    float _1863 = _1839 * 0.693147182464599609375;
    float _1865 = _1857 * _1821;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = fma(_1865, 0.5, 0.5);
    float _1871 = -_1817;
    float _1873 = fma(_1851, _1841, _1871);
    float _1875 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1831);
    float _1877 = _1875 * _1821;
    float _1879 = _1861 * 0.636619746685028076171875;
    float _1881 = fma(_1877, -0.5, 0.5);
    float _1883 = fma(_1873, 0.5, 0.5);
    float _1885 = -_1859;
    float _1887 = fma(_1879, _1885, 1.0);
    float3 _5314 = float3(_1869, _1881, _1867);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5314, float3(0.0), isnan(_5314)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5314, float3(0.0), isnan(_5314)), level(0.0)).x;
    float3 _5325 = float3(_1869, _1881, _1867);
    float4 _1892 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).xyzw;
    float _1894 = _1892.x;
    float _1896 = _1892.y;
    float _1898 = _1892.z;
    float _1900 = _1892.w;
    float2 _5342 = float2(_1887, _1883);
    float3 _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5342, float2(0.0), isnan(_5342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5342, float2(0.0), isnan(_5342)), level(0.0)).xyz;
    float _1906 = _1904.x;
    float _1908 = _1904.y;
    float _1910 = _1904.z;
    float _1912 = in.m_54.y;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1916 = _1233 + _1914;
    bool _1918 = _797 > 0.5;
    float _1920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1922 = _1920 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1924;
    float _1928 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1930 = 1.0 / _1922;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1936 = _1934 != 0;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1942 = _1940 != 0;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1205 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1795 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1958 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1960 = _1912 > 0.5;
    out.m_56.x = _1946;
    out.m_56.y = _1948;
    out.m_56.z = _1952;
    float _1962 = _1926 * _1930;
    bool _1964 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1966 = isnan(_1233);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = exp2(_1956);
    float _1978 = -_203;
    int _1980 = _1960 ? as_type<int>(_1978) : as_type<int>(_203);
    float _1982 = fma(_1962, _1916, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1984 = _1233 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1986 = isnan(_1233);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    float _1996 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1958);
    bool _1998 = !_1942;
    float _2000 = _1998 ? _203 : as_type<float>(_1980);
    float _2002 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2004 = -_1994;
    float _2006 = _2004 + 1.0;
    float _2008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2010 = _1271 * _2002;
    float _2012 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2014 = _1974 * _2006;
    float _2016 = -_1974;
    float _2018 = _2016 + 1.0;
    float _2020 = _1273 * _2002;
    float _2022 = _1269 * _2002;
    float _2024 = _1982 * _2014;
    float _2026 = -_199;
    int _2028 = _1918 ? as_type<int>(_2026) : as_type<int>(_199);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2032 = -_2000;
    float _2034 = _2032 + 0.5;
    float _2036 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2024);
    bool _2038 = !_1936;
    float _2040 = _2038 ? _199 : as_type<float>(_2028);
    float _2042 = fma(_1375, _2012, _2010);
    float _2044 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2046 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2036);
    float _2048 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2040 + 0.5;
    float _2052 = _1397 + _2042;
    float _2054 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2060 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2068 = _2064 || _2066;
    float _2070 = fma(_1371, _2012, _2020);
    float _2072 = fma(_1373, _2012, _2022);
    float _2074 = _2058 * _2008;
    float _2076 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2078 = _2044 * _2030;
    float _2080 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2082 = _1433 + _2070;
    float _2084 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2076);
    float _2086 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _2074;
    out.m_58.y = _2078;
    float _2088 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2080);
    float _2090 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2084);
    float _2092 = _1389 + _2072;
    out.m_60.x = _2048;
    out.m_60.y = _2054;
    out.m_60.z = _2086;
    out.m_60.w = _2056;
    float _2094 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2088);
    float _2096 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2098 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    out.m_62.x = _2052;
    out.m_62.y = _2082;
    out.m_62.z = _2092;
    float _2100 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2102 = 1.0 / _2096;
    float _2104 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2098);
    float _2106 = _2100 + _2096;
    float _2108 = _2052;
    if (_2068)
    {
        _2108 = 1.0;
    }
    float _2110 = _2108;
    float _2112 = _2106 * _2102;
    float _2114 = _2112 * 0.5;
    float _2116 = _2110;
    if (!_2068)
    {
        float _2118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2120 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2122 = _2118 * 0.15915493667125701904296875;
        float _2124 = _2120 * 0.15915493667125701904296875;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2128 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2126);
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2122 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = 1.0 / _2132;
        float _2140 = _2124 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = _2136 * _2138;
        float _2146 = _2124 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = 1.0 / _2128;
        float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2156 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2154;
        float _2158 = 1.0 / _2150;
        float _2160 = 1.0 / _2156;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2164 = _2152 * _2162;
        float _2166 = _2148 * _2158;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2166, _2164, _2168);
        float _2172 = _2170 * _2160;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2116 = _2174;
    }
    float _2176 = _2116;
    float _2178 = _2104 + _1815;
    float _2180 = -_1976;
    float _2182 = _2180 + 1.0;
    bool _2184 = _2176 > 0.0;
    bool _2186 = isnan(_2176);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.0);
    bool _2192 = _2188 || _2190;
    float _2194 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2196 = _2178 * 0.5;
    float _2198 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1581;
    out.m_64.y = _1577;
    out.m_64.z = _1585;
    float _2200 = _2194 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2202 = _2198 * _1889;
    float _2204 = -_2198;
    float _2206 = _2204 + 1.0;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1875;
    out.gl_Position.z = _2104;
    out.gl_Position.w = _1815;
    float _2208 = _1900 * _2202;
    float _2210 = _1910 * _2202;
    out.m_66.z = _2196;
    out.m_66.w = _1815;
    float _2212 = fma(_1906, _2208, _1894);
    float _2214 = fma(_1908, _2208, _1896);
    float _2216 = _1900 * _2206;
    float _2218 = fma(_1900, _2210, _1898);
    out.m_45.x = _2200;
    out.m_68.x = _2212;
    out.m_68.y = _2214;
    out.m_68.z = _2218;
    out.m_68.w = _2216;
    if (_2192)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2220;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

