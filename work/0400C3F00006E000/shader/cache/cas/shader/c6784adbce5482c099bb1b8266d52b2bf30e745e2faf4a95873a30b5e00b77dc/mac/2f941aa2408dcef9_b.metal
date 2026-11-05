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
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_68 [[user(locn8)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2599 = as_type<float>(_103);
        out.gl_Position.z = _2599;
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
        float _2668 = as_type<float>(_139);
        out.gl_Position.z = _2668;
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
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _165);
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _179 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _177);
    float _181 = _177;
    float _183 = _143;
    if (!_159)
    {
        float _185 = _143 * _143;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_159)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_159;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _143 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _143);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _143 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _183 = _263;
    }
    float _265 = _183;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _271;
    if (!_159)
    {
        float _275 = _121 * _121;
        float _277 = _275 * 0.5;
        _243 = _277;
    }
    float _279 = _243;
    float _281 = fma(_265, _145, _267);
    float _283 = fma(_265, _147, _269);
    float _285 = fma(_265, _149, _271);
    float _287 = _279;
    if (!_159)
    {
        float _289 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _289;
    }
    float _291 = _287;
    bool _293 = !_159;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _121);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _273 = _313;
    }
    float _327 = _295;
    float _329 = _273;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_159)
    {
        _333 = _121;
    }
    float _335 = _333;
    bool _337 = !_159;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _121 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _147, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _145, _363);
    float _371 = -_365;
    float _373 = _283 + _371;
    float _375 = fma(_361, _149, _367);
    float _377 = sqrt(_179);
    float _379 = -_369;
    float _381 = _281 + _379;
    float _383 = _373 * _373;
    float _385 = -_375;
    float _387 = _285 + _385;
    float _389 = fma(_381, _381, _383);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = sqrt(_167);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _397 = fma(_387, _387, _389);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = in.m_52.w;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _395);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = sqrt(_397);
    float _411 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _413 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = in.m_42.z;
    float _421 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _423 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _411);
    float _425 = sqrt(_407);
    float _427 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _429 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _423);
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _421);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _405);
    float _435 = _393 * _427;
    float _437 = _377 * _429;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_409);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _425 * _433;
    float _465 = fma(_281, _403, _415);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_283, _403, _417);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_285, _403, _419);
    float _483 = _471;
    float _485 = _439;
    float _487 = _479;
    if (_449)
    {
        _483 = _475;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _477;
    }
    float _493 = _485;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _521 = _393 * _513;
            float _523 = _377 * _515;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _517);
            float _527 = _425 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _525);
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _487 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _147 * _147;
            float _575 = fma(_145, _145, _573);
            float _577 = fma(_149, _149, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _417 * _417;
                float _593 = fma(_415, _415, _591);
                float _595 = fma(_419, _419, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _393 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _425 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _487 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _677 = _393 * _671;
                    float _679 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _681 = _377 * _673;
                    float _683 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _687 = _425 * _679;
                    float _689 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _487 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _747 = _393 * _741;
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _751 = _377 * _743;
                float _753 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _755 = _425 * _749;
                float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _487 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _487;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_87);
        float _827 = 1.0 / _825;
        float _829 = _121 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _841;
    float _845 = 1.0 / _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = 1.0 / _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = _831 + _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _867 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _869 = 1.0 / _843;
    float _871 = _859 * _845;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _831 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _879 = _831 + _877;
    out.m_56.x = _853;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _861;
    bool _881 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _883 = isnan(_831);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _875 * _855;
    bool _895 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _897 = isnan(_831);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _907;
    float _911 = fma(_909, _871, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _917 = _879 * _869;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    bool _927 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _929 = isnan(_831);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_921, _871, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = _891 * _925;
    bool _943 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _945 = isnan(_831);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -_891;
    float _957 = _955 + 1.0;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _963 = -_937;
    float _965 = _963 + 1.0;
    float _967 = _937 * _957;
    float _969 = fma(_961, _893, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _971 = fma(_915, _893, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _973 = _953 * _965;
    float _975 = in.m_52.x;
    float _977 = in.m_52.y;
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = _911 * _973;
    float _985 = _939 * _973;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].x, _983);
    float _997 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _999 = fma(_989, _917, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1001 = fma(_993, _917, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1003 = fma(_969, _967, _995);
    float _1005 = fma(_971, _967, _997);
    float _1007 = fma(_999, _941, _1003);
    float _1009 = fma(_1001, _941, _1005);
    float _1011 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1007);
    float _1013 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1009);
    float _1015 = _1011 * _975;
    float _1017 = _1013 * _977;
    bool _1019 = !_867;
    float _1043;
    float _1045;
    if (!_1019)
    {
        float _1021 = in.m_54.x;
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1025 = float(_87);
        float _1027 = 1.0 / _1025;
        float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1031 = _121 * _1027;
        float _1033 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1035 = _1033 * _1023;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = _1031;
        _1047 = true;
    }
    else
    {
        float _1049 = float(_87);
        float _1051 = 1.0 / _1049;
        float _1053 = _121 * _1051;
        _1043 = _1053;
        _1045 = _1053;
    }
    _1047 = false;
    float _1055 = _1043;
    float _1057 = _1045;
    float _1059 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1061 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1063 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1065 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1067 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1059);
    float _1069 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1061);
    float _1071 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1063);
    float _1073 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1065);
    float _1075 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1067);
    float _1077 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1069);
    float _1079 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1071);
    float _1081 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1091 = _393 * _1083;
    float _1093 = _377 * _1085;
    float _1095 = _425 * _1087;
    float _1097 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1119 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1113);
    float _1121 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1115);
    float _1123 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1117);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1127 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1125 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1127 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = _795 * _795;
    float _1149 = fma(_1141, _1141, _1145);
    float _1151 = fma(_797, _797, _1147);
    float _1153 = fma(_799, _799, _1151);
    float _1155 = rsqrt(_1149);
    float _1157 = rsqrt(_1153);
    float _1159 = _1133 * _1155;
    float _1161 = _1137 * _1155;
    float _1163 = _1141 * _1155;
    float _1165 = -_1159;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1133);
    float _1169 = -_1161;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1173 = -_1163;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1177 = _1157 * _799;
    float _1179 = _1167 * _1167;
    float _1181 = _1157 * _797;
    float _1183 = _1157 * _795;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1187 = _1177 * _1185;
    float _1189 = fma(_1171, _1171, _1179);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1181 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1197 = _1183 * _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1201 = -_1187;
    float _1203 = fma(_1181, _1199, _1201);
    float _1205 = fma(_1175, _1175, _1189);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = -_1193;
    float _1211 = fma(_1183, _1207, _1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = -_1197;
    float _1217 = fma(_1177, _1213, _1215);
    float _1219 = _1203 * _1203;
    float _1221 = sqrt(_1205);
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1225 = fma(_1217, _1217, _1219);
    float _1227 = fma(_1211, _1211, _1225);
    float _1229 = rsqrt(_1227);
    float _1231 = _1155 * _1221;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1235 = _1097 * _1231;
    float _1237 = _1105 * _1231;
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = _1239 * 0.5;
    float _1243 = _1237 * _1223;
    float _1245 = _1217 * _1229;
    float _1247 = _1203 * _1229;
    float _1249 = _1235 * _1233;
    float _1251 = _1211 * _1229;
    float _1253 = _1181 * _1247;
    float _1255 = _1249 * _1177;
    float _1257 = _1183 * _1251;
    float _1259 = _1249 * _1181;
    float _1261 = -_1253;
    float _1263 = fma(_1183, _1245, _1261);
    float _1265 = fma(_1243, _1251, _1255);
    float _1267 = -_1257;
    float _1269 = fma(_1177, _1247, _1267);
    float _1271 = fma(_1243, _1245, _1259);
    float _1273 = _1177 * _1245;
    float _1275 = fma(_1241, _1263, _1265);
    float _1277 = _1249 * _1183;
    float _1279 = fma(_1241, _1269, _1271);
    float _1281 = -_1273;
    float _1283 = fma(_1181, _1251, _1281);
    float _1285 = _1129 + _1275;
    float _1287 = fma(_1243, _1247, _1277);
    float _1289 = _1127 + _1279;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1293 = _1285 + _1291;
    float _1295 = in.m_54.x;
    float _1297 = in.m_54.y;
    float _1299 = in.m_54.z;
    float _1301 = in.m_54.w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1289 + _1303;
    float _1307 = fma(_1241, _1283, _1287);
    float _1309 = _1293 * _1293;
    float _1311 = _1125 + _1307;
    float _1313 = fma(_1305, _1305, _1309);
    float _1315 = sqrt(_1313);
    bool _1317 = _1297 > 0.5;
    bool _1319 = _1299 > 0.5;
    bool _1321 = _1315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -_193;
    float _1325 = _1317 ? _1323 : _193;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1329 = _1327 != 0;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1333 = _1331 != 0;
    float _1335 = -_197;
    int _1337 = _1319 ? as_type<int>(_1335) : as_type<int>(_197);
    bool _1339 = !_1329;
    float _1341 = _1339 ? _193 : _1325;
    bool _1343 = !_1333;
    float _1345 = _1343 ? _197 : as_type<float>(_1337);
    float _1347 = _1325;
    float _1349 = _1241;
    float _1351 = _1243;
    float _1353 = _1315;
    float _1355 = _1311;
    float _1357 = _1299;
    if (!_1321)
    {
        _1347 = _1289;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1321)
    {
        _1349 = _1285;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1321)
    {
        _1351 = _1311;
    }
    float _1367 = _1351;
    bool _1369 = !_1321;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1315 + _1375;
        float _1379 = _1311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1313);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = fma(_1311, _1389, _1397);
        float _1403 = _1381 * _1399;
        float _1405 = fma(_1305, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1293, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1401;
        _1361 = _1405;
        _1365 = _1407;
        _1353 = _1385;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = _1353;
    float _1417 = -_1159;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1421 = -_1161;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1425 = -_1163;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1435 = _1423 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1439 = _1427 + _1437;
    float _1441 = _1431 * _1431;
    float _1443 = fma(_1435, _1435, _1441);
    float _1445 = fma(_1439, _1439, _1443);
    float _1447 = rsqrt(_1445);
    float _1449 = sqrt(_1445);
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1453 = _1435 * _1451;
    float _1455 = _1439 * _1451;
    float _1457 = _1453 * _1453;
    float _1459 = _1455 * _1455;
    float _1461 = _1457 + _1459;
    float _1463 = sqrt(_1461);
    bool _1465 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = _1463 + _1467;
    float _1471 = _1447;
    float _1473 = _1469;
    float _1475 = _1431;
    float _1477 = _1451;
    if (_1465)
    {
        float _1479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1479;
    }
    float _1481 = _1471;
    float _1483 = _1481;
    if (_1465)
    {
        float _1485 = _1469 * _1481;
        _1473 = _1485;
    }
    float _1487 = _1473;
    if (_1465)
    {
        float _1489 = rsqrt(_1461);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1491;
    if (_1465)
    {
        float _1495 = _1487 * 0.15915493667125701904296875;
        _1355 = _1495;
    }
    float _1497 = _1355;
    float _1499 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1501 = _1439;
    float _1503 = _1497;
    if (_1465)
    {
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1501 = _1507;
    }
    float _1509 = _1501;
    float _1511 = precise::max(0.0, _1499);
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = _1415;
    float _1521 = _1511;
    if (_1465)
    {
        float _1523 = _1497 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1451;
    float _1531 = -_1511;
    float _1533 = fma(_1431, _1529, _1531);
    float _1535 = -_1517;
    float _1537 = _1535 + 1.0;
    if (_1465)
    {
        float _1539 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1475 = _1539;
    }
    float _1541 = _1475;
    float _1543 = abs(_1537);
    float _1545 = log2(_1543);
    float _1547 = _1509;
    float _1549 = _1541;
    if (_1465)
    {
        float _1551 = fma(_1509, _1541, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1465)
    {
        _1549 = _1453;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    if (_1465)
    {
        float _1561 = _1491 * _1553;
        _1477 = _1561;
    }
    float _1563 = _1477;
    if (!_1465)
    {
        _1493 = _1533;
    }
    float _1565 = _1493;
    float _1567 = _1565;
    float _1569 = _1527;
    if (_1465)
    {
        float _1571 = _1527 + (-1.0);
        _1521 = _1571;
    }
    float _1573 = _1521;
    float _1575 = _1573;
    if (_1465)
    {
        float _1577 = _1453 * _1563;
        _1559 = _1577;
    }
    float _1579 = _1559;
    if (!_1465)
    {
        _1555 = _1455;
    }
    float _1581 = _1555;
    float _1583 = _1581;
    if (_1465)
    {
        float _1585 = _1455 * _1563;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (_1465)
    {
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1589;
    }
    float _1591 = _1503;
    if (!_1465)
    {
        _1575 = _1457;
    }
    float _1593 = _1575;
    float _1595 = _1593;
    if (_1465)
    {
        float _1597 = _1579 * _1579;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1465)
    {
        float _1603 = fma(_1533, _1527, _1591);
        _1567 = _1603;
    }
    float _1605 = _1567;
    float _1607 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1609 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1465)
    {
        _1569 = _1459;
    }
    float _1611 = _1569;
    float _1613 = _1611;
    if (_1465)
    {
        float _1615 = _1587 * _1587;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1607);
    float _1621 = fma(_1605, _1605, _1599);
    float _1623 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1625 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1627 = _1621 + _1617;
    float _1629 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1623);
    float _1631 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1635 = rsqrt(_1627);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1641 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1643 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1645 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1641);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1647);
    float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1657 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1635 * _1579;
    float _1663 = _1635 * _1587;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1667 = _1635 * _1605;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1671 = -_1655;
    float _1673 = fma(_1671, _1637, 1.0);
    float _1675 = 1.0 / _1665;
    float _1677 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1669;
    float _1681 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1679);
    float _1683 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = -_1663;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1681);
    float _1691 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1673);
    float _1695 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1697 = fma(_1689, -0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1701 = fma(_1689, 0.5, 0.5);
    float _1703 = _1667 + 1.0;
    float _1705 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1707 = exp2(_1683);
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1705);
    float _1713 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1695);
    float _1715 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1717 = _1711 * _1675;
    float _1719 = sqrt(_1697);
    float _1721 = fma(_1701, _1715, 1.570728778839111328125);
    float _1723 = _1693 * 0.693147182464599609375;
    float _1725 = fma(_1717, 0.5, 0.5);
    float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1729 = -_1667;
    float _1731 = fma(_1707, _1703, _1729);
    float _1733 = _1713 * _1675;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1719 * 0.636619746685028076171875;
    float _1741 = -_1721;
    float _1743 = fma(_1739, _1741, 1.0);
    float3 _5447 = float3(_1725, _1737, _1727);
    float _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1725, _1737, _1727);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _5475 = float2(_1743, _1735);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1055 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1782 = _1301 > 0.5;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1788 = 1.0 / _1776;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1800 = 1.0 / _1780;
    float _1802 = -_197;
    int _1804 = _1782 ? as_type<int>(_1802) : as_type<int>(_197);
    float _1806 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1816 = _1814 != 0;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1824 = _1822 != 0;
    float _1826 = 1.0 / _1786;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = fma(_1806, -2.0, _1798);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1836 = _1057 + _1834;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1840 = _1838 != 0;
    float _1842 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1844 = 1.0 / _1796;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1850 = -_1812;
    float _1852 = fma(_1842, 2.0, _1850);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = 1.0 / _1792;
    float _1868 = _1860 * _1800;
    float _1870 = _1864 * _1788;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1882 = _1880 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1884 = 1.0 / _1820;
    float _1886 = fma(_1870, _1772, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1892 = _1057 + _1890;
    bool _1894 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1896 = isnan(_1055);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1832);
    bool _1908 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1910 = isnan(_1055);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = -_1345;
    float _1922 = _1920 + 0.5;
    float _1924 = 1.0 / _1848;
    float _1926 = _1874 * _1866;
    float _1928 = -_1159;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    bool _1932 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1934 = isnan(_1057);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = fma(_1926, _1836, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1948 = _1946 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1950 = 1.0 / _1856;
    float _1952 = _1882 * _1884;
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1960 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1962 = isnan(_1057);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = -_1161;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1976 = _1341 + 0.5;
    float _1978 = 1.0 / _1948;
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1982 = _1980 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = _1982 * _1826;
    float _1988 = _1878 * _1844;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1998 = fma(_1988, _1892, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2000 = _1992 * _1950;
    float _2002 = _1996 * _1924;
    float _2004 = -_197;
    int _2006 = _1317 ? as_type<int>(_2004) : as_type<int>(_197);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = _1992;
    float _2012 = _1950;
    if (!_1840)
    {
        _2010 = _1297;
    }
    float _2014 = _2010;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2018 = _1057 + _2016;
    bool _2020 = _1295 > 0.5;
    float _2022 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    float _2024 = _2014;
    if (!_1840)
    {
        _2012 = _1299;
    }
    float _2026 = _2012;
    float _2028 = fma(_2000, _2018, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2030 = _2026;
    if (_1840)
    {
        _2024 = _1295;
    }
    float _2032 = _2024;
    float _2034 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    if (_1840)
    {
        _1357 = _1297;
    }
    float _2036 = _1357;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1840)
    {
        _2030 = _1297;
    }
    float _2040 = _2030;
    float _2042 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2044 = !_1816;
    float _2046 = _2044 ? _197 : as_type<float>(_2006);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2050 = !_1824;
    float _2052 = _2050 ? _197 : as_type<float>(_1804);
    float _2054 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2056 = _1055 + _2054;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1958);
    float _2060 = -_193;
    int _2062 = _2020 ? as_type<int>(_2060) : as_type<int>(_193);
    float _2064 = fma(_1868, _2056, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2068 = _1057 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2070;
    bool _2074 = !_1810;
    float _2076 = _2074 ? _193 : as_type<float>(_2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2080 = _1057 + _2078;
    float _2082 = fma(_1986, _2068, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2086 = _1057 + _2084;
    float _2088 = _2072 * _1978;
    float _2090 = fma(_2002, _2080, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2092 = -_121;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1852);
    float _2096 = fma(_1952, _2086, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2100 = _1057 + _2098;
    float _2102 = _2076 + 0.5;
    bool _2104 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2106 = isnan(_1057);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2118 = fma(_2088, _2100, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2120 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2122 = isnan(_1057);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2042, _2102, _2094);
    bool _2134 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2136 = isnan(_1055);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = -_2114;
    float _2148 = _2146 + 1.0;
    float _2150 = -_193;
    int _2152 = _1319 ? as_type<int>(_2150) : as_type<int>(_193);
    float _2154 = -_2130;
    float _2156 = _2154 + 1.0;
    bool _2158 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2160 = isnan(_1057);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _1942 * _2148;
    bool _2172 = !_1830;
    float _2174 = _2172 ? _193 : as_type<float>(_2152);
    float _2176 = _2114 * _2156;
    float _2178 = -_1904;
    float _2180 = _2178 + 1.0;
    bool _2182 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2184 = isnan(_1057);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = -_2144;
    float _2196 = _2194 + 1.0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2200 = _2144 * _2180;
    float _2202 = _2046 + (-0.5);
    float _2204 = _2168 * _1956;
    float _2206 = -_2168;
    float _2208 = _2206 + 1.0;
    float _2210 = _1918 * _2196;
    float _2212 = -_2116;
    float _2214 = -_1906;
    float _2216 = fma(_2212, _2202, _2214);
    bool _2218 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2220 = isnan(_1057);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2192;
    float _2232 = _2230 + 1.0;
    float _2234 = _2192 * _2208;
    float _2236 = _2064 * _2210;
    bool _2238 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2240 = isnan(_1057);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2258 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2058);
    float _2260 = _2248 * _2254;
    float _2262 = -_2248;
    float _2264 = _2262 + 1.0;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2268 = -_1163;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2272 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2274 = _1970 * _2264;
    float _2276 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2266);
    float _2278 = -_1970;
    float _2280 = _2278 + 1.0;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2284 = _1944 * _2274;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2288 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2290 = -_1984;
    float _2292 = fma(_2048, 2.0, _2290);
    float _2294 = -_1918;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2300 = fma(_2288, -2.0, _2286);
    float _2302 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2284);
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2034);
    float _2308 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2276);
    float _2310 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2312 = -_121;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2292);
    float _2316 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2236);
    float _2318 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2300);
    float _2320 = _2052 + (-0.5);
    float _2322 = fma(_2082, _2260, _2302);
    float _2324 = fma(_1886, _2200, _2316);
    float _2326 = _2272 * _2256;
    float _2328 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2330 = _2174 + 0.5;
    float _2332 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2324);
    float _2334 = fma(_1998, _2250, _2322);
    float _2336 = _2310 * _2282;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2342 = fma(_2328, _2330, _2314);
    float _2344 = -_2308;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2338;
    float _2350 = -_2318;
    float _2352 = fma(_2348, _2320, _2350);
    float _2354 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2356 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.w = _2340;
    float _2358 = fma(_2096, _2234, _2334);
    float _2360 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2354);
    float _2362 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2364 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2368 = isnan(0.5);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2374 = _2370 || _2372;
    float _2376 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2360);
    out.m_60.x = _2326;
    out.m_60.y = _2336;
    float _2378 = fma(_2028, _2204, _2358);
    float _2380 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2362);
    float _2382 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = -_2298;
    float _2388 = _2386 + 1.0;
    float _2390 = -_2306;
    float _2392 = _2390 + 1.0;
    float _2394 = 1.0 / _2382;
    float _2396 = -_2258;
    float _2398 = _2396 + 1.0;
    float _2400 = fma(_2090, _2170, _2378);
    float _2402 = -_2346;
    float _2404 = fma(_2174, _2402, _2342);
    float _2406 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2410 = -_2388;
    float _2412 = fma(_2076, _2410, _2132);
    float _2414 = fma(_2046, _2392, _2216);
    float _2416 = exp2(_2364);
    float _2418 = fma(_2052, _2398, _2352);
    float _2420 = fma(_2118, _2176, _2400);
    float _2422 = _2406 + _2382;
    float _2424 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    out.m_62.x = _2412;
    out.m_62.y = _2414;
    out.m_62.z = _2404;
    out.m_62.w = _2418;
    float _2426 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2420);
    float _2428 = _2422 * _2394;
    float _2430 = _2428 * 0.5;
    float _2432 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = _2412;
    if (_2374)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    float _2438 = _2436;
    if (!_2374)
    {
        float _2440 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2450 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2448);
        float _2452 = _2444 * 6.283185482025146484375;
        float _2454 = cos(_2452);
        float _2456 = _2444 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        float _2460 = 1.0 / _2454;
        float _2462 = _2446 * 6.283185482025146484375;
        float _2464 = cos(_2462);
        float _2466 = _2458 * _2460;
        float _2468 = _2446 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2464 * _2466;
        float _2474 = 1.0 / _2450;
        float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2478 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2476;
        float _2480 = 1.0 / _2472;
        float _2482 = 1.0 / _2478;
        float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2486 = _2474 * _2484;
        float _2488 = _2470 * _2480;
        float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2492 = fma(_2488, _2486, _2490);
        float _2494 = _2492 * _2482;
        float _2496 = precise::clamp(_2494, 0.0, 1.0);
        _2438 = _2496;
    }
    float _2498 = _2438;
    float _2500 = _2432 + _1665;
    float _2502 = -_2416;
    float _2504 = _2502 + 1.0;
    bool _2506 = _2498 > 0.0;
    bool _2508 = isnan(_2498);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan(0.0);
    bool _2514 = _2510 || _2512;
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2518 = _2500 * 0.5;
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = _2520 * _1745;
    float _2526 = -_2520;
    float _2528 = _2526 + 1.0;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _1665;
    float _2530 = _1756 * _2524;
    float _2532 = _1766 * _2524;
    float _2534 = _1756 * _2528;
    out.m_64.x = _2426;
    float _2536 = fma(_1762, _2530, _1750);
    float _2538 = fma(_1764, _2530, _1752);
    float _2540 = fma(_1756, _2532, _1754);
    out.m_66.z = _2518;
    out.m_66.w = _1665;
    out.m_45.x = _2522;
    out.m_68.x = _2536;
    out.m_68.y = _2538;
    out.m_68.z = _2540;
    out.m_68.w = _2534;
    if (_2514)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2542;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2599 = as_type<float>(_103);
        out.gl_Position.z = _2599;
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
        float _2668 = as_type<float>(_139);
        out.gl_Position.z = _2668;
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
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _165);
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _179 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _177);
    float _181 = _177;
    float _183 = _143;
    if (!_159)
    {
        float _185 = _143 * _143;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_159)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_159;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _143 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _143);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _143 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _183 = _263;
    }
    float _265 = _183;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _271;
    if (!_159)
    {
        float _275 = _121 * _121;
        float _277 = _275 * 0.5;
        _243 = _277;
    }
    float _279 = _243;
    float _281 = fma(_265, _145, _267);
    float _283 = fma(_265, _147, _269);
    float _285 = fma(_265, _149, _271);
    float _287 = _279;
    if (!_159)
    {
        float _289 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _289;
    }
    float _291 = _287;
    bool _293 = !_159;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _121);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _273 = _313;
    }
    float _327 = _295;
    float _329 = _273;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_159)
    {
        _333 = _121;
    }
    float _335 = _333;
    bool _337 = !_159;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _121 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _147, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _145, _363);
    float _371 = -_365;
    float _373 = _283 + _371;
    float _375 = fma(_361, _149, _367);
    float _377 = sqrt(_179);
    float _379 = -_369;
    float _381 = _281 + _379;
    float _383 = _373 * _373;
    float _385 = -_375;
    float _387 = _285 + _385;
    float _389 = fma(_381, _381, _383);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = sqrt(_167);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _397 = fma(_387, _387, _389);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = in.m_52.w;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _395);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = sqrt(_397);
    float _411 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _413 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = in.m_42.z;
    float _421 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _423 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _411);
    float _425 = sqrt(_407);
    float _427 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _429 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _423);
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _421);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _405);
    float _435 = _393 * _427;
    float _437 = _377 * _429;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_409);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _425 * _433;
    float _465 = fma(_281, _403, _415);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_283, _403, _417);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_285, _403, _419);
    float _483 = _471;
    float _485 = _439;
    float _487 = _479;
    if (_449)
    {
        _483 = _475;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _477;
    }
    float _493 = _485;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _521 = _393 * _513;
            float _523 = _377 * _515;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _517);
            float _527 = _425 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _525);
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _487 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _147 * _147;
            float _575 = fma(_145, _145, _573);
            float _577 = fma(_149, _149, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _417 * _417;
                float _593 = fma(_415, _415, _591);
                float _595 = fma(_419, _419, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _393 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _425 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _487 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _677 = _393 * _671;
                    float _679 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _681 = _377 * _673;
                    float _683 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _687 = _425 * _679;
                    float _689 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _487 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _747 = _393 * _741;
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _751 = _377 * _743;
                float _753 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _755 = _425 * _749;
                float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _487 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _487;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_87);
        float _827 = 1.0 / _825;
        float _829 = _121 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _841;
    float _845 = 1.0 / _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = 1.0 / _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = _831 + _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _867 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _869 = 1.0 / _843;
    float _871 = _859 * _845;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _831 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _879 = _831 + _877;
    out.m_56.x = _853;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _861;
    bool _881 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _883 = isnan(_831);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _875 * _855;
    bool _895 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _897 = isnan(_831);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _907;
    float _911 = fma(_909, _871, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _917 = _879 * _869;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    bool _927 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _929 = isnan(_831);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_921, _871, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = _891 * _925;
    bool _943 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _945 = isnan(_831);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -_891;
    float _957 = _955 + 1.0;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _963 = -_937;
    float _965 = _963 + 1.0;
    float _967 = _937 * _957;
    float _969 = fma(_961, _893, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _971 = fma(_915, _893, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _973 = _953 * _965;
    float _975 = in.m_52.x;
    float _977 = in.m_52.y;
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = _911 * _973;
    float _985 = _939 * _973;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].x, _983);
    float _997 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _999 = fma(_989, _917, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1001 = fma(_993, _917, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1003 = fma(_969, _967, _995);
    float _1005 = fma(_971, _967, _997);
    float _1007 = fma(_999, _941, _1003);
    float _1009 = fma(_1001, _941, _1005);
    float _1011 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1007);
    float _1013 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1009);
    float _1015 = _1011 * _975;
    float _1017 = _1013 * _977;
    bool _1019 = !_867;
    float _1043;
    float _1045;
    if (!_1019)
    {
        float _1021 = in.m_54.x;
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1025 = float(_87);
        float _1027 = 1.0 / _1025;
        float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1031 = _121 * _1027;
        float _1033 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1035 = _1033 * _1023;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = _1031;
        _1047 = true;
    }
    else
    {
        float _1049 = float(_87);
        float _1051 = 1.0 / _1049;
        float _1053 = _121 * _1051;
        _1043 = _1053;
        _1045 = _1053;
    }
    _1047 = false;
    float _1055 = _1043;
    float _1057 = _1045;
    float _1059 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1061 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1063 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1065 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1067 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1059);
    float _1069 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1061);
    float _1071 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1063);
    float _1073 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1065);
    float _1075 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1067);
    float _1077 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1069);
    float _1079 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1071);
    float _1081 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1091 = _393 * _1083;
    float _1093 = _377 * _1085;
    float _1095 = _425 * _1087;
    float _1097 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1119 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1113);
    float _1121 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1115);
    float _1123 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1117);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1127 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1125 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1127 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = _795 * _795;
    float _1149 = fma(_1141, _1141, _1145);
    float _1151 = fma(_797, _797, _1147);
    float _1153 = fma(_799, _799, _1151);
    float _1155 = rsqrt(_1149);
    float _1157 = rsqrt(_1153);
    float _1159 = _1133 * _1155;
    float _1161 = _1137 * _1155;
    float _1163 = _1141 * _1155;
    float _1165 = -_1159;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1133);
    float _1169 = -_1161;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1173 = -_1163;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1177 = _1157 * _799;
    float _1179 = _1167 * _1167;
    float _1181 = _1157 * _797;
    float _1183 = _1157 * _795;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1187 = _1177 * _1185;
    float _1189 = fma(_1171, _1171, _1179);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1181 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1197 = _1183 * _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1201 = -_1187;
    float _1203 = fma(_1181, _1199, _1201);
    float _1205 = fma(_1175, _1175, _1189);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = -_1193;
    float _1211 = fma(_1183, _1207, _1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = -_1197;
    float _1217 = fma(_1177, _1213, _1215);
    float _1219 = _1203 * _1203;
    float _1221 = sqrt(_1205);
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1225 = fma(_1217, _1217, _1219);
    float _1227 = fma(_1211, _1211, _1225);
    float _1229 = rsqrt(_1227);
    float _1231 = _1155 * _1221;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1235 = _1097 * _1231;
    float _1237 = _1105 * _1231;
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = _1239 * 0.5;
    float _1243 = _1237 * _1223;
    float _1245 = _1217 * _1229;
    float _1247 = _1203 * _1229;
    float _1249 = _1235 * _1233;
    float _1251 = _1211 * _1229;
    float _1253 = _1181 * _1247;
    float _1255 = _1249 * _1177;
    float _1257 = _1183 * _1251;
    float _1259 = _1249 * _1181;
    float _1261 = -_1253;
    float _1263 = fma(_1183, _1245, _1261);
    float _1265 = fma(_1243, _1251, _1255);
    float _1267 = -_1257;
    float _1269 = fma(_1177, _1247, _1267);
    float _1271 = fma(_1243, _1245, _1259);
    float _1273 = _1177 * _1245;
    float _1275 = fma(_1241, _1263, _1265);
    float _1277 = _1249 * _1183;
    float _1279 = fma(_1241, _1269, _1271);
    float _1281 = -_1273;
    float _1283 = fma(_1181, _1251, _1281);
    float _1285 = _1129 + _1275;
    float _1287 = fma(_1243, _1247, _1277);
    float _1289 = _1127 + _1279;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1293 = _1285 + _1291;
    float _1295 = in.m_54.x;
    float _1297 = in.m_54.y;
    float _1299 = in.m_54.z;
    float _1301 = in.m_54.w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1289 + _1303;
    float _1307 = fma(_1241, _1283, _1287);
    float _1309 = _1293 * _1293;
    float _1311 = _1125 + _1307;
    float _1313 = fma(_1305, _1305, _1309);
    float _1315 = sqrt(_1313);
    bool _1317 = _1297 > 0.5;
    bool _1319 = _1299 > 0.5;
    bool _1321 = _1315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -_193;
    float _1325 = _1317 ? _1323 : _193;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1329 = _1327 != 0;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1333 = _1331 != 0;
    float _1335 = -_197;
    int _1337 = _1319 ? as_type<int>(_1335) : as_type<int>(_197);
    bool _1339 = !_1329;
    float _1341 = _1339 ? _193 : _1325;
    bool _1343 = !_1333;
    float _1345 = _1343 ? _197 : as_type<float>(_1337);
    float _1347 = _1325;
    float _1349 = _1241;
    float _1351 = _1243;
    float _1353 = _1315;
    float _1355 = _1311;
    float _1357 = _1299;
    if (!_1321)
    {
        _1347 = _1289;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1321)
    {
        _1349 = _1285;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1321)
    {
        _1351 = _1311;
    }
    float _1367 = _1351;
    bool _1369 = !_1321;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1315 + _1375;
        float _1379 = _1311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1313);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = fma(_1311, _1389, _1397);
        float _1403 = _1381 * _1399;
        float _1405 = fma(_1305, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1293, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1401;
        _1361 = _1405;
        _1365 = _1407;
        _1353 = _1385;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = _1353;
    float _1417 = -_1159;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1421 = -_1161;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1425 = -_1163;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1435 = _1423 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1439 = _1427 + _1437;
    float _1441 = _1431 * _1431;
    float _1443 = fma(_1435, _1435, _1441);
    float _1445 = fma(_1439, _1439, _1443);
    float _1447 = rsqrt(_1445);
    float _1449 = sqrt(_1445);
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1453 = _1435 * _1451;
    float _1455 = _1439 * _1451;
    float _1457 = _1453 * _1453;
    float _1459 = _1455 * _1455;
    float _1461 = _1457 + _1459;
    float _1463 = sqrt(_1461);
    bool _1465 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = _1463 + _1467;
    float _1471 = _1447;
    float _1473 = _1469;
    float _1475 = _1431;
    float _1477 = _1451;
    if (_1465)
    {
        float _1479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1479;
    }
    float _1481 = _1471;
    float _1483 = _1481;
    if (_1465)
    {
        float _1485 = _1469 * _1481;
        _1473 = _1485;
    }
    float _1487 = _1473;
    if (_1465)
    {
        float _1489 = rsqrt(_1461);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1491;
    if (_1465)
    {
        float _1495 = _1487 * 0.15915493667125701904296875;
        _1355 = _1495;
    }
    float _1497 = _1355;
    float _1499 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1501 = _1439;
    float _1503 = _1497;
    if (_1465)
    {
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1501 = _1507;
    }
    float _1509 = _1501;
    float _1511 = precise::max(0.0, _1499);
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = _1415;
    float _1521 = _1511;
    if (_1465)
    {
        float _1523 = _1497 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1451;
    float _1531 = -_1511;
    float _1533 = fma(_1431, _1529, _1531);
    float _1535 = -_1517;
    float _1537 = _1535 + 1.0;
    if (_1465)
    {
        float _1539 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1475 = _1539;
    }
    float _1541 = _1475;
    float _1543 = abs(_1537);
    float _1545 = log2(_1543);
    float _1547 = _1509;
    float _1549 = _1541;
    if (_1465)
    {
        float _1551 = fma(_1509, _1541, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1465)
    {
        _1549 = _1453;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    if (_1465)
    {
        float _1561 = _1491 * _1553;
        _1477 = _1561;
    }
    float _1563 = _1477;
    if (!_1465)
    {
        _1493 = _1533;
    }
    float _1565 = _1493;
    float _1567 = _1565;
    float _1569 = _1527;
    if (_1465)
    {
        float _1571 = _1527 + (-1.0);
        _1521 = _1571;
    }
    float _1573 = _1521;
    float _1575 = _1573;
    if (_1465)
    {
        float _1577 = _1453 * _1563;
        _1559 = _1577;
    }
    float _1579 = _1559;
    if (!_1465)
    {
        _1555 = _1455;
    }
    float _1581 = _1555;
    float _1583 = _1581;
    if (_1465)
    {
        float _1585 = _1455 * _1563;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (_1465)
    {
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1589;
    }
    float _1591 = _1503;
    if (!_1465)
    {
        _1575 = _1457;
    }
    float _1593 = _1575;
    float _1595 = _1593;
    if (_1465)
    {
        float _1597 = _1579 * _1579;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1465)
    {
        float _1603 = fma(_1533, _1527, _1591);
        _1567 = _1603;
    }
    float _1605 = _1567;
    float _1607 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1609 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1465)
    {
        _1569 = _1459;
    }
    float _1611 = _1569;
    float _1613 = _1611;
    if (_1465)
    {
        float _1615 = _1587 * _1587;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1607);
    float _1621 = fma(_1605, _1605, _1599);
    float _1623 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1625 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1627 = _1621 + _1617;
    float _1629 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1623);
    float _1631 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1635 = rsqrt(_1627);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1641 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1643 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1645 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1641);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1647);
    float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1657 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1635 * _1579;
    float _1663 = _1635 * _1587;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1667 = _1635 * _1605;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1671 = -_1655;
    float _1673 = fma(_1671, _1637, 1.0);
    float _1675 = 1.0 / _1665;
    float _1677 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1669;
    float _1681 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1679);
    float _1683 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = -_1663;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1681);
    float _1691 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1673);
    float _1695 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1697 = fma(_1689, -0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1701 = fma(_1689, 0.5, 0.5);
    float _1703 = _1667 + 1.0;
    float _1705 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1707 = exp2(_1683);
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1705);
    float _1713 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1695);
    float _1715 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1717 = _1711 * _1675;
    float _1719 = sqrt(_1697);
    float _1721 = fma(_1701, _1715, 1.570728778839111328125);
    float _1723 = _1693 * 0.693147182464599609375;
    float _1725 = fma(_1717, 0.5, 0.5);
    float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1729 = -_1667;
    float _1731 = fma(_1707, _1703, _1729);
    float _1733 = _1713 * _1675;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1719 * 0.636619746685028076171875;
    float _1741 = -_1721;
    float _1743 = fma(_1739, _1741, 1.0);
    float3 _5447 = float3(_1725, _1737, _1727);
    float _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1725, _1737, _1727);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _5475 = float2(_1743, _1735);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1055 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1782 = _1301 > 0.5;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1788 = 1.0 / _1776;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1800 = 1.0 / _1780;
    float _1802 = -_197;
    int _1804 = _1782 ? as_type<int>(_1802) : as_type<int>(_197);
    float _1806 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1816 = _1814 != 0;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1824 = _1822 != 0;
    float _1826 = 1.0 / _1786;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = fma(_1806, -2.0, _1798);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1836 = _1057 + _1834;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1840 = _1838 != 0;
    float _1842 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1844 = 1.0 / _1796;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1850 = -_1812;
    float _1852 = fma(_1842, 2.0, _1850);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = 1.0 / _1792;
    float _1868 = _1860 * _1800;
    float _1870 = _1864 * _1788;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1882 = _1880 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1884 = 1.0 / _1820;
    float _1886 = fma(_1870, _1772, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1892 = _1057 + _1890;
    bool _1894 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1896 = isnan(_1055);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1832);
    bool _1908 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1910 = isnan(_1055);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = -_1345;
    float _1922 = _1920 + 0.5;
    float _1924 = 1.0 / _1848;
    float _1926 = _1874 * _1866;
    float _1928 = -_1159;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    bool _1932 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1934 = isnan(_1057);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = fma(_1926, _1836, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1948 = _1946 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1950 = 1.0 / _1856;
    float _1952 = _1882 * _1884;
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1960 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1962 = isnan(_1057);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = -_1161;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1976 = _1341 + 0.5;
    float _1978 = 1.0 / _1948;
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1982 = _1980 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = _1982 * _1826;
    float _1988 = _1878 * _1844;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1998 = fma(_1988, _1892, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2000 = _1992 * _1950;
    float _2002 = _1996 * _1924;
    float _2004 = -_197;
    int _2006 = _1317 ? as_type<int>(_2004) : as_type<int>(_197);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = _1992;
    float _2012 = _1950;
    if (!_1840)
    {
        _2010 = _1297;
    }
    float _2014 = _2010;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2018 = _1057 + _2016;
    bool _2020 = _1295 > 0.5;
    float _2022 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    float _2024 = _2014;
    if (!_1840)
    {
        _2012 = _1299;
    }
    float _2026 = _2012;
    float _2028 = fma(_2000, _2018, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2030 = _2026;
    if (_1840)
    {
        _2024 = _1295;
    }
    float _2032 = _2024;
    float _2034 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    if (_1840)
    {
        _1357 = _1297;
    }
    float _2036 = _1357;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1840)
    {
        _2030 = _1297;
    }
    float _2040 = _2030;
    float _2042 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2044 = !_1816;
    float _2046 = _2044 ? _197 : as_type<float>(_2006);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2050 = !_1824;
    float _2052 = _2050 ? _197 : as_type<float>(_1804);
    float _2054 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2056 = _1055 + _2054;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1958);
    float _2060 = -_193;
    int _2062 = _2020 ? as_type<int>(_2060) : as_type<int>(_193);
    float _2064 = fma(_1868, _2056, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2068 = _1057 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2070;
    bool _2074 = !_1810;
    float _2076 = _2074 ? _193 : as_type<float>(_2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2080 = _1057 + _2078;
    float _2082 = fma(_1986, _2068, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2086 = _1057 + _2084;
    float _2088 = _2072 * _1978;
    float _2090 = fma(_2002, _2080, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2092 = -_121;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1852);
    float _2096 = fma(_1952, _2086, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2100 = _1057 + _2098;
    float _2102 = _2076 + 0.5;
    bool _2104 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2106 = isnan(_1057);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2118 = fma(_2088, _2100, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2120 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2122 = isnan(_1057);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2042, _2102, _2094);
    bool _2134 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2136 = isnan(_1055);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = -_2114;
    float _2148 = _2146 + 1.0;
    float _2150 = -_193;
    int _2152 = _1319 ? as_type<int>(_2150) : as_type<int>(_193);
    float _2154 = -_2130;
    float _2156 = _2154 + 1.0;
    bool _2158 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2160 = isnan(_1057);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _1942 * _2148;
    bool _2172 = !_1830;
    float _2174 = _2172 ? _193 : as_type<float>(_2152);
    float _2176 = _2114 * _2156;
    float _2178 = -_1904;
    float _2180 = _2178 + 1.0;
    bool _2182 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2184 = isnan(_1057);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = -_2144;
    float _2196 = _2194 + 1.0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2200 = _2144 * _2180;
    float _2202 = _2046 + (-0.5);
    float _2204 = _2168 * _1956;
    float _2206 = -_2168;
    float _2208 = _2206 + 1.0;
    float _2210 = _1918 * _2196;
    float _2212 = -_2116;
    float _2214 = -_1906;
    float _2216 = fma(_2212, _2202, _2214);
    bool _2218 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2220 = isnan(_1057);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2192;
    float _2232 = _2230 + 1.0;
    float _2234 = _2192 * _2208;
    float _2236 = _2064 * _2210;
    bool _2238 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2240 = isnan(_1057);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2258 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2058);
    float _2260 = _2248 * _2254;
    float _2262 = -_2248;
    float _2264 = _2262 + 1.0;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2268 = -_1163;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2272 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2274 = _1970 * _2264;
    float _2276 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2266);
    float _2278 = -_1970;
    float _2280 = _2278 + 1.0;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2284 = _1944 * _2274;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2288 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2290 = -_1984;
    float _2292 = fma(_2048, 2.0, _2290);
    float _2294 = -_1918;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2300 = fma(_2288, -2.0, _2286);
    float _2302 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2284);
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2034);
    float _2308 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2276);
    float _2310 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2312 = -_121;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2292);
    float _2316 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2236);
    float _2318 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2300);
    float _2320 = _2052 + (-0.5);
    float _2322 = fma(_2082, _2260, _2302);
    float _2324 = fma(_1886, _2200, _2316);
    float _2326 = _2272 * _2256;
    float _2328 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2330 = _2174 + 0.5;
    float _2332 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2324);
    float _2334 = fma(_1998, _2250, _2322);
    float _2336 = _2310 * _2282;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2342 = fma(_2328, _2330, _2314);
    float _2344 = -_2308;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2338;
    float _2350 = -_2318;
    float _2352 = fma(_2348, _2320, _2350);
    float _2354 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2356 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.w = _2340;
    float _2358 = fma(_2096, _2234, _2334);
    float _2360 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2354);
    float _2362 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2364 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2368 = isnan(0.5);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2374 = _2370 || _2372;
    float _2376 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2360);
    out.m_60.x = _2326;
    out.m_60.y = _2336;
    float _2378 = fma(_2028, _2204, _2358);
    float _2380 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2362);
    float _2382 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = -_2298;
    float _2388 = _2386 + 1.0;
    float _2390 = -_2306;
    float _2392 = _2390 + 1.0;
    float _2394 = 1.0 / _2382;
    float _2396 = -_2258;
    float _2398 = _2396 + 1.0;
    float _2400 = fma(_2090, _2170, _2378);
    float _2402 = -_2346;
    float _2404 = fma(_2174, _2402, _2342);
    float _2406 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2410 = -_2388;
    float _2412 = fma(_2076, _2410, _2132);
    float _2414 = fma(_2046, _2392, _2216);
    float _2416 = exp2(_2364);
    float _2418 = fma(_2052, _2398, _2352);
    float _2420 = fma(_2118, _2176, _2400);
    float _2422 = _2406 + _2382;
    float _2424 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    out.m_62.x = _2412;
    out.m_62.y = _2414;
    out.m_62.z = _2404;
    out.m_62.w = _2418;
    float _2426 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2420);
    float _2428 = _2422 * _2394;
    float _2430 = _2428 * 0.5;
    float _2432 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = _2412;
    if (_2374)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    float _2438 = _2436;
    if (!_2374)
    {
        float _2440 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2450 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2448);
        float _2452 = _2444 * 6.283185482025146484375;
        float _2454 = cos(_2452);
        float _2456 = _2444 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        float _2460 = 1.0 / _2454;
        float _2462 = _2446 * 6.283185482025146484375;
        float _2464 = cos(_2462);
        float _2466 = _2458 * _2460;
        float _2468 = _2446 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2464 * _2466;
        float _2474 = 1.0 / _2450;
        float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2478 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2476;
        float _2480 = 1.0 / _2472;
        float _2482 = 1.0 / _2478;
        float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2486 = _2474 * _2484;
        float _2488 = _2470 * _2480;
        float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2492 = fma(_2488, _2486, _2490);
        float _2494 = _2492 * _2482;
        float _2496 = precise::clamp(_2494, 0.0, 1.0);
        _2438 = _2496;
    }
    float _2498 = _2438;
    float _2500 = _2432 + _1665;
    float _2502 = -_2416;
    float _2504 = _2502 + 1.0;
    bool _2506 = _2498 > 0.0;
    bool _2508 = isnan(_2498);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan(0.0);
    bool _2514 = _2510 || _2512;
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2518 = _2500 * 0.5;
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = _2520 * _1745;
    float _2526 = -_2520;
    float _2528 = _2526 + 1.0;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _1665;
    float _2530 = _1756 * _2524;
    float _2532 = _1766 * _2524;
    float _2534 = _1756 * _2528;
    out.m_64.x = _2426;
    float _2536 = fma(_1762, _2530, _1750);
    float _2538 = fma(_1764, _2530, _1752);
    float _2540 = fma(_1756, _2532, _1754);
    out.m_66.z = _2518;
    out.m_66.w = _1665;
    out.m_45.x = _2522;
    out.m_68.x = _2536;
    out.m_68.y = _2538;
    out.m_68.z = _2540;
    out.m_68.w = _2534;
    if (_2514)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2542;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2599 = as_type<float>(_103);
        out.gl_Position.z = _2599;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2668 = as_type<float>(_139);
        out.gl_Position.z = _2668;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _167 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _165);
    int _169 = as_type<int>(_141) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_141) & 2;
    bool _175 = _173 != 0;
    float _177 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _161);
    float _179 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _177);
    float _181 = _177;
    float _183 = _143;
    if (!_159)
    {
        float _185 = _143 * _143;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_171;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_159)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_159;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _143 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _143);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _143 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _183 = _263;
    }
    float _265 = _183;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _271;
    if (!_159)
    {
        float _275 = _121 * _121;
        float _277 = _275 * 0.5;
        _243 = _277;
    }
    float _279 = _243;
    float _281 = fma(_265, _145, _267);
    float _283 = fma(_265, _147, _269);
    float _285 = fma(_265, _149, _271);
    float _287 = _279;
    if (!_159)
    {
        float _289 = _279 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _289;
    }
    float _291 = _287;
    bool _293 = !_159;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _121);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _273 = _313;
    }
    float _327 = _295;
    float _329 = _273;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_159)
    {
        _333 = _121;
    }
    float _335 = _333;
    bool _337 = !_159;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _121 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _147, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_361, _145, _363);
    float _371 = -_365;
    float _373 = _283 + _371;
    float _375 = fma(_361, _149, _367);
    float _377 = sqrt(_179);
    float _379 = -_369;
    float _381 = _281 + _379;
    float _383 = _373 * _373;
    float _385 = -_375;
    float _387 = _285 + _385;
    float _389 = fma(_381, _381, _383);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = sqrt(_167);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _397 = fma(_387, _387, _389);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = in.m_52.w;
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _395);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = sqrt(_397);
    float _411 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _413 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _415 = in.m_42.x;
    float _417 = in.m_42.y;
    float _419 = in.m_42.z;
    float _421 = _373 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _423 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _411);
    float _425 = sqrt(_407);
    float _427 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _413);
    float _429 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _423);
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _421);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _405);
    float _435 = _393 * _427;
    float _437 = _377 * _429;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_409);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _425 * _433;
    float _465 = fma(_281, _403, _415);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_283, _403, _417);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_285, _403, _419);
    float _483 = _471;
    float _485 = _439;
    float _487 = _479;
    if (_449)
    {
        _483 = _475;
    }
    float _489 = _483;
    float _491 = _489;
    if (_449)
    {
        _485 = _477;
    }
    float _493 = _485;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _521 = _393 * _513;
            float _523 = _377 * _515;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _517);
            float _527 = _425 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _525);
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _543 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _487 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _147 * _147;
            float _575 = fma(_145, _145, _573);
            float _577 = fma(_149, _149, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _417 * _417;
                float _593 = fma(_415, _415, _591);
                float _595 = fma(_419, _419, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _393 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _377 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _425 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _487 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _417 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _677 = _393 * _671;
                    float _679 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _681 = _377 * _673;
                    float _683 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _687 = _425 * _679;
                    float _689 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _487 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _147 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _747 = _393 * _741;
                float _749 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _751 = _377 * _743;
                float _753 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _755 = _425 * _749;
                float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _487 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _487;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_87);
        float _827 = 1.0 / _825;
        float _829 = _121 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _841;
    float _845 = 1.0 / _835;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _855 = 1.0 / _839;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _859 = _831 + _857;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _867 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _869 = 1.0 / _843;
    float _871 = _859 * _845;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _875 = _831 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _879 = _831 + _877;
    out.m_56.x = _853;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _861;
    bool _881 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _883 = isnan(_831);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = _875 * _855;
    bool _895 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _897 = isnan(_831);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _907;
    float _911 = fma(_909, _871, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _917 = _879 * _869;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    bool _927 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _929 = isnan(_831);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = fma(_921, _871, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _941 = _891 * _925;
    bool _943 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _945 = isnan(_831);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = -_891;
    float _957 = _955 + 1.0;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _963 = -_937;
    float _965 = _963 + 1.0;
    float _967 = _937 * _957;
    float _969 = fma(_961, _893, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _971 = fma(_915, _893, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _973 = _953 * _965;
    float _975 = in.m_52.x;
    float _977 = in.m_52.y;
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = _911 * _973;
    float _985 = _939 * _973;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _987;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _991;
    float _995 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].x, _983);
    float _997 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[143].y, _985);
    float _999 = fma(_989, _917, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1001 = fma(_993, _917, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1003 = fma(_969, _967, _995);
    float _1005 = fma(_971, _967, _997);
    float _1007 = fma(_999, _941, _1003);
    float _1009 = fma(_1001, _941, _1005);
    float _1011 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1007);
    float _1013 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1009);
    float _1015 = _1011 * _975;
    float _1017 = _1013 * _977;
    bool _1019 = !_867;
    float _1043;
    float _1045;
    if (!_1019)
    {
        float _1021 = in.m_54.x;
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1025 = float(_87);
        float _1027 = 1.0 / _1025;
        float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1031 = _121 * _1027;
        float _1033 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _1035 = _1033 * _1023;
        float _1037 = floor(_1035);
        float _1039 = -_1037;
        float _1041 = _1035 + _1039;
        _1043 = _1041;
        _1045 = _1031;
        _1047 = true;
    }
    else
    {
        float _1049 = float(_87);
        float _1051 = 1.0 / _1049;
        float _1053 = _121 * _1051;
        _1043 = _1053;
        _1045 = _1053;
    }
    _1047 = false;
    float _1055 = _1043;
    float _1057 = _1045;
    float _1059 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1061 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1063 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1065 = _473 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1067 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1059);
    float _1069 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1061);
    float _1071 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1063);
    float _1073 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1065);
    float _1075 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1067);
    float _1077 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1069);
    float _1079 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1071);
    float _1081 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1089 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1091 = _393 * _1083;
    float _1093 = _377 * _1085;
    float _1095 = _425 * _1087;
    float _1097 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1105 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1107);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1111);
    float _1119 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1113);
    float _1121 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1115);
    float _1123 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1117);
    float _1125 = _1119 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1127 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1129 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1125 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1127 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1129 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = _795 * _795;
    float _1149 = fma(_1141, _1141, _1145);
    float _1151 = fma(_797, _797, _1147);
    float _1153 = fma(_799, _799, _1151);
    float _1155 = rsqrt(_1149);
    float _1157 = rsqrt(_1153);
    float _1159 = _1133 * _1155;
    float _1161 = _1137 * _1155;
    float _1163 = _1141 * _1155;
    float _1165 = -_1159;
    float _1167 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1133);
    float _1169 = -_1161;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1173 = -_1163;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1141);
    float _1177 = _1157 * _799;
    float _1179 = _1167 * _1167;
    float _1181 = _1157 * _797;
    float _1183 = _1157 * _795;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1187 = _1177 * _1185;
    float _1189 = fma(_1171, _1171, _1179);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1193 = _1181 * _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1197 = _1183 * _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1201 = -_1187;
    float _1203 = fma(_1181, _1199, _1201);
    float _1205 = fma(_1175, _1175, _1189);
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = -_1193;
    float _1211 = fma(_1183, _1207, _1209);
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = -_1197;
    float _1217 = fma(_1177, _1213, _1215);
    float _1219 = _1203 * _1203;
    float _1221 = sqrt(_1205);
    float _1223 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1225 = fma(_1217, _1217, _1219);
    float _1227 = fma(_1211, _1211, _1225);
    float _1229 = rsqrt(_1227);
    float _1231 = _1155 * _1221;
    float _1233 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1235 = _1097 * _1231;
    float _1237 = _1105 * _1231;
    float _1239 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1241 = _1239 * 0.5;
    float _1243 = _1237 * _1223;
    float _1245 = _1217 * _1229;
    float _1247 = _1203 * _1229;
    float _1249 = _1235 * _1233;
    float _1251 = _1211 * _1229;
    float _1253 = _1181 * _1247;
    float _1255 = _1249 * _1177;
    float _1257 = _1183 * _1251;
    float _1259 = _1249 * _1181;
    float _1261 = -_1253;
    float _1263 = fma(_1183, _1245, _1261);
    float _1265 = fma(_1243, _1251, _1255);
    float _1267 = -_1257;
    float _1269 = fma(_1177, _1247, _1267);
    float _1271 = fma(_1243, _1245, _1259);
    float _1273 = _1177 * _1245;
    float _1275 = fma(_1241, _1263, _1265);
    float _1277 = _1249 * _1183;
    float _1279 = fma(_1241, _1269, _1271);
    float _1281 = -_1273;
    float _1283 = fma(_1181, _1251, _1281);
    float _1285 = _1129 + _1275;
    float _1287 = fma(_1243, _1247, _1277);
    float _1289 = _1127 + _1279;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1293 = _1285 + _1291;
    float _1295 = in.m_54.x;
    float _1297 = in.m_54.y;
    float _1299 = in.m_54.z;
    float _1301 = in.m_54.w;
    float _1303 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1305 = _1289 + _1303;
    float _1307 = fma(_1241, _1283, _1287);
    float _1309 = _1293 * _1293;
    float _1311 = _1125 + _1307;
    float _1313 = fma(_1305, _1305, _1309);
    float _1315 = sqrt(_1313);
    bool _1317 = _1297 > 0.5;
    bool _1319 = _1299 > 0.5;
    bool _1321 = _1315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1323 = -_193;
    float _1325 = _1317 ? _1323 : _193;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1329 = _1327 != 0;
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1333 = _1331 != 0;
    float _1335 = -_197;
    int _1337 = _1319 ? as_type<int>(_1335) : as_type<int>(_197);
    bool _1339 = !_1329;
    float _1341 = _1339 ? _193 : _1325;
    bool _1343 = !_1333;
    float _1345 = _1343 ? _197 : as_type<float>(_1337);
    float _1347 = _1325;
    float _1349 = _1241;
    float _1351 = _1243;
    float _1353 = _1315;
    float _1355 = _1311;
    float _1357 = _1299;
    if (!_1321)
    {
        _1347 = _1289;
    }
    float _1359 = _1347;
    float _1361 = _1359;
    if (!_1321)
    {
        _1349 = _1285;
    }
    float _1363 = _1349;
    float _1365 = _1363;
    if (!_1321)
    {
        _1351 = _1311;
    }
    float _1367 = _1351;
    bool _1369 = !_1321;
    float _1371 = _1367;
    if (!_1369)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1377 = _1315 + _1375;
        float _1379 = _1311 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = rsqrt(_1313);
        float _1383 = _1377 * _1373;
        float _1385 = _1383 * 0.15915493667125701904296875;
        float _1387 = _1385 * 6.283185482025146484375;
        float _1389 = cos(_1387);
        float _1391 = _1385 * 6.283185482025146484375;
        float _1393 = sin(_1391);
        float _1395 = _1389 + (-1.0);
        float _1397 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = fma(_1393, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = fma(_1311, _1389, _1397);
        float _1403 = _1381 * _1399;
        float _1405 = fma(_1305, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1407 = fma(_1293, _1403, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1371 = _1401;
        _1361 = _1405;
        _1365 = _1407;
        _1353 = _1385;
    }
    float _1409 = _1371;
    float _1411 = _1361;
    float _1413 = _1365;
    float _1415 = _1353;
    float _1417 = -_1159;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1421 = -_1161;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1425 = -_1163;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1431 = _1419 + _1429;
    float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1435 = _1423 + _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1439 = _1427 + _1437;
    float _1441 = _1431 * _1431;
    float _1443 = fma(_1435, _1435, _1441);
    float _1445 = fma(_1439, _1439, _1443);
    float _1447 = rsqrt(_1445);
    float _1449 = sqrt(_1445);
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1453 = _1435 * _1451;
    float _1455 = _1439 * _1451;
    float _1457 = _1453 * _1453;
    float _1459 = _1455 * _1455;
    float _1461 = _1457 + _1459;
    float _1463 = sqrt(_1461);
    bool _1465 = _1463 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = _1463 + _1467;
    float _1471 = _1447;
    float _1473 = _1469;
    float _1475 = _1431;
    float _1477 = _1451;
    if (_1465)
    {
        float _1479 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1471 = _1479;
    }
    float _1481 = _1471;
    float _1483 = _1481;
    if (_1465)
    {
        float _1485 = _1469 * _1481;
        _1473 = _1485;
    }
    float _1487 = _1473;
    if (_1465)
    {
        float _1489 = rsqrt(_1461);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1491;
    if (_1465)
    {
        float _1495 = _1487 * 0.15915493667125701904296875;
        _1355 = _1495;
    }
    float _1497 = _1355;
    float _1499 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1501 = _1439;
    float _1503 = _1497;
    if (_1465)
    {
        float _1505 = _1497 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1501 = _1507;
    }
    float _1509 = _1501;
    float _1511 = precise::max(0.0, _1499);
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1515 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1513);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = _1415;
    float _1521 = _1511;
    if (_1465)
    {
        float _1523 = _1497 * 6.283185482025146484375;
        float _1525 = cos(_1523);
        _1519 = _1525;
    }
    float _1527 = _1519;
    float _1529 = -_1451;
    float _1531 = -_1511;
    float _1533 = fma(_1431, _1529, _1531);
    float _1535 = -_1517;
    float _1537 = _1535 + 1.0;
    if (_1465)
    {
        float _1539 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1475 = _1539;
    }
    float _1541 = _1475;
    float _1543 = abs(_1537);
    float _1545 = log2(_1543);
    float _1547 = _1509;
    float _1549 = _1541;
    if (_1465)
    {
        float _1551 = fma(_1509, _1541, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1465)
    {
        _1549 = _1453;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    if (_1465)
    {
        float _1561 = _1491 * _1553;
        _1477 = _1561;
    }
    float _1563 = _1477;
    if (!_1465)
    {
        _1493 = _1533;
    }
    float _1565 = _1493;
    float _1567 = _1565;
    float _1569 = _1527;
    if (_1465)
    {
        float _1571 = _1527 + (-1.0);
        _1521 = _1571;
    }
    float _1573 = _1521;
    float _1575 = _1573;
    if (_1465)
    {
        float _1577 = _1453 * _1563;
        _1559 = _1577;
    }
    float _1579 = _1559;
    if (!_1465)
    {
        _1555 = _1455;
    }
    float _1581 = _1555;
    float _1583 = _1581;
    if (_1465)
    {
        float _1585 = _1455 * _1563;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (_1465)
    {
        float _1589 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1503 = _1589;
    }
    float _1591 = _1503;
    if (!_1465)
    {
        _1575 = _1457;
    }
    float _1593 = _1575;
    float _1595 = _1593;
    if (_1465)
    {
        float _1597 = _1579 * _1579;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1465)
    {
        float _1603 = fma(_1533, _1527, _1591);
        _1567 = _1603;
    }
    float _1605 = _1567;
    float _1607 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1609 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1465)
    {
        _1569 = _1459;
    }
    float _1611 = _1569;
    float _1613 = _1611;
    if (_1465)
    {
        float _1615 = _1587 * _1587;
        _1613 = _1615;
    }
    float _1617 = _1613;
    float _1619 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1607);
    float _1621 = fma(_1605, _1605, _1599);
    float _1623 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1601);
    float _1625 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1609);
    float _1627 = _1621 + _1617;
    float _1629 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1623);
    float _1631 = _1419 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1619);
    float _1635 = rsqrt(_1627);
    float _1637 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1641 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1643 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1625);
    float _1645 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1641);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1647);
    float _1655 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1657 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1653);
    float _1661 = _1635 * _1579;
    float _1663 = _1635 * _1587;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1659);
    float _1667 = _1635 * _1605;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1671 = -_1655;
    float _1673 = fma(_1671, _1637, 1.0);
    float _1675 = 1.0 / _1665;
    float _1677 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1679 = -_1669;
    float _1681 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1679);
    float _1683 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1685 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1677);
    float _1687 = -_1663;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1681);
    float _1691 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1693 = log2(_1673);
    float _1695 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1685);
    float _1697 = fma(_1689, -0.5, 0.5);
    float _1699 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1691);
    float _1701 = fma(_1689, 0.5, 0.5);
    float _1703 = _1667 + 1.0;
    float _1705 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1699);
    float _1707 = exp2(_1683);
    float _1709 = fma(_1701, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1711 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1705);
    float _1713 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1695);
    float _1715 = fma(_1701, _1709, -0.212114393711090087890625);
    float _1717 = _1711 * _1675;
    float _1719 = sqrt(_1697);
    float _1721 = fma(_1701, _1715, 1.570728778839111328125);
    float _1723 = _1693 * 0.693147182464599609375;
    float _1725 = fma(_1717, 0.5, 0.5);
    float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1729 = -_1667;
    float _1731 = fma(_1707, _1703, _1729);
    float _1733 = _1713 * _1675;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1719 * 0.636619746685028076171875;
    float _1741 = -_1721;
    float _1743 = fma(_1739, _1741, 1.0);
    float3 _5447 = float3(_1725, _1737, _1727);
    float _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1725, _1737, _1727);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _5475 = float2(_1743, _1735);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1772 = _1055 + _1770;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1782 = _1301 > 0.5;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1788 = 1.0 / _1776;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1800 = 1.0 / _1780;
    float _1802 = -_197;
    int _1804 = _1782 ? as_type<int>(_1802) : as_type<int>(_197);
    float _1806 = _1297 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1810 = _1808 != 0;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1816 = _1814 != 0;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1820 = _1818 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1824 = _1822 != 0;
    float _1826 = 1.0 / _1786;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = fma(_1806, -2.0, _1798);
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1836 = _1057 + _1834;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1840 = _1838 != 0;
    float _1842 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1844 = 1.0 / _1796;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1850 = -_1812;
    float _1852 = fma(_1842, 2.0, _1850);
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = 1.0 / _1792;
    float _1868 = _1860 * _1800;
    float _1870 = _1864 * _1788;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1872;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1882 = _1880 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1884 = 1.0 / _1820;
    float _1886 = fma(_1870, _1772, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1892 = _1057 + _1890;
    bool _1894 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1896 = isnan(_1055);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1832);
    bool _1908 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1910 = isnan(_1055);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1916 = _1912 || _1914;
    float _1918 = float(_1916);
    float _1920 = -_1345;
    float _1922 = _1920 + 0.5;
    float _1924 = 1.0 / _1848;
    float _1926 = _1874 * _1866;
    float _1928 = -_1159;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    bool _1932 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1934 = isnan(_1057);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = fma(_1926, _1836, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1946 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1948 = _1946 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1950 = 1.0 / _1856;
    float _1952 = _1882 * _1884;
    float _1954 = -_1942;
    float _1956 = _1954 + 1.0;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1960 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1962 = isnan(_1057);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1968 = _1964 || _1966;
    float _1970 = float(_1968);
    float _1972 = -_1161;
    float _1974 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1976 = _1341 + 0.5;
    float _1978 = 1.0 / _1948;
    float _1980 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1982 = _1980 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1986 = _1982 * _1826;
    float _1988 = _1878 * _1844;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1998 = fma(_1988, _1892, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2000 = _1992 * _1950;
    float _2002 = _1996 * _1924;
    float _2004 = -_197;
    int _2006 = _1317 ? as_type<int>(_2004) : as_type<int>(_197);
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = _1992;
    float _2012 = _1950;
    if (!_1840)
    {
        _2010 = _1297;
    }
    float _2014 = _2010;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2018 = _1057 + _2016;
    bool _2020 = _1295 > 0.5;
    float _2022 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    float _2024 = _2014;
    if (!_1840)
    {
        _2012 = _1299;
    }
    float _2026 = _2012;
    float _2028 = fma(_2000, _2018, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2030 = _2026;
    if (_1840)
    {
        _2024 = _1295;
    }
    float _2032 = _2024;
    float _2034 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1888);
    if (_1840)
    {
        _1357 = _1297;
    }
    float _2036 = _1357;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1840)
    {
        _2030 = _1297;
    }
    float _2040 = _2030;
    float _2042 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2044 = !_1816;
    float _2046 = _2044 ? _197 : as_type<float>(_2006);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2050 = !_1824;
    float _2052 = _2050 ? _197 : as_type<float>(_1804);
    float _2054 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2056 = _1055 + _2054;
    float _2058 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1958);
    float _2060 = -_193;
    int _2062 = _2020 ? as_type<int>(_2060) : as_type<int>(_193);
    float _2064 = fma(_1868, _2056, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2068 = _1057 + _2066;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2070;
    bool _2074 = !_1810;
    float _2076 = _2074 ? _193 : as_type<float>(_2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2080 = _1057 + _2078;
    float _2082 = fma(_1986, _2068, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2086 = _1057 + _2084;
    float _2088 = _2072 * _1978;
    float _2090 = fma(_2002, _2080, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2092 = -_121;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1852);
    float _2096 = fma(_1952, _2086, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2098 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2100 = _1057 + _2098;
    float _2102 = _2076 + 0.5;
    bool _2104 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2106 = isnan(_1057);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2118 = fma(_2088, _2100, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2120 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2122 = isnan(_1057);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2042, _2102, _2094);
    bool _2134 = _1055 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2136 = isnan(_1055);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = -_2114;
    float _2148 = _2146 + 1.0;
    float _2150 = -_193;
    int _2152 = _1319 ? as_type<int>(_2150) : as_type<int>(_193);
    float _2154 = -_2130;
    float _2156 = _2154 + 1.0;
    bool _2158 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2160 = isnan(_1057);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _1942 * _2148;
    bool _2172 = !_1830;
    float _2174 = _2172 ? _193 : as_type<float>(_2152);
    float _2176 = _2114 * _2156;
    float _2178 = -_1904;
    float _2180 = _2178 + 1.0;
    bool _2182 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2184 = isnan(_1057);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = -_2144;
    float _2196 = _2194 + 1.0;
    float _2198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2200 = _2144 * _2180;
    float _2202 = _2046 + (-0.5);
    float _2204 = _2168 * _1956;
    float _2206 = -_2168;
    float _2208 = _2206 + 1.0;
    float _2210 = _1918 * _2196;
    float _2212 = -_2116;
    float _2214 = -_1906;
    float _2216 = fma(_2212, _2202, _2214);
    bool _2218 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2220 = isnan(_1057);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2226 = _2222 || _2224;
    float _2228 = float(_2226);
    float _2230 = -_2192;
    float _2232 = _2230 + 1.0;
    float _2234 = _2192 * _2208;
    float _2236 = _2064 * _2210;
    bool _2238 = _1057 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2240 = isnan(_1057);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2246 = _2242 || _2244;
    float _2248 = float(_2246);
    float _2250 = _2228 * _2232;
    float _2252 = -_2228;
    float _2254 = _2252 + 1.0;
    float _2256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2258 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2058);
    float _2260 = _2248 * _2254;
    float _2262 = -_2248;
    float _2264 = _2262 + 1.0;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2268 = -_1163;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1129);
    float _2272 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2274 = _1970 * _2264;
    float _2276 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2266);
    float _2278 = -_1970;
    float _2280 = _2278 + 1.0;
    float _2282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2284 = _1944 * _2274;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2288 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2290 = -_1984;
    float _2292 = fma(_2048, 2.0, _2290);
    float _2294 = -_1918;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2300 = fma(_2288, -2.0, _2286);
    float _2302 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2284);
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2034);
    float _2308 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2276);
    float _2310 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2312 = -_121;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2292);
    float _2316 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2236);
    float _2318 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2300);
    float _2320 = _2052 + (-0.5);
    float _2322 = fma(_2082, _2260, _2302);
    float _2324 = fma(_1886, _2200, _2316);
    float _2326 = _2272 * _2256;
    float _2328 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2330 = _2174 + 0.5;
    float _2332 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2324);
    float _2334 = fma(_1998, _2250, _2322);
    float _2336 = _2310 * _2282;
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2342 = fma(_2328, _2330, _2314);
    float _2344 = -_2308;
    float _2346 = _2344 + 1.0;
    float _2348 = -_2338;
    float _2350 = -_2318;
    float _2352 = fma(_2348, _2320, _2350);
    float _2354 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2356 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_58.w = _2340;
    float _2358 = fma(_2096, _2234, _2334);
    float _2360 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2354);
    float _2362 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2356);
    float _2364 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2366 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2368 = isnan(0.5);
    bool _2370 = _2366 || _2368;
    bool _2372 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2374 = _2370 || _2372;
    float _2376 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2360);
    out.m_60.x = _2326;
    out.m_60.y = _2336;
    float _2378 = fma(_2028, _2204, _2358);
    float _2380 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2362);
    float _2382 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2386 = -_2298;
    float _2388 = _2386 + 1.0;
    float _2390 = -_2306;
    float _2392 = _2390 + 1.0;
    float _2394 = 1.0 / _2382;
    float _2396 = -_2258;
    float _2398 = _2396 + 1.0;
    float _2400 = fma(_2090, _2170, _2378);
    float _2402 = -_2346;
    float _2404 = fma(_2174, _2402, _2342);
    float _2406 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2408 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2384);
    float _2410 = -_2388;
    float _2412 = fma(_2076, _2410, _2132);
    float _2414 = fma(_2046, _2392, _2216);
    float _2416 = exp2(_2364);
    float _2418 = fma(_2052, _2398, _2352);
    float _2420 = fma(_2118, _2176, _2400);
    float _2422 = _2406 + _2382;
    float _2424 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    out.m_62.x = _2412;
    out.m_62.y = _2414;
    out.m_62.z = _2404;
    out.m_62.w = _2418;
    float _2426 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2420);
    float _2428 = _2422 * _2394;
    float _2430 = _2428 * 0.5;
    float _2432 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2424);
    float _2434 = _2412;
    if (_2374)
    {
        _2434 = 1.0;
    }
    float _2436 = _2434;
    float _2438 = _2436;
    if (!_2374)
    {
        float _2440 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2444 = _2440 * 0.15915493667125701904296875;
        float _2446 = _2442 * 0.15915493667125701904296875;
        float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2450 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2448);
        float _2452 = _2444 * 6.283185482025146484375;
        float _2454 = cos(_2452);
        float _2456 = _2444 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        float _2460 = 1.0 / _2454;
        float _2462 = _2446 * 6.283185482025146484375;
        float _2464 = cos(_2462);
        float _2466 = _2458 * _2460;
        float _2468 = _2446 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2464 * _2466;
        float _2474 = 1.0 / _2450;
        float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2478 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2476;
        float _2480 = 1.0 / _2472;
        float _2482 = 1.0 / _2478;
        float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2486 = _2474 * _2484;
        float _2488 = _2470 * _2480;
        float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2492 = fma(_2488, _2486, _2490);
        float _2494 = _2492 * _2482;
        float _2496 = precise::clamp(_2494, 0.0, 1.0);
        _2438 = _2496;
    }
    float _2498 = _2438;
    float _2500 = _2432 + _1665;
    float _2502 = -_2416;
    float _2504 = _2502 + 1.0;
    bool _2506 = _2498 > 0.0;
    bool _2508 = isnan(_2498);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan(0.0);
    bool _2514 = _2510 || _2512;
    float _2516 = _2498 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2518 = _2500 * 0.5;
    float _2520 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2522 = _2516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2524 = _2520 * _1745;
    float _2526 = -_2520;
    float _2528 = _2526 + 1.0;
    out.gl_Position.x = _1711;
    out.gl_Position.y = _1713;
    out.gl_Position.z = _2432;
    out.gl_Position.w = _1665;
    float _2530 = _1756 * _2524;
    float _2532 = _1766 * _2524;
    float _2534 = _1756 * _2528;
    out.m_64.x = _2426;
    float _2536 = fma(_1762, _2530, _1750);
    float _2538 = fma(_1764, _2530, _1752);
    float _2540 = fma(_1756, _2532, _1754);
    out.m_66.z = _2518;
    out.m_66.w = _1665;
    out.m_45.x = _2522;
    out.m_68.x = _2536;
    out.m_68.y = _2538;
    out.m_68.z = _2540;
    out.m_68.w = _2534;
    if (_2514)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2542;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

