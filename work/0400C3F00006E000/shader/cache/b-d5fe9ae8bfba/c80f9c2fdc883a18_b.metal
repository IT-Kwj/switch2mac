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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _1728 = float2(_55, _57);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1728, float2(0.0), isnan(_1728)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1728, float2(0.0), isnan(_1728)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float2 _1749 = float2(_55, _57);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1749, float2(0.0), isnan(_1749)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1749, float2(0.0), isnan(_1749)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xy;
    float _69 = _67.x;
    float _71 = _67.y;
    float2 _1764 = float2(_55, _57);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1764, float2(0.0), isnan(_1764)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1764, float2(0.0), isnan(_1764)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float2 _1779 = float2(_55, _57);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1779, float2(0.0), isnan(_1779)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1779, float2(0.0), isnan(_1779)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _1794 = float2(_55, _57);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1794, float2(0.0), isnan(_1794)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1794, float2(0.0), isnan(_1794)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float2 _1809 = float2(_55, _57);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1809, float2(0.0), isnan(_1809)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1809, float2(0.0), isnan(_1809)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float2 _1824 = float2(_55, _57);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1824, float2(0.0), isnan(_1824)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1824, float2(0.0), isnan(_1824)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _1839 = float2(_55, _57);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1839, float2(0.0), isnan(_1839)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1839, float2(0.0), isnan(_1839)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    float2 _1853 = float2(_55, _57);
    float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1853, float2(0.0), isnan(_1853)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1853, float2(0.0), isnan(_1853)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xy;
    float _111 = _109.x;
    float _113 = _109.y;
    float2 _1868 = float2(_55, _57);
    float2 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1868, float2(0.0), isnan(_1868)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1868, float2(0.0), isnan(_1868)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xy;
    float _117 = _115.x;
    float _119 = _115.y;
    float2 _1883 = float2(_55, _57);
    float2 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1883, float2(0.0), isnan(_1883)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1883, float2(0.0), isnan(_1883)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xy;
    float _123 = _121.x;
    float _125 = _121.y;
    float2 _1898 = float2(_55, _57);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1898, float2(0.0), isnan(_1898)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1898, float2(0.0), isnan(_1898)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float2 _1913 = float2(_55, _57);
    float2 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1913, float2(0.0), isnan(_1913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1913, float2(0.0), isnan(_1913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xy;
    float _135 = _133.x;
    float _137 = _133.y;
    float2 _1928 = float2(_55, _57);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1928, float2(0.0), isnan(_1928)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1928, float2(0.0), isnan(_1928)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float2 _1943 = float2(_55, _57);
    float2 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1943, float2(0.0), isnan(_1943)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1943, float2(0.0), isnan(_1943)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xy;
    float _147 = _145.x;
    float _149 = _145.y;
    float2 _1958 = float2(_55, _57);
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1958, float2(0.0), isnan(_1958)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1958, float2(0.0), isnan(_1958)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xy;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = precise::max(_63, _69);
    float _159 = precise::max(_105, _99);
    float _161 = precise::max(_75, _81);
    float _163 = precise::max(_159, _157);
    float _165 = precise::max(_87, _93);
    float _167 = precise::max(_161, _165);
    float _169 = precise::max(_111, _117);
    float _171 = precise::max(_163, _167);
    float _173 = precise::max(_123, _129);
    float _175 = precise::max(_135, _141);
    float _177 = precise::max(_147, _153);
    float _179 = precise::max(_169, _173);
    float _181 = precise::max(_175, _177);
    float _183 = precise::min(_105, _99);
    float _185 = precise::max(_179, _181);
    float _187 = precise::min(_87, _93);
    float _189 = precise::max(_171, _185);
    float _191 = precise::min(_63, _69);
    float _193 = precise::min(_183, _191);
    float _195 = precise::min(_75, _81);
    float _197 = precise::min(_195, _187);
    float _199 = precise::min(_147, _153);
    float _201 = precise::min(_193, _197);
    float _203 = precise::min(_111, _117);
    float _205 = precise::min(_123, _129);
    float _207 = precise::min(_203, _205);
    float _209 = precise::min(_135, _141);
    float _211 = precise::min(_209, _199);
    float _213 = precise::min(_207, _211);
    float _215 = _189 * 127.0;
    float _217 = precise::min(_201, _213);
    float _219 = trunc(_215);
    float _221 = precise::max(_219, 0.0);
    uint _224 = uint(_221);
    float _226 = _217 * 127.0;
    float _228 = trunc(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    bool _236 = _224 > _232;
    int _239 = int(_232) << 8;
    int _241 = _239 & 65280;
    int _243 = 255 & int(_224);
    int _245 = _241 | _243;
    int _247 = int(_232);
    int _249 = int(_224);
    int _251 = _241;
    if (!_236)
    {
        _247 = 0;
        _249 = 0;
    }
    int _253 = _247;
    int _255 = _249;
    int _257 = _253;
    int _259 = _255;
    if (!_236)
    {
        _251 = 0;
    }
    int _261 = _251;
    bool _263 = !_236;
    int _265 = _261;
    if (!_263)
    {
        float _267 = -_217;
        float _269 = _189 + _267;
        float _271 = -_217;
        float _273 = _105 + _271;
        float _275 = -_217;
        float _277 = _99 + _275;
        float _279 = -_217;
        float _281 = _63 + _279;
        float _283 = -_217;
        float _285 = _69 + _283;
        float _287 = 1.0 / _269;
        float _289 = -_217;
        float _291 = _75 + _289;
        float _293 = -_217;
        float _295 = _81 + _293;
        float _297 = -_217;
        float _299 = _87 + _297;
        float _301 = -_217;
        float _303 = _93 + _301;
        float _305 = -_217;
        float _307 = _111 + _305;
        float _309 = -_217;
        float _311 = _117 + _309;
        float _313 = -_217;
        float _315 = _123 + _313;
        float _317 = -_217;
        float _319 = _129 + _317;
        float _321 = -_217;
        float _323 = _135 + _321;
        float _325 = -_217;
        float _327 = _141 + _325;
        float _329 = -_217;
        float _331 = _147 + _329;
        float _333 = -_217;
        float _335 = _153 + _333;
        float _337 = _273 * _287;
        float _339 = _277 * _287;
        float _341 = _281 * _287;
        float _343 = _285 * _287;
        float _345 = -_337;
        float _347 = _345 + 0.5;
        float _349 = fma(_337, -1.99999904632568359375, 1.99999904632568359375);
        float _351 = _291 * _287;
        float _353 = _327 * _287;
        float _355 = _335 * _287;
        float _357 = abs(_347);
        bool _359 = _357 >= 0.375;
        float _361 = trunc(_349);
        float _363 = precise::max(_361, 0.0);
        uint _365 = uint(_363);
        float _367 = -_353;
        float _369 = _367 + 0.5;
        float _371 = fma(_337, -7.99999904632568359375, 7.99999904632568359375);
        float _373 = trunc(_371);
        float _375 = precise::max(_373, 0.0);
        uint _377 = uint(_375);
        int _379 = int(_365);
        if (!_359)
        {
            int _381 = int(_377) + 1;
            _379 = _381;
        }
        int _383 = _379;
        float _385 = -_339;
        float _387 = _385 + 0.5;
        float _389 = abs(_387);
        bool _391 = _389 >= 0.375;
        float _393 = fma(_339, -1.99999904632568359375, 1.99999904632568359375);
        float _395 = fma(_339, -7.99999904632568359375, 7.99999904632568359375);
        float _397 = trunc(_393);
        float _399 = precise::max(_397, 0.0);
        uint _401 = uint(_399);
        float _403 = trunc(_395);
        float _405 = precise::max(_403, 0.0);
        uint _407 = uint(_405);
        int _409 = int(_401);
        if (!_391)
        {
            int _411 = int(_407) + 1;
            _409 = _411;
        }
        int _413 = _409;
        float _415 = -_341;
        float _417 = _415 + 0.5;
        int _419 = _413 << 3;
        float _421 = abs(_417);
        bool _423 = _421 >= 0.375;
        int _425 = _383 | _419;
        float _427 = fma(_341, -1.99999904632568359375, 1.99999904632568359375);
        float _429 = trunc(_427);
        float _431 = precise::max(_429, 0.0);
        uint _433 = uint(_431);
        float _435 = fma(_341, -7.99999904632568359375, 7.99999904632568359375);
        float _437 = trunc(_435);
        float _439 = precise::max(_437, 0.0);
        uint _441 = uint(_439);
        int _443 = int(_433);
        if (!_423)
        {
            int _445 = int(_441) + 1;
            _443 = _445;
        }
        int _447 = _443;
        float _449 = -_343;
        float _451 = _449 + 0.5;
        int _453 = _447 * 64;
        float _455 = abs(_451);
        bool _457 = _455 >= 0.375;
        float _459 = fma(_343, -1.99999904632568359375, 1.99999904632568359375);
        float _461 = fma(_343, -7.99999904632568359375, 7.99999904632568359375);
        float _463 = trunc(_459);
        float _465 = precise::max(_463, 0.0);
        uint _467 = uint(_465);
        float _469 = trunc(_461);
        float _471 = precise::max(_469, 0.0);
        uint _473 = uint(_471);
        int _475 = int(_467);
        if (!_457)
        {
            int _477 = int(_473) + 1;
            _475 = _477;
        }
        int _479 = _475;
        float _481 = _295 * _287;
        int _483 = _479 << 9;
        float _485 = fma(_351, -1.99999904632568359375, 1.99999904632568359375);
        float _487 = -_481;
        float _489 = _487 + 0.5;
        int _491 = _425 | _453;
        int _493 = _483 | _491;
        float _495 = -_351;
        float _497 = _495 + 0.5;
        float _499 = fma(_351, -7.99999904632568359375, 7.99999904632568359375);
        float _501 = fma(_481, -1.99999904632568359375, 1.99999904632568359375);
        float _503 = fma(_481, -7.99999904632568359375, 7.99999904632568359375);
        float _505 = abs(_497);
        bool _507 = _505 >= 0.375;
        float _509 = trunc(_485);
        float _511 = precise::max(_509, 0.0);
        uint _513 = uint(_511);
        float _515 = trunc(_499);
        float _517 = precise::max(_515, 0.0);
        uint _519 = uint(_517);
        float _521 = trunc(_503);
        float _523 = precise::max(_521, 0.0);
        uint _525 = uint(_523);
        int _527 = int(_513);
        if (!_507)
        {
            int _529 = int(_519) + 1;
            _527 = _529;
        }
        int _531 = _527;
        float _533 = _299 * _287;
        float _535 = abs(_489);
        bool _537 = _535 >= 0.375;
        float _539 = trunc(_501);
        float _541 = precise::max(_539, 0.0);
        uint _543 = uint(_541);
        float _545 = -_533;
        float _547 = _545 + 0.5;
        float _549 = fma(_533, -1.99999904632568359375, 1.99999904632568359375);
        float _551 = fma(_533, -7.99999904632568359375, 7.99999904632568359375);
        float _553 = trunc(_551);
        float _555 = precise::max(_553, 0.0);
        uint _557 = uint(_555);
        int _559 = int(_543);
        if (!_537)
        {
            int _561 = int(_525) + 1;
            _559 = _561;
        }
        int _563 = _559;
        float _565 = _303 * _287;
        float _567 = abs(_547);
        bool _569 = _567 >= 0.375;
        float _571 = trunc(_549);
        float _573 = precise::max(_571, 0.0);
        uint _575 = uint(_573);
        float _577 = -_565;
        float _579 = _577 + 0.5;
        float _581 = fma(_565, -1.99999904632568359375, 1.99999904632568359375);
        float _583 = fma(_565, -7.99999904632568359375, 7.99999904632568359375);
        int _585 = _563 * 32768;
        float _587 = trunc(_583);
        float _589 = precise::max(_587, 0.0);
        uint _591 = uint(_589);
        int _593 = int(_575);
        if (!_569)
        {
            int _595 = int(_557) + 1;
            _593 = _595;
        }
        int _597 = _593;
        float _599 = _307 * _287;
        float _601 = abs(_579);
        bool _603 = _601 >= 0.375;
        float _605 = trunc(_581);
        float _607 = precise::max(_605, 0.0);
        uint _609 = uint(_607);
        float _611 = -_599;
        float _613 = _611 + 0.5;
        float _615 = fma(_599, -1.99999904632568359375, 1.99999904632568359375);
        float _617 = fma(_599, -7.99999904632568359375, 7.99999904632568359375);
        float _619 = trunc(_617);
        float _621 = precise::max(_619, 0.0);
        uint _623 = uint(_621);
        int _625 = int(_609);
        if (!_603)
        {
            int _627 = int(_591) + 1;
            _625 = _627;
        }
        int _629 = _625;
        float _631 = _311 * _287;
        float _633 = abs(_613);
        bool _635 = _633 >= 0.375;
        float _637 = trunc(_615);
        float _639 = precise::max(_637, 0.0);
        uint _641 = uint(_639);
        float _643 = -_631;
        float _645 = _643 + 0.5;
        float _647 = fma(_631, -1.99999904632568359375, 1.99999904632568359375);
        float _649 = fma(_631, -7.99999904632568359375, 7.99999904632568359375);
        int _651 = _629 * 2097152;
        float _653 = trunc(_649);
        float _655 = precise::max(_653, 0.0);
        uint _657 = uint(_655);
        int _659 = int(_641);
        if (!_635)
        {
            int _661 = int(_623) + 1;
            _659 = _661;
        }
        int _663 = _659;
        float _665 = _315 * _287;
        float _667 = abs(_645);
        bool _669 = _667 >= 0.375;
        float _671 = trunc(_647);
        float _673 = precise::max(_671, 0.0);
        uint _675 = uint(_673);
        float _677 = -_665;
        float _679 = _677 + 0.5;
        float _681 = fma(_665, -1.99999904632568359375, 1.99999904632568359375);
        float _683 = fma(_665, -7.99999904632568359375, 7.99999904632568359375);
        float _685 = trunc(_683);
        float _687 = precise::max(_685, 0.0);
        uint _689 = uint(_687);
        int _691 = int(_675);
        if (!_669)
        {
            int _693 = int(_657) + 1;
            _691 = _693;
        }
        int _695 = _691;
        float _697 = _319 * _287;
        float _699 = abs(_679);
        bool _701 = _699 >= 0.375;
        float _703 = trunc(_681);
        float _705 = precise::max(_703, 0.0);
        uint _707 = uint(_705);
        float _709 = -_697;
        float _711 = _709 + 0.5;
        float _713 = fma(_697, -1.99999904632568359375, 1.99999904632568359375);
        float _715 = fma(_697, -7.99999904632568359375, 7.99999904632568359375);
        int _717 = _695 * 8;
        float _719 = trunc(_715);
        float _721 = precise::max(_719, 0.0);
        uint _723 = uint(_721);
        int _725 = _663 | _717;
        float _727 = _331 * _287;
        int _729 = int(_707);
        if (!_701)
        {
            int _731 = int(_689) + 1;
            _729 = _731;
        }
        int _733 = _729;
        float _735 = _323 * _287;
        float _737 = abs(_711);
        bool _739 = _737 >= 0.375;
        float _741 = fma(_355, -1.99999904632568359375, 1.99999904632568359375);
        float _743 = trunc(_713);
        float _745 = precise::max(_743, 0.0);
        uint _747 = uint(_745);
        float _749 = -_735;
        float _751 = _749 + 0.5;
        float _753 = fma(_735, -1.99999904632568359375, 1.99999904632568359375);
        float _755 = fma(_735, -7.99999904632568359375, 7.99999904632568359375);
        float _757 = trunc(_741);
        float _759 = precise::max(_757, 0.0);
        uint _761 = uint(_759);
        int _763 = int(_747);
        int _765 = int(_761);
        if (!_739)
        {
            int _767 = int(_723) + 1;
            _763 = _767;
        }
        int _769 = _763;
        float _771 = trunc(_755);
        float _773 = precise::max(_771, 0.0);
        uint _775 = uint(_773);
        float _777 = abs(_751);
        bool _779 = _777 >= 0.375;
        float _781 = fma(_353, -1.99999904632568359375, 1.99999904632568359375);
        float _783 = fma(_353, -7.99999904632568359375, 7.99999904632568359375);
        int _785 = _769 * 512;
        float _787 = trunc(_753);
        float _789 = precise::max(_787, 0.0);
        uint _791 = uint(_789);
        float _793 = trunc(_781);
        float _795 = precise::max(_793, 0.0);
        uint _797 = uint(_795);
        int _799 = int(_791);
        int _801 = int(_797);
        if (!_779)
        {
            int _803 = int(_775) + 1;
            _799 = _803;
        }
        int _805 = _799;
        float _807 = trunc(_783);
        float _809 = precise::max(_807, 0.0);
        uint _811 = uint(_809);
        float _813 = abs(_369);
        bool _815 = _813 >= 0.375;
        float _817 = -_727;
        float _819 = _817 + 0.5;
        int _821 = _805 << 12;
        float _823 = abs(_819);
        bool _825 = _823 >= 0.375;
        float _827 = fma(_727, -1.99999904632568359375, 1.99999904632568359375);
        float _829 = fma(_727, -7.99999904632568359375, 7.99999904632568359375);
        float _831 = fma(_355, -7.99999904632568359375, 7.99999904632568359375);
        float _833 = -_355;
        float _835 = _833 + 0.5;
        float _837 = trunc(_827);
        float _839 = precise::max(_837, 0.0);
        uint _841 = uint(_839);
        float _843 = abs(_835);
        bool _845 = _843 >= 0.375;
        int _847 = _733 << 6;
        int _849 = int(_841);
        if (!_815)
        {
            int _851 = int(_811) + 1;
            _801 = _851;
        }
        int _853 = _801;
        float _855 = trunc(_829);
        float _857 = precise::max(_855, 0.0);
        uint _859 = uint(_857);
        int _861 = _725 | _847;
        int _863 = _785 | _861;
        int _865 = _531 << 12;
        int _867 = _853 << 15;
        int _869 = _493 | _865;
        int _871 = _585 | _869;
        float _873 = trunc(_831);
        float _875 = precise::max(_873, 0.0);
        uint _877 = uint(_875);
        int _879 = _863 | _821;
        int _881 = _867 | _879;
        if (!_825)
        {
            int _883 = int(_859) + 1;
            _849 = _883;
        }
        int _885 = _849;
        int _887 = _885 << 18;
        if (!_845)
        {
            int _889 = int(_877) + 1;
            _765 = _889;
        }
        int _891 = _765;
        int _893 = _597 * 262144;
        int _895 = _891 << 21;
        int _897 = _871 | _893;
        int _899 = _651 | _897;
        int _901 = _881 | _887;
        int _903 = _895 | _901;
        uint _905 = uint(int(uint(_899) >> uint(16)));
        uint _907 = uint(int(uint(_903) >> uint(8)));
        int _909 = _903 << 8;
        int _911 = _899 << 16;
        int _913 = int(_907) * 65536;
        int _915 = 65280 & _909;
        int _917 = int(_905) | _915;
        _257 = _911;
        _259 = _913;
        _265 = _917;
    }
    int _919 = _257;
    int _921 = _259;
    int _923 = _265;
    float _925 = precise::max(_77, _83);
    float _927 = precise::max(_89, _95);
    float _929 = precise::min(_77, _83);
    float _931 = precise::min(_89, _95);
    float _933 = precise::max(_113, _119);
    float _935 = precise::max(_125, _131);
    float _937 = precise::min(_113, _119);
    float _939 = precise::min(_125, _131);
    float _941 = precise::max(_925, _927);
    float _943 = precise::max(_65, _71);
    float _945 = precise::max(_107, _101);
    float _947 = precise::min(_929, _931);
    float _949 = precise::max(_933, _935);
    float _951 = precise::min(_937, _939);
    float _953 = precise::max(_137, _143);
    float _955 = precise::max(_149, _155);
    float _957 = precise::max(_945, _943);
    float _959 = precise::min(_65, _71);
    float _961 = precise::min(_107, _101);
    float _963 = precise::min(_137, _143);
    float _965 = precise::min(_149, _155);
    float _967 = precise::max(_953, _955);
    float _969 = precise::max(_957, _941);
    float _971 = precise::min(_961, _959);
    float _973 = precise::min(_963, _965);
    float _975 = precise::max(_949, _967);
    float _977 = precise::min(_971, _947);
    float _979 = precise::min(_951, _973);
    float _981 = precise::max(_969, _975);
    float _983 = precise::min(_977, _979);
    float _985 = _981 * 127.0;
    float _987 = _983 * 127.0;
    float _989 = trunc(_985);
    float _991 = precise::max(_989, 0.0);
    uint _993 = uint(_991);
    float _995 = trunc(_987);
    float _997 = precise::max(_995, 0.0);
    uint _999 = uint(_997);
    bool _1001 = _993 > _999;
    int _1003 = int(_999) << 8;
    int _1005 = _1003 & 65280;
    int _1007 = 255 & int(_993);
    int _1009 = _1005 | _1007;
    int _1011 = as_type<int>(_975);
    int _1013 = _1005;
    int _1015 = as_type<int>(_977);
    if (!_1001)
    {
        _1011 = 0;
    }
    int _1017 = _1011;
    int _1019 = _1017;
    if (!_1001)
    {
        _1013 = 0;
    }
    int _1021 = _1013;
    int _1023 = _1021;
    if (!_1001)
    {
        _1015 = 0;
    }
    int _1025 = _1015;
    bool _1027 = !_1001;
    int _1029 = _1025;
    if (!_1027)
    {
        float _1031 = -_983;
        float _1033 = _981 + _1031;
        float _1035 = -_983;
        float _1037 = _107 + _1035;
        float _1039 = -_983;
        float _1041 = _101 + _1039;
        float _1043 = -_983;
        float _1045 = _71 + _1043;
        float _1047 = 1.0 / _1033;
        float _1049 = -_983;
        float _1051 = _65 + _1049;
        float _1053 = -_983;
        float _1055 = _77 + _1053;
        float _1057 = -_983;
        float _1059 = _95 + _1057;
        float _1061 = -_983;
        float _1063 = _83 + _1061;
        float _1065 = -_983;
        float _1067 = _89 + _1065;
        float _1069 = -_983;
        float _1071 = _113 + _1069;
        float _1073 = -_983;
        float _1075 = _119 + _1073;
        float _1077 = -_983;
        float _1079 = _125 + _1077;
        float _1081 = -_983;
        float _1083 = _131 + _1081;
        float _1085 = -_983;
        float _1087 = _137 + _1085;
        float _1089 = -_983;
        float _1091 = _143 + _1089;
        float _1093 = -_983;
        float _1095 = _149 + _1093;
        float _1097 = -_983;
        float _1099 = _155 + _1097;
        float _1101 = _1037 * _1047;
        float _1103 = _1041 * _1047;
        float _1105 = _1045 * _1047;
        float _1107 = _1051 * _1047;
        float _1109 = fma(_1101, -1.99999904632568359375, 1.99999904632568359375);
        float _1111 = fma(_1101, -7.99999904632568359375, 7.99999904632568359375);
        float _1113 = fma(_1103, -1.99999904632568359375, 1.99999904632568359375);
        float _1115 = fma(_1103, -7.99999904632568359375, 7.99999904632568359375);
        float _1117 = _1055 * _1047;
        float _1119 = -_1101;
        float _1121 = _1119 + 0.5;
        float _1123 = -_1103;
        float _1125 = _1123 + 0.5;
        float _1127 = fma(_1105, -1.99999904632568359375, 1.99999904632568359375);
        float _1129 = fma(_1105, -7.99999904632568359375, 7.99999904632568359375);
        float _1131 = _1063 * _1047;
        float _1133 = _1067 * _1047;
        float _1135 = _1059 * _1047;
        float _1137 = _1071 * _1047;
        float _1139 = _1075 * _1047;
        float _1141 = _1079 * _1047;
        float _1143 = _1083 * _1047;
        float _1145 = _1087 * _1047;
        float _1147 = _1091 * _1047;
        float _1149 = _1095 * _1047;
        float _1151 = _1099 * _1047;
        float _1153 = trunc(_1109);
        float _1155 = precise::max(_1153, 0.0);
        uint _1157 = uint(_1155);
        float _1159 = fma(_1107, -1.99999904632568359375, 1.99999904632568359375);
        float _1161 = fma(_1107, -7.99999904632568359375, 7.99999904632568359375);
        float _1163 = fma(_1117, -1.99999904632568359375, 1.99999904632568359375);
        float _1165 = fma(_1117, -7.99999904632568359375, 7.99999904632568359375);
        float _1167 = -_1117;
        float _1169 = _1167 + 0.5;
        float _1171 = abs(_1121);
        bool _1173 = _1171 >= 0.375;
        float _1175 = fma(_1131, -1.99999904632568359375, 1.99999904632568359375);
        float _1177 = trunc(_1111);
        float _1179 = precise::max(_1177, 0.0);
        uint _1181 = uint(_1179);
        float _1183 = abs(_1125);
        bool _1185 = _1183 >= 0.375;
        float _1187 = fma(_1131, -7.99999904632568359375, 7.99999904632568359375);
        float _1189 = -_1105;
        float _1191 = _1189 + 0.5;
        float _1193 = -_1107;
        float _1195 = _1193 + 0.5;
        float _1197 = abs(_1169);
        bool _1199 = _1197 >= 0.375;
        float _1201 = -_1131;
        float _1203 = _1201 + 0.5;
        float _1205 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1207 = trunc(_1113);
        float _1209 = precise::max(_1207, 0.0);
        uint _1211 = uint(_1209);
        float _1213 = abs(_1191);
        bool _1215 = _1213 >= 0.375;
        float _1217 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1219 = abs(_1195);
        bool _1221 = _1219 >= 0.375;
        float _1223 = -_1133;
        float _1225 = _1223 + 0.5;
        float _1227 = abs(_1203);
        bool _1229 = _1227 >= 0.375;
        float _1231 = fma(_1135, -1.99999904632568359375, 1.99999904632568359375);
        float _1233 = fma(_1135, -7.99999904632568359375, 7.99999904632568359375);
        float _1235 = trunc(_1115);
        float _1237 = precise::max(_1235, 0.0);
        uint _1239 = uint(_1237);
        float _1241 = abs(_1225);
        bool _1243 = _1241 >= 0.375;
        float _1245 = fma(_1137, -1.99999904632568359375, 1.99999904632568359375);
        int _1247 = int(_1157);
        int _1249 = int(_1211);
        if (!_1173)
        {
            int _1251 = int(_1181) + 1;
            _1247 = _1251;
        }
        int _1253 = _1247;
        float _1255 = fma(_1137, -7.99999904632568359375, 7.99999904632568359375);
        float _1257 = -_1135;
        float _1259 = _1257 + 0.5;
        float _1261 = fma(_1139, -1.99999904632568359375, 1.99999904632568359375);
        float _1263 = -_1137;
        float _1265 = _1263 + 0.5;
        float _1267 = trunc(_1127);
        float _1269 = precise::max(_1267, 0.0);
        uint _1271 = uint(_1269);
        float _1273 = abs(_1259);
        bool _1275 = _1273 >= 0.375;
        float _1277 = trunc(_1129);
        float _1279 = precise::max(_1277, 0.0);
        uint _1281 = uint(_1279);
        int _1283 = int(_1271);
        if (!_1185)
        {
            int _1285 = int(_1239) + 1;
            _1249 = _1285;
        }
        int _1287 = _1249;
        float _1289 = fma(_1139, -7.99999904632568359375, 7.99999904632568359375);
        float _1291 = -_1139;
        float _1293 = _1291 + 0.5;
        float _1295 = abs(_1265);
        bool _1297 = _1295 >= 0.375;
        float _1299 = fma(_1141, -1.99999904632568359375, 1.99999904632568359375);
        float _1301 = trunc(_1159);
        float _1303 = precise::max(_1301, 0.0);
        uint _1305 = uint(_1303);
        float _1307 = trunc(_1161);
        float _1309 = precise::max(_1307, 0.0);
        uint _1311 = uint(_1309);
        int _1313 = int(_1305);
        if (!_1215)
        {
            int _1315 = int(_1281) + 1;
            _1283 = _1315;
        }
        int _1317 = _1283;
        float _1319 = -_1141;
        float _1321 = _1319 + 0.5;
        int _1323 = _1317 << 9;
        float _1325 = abs(_1321);
        bool _1327 = _1325 >= 0.375;
        float _1329 = trunc(_1163);
        float _1331 = precise::max(_1329, 0.0);
        uint _1333 = uint(_1331);
        float _1335 = fma(_1145, -1.99999904632568359375, 1.99999904632568359375);
        float _1337 = trunc(_1165);
        float _1339 = precise::max(_1337, 0.0);
        uint _1341 = uint(_1339);
        int _1343 = int(_1333);
        if (!_1221)
        {
            int _1345 = int(_1311) + 1;
            _1313 = _1345;
        }
        int _1347 = _1313;
        float _1349 = fma(_1141, -7.99999904632568359375, 7.99999904632568359375);
        float _1351 = abs(_1293);
        bool _1353 = _1351 >= 0.375;
        float _1355 = fma(_1143, -1.99999904632568359375, 1.99999904632568359375);
        float _1357 = fma(_1143, -7.99999904632568359375, 7.99999904632568359375);
        int _1359 = _1347 * 64;
        float _1361 = trunc(_1175);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        float _1367 = trunc(_1187);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        int _1373 = int(_1365);
        if (!_1199)
        {
            int _1375 = int(_1341) + 1;
            _1343 = _1375;
        }
        int _1377 = _1343;
        float _1379 = -_1143;
        float _1381 = _1379 + 0.5;
        float _1383 = fma(_1145, -7.99999904632568359375, 7.99999904632568359375);
        int _1385 = _1377 << 12;
        float _1387 = abs(_1381);
        bool _1389 = _1387 >= 0.375;
        float _1391 = trunc(_1205);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        float _1397 = fma(_1147, -1.99999904632568359375, 1.99999904632568359375);
        float _1399 = trunc(_1217);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        int _1405 = int(_1395);
        if (!_1229)
        {
            int _1407 = int(_1371) + 1;
            _1373 = _1407;
        }
        int _1409 = _1373;
        float _1411 = -_1145;
        float _1413 = _1411 + 0.5;
        float _1415 = fma(_1147, -7.99999904632568359375, 7.99999904632568359375);
        float _1417 = -_1147;
        float _1419 = _1417 + 0.5;
        int _1421 = _1409 << 15;
        float _1423 = abs(_1413);
        bool _1425 = _1423 >= 0.375;
        float _1427 = trunc(_1231);
        float _1429 = precise::max(_1427, 0.0);
        uint _1431 = uint(_1429);
        float _1433 = fma(_1149, -1.99999904632568359375, 1.99999904632568359375);
        float _1435 = trunc(_1233);
        float _1437 = precise::max(_1435, 0.0);
        uint _1439 = uint(_1437);
        int _1441 = int(_1431);
        if (!_1243)
        {
            int _1443 = int(_1403) + 1;
            _1405 = _1443;
        }
        int _1445 = _1405;
        float _1447 = fma(_1149, -7.99999904632568359375, 7.99999904632568359375);
        float _1449 = fma(_1151, -7.99999904632568359375, 7.99999904632568359375);
        float _1451 = -_1149;
        float _1453 = _1451 + 0.5;
        float _1455 = abs(_1419);
        bool _1457 = _1455 >= 0.375;
        float _1459 = trunc(_1245);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        float _1465 = trunc(_1255);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        int _1471 = int(_1463);
        if (!_1275)
        {
            int _1473 = int(_1439) + 1;
            _1441 = _1473;
        }
        int _1475 = _1441;
        float _1477 = fma(_1151, -1.99999904632568359375, 1.99999904632568359375);
        float _1479 = -_1151;
        float _1481 = _1479 + 0.5;
        float _1483 = abs(_1453);
        bool _1485 = _1483 >= 0.375;
        int _1487 = _1287 << 3;
        float _1489 = trunc(_1261);
        float _1491 = precise::max(_1489, 0.0);
        uint _1493 = uint(_1491);
        int _1495 = _1475 << 21;
        int _1497 = _1253 | _1487;
        int _1499 = _1497 | _1359;
        int _1501 = _1323 | _1499;
        float _1503 = trunc(_1289);
        float _1505 = precise::max(_1503, 0.0);
        uint _1507 = uint(_1505);
        int _1509 = int(_1493);
        if (!_1297)
        {
            int _1511 = int(_1469) + 1;
            _1471 = _1511;
        }
        int _1513 = _1471;
        float _1515 = abs(_1481);
        bool _1517 = _1515 >= 0.375;
        int _1519 = _1501 | _1385;
        int _1521 = _1421 | _1519;
        float _1523 = trunc(_1355);
        float _1525 = precise::max(_1523, 0.0);
        uint _1527 = uint(_1525);
        float _1529 = trunc(_1357);
        float _1531 = precise::max(_1529, 0.0);
        uint _1533 = uint(_1531);
        int _1535 = int(_1527);
        if (!_1353)
        {
            int _1537 = int(_1507) + 1;
            _1509 = _1537;
        }
        int _1539 = _1509;
        int _1541 = _1539 << 3;
        float _1543 = trunc(_1299);
        float _1545 = precise::max(_1543, 0.0);
        uint _1547 = uint(_1545);
        int _1549 = _1513 | _1541;
        float _1551 = trunc(_1349);
        float _1553 = precise::max(_1551, 0.0);
        uint _1555 = uint(_1553);
        int _1557 = int(_1547);
        if (!_1389)
        {
            int _1559 = int(_1533) + 1;
            _1535 = _1559;
        }
        int _1561 = _1535;
        int _1563 = _1561 * 512;
        float _1565 = trunc(_1335);
        float _1567 = precise::max(_1565, 0.0);
        uint _1569 = uint(_1567);
        float _1571 = trunc(_1383);
        float _1573 = precise::max(_1571, 0.0);
        uint _1575 = uint(_1573);
        int _1577 = int(_1569);
        if (!_1327)
        {
            int _1579 = int(_1555) + 1;
            _1557 = _1579;
        }
        int _1581 = _1557;
        int _1583 = _1581 << 6;
        float _1585 = trunc(_1397);
        float _1587 = precise::max(_1585, 0.0);
        uint _1589 = uint(_1587);
        int _1591 = _1549 | _1583;
        int _1593 = _1563 | _1591;
        float _1595 = trunc(_1415);
        float _1597 = precise::max(_1595, 0.0);
        uint _1599 = uint(_1597);
        int _1601 = int(_1589);
        if (!_1425)
        {
            int _1603 = int(_1575) + 1;
            _1577 = _1603;
        }
        int _1605 = _1577;
        float _1607 = trunc(_1433);
        float _1609 = precise::max(_1607, 0.0);
        uint _1611 = uint(_1609);
        float _1613 = trunc(_1447);
        float _1615 = precise::max(_1613, 0.0);
        uint _1617 = uint(_1615);
        int _1619 = int(_1611);
        if (!_1457)
        {
            int _1621 = int(_1599) + 1;
            _1601 = _1621;
        }
        int _1623 = _1601;
        int _1625 = _1605 * 4096;
        int _1627 = _1623 << 15;
        float _1629 = trunc(_1477);
        float _1631 = precise::max(_1629, 0.0);
        uint _1633 = uint(_1631);
        int _1635 = _1593 | _1625;
        int _1637 = _1627 | _1635;
        int _1639 = _1445 << 18;
        int _1641 = _1521 | _1639;
        int _1643 = _1495 | _1641;
        float _1645 = trunc(_1449);
        float _1647 = precise::max(_1645, 0.0);
        uint _1649 = uint(_1647);
        int _1651 = int(_1633);
        if (!_1485)
        {
            int _1653 = int(_1617) + 1;
            _1619 = _1653;
        }
        int _1655 = _1619;
        uint _1657 = uint(int(uint(_1643) >> uint(16)));
        int _1659 = _1655 * 262144;
        if (!_1517)
        {
            int _1661 = int(_1649) + 1;
            _1651 = _1661;
        }
        int _1663 = _1651;
        int _1665 = _1663 << 21;
        int _1667 = _1637 | _1659;
        int _1669 = _1665 | _1667;
        int _1671 = _1643 << 16;
        int _1673 = _1669 * 256;
        uint _1675 = uint(int(uint(_1669) >> uint(8)));
        int _1677 = 65280 & _1673;
        int _1679 = int(_1657) | _1677;
        int _1681 = int(_1675) << 16;
        _1019 = _1671;
        _1029 = _1681;
        _1023 = _1679;
    }
    int _1683 = _1019;
    int _1685 = _1029;
    int _1687 = _1023;
    int _1689 = _919 | _245;
    int _1691 = _921 | _923;
    int _1693 = _1683 | _1009;
    int _1695 = _1685 | _1687;
    out.m_32.x = as_type<float>(_1689);
    out.m_32.y = as_type<float>(_1691);
    out.m_32.z = as_type<float>(_1693);
    out.m_32.w = as_type<float>(_1695);
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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _1728 = float2(_55, _57);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1728, float2(0.0), isnan(_1728)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1728, float2(0.0), isnan(_1728)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xy;
    float _63 = _61.x;
    float _65 = _61.y;
    float2 _1749 = float2(_55, _57);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1749, float2(0.0), isnan(_1749)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1749, float2(0.0), isnan(_1749)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xy;
    float _69 = _67.x;
    float _71 = _67.y;
    float2 _1764 = float2(_55, _57);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1764, float2(0.0), isnan(_1764)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1764, float2(0.0), isnan(_1764)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    float2 _1779 = float2(_55, _57);
    float2 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1779, float2(0.0), isnan(_1779)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1779, float2(0.0), isnan(_1779)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xy;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _1794 = float2(_55, _57);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1794, float2(0.0), isnan(_1794)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1794, float2(0.0), isnan(_1794)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float2 _1809 = float2(_55, _57);
    float2 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1809, float2(0.0), isnan(_1809)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1809, float2(0.0), isnan(_1809)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xy;
    float _93 = _91.x;
    float _95 = _91.y;
    float2 _1824 = float2(_55, _57);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1824, float2(0.0), isnan(_1824)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1824, float2(0.0), isnan(_1824)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float2 _1839 = float2(_55, _57);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1839, float2(0.0), isnan(_1839)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1839, float2(0.0), isnan(_1839)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    float2 _1853 = float2(_55, _57);
    float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1853, float2(0.0), isnan(_1853)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1853, float2(0.0), isnan(_1853)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xy;
    float _111 = _109.x;
    float _113 = _109.y;
    float2 _1868 = float2(_55, _57);
    float2 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1868, float2(0.0), isnan(_1868)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1868, float2(0.0), isnan(_1868)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xy;
    float _117 = _115.x;
    float _119 = _115.y;
    float2 _1883 = float2(_55, _57);
    float2 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1883, float2(0.0), isnan(_1883)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1883, float2(0.0), isnan(_1883)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xy;
    float _123 = _121.x;
    float _125 = _121.y;
    float2 _1898 = float2(_55, _57);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1898, float2(0.0), isnan(_1898)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1898, float2(0.0), isnan(_1898)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float2 _1913 = float2(_55, _57);
    float2 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1913, float2(0.0), isnan(_1913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1913, float2(0.0), isnan(_1913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xy;
    float _135 = _133.x;
    float _137 = _133.y;
    float2 _1928 = float2(_55, _57);
    float2 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1928, float2(0.0), isnan(_1928)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1928, float2(0.0), isnan(_1928)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xy;
    float _141 = _139.x;
    float _143 = _139.y;
    float2 _1943 = float2(_55, _57);
    float2 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1943, float2(0.0), isnan(_1943)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1943, float2(0.0), isnan(_1943)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xy;
    float _147 = _145.x;
    float _149 = _145.y;
    float2 _1958 = float2(_55, _57);
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1958, float2(0.0), isnan(_1958)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1958, float2(0.0), isnan(_1958)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xy;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = precise::max(_63, _69);
    float _159 = precise::max(_105, _99);
    float _161 = precise::max(_75, _81);
    float _163 = precise::max(_159, _157);
    float _165 = precise::max(_87, _93);
    float _167 = precise::max(_161, _165);
    float _169 = precise::max(_111, _117);
    float _171 = precise::max(_163, _167);
    float _173 = precise::max(_123, _129);
    float _175 = precise::max(_135, _141);
    float _177 = precise::max(_147, _153);
    float _179 = precise::max(_169, _173);
    float _181 = precise::max(_175, _177);
    float _183 = precise::min(_105, _99);
    float _185 = precise::max(_179, _181);
    float _187 = precise::min(_87, _93);
    float _189 = precise::max(_171, _185);
    float _191 = precise::min(_63, _69);
    float _193 = precise::min(_183, _191);
    float _195 = precise::min(_75, _81);
    float _197 = precise::min(_195, _187);
    float _199 = precise::min(_147, _153);
    float _201 = precise::min(_193, _197);
    float _203 = precise::min(_111, _117);
    float _205 = precise::min(_123, _129);
    float _207 = precise::min(_203, _205);
    float _209 = precise::min(_135, _141);
    float _211 = precise::min(_209, _199);
    float _213 = precise::min(_207, _211);
    float _215 = _189 * 127.0;
    float _217 = precise::min(_201, _213);
    float _219 = trunc(_215);
    float _221 = precise::max(_219, 0.0);
    uint _224 = uint(_221);
    float _226 = _217 * 127.0;
    float _228 = trunc(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    bool _236 = _224 > _232;
    int _239 = int(_232) << 8;
    int _241 = _239 & 65280;
    int _243 = 255 & int(_224);
    int _245 = _241 | _243;
    int _247 = int(_232);
    int _249 = int(_224);
    int _251 = _241;
    if (!_236)
    {
        _247 = 0;
        _249 = 0;
    }
    int _253 = _247;
    int _255 = _249;
    int _257 = _253;
    int _259 = _255;
    if (!_236)
    {
        _251 = 0;
    }
    int _261 = _251;
    bool _263 = !_236;
    int _265 = _261;
    if (!_263)
    {
        float _267 = -_217;
        float _269 = _189 + _267;
        float _271 = -_217;
        float _273 = _105 + _271;
        float _275 = -_217;
        float _277 = _99 + _275;
        float _279 = -_217;
        float _281 = _63 + _279;
        float _283 = -_217;
        float _285 = _69 + _283;
        float _287 = 1.0 / _269;
        float _289 = -_217;
        float _291 = _75 + _289;
        float _293 = -_217;
        float _295 = _81 + _293;
        float _297 = -_217;
        float _299 = _87 + _297;
        float _301 = -_217;
        float _303 = _93 + _301;
        float _305 = -_217;
        float _307 = _111 + _305;
        float _309 = -_217;
        float _311 = _117 + _309;
        float _313 = -_217;
        float _315 = _123 + _313;
        float _317 = -_217;
        float _319 = _129 + _317;
        float _321 = -_217;
        float _323 = _135 + _321;
        float _325 = -_217;
        float _327 = _141 + _325;
        float _329 = -_217;
        float _331 = _147 + _329;
        float _333 = -_217;
        float _335 = _153 + _333;
        float _337 = _273 * _287;
        float _339 = _277 * _287;
        float _341 = _281 * _287;
        float _343 = _285 * _287;
        float _345 = -_337;
        float _347 = _345 + 0.5;
        float _349 = fma(_337, -1.99999904632568359375, 1.99999904632568359375);
        float _351 = _291 * _287;
        float _353 = _327 * _287;
        float _355 = _335 * _287;
        float _357 = abs(_347);
        bool _359 = _357 >= 0.375;
        float _361 = trunc(_349);
        float _363 = precise::max(_361, 0.0);
        uint _365 = uint(_363);
        float _367 = -_353;
        float _369 = _367 + 0.5;
        float _371 = fma(_337, -7.99999904632568359375, 7.99999904632568359375);
        float _373 = trunc(_371);
        float _375 = precise::max(_373, 0.0);
        uint _377 = uint(_375);
        int _379 = int(_365);
        if (!_359)
        {
            int _381 = int(_377) + 1;
            _379 = _381;
        }
        int _383 = _379;
        float _385 = -_339;
        float _387 = _385 + 0.5;
        float _389 = abs(_387);
        bool _391 = _389 >= 0.375;
        float _393 = fma(_339, -1.99999904632568359375, 1.99999904632568359375);
        float _395 = fma(_339, -7.99999904632568359375, 7.99999904632568359375);
        float _397 = trunc(_393);
        float _399 = precise::max(_397, 0.0);
        uint _401 = uint(_399);
        float _403 = trunc(_395);
        float _405 = precise::max(_403, 0.0);
        uint _407 = uint(_405);
        int _409 = int(_401);
        if (!_391)
        {
            int _411 = int(_407) + 1;
            _409 = _411;
        }
        int _413 = _409;
        float _415 = -_341;
        float _417 = _415 + 0.5;
        int _419 = _413 << 3;
        float _421 = abs(_417);
        bool _423 = _421 >= 0.375;
        int _425 = _383 | _419;
        float _427 = fma(_341, -1.99999904632568359375, 1.99999904632568359375);
        float _429 = trunc(_427);
        float _431 = precise::max(_429, 0.0);
        uint _433 = uint(_431);
        float _435 = fma(_341, -7.99999904632568359375, 7.99999904632568359375);
        float _437 = trunc(_435);
        float _439 = precise::max(_437, 0.0);
        uint _441 = uint(_439);
        int _443 = int(_433);
        if (!_423)
        {
            int _445 = int(_441) + 1;
            _443 = _445;
        }
        int _447 = _443;
        float _449 = -_343;
        float _451 = _449 + 0.5;
        int _453 = _447 * 64;
        float _455 = abs(_451);
        bool _457 = _455 >= 0.375;
        float _459 = fma(_343, -1.99999904632568359375, 1.99999904632568359375);
        float _461 = fma(_343, -7.99999904632568359375, 7.99999904632568359375);
        float _463 = trunc(_459);
        float _465 = precise::max(_463, 0.0);
        uint _467 = uint(_465);
        float _469 = trunc(_461);
        float _471 = precise::max(_469, 0.0);
        uint _473 = uint(_471);
        int _475 = int(_467);
        if (!_457)
        {
            int _477 = int(_473) + 1;
            _475 = _477;
        }
        int _479 = _475;
        float _481 = _295 * _287;
        int _483 = _479 << 9;
        float _485 = fma(_351, -1.99999904632568359375, 1.99999904632568359375);
        float _487 = -_481;
        float _489 = _487 + 0.5;
        int _491 = _425 | _453;
        int _493 = _483 | _491;
        float _495 = -_351;
        float _497 = _495 + 0.5;
        float _499 = fma(_351, -7.99999904632568359375, 7.99999904632568359375);
        float _501 = fma(_481, -1.99999904632568359375, 1.99999904632568359375);
        float _503 = fma(_481, -7.99999904632568359375, 7.99999904632568359375);
        float _505 = abs(_497);
        bool _507 = _505 >= 0.375;
        float _509 = trunc(_485);
        float _511 = precise::max(_509, 0.0);
        uint _513 = uint(_511);
        float _515 = trunc(_499);
        float _517 = precise::max(_515, 0.0);
        uint _519 = uint(_517);
        float _521 = trunc(_503);
        float _523 = precise::max(_521, 0.0);
        uint _525 = uint(_523);
        int _527 = int(_513);
        if (!_507)
        {
            int _529 = int(_519) + 1;
            _527 = _529;
        }
        int _531 = _527;
        float _533 = _299 * _287;
        float _535 = abs(_489);
        bool _537 = _535 >= 0.375;
        float _539 = trunc(_501);
        float _541 = precise::max(_539, 0.0);
        uint _543 = uint(_541);
        float _545 = -_533;
        float _547 = _545 + 0.5;
        float _549 = fma(_533, -1.99999904632568359375, 1.99999904632568359375);
        float _551 = fma(_533, -7.99999904632568359375, 7.99999904632568359375);
        float _553 = trunc(_551);
        float _555 = precise::max(_553, 0.0);
        uint _557 = uint(_555);
        int _559 = int(_543);
        if (!_537)
        {
            int _561 = int(_525) + 1;
            _559 = _561;
        }
        int _563 = _559;
        float _565 = _303 * _287;
        float _567 = abs(_547);
        bool _569 = _567 >= 0.375;
        float _571 = trunc(_549);
        float _573 = precise::max(_571, 0.0);
        uint _575 = uint(_573);
        float _577 = -_565;
        float _579 = _577 + 0.5;
        float _581 = fma(_565, -1.99999904632568359375, 1.99999904632568359375);
        float _583 = fma(_565, -7.99999904632568359375, 7.99999904632568359375);
        int _585 = _563 * 32768;
        float _587 = trunc(_583);
        float _589 = precise::max(_587, 0.0);
        uint _591 = uint(_589);
        int _593 = int(_575);
        if (!_569)
        {
            int _595 = int(_557) + 1;
            _593 = _595;
        }
        int _597 = _593;
        float _599 = _307 * _287;
        float _601 = abs(_579);
        bool _603 = _601 >= 0.375;
        float _605 = trunc(_581);
        float _607 = precise::max(_605, 0.0);
        uint _609 = uint(_607);
        float _611 = -_599;
        float _613 = _611 + 0.5;
        float _615 = fma(_599, -1.99999904632568359375, 1.99999904632568359375);
        float _617 = fma(_599, -7.99999904632568359375, 7.99999904632568359375);
        float _619 = trunc(_617);
        float _621 = precise::max(_619, 0.0);
        uint _623 = uint(_621);
        int _625 = int(_609);
        if (!_603)
        {
            int _627 = int(_591) + 1;
            _625 = _627;
        }
        int _629 = _625;
        float _631 = _311 * _287;
        float _633 = abs(_613);
        bool _635 = _633 >= 0.375;
        float _637 = trunc(_615);
        float _639 = precise::max(_637, 0.0);
        uint _641 = uint(_639);
        float _643 = -_631;
        float _645 = _643 + 0.5;
        float _647 = fma(_631, -1.99999904632568359375, 1.99999904632568359375);
        float _649 = fma(_631, -7.99999904632568359375, 7.99999904632568359375);
        int _651 = _629 * 2097152;
        float _653 = trunc(_649);
        float _655 = precise::max(_653, 0.0);
        uint _657 = uint(_655);
        int _659 = int(_641);
        if (!_635)
        {
            int _661 = int(_623) + 1;
            _659 = _661;
        }
        int _663 = _659;
        float _665 = _315 * _287;
        float _667 = abs(_645);
        bool _669 = _667 >= 0.375;
        float _671 = trunc(_647);
        float _673 = precise::max(_671, 0.0);
        uint _675 = uint(_673);
        float _677 = -_665;
        float _679 = _677 + 0.5;
        float _681 = fma(_665, -1.99999904632568359375, 1.99999904632568359375);
        float _683 = fma(_665, -7.99999904632568359375, 7.99999904632568359375);
        float _685 = trunc(_683);
        float _687 = precise::max(_685, 0.0);
        uint _689 = uint(_687);
        int _691 = int(_675);
        if (!_669)
        {
            int _693 = int(_657) + 1;
            _691 = _693;
        }
        int _695 = _691;
        float _697 = _319 * _287;
        float _699 = abs(_679);
        bool _701 = _699 >= 0.375;
        float _703 = trunc(_681);
        float _705 = precise::max(_703, 0.0);
        uint _707 = uint(_705);
        float _709 = -_697;
        float _711 = _709 + 0.5;
        float _713 = fma(_697, -1.99999904632568359375, 1.99999904632568359375);
        float _715 = fma(_697, -7.99999904632568359375, 7.99999904632568359375);
        int _717 = _695 * 8;
        float _719 = trunc(_715);
        float _721 = precise::max(_719, 0.0);
        uint _723 = uint(_721);
        int _725 = _663 | _717;
        float _727 = _331 * _287;
        int _729 = int(_707);
        if (!_701)
        {
            int _731 = int(_689) + 1;
            _729 = _731;
        }
        int _733 = _729;
        float _735 = _323 * _287;
        float _737 = abs(_711);
        bool _739 = _737 >= 0.375;
        float _741 = fma(_355, -1.99999904632568359375, 1.99999904632568359375);
        float _743 = trunc(_713);
        float _745 = precise::max(_743, 0.0);
        uint _747 = uint(_745);
        float _749 = -_735;
        float _751 = _749 + 0.5;
        float _753 = fma(_735, -1.99999904632568359375, 1.99999904632568359375);
        float _755 = fma(_735, -7.99999904632568359375, 7.99999904632568359375);
        float _757 = trunc(_741);
        float _759 = precise::max(_757, 0.0);
        uint _761 = uint(_759);
        int _763 = int(_747);
        int _765 = int(_761);
        if (!_739)
        {
            int _767 = int(_723) + 1;
            _763 = _767;
        }
        int _769 = _763;
        float _771 = trunc(_755);
        float _773 = precise::max(_771, 0.0);
        uint _775 = uint(_773);
        float _777 = abs(_751);
        bool _779 = _777 >= 0.375;
        float _781 = fma(_353, -1.99999904632568359375, 1.99999904632568359375);
        float _783 = fma(_353, -7.99999904632568359375, 7.99999904632568359375);
        int _785 = _769 * 512;
        float _787 = trunc(_753);
        float _789 = precise::max(_787, 0.0);
        uint _791 = uint(_789);
        float _793 = trunc(_781);
        float _795 = precise::max(_793, 0.0);
        uint _797 = uint(_795);
        int _799 = int(_791);
        int _801 = int(_797);
        if (!_779)
        {
            int _803 = int(_775) + 1;
            _799 = _803;
        }
        int _805 = _799;
        float _807 = trunc(_783);
        float _809 = precise::max(_807, 0.0);
        uint _811 = uint(_809);
        float _813 = abs(_369);
        bool _815 = _813 >= 0.375;
        float _817 = -_727;
        float _819 = _817 + 0.5;
        int _821 = _805 << 12;
        float _823 = abs(_819);
        bool _825 = _823 >= 0.375;
        float _827 = fma(_727, -1.99999904632568359375, 1.99999904632568359375);
        float _829 = fma(_727, -7.99999904632568359375, 7.99999904632568359375);
        float _831 = fma(_355, -7.99999904632568359375, 7.99999904632568359375);
        float _833 = -_355;
        float _835 = _833 + 0.5;
        float _837 = trunc(_827);
        float _839 = precise::max(_837, 0.0);
        uint _841 = uint(_839);
        float _843 = abs(_835);
        bool _845 = _843 >= 0.375;
        int _847 = _733 << 6;
        int _849 = int(_841);
        if (!_815)
        {
            int _851 = int(_811) + 1;
            _801 = _851;
        }
        int _853 = _801;
        float _855 = trunc(_829);
        float _857 = precise::max(_855, 0.0);
        uint _859 = uint(_857);
        int _861 = _725 | _847;
        int _863 = _785 | _861;
        int _865 = _531 << 12;
        int _867 = _853 << 15;
        int _869 = _493 | _865;
        int _871 = _585 | _869;
        float _873 = trunc(_831);
        float _875 = precise::max(_873, 0.0);
        uint _877 = uint(_875);
        int _879 = _863 | _821;
        int _881 = _867 | _879;
        if (!_825)
        {
            int _883 = int(_859) + 1;
            _849 = _883;
        }
        int _885 = _849;
        int _887 = _885 << 18;
        if (!_845)
        {
            int _889 = int(_877) + 1;
            _765 = _889;
        }
        int _891 = _765;
        int _893 = _597 * 262144;
        int _895 = _891 << 21;
        int _897 = _871 | _893;
        int _899 = _651 | _897;
        int _901 = _881 | _887;
        int _903 = _895 | _901;
        uint _905 = uint(int(uint(_899) >> uint(16)));
        uint _907 = uint(int(uint(_903) >> uint(8)));
        int _909 = _903 << 8;
        int _911 = _899 << 16;
        int _913 = int(_907) * 65536;
        int _915 = 65280 & _909;
        int _917 = int(_905) | _915;
        _257 = _911;
        _259 = _913;
        _265 = _917;
    }
    int _919 = _257;
    int _921 = _259;
    int _923 = _265;
    float _925 = precise::max(_77, _83);
    float _927 = precise::max(_89, _95);
    float _929 = precise::min(_77, _83);
    float _931 = precise::min(_89, _95);
    float _933 = precise::max(_113, _119);
    float _935 = precise::max(_125, _131);
    float _937 = precise::min(_113, _119);
    float _939 = precise::min(_125, _131);
    float _941 = precise::max(_925, _927);
    float _943 = precise::max(_65, _71);
    float _945 = precise::max(_107, _101);
    float _947 = precise::min(_929, _931);
    float _949 = precise::max(_933, _935);
    float _951 = precise::min(_937, _939);
    float _953 = precise::max(_137, _143);
    float _955 = precise::max(_149, _155);
    float _957 = precise::max(_945, _943);
    float _959 = precise::min(_65, _71);
    float _961 = precise::min(_107, _101);
    float _963 = precise::min(_137, _143);
    float _965 = precise::min(_149, _155);
    float _967 = precise::max(_953, _955);
    float _969 = precise::max(_957, _941);
    float _971 = precise::min(_961, _959);
    float _973 = precise::min(_963, _965);
    float _975 = precise::max(_949, _967);
    float _977 = precise::min(_971, _947);
    float _979 = precise::min(_951, _973);
    float _981 = precise::max(_969, _975);
    float _983 = precise::min(_977, _979);
    float _985 = _981 * 127.0;
    float _987 = _983 * 127.0;
    float _989 = trunc(_985);
    float _991 = precise::max(_989, 0.0);
    uint _993 = uint(_991);
    float _995 = trunc(_987);
    float _997 = precise::max(_995, 0.0);
    uint _999 = uint(_997);
    bool _1001 = _993 > _999;
    int _1003 = int(_999) << 8;
    int _1005 = _1003 & 65280;
    int _1007 = 255 & int(_993);
    int _1009 = _1005 | _1007;
    int _1011 = as_type<int>(_975);
    int _1013 = _1005;
    int _1015 = as_type<int>(_977);
    if (!_1001)
    {
        _1011 = 0;
    }
    int _1017 = _1011;
    int _1019 = _1017;
    if (!_1001)
    {
        _1013 = 0;
    }
    int _1021 = _1013;
    int _1023 = _1021;
    if (!_1001)
    {
        _1015 = 0;
    }
    int _1025 = _1015;
    bool _1027 = !_1001;
    int _1029 = _1025;
    if (!_1027)
    {
        float _1031 = -_983;
        float _1033 = _981 + _1031;
        float _1035 = -_983;
        float _1037 = _107 + _1035;
        float _1039 = -_983;
        float _1041 = _101 + _1039;
        float _1043 = -_983;
        float _1045 = _71 + _1043;
        float _1047 = 1.0 / _1033;
        float _1049 = -_983;
        float _1051 = _65 + _1049;
        float _1053 = -_983;
        float _1055 = _77 + _1053;
        float _1057 = -_983;
        float _1059 = _95 + _1057;
        float _1061 = -_983;
        float _1063 = _83 + _1061;
        float _1065 = -_983;
        float _1067 = _89 + _1065;
        float _1069 = -_983;
        float _1071 = _113 + _1069;
        float _1073 = -_983;
        float _1075 = _119 + _1073;
        float _1077 = -_983;
        float _1079 = _125 + _1077;
        float _1081 = -_983;
        float _1083 = _131 + _1081;
        float _1085 = -_983;
        float _1087 = _137 + _1085;
        float _1089 = -_983;
        float _1091 = _143 + _1089;
        float _1093 = -_983;
        float _1095 = _149 + _1093;
        float _1097 = -_983;
        float _1099 = _155 + _1097;
        float _1101 = _1037 * _1047;
        float _1103 = _1041 * _1047;
        float _1105 = _1045 * _1047;
        float _1107 = _1051 * _1047;
        float _1109 = fma(_1101, -1.99999904632568359375, 1.99999904632568359375);
        float _1111 = fma(_1101, -7.99999904632568359375, 7.99999904632568359375);
        float _1113 = fma(_1103, -1.99999904632568359375, 1.99999904632568359375);
        float _1115 = fma(_1103, -7.99999904632568359375, 7.99999904632568359375);
        float _1117 = _1055 * _1047;
        float _1119 = -_1101;
        float _1121 = _1119 + 0.5;
        float _1123 = -_1103;
        float _1125 = _1123 + 0.5;
        float _1127 = fma(_1105, -1.99999904632568359375, 1.99999904632568359375);
        float _1129 = fma(_1105, -7.99999904632568359375, 7.99999904632568359375);
        float _1131 = _1063 * _1047;
        float _1133 = _1067 * _1047;
        float _1135 = _1059 * _1047;
        float _1137 = _1071 * _1047;
        float _1139 = _1075 * _1047;
        float _1141 = _1079 * _1047;
        float _1143 = _1083 * _1047;
        float _1145 = _1087 * _1047;
        float _1147 = _1091 * _1047;
        float _1149 = _1095 * _1047;
        float _1151 = _1099 * _1047;
        float _1153 = trunc(_1109);
        float _1155 = precise::max(_1153, 0.0);
        uint _1157 = uint(_1155);
        float _1159 = fma(_1107, -1.99999904632568359375, 1.99999904632568359375);
        float _1161 = fma(_1107, -7.99999904632568359375, 7.99999904632568359375);
        float _1163 = fma(_1117, -1.99999904632568359375, 1.99999904632568359375);
        float _1165 = fma(_1117, -7.99999904632568359375, 7.99999904632568359375);
        float _1167 = -_1117;
        float _1169 = _1167 + 0.5;
        float _1171 = abs(_1121);
        bool _1173 = _1171 >= 0.375;
        float _1175 = fma(_1131, -1.99999904632568359375, 1.99999904632568359375);
        float _1177 = trunc(_1111);
        float _1179 = precise::max(_1177, 0.0);
        uint _1181 = uint(_1179);
        float _1183 = abs(_1125);
        bool _1185 = _1183 >= 0.375;
        float _1187 = fma(_1131, -7.99999904632568359375, 7.99999904632568359375);
        float _1189 = -_1105;
        float _1191 = _1189 + 0.5;
        float _1193 = -_1107;
        float _1195 = _1193 + 0.5;
        float _1197 = abs(_1169);
        bool _1199 = _1197 >= 0.375;
        float _1201 = -_1131;
        float _1203 = _1201 + 0.5;
        float _1205 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1207 = trunc(_1113);
        float _1209 = precise::max(_1207, 0.0);
        uint _1211 = uint(_1209);
        float _1213 = abs(_1191);
        bool _1215 = _1213 >= 0.375;
        float _1217 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1219 = abs(_1195);
        bool _1221 = _1219 >= 0.375;
        float _1223 = -_1133;
        float _1225 = _1223 + 0.5;
        float _1227 = abs(_1203);
        bool _1229 = _1227 >= 0.375;
        float _1231 = fma(_1135, -1.99999904632568359375, 1.99999904632568359375);
        float _1233 = fma(_1135, -7.99999904632568359375, 7.99999904632568359375);
        float _1235 = trunc(_1115);
        float _1237 = precise::max(_1235, 0.0);
        uint _1239 = uint(_1237);
        float _1241 = abs(_1225);
        bool _1243 = _1241 >= 0.375;
        float _1245 = fma(_1137, -1.99999904632568359375, 1.99999904632568359375);
        int _1247 = int(_1157);
        int _1249 = int(_1211);
        if (!_1173)
        {
            int _1251 = int(_1181) + 1;
            _1247 = _1251;
        }
        int _1253 = _1247;
        float _1255 = fma(_1137, -7.99999904632568359375, 7.99999904632568359375);
        float _1257 = -_1135;
        float _1259 = _1257 + 0.5;
        float _1261 = fma(_1139, -1.99999904632568359375, 1.99999904632568359375);
        float _1263 = -_1137;
        float _1265 = _1263 + 0.5;
        float _1267 = trunc(_1127);
        float _1269 = precise::max(_1267, 0.0);
        uint _1271 = uint(_1269);
        float _1273 = abs(_1259);
        bool _1275 = _1273 >= 0.375;
        float _1277 = trunc(_1129);
        float _1279 = precise::max(_1277, 0.0);
        uint _1281 = uint(_1279);
        int _1283 = int(_1271);
        if (!_1185)
        {
            int _1285 = int(_1239) + 1;
            _1249 = _1285;
        }
        int _1287 = _1249;
        float _1289 = fma(_1139, -7.99999904632568359375, 7.99999904632568359375);
        float _1291 = -_1139;
        float _1293 = _1291 + 0.5;
        float _1295 = abs(_1265);
        bool _1297 = _1295 >= 0.375;
        float _1299 = fma(_1141, -1.99999904632568359375, 1.99999904632568359375);
        float _1301 = trunc(_1159);
        float _1303 = precise::max(_1301, 0.0);
        uint _1305 = uint(_1303);
        float _1307 = trunc(_1161);
        float _1309 = precise::max(_1307, 0.0);
        uint _1311 = uint(_1309);
        int _1313 = int(_1305);
        if (!_1215)
        {
            int _1315 = int(_1281) + 1;
            _1283 = _1315;
        }
        int _1317 = _1283;
        float _1319 = -_1141;
        float _1321 = _1319 + 0.5;
        int _1323 = _1317 << 9;
        float _1325 = abs(_1321);
        bool _1327 = _1325 >= 0.375;
        float _1329 = trunc(_1163);
        float _1331 = precise::max(_1329, 0.0);
        uint _1333 = uint(_1331);
        float _1335 = fma(_1145, -1.99999904632568359375, 1.99999904632568359375);
        float _1337 = trunc(_1165);
        float _1339 = precise::max(_1337, 0.0);
        uint _1341 = uint(_1339);
        int _1343 = int(_1333);
        if (!_1221)
        {
            int _1345 = int(_1311) + 1;
            _1313 = _1345;
        }
        int _1347 = _1313;
        float _1349 = fma(_1141, -7.99999904632568359375, 7.99999904632568359375);
        float _1351 = abs(_1293);
        bool _1353 = _1351 >= 0.375;
        float _1355 = fma(_1143, -1.99999904632568359375, 1.99999904632568359375);
        float _1357 = fma(_1143, -7.99999904632568359375, 7.99999904632568359375);
        int _1359 = _1347 * 64;
        float _1361 = trunc(_1175);
        float _1363 = precise::max(_1361, 0.0);
        uint _1365 = uint(_1363);
        float _1367 = trunc(_1187);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        int _1373 = int(_1365);
        if (!_1199)
        {
            int _1375 = int(_1341) + 1;
            _1343 = _1375;
        }
        int _1377 = _1343;
        float _1379 = -_1143;
        float _1381 = _1379 + 0.5;
        float _1383 = fma(_1145, -7.99999904632568359375, 7.99999904632568359375);
        int _1385 = _1377 << 12;
        float _1387 = abs(_1381);
        bool _1389 = _1387 >= 0.375;
        float _1391 = trunc(_1205);
        float _1393 = precise::max(_1391, 0.0);
        uint _1395 = uint(_1393);
        float _1397 = fma(_1147, -1.99999904632568359375, 1.99999904632568359375);
        float _1399 = trunc(_1217);
        float _1401 = precise::max(_1399, 0.0);
        uint _1403 = uint(_1401);
        int _1405 = int(_1395);
        if (!_1229)
        {
            int _1407 = int(_1371) + 1;
            _1373 = _1407;
        }
        int _1409 = _1373;
        float _1411 = -_1145;
        float _1413 = _1411 + 0.5;
        float _1415 = fma(_1147, -7.99999904632568359375, 7.99999904632568359375);
        float _1417 = -_1147;
        float _1419 = _1417 + 0.5;
        int _1421 = _1409 << 15;
        float _1423 = abs(_1413);
        bool _1425 = _1423 >= 0.375;
        float _1427 = trunc(_1231);
        float _1429 = precise::max(_1427, 0.0);
        uint _1431 = uint(_1429);
        float _1433 = fma(_1149, -1.99999904632568359375, 1.99999904632568359375);
        float _1435 = trunc(_1233);
        float _1437 = precise::max(_1435, 0.0);
        uint _1439 = uint(_1437);
        int _1441 = int(_1431);
        if (!_1243)
        {
            int _1443 = int(_1403) + 1;
            _1405 = _1443;
        }
        int _1445 = _1405;
        float _1447 = fma(_1149, -7.99999904632568359375, 7.99999904632568359375);
        float _1449 = fma(_1151, -7.99999904632568359375, 7.99999904632568359375);
        float _1451 = -_1149;
        float _1453 = _1451 + 0.5;
        float _1455 = abs(_1419);
        bool _1457 = _1455 >= 0.375;
        float _1459 = trunc(_1245);
        float _1461 = precise::max(_1459, 0.0);
        uint _1463 = uint(_1461);
        float _1465 = trunc(_1255);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        int _1471 = int(_1463);
        if (!_1275)
        {
            int _1473 = int(_1439) + 1;
            _1441 = _1473;
        }
        int _1475 = _1441;
        float _1477 = fma(_1151, -1.99999904632568359375, 1.99999904632568359375);
        float _1479 = -_1151;
        float _1481 = _1479 + 0.5;
        float _1483 = abs(_1453);
        bool _1485 = _1483 >= 0.375;
        int _1487 = _1287 << 3;
        float _1489 = trunc(_1261);
        float _1491 = precise::max(_1489, 0.0);
        uint _1493 = uint(_1491);
        int _1495 = _1475 << 21;
        int _1497 = _1253 | _1487;
        int _1499 = _1497 | _1359;
        int _1501 = _1323 | _1499;
        float _1503 = trunc(_1289);
        float _1505 = precise::max(_1503, 0.0);
        uint _1507 = uint(_1505);
        int _1509 = int(_1493);
        if (!_1297)
        {
            int _1511 = int(_1469) + 1;
            _1471 = _1511;
        }
        int _1513 = _1471;
        float _1515 = abs(_1481);
        bool _1517 = _1515 >= 0.375;
        int _1519 = _1501 | _1385;
        int _1521 = _1421 | _1519;
        float _1523 = trunc(_1355);
        float _1525 = precise::max(_1523, 0.0);
        uint _1527 = uint(_1525);
        float _1529 = trunc(_1357);
        float _1531 = precise::max(_1529, 0.0);
        uint _1533 = uint(_1531);
        int _1535 = int(_1527);
        if (!_1353)
        {
            int _1537 = int(_1507) + 1;
            _1509 = _1537;
        }
        int _1539 = _1509;
        int _1541 = _1539 << 3;
        float _1543 = trunc(_1299);
        float _1545 = precise::max(_1543, 0.0);
        uint _1547 = uint(_1545);
        int _1549 = _1513 | _1541;
        float _1551 = trunc(_1349);
        float _1553 = precise::max(_1551, 0.0);
        uint _1555 = uint(_1553);
        int _1557 = int(_1547);
        if (!_1389)
        {
            int _1559 = int(_1533) + 1;
            _1535 = _1559;
        }
        int _1561 = _1535;
        int _1563 = _1561 * 512;
        float _1565 = trunc(_1335);
        float _1567 = precise::max(_1565, 0.0);
        uint _1569 = uint(_1567);
        float _1571 = trunc(_1383);
        float _1573 = precise::max(_1571, 0.0);
        uint _1575 = uint(_1573);
        int _1577 = int(_1569);
        if (!_1327)
        {
            int _1579 = int(_1555) + 1;
            _1557 = _1579;
        }
        int _1581 = _1557;
        int _1583 = _1581 << 6;
        float _1585 = trunc(_1397);
        float _1587 = precise::max(_1585, 0.0);
        uint _1589 = uint(_1587);
        int _1591 = _1549 | _1583;
        int _1593 = _1563 | _1591;
        float _1595 = trunc(_1415);
        float _1597 = precise::max(_1595, 0.0);
        uint _1599 = uint(_1597);
        int _1601 = int(_1589);
        if (!_1425)
        {
            int _1603 = int(_1575) + 1;
            _1577 = _1603;
        }
        int _1605 = _1577;
        float _1607 = trunc(_1433);
        float _1609 = precise::max(_1607, 0.0);
        uint _1611 = uint(_1609);
        float _1613 = trunc(_1447);
        float _1615 = precise::max(_1613, 0.0);
        uint _1617 = uint(_1615);
        int _1619 = int(_1611);
        if (!_1457)
        {
            int _1621 = int(_1599) + 1;
            _1601 = _1621;
        }
        int _1623 = _1601;
        int _1625 = _1605 * 4096;
        int _1627 = _1623 << 15;
        float _1629 = trunc(_1477);
        float _1631 = precise::max(_1629, 0.0);
        uint _1633 = uint(_1631);
        int _1635 = _1593 | _1625;
        int _1637 = _1627 | _1635;
        int _1639 = _1445 << 18;
        int _1641 = _1521 | _1639;
        int _1643 = _1495 | _1641;
        float _1645 = trunc(_1449);
        float _1647 = precise::max(_1645, 0.0);
        uint _1649 = uint(_1647);
        int _1651 = int(_1633);
        if (!_1485)
        {
            int _1653 = int(_1617) + 1;
            _1619 = _1653;
        }
        int _1655 = _1619;
        uint _1657 = uint(int(uint(_1643) >> uint(16)));
        int _1659 = _1655 * 262144;
        if (!_1517)
        {
            int _1661 = int(_1649) + 1;
            _1651 = _1661;
        }
        int _1663 = _1651;
        int _1665 = _1663 << 21;
        int _1667 = _1637 | _1659;
        int _1669 = _1665 | _1667;
        int _1671 = _1643 << 16;
        int _1673 = _1669 * 256;
        uint _1675 = uint(int(uint(_1669) >> uint(8)));
        int _1677 = 65280 & _1673;
        int _1679 = int(_1657) | _1677;
        int _1681 = int(_1675) << 16;
        _1019 = _1671;
        _1029 = _1681;
        _1023 = _1679;
    }
    int _1683 = _1019;
    int _1685 = _1029;
    int _1687 = _1023;
    int _1689 = _919 | _245;
    int _1691 = _921 | _923;
    int _1693 = _1683 | _1009;
    int _1695 = _1685 | _1687;
    out.m_32.x = as_type<float>(_1689);
    out.m_32.y = as_type<float>(_1691);
    out.m_32.z = as_type<float>(_1693);
    out.m_32.w = as_type<float>(_1695);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

