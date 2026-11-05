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
    constant _16* fp_c3 [[id(0)]];
    texture3d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _1761 = float3(_63, _61, _65);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1761, float3(0.0), isnan(_1761)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1761, float3(0.0), isnan(_1761)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float3 _1782 = float3(_63, _61, _65);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1782, float3(0.0), isnan(_1782)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1782, float3(0.0), isnan(_1782)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float3 _1798 = float3(_63, _61, _65);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1798, float3(0.0), isnan(_1798)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1798, float3(0.0), isnan(_1798)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float3 _1814 = float3(_63, _61, _65);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1814, float3(0.0), isnan(_1814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1814, float3(0.0), isnan(_1814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float3 _1830 = float3(_63, _61, _65);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float3 _1846 = float3(_63, _61, _65);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1846, float3(0.0), isnan(_1846)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1846, float3(0.0), isnan(_1846)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float3 _1862 = float3(_63, _61, _65);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1862, float3(0.0), isnan(_1862)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1862, float3(0.0), isnan(_1862)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float3 _1878 = float3(_63, _61, _65);
    float2 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1878, float3(0.0), isnan(_1878)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1878, float3(0.0), isnan(_1878)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xy;
    float _113 = _111.x;
    float _115 = _111.y;
    float3 _1894 = float3(_63, _61, _65);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1894, float3(0.0), isnan(_1894)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1894, float3(0.0), isnan(_1894)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xy;
    float _119 = _117.x;
    float _121 = _117.y;
    float3 _1910 = float3(_63, _61, _65);
    float2 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1910, float3(0.0), isnan(_1910)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1910, float3(0.0), isnan(_1910)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xy;
    float _125 = _123.x;
    float _127 = _123.y;
    float3 _1926 = float3(_63, _61, _65);
    float2 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1926, float3(0.0), isnan(_1926)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1926, float3(0.0), isnan(_1926)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _131 = _129.x;
    float _133 = _129.y;
    float3 _1941 = float3(_63, _61, _65);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1941, float3(0.0), isnan(_1941)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1941, float3(0.0), isnan(_1941)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xy;
    float _137 = _135.x;
    float _139 = _135.y;
    float3 _1957 = float3(_63, _61, _65);
    float2 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1957, float3(0.0), isnan(_1957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1957, float3(0.0), isnan(_1957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xy;
    float _143 = _141.x;
    float _145 = _141.y;
    float3 _1973 = float3(_63, _61, _65);
    float2 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1973, float3(0.0), isnan(_1973)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1973, float3(0.0), isnan(_1973)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xy;
    float _149 = _147.x;
    float _151 = _147.y;
    float3 _1989 = float3(_63, _61, _65);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1989, float3(0.0), isnan(_1989)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1989, float3(0.0), isnan(_1989)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float3 _2005 = float3(_63, _61, _65);
    float2 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2005, float3(0.0), isnan(_2005)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2005, float3(0.0), isnan(_2005)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xy;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = precise::min(_71, _77);
    float _167 = precise::max(_73, _79);
    float _169 = precise::min(_73, _79);
    float _171 = precise::min(_83, _89);
    float _173 = precise::max(_85, _91);
    float _175 = precise::min(_165, _171);
    float _177 = precise::min(_85, _91);
    float _179 = precise::max(_167, _173);
    float _181 = precise::min(_169, _177);
    float _183 = precise::max(_71, _77);
    float _185 = precise::max(_83, _89);
    float _187 = precise::max(_183, _185);
    float _189 = precise::max(_95, _101);
    float _191 = precise::max(_107, _113);
    float _193 = precise::min(_95, _101);
    float _195 = precise::min(_107, _113);
    float _197 = precise::max(_189, _191);
    float _199 = precise::min(_193, _195);
    float _201 = precise::max(_97, _103);
    float _203 = precise::max(_109, _115);
    float _205 = precise::max(_119, _125);
    float _207 = precise::max(_131, _137);
    float _209 = precise::min(_119, _125);
    float _211 = precise::min(_131, _137);
    float _213 = precise::max(_201, _203);
    float _215 = precise::min(_97, _103);
    float _217 = precise::min(_109, _115);
    float _219 = precise::max(_207, _205);
    float _221 = precise::min(_211, _209);
    float _223 = precise::max(_143, _149);
    float _225 = precise::max(_155, _161);
    float _227 = precise::min(_215, _217);
    float _229 = precise::max(_121, _127);
    float _231 = precise::max(_133, _139);
    float _233 = precise::max(_223, _225);
    float _235 = precise::max(_231, _229);
    float _237 = precise::max(_219, _187);
    float _239 = precise::max(_197, _233);
    float _241 = precise::min(_143, _149);
    float _243 = precise::min(_155, _161);
    float _245 = precise::min(_221, _175);
    float _247 = precise::max(_237, _239);
    float _249 = precise::min(_121, _127);
    float _251 = precise::min(_133, _139);
    float _253 = precise::min(_241, _243);
    float _255 = precise::min(_145, _151);
    float _257 = precise::min(_157, _163);
    float _259 = precise::max(_145, _151);
    float _261 = precise::max(_157, _163);
    float _263 = precise::min(_251, _249);
    float _265 = precise::min(_199, _253);
    float _267 = _247 * 255.0;
    float _269 = precise::min(_255, _257);
    float _271 = precise::max(_259, _261);
    float _273 = precise::min(_263, _181);
    float _275 = precise::min(_245, _265);
    float _277 = precise::min(_227, _269);
    float _279 = trunc(_267);
    float _281 = precise::max(_279, 0.0);
    uint _284 = uint(_281);
    float _286 = precise::max(_213, _271);
    float _288 = precise::max(_235, _179);
    float _290 = _275 * 255.0;
    float _292 = precise::min(_273, _277);
    float _294 = precise::max(_288, _286);
    float _296 = trunc(_290);
    float _298 = precise::max(_296, 0.0);
    uint _300 = uint(_298);
    float _302 = _292 * 255.0;
    float _304 = _294 * 255.0;
    float _306 = trunc(_302);
    float _308 = precise::max(_306, 0.0);
    uint _310 = uint(_308);
    float _312 = trunc(_304);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    bool _320 = _284 > _300;
    int _323 = int(_300) << 8;
    int _325 = _323 & 65280;
    int _327 = int(_310) * 256;
    int _329 = 255 & int(_284);
    int _331 = _325 | _329;
    int _333 = _327 & 65280;
    int _335 = _325;
    int _337 = int(_284);
    int _339 = int(_310);
    int _341 = _333;
    int _343 = as_type<int>(_275);
    int _345 = as_type<int>(_247);
    if (!_320)
    {
        _335 = 0;
    }
    int _347 = _335;
    int _349 = _347;
    if (!_320)
    {
        _337 = 0;
    }
    int _351 = _337;
    bool _353 = _316 > _310;
    int _355 = 255 & int(_316);
    int _357 = _333 | _355;
    int _359 = _351;
    if (!_320)
    {
        _339 = 0;
    }
    int _361 = _339;
    bool _363 = !_320;
    int _365 = _361;
    if (!_363)
    {
        float _367 = -_275;
        float _369 = _247 + _367;
        float _371 = -_275;
        float _373 = _131 + _371;
        float _375 = -_275;
        float _377 = _137 + _375;
        float _379 = -_275;
        float _381 = _119 + _379;
        float _383 = 1.0 / _369;
        float _385 = -_275;
        float _387 = _71 + _385;
        float _389 = -_275;
        float _391 = _125 + _389;
        float _393 = -_275;
        float _395 = _77 + _393;
        float _397 = -_275;
        float _399 = _83 + _397;
        float _401 = -_275;
        float _403 = _89 + _401;
        float _405 = -_275;
        float _407 = _95 + _405;
        float _409 = -_275;
        float _411 = _101 + _409;
        float _413 = -_275;
        float _415 = _107 + _413;
        float _417 = -_275;
        float _419 = _113 + _417;
        float _421 = -_275;
        float _423 = _143 + _421;
        float _425 = -_275;
        float _427 = _149 + _425;
        float _429 = -_275;
        float _431 = _155 + _429;
        float _433 = -_275;
        float _435 = _161 + _433;
        float _437 = _377 * _383;
        float _439 = _381 * _383;
        float _441 = _373 * _383;
        float _443 = _387 * _383;
        float _445 = fma(_437, -1.99999904632568359375, 1.99999904632568359375);
        float _447 = fma(_437, -7.99999904632568359375, 7.99999904632568359375);
        float _449 = fma(_439, -1.99999904632568359375, 1.99999904632568359375);
        float _451 = fma(_439, -7.99999904632568359375, 7.99999904632568359375);
        float _453 = _391 * _383;
        float _455 = _395 * _383;
        float _457 = _399 * _383;
        float _459 = _403 * _383;
        float _461 = _407 * _383;
        float _463 = _411 * _383;
        float _465 = _415 * _383;
        float _467 = _419 * _383;
        float _469 = _423 * _383;
        float _471 = _427 * _383;
        float _473 = _431 * _383;
        float _475 = _435 * _383;
        float _477 = fma(_441, -1.99999904632568359375, 1.99999904632568359375);
        float _479 = fma(_441, -7.99999904632568359375, 7.99999904632568359375);
        float _481 = fma(_443, -1.99999904632568359375, 1.99999904632568359375);
        float _483 = fma(_443, -7.99999904632568359375, 7.99999904632568359375);
        float _485 = -_437;
        float _487 = _485 + 0.5;
        float _489 = -_439;
        float _491 = _489 + 0.5;
        float _493 = -_443;
        float _495 = _493 + 0.5;
        float _497 = trunc(_445);
        float _499 = precise::max(_497, 0.0);
        uint _501 = uint(_499);
        float _503 = fma(_453, -1.99999904632568359375, 1.99999904632568359375);
        float _505 = fma(_453, -7.99999904632568359375, 7.99999904632568359375);
        float _507 = -_441;
        float _509 = _507 + 0.5;
        float _511 = abs(_487);
        bool _513 = _511 >= 0.375;
        float _515 = -_453;
        float _517 = _515 + 0.5;
        float _519 = abs(_491);
        bool _521 = _519 >= 0.375;
        float _523 = fma(_455, -7.99999904632568359375, 7.99999904632568359375);
        float _525 = trunc(_447);
        float _527 = precise::max(_525, 0.0);
        uint _529 = uint(_527);
        float _531 = abs(_495);
        bool _533 = _531 >= 0.375;
        float _535 = -_455;
        float _537 = _535 + 0.5;
        float _539 = abs(_509);
        bool _541 = _539 >= 0.375;
        float _543 = fma(_455, -1.99999904632568359375, 1.99999904632568359375);
        float _545 = abs(_517);
        bool _547 = _545 >= 0.375;
        float _549 = fma(_459, -1.99999904632568359375, 1.99999904632568359375);
        float _551 = abs(_537);
        bool _553 = _551 >= 0.375;
        float _555 = trunc(_449);
        float _557 = precise::max(_555, 0.0);
        uint _559 = uint(_557);
        float _561 = fma(_459, -7.99999904632568359375, 7.99999904632568359375);
        float _563 = fma(_457, -1.99999904632568359375, 1.99999904632568359375);
        float _565 = fma(_457, -7.99999904632568359375, 7.99999904632568359375);
        float _567 = -_459;
        float _569 = _567 + 0.5;
        float _571 = -_457;
        float _573 = _571 + 0.5;
        float _575 = trunc(_451);
        float _577 = precise::max(_575, 0.0);
        uint _579 = uint(_577);
        int _581 = int(_501);
        int _583 = int(_559);
        if (!_513)
        {
            int _585 = int(_529) + 1;
            _581 = _585;
        }
        int _587 = _581;
        float _589 = fma(_463, -1.99999904632568359375, 1.99999904632568359375);
        float _591 = abs(_569);
        bool _593 = _591 >= 0.375;
        float _595 = fma(_463, -7.99999904632568359375, 7.99999904632568359375);
        float _597 = -_463;
        float _599 = _597 + 0.5;
        int _601 = _587 << 3;
        float _603 = trunc(_477);
        float _605 = precise::max(_603, 0.0);
        uint _607 = uint(_605);
        float _609 = trunc(_479);
        float _611 = precise::max(_609, 0.0);
        uint _613 = uint(_611);
        int _615 = int(_607);
        if (!_521)
        {
            int _617 = int(_579) + 1;
            _583 = _617;
        }
        int _619 = _583;
        float _621 = -_461;
        float _623 = _621 + 0.5;
        int _625 = _619 << 6;
        float _627 = abs(_623);
        bool _629 = _627 >= 0.375;
        float _631 = trunc(_503);
        float _633 = precise::max(_631, 0.0);
        uint _635 = uint(_633);
        float _637 = fma(_465, -7.99999904632568359375, 7.99999904632568359375);
        float _639 = trunc(_505);
        float _641 = precise::max(_639, 0.0);
        uint _643 = uint(_641);
        int _645 = int(_635);
        if (!_541)
        {
            int _647 = int(_613) + 1;
            _615 = _647;
        }
        int _649 = _615;
        float _651 = fma(_461, -1.99999904632568359375, 1.99999904632568359375);
        float _653 = abs(_573);
        bool _655 = _653 >= 0.375;
        float _657 = fma(_461, -7.99999904632568359375, 7.99999904632568359375);
        float _659 = fma(_465, -1.99999904632568359375, 1.99999904632568359375);
        float _661 = -_465;
        float _663 = _661 + 0.5;
        int _665 = _649 | _601;
        float _667 = trunc(_481);
        float _669 = precise::max(_667, 0.0);
        uint _671 = uint(_669);
        float _673 = trunc(_483);
        float _675 = precise::max(_673, 0.0);
        uint _677 = uint(_675);
        int _679 = int(_671);
        if (!_547)
        {
            int _681 = int(_643) + 1;
            _645 = _681;
        }
        int _683 = _645;
        float _685 = fma(_467, -1.99999904632568359375, 1.99999904632568359375);
        float _687 = abs(_599);
        bool _689 = _687 >= 0.375;
        float _691 = fma(_467, -7.99999904632568359375, 7.99999904632568359375);
        float _693 = -_467;
        float _695 = _693 + 0.5;
        float _697 = fma(_475, -7.99999904632568359375, 7.99999904632568359375);
        int _699 = _683 << 9;
        float _701 = trunc(_543);
        float _703 = precise::max(_701, 0.0);
        uint _705 = uint(_703);
        int _707 = _665 | _625;
        int _709 = _699 | _707;
        float _711 = trunc(_523);
        float _713 = precise::max(_711, 0.0);
        uint _715 = uint(_713);
        int _717 = int(_705);
        if (!_533)
        {
            int _719 = int(_677) + 1;
            _679 = _719;
        }
        int _721 = _679;
        float _723 = fma(_469, -1.99999904632568359375, 1.99999904632568359375);
        float _725 = abs(_663);
        bool _727 = _725 >= 0.375;
        float _729 = fma(_469, -7.99999904632568359375, 7.99999904632568359375);
        float _731 = -_469;
        float _733 = _731 + 0.5;
        float _735 = trunc(_563);
        float _737 = precise::max(_735, 0.0);
        uint _739 = uint(_737);
        float _741 = trunc(_565);
        float _743 = precise::max(_741, 0.0);
        uint _745 = uint(_743);
        int _747 = int(_739);
        if (!_553)
        {
            int _749 = int(_715) + 1;
            _717 = _749;
        }
        int _751 = _717;
        float _753 = fma(_471, -1.99999904632568359375, 1.99999904632568359375);
        float _755 = abs(_695);
        bool _757 = _755 >= 0.375;
        float _759 = fma(_471, -7.99999904632568359375, 7.99999904632568359375);
        float _761 = -_471;
        float _763 = _761 + 0.5;
        int _765 = _751 * 32768;
        float _767 = trunc(_549);
        float _769 = precise::max(_767, 0.0);
        uint _771 = uint(_769);
        float _773 = trunc(_561);
        float _775 = precise::max(_773, 0.0);
        uint _777 = uint(_775);
        int _779 = int(_771);
        if (!_655)
        {
            int _781 = int(_745) + 1;
            _747 = _781;
        }
        int _783 = _747;
        float _785 = fma(_473, -1.99999904632568359375, 1.99999904632568359375);
        float _787 = fma(_475, -1.99999904632568359375, 1.99999904632568359375);
        float _789 = abs(_733);
        bool _791 = _789 >= 0.375;
        float _793 = fma(_473, -7.99999904632568359375, 7.99999904632568359375);
        float _795 = -_473;
        float _797 = _795 + 0.5;
        float _799 = -_475;
        float _801 = _799 + 0.5;
        float _803 = trunc(_589);
        float _805 = precise::max(_803, 0.0);
        uint _807 = uint(_805);
        float _809 = trunc(_595);
        float _811 = precise::max(_809, 0.0);
        uint _813 = uint(_811);
        int _815 = int(_807);
        if (!_593)
        {
            int _817 = int(_777) + 1;
            _779 = _817;
        }
        int _819 = _779;
        float _821 = abs(_763);
        bool _823 = _821 >= 0.375;
        int _825 = _819 * 2097152;
        float _827 = trunc(_651);
        float _829 = precise::max(_827, 0.0);
        uint _831 = uint(_829);
        float _833 = trunc(_657);
        float _835 = precise::max(_833, 0.0);
        uint _837 = uint(_835);
        int _839 = int(_831);
        if (!_689)
        {
            int _841 = int(_813) + 1;
            _815 = _841;
        }
        int _843 = _815;
        float _845 = abs(_801);
        bool _847 = _845 >= 0.375;
        int _849 = _843 * 8;
        float _851 = trunc(_659);
        float _853 = precise::max(_851, 0.0);
        uint _855 = uint(_853);
        float _857 = trunc(_637);
        float _859 = precise::max(_857, 0.0);
        uint _861 = uint(_859);
        int _863 = int(_855);
        if (!_629)
        {
            int _865 = int(_837) + 1;
            _839 = _865;
        }
        int _867 = _839;
        float _869 = abs(_797);
        bool _871 = _869 >= 0.375;
        int _873 = _867 | _849;
        float _875 = trunc(_685);
        float _877 = precise::max(_875, 0.0);
        uint _879 = uint(_877);
        float _881 = trunc(_691);
        float _883 = precise::max(_881, 0.0);
        uint _885 = uint(_883);
        int _887 = int(_879);
        if (!_727)
        {
            int _889 = int(_861) + 1;
            _863 = _889;
        }
        int _891 = _863;
        int _893 = _891 * 64;
        float _895 = trunc(_723);
        float _897 = precise::max(_895, 0.0);
        uint _899 = uint(_897);
        float _901 = trunc(_729);
        float _903 = precise::max(_901, 0.0);
        uint _905 = uint(_903);
        int _907 = int(_899);
        if (!_757)
        {
            int _909 = int(_885) + 1;
            _887 = _909;
        }
        int _911 = _887;
        int _913 = _911 << 9;
        float _915 = trunc(_753);
        float _917 = precise::max(_915, 0.0);
        uint _919 = uint(_917);
        int _921 = _873 | _893;
        int _923 = _913 | _921;
        int _925 = _721 << 12;
        int _927 = _709 | _925;
        int _929 = _765 | _927;
        float _931 = trunc(_759);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        int _937 = int(_919);
        if (!_791)
        {
            int _939 = int(_905) + 1;
            _907 = _939;
        }
        int _941 = _907;
        int _943 = _941 << 12;
        int _945 = _783 * 262144;
        float _947 = trunc(_785);
        float _949 = precise::max(_947, 0.0);
        uint _951 = uint(_949);
        int _953 = _929 | _945;
        int _955 = _825 | _953;
        uint _957 = uint(int(uint(_955) >> uint(16)));
        float _959 = trunc(_793);
        float _961 = precise::max(_959, 0.0);
        uint _963 = uint(_961);
        int _965 = int(_951);
        _343 = int(_957);
        if (!_823)
        {
            int _967 = int(_935) + 1;
            _937 = _967;
        }
        int _969 = _937;
        int _971 = _969 << 15;
        float _973 = trunc(_787);
        float _975 = precise::max(_973, 0.0);
        uint _977 = uint(_975);
        int _979 = _923 | _943;
        int _981 = _971 | _979;
        float _983 = trunc(_697);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        int _989 = int(_977);
        _341 = _981;
        if (!_871)
        {
            int _991 = int(_963) + 1;
            _965 = _991;
        }
        int _993 = _965;
        int _995 = _993 << 18;
        if (!_847)
        {
            int _997 = int(_987) + 1;
            _989 = _997;
        }
        int _999 = _989;
        int _1001 = _999 << 21;
        int _1003 = _981 | _995;
        int _1005 = _1001 | _1003;
        int _1007 = _1005 << 8;
        uint _1009 = uint(int(uint(_1005) >> uint(8)));
        int _1011 = _955 << 16;
        int _1013 = 65280 & _1007;
        int _1015 = int(_957) | _1013;
        int _1017 = int(_1009) * 65536;
        _365 = _1011;
        _359 = _1017;
        _349 = _1015;
        _345 = int(_1009);
    }
    int _1019 = _365;
    int _1021 = _359;
    int _1023 = _349;
    int _1025 = _341;
    int _1027 = _343;
    int _1029 = _345;
    int _1031 = _1025;
    int _1033 = _1029;
    int _1035 = _1027;
    if (!_353)
    {
        _1031 = 0;
        _1033 = 0;
    }
    int _1037 = _1031;
    int _1039 = _1033;
    int _1041 = _1037;
    int _1043 = _1039;
    if (!_353)
    {
        _1035 = 0;
    }
    int _1045 = _1035;
    bool _1047 = !_353;
    int _1049 = _1045;
    if (!_1047)
    {
        float _1051 = -_292;
        float _1053 = _294 + _1051;
        float _1055 = -_292;
        float _1057 = _109 + _1055;
        float _1059 = -_292;
        float _1061 = _139 + _1059;
        float _1063 = -_292;
        float _1065 = _133 + _1063;
        float _1067 = -_292;
        float _1069 = _73 + _1067;
        float _1071 = 1.0 / _1053;
        float _1073 = -_292;
        float _1075 = _151 + _1073;
        float _1077 = -_292;
        float _1079 = _127 + _1077;
        float _1081 = -_292;
        float _1083 = _85 + _1081;
        float _1085 = -_292;
        float _1087 = _91 + _1085;
        float _1089 = -_292;
        float _1091 = _97 + _1089;
        float _1093 = -_292;
        float _1095 = _103 + _1093;
        float _1097 = -_292;
        float _1099 = _157 + _1097;
        float _1101 = -_292;
        float _1103 = _163 + _1101;
        float _1105 = _1057 * _1071;
        float _1107 = -_292;
        float _1109 = _115 + _1107;
        float _1111 = _1061 * _1071;
        float _1113 = _1065 * _1071;
        float _1115 = -_292;
        float _1117 = _121 + _1115;
        float _1119 = _1109 * _1071;
        float _1121 = -_292;
        float _1123 = _145 + _1121;
        float _1125 = _1069 * _1071;
        float _1127 = -_292;
        float _1129 = _79 + _1127;
        float _1131 = fma(_1113, -1.99999904632568359375, 1.99999904632568359375);
        float _1133 = _1123 * _1071;
        float _1135 = fma(_1113, -7.99999904632568359375, 7.99999904632568359375);
        float _1137 = _1117 * _1071;
        float _1139 = -_1113;
        float _1141 = _1139 + 0.5;
        float _1143 = fma(_1111, -1.99999904632568359375, 1.99999904632568359375);
        float _1145 = fma(_1111, -7.99999904632568359375, 7.99999904632568359375);
        float _1147 = _1129 * _1071;
        float _1149 = fma(_1137, -1.99999904632568359375, 1.99999904632568359375);
        float _1151 = fma(_1137, -7.99999904632568359375, 7.99999904632568359375);
        float _1153 = _1079 * _1071;
        float _1155 = abs(_1141);
        bool _1157 = _1155 >= 0.375;
        float _1159 = trunc(_1131);
        float _1161 = precise::max(_1159, 0.0);
        uint _1163 = uint(_1161);
        float _1165 = fma(_1125, -1.99999904632568359375, 1.99999904632568359375);
        float _1167 = fma(_1125, -7.99999904632568359375, 7.99999904632568359375);
        float _1169 = fma(_1147, -1.99999904632568359375, 1.99999904632568359375);
        float _1171 = fma(_1147, -7.99999904632568359375, 7.99999904632568359375);
        float _1173 = -_1111;
        float _1175 = _1173 + 0.5;
        float _1177 = fma(_1153, -1.99999904632568359375, 1.99999904632568359375);
        float _1179 = fma(_1153, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = trunc(_1135);
        float _1183 = precise::max(_1181, 0.0);
        uint _1185 = uint(_1183);
        float _1187 = _1083 * _1071;
        float _1189 = -_1137;
        float _1191 = _1189 + 0.5;
        float _1193 = _1087 * _1071;
        float _1195 = -_1125;
        float _1197 = _1195 + 0.5;
        float _1199 = -_1147;
        float _1201 = _1199 + 0.5;
        float _1203 = abs(_1175);
        bool _1205 = _1203 >= 0.375;
        float _1207 = fma(_1187, -1.99999904632568359375, 1.99999904632568359375);
        float _1209 = trunc(_1143);
        float _1211 = precise::max(_1209, 0.0);
        uint _1213 = uint(_1211);
        float _1215 = fma(_1187, -7.99999904632568359375, 7.99999904632568359375);
        float _1217 = _1091 * _1071;
        float _1219 = -_1153;
        float _1221 = _1219 + 0.5;
        float _1223 = abs(_1191);
        bool _1225 = _1223 >= 0.375;
        float _1227 = fma(_1193, -1.99999904632568359375, 1.99999904632568359375);
        float _1229 = fma(_1193, -7.99999904632568359375, 7.99999904632568359375);
        float _1231 = _1095 * _1071;
        float _1233 = trunc(_1145);
        float _1235 = precise::max(_1233, 0.0);
        uint _1237 = uint(_1235);
        float _1239 = abs(_1197);
        bool _1241 = _1239 >= 0.375;
        float _1243 = fma(_1217, -1.99999904632568359375, 1.99999904632568359375);
        float _1245 = abs(_1201);
        bool _1247 = _1245 >= 0.375;
        float _1249 = fma(_1217, -7.99999904632568359375, 7.99999904632568359375);
        float _1251 = -_1187;
        float _1253 = _1251 + 0.5;
        float _1255 = abs(_1221);
        bool _1257 = _1255 >= 0.375;
        float _1259 = fma(_1231, -1.99999904632568359375, 1.99999904632568359375);
        float _1261 = trunc(_1149);
        float _1263 = precise::max(_1261, 0.0);
        uint _1265 = uint(_1263);
        float _1267 = fma(_1231, -7.99999904632568359375, 7.99999904632568359375);
        float _1269 = -_1193;
        float _1271 = _1269 + 0.5;
        float _1273 = -_1217;
        float _1275 = _1273 + 0.5;
        float _1277 = abs(_1253);
        bool _1279 = _1277 >= 0.375;
        float _1281 = fma(_1105, -1.99999904632568359375, 1.99999904632568359375);
        float _1283 = fma(_1105, -7.99999904632568359375, 7.99999904632568359375);
        float _1285 = fma(_1119, -1.99999904632568359375, 1.99999904632568359375);
        float _1287 = trunc(_1151);
        float _1289 = precise::max(_1287, 0.0);
        uint _1291 = uint(_1289);
        float _1293 = fma(_1119, -7.99999904632568359375, 7.99999904632568359375);
        float _1295 = _1075 * _1071;
        int _1297 = int(_1163);
        int _1299 = int(_1213);
        int _1301 = int(_1265);
        if (!_1157)
        {
            int _1303 = int(_1185) + 1;
            _1297 = _1303;
        }
        int _1305 = _1297;
        float _1307 = -_1231;
        float _1309 = _1307 + 0.5;
        float _1311 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1313 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1315 = abs(_1271);
        bool _1317 = _1315 >= 0.375;
        float _1319 = trunc(_1165);
        float _1321 = precise::max(_1319, 0.0);
        uint _1323 = uint(_1321);
        float _1325 = _1099 * _1071;
        int _1327 = int(_1323);
        if (!_1205)
        {
            int _1329 = int(_1237) + 1;
            _1299 = _1329;
        }
        int _1331 = _1299;
        float _1333 = -_1119;
        float _1335 = _1333 + 0.5;
        float _1337 = -_1133;
        float _1339 = _1337 + 0.5;
        float _1341 = _1103 * _1071;
        float _1343 = abs(_1275);
        bool _1345 = _1343 >= 0.375;
        float _1347 = fma(_1295, -7.99999904632568359375, 7.99999904632568359375);
        float _1349 = trunc(_1167);
        float _1351 = precise::max(_1349, 0.0);
        uint _1353 = uint(_1351);
        if (!_1225)
        {
            int _1355 = int(_1291) + 1;
            _1301 = _1355;
        }
        int _1357 = _1301;
        float _1359 = -_1105;
        float _1361 = _1359 + 0.5;
        float _1363 = abs(_1309);
        bool _1365 = _1363 >= 0.375;
        float _1367 = fma(_1295, -1.99999904632568359375, 1.99999904632568359375);
        float _1369 = fma(_1325, -1.99999904632568359375, 1.99999904632568359375);
        float _1371 = fma(_1325, -7.99999904632568359375, 7.99999904632568359375);
        float _1373 = -_1295;
        float _1375 = _1373 + 0.5;
        float _1377 = trunc(_1169);
        float _1379 = precise::max(_1377, 0.0);
        uint _1381 = uint(_1379);
        float _1383 = fma(_1341, -1.99999904632568359375, 1.99999904632568359375);
        float _1385 = -_1325;
        float _1387 = _1385 + 0.5;
        int _1389 = _1331 << 3;
        int _1391 = _1305 | _1389;
        float _1393 = trunc(_1171);
        float _1395 = precise::max(_1393, 0.0);
        uint _1397 = uint(_1395);
        int _1399 = int(_1381);
        if (!_1241)
        {
            int _1401 = int(_1353) + 1;
            _1327 = _1401;
        }
        int _1403 = _1327;
        float _1405 = abs(_1335);
        bool _1407 = _1405 >= 0.375;
        float _1409 = trunc(_1177);
        float _1411 = precise::max(_1409, 0.0);
        uint _1413 = uint(_1411);
        float _1415 = trunc(_1179);
        float _1417 = precise::max(_1415, 0.0);
        uint _1419 = uint(_1417);
        int _1421 = int(_1413);
        if (!_1247)
        {
            int _1423 = int(_1397) + 1;
            _1399 = _1423;
        }
        int _1425 = _1399;
        float _1427 = abs(_1339);
        bool _1429 = _1427 >= 0.375;
        float _1431 = fma(_1341, -7.99999904632568359375, 7.99999904632568359375);
        float _1433 = -_1341;
        float _1435 = _1433 + 0.5;
        int _1437 = _1425 << 15;
        float _1439 = trunc(_1207);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        float _1445 = trunc(_1215);
        float _1447 = precise::max(_1445, 0.0);
        uint _1449 = uint(_1447);
        int _1451 = int(_1443);
        if (!_1257)
        {
            int _1453 = int(_1419) + 1;
            _1421 = _1453;
        }
        int _1455 = _1421;
        float _1457 = abs(_1361);
        bool _1459 = _1457 >= 0.375;
        int _1461 = _1455 << 9;
        float _1463 = trunc(_1227);
        float _1465 = precise::max(_1463, 0.0);
        uint _1467 = uint(_1465);
        float _1469 = trunc(_1229);
        float _1471 = precise::max(_1469, 0.0);
        uint _1473 = uint(_1471);
        int _1475 = int(_1467);
        if (!_1279)
        {
            int _1477 = int(_1449) + 1;
            _1451 = _1477;
        }
        int _1479 = _1451;
        float _1481 = abs(_1375);
        bool _1483 = _1481 >= 0.375;
        int _1485 = _1479 << 18;
        float _1487 = trunc(_1243);
        float _1489 = precise::max(_1487, 0.0);
        uint _1491 = uint(_1489);
        float _1493 = trunc(_1249);
        float _1495 = precise::max(_1493, 0.0);
        uint _1497 = uint(_1495);
        int _1499 = int(_1491);
        if (!_1317)
        {
            int _1501 = int(_1473) + 1;
            _1475 = _1501;
        }
        int _1503 = _1475;
        float _1505 = abs(_1387);
        bool _1507 = _1505 >= 0.375;
        int _1509 = _1503 << 21;
        float _1511 = trunc(_1259);
        float _1513 = precise::max(_1511, 0.0);
        uint _1515 = uint(_1513);
        float _1517 = trunc(_1267);
        float _1519 = precise::max(_1517, 0.0);
        uint _1521 = uint(_1519);
        int _1523 = int(_1515);
        if (!_1345)
        {
            int _1525 = int(_1497) + 1;
            _1499 = _1525;
        }
        int _1527 = _1499;
        float _1529 = abs(_1435);
        bool _1531 = _1529 >= 0.375;
        float _1533 = trunc(_1285);
        float _1535 = precise::max(_1533, 0.0);
        uint _1537 = uint(_1535);
        float _1539 = trunc(_1293);
        float _1541 = precise::max(_1539, 0.0);
        uint _1543 = uint(_1541);
        int _1545 = int(_1537);
        if (!_1365)
        {
            int _1547 = int(_1521) + 1;
            _1523 = _1547;
        }
        int _1549 = _1523;
        int _1551 = _1549 << 3;
        float _1553 = trunc(_1281);
        float _1555 = precise::max(_1553, 0.0);
        uint _1557 = uint(_1555);
        int _1559 = _1527 | _1551;
        float _1561 = trunc(_1283);
        float _1563 = precise::max(_1561, 0.0);
        uint _1565 = uint(_1563);
        int _1567 = int(_1557);
        if (!_1407)
        {
            int _1569 = int(_1543) + 1;
            _1545 = _1569;
        }
        int _1571 = _1545;
        int _1573 = _1357 * 64;
        int _1575 = _1571 * 512;
        int _1577 = _1391 | _1573;
        int _1579 = _1461 | _1577;
        float _1581 = trunc(_1311);
        float _1583 = precise::max(_1581, 0.0);
        uint _1585 = uint(_1583);
        int _1587 = _1403 << 12;
        int _1589 = _1579 | _1587;
        int _1591 = _1437 | _1589;
        float _1593 = trunc(_1313);
        float _1595 = precise::max(_1593, 0.0);
        uint _1597 = uint(_1595);
        int _1599 = int(_1585);
        if (!_1459)
        {
            int _1601 = int(_1565) + 1;
            _1567 = _1601;
        }
        int _1603 = _1567;
        int _1605 = _1591 | _1485;
        int _1607 = _1509 | _1605;
        int _1609 = _1603 << 6;
        float _1611 = trunc(_1367);
        float _1613 = precise::max(_1611, 0.0);
        uint _1615 = uint(_1613);
        int _1617 = _1559 | _1609;
        int _1619 = _1575 | _1617;
        float _1621 = trunc(_1347);
        float _1623 = precise::max(_1621, 0.0);
        uint _1625 = uint(_1623);
        int _1627 = int(_1615);
        if (!_1429)
        {
            int _1629 = int(_1597) + 1;
            _1599 = _1629;
        }
        int _1631 = _1599;
        int _1633 = _1631 * 4096;
        float _1635 = trunc(_1369);
        float _1637 = precise::max(_1635, 0.0);
        uint _1639 = uint(_1637);
        float _1641 = trunc(_1371);
        float _1643 = precise::max(_1641, 0.0);
        uint _1645 = uint(_1643);
        int _1647 = int(_1639);
        if (!_1483)
        {
            int _1649 = int(_1625) + 1;
            _1627 = _1649;
        }
        int _1651 = _1627;
        int _1653 = _1651 << 15;
        float _1655 = trunc(_1383);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        int _1661 = _1619 | _1633;
        int _1663 = _1653 | _1661;
        float _1665 = trunc(_1431);
        float _1667 = precise::max(_1665, 0.0);
        uint _1669 = uint(_1667);
        int _1671 = int(_1659);
        if (!_1507)
        {
            int _1673 = int(_1645) + 1;
            _1647 = _1673;
        }
        int _1675 = _1647;
        int _1677 = _1675 * 262144;
        if (!_1531)
        {
            int _1679 = int(_1669) + 1;
            _1671 = _1679;
        }
        int _1681 = _1671;
        uint _1683 = uint(int(uint(_1607) >> uint(16)));
        int _1685 = _1681 << 21;
        int _1687 = _1663 | _1677;
        int _1689 = _1685 | _1687;
        uint _1691 = uint(int(uint(_1689) >> uint(8)));
        int _1693 = _1689 * 256;
        int _1695 = _1607 << 16;
        int _1697 = int(_1691) << 16;
        int _1699 = 65280 & _1693;
        int _1701 = int(_1683) | _1699;
        _1041 = _1695;
        _1049 = _1697;
        _1043 = _1701;
    }
    int _1703 = _1041;
    int _1705 = _1049;
    int _1707 = _1043;
    int _1709 = _1019 | _331;
    int _1711 = _1021 | _1023;
    int _1713 = _1703 | _357;
    int _1715 = _1705 | _1707;
    out.m_32.x = as_type<float>(_1709);
    out.m_32.y = as_type<float>(_1711);
    out.m_32.z = as_type<float>(_1713);
    out.m_32.w = as_type<float>(_1715);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _1761 = float3(_63, _61, _65);
    float2 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1761, float3(0.0), isnan(_1761)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1761, float3(0.0), isnan(_1761)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).xy;
    float _71 = _69.x;
    float _73 = _69.y;
    float3 _1782 = float3(_63, _61, _65);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1782, float3(0.0), isnan(_1782)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1782, float3(0.0), isnan(_1782)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float3 _1798 = float3(_63, _61, _65);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1798, float3(0.0), isnan(_1798)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1798, float3(0.0), isnan(_1798)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float3 _1814 = float3(_63, _61, _65);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1814, float3(0.0), isnan(_1814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1814, float3(0.0), isnan(_1814)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float3 _1830 = float3(_63, _61, _65);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1830, float3(0.0), isnan(_1830)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float3 _1846 = float3(_63, _61, _65);
    float2 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1846, float3(0.0), isnan(_1846)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1846, float3(0.0), isnan(_1846)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).xy;
    float _101 = _99.x;
    float _103 = _99.y;
    float3 _1862 = float3(_63, _61, _65);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1862, float3(0.0), isnan(_1862)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1862, float3(0.0), isnan(_1862)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float3 _1878 = float3(_63, _61, _65);
    float2 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1878, float3(0.0), isnan(_1878)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1878, float3(0.0), isnan(_1878)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).xy;
    float _113 = _111.x;
    float _115 = _111.y;
    float3 _1894 = float3(_63, _61, _65);
    float2 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1894, float3(0.0), isnan(_1894)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1894, float3(0.0), isnan(_1894)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).xy;
    float _119 = _117.x;
    float _121 = _117.y;
    float3 _1910 = float3(_63, _61, _65);
    float2 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1910, float3(0.0), isnan(_1910)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1910, float3(0.0), isnan(_1910)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).xy;
    float _125 = _123.x;
    float _127 = _123.y;
    float3 _1926 = float3(_63, _61, _65);
    float2 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1926, float3(0.0), isnan(_1926)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1926, float3(0.0), isnan(_1926)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _131 = _129.x;
    float _133 = _129.y;
    float3 _1941 = float3(_63, _61, _65);
    float2 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1941, float3(0.0), isnan(_1941)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1941, float3(0.0), isnan(_1941)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).xy;
    float _137 = _135.x;
    float _139 = _135.y;
    float3 _1957 = float3(_63, _61, _65);
    float2 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1957, float3(0.0), isnan(_1957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1957, float3(0.0), isnan(_1957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).xy;
    float _143 = _141.x;
    float _145 = _141.y;
    float3 _1973 = float3(_63, _61, _65);
    float2 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1973, float3(0.0), isnan(_1973)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1973, float3(0.0), isnan(_1973)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).xy;
    float _149 = _147.x;
    float _151 = _147.y;
    float3 _1989 = float3(_63, _61, _65);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1989, float3(0.0), isnan(_1989)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1989, float3(0.0), isnan(_1989)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float3 _2005 = float3(_63, _61, _65);
    float2 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2005, float3(0.0), isnan(_2005)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2005, float3(0.0), isnan(_2005)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).xy;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = precise::min(_71, _77);
    float _167 = precise::max(_73, _79);
    float _169 = precise::min(_73, _79);
    float _171 = precise::min(_83, _89);
    float _173 = precise::max(_85, _91);
    float _175 = precise::min(_165, _171);
    float _177 = precise::min(_85, _91);
    float _179 = precise::max(_167, _173);
    float _181 = precise::min(_169, _177);
    float _183 = precise::max(_71, _77);
    float _185 = precise::max(_83, _89);
    float _187 = precise::max(_183, _185);
    float _189 = precise::max(_95, _101);
    float _191 = precise::max(_107, _113);
    float _193 = precise::min(_95, _101);
    float _195 = precise::min(_107, _113);
    float _197 = precise::max(_189, _191);
    float _199 = precise::min(_193, _195);
    float _201 = precise::max(_97, _103);
    float _203 = precise::max(_109, _115);
    float _205 = precise::max(_119, _125);
    float _207 = precise::max(_131, _137);
    float _209 = precise::min(_119, _125);
    float _211 = precise::min(_131, _137);
    float _213 = precise::max(_201, _203);
    float _215 = precise::min(_97, _103);
    float _217 = precise::min(_109, _115);
    float _219 = precise::max(_207, _205);
    float _221 = precise::min(_211, _209);
    float _223 = precise::max(_143, _149);
    float _225 = precise::max(_155, _161);
    float _227 = precise::min(_215, _217);
    float _229 = precise::max(_121, _127);
    float _231 = precise::max(_133, _139);
    float _233 = precise::max(_223, _225);
    float _235 = precise::max(_231, _229);
    float _237 = precise::max(_219, _187);
    float _239 = precise::max(_197, _233);
    float _241 = precise::min(_143, _149);
    float _243 = precise::min(_155, _161);
    float _245 = precise::min(_221, _175);
    float _247 = precise::max(_237, _239);
    float _249 = precise::min(_121, _127);
    float _251 = precise::min(_133, _139);
    float _253 = precise::min(_241, _243);
    float _255 = precise::min(_145, _151);
    float _257 = precise::min(_157, _163);
    float _259 = precise::max(_145, _151);
    float _261 = precise::max(_157, _163);
    float _263 = precise::min(_251, _249);
    float _265 = precise::min(_199, _253);
    float _267 = _247 * 255.0;
    float _269 = precise::min(_255, _257);
    float _271 = precise::max(_259, _261);
    float _273 = precise::min(_263, _181);
    float _275 = precise::min(_245, _265);
    float _277 = precise::min(_227, _269);
    float _279 = trunc(_267);
    float _281 = precise::max(_279, 0.0);
    uint _284 = uint(_281);
    float _286 = precise::max(_213, _271);
    float _288 = precise::max(_235, _179);
    float _290 = _275 * 255.0;
    float _292 = precise::min(_273, _277);
    float _294 = precise::max(_288, _286);
    float _296 = trunc(_290);
    float _298 = precise::max(_296, 0.0);
    uint _300 = uint(_298);
    float _302 = _292 * 255.0;
    float _304 = _294 * 255.0;
    float _306 = trunc(_302);
    float _308 = precise::max(_306, 0.0);
    uint _310 = uint(_308);
    float _312 = trunc(_304);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    bool _320 = _284 > _300;
    int _323 = int(_300) << 8;
    int _325 = _323 & 65280;
    int _327 = int(_310) * 256;
    int _329 = 255 & int(_284);
    int _331 = _325 | _329;
    int _333 = _327 & 65280;
    int _335 = _325;
    int _337 = int(_284);
    int _339 = int(_310);
    int _341 = _333;
    int _343 = as_type<int>(_275);
    int _345 = as_type<int>(_247);
    if (!_320)
    {
        _335 = 0;
    }
    int _347 = _335;
    int _349 = _347;
    if (!_320)
    {
        _337 = 0;
    }
    int _351 = _337;
    bool _353 = _316 > _310;
    int _355 = 255 & int(_316);
    int _357 = _333 | _355;
    int _359 = _351;
    if (!_320)
    {
        _339 = 0;
    }
    int _361 = _339;
    bool _363 = !_320;
    int _365 = _361;
    if (!_363)
    {
        float _367 = -_275;
        float _369 = _247 + _367;
        float _371 = -_275;
        float _373 = _131 + _371;
        float _375 = -_275;
        float _377 = _137 + _375;
        float _379 = -_275;
        float _381 = _119 + _379;
        float _383 = 1.0 / _369;
        float _385 = -_275;
        float _387 = _71 + _385;
        float _389 = -_275;
        float _391 = _125 + _389;
        float _393 = -_275;
        float _395 = _77 + _393;
        float _397 = -_275;
        float _399 = _83 + _397;
        float _401 = -_275;
        float _403 = _89 + _401;
        float _405 = -_275;
        float _407 = _95 + _405;
        float _409 = -_275;
        float _411 = _101 + _409;
        float _413 = -_275;
        float _415 = _107 + _413;
        float _417 = -_275;
        float _419 = _113 + _417;
        float _421 = -_275;
        float _423 = _143 + _421;
        float _425 = -_275;
        float _427 = _149 + _425;
        float _429 = -_275;
        float _431 = _155 + _429;
        float _433 = -_275;
        float _435 = _161 + _433;
        float _437 = _377 * _383;
        float _439 = _381 * _383;
        float _441 = _373 * _383;
        float _443 = _387 * _383;
        float _445 = fma(_437, -1.99999904632568359375, 1.99999904632568359375);
        float _447 = fma(_437, -7.99999904632568359375, 7.99999904632568359375);
        float _449 = fma(_439, -1.99999904632568359375, 1.99999904632568359375);
        float _451 = fma(_439, -7.99999904632568359375, 7.99999904632568359375);
        float _453 = _391 * _383;
        float _455 = _395 * _383;
        float _457 = _399 * _383;
        float _459 = _403 * _383;
        float _461 = _407 * _383;
        float _463 = _411 * _383;
        float _465 = _415 * _383;
        float _467 = _419 * _383;
        float _469 = _423 * _383;
        float _471 = _427 * _383;
        float _473 = _431 * _383;
        float _475 = _435 * _383;
        float _477 = fma(_441, -1.99999904632568359375, 1.99999904632568359375);
        float _479 = fma(_441, -7.99999904632568359375, 7.99999904632568359375);
        float _481 = fma(_443, -1.99999904632568359375, 1.99999904632568359375);
        float _483 = fma(_443, -7.99999904632568359375, 7.99999904632568359375);
        float _485 = -_437;
        float _487 = _485 + 0.5;
        float _489 = -_439;
        float _491 = _489 + 0.5;
        float _493 = -_443;
        float _495 = _493 + 0.5;
        float _497 = trunc(_445);
        float _499 = precise::max(_497, 0.0);
        uint _501 = uint(_499);
        float _503 = fma(_453, -1.99999904632568359375, 1.99999904632568359375);
        float _505 = fma(_453, -7.99999904632568359375, 7.99999904632568359375);
        float _507 = -_441;
        float _509 = _507 + 0.5;
        float _511 = abs(_487);
        bool _513 = _511 >= 0.375;
        float _515 = -_453;
        float _517 = _515 + 0.5;
        float _519 = abs(_491);
        bool _521 = _519 >= 0.375;
        float _523 = fma(_455, -7.99999904632568359375, 7.99999904632568359375);
        float _525 = trunc(_447);
        float _527 = precise::max(_525, 0.0);
        uint _529 = uint(_527);
        float _531 = abs(_495);
        bool _533 = _531 >= 0.375;
        float _535 = -_455;
        float _537 = _535 + 0.5;
        float _539 = abs(_509);
        bool _541 = _539 >= 0.375;
        float _543 = fma(_455, -1.99999904632568359375, 1.99999904632568359375);
        float _545 = abs(_517);
        bool _547 = _545 >= 0.375;
        float _549 = fma(_459, -1.99999904632568359375, 1.99999904632568359375);
        float _551 = abs(_537);
        bool _553 = _551 >= 0.375;
        float _555 = trunc(_449);
        float _557 = precise::max(_555, 0.0);
        uint _559 = uint(_557);
        float _561 = fma(_459, -7.99999904632568359375, 7.99999904632568359375);
        float _563 = fma(_457, -1.99999904632568359375, 1.99999904632568359375);
        float _565 = fma(_457, -7.99999904632568359375, 7.99999904632568359375);
        float _567 = -_459;
        float _569 = _567 + 0.5;
        float _571 = -_457;
        float _573 = _571 + 0.5;
        float _575 = trunc(_451);
        float _577 = precise::max(_575, 0.0);
        uint _579 = uint(_577);
        int _581 = int(_501);
        int _583 = int(_559);
        if (!_513)
        {
            int _585 = int(_529) + 1;
            _581 = _585;
        }
        int _587 = _581;
        float _589 = fma(_463, -1.99999904632568359375, 1.99999904632568359375);
        float _591 = abs(_569);
        bool _593 = _591 >= 0.375;
        float _595 = fma(_463, -7.99999904632568359375, 7.99999904632568359375);
        float _597 = -_463;
        float _599 = _597 + 0.5;
        int _601 = _587 << 3;
        float _603 = trunc(_477);
        float _605 = precise::max(_603, 0.0);
        uint _607 = uint(_605);
        float _609 = trunc(_479);
        float _611 = precise::max(_609, 0.0);
        uint _613 = uint(_611);
        int _615 = int(_607);
        if (!_521)
        {
            int _617 = int(_579) + 1;
            _583 = _617;
        }
        int _619 = _583;
        float _621 = -_461;
        float _623 = _621 + 0.5;
        int _625 = _619 << 6;
        float _627 = abs(_623);
        bool _629 = _627 >= 0.375;
        float _631 = trunc(_503);
        float _633 = precise::max(_631, 0.0);
        uint _635 = uint(_633);
        float _637 = fma(_465, -7.99999904632568359375, 7.99999904632568359375);
        float _639 = trunc(_505);
        float _641 = precise::max(_639, 0.0);
        uint _643 = uint(_641);
        int _645 = int(_635);
        if (!_541)
        {
            int _647 = int(_613) + 1;
            _615 = _647;
        }
        int _649 = _615;
        float _651 = fma(_461, -1.99999904632568359375, 1.99999904632568359375);
        float _653 = abs(_573);
        bool _655 = _653 >= 0.375;
        float _657 = fma(_461, -7.99999904632568359375, 7.99999904632568359375);
        float _659 = fma(_465, -1.99999904632568359375, 1.99999904632568359375);
        float _661 = -_465;
        float _663 = _661 + 0.5;
        int _665 = _649 | _601;
        float _667 = trunc(_481);
        float _669 = precise::max(_667, 0.0);
        uint _671 = uint(_669);
        float _673 = trunc(_483);
        float _675 = precise::max(_673, 0.0);
        uint _677 = uint(_675);
        int _679 = int(_671);
        if (!_547)
        {
            int _681 = int(_643) + 1;
            _645 = _681;
        }
        int _683 = _645;
        float _685 = fma(_467, -1.99999904632568359375, 1.99999904632568359375);
        float _687 = abs(_599);
        bool _689 = _687 >= 0.375;
        float _691 = fma(_467, -7.99999904632568359375, 7.99999904632568359375);
        float _693 = -_467;
        float _695 = _693 + 0.5;
        float _697 = fma(_475, -7.99999904632568359375, 7.99999904632568359375);
        int _699 = _683 << 9;
        float _701 = trunc(_543);
        float _703 = precise::max(_701, 0.0);
        uint _705 = uint(_703);
        int _707 = _665 | _625;
        int _709 = _699 | _707;
        float _711 = trunc(_523);
        float _713 = precise::max(_711, 0.0);
        uint _715 = uint(_713);
        int _717 = int(_705);
        if (!_533)
        {
            int _719 = int(_677) + 1;
            _679 = _719;
        }
        int _721 = _679;
        float _723 = fma(_469, -1.99999904632568359375, 1.99999904632568359375);
        float _725 = abs(_663);
        bool _727 = _725 >= 0.375;
        float _729 = fma(_469, -7.99999904632568359375, 7.99999904632568359375);
        float _731 = -_469;
        float _733 = _731 + 0.5;
        float _735 = trunc(_563);
        float _737 = precise::max(_735, 0.0);
        uint _739 = uint(_737);
        float _741 = trunc(_565);
        float _743 = precise::max(_741, 0.0);
        uint _745 = uint(_743);
        int _747 = int(_739);
        if (!_553)
        {
            int _749 = int(_715) + 1;
            _717 = _749;
        }
        int _751 = _717;
        float _753 = fma(_471, -1.99999904632568359375, 1.99999904632568359375);
        float _755 = abs(_695);
        bool _757 = _755 >= 0.375;
        float _759 = fma(_471, -7.99999904632568359375, 7.99999904632568359375);
        float _761 = -_471;
        float _763 = _761 + 0.5;
        int _765 = _751 * 32768;
        float _767 = trunc(_549);
        float _769 = precise::max(_767, 0.0);
        uint _771 = uint(_769);
        float _773 = trunc(_561);
        float _775 = precise::max(_773, 0.0);
        uint _777 = uint(_775);
        int _779 = int(_771);
        if (!_655)
        {
            int _781 = int(_745) + 1;
            _747 = _781;
        }
        int _783 = _747;
        float _785 = fma(_473, -1.99999904632568359375, 1.99999904632568359375);
        float _787 = fma(_475, -1.99999904632568359375, 1.99999904632568359375);
        float _789 = abs(_733);
        bool _791 = _789 >= 0.375;
        float _793 = fma(_473, -7.99999904632568359375, 7.99999904632568359375);
        float _795 = -_473;
        float _797 = _795 + 0.5;
        float _799 = -_475;
        float _801 = _799 + 0.5;
        float _803 = trunc(_589);
        float _805 = precise::max(_803, 0.0);
        uint _807 = uint(_805);
        float _809 = trunc(_595);
        float _811 = precise::max(_809, 0.0);
        uint _813 = uint(_811);
        int _815 = int(_807);
        if (!_593)
        {
            int _817 = int(_777) + 1;
            _779 = _817;
        }
        int _819 = _779;
        float _821 = abs(_763);
        bool _823 = _821 >= 0.375;
        int _825 = _819 * 2097152;
        float _827 = trunc(_651);
        float _829 = precise::max(_827, 0.0);
        uint _831 = uint(_829);
        float _833 = trunc(_657);
        float _835 = precise::max(_833, 0.0);
        uint _837 = uint(_835);
        int _839 = int(_831);
        if (!_689)
        {
            int _841 = int(_813) + 1;
            _815 = _841;
        }
        int _843 = _815;
        float _845 = abs(_801);
        bool _847 = _845 >= 0.375;
        int _849 = _843 * 8;
        float _851 = trunc(_659);
        float _853 = precise::max(_851, 0.0);
        uint _855 = uint(_853);
        float _857 = trunc(_637);
        float _859 = precise::max(_857, 0.0);
        uint _861 = uint(_859);
        int _863 = int(_855);
        if (!_629)
        {
            int _865 = int(_837) + 1;
            _839 = _865;
        }
        int _867 = _839;
        float _869 = abs(_797);
        bool _871 = _869 >= 0.375;
        int _873 = _867 | _849;
        float _875 = trunc(_685);
        float _877 = precise::max(_875, 0.0);
        uint _879 = uint(_877);
        float _881 = trunc(_691);
        float _883 = precise::max(_881, 0.0);
        uint _885 = uint(_883);
        int _887 = int(_879);
        if (!_727)
        {
            int _889 = int(_861) + 1;
            _863 = _889;
        }
        int _891 = _863;
        int _893 = _891 * 64;
        float _895 = trunc(_723);
        float _897 = precise::max(_895, 0.0);
        uint _899 = uint(_897);
        float _901 = trunc(_729);
        float _903 = precise::max(_901, 0.0);
        uint _905 = uint(_903);
        int _907 = int(_899);
        if (!_757)
        {
            int _909 = int(_885) + 1;
            _887 = _909;
        }
        int _911 = _887;
        int _913 = _911 << 9;
        float _915 = trunc(_753);
        float _917 = precise::max(_915, 0.0);
        uint _919 = uint(_917);
        int _921 = _873 | _893;
        int _923 = _913 | _921;
        int _925 = _721 << 12;
        int _927 = _709 | _925;
        int _929 = _765 | _927;
        float _931 = trunc(_759);
        float _933 = precise::max(_931, 0.0);
        uint _935 = uint(_933);
        int _937 = int(_919);
        if (!_791)
        {
            int _939 = int(_905) + 1;
            _907 = _939;
        }
        int _941 = _907;
        int _943 = _941 << 12;
        int _945 = _783 * 262144;
        float _947 = trunc(_785);
        float _949 = precise::max(_947, 0.0);
        uint _951 = uint(_949);
        int _953 = _929 | _945;
        int _955 = _825 | _953;
        uint _957 = uint(int(uint(_955) >> uint(16)));
        float _959 = trunc(_793);
        float _961 = precise::max(_959, 0.0);
        uint _963 = uint(_961);
        int _965 = int(_951);
        _343 = int(_957);
        if (!_823)
        {
            int _967 = int(_935) + 1;
            _937 = _967;
        }
        int _969 = _937;
        int _971 = _969 << 15;
        float _973 = trunc(_787);
        float _975 = precise::max(_973, 0.0);
        uint _977 = uint(_975);
        int _979 = _923 | _943;
        int _981 = _971 | _979;
        float _983 = trunc(_697);
        float _985 = precise::max(_983, 0.0);
        uint _987 = uint(_985);
        int _989 = int(_977);
        _341 = _981;
        if (!_871)
        {
            int _991 = int(_963) + 1;
            _965 = _991;
        }
        int _993 = _965;
        int _995 = _993 << 18;
        if (!_847)
        {
            int _997 = int(_987) + 1;
            _989 = _997;
        }
        int _999 = _989;
        int _1001 = _999 << 21;
        int _1003 = _981 | _995;
        int _1005 = _1001 | _1003;
        int _1007 = _1005 << 8;
        uint _1009 = uint(int(uint(_1005) >> uint(8)));
        int _1011 = _955 << 16;
        int _1013 = 65280 & _1007;
        int _1015 = int(_957) | _1013;
        int _1017 = int(_1009) * 65536;
        _365 = _1011;
        _359 = _1017;
        _349 = _1015;
        _345 = int(_1009);
    }
    int _1019 = _365;
    int _1021 = _359;
    int _1023 = _349;
    int _1025 = _341;
    int _1027 = _343;
    int _1029 = _345;
    int _1031 = _1025;
    int _1033 = _1029;
    int _1035 = _1027;
    if (!_353)
    {
        _1031 = 0;
        _1033 = 0;
    }
    int _1037 = _1031;
    int _1039 = _1033;
    int _1041 = _1037;
    int _1043 = _1039;
    if (!_353)
    {
        _1035 = 0;
    }
    int _1045 = _1035;
    bool _1047 = !_353;
    int _1049 = _1045;
    if (!_1047)
    {
        float _1051 = -_292;
        float _1053 = _294 + _1051;
        float _1055 = -_292;
        float _1057 = _109 + _1055;
        float _1059 = -_292;
        float _1061 = _139 + _1059;
        float _1063 = -_292;
        float _1065 = _133 + _1063;
        float _1067 = -_292;
        float _1069 = _73 + _1067;
        float _1071 = 1.0 / _1053;
        float _1073 = -_292;
        float _1075 = _151 + _1073;
        float _1077 = -_292;
        float _1079 = _127 + _1077;
        float _1081 = -_292;
        float _1083 = _85 + _1081;
        float _1085 = -_292;
        float _1087 = _91 + _1085;
        float _1089 = -_292;
        float _1091 = _97 + _1089;
        float _1093 = -_292;
        float _1095 = _103 + _1093;
        float _1097 = -_292;
        float _1099 = _157 + _1097;
        float _1101 = -_292;
        float _1103 = _163 + _1101;
        float _1105 = _1057 * _1071;
        float _1107 = -_292;
        float _1109 = _115 + _1107;
        float _1111 = _1061 * _1071;
        float _1113 = _1065 * _1071;
        float _1115 = -_292;
        float _1117 = _121 + _1115;
        float _1119 = _1109 * _1071;
        float _1121 = -_292;
        float _1123 = _145 + _1121;
        float _1125 = _1069 * _1071;
        float _1127 = -_292;
        float _1129 = _79 + _1127;
        float _1131 = fma(_1113, -1.99999904632568359375, 1.99999904632568359375);
        float _1133 = _1123 * _1071;
        float _1135 = fma(_1113, -7.99999904632568359375, 7.99999904632568359375);
        float _1137 = _1117 * _1071;
        float _1139 = -_1113;
        float _1141 = _1139 + 0.5;
        float _1143 = fma(_1111, -1.99999904632568359375, 1.99999904632568359375);
        float _1145 = fma(_1111, -7.99999904632568359375, 7.99999904632568359375);
        float _1147 = _1129 * _1071;
        float _1149 = fma(_1137, -1.99999904632568359375, 1.99999904632568359375);
        float _1151 = fma(_1137, -7.99999904632568359375, 7.99999904632568359375);
        float _1153 = _1079 * _1071;
        float _1155 = abs(_1141);
        bool _1157 = _1155 >= 0.375;
        float _1159 = trunc(_1131);
        float _1161 = precise::max(_1159, 0.0);
        uint _1163 = uint(_1161);
        float _1165 = fma(_1125, -1.99999904632568359375, 1.99999904632568359375);
        float _1167 = fma(_1125, -7.99999904632568359375, 7.99999904632568359375);
        float _1169 = fma(_1147, -1.99999904632568359375, 1.99999904632568359375);
        float _1171 = fma(_1147, -7.99999904632568359375, 7.99999904632568359375);
        float _1173 = -_1111;
        float _1175 = _1173 + 0.5;
        float _1177 = fma(_1153, -1.99999904632568359375, 1.99999904632568359375);
        float _1179 = fma(_1153, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = trunc(_1135);
        float _1183 = precise::max(_1181, 0.0);
        uint _1185 = uint(_1183);
        float _1187 = _1083 * _1071;
        float _1189 = -_1137;
        float _1191 = _1189 + 0.5;
        float _1193 = _1087 * _1071;
        float _1195 = -_1125;
        float _1197 = _1195 + 0.5;
        float _1199 = -_1147;
        float _1201 = _1199 + 0.5;
        float _1203 = abs(_1175);
        bool _1205 = _1203 >= 0.375;
        float _1207 = fma(_1187, -1.99999904632568359375, 1.99999904632568359375);
        float _1209 = trunc(_1143);
        float _1211 = precise::max(_1209, 0.0);
        uint _1213 = uint(_1211);
        float _1215 = fma(_1187, -7.99999904632568359375, 7.99999904632568359375);
        float _1217 = _1091 * _1071;
        float _1219 = -_1153;
        float _1221 = _1219 + 0.5;
        float _1223 = abs(_1191);
        bool _1225 = _1223 >= 0.375;
        float _1227 = fma(_1193, -1.99999904632568359375, 1.99999904632568359375);
        float _1229 = fma(_1193, -7.99999904632568359375, 7.99999904632568359375);
        float _1231 = _1095 * _1071;
        float _1233 = trunc(_1145);
        float _1235 = precise::max(_1233, 0.0);
        uint _1237 = uint(_1235);
        float _1239 = abs(_1197);
        bool _1241 = _1239 >= 0.375;
        float _1243 = fma(_1217, -1.99999904632568359375, 1.99999904632568359375);
        float _1245 = abs(_1201);
        bool _1247 = _1245 >= 0.375;
        float _1249 = fma(_1217, -7.99999904632568359375, 7.99999904632568359375);
        float _1251 = -_1187;
        float _1253 = _1251 + 0.5;
        float _1255 = abs(_1221);
        bool _1257 = _1255 >= 0.375;
        float _1259 = fma(_1231, -1.99999904632568359375, 1.99999904632568359375);
        float _1261 = trunc(_1149);
        float _1263 = precise::max(_1261, 0.0);
        uint _1265 = uint(_1263);
        float _1267 = fma(_1231, -7.99999904632568359375, 7.99999904632568359375);
        float _1269 = -_1193;
        float _1271 = _1269 + 0.5;
        float _1273 = -_1217;
        float _1275 = _1273 + 0.5;
        float _1277 = abs(_1253);
        bool _1279 = _1277 >= 0.375;
        float _1281 = fma(_1105, -1.99999904632568359375, 1.99999904632568359375);
        float _1283 = fma(_1105, -7.99999904632568359375, 7.99999904632568359375);
        float _1285 = fma(_1119, -1.99999904632568359375, 1.99999904632568359375);
        float _1287 = trunc(_1151);
        float _1289 = precise::max(_1287, 0.0);
        uint _1291 = uint(_1289);
        float _1293 = fma(_1119, -7.99999904632568359375, 7.99999904632568359375);
        float _1295 = _1075 * _1071;
        int _1297 = int(_1163);
        int _1299 = int(_1213);
        int _1301 = int(_1265);
        if (!_1157)
        {
            int _1303 = int(_1185) + 1;
            _1297 = _1303;
        }
        int _1305 = _1297;
        float _1307 = -_1231;
        float _1309 = _1307 + 0.5;
        float _1311 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1313 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1315 = abs(_1271);
        bool _1317 = _1315 >= 0.375;
        float _1319 = trunc(_1165);
        float _1321 = precise::max(_1319, 0.0);
        uint _1323 = uint(_1321);
        float _1325 = _1099 * _1071;
        int _1327 = int(_1323);
        if (!_1205)
        {
            int _1329 = int(_1237) + 1;
            _1299 = _1329;
        }
        int _1331 = _1299;
        float _1333 = -_1119;
        float _1335 = _1333 + 0.5;
        float _1337 = -_1133;
        float _1339 = _1337 + 0.5;
        float _1341 = _1103 * _1071;
        float _1343 = abs(_1275);
        bool _1345 = _1343 >= 0.375;
        float _1347 = fma(_1295, -7.99999904632568359375, 7.99999904632568359375);
        float _1349 = trunc(_1167);
        float _1351 = precise::max(_1349, 0.0);
        uint _1353 = uint(_1351);
        if (!_1225)
        {
            int _1355 = int(_1291) + 1;
            _1301 = _1355;
        }
        int _1357 = _1301;
        float _1359 = -_1105;
        float _1361 = _1359 + 0.5;
        float _1363 = abs(_1309);
        bool _1365 = _1363 >= 0.375;
        float _1367 = fma(_1295, -1.99999904632568359375, 1.99999904632568359375);
        float _1369 = fma(_1325, -1.99999904632568359375, 1.99999904632568359375);
        float _1371 = fma(_1325, -7.99999904632568359375, 7.99999904632568359375);
        float _1373 = -_1295;
        float _1375 = _1373 + 0.5;
        float _1377 = trunc(_1169);
        float _1379 = precise::max(_1377, 0.0);
        uint _1381 = uint(_1379);
        float _1383 = fma(_1341, -1.99999904632568359375, 1.99999904632568359375);
        float _1385 = -_1325;
        float _1387 = _1385 + 0.5;
        int _1389 = _1331 << 3;
        int _1391 = _1305 | _1389;
        float _1393 = trunc(_1171);
        float _1395 = precise::max(_1393, 0.0);
        uint _1397 = uint(_1395);
        int _1399 = int(_1381);
        if (!_1241)
        {
            int _1401 = int(_1353) + 1;
            _1327 = _1401;
        }
        int _1403 = _1327;
        float _1405 = abs(_1335);
        bool _1407 = _1405 >= 0.375;
        float _1409 = trunc(_1177);
        float _1411 = precise::max(_1409, 0.0);
        uint _1413 = uint(_1411);
        float _1415 = trunc(_1179);
        float _1417 = precise::max(_1415, 0.0);
        uint _1419 = uint(_1417);
        int _1421 = int(_1413);
        if (!_1247)
        {
            int _1423 = int(_1397) + 1;
            _1399 = _1423;
        }
        int _1425 = _1399;
        float _1427 = abs(_1339);
        bool _1429 = _1427 >= 0.375;
        float _1431 = fma(_1341, -7.99999904632568359375, 7.99999904632568359375);
        float _1433 = -_1341;
        float _1435 = _1433 + 0.5;
        int _1437 = _1425 << 15;
        float _1439 = trunc(_1207);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        float _1445 = trunc(_1215);
        float _1447 = precise::max(_1445, 0.0);
        uint _1449 = uint(_1447);
        int _1451 = int(_1443);
        if (!_1257)
        {
            int _1453 = int(_1419) + 1;
            _1421 = _1453;
        }
        int _1455 = _1421;
        float _1457 = abs(_1361);
        bool _1459 = _1457 >= 0.375;
        int _1461 = _1455 << 9;
        float _1463 = trunc(_1227);
        float _1465 = precise::max(_1463, 0.0);
        uint _1467 = uint(_1465);
        float _1469 = trunc(_1229);
        float _1471 = precise::max(_1469, 0.0);
        uint _1473 = uint(_1471);
        int _1475 = int(_1467);
        if (!_1279)
        {
            int _1477 = int(_1449) + 1;
            _1451 = _1477;
        }
        int _1479 = _1451;
        float _1481 = abs(_1375);
        bool _1483 = _1481 >= 0.375;
        int _1485 = _1479 << 18;
        float _1487 = trunc(_1243);
        float _1489 = precise::max(_1487, 0.0);
        uint _1491 = uint(_1489);
        float _1493 = trunc(_1249);
        float _1495 = precise::max(_1493, 0.0);
        uint _1497 = uint(_1495);
        int _1499 = int(_1491);
        if (!_1317)
        {
            int _1501 = int(_1473) + 1;
            _1475 = _1501;
        }
        int _1503 = _1475;
        float _1505 = abs(_1387);
        bool _1507 = _1505 >= 0.375;
        int _1509 = _1503 << 21;
        float _1511 = trunc(_1259);
        float _1513 = precise::max(_1511, 0.0);
        uint _1515 = uint(_1513);
        float _1517 = trunc(_1267);
        float _1519 = precise::max(_1517, 0.0);
        uint _1521 = uint(_1519);
        int _1523 = int(_1515);
        if (!_1345)
        {
            int _1525 = int(_1497) + 1;
            _1499 = _1525;
        }
        int _1527 = _1499;
        float _1529 = abs(_1435);
        bool _1531 = _1529 >= 0.375;
        float _1533 = trunc(_1285);
        float _1535 = precise::max(_1533, 0.0);
        uint _1537 = uint(_1535);
        float _1539 = trunc(_1293);
        float _1541 = precise::max(_1539, 0.0);
        uint _1543 = uint(_1541);
        int _1545 = int(_1537);
        if (!_1365)
        {
            int _1547 = int(_1521) + 1;
            _1523 = _1547;
        }
        int _1549 = _1523;
        int _1551 = _1549 << 3;
        float _1553 = trunc(_1281);
        float _1555 = precise::max(_1553, 0.0);
        uint _1557 = uint(_1555);
        int _1559 = _1527 | _1551;
        float _1561 = trunc(_1283);
        float _1563 = precise::max(_1561, 0.0);
        uint _1565 = uint(_1563);
        int _1567 = int(_1557);
        if (!_1407)
        {
            int _1569 = int(_1543) + 1;
            _1545 = _1569;
        }
        int _1571 = _1545;
        int _1573 = _1357 * 64;
        int _1575 = _1571 * 512;
        int _1577 = _1391 | _1573;
        int _1579 = _1461 | _1577;
        float _1581 = trunc(_1311);
        float _1583 = precise::max(_1581, 0.0);
        uint _1585 = uint(_1583);
        int _1587 = _1403 << 12;
        int _1589 = _1579 | _1587;
        int _1591 = _1437 | _1589;
        float _1593 = trunc(_1313);
        float _1595 = precise::max(_1593, 0.0);
        uint _1597 = uint(_1595);
        int _1599 = int(_1585);
        if (!_1459)
        {
            int _1601 = int(_1565) + 1;
            _1567 = _1601;
        }
        int _1603 = _1567;
        int _1605 = _1591 | _1485;
        int _1607 = _1509 | _1605;
        int _1609 = _1603 << 6;
        float _1611 = trunc(_1367);
        float _1613 = precise::max(_1611, 0.0);
        uint _1615 = uint(_1613);
        int _1617 = _1559 | _1609;
        int _1619 = _1575 | _1617;
        float _1621 = trunc(_1347);
        float _1623 = precise::max(_1621, 0.0);
        uint _1625 = uint(_1623);
        int _1627 = int(_1615);
        if (!_1429)
        {
            int _1629 = int(_1597) + 1;
            _1599 = _1629;
        }
        int _1631 = _1599;
        int _1633 = _1631 * 4096;
        float _1635 = trunc(_1369);
        float _1637 = precise::max(_1635, 0.0);
        uint _1639 = uint(_1637);
        float _1641 = trunc(_1371);
        float _1643 = precise::max(_1641, 0.0);
        uint _1645 = uint(_1643);
        int _1647 = int(_1639);
        if (!_1483)
        {
            int _1649 = int(_1625) + 1;
            _1627 = _1649;
        }
        int _1651 = _1627;
        int _1653 = _1651 << 15;
        float _1655 = trunc(_1383);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        int _1661 = _1619 | _1633;
        int _1663 = _1653 | _1661;
        float _1665 = trunc(_1431);
        float _1667 = precise::max(_1665, 0.0);
        uint _1669 = uint(_1667);
        int _1671 = int(_1659);
        if (!_1507)
        {
            int _1673 = int(_1645) + 1;
            _1647 = _1673;
        }
        int _1675 = _1647;
        int _1677 = _1675 * 262144;
        if (!_1531)
        {
            int _1679 = int(_1669) + 1;
            _1671 = _1679;
        }
        int _1681 = _1671;
        uint _1683 = uint(int(uint(_1607) >> uint(16)));
        int _1685 = _1681 << 21;
        int _1687 = _1663 | _1677;
        int _1689 = _1685 | _1687;
        uint _1691 = uint(int(uint(_1689) >> uint(8)));
        int _1693 = _1689 * 256;
        int _1695 = _1607 << 16;
        int _1697 = int(_1691) << 16;
        int _1699 = 65280 & _1693;
        int _1701 = int(_1683) | _1699;
        _1041 = _1695;
        _1049 = _1697;
        _1043 = _1701;
    }
    int _1703 = _1041;
    int _1705 = _1049;
    int _1707 = _1043;
    int _1709 = _1019 | _331;
    int _1711 = _1021 | _1023;
    int _1713 = _1703 | _357;
    int _1715 = _1705 | _1707;
    out.m_32.x = as_type<float>(_1709);
    out.m_32.y = as_type<float>(_1711);
    out.m_32.z = as_type<float>(_1713);
    out.m_32.w = as_type<float>(_1715);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

