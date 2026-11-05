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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1087 = false;
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2205 = as_type<float>(_103);
        out.gl_Position.z = _2205;
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
        out.m_45.x = 0.0;
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
        float _2274 = as_type<float>(_139);
        out.gl_Position.z = _2274;
    }
    if (_131)
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
        _209 = _223;
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
    float _293 = _289;
    if (!_159)
    {
        float _295 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _295;
    }
    float _297 = _277;
    bool _299 = !_159;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _121 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _121);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _279 = _319;
    }
    float _333 = _301;
    float _335 = _279;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_159)
    {
        _339 = _121;
    }
    float _341 = _339;
    bool _343 = !_159;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _121 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _147, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = sqrt(_195);
    float _377 = fma(_367, _145, _369);
    float _379 = -_371;
    float _381 = _289 + _379;
    float _383 = fma(_367, _149, _373);
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = _381 * _381;
    float _391 = -_383;
    float _393 = _291 + _391;
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _397 = fma(_387, _387, _389);
    float _399 = sqrt(_167);
    float _401 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _395);
    float _403 = fma(_393, _393, _397);
    float _405 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _407 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _409 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _401);
    float _411 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].y, _405);
    float _415 = sqrt(_403);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _419 = in.m_52.w;
    float _421 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].x, _407);
    float _423 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _425 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].z, _411);
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].w, _417);
    float _435 = sqrt(_409);
    float _437 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _439 = _375 * _423;
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _443 = _399 * _437;
    float _445 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _447 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_415);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _459 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _469 = _435 * _457;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _465);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _477 = fma(_291, _419, _431);
    float _479 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _485 = fma(_289, _419, _429);
    float _487 = fma(_287, _419, _427);
    float _489 = _479;
    float _491 = _481;
    if (_455)
    {
        _293 = _479;
    }
    float _493 = _293;
    float _495 = _493;
    if (_455)
    {
        _489 = _483;
    }
    float _497 = _489;
    float _499 = _497;
    if (!_455)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _515);
            float _523 = _375 * _517;
            float _525 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _527 = _399 * _519;
            float _529 = _435 * _521;
            float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _525);
            float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _531);
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _533);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
            float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _491 = _571;
            _495 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _147 * _147;
            float _579 = fma(_145, _145, _577);
            float _581 = fma(_149, _149, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _429 * _429;
                float _597 = fma(_427, _427, _595);
                float _599 = fma(_431, _431, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _399 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _491 = _655;
                    _495 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _375 * _675;
                    float _685 = _399 * _677;
                    float _687 = _435 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _491 = _725;
                    _495 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _375 * _745;
                float _755 = _399 * _747;
                float _757 = _435 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _491 = _795;
                _495 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _491;
    float _801 = _495;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_87);
        float _831 = 1.0 / _829;
        float _833 = _121 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _893 * _899;
    float _905 = 1.0 / _871;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _907;
    float _911 = -_893;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_917, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _905;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_909, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _939 * _903;
    float _945 = _941 * _903;
    float _947 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _945);
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _943);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_901;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_87);
        float _987 = 1.0 / _985;
        float _989 = _121 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _995 = _991 + _993;
    bool _997 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _999 = isnan(_991);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1013 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1015 = isnan(_991);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    bool _1033 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1035 = 1.0 / _1011;
    float _1037 = _1023 * _1031;
    float _1039 = -_1023;
    float _1041 = _1039 + 1.0;
    float _1043 = _1027 * _1035;
    float _1045 = fma(_1043, _995, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1049 = _1045 * _1037;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1049);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1055);
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1059;
    out.m_56.y = _1053;
    out.m_56.z = _1063;
    out.m_56.w = _1065;
    bool _1067 = !_1033;
    float _1085;
    if (!_1067)
    {
        float _1069 = in.m_54.x;
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1073 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1077 = _1075 * _1071;
        float _1079 = floor(_1077);
        float _1081 = -_1079;
        float _1083 = _1077 + _1081;
        _1085 = _1083;
        _1087 = true;
    }
    else
    {
        float _1089 = float(_87);
        float _1091 = 1.0 / _1089;
        float _1093 = _121 * _1091;
        _1085 = _1093;
    }
    _1087 = false;
    float _1095 = _1085;
    float _1097 = _799 * _799;
    float _1099 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1101 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1105 = fma(_801, _801, _1097);
    float _1107 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1109 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_803, _803, _1105);
    float _1121 = rsqrt(_1119);
    float _1123 = _1121 * _803;
    float _1125 = _1121 * _801;
    float _1127 = _1121 * _799;
    float _1129 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1133 = _1123 * _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1137 = _1125 * _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1141 = _1127 * _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = -_1133;
    float _1147 = fma(_1125, _1143, _1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1151 = -_1137;
    float _1153 = fma(_1127, _1149, _1151);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = -_1141;
    float _1159 = fma(_1123, _1155, _1157);
    float _1161 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1099);
    float _1163 = _1147 * _1147;
    float _1165 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1167 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1169 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1161);
    float _1171 = fma(_1159, _1159, _1163);
    float _1173 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1129);
    float _1175 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1165);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1179 = fma(_1153, _1153, _1171);
    float _1181 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1173);
    float _1183 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1175);
    float _1185 = _375 * _1177;
    float _1187 = rsqrt(_1179);
    float _1189 = _1181 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1191 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1167);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1197 = _399 * _1189;
    float _1199 = _1101 * _1103;
    float _1201 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1205 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1191);
    float _1207 = _435 * _1193;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1195);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1213 = _1107 * _1203;
    float _1215 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1219 = _1147 * _1187;
    float _1221 = _1159 * _1187;
    float _1223 = _1153 * _1187;
    float _1225 = _1199 * _1123;
    float _1227 = _1125 * _1219;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1199 * _1125;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1217);
    float _1237 = fma(_1213, _1223, _1225);
    float _1239 = _1127 * _1223;
    float _1241 = -_1227;
    float _1243 = fma(_1127, _1221, _1241);
    float _1245 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1229);
    float _1247 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1249 = fma(_1213, _1221, _1233);
    float _1251 = -_1239;
    float _1253 = fma(_1123, _1219, _1251);
    float _1255 = fma(_1231, _1243, _1237);
    float _1257 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1261 = fma(_1231, _1253, _1249);
    float _1263 = _1247 + _1255;
    float _1265 = _1199 * _1127;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1259);
    float _1269 = _1257 + _1261;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1263 + _1271;
    float _1275 = _1123 * _1221;
    float _1277 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1269 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1213, _1219, _1265);
    float _1287 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1277);
    float _1289 = -_1275;
    float _1291 = fma(_1125, _1223, _1289);
    float _1293 = fma(_1281, _1281, _1283);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1297 = fma(_1231, _1291, _1285);
    float _1299 = sqrt(_1293);
    float _1301 = _1295 + _1297;
    bool _1303 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1215;
    float _1307 = _1287;
    float _1309 = _1265;
    float _1311 = _1281;
    float _1313 = _1273;
    float _1315 = _1293;
    float _1317 = _1263;
    if (!_1303)
    {
        _1305 = _1269;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    if (!_1303)
    {
        _1307 = _1263;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (!_1303)
    {
        _1309 = _1301;
    }
    float _1327 = _1309;
    bool _1329 = !_1303;
    float _1331 = _1327;
    if (!_1329)
    {
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1337 = _1299 + _1335;
        float _1339 = rsqrt(_1293);
        float _1341 = _1337 * _1333;
        float _1343 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = _1341 * 0.15915493667125701904296875;
        float _1347 = _1345 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = fma(_1349, _1343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = _1339 * _1355;
        float _1359 = _1353 + (-1.0);
        float _1361 = fma(_1281, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1273, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1365 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = fma(_1301, _1353, _1365);
        _1321 = _1361;
        _1325 = _1363;
        _1331 = _1367;
    }
    float _1369 = _1321;
    float _1371 = _1325;
    float _1373 = _1331;
    float _1375 = _1373;
    float _1377 = _1369;
    float _1379 = _1371;
    if (!_1117)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1295 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1257 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1247 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1257;
        float _1413 = _1411 + _1369;
        float _1415 = -_1247;
        float _1417 = _1415 + _1371;
        float _1419 = _1405 * _1409;
        float _1421 = -_1295;
        float _1423 = _1421 + _1373;
        float _1425 = fma(_1413, _1419, _1257);
        float _1427 = fma(_1423, _1419, _1295);
        float _1429 = fma(_1417, _1419, _1247);
        _1375 = _1427;
        _1377 = _1425;
        _1379 = _1429;
        _1311 = _1417;
    }
    float _1431 = _1375;
    float _1433 = _1377;
    float _1435 = _1379;
    float _1437 = _1311;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1441 = _1431 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1433 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    float _1451 = _1441 * _1441;
    float _1453 = fma(_1445, _1445, _1451);
    float _1455 = fma(_1449, _1449, _1453);
    float _1457 = rsqrt(_1455);
    float _1459 = sqrt(_1455);
    float _1461 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1445 * _1461;
    float _1465 = _1449 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1437;
    float _1483 = _1479;
    if (_1475)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1485;
    }
    float _1487 = _1481;
    if (_1475)
    {
        float _1489 = rsqrt(_1471);
        _1313 = _1489;
    }
    float _1491 = _1313;
    float _1493 = _1491;
    if (_1475)
    {
        float _1495 = _1479 * _1487;
        _1483 = _1495;
    }
    float _1497 = _1483;
    if (_1475)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1315 = _1499;
    }
    float _1501 = _1315;
    float _1503 = _1301;
    if (_1475)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1207;
    float _1517 = _1511;
    float _1519 = _1513;
    if (_1475)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    if (!_1475)
    {
        _1517 = _1463;
    }
    float _1527 = _1517;
    float _1529 = -_1461;
    float _1531 = -_1513;
    float _1533 = fma(_1441, _1529, _1531);
    float _1535 = _1527;
    if (_1475)
    {
        float _1537 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1537;
    }
    float _1539 = _1519;
    float _1541 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1543 = _1509;
    float _1545 = _1539;
    if (_1475)
    {
        float _1547 = fma(_1509, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1547;
    }
    float _1549 = _1317;
    float _1551 = _1549;
    if (!_1475)
    {
        _1543 = _1533;
    }
    float _1553 = _1543;
    float _1555 = _1553;
    float _1557 = _1525;
    if (_1475)
    {
        float _1559 = _1525 + (-1.0);
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1475)
    {
        float _1565 = _1491 * _1549;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1475)
    {
        float _1569 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1569;
    }
    float _1571 = _1493;
    float _1573 = _1571;
    if (_1475)
    {
        float _1575 = _1463 * _1567;
        _1535 = _1575;
    }
    float _1577 = _1535;
    if (!_1475)
    {
        _1563 = _1465;
    }
    float _1579 = _1563;
    float _1581 = _1579;
    if (_1475)
    {
        float _1583 = _1465 * _1567;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1475)
    {
        float _1587 = fma(_1533, _1525, _1571);
        _1555 = _1587;
    }
    float _1589 = _1555;
    if (!_1475)
    {
        _1557 = _1467;
    }
    float _1591 = _1557;
    float _1593 = _1591;
    if (_1475)
    {
        float _1595 = _1577 * _1577;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (!_1475)
    {
        _1573 = _1469;
    }
    float _1599 = _1573;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1599;
    if (_1475)
    {
        float _1607 = _1585 * _1585;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1589, _1589, _1597);
    float _1613 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1615 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1541);
    float _1617 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1621 = _1611 + _1609;
    float _1623 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1613);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1633 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1617);
    float _1635 = rsqrt(_1621);
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1615);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1623);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1649);
    float _1661 = abs(_1653);
    float _1663 = log2(_1661);
    float _1665 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1659);
    float _1667 = _1635 * _1577;
    float _1669 = _1635 * _1589;
    float _1671 = _1635 * _1585;
    float _1673 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = -_1657;
    float _1679 = fma(_1677, _1631, 1.0);
    float _1681 = 1.0 / _1673;
    float _1683 = -_1675;
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1689 = -_1671;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1693 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = log2(_1679);
    float _1699 = fma(_1691, -0.5, 0.5);
    float _1701 = fma(_1691, 0.5, 0.5);
    float _1703 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1705 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1687);
    float _1707 = _1669 + 1.0;
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1703);
    float _1713 = exp2(_1695);
    float _1715 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1705);
    float _1717 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1719 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1721 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1715);
    float _1723 = fma(_1701, _1717, 1.570728778839111328125);
    float _1725 = _1719 * _1681;
    float _1727 = sqrt(_1699);
    float _1729 = _1697 * 0.693147182464599609375;
    float _1731 = _1721 * _1681;
    float _1733 = fma(_1725, 0.5, 0.5);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = fma(_1731, -0.5, 0.5);
    float _1739 = -_1669;
    float _1741 = fma(_1713, _1707, _1739);
    float _1743 = fma(_1741, 0.5, 0.5);
    float _1745 = _1727 * 0.636619746685028076171875;
    float _1747 = -_1723;
    float _1749 = fma(_1745, _1747, 1.0);
    float3 _5049 = float3(_1733, _1737, _1735);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5049, float3(0.0), isnan(_5049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5049, float3(0.0), isnan(_5049)), level(0.0)).x;
    float3 _5060 = float3(_1733, _1737, _1735);
    float4 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = _1754.w;
    float2 _5077 = float2(_1749, _1743);
    float3 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5077, float2(0.0), isnan(_5077)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5077, float2(0.0), isnan(_5077)), level(0.0)).xyz;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = in.m_54.x;
    float _1776 = in.m_54.y;
    float _1778 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1790 = exp2(_1778);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1792;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1798 = _1796 != 0;
    float _1800 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    bool _1806 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1808 = isnan(_1095);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = 1.0 / _1784;
    float _1820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1800);
    bool _1822 = _1774 > 0.5;
    float _1824 = 1.0 / _1788;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1828 = _1095 + _1826;
    bool _1830 = _1776 > 0.5;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1834 = _1095 + _1832;
    float _1836 = _1828 * _1818;
    bool _1838 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1840 = isnan(_1095);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1850;
    float _1854 = fma(_1794, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1858 = _1856 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1860 = -_1848;
    float _1862 = _1860 + 1.0;
    float _1864 = fma(_1852, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1866 = _1834 * _1824;
    bool _1868 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1870 = isnan(_1095);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1880;
    float _1884 = -_203;
    int _1886 = _1830 ? as_type<int>(_1884) : as_type<int>(_203);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1892 = fma(_1858, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1894 = fma(_1882, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1896 = _1878 * _1862;
    float _1898 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1908 = !_1804;
    float _1910 = _1908 ? _203 : as_type<float>(_1886);
    float _1912 = _1125 * _1898;
    float _1914 = _1123 * _1898;
    float _1916 = _1816 * _1902;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = -_1816;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1910;
    float _1926 = _1924 + 0.5;
    float _1928 = _1894 * _1916;
    float _1930 = _1864 * _1916;
    float _1932 = _1854 * _1916;
    float _1934 = -_199;
    int _1936 = _1822 ? as_type<int>(_1934) : as_type<int>(_199);
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1930);
    float _1942 = fma(_1890, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1944 = fma(_1906, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1932);
    bool _1950 = !_1798;
    float _1952 = _1950 ? _199 : as_type<float>(_1936);
    float _1954 = _1127 * _1898;
    float _1956 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1958 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1960 = fma(_1942, _1896, _1938);
    float _1962 = fma(_1944, _1896, _1940);
    float _1964 = fma(_1892, _1896, _1948);
    float _1966 = fma(_1219, _1956, _1954);
    float _1968 = _1958 * _1918;
    float _1970 = _1952 + 0.5;
    float _1972 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1960);
    float _1974 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1962);
    float _1976 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1964);
    float _1978 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1980 = fma(_1221, _1956, _1912);
    float _1982 = fma(_1223, _1956, _1914);
    float _1984 = _1291 + _1966;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1990 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1994 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1978);
    float _1996 = _1986 * _1946;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1994);
    float _2006 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.x = _1996;
    out.m_58.y = _1968;
    bool _2008 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2016 = _2012 || _2014;
    float _2018 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2020 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2006);
    out.m_60.x = _1998;
    out.m_60.y = _2000;
    out.m_60.z = _2002;
    float _2022 = _1253 + _1980;
    float _2024 = 1.0 / _2018;
    float _2026 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1243 + _1982;
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_62.x = _2022;
    out.m_62.y = _1984;
    out.m_62.z = _2028;
    float _2032 = _2030 + _2018;
    float _2034 = _2032 * _2024;
    float _2036 = _2034 * 0.5;
    float _2038 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2040 = _2022;
    if (_2016)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = _2042;
    if (!_2016)
    {
        float _2046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2050 = _2046 * 0.15915493667125701904296875;
        float _2052 = _2048 * 0.15915493667125701904296875;
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2054);
        float _2058 = _2050 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2050 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2060;
        float _2068 = _2052 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2052 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2056;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2078;
        float _2088 = 1.0 / _2084;
        float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2092 = _2080 * _2090;
        float _2094 = _2076 * _2086;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = fma(_2094, _2092, _2096);
        float _2100 = _2098 * _2088;
        float _2102 = precise::clamp(_2100, 0.0, 1.0);
        _2044 = _2102;
    }
    float _2104 = _2044;
    float _2106 = _2038 + _1673;
    float _2108 = -_1790;
    float _2110 = _2108 + 1.0;
    bool _2112 = _2104 > 0.0;
    bool _2114 = isnan(_2104);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2124 = _2106 * 0.5;
    float _2126 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1445;
    out.m_64.y = _1441;
    out.m_64.z = _1449;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2130 = _2126 * _1751;
    float _2132 = -_2126;
    float _2134 = _2132 + 1.0;
    out.gl_Position.x = _1719;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1673;
    float _2136 = _1762 * _2130;
    float _2138 = _1772 * _2130;
    float _2140 = _1762 * _2134;
    out.m_66.z = _2124;
    out.m_66.w = _1673;
    float _2142 = fma(_1768, _2136, _1756);
    float _2144 = fma(_1770, _2136, _1758);
    float _2146 = fma(_1762, _2138, _1760);
    out.m_45.x = _2128;
    out.m_68.x = _2142;
    out.m_68.y = _2144;
    out.m_68.z = _2146;
    out.m_68.w = _2140;
    if (_2120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2148;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1087 = false;
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2205 = as_type<float>(_103);
        out.gl_Position.z = _2205;
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
        out.m_45.x = 0.0;
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
        float _2274 = as_type<float>(_139);
        out.gl_Position.z = _2274;
    }
    if (_131)
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
        _209 = _223;
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
    float _293 = _289;
    if (!_159)
    {
        float _295 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _295;
    }
    float _297 = _277;
    bool _299 = !_159;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _121 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _121);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _279 = _319;
    }
    float _333 = _301;
    float _335 = _279;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_159)
    {
        _339 = _121;
    }
    float _341 = _339;
    bool _343 = !_159;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _121 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _147, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = sqrt(_195);
    float _377 = fma(_367, _145, _369);
    float _379 = -_371;
    float _381 = _289 + _379;
    float _383 = fma(_367, _149, _373);
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = _381 * _381;
    float _391 = -_383;
    float _393 = _291 + _391;
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _397 = fma(_387, _387, _389);
    float _399 = sqrt(_167);
    float _401 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _395);
    float _403 = fma(_393, _393, _397);
    float _405 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _407 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _409 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _401);
    float _411 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].y, _405);
    float _415 = sqrt(_403);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _419 = in.m_52.w;
    float _421 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].x, _407);
    float _423 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _425 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].z, _411);
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].w, _417);
    float _435 = sqrt(_409);
    float _437 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _439 = _375 * _423;
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _443 = _399 * _437;
    float _445 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _447 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_415);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _459 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _469 = _435 * _457;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _465);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _477 = fma(_291, _419, _431);
    float _479 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _485 = fma(_289, _419, _429);
    float _487 = fma(_287, _419, _427);
    float _489 = _479;
    float _491 = _481;
    if (_455)
    {
        _293 = _479;
    }
    float _493 = _293;
    float _495 = _493;
    if (_455)
    {
        _489 = _483;
    }
    float _497 = _489;
    float _499 = _497;
    if (!_455)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _515);
            float _523 = _375 * _517;
            float _525 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _527 = _399 * _519;
            float _529 = _435 * _521;
            float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _525);
            float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _531);
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _533);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
            float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _491 = _571;
            _495 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _147 * _147;
            float _579 = fma(_145, _145, _577);
            float _581 = fma(_149, _149, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _429 * _429;
                float _597 = fma(_427, _427, _595);
                float _599 = fma(_431, _431, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _399 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _491 = _655;
                    _495 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _375 * _675;
                    float _685 = _399 * _677;
                    float _687 = _435 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _491 = _725;
                    _495 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _375 * _745;
                float _755 = _399 * _747;
                float _757 = _435 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _491 = _795;
                _495 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _491;
    float _801 = _495;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_87);
        float _831 = 1.0 / _829;
        float _833 = _121 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _893 * _899;
    float _905 = 1.0 / _871;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _907;
    float _911 = -_893;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_917, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _905;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_909, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _939 * _903;
    float _945 = _941 * _903;
    float _947 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _945);
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _943);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_901;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_87);
        float _987 = 1.0 / _985;
        float _989 = _121 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _995 = _991 + _993;
    bool _997 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _999 = isnan(_991);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1013 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1015 = isnan(_991);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    bool _1033 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1035 = 1.0 / _1011;
    float _1037 = _1023 * _1031;
    float _1039 = -_1023;
    float _1041 = _1039 + 1.0;
    float _1043 = _1027 * _1035;
    float _1045 = fma(_1043, _995, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1049 = _1045 * _1037;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1049);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1055);
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1059;
    out.m_56.y = _1053;
    out.m_56.z = _1063;
    out.m_56.w = _1065;
    bool _1067 = !_1033;
    float _1085;
    if (!_1067)
    {
        float _1069 = in.m_54.x;
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1073 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1077 = _1075 * _1071;
        float _1079 = floor(_1077);
        float _1081 = -_1079;
        float _1083 = _1077 + _1081;
        _1085 = _1083;
        _1087 = true;
    }
    else
    {
        float _1089 = float(_87);
        float _1091 = 1.0 / _1089;
        float _1093 = _121 * _1091;
        _1085 = _1093;
    }
    _1087 = false;
    float _1095 = _1085;
    float _1097 = _799 * _799;
    float _1099 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1101 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1105 = fma(_801, _801, _1097);
    float _1107 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1109 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_803, _803, _1105);
    float _1121 = rsqrt(_1119);
    float _1123 = _1121 * _803;
    float _1125 = _1121 * _801;
    float _1127 = _1121 * _799;
    float _1129 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1133 = _1123 * _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1137 = _1125 * _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1141 = _1127 * _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = -_1133;
    float _1147 = fma(_1125, _1143, _1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1151 = -_1137;
    float _1153 = fma(_1127, _1149, _1151);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = -_1141;
    float _1159 = fma(_1123, _1155, _1157);
    float _1161 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1099);
    float _1163 = _1147 * _1147;
    float _1165 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1167 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1169 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1161);
    float _1171 = fma(_1159, _1159, _1163);
    float _1173 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1129);
    float _1175 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1165);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1179 = fma(_1153, _1153, _1171);
    float _1181 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1173);
    float _1183 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1175);
    float _1185 = _375 * _1177;
    float _1187 = rsqrt(_1179);
    float _1189 = _1181 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1191 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1167);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1197 = _399 * _1189;
    float _1199 = _1101 * _1103;
    float _1201 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1205 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1191);
    float _1207 = _435 * _1193;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1195);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1213 = _1107 * _1203;
    float _1215 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1219 = _1147 * _1187;
    float _1221 = _1159 * _1187;
    float _1223 = _1153 * _1187;
    float _1225 = _1199 * _1123;
    float _1227 = _1125 * _1219;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1199 * _1125;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1217);
    float _1237 = fma(_1213, _1223, _1225);
    float _1239 = _1127 * _1223;
    float _1241 = -_1227;
    float _1243 = fma(_1127, _1221, _1241);
    float _1245 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1229);
    float _1247 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1249 = fma(_1213, _1221, _1233);
    float _1251 = -_1239;
    float _1253 = fma(_1123, _1219, _1251);
    float _1255 = fma(_1231, _1243, _1237);
    float _1257 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1261 = fma(_1231, _1253, _1249);
    float _1263 = _1247 + _1255;
    float _1265 = _1199 * _1127;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1259);
    float _1269 = _1257 + _1261;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1263 + _1271;
    float _1275 = _1123 * _1221;
    float _1277 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1269 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1213, _1219, _1265);
    float _1287 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1277);
    float _1289 = -_1275;
    float _1291 = fma(_1125, _1223, _1289);
    float _1293 = fma(_1281, _1281, _1283);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1297 = fma(_1231, _1291, _1285);
    float _1299 = sqrt(_1293);
    float _1301 = _1295 + _1297;
    bool _1303 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1215;
    float _1307 = _1287;
    float _1309 = _1265;
    float _1311 = _1281;
    float _1313 = _1273;
    float _1315 = _1293;
    float _1317 = _1263;
    if (!_1303)
    {
        _1305 = _1269;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    if (!_1303)
    {
        _1307 = _1263;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (!_1303)
    {
        _1309 = _1301;
    }
    float _1327 = _1309;
    bool _1329 = !_1303;
    float _1331 = _1327;
    if (!_1329)
    {
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1337 = _1299 + _1335;
        float _1339 = rsqrt(_1293);
        float _1341 = _1337 * _1333;
        float _1343 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = _1341 * 0.15915493667125701904296875;
        float _1347 = _1345 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = fma(_1349, _1343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = _1339 * _1355;
        float _1359 = _1353 + (-1.0);
        float _1361 = fma(_1281, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1273, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1365 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = fma(_1301, _1353, _1365);
        _1321 = _1361;
        _1325 = _1363;
        _1331 = _1367;
    }
    float _1369 = _1321;
    float _1371 = _1325;
    float _1373 = _1331;
    float _1375 = _1373;
    float _1377 = _1369;
    float _1379 = _1371;
    if (!_1117)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1295 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1257 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1247 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1257;
        float _1413 = _1411 + _1369;
        float _1415 = -_1247;
        float _1417 = _1415 + _1371;
        float _1419 = _1405 * _1409;
        float _1421 = -_1295;
        float _1423 = _1421 + _1373;
        float _1425 = fma(_1413, _1419, _1257);
        float _1427 = fma(_1423, _1419, _1295);
        float _1429 = fma(_1417, _1419, _1247);
        _1375 = _1427;
        _1377 = _1425;
        _1379 = _1429;
        _1311 = _1417;
    }
    float _1431 = _1375;
    float _1433 = _1377;
    float _1435 = _1379;
    float _1437 = _1311;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1441 = _1431 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1433 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    float _1451 = _1441 * _1441;
    float _1453 = fma(_1445, _1445, _1451);
    float _1455 = fma(_1449, _1449, _1453);
    float _1457 = rsqrt(_1455);
    float _1459 = sqrt(_1455);
    float _1461 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1445 * _1461;
    float _1465 = _1449 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1437;
    float _1483 = _1479;
    if (_1475)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1485;
    }
    float _1487 = _1481;
    if (_1475)
    {
        float _1489 = rsqrt(_1471);
        _1313 = _1489;
    }
    float _1491 = _1313;
    float _1493 = _1491;
    if (_1475)
    {
        float _1495 = _1479 * _1487;
        _1483 = _1495;
    }
    float _1497 = _1483;
    if (_1475)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1315 = _1499;
    }
    float _1501 = _1315;
    float _1503 = _1301;
    if (_1475)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1207;
    float _1517 = _1511;
    float _1519 = _1513;
    if (_1475)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    if (!_1475)
    {
        _1517 = _1463;
    }
    float _1527 = _1517;
    float _1529 = -_1461;
    float _1531 = -_1513;
    float _1533 = fma(_1441, _1529, _1531);
    float _1535 = _1527;
    if (_1475)
    {
        float _1537 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1537;
    }
    float _1539 = _1519;
    float _1541 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1543 = _1509;
    float _1545 = _1539;
    if (_1475)
    {
        float _1547 = fma(_1509, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1547;
    }
    float _1549 = _1317;
    float _1551 = _1549;
    if (!_1475)
    {
        _1543 = _1533;
    }
    float _1553 = _1543;
    float _1555 = _1553;
    float _1557 = _1525;
    if (_1475)
    {
        float _1559 = _1525 + (-1.0);
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1475)
    {
        float _1565 = _1491 * _1549;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1475)
    {
        float _1569 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1569;
    }
    float _1571 = _1493;
    float _1573 = _1571;
    if (_1475)
    {
        float _1575 = _1463 * _1567;
        _1535 = _1575;
    }
    float _1577 = _1535;
    if (!_1475)
    {
        _1563 = _1465;
    }
    float _1579 = _1563;
    float _1581 = _1579;
    if (_1475)
    {
        float _1583 = _1465 * _1567;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1475)
    {
        float _1587 = fma(_1533, _1525, _1571);
        _1555 = _1587;
    }
    float _1589 = _1555;
    if (!_1475)
    {
        _1557 = _1467;
    }
    float _1591 = _1557;
    float _1593 = _1591;
    if (_1475)
    {
        float _1595 = _1577 * _1577;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (!_1475)
    {
        _1573 = _1469;
    }
    float _1599 = _1573;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1599;
    if (_1475)
    {
        float _1607 = _1585 * _1585;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1589, _1589, _1597);
    float _1613 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1615 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1541);
    float _1617 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1621 = _1611 + _1609;
    float _1623 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1613);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1633 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1617);
    float _1635 = rsqrt(_1621);
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1615);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1623);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1649);
    float _1661 = abs(_1653);
    float _1663 = log2(_1661);
    float _1665 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1659);
    float _1667 = _1635 * _1577;
    float _1669 = _1635 * _1589;
    float _1671 = _1635 * _1585;
    float _1673 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = -_1657;
    float _1679 = fma(_1677, _1631, 1.0);
    float _1681 = 1.0 / _1673;
    float _1683 = -_1675;
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1689 = -_1671;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1693 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = log2(_1679);
    float _1699 = fma(_1691, -0.5, 0.5);
    float _1701 = fma(_1691, 0.5, 0.5);
    float _1703 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1705 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1687);
    float _1707 = _1669 + 1.0;
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1703);
    float _1713 = exp2(_1695);
    float _1715 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1705);
    float _1717 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1719 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1721 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1715);
    float _1723 = fma(_1701, _1717, 1.570728778839111328125);
    float _1725 = _1719 * _1681;
    float _1727 = sqrt(_1699);
    float _1729 = _1697 * 0.693147182464599609375;
    float _1731 = _1721 * _1681;
    float _1733 = fma(_1725, 0.5, 0.5);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = fma(_1731, -0.5, 0.5);
    float _1739 = -_1669;
    float _1741 = fma(_1713, _1707, _1739);
    float _1743 = fma(_1741, 0.5, 0.5);
    float _1745 = _1727 * 0.636619746685028076171875;
    float _1747 = -_1723;
    float _1749 = fma(_1745, _1747, 1.0);
    float3 _5049 = float3(_1733, _1737, _1735);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5049, float3(0.0), isnan(_5049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5049, float3(0.0), isnan(_5049)), level(0.0)).x;
    float3 _5060 = float3(_1733, _1737, _1735);
    float4 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = _1754.w;
    float2 _5077 = float2(_1749, _1743);
    float3 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5077, float2(0.0), isnan(_5077)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5077, float2(0.0), isnan(_5077)), level(0.0)).xyz;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = in.m_54.x;
    float _1776 = in.m_54.y;
    float _1778 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1790 = exp2(_1778);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1792;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1798 = _1796 != 0;
    float _1800 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    bool _1806 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1808 = isnan(_1095);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = 1.0 / _1784;
    float _1820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1800);
    bool _1822 = _1774 > 0.5;
    float _1824 = 1.0 / _1788;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1828 = _1095 + _1826;
    bool _1830 = _1776 > 0.5;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1834 = _1095 + _1832;
    float _1836 = _1828 * _1818;
    bool _1838 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1840 = isnan(_1095);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1850;
    float _1854 = fma(_1794, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1858 = _1856 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1860 = -_1848;
    float _1862 = _1860 + 1.0;
    float _1864 = fma(_1852, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1866 = _1834 * _1824;
    bool _1868 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1870 = isnan(_1095);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1880;
    float _1884 = -_203;
    int _1886 = _1830 ? as_type<int>(_1884) : as_type<int>(_203);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1892 = fma(_1858, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1894 = fma(_1882, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1896 = _1878 * _1862;
    float _1898 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1908 = !_1804;
    float _1910 = _1908 ? _203 : as_type<float>(_1886);
    float _1912 = _1125 * _1898;
    float _1914 = _1123 * _1898;
    float _1916 = _1816 * _1902;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = -_1816;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1910;
    float _1926 = _1924 + 0.5;
    float _1928 = _1894 * _1916;
    float _1930 = _1864 * _1916;
    float _1932 = _1854 * _1916;
    float _1934 = -_199;
    int _1936 = _1822 ? as_type<int>(_1934) : as_type<int>(_199);
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1930);
    float _1942 = fma(_1890, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1944 = fma(_1906, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1932);
    bool _1950 = !_1798;
    float _1952 = _1950 ? _199 : as_type<float>(_1936);
    float _1954 = _1127 * _1898;
    float _1956 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1958 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1960 = fma(_1942, _1896, _1938);
    float _1962 = fma(_1944, _1896, _1940);
    float _1964 = fma(_1892, _1896, _1948);
    float _1966 = fma(_1219, _1956, _1954);
    float _1968 = _1958 * _1918;
    float _1970 = _1952 + 0.5;
    float _1972 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1960);
    float _1974 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1962);
    float _1976 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1964);
    float _1978 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1980 = fma(_1221, _1956, _1912);
    float _1982 = fma(_1223, _1956, _1914);
    float _1984 = _1291 + _1966;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1990 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1994 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1978);
    float _1996 = _1986 * _1946;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1994);
    float _2006 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.x = _1996;
    out.m_58.y = _1968;
    bool _2008 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2016 = _2012 || _2014;
    float _2018 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2020 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2006);
    out.m_60.x = _1998;
    out.m_60.y = _2000;
    out.m_60.z = _2002;
    float _2022 = _1253 + _1980;
    float _2024 = 1.0 / _2018;
    float _2026 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1243 + _1982;
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_62.x = _2022;
    out.m_62.y = _1984;
    out.m_62.z = _2028;
    float _2032 = _2030 + _2018;
    float _2034 = _2032 * _2024;
    float _2036 = _2034 * 0.5;
    float _2038 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2040 = _2022;
    if (_2016)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = _2042;
    if (!_2016)
    {
        float _2046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2050 = _2046 * 0.15915493667125701904296875;
        float _2052 = _2048 * 0.15915493667125701904296875;
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2054);
        float _2058 = _2050 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2050 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2060;
        float _2068 = _2052 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2052 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2056;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2078;
        float _2088 = 1.0 / _2084;
        float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2092 = _2080 * _2090;
        float _2094 = _2076 * _2086;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = fma(_2094, _2092, _2096);
        float _2100 = _2098 * _2088;
        float _2102 = precise::clamp(_2100, 0.0, 1.0);
        _2044 = _2102;
    }
    float _2104 = _2044;
    float _2106 = _2038 + _1673;
    float _2108 = -_1790;
    float _2110 = _2108 + 1.0;
    bool _2112 = _2104 > 0.0;
    bool _2114 = isnan(_2104);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2124 = _2106 * 0.5;
    float _2126 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1445;
    out.m_64.y = _1441;
    out.m_64.z = _1449;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2130 = _2126 * _1751;
    float _2132 = -_2126;
    float _2134 = _2132 + 1.0;
    out.gl_Position.x = _1719;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1673;
    float _2136 = _1762 * _2130;
    float _2138 = _1772 * _2130;
    float _2140 = _1762 * _2134;
    out.m_66.z = _2124;
    out.m_66.w = _1673;
    float _2142 = fma(_1768, _2136, _1756);
    float _2144 = fma(_1770, _2136, _1758);
    float _2146 = fma(_1762, _2138, _1760);
    out.m_45.x = _2128;
    out.m_68.x = _2142;
    out.m_68.y = _2144;
    out.m_68.z = _2146;
    out.m_68.w = _2140;
    if (_2120)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2148;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1087 = false;
    bool _983 = false;
    bool _827 = false;
    bool _575 = false;
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
        float _2205 = as_type<float>(_103);
        out.gl_Position.z = _2205;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2274 = as_type<float>(_139);
        out.gl_Position.z = _2274;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _209 = _223;
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
    float _293 = _289;
    if (!_159)
    {
        float _295 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _295;
    }
    float _297 = _277;
    bool _299 = !_159;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _121 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _121);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _279 = _319;
    }
    float _333 = _301;
    float _335 = _279;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_159)
    {
        _339 = _121;
    }
    float _341 = _339;
    bool _343 = !_159;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _121 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _147, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = sqrt(_195);
    float _377 = fma(_367, _145, _369);
    float _379 = -_371;
    float _381 = _289 + _379;
    float _383 = fma(_367, _149, _373);
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = _381 * _381;
    float _391 = -_383;
    float _393 = _291 + _391;
    float _395 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _397 = fma(_387, _387, _389);
    float _399 = sqrt(_167);
    float _401 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _395);
    float _403 = fma(_393, _393, _397);
    float _405 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _407 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _409 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _401);
    float _411 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].y, _405);
    float _415 = sqrt(_403);
    float _417 = _381 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _419 = in.m_52.w;
    float _421 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].x, _407);
    float _423 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _425 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].z, _411);
    float _427 = in.m_42.x;
    float _429 = in.m_42.y;
    float _431 = in.m_42.z;
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[14].w, _417);
    float _435 = sqrt(_409);
    float _437 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].x, _421);
    float _439 = _375 * _423;
    float _441 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].w, _433);
    float _443 = _399 * _437;
    float _445 = _439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _447 = _415 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_415);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _459 = _439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _461 = _439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _463 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _465 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _459);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _461);
    float _469 = _435 * _457;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _463);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _465);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _477 = fma(_291, _419, _431);
    float _479 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[25].w, _473);
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[26].w, _475);
    float _485 = fma(_289, _419, _429);
    float _487 = fma(_287, _419, _427);
    float _489 = _479;
    float _491 = _481;
    if (_455)
    {
        _293 = _479;
    }
    float _493 = _293;
    float _495 = _493;
    if (_455)
    {
        _489 = _483;
    }
    float _497 = _489;
    float _499 = _497;
    if (!_455)
    {
        bool _501 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _503 = !_501;
        if (!_503)
        {
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _515);
            float _523 = _375 * _517;
            float _525 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _527 = _399 * _519;
            float _529 = _435 * _521;
            float _531 = _523 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _525);
            float _535 = _523 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _537 = _523 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _539 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _531);
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _533);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
            float _549 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].z, _543);
            float _551 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].z, _545);
            float _553 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _551);
            float _559 = _553 * _553;
            float _561 = fma(_555, _555, _559);
            float _563 = fma(_557, _557, _561);
            float _565 = rsqrt(_563);
            float _567 = _565 * 9.9999999747524270787835121154785e-07;
            float _569 = _555 * _567;
            float _571 = _553 * _567;
            float _573 = _557 * _567;
            _491 = _571;
            _495 = _569;
            _499 = _573;
            _575 = true;
        }
        else
        {
            float _577 = _147 * _147;
            float _579 = fma(_145, _145, _577);
            float _581 = fma(_149, _149, _579);
            float _583 = sqrt(_581);
            bool _585 = _583 >= 9.9999999747524270787835121154785e-07;
            bool _587 = isnan(_583);
            bool _589 = _585 || _587;
            bool _591 = isnan(9.9999999747524270787835121154785e-07);
            bool _593 = _589 || _591;
            if (!_593)
            {
                float _595 = _429 * _429;
                float _597 = fma(_427, _427, _595);
                float _599 = fma(_431, _431, _597);
                float _601 = sqrt(_599);
                bool _603 = _601 >= 9.9999999747524270787835121154785e-07;
                bool _605 = isnan(_601);
                bool _607 = _603 || _605;
                bool _609 = isnan(9.9999999747524270787835121154785e-07);
                bool _611 = _607 || _609;
                if (!_611)
                {
                    float _613 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _615 = _399 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _617 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _619 = _613 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _621 = _613 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _623 = _613 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _625 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].x, _619);
                    float _627 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _625);
                    float _633 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _627);
                    float _635 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _635);
                    float _643 = _637 * _637;
                    float _645 = fma(_639, _639, _643);
                    float _647 = fma(_641, _641, _645);
                    float _649 = rsqrt(_647);
                    float _651 = _649 * 9.9999999747524270787835121154785e-07;
                    float _653 = _639 * _651;
                    float _655 = _637 * _651;
                    float _657 = _641 * _651;
                    _491 = _655;
                    _495 = _653;
                    _499 = _657;
                    _575 = true;
                }
                else
                {
                    float _659 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _661 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _663 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _665 = _429 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _667 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].y, _659);
                    float _669 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].x, _661);
                    float _671 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].z, _663);
                    float _673 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[14].w, _665);
                    float _675 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].y, _667);
                    float _677 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].x, _669);
                    float _679 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].z, _671);
                    float _681 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[16].w, _673);
                    float _683 = _375 * _675;
                    float _685 = _399 * _677;
                    float _687 = _435 * _679;
                    float _689 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _691 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _695 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _689);
                    float _697 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _695);
                    float _703 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _697);
                    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _699);
                    float _707 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].w, _701);
                    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].w, _703);
                    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].w, _705);
                    float _713 = _707 * _707;
                    float _715 = fma(_709, _709, _713);
                    float _717 = fma(_711, _711, _715);
                    float _719 = rsqrt(_717);
                    float _721 = _719 * 9.9999999747524270787835121154785e-07;
                    float _723 = _709 * _721;
                    float _725 = _707 * _721;
                    float _727 = _711 * _721;
                    _491 = _725;
                    _495 = _723;
                    _499 = _727;
                    _575 = true;
                }
            }
            else
            {
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _733 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _735 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _747 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _743);
                float _753 = _375 * _745;
                float _755 = _399 * _747;
                float _757 = _435 * _749;
                float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _765 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
                float _771 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
                float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].w, _771);
                float _779 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].w, _773);
                float _781 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].w, _775);
                float _783 = _777 * _777;
                float _785 = fma(_779, _779, _783);
                float _787 = fma(_781, _781, _785);
                float _789 = rsqrt(_787);
                float _791 = _789 * 9.9999999747524270787835121154785e-07;
                float _793 = _779 * _791;
                float _795 = _777 * _791;
                float _797 = _781 * _791;
                _491 = _795;
                _495 = _793;
                _499 = _797;
            }
        }
    }
    _575 = false;
    float _799 = _491;
    float _801 = _495;
    float _803 = _499;
    bool _805 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _807 = !_805;
    float _825;
    if (!_807)
    {
        float _809 = in.m_54.x;
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _813 = _809 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_87);
        float _831 = 1.0 / _829;
        float _833 = _121 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _839 = _835 + _837;
    bool _841 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _843 = isnan(_835);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _855 = _835 + _853;
    bool _857 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_835);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    float _881 = 1.0 / _875;
    bool _883 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _885 = isnan(_835);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = _867 * _879;
    float _897 = -_867;
    float _899 = _897 + 1.0;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _903 = _893 * _899;
    float _905 = 1.0 / _871;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _907;
    float _911 = -_893;
    float _913 = _911 + 1.0;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _919 = _855 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _925 = fma(_917, _919, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _927 = fma(_923, _919, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _929 = _839 * _905;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _931;
    float _935 = in.m_52.x;
    float _937 = in.m_52.y;
    float _939 = fma(_909, _929, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = fma(_933, _929, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _943 = _939 * _903;
    float _945 = _941 * _903;
    float _947 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].x, _945);
    float _949 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[143].y, _943);
    float _951 = fma(_927, _895, _947);
    float _953 = fma(_925, _895, _949);
    float _955 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].x, _951);
    float _957 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[145].y, _953);
    float _959 = _955 * _935;
    float _961 = _957 * _937;
    bool _963 = !_901;
    float _981;
    if (!_963)
    {
        float _965 = in.m_54.x;
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _969 = _965 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _973 = _971 * _967;
        float _975 = floor(_973);
        float _977 = -_975;
        float _979 = _973 + _977;
        _981 = _979;
        _983 = true;
    }
    else
    {
        float _985 = float(_87);
        float _987 = 1.0 / _985;
        float _989 = _121 * _987;
        _981 = _989;
    }
    _983 = false;
    float _991 = _981;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _995 = _991 + _993;
    bool _997 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _999 = isnan(_991);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1013 = _991 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1015 = isnan(_991);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    float _1029 = -_1007;
    float _1031 = _1029 + 1.0;
    bool _1033 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1035 = 1.0 / _1011;
    float _1037 = _1023 * _1031;
    float _1039 = -_1023;
    float _1041 = _1039 + 1.0;
    float _1043 = _1027 * _1035;
    float _1045 = fma(_1043, _995, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1049 = _1045 * _1037;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1053 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1049);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1055);
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1065 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1059;
    out.m_56.y = _1053;
    out.m_56.z = _1063;
    out.m_56.w = _1065;
    bool _1067 = !_1033;
    float _1085;
    if (!_1067)
    {
        float _1069 = in.m_54.x;
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1073 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1077 = _1075 * _1071;
        float _1079 = floor(_1077);
        float _1081 = -_1079;
        float _1083 = _1077 + _1081;
        _1085 = _1083;
        _1087 = true;
    }
    else
    {
        float _1089 = float(_87);
        float _1091 = 1.0 / _1089;
        float _1093 = _121 * _1091;
        _1085 = _1093;
    }
    _1087 = false;
    float _1095 = _1085;
    float _1097 = _799 * _799;
    float _1099 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1101 = _961 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1105 = fma(_801, _801, _1097);
    float _1107 = _959 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1109 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_803, _803, _1105);
    float _1121 = rsqrt(_1119);
    float _1123 = _1121 * _803;
    float _1125 = _1121 * _801;
    float _1127 = _1121 * _799;
    float _1129 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1133 = _1123 * _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1137 = _1125 * _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1141 = _1127 * _1139;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = -_1133;
    float _1147 = fma(_1125, _1143, _1145);
    float _1149 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1151 = -_1137;
    float _1153 = fma(_1127, _1149, _1151);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1157 = -_1141;
    float _1159 = fma(_1123, _1155, _1157);
    float _1161 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1099);
    float _1163 = _1147 * _1147;
    float _1165 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1167 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1169 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1161);
    float _1171 = fma(_1159, _1159, _1163);
    float _1173 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1129);
    float _1175 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1165);
    float _1177 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1179 = fma(_1153, _1153, _1171);
    float _1181 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1173);
    float _1183 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1175);
    float _1185 = _375 * _1177;
    float _1187 = rsqrt(_1179);
    float _1189 = _1181 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1191 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1167);
    float _1193 = _1183 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1195 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1197 = _399 * _1189;
    float _1199 = _1101 * _1103;
    float _1201 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1205 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1191);
    float _1207 = _435 * _1193;
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1195);
    float _1211 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1201);
    float _1213 = _1107 * _1203;
    float _1215 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1217 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1219 = _1147 * _1187;
    float _1221 = _1159 * _1187;
    float _1223 = _1153 * _1187;
    float _1225 = _1199 * _1123;
    float _1227 = _1125 * _1219;
    float _1229 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1231 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1233 = _1199 * _1125;
    float _1235 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1217);
    float _1237 = fma(_1213, _1223, _1225);
    float _1239 = _1127 * _1223;
    float _1241 = -_1227;
    float _1243 = fma(_1127, _1221, _1241);
    float _1245 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1229);
    float _1247 = _1235 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1249 = fma(_1213, _1221, _1233);
    float _1251 = -_1239;
    float _1253 = fma(_1123, _1219, _1251);
    float _1255 = fma(_1231, _1243, _1237);
    float _1257 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1259 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1261 = fma(_1231, _1253, _1249);
    float _1263 = _1247 + _1255;
    float _1265 = _1199 * _1127;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1259);
    float _1269 = _1257 + _1261;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1263 + _1271;
    float _1275 = _1123 * _1221;
    float _1277 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1267);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1269 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1213, _1219, _1265);
    float _1287 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1277);
    float _1289 = -_1275;
    float _1291 = fma(_1125, _1223, _1289);
    float _1293 = fma(_1281, _1281, _1283);
    float _1295 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1297 = fma(_1231, _1291, _1285);
    float _1299 = sqrt(_1293);
    float _1301 = _1295 + _1297;
    bool _1303 = _1299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1305 = _1215;
    float _1307 = _1287;
    float _1309 = _1265;
    float _1311 = _1281;
    float _1313 = _1273;
    float _1315 = _1293;
    float _1317 = _1263;
    if (!_1303)
    {
        _1305 = _1269;
    }
    float _1319 = _1305;
    float _1321 = _1319;
    if (!_1303)
    {
        _1307 = _1263;
    }
    float _1323 = _1307;
    float _1325 = _1323;
    if (!_1303)
    {
        _1309 = _1301;
    }
    float _1327 = _1309;
    bool _1329 = !_1303;
    float _1331 = _1327;
    if (!_1329)
    {
        float _1333 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1337 = _1299 + _1335;
        float _1339 = rsqrt(_1293);
        float _1341 = _1337 * _1333;
        float _1343 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = _1341 * 0.15915493667125701904296875;
        float _1347 = _1345 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        float _1351 = _1345 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = fma(_1349, _1343, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1357 = _1339 * _1355;
        float _1359 = _1353 + (-1.0);
        float _1361 = fma(_1281, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1363 = fma(_1273, _1357, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1365 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1367 = fma(_1301, _1353, _1365);
        _1321 = _1361;
        _1325 = _1363;
        _1331 = _1367;
    }
    float _1369 = _1321;
    float _1371 = _1325;
    float _1373 = _1331;
    float _1375 = _1373;
    float _1377 = _1369;
    float _1379 = _1371;
    if (!_1117)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1295 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1257 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1247 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1257;
        float _1413 = _1411 + _1369;
        float _1415 = -_1247;
        float _1417 = _1415 + _1371;
        float _1419 = _1405 * _1409;
        float _1421 = -_1295;
        float _1423 = _1421 + _1373;
        float _1425 = fma(_1413, _1419, _1257);
        float _1427 = fma(_1423, _1419, _1295);
        float _1429 = fma(_1417, _1419, _1247);
        _1375 = _1427;
        _1377 = _1425;
        _1379 = _1429;
        _1311 = _1417;
    }
    float _1431 = _1375;
    float _1433 = _1377;
    float _1435 = _1379;
    float _1437 = _1311;
    float _1439 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1441 = _1431 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1445 = _1433 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    float _1451 = _1441 * _1441;
    float _1453 = fma(_1445, _1445, _1451);
    float _1455 = fma(_1449, _1449, _1453);
    float _1457 = rsqrt(_1455);
    float _1459 = sqrt(_1455);
    float _1461 = _1457 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1463 = _1445 * _1461;
    float _1465 = _1449 * _1461;
    float _1467 = _1463 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = _1473 + _1477;
    float _1481 = _1437;
    float _1483 = _1479;
    if (_1475)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1485;
    }
    float _1487 = _1481;
    if (_1475)
    {
        float _1489 = rsqrt(_1471);
        _1313 = _1489;
    }
    float _1491 = _1313;
    float _1493 = _1491;
    if (_1475)
    {
        float _1495 = _1479 * _1487;
        _1483 = _1495;
    }
    float _1497 = _1483;
    if (_1475)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1315 = _1499;
    }
    float _1501 = _1315;
    float _1503 = _1301;
    if (_1475)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1207;
    float _1517 = _1511;
    float _1519 = _1513;
    if (_1475)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    if (!_1475)
    {
        _1517 = _1463;
    }
    float _1527 = _1517;
    float _1529 = -_1461;
    float _1531 = -_1513;
    float _1533 = fma(_1441, _1529, _1531);
    float _1535 = _1527;
    if (_1475)
    {
        float _1537 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1537;
    }
    float _1539 = _1519;
    float _1541 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1543 = _1509;
    float _1545 = _1539;
    if (_1475)
    {
        float _1547 = fma(_1509, _1539, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1317 = _1547;
    }
    float _1549 = _1317;
    float _1551 = _1549;
    if (!_1475)
    {
        _1543 = _1533;
    }
    float _1553 = _1543;
    float _1555 = _1553;
    float _1557 = _1525;
    if (_1475)
    {
        float _1559 = _1525 + (-1.0);
        _1545 = _1559;
    }
    float _1561 = _1545;
    float _1563 = _1561;
    if (_1475)
    {
        float _1565 = _1491 * _1549;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1475)
    {
        float _1569 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1569;
    }
    float _1571 = _1493;
    float _1573 = _1571;
    if (_1475)
    {
        float _1575 = _1463 * _1567;
        _1535 = _1575;
    }
    float _1577 = _1535;
    if (!_1475)
    {
        _1563 = _1465;
    }
    float _1579 = _1563;
    float _1581 = _1579;
    if (_1475)
    {
        float _1583 = _1465 * _1567;
        _1581 = _1583;
    }
    float _1585 = _1581;
    if (_1475)
    {
        float _1587 = fma(_1533, _1525, _1571);
        _1555 = _1587;
    }
    float _1589 = _1555;
    if (!_1475)
    {
        _1557 = _1467;
    }
    float _1591 = _1557;
    float _1593 = _1591;
    if (_1475)
    {
        float _1595 = _1577 * _1577;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (!_1475)
    {
        _1573 = _1469;
    }
    float _1599 = _1573;
    float _1601 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1603 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1605 = _1599;
    if (_1475)
    {
        float _1607 = _1585 * _1585;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = fma(_1589, _1589, _1597);
    float _1613 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1615 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1541);
    float _1617 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1603);
    float _1621 = _1611 + _1609;
    float _1623 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1613);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1633 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1617);
    float _1635 = rsqrt(_1621);
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1639 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1615);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1623);
    float _1645 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1651 = -_1629;
    float _1653 = _1651 + 1.0;
    float _1655 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1657 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1649);
    float _1661 = abs(_1653);
    float _1663 = log2(_1661);
    float _1665 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1659);
    float _1667 = _1635 * _1577;
    float _1669 = _1635 * _1589;
    float _1671 = _1635 * _1585;
    float _1673 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1665);
    float _1675 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = -_1657;
    float _1679 = fma(_1677, _1631, 1.0);
    float _1681 = 1.0 / _1673;
    float _1683 = -_1675;
    float _1685 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1689 = -_1671;
    float _1691 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1693 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1697 = log2(_1679);
    float _1699 = fma(_1691, -0.5, 0.5);
    float _1701 = fma(_1691, 0.5, 0.5);
    float _1703 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1705 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1687);
    float _1707 = _1669 + 1.0;
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1703);
    float _1713 = exp2(_1695);
    float _1715 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1705);
    float _1717 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1719 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1721 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1715);
    float _1723 = fma(_1701, _1717, 1.570728778839111328125);
    float _1725 = _1719 * _1681;
    float _1727 = sqrt(_1699);
    float _1729 = _1697 * 0.693147182464599609375;
    float _1731 = _1721 * _1681;
    float _1733 = fma(_1725, 0.5, 0.5);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = fma(_1731, -0.5, 0.5);
    float _1739 = -_1669;
    float _1741 = fma(_1713, _1707, _1739);
    float _1743 = fma(_1741, 0.5, 0.5);
    float _1745 = _1727 * 0.636619746685028076171875;
    float _1747 = -_1723;
    float _1749 = fma(_1745, _1747, 1.0);
    float3 _5049 = float3(_1733, _1737, _1735);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5049, float3(0.0), isnan(_5049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5049, float3(0.0), isnan(_5049)), level(0.0)).x;
    float3 _5060 = float3(_1733, _1737, _1735);
    float4 _1754 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1756 = _1754.x;
    float _1758 = _1754.y;
    float _1760 = _1754.z;
    float _1762 = _1754.w;
    float2 _5077 = float2(_1749, _1743);
    float3 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5077, float2(0.0), isnan(_5077)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5077, float2(0.0), isnan(_5077)), level(0.0)).xyz;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = in.m_54.x;
    float _1776 = in.m_54.y;
    float _1778 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1790 = exp2(_1778);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1792;
    int _1796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1798 = _1796 != 0;
    float _1800 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    bool _1806 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1808 = isnan(_1095);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1814 = _1810 || _1812;
    float _1816 = float(_1814);
    float _1818 = 1.0 / _1784;
    float _1820 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1800);
    bool _1822 = _1774 > 0.5;
    float _1824 = 1.0 / _1788;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1828 = _1095 + _1826;
    bool _1830 = _1776 > 0.5;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1834 = _1095 + _1832;
    float _1836 = _1828 * _1818;
    bool _1838 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1840 = isnan(_1095);
    bool _1842 = _1838 || _1840;
    bool _1844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1846 = _1842 || _1844;
    float _1848 = float(_1846);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1850;
    float _1854 = fma(_1794, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1858 = _1856 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1860 = -_1848;
    float _1862 = _1860 + 1.0;
    float _1864 = fma(_1852, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1866 = _1834 * _1824;
    bool _1868 = _1095 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1870 = isnan(_1095);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1880;
    float _1884 = -_203;
    int _1886 = _1830 ? as_type<int>(_1884) : as_type<int>(_203);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1892 = fma(_1858, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1894 = fma(_1882, _1836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1896 = _1878 * _1862;
    float _1898 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1908 = !_1804;
    float _1910 = _1908 ? _203 : as_type<float>(_1886);
    float _1912 = _1125 * _1898;
    float _1914 = _1123 * _1898;
    float _1916 = _1816 * _1902;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = -_1816;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1910;
    float _1926 = _1924 + 0.5;
    float _1928 = _1894 * _1916;
    float _1930 = _1864 * _1916;
    float _1932 = _1854 * _1916;
    float _1934 = -_199;
    int _1936 = _1822 ? as_type<int>(_1934) : as_type<int>(_199);
    float _1938 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1928);
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1930);
    float _1942 = fma(_1890, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1944 = fma(_1906, _1866, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1948 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1932);
    bool _1950 = !_1798;
    float _1952 = _1950 ? _199 : as_type<float>(_1936);
    float _1954 = _1127 * _1898;
    float _1956 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1958 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1960 = fma(_1942, _1896, _1938);
    float _1962 = fma(_1944, _1896, _1940);
    float _1964 = fma(_1892, _1896, _1948);
    float _1966 = fma(_1219, _1956, _1954);
    float _1968 = _1958 * _1918;
    float _1970 = _1952 + 0.5;
    float _1972 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1960);
    float _1974 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1962);
    float _1976 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1964);
    float _1978 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1980 = fma(_1221, _1956, _1912);
    float _1982 = fma(_1223, _1956, _1914);
    float _1984 = _1291 + _1966;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1990 = _1974 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1992 = _1976 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1994 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1978);
    float _1996 = _1986 * _1946;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1994);
    float _2006 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.x = _1996;
    out.m_58.y = _1968;
    bool _2008 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2016 = _2012 || _2014;
    float _2018 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2020 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2006);
    out.m_60.x = _1998;
    out.m_60.y = _2000;
    out.m_60.z = _2002;
    float _2022 = _1253 + _1980;
    float _2024 = 1.0 / _2018;
    float _2026 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2020);
    float _2028 = _1243 + _1982;
    float _2030 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_62.x = _2022;
    out.m_62.y = _1984;
    out.m_62.z = _2028;
    float _2032 = _2030 + _2018;
    float _2034 = _2032 * _2024;
    float _2036 = _2034 * 0.5;
    float _2038 = fma(_1655, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1820);
    float _2040 = _2022;
    if (_2016)
    {
        _2040 = 1.0;
    }
    float _2042 = _2040;
    float _2044 = _2042;
    if (!_2016)
    {
        float _2046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2048 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2050 = _2046 * 0.15915493667125701904296875;
        float _2052 = _2048 * 0.15915493667125701904296875;
        float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2056 = fma(_2036, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2054);
        float _2058 = _2050 * 6.283185482025146484375;
        float _2060 = cos(_2058);
        float _2062 = _2050 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2060;
        float _2068 = _2052 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2052 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2056;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2082;
        float _2086 = 1.0 / _2078;
        float _2088 = 1.0 / _2084;
        float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2092 = _2080 * _2090;
        float _2094 = _2076 * _2086;
        float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2098 = fma(_2094, _2092, _2096);
        float _2100 = _2098 * _2088;
        float _2102 = precise::clamp(_2100, 0.0, 1.0);
        _2044 = _2102;
    }
    float _2104 = _2044;
    float _2106 = _2038 + _1673;
    float _2108 = -_1790;
    float _2110 = _2108 + 1.0;
    bool _2112 = _2104 > 0.0;
    bool _2114 = isnan(_2104);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2124 = _2106 * 0.5;
    float _2126 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.x = _1445;
    out.m_64.y = _1441;
    out.m_64.z = _1449;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2130 = _2126 * _1751;
    float _2132 = -_2126;
    float _2134 = _2132 + 1.0;
    out.gl_Position.x = _1719;
    out.gl_Position.y = _1721;
    out.gl_Position.z = _2038;
    out.gl_Position.w = _1673;
    float _2136 = _1762 * _2130;
    float _2138 = _1772 * _2130;
    float _2140 = _1762 * _2134;
    out.m_66.z = _2124;
    out.m_66.w = _1673;
    float _2142 = fma(_1768, _2136, _1756);
    float _2144 = fma(_1770, _2136, _1758);
    float _2146 = fma(_1762, _2138, _1760);
    out.m_45.x = _2128;
    out.m_68.x = _2142;
    out.m_68.y = _2144;
    out.m_68.z = _2146;
    out.m_68.w = _2140;
    if (_2120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2148;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

