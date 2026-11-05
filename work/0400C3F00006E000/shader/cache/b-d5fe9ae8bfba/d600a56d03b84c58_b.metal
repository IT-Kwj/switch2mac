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
    float2 _875 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_875, float2(0.0), isnan(_875)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_875, float2(0.0), isnan(_875)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).x;
    float2 _891 = float2(_55, _57);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float2 _901 = float2(_55, _57);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).x;
    float2 _913 = float2(_55, _57);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_913, float2(0.0), isnan(_913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_913, float2(0.0), isnan(_913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).x;
    float2 _924 = float2(_55, _57);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float2(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_924, float2(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).x;
    float2 _935 = float2(_55, _57);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_935, float2(0.0), isnan(_935)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_935, float2(0.0), isnan(_935)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).x;
    float2 _946 = float2(_55, _57);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).x;
    float2 _957 = float2(_55, _57);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_957, float2(0.0), isnan(_957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_957, float2(0.0), isnan(_957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).x;
    float2 _968 = float2(_55, _57);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_968, float2(0.0), isnan(_968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_968, float2(0.0), isnan(_968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).x;
    float2 _979 = float2(_55, _57);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_979, float2(0.0), isnan(_979)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_979, float2(0.0), isnan(_979)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).x;
    float2 _990 = float2(_55, _57);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_990, float2(0.0), isnan(_990)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_990, float2(0.0), isnan(_990)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).x;
    float2 _1001 = float2(_55, _57);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1001, float2(0.0), isnan(_1001)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1001, float2(0.0), isnan(_1001)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).x;
    float2 _1012 = float2(_55, _57);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1012, float2(0.0), isnan(_1012)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1012, float2(0.0), isnan(_1012)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).x;
    float2 _1023 = float2(_55, _57);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1023, float2(0.0), isnan(_1023)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1023, float2(0.0), isnan(_1023)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).x;
    float2 _1034 = float2(_55, _57);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1034, float2(0.0), isnan(_1034)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1034, float2(0.0), isnan(_1034)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).x;
    float2 _1045 = float2(_55, _57);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1045, float2(0.0), isnan(_1045)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1045, float2(0.0), isnan(_1045)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).x;
    float _91 = precise::max(_61, _59);
    float _93 = precise::max(_63, _65);
    float _95 = precise::max(_67, _69);
    float _97 = precise::max(_91, _93);
    float _99 = precise::min(_61, _59);
    float _101 = precise::max(_71, _73);
    float _103 = precise::min(_63, _65);
    float _105 = precise::min(_67, _69);
    float _107 = precise::min(_71, _73);
    float _109 = precise::max(_95, _101);
    float _111 = precise::min(_99, _103);
    float _113 = precise::min(_105, _107);
    float _115 = precise::max(_75, _77);
    float _117 = precise::max(_79, _81);
    float _119 = precise::max(_97, _109);
    float _121 = precise::min(_111, _113);
    float _123 = precise::max(_115, _117);
    float _125 = precise::min(_75, _77);
    float _127 = precise::max(_83, _85);
    float _129 = precise::max(_87, _89);
    float _131 = precise::min(_79, _81);
    float _133 = precise::min(_83, _85);
    float _135 = precise::min(_87, _89);
    float _137 = precise::max(_127, _129);
    float _139 = precise::min(_125, _131);
    float _141 = precise::min(_133, _135);
    float _143 = precise::max(_123, _137);
    float _145 = precise::min(_139, _141);
    float _147 = precise::max(_119, _143);
    float _149 = precise::min(_121, _145);
    float _151 = _147 * 255.0;
    float _153 = _149 * 255.0;
    float _155 = trunc(_151);
    float _157 = precise::max(_155, 0.0);
    uint _160 = uint(_157);
    float _162 = trunc(_153);
    float _164 = precise::max(_162, 0.0);
    uint _166 = uint(_164);
    bool _170 = _160 > _166;
    int _173 = int(_166) << 8;
    int _175 = _173 & 65280;
    int _177 = 255 & int(_160);
    int _179 = _175 | _177;
    int _181 = as_type<int>(_145);
    int _183 = as_type<int>(_131);
    int _185 = as_type<int>(_137);
    if (!_170)
    {
        _181 = 0;
    }
    int _187 = _181;
    if (!_170)
    {
        _183 = 0;
        _185 = 0;
    }
    int _189 = _183;
    int _191 = _185;
    if (!_170)
    {
        out.m_32.x = as_type<float>(_179);
        out.m_32.y = as_type<float>(_187);
        out.m_32.z = as_type<float>(_189);
        out.m_32.w = as_type<float>(_191);
        return out;
    }
    float _193 = -_149;
    float _195 = _147 + _193;
    float _197 = -_149;
    float _199 = _61 + _197;
    float _201 = -_149;
    float _203 = _65 + _201;
    float _205 = -_149;
    float _207 = _59 + _205;
    float _209 = -_149;
    float _211 = _67 + _209;
    float _213 = -_149;
    float _215 = _69 + _213;
    float _217 = 1.0 / _195;
    float _219 = -_149;
    float _221 = _71 + _219;
    float _223 = -_149;
    float _225 = _73 + _223;
    float _227 = -_149;
    float _229 = _75 + _227;
    float _231 = -_149;
    float _233 = _77 + _231;
    float _235 = -_149;
    float _237 = _79 + _235;
    float _239 = -_149;
    float _241 = _81 + _239;
    float _243 = -_149;
    float _245 = _83 + _243;
    float _247 = -_149;
    float _249 = _85 + _247;
    float _251 = -_149;
    float _253 = _87 + _251;
    float _255 = -_149;
    float _257 = _89 + _255;
    float _259 = _199 * _217;
    float _261 = -_149;
    float _263 = _63 + _261;
    float _265 = _207 * _217;
    float _267 = _203 * _217;
    float _269 = _211 * _217;
    float _271 = _263 * _217;
    float _273 = _215 * _217;
    float _275 = _221 * _217;
    float _277 = _225 * _217;
    float _279 = _229 * _217;
    float _281 = _233 * _217;
    float _283 = _237 * _217;
    float _285 = _241 * _217;
    float _287 = _245 * _217;
    float _289 = _249 * _217;
    float _291 = _253 * _217;
    float _293 = _257 * _217;
    float _295 = -_259;
    float _297 = _295 + 0.5;
    float _299 = fma(_259, -1.99999904632568359375, 1.99999904632568359375);
    float _301 = fma(_259, -7.99999904632568359375, 7.99999904632568359375);
    float _303 = fma(_265, -1.99999904632568359375, 1.99999904632568359375);
    float _305 = fma(_265, -7.99999904632568359375, 7.99999904632568359375);
    float _307 = abs(_297);
    bool _309 = _307 >= 0.375;
    float _311 = -_265;
    float _313 = _311 + 0.5;
    float _315 = trunc(_299);
    float _317 = precise::max(_315, 0.0);
    uint _319 = uint(_317);
    float _321 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _323 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _325 = fma(_267, -1.99999904632568359375, 1.99999904632568359375);
    float _327 = abs(_313);
    bool _329 = _327 >= 0.375;
    float _331 = -_271;
    float _333 = _331 + 0.5;
    float _335 = fma(_267, -7.99999904632568359375, 7.99999904632568359375);
    float _337 = fma(_269, -1.99999904632568359375, 1.99999904632568359375);
    float _339 = trunc(_301);
    float _341 = precise::max(_339, 0.0);
    uint _343 = uint(_341);
    float _345 = fma(_269, -7.99999904632568359375, 7.99999904632568359375);
    float _347 = abs(_333);
    bool _349 = _347 >= 0.375;
    float _351 = -_267;
    float _353 = _351 + 0.5;
    float _355 = fma(_277, -1.99999904632568359375, 1.99999904632568359375);
    float _357 = fma(_277, -7.99999904632568359375, 7.99999904632568359375);
    float _359 = fma(_275, -1.99999904632568359375, 1.99999904632568359375);
    float _361 = fma(_275, -7.99999904632568359375, 7.99999904632568359375);
    float _363 = trunc(_303);
    float _365 = precise::max(_363, 0.0);
    uint _367 = uint(_365);
    float _369 = abs(_353);
    bool _371 = _369 >= 0.375;
    float _373 = -_269;
    float _375 = _373 + 0.5;
    float _377 = fma(_273, -1.99999904632568359375, 1.99999904632568359375);
    float _379 = fma(_273, -7.99999904632568359375, 7.99999904632568359375);
    float _381 = -_275;
    float _383 = _381 + 0.5;
    float _385 = fma(_279, -1.99999904632568359375, 1.99999904632568359375);
    float _387 = abs(_375);
    bool _389 = _387 >= 0.375;
    float _391 = trunc(_305);
    float _393 = precise::max(_391, 0.0);
    uint _395 = uint(_393);
    int _397 = int(_319);
    int _399 = int(_367);
    if (!_309)
    {
        int _401 = int(_343) + 1;
        _397 = _401;
    }
    int _403 = _397;
    float _405 = -_277;
    float _407 = _405 + 0.5;
    float _409 = -_273;
    float _411 = _409 + 0.5;
    float _413 = fma(_279, -7.99999904632568359375, 7.99999904632568359375);
    float _415 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _417 = abs(_383);
    bool _419 = _417 >= 0.375;
    float _421 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _423 = trunc(_321);
    float _425 = precise::max(_423, 0.0);
    uint _427 = uint(_425);
    float _429 = abs(_407);
    bool _431 = _429 >= 0.375;
    float _433 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _435 = abs(_411);
    bool _437 = _435 >= 0.375;
    float _439 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _441 = fma(_285, -1.99999904632568359375, 1.99999904632568359375);
    float _443 = -_281;
    float _445 = _443 + 0.5;
    float _447 = -_283;
    float _449 = _447 + 0.5;
    float _451 = trunc(_323);
    float _453 = precise::max(_451, 0.0);
    uint _455 = uint(_453);
    int _457 = int(_427);
    if (!_329)
    {
        int _459 = int(_395) + 1;
        _399 = _459;
    }
    int _461 = _399;
    float _463 = -_279;
    float _465 = _463 + 0.5;
    float _467 = fma(_285, -7.99999904632568359375, 7.99999904632568359375);
    float _469 = -_285;
    float _471 = _469 + 0.5;
    int _473 = _461 * 8;
    float _475 = abs(_465);
    bool _477 = _475 >= 0.375;
    float _479 = trunc(_325);
    float _481 = precise::max(_479, 0.0);
    uint _483 = uint(_481);
    float _485 = fma(_287, -1.99999904632568359375, 1.99999904632568359375);
    int _487 = _403 | _473;
    float _489 = trunc(_335);
    float _491 = precise::max(_489, 0.0);
    uint _493 = uint(_491);
    int _495 = int(_483);
    if (!_349)
    {
        int _497 = int(_455) + 1;
        _457 = _497;
    }
    int _499 = _457;
    float _501 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _503 = abs(_445);
    bool _505 = _503 >= 0.375;
    int _507 = _499 << 6;
    float _509 = trunc(_337);
    float _511 = precise::max(_509, 0.0);
    uint _513 = uint(_511);
    float _515 = trunc(_345);
    float _517 = precise::max(_515, 0.0);
    uint _519 = uint(_517);
    int _521 = int(_513);
    if (!_371)
    {
        int _523 = int(_493) + 1;
        _495 = _523;
    }
    int _525 = _495;
    float _527 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _529 = -_289;
    float _531 = _529 + 0.5;
    float _533 = abs(_449);
    bool _535 = _533 >= 0.375;
    int _537 = _525 * 512;
    float _539 = trunc(_355);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _487 | _507;
    int _547 = _537 | _545;
    float _549 = trunc(_357);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    int _555 = int(_543);
    if (!_389)
    {
        int _557 = int(_519) + 1;
        _521 = _557;
    }
    int _559 = _521;
    float _561 = abs(_471);
    bool _563 = _561 >= 0.375;
    float _565 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    int _567 = _559 * 4096;
    float _569 = trunc(_359);
    float _571 = precise::max(_569, 0.0);
    uint _573 = uint(_571);
    float _575 = trunc(_361);
    float _577 = precise::max(_575, 0.0);
    uint _579 = uint(_577);
    int _581 = int(_573);
    if (!_431)
    {
        int _583 = int(_553) + 1;
        _555 = _583;
    }
    int _585 = _555;
    float _587 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    int _589 = _585 << 21;
    float _591 = trunc(_377);
    float _593 = precise::max(_591, 0.0);
    uint _595 = uint(_593);
    float _597 = trunc(_379);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    int _605 = int(_595);
    if (!_419)
    {
        int _607 = int(_579) + 1;
        _581 = _607;
    }
    int _609 = _581;
    float _611 = -_291;
    float _613 = _611 + 0.5;
    float _615 = abs(_531);
    bool _617 = _615 >= 0.375;
    float _619 = trunc(_385);
    float _621 = precise::max(_619, 0.0);
    uint _623 = uint(_621);
    float _625 = fma(_287, -7.99999904632568359375, 7.99999904632568359375);
    float _627 = -_287;
    float _629 = _627 + 0.5;
    float _631 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    float _633 = -_293;
    float _635 = _633 + 0.5;
    float _637 = abs(_613);
    bool _639 = _637 >= 0.375;
    float _641 = trunc(_413);
    float _643 = precise::max(_641, 0.0);
    uint _645 = uint(_643);
    int _647 = int(_623);
    if (!_437)
    {
        int _649 = int(_601) + 1;
        _605 = _649;
    }
    int _651 = _605;
    float _653 = abs(_629);
    bool _655 = _653 >= 0.375;
    int _657 = _651 << 15;
    float _659 = trunc(_415);
    float _661 = precise::max(_659, 0.0);
    uint _663 = uint(_661);
    int _665 = _547 | _567;
    int _667 = _657 | _665;
    int _669 = _609 << 18;
    int _671 = _667 | _669;
    int _673 = _589 | _671;
    float _675 = trunc(_439);
    float _677 = precise::max(_675, 0.0);
    uint _679 = uint(_677);
    int _681 = int(_663);
    if (!_477)
    {
        int _683 = int(_645) + 1;
        _647 = _683;
    }
    int _685 = _647;
    float _687 = abs(_635);
    bool _689 = _687 >= 0.375;
    float _691 = trunc(_421);
    float _693 = precise::max(_691, 0.0);
    uint _695 = uint(_693);
    float _697 = trunc(_433);
    float _699 = precise::max(_697, 0.0);
    uint _701 = uint(_699);
    int _703 = int(_695);
    if (!_505)
    {
        int _705 = int(_679) + 1;
        _681 = _705;
    }
    int _707 = _681;
    float _709 = trunc(_441);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    float _715 = trunc(_467);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    int _721 = int(_713);
    if (!_535)
    {
        int _723 = int(_701) + 1;
        _703 = _723;
    }
    int _725 = _703;
    int _727 = _707 << 3;
    int _729 = _725 << 6;
    int _731 = _685 | _727;
    float _733 = trunc(_501);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = trunc(_527);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    int _745 = int(_737);
    if (!_563)
    {
        int _747 = int(_719) + 1;
        _721 = _747;
    }
    int _749 = _721;
    int _751 = _749 << 9;
    float _753 = trunc(_485);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    int _759 = _731 | _729;
    int _761 = _751 | _759;
    float _763 = trunc(_625);
    float _765 = precise::max(_763, 0.0);
    uint _767 = uint(_765);
    int _769 = int(_757);
    if (!_617)
    {
        int _771 = int(_743) + 1;
        _745 = _771;
    }
    int _773 = _745;
    int _775 = _773 * 32768;
    float _777 = trunc(_603);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = trunc(_565);
    float _785 = precise::max(_783, 0.0);
    uint _787 = uint(_785);
    int _789 = int(_781);
    if (!_655)
    {
        int _791 = int(_767) + 1;
        _769 = _791;
    }
    int _793 = _769;
    int _795 = _793 << 12;
    float _797 = trunc(_587);
    float _799 = precise::max(_797, 0.0);
    uint _801 = uint(_799);
    int _803 = _761 | _795;
    int _805 = _775 | _803;
    float _807 = trunc(_631);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    int _813 = int(_801);
    if (!_639)
    {
        int _815 = int(_787) + 1;
        _789 = _815;
    }
    int _817 = _789;
    int _819 = _817 * 262144;
    if (!_689)
    {
        int _821 = int(_811) + 1;
        _813 = _821;
    }
    int _823 = _813;
    int _825 = _823 << 21;
    int _827 = _805 | _819;
    int _829 = _825 | _827;
    uint _831 = uint(int(uint(_673) >> uint(16)));
    int _833 = _829 << 8;
    int _835 = _673 & 65535;
    uint _837 = uint(int(uint(_829) >> uint(8)));
    int _839 = 65280 & _833;
    int _841 = int(_831) | _839;
    out.m_32.x = as_type<float>(_179);
    out.m_32.y = as_type<float>(_835);
    out.m_32.z = as_type<float>(_841);
    out.m_32.w = as_type<float>(_837);
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
    float2 _875 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_875, float2(0.0), isnan(_875)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_875, float2(0.0), isnan(_875)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).x;
    float2 _891 = float2(_55, _57);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_891, float2(0.0), isnan(_891)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float2 _901 = float2(_55, _57);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_901, float2(0.0), isnan(_901)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).x;
    float2 _913 = float2(_55, _57);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_913, float2(0.0), isnan(_913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_913, float2(0.0), isnan(_913)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).x;
    float2 _924 = float2(_55, _57);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float2(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_924, float2(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).x;
    float2 _935 = float2(_55, _57);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_935, float2(0.0), isnan(_935)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_935, float2(0.0), isnan(_935)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).x;
    float2 _946 = float2(_55, _57);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).x;
    float2 _957 = float2(_55, _57);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_957, float2(0.0), isnan(_957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_957, float2(0.0), isnan(_957)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).x;
    float2 _968 = float2(_55, _57);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_968, float2(0.0), isnan(_968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_968, float2(0.0), isnan(_968)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).x;
    float2 _979 = float2(_55, _57);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_979, float2(0.0), isnan(_979)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_979, float2(0.0), isnan(_979)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).x;
    float2 _990 = float2(_55, _57);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_990, float2(0.0), isnan(_990)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_990, float2(0.0), isnan(_990)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).x;
    float2 _1001 = float2(_55, _57);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1001, float2(0.0), isnan(_1001)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1001, float2(0.0), isnan(_1001)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).x;
    float2 _1012 = float2(_55, _57);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1012, float2(0.0), isnan(_1012)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1012, float2(0.0), isnan(_1012)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).x;
    float2 _1023 = float2(_55, _57);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1023, float2(0.0), isnan(_1023)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1023, float2(0.0), isnan(_1023)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).x;
    float2 _1034 = float2(_55, _57);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1034, float2(0.0), isnan(_1034)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1034, float2(0.0), isnan(_1034)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).x;
    float2 _1045 = float2(_55, _57);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1045, float2(0.0), isnan(_1045)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1045, float2(0.0), isnan(_1045)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).x;
    float _91 = precise::max(_61, _59);
    float _93 = precise::max(_63, _65);
    float _95 = precise::max(_67, _69);
    float _97 = precise::max(_91, _93);
    float _99 = precise::min(_61, _59);
    float _101 = precise::max(_71, _73);
    float _103 = precise::min(_63, _65);
    float _105 = precise::min(_67, _69);
    float _107 = precise::min(_71, _73);
    float _109 = precise::max(_95, _101);
    float _111 = precise::min(_99, _103);
    float _113 = precise::min(_105, _107);
    float _115 = precise::max(_75, _77);
    float _117 = precise::max(_79, _81);
    float _119 = precise::max(_97, _109);
    float _121 = precise::min(_111, _113);
    float _123 = precise::max(_115, _117);
    float _125 = precise::min(_75, _77);
    float _127 = precise::max(_83, _85);
    float _129 = precise::max(_87, _89);
    float _131 = precise::min(_79, _81);
    float _133 = precise::min(_83, _85);
    float _135 = precise::min(_87, _89);
    float _137 = precise::max(_127, _129);
    float _139 = precise::min(_125, _131);
    float _141 = precise::min(_133, _135);
    float _143 = precise::max(_123, _137);
    float _145 = precise::min(_139, _141);
    float _147 = precise::max(_119, _143);
    float _149 = precise::min(_121, _145);
    float _151 = _147 * 255.0;
    float _153 = _149 * 255.0;
    float _155 = trunc(_151);
    float _157 = precise::max(_155, 0.0);
    uint _160 = uint(_157);
    float _162 = trunc(_153);
    float _164 = precise::max(_162, 0.0);
    uint _166 = uint(_164);
    bool _170 = _160 > _166;
    int _173 = int(_166) << 8;
    int _175 = _173 & 65280;
    int _177 = 255 & int(_160);
    int _179 = _175 | _177;
    int _181 = as_type<int>(_145);
    int _183 = as_type<int>(_131);
    int _185 = as_type<int>(_137);
    if (!_170)
    {
        _181 = 0;
    }
    int _187 = _181;
    if (!_170)
    {
        _183 = 0;
        _185 = 0;
    }
    int _189 = _183;
    int _191 = _185;
    if (!_170)
    {
        out.m_32.x = as_type<float>(_179);
        out.m_32.y = as_type<float>(_187);
        out.m_32.z = as_type<float>(_189);
        out.m_32.w = as_type<float>(_191);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _193 = -_149;
    float _195 = _147 + _193;
    float _197 = -_149;
    float _199 = _61 + _197;
    float _201 = -_149;
    float _203 = _65 + _201;
    float _205 = -_149;
    float _207 = _59 + _205;
    float _209 = -_149;
    float _211 = _67 + _209;
    float _213 = -_149;
    float _215 = _69 + _213;
    float _217 = 1.0 / _195;
    float _219 = -_149;
    float _221 = _71 + _219;
    float _223 = -_149;
    float _225 = _73 + _223;
    float _227 = -_149;
    float _229 = _75 + _227;
    float _231 = -_149;
    float _233 = _77 + _231;
    float _235 = -_149;
    float _237 = _79 + _235;
    float _239 = -_149;
    float _241 = _81 + _239;
    float _243 = -_149;
    float _245 = _83 + _243;
    float _247 = -_149;
    float _249 = _85 + _247;
    float _251 = -_149;
    float _253 = _87 + _251;
    float _255 = -_149;
    float _257 = _89 + _255;
    float _259 = _199 * _217;
    float _261 = -_149;
    float _263 = _63 + _261;
    float _265 = _207 * _217;
    float _267 = _203 * _217;
    float _269 = _211 * _217;
    float _271 = _263 * _217;
    float _273 = _215 * _217;
    float _275 = _221 * _217;
    float _277 = _225 * _217;
    float _279 = _229 * _217;
    float _281 = _233 * _217;
    float _283 = _237 * _217;
    float _285 = _241 * _217;
    float _287 = _245 * _217;
    float _289 = _249 * _217;
    float _291 = _253 * _217;
    float _293 = _257 * _217;
    float _295 = -_259;
    float _297 = _295 + 0.5;
    float _299 = fma(_259, -1.99999904632568359375, 1.99999904632568359375);
    float _301 = fma(_259, -7.99999904632568359375, 7.99999904632568359375);
    float _303 = fma(_265, -1.99999904632568359375, 1.99999904632568359375);
    float _305 = fma(_265, -7.99999904632568359375, 7.99999904632568359375);
    float _307 = abs(_297);
    bool _309 = _307 >= 0.375;
    float _311 = -_265;
    float _313 = _311 + 0.5;
    float _315 = trunc(_299);
    float _317 = precise::max(_315, 0.0);
    uint _319 = uint(_317);
    float _321 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _323 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _325 = fma(_267, -1.99999904632568359375, 1.99999904632568359375);
    float _327 = abs(_313);
    bool _329 = _327 >= 0.375;
    float _331 = -_271;
    float _333 = _331 + 0.5;
    float _335 = fma(_267, -7.99999904632568359375, 7.99999904632568359375);
    float _337 = fma(_269, -1.99999904632568359375, 1.99999904632568359375);
    float _339 = trunc(_301);
    float _341 = precise::max(_339, 0.0);
    uint _343 = uint(_341);
    float _345 = fma(_269, -7.99999904632568359375, 7.99999904632568359375);
    float _347 = abs(_333);
    bool _349 = _347 >= 0.375;
    float _351 = -_267;
    float _353 = _351 + 0.5;
    float _355 = fma(_277, -1.99999904632568359375, 1.99999904632568359375);
    float _357 = fma(_277, -7.99999904632568359375, 7.99999904632568359375);
    float _359 = fma(_275, -1.99999904632568359375, 1.99999904632568359375);
    float _361 = fma(_275, -7.99999904632568359375, 7.99999904632568359375);
    float _363 = trunc(_303);
    float _365 = precise::max(_363, 0.0);
    uint _367 = uint(_365);
    float _369 = abs(_353);
    bool _371 = _369 >= 0.375;
    float _373 = -_269;
    float _375 = _373 + 0.5;
    float _377 = fma(_273, -1.99999904632568359375, 1.99999904632568359375);
    float _379 = fma(_273, -7.99999904632568359375, 7.99999904632568359375);
    float _381 = -_275;
    float _383 = _381 + 0.5;
    float _385 = fma(_279, -1.99999904632568359375, 1.99999904632568359375);
    float _387 = abs(_375);
    bool _389 = _387 >= 0.375;
    float _391 = trunc(_305);
    float _393 = precise::max(_391, 0.0);
    uint _395 = uint(_393);
    int _397 = int(_319);
    int _399 = int(_367);
    if (!_309)
    {
        int _401 = int(_343) + 1;
        _397 = _401;
    }
    int _403 = _397;
    float _405 = -_277;
    float _407 = _405 + 0.5;
    float _409 = -_273;
    float _411 = _409 + 0.5;
    float _413 = fma(_279, -7.99999904632568359375, 7.99999904632568359375);
    float _415 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _417 = abs(_383);
    bool _419 = _417 >= 0.375;
    float _421 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _423 = trunc(_321);
    float _425 = precise::max(_423, 0.0);
    uint _427 = uint(_425);
    float _429 = abs(_407);
    bool _431 = _429 >= 0.375;
    float _433 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _435 = abs(_411);
    bool _437 = _435 >= 0.375;
    float _439 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _441 = fma(_285, -1.99999904632568359375, 1.99999904632568359375);
    float _443 = -_281;
    float _445 = _443 + 0.5;
    float _447 = -_283;
    float _449 = _447 + 0.5;
    float _451 = trunc(_323);
    float _453 = precise::max(_451, 0.0);
    uint _455 = uint(_453);
    int _457 = int(_427);
    if (!_329)
    {
        int _459 = int(_395) + 1;
        _399 = _459;
    }
    int _461 = _399;
    float _463 = -_279;
    float _465 = _463 + 0.5;
    float _467 = fma(_285, -7.99999904632568359375, 7.99999904632568359375);
    float _469 = -_285;
    float _471 = _469 + 0.5;
    int _473 = _461 * 8;
    float _475 = abs(_465);
    bool _477 = _475 >= 0.375;
    float _479 = trunc(_325);
    float _481 = precise::max(_479, 0.0);
    uint _483 = uint(_481);
    float _485 = fma(_287, -1.99999904632568359375, 1.99999904632568359375);
    int _487 = _403 | _473;
    float _489 = trunc(_335);
    float _491 = precise::max(_489, 0.0);
    uint _493 = uint(_491);
    int _495 = int(_483);
    if (!_349)
    {
        int _497 = int(_455) + 1;
        _457 = _497;
    }
    int _499 = _457;
    float _501 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _503 = abs(_445);
    bool _505 = _503 >= 0.375;
    int _507 = _499 << 6;
    float _509 = trunc(_337);
    float _511 = precise::max(_509, 0.0);
    uint _513 = uint(_511);
    float _515 = trunc(_345);
    float _517 = precise::max(_515, 0.0);
    uint _519 = uint(_517);
    int _521 = int(_513);
    if (!_371)
    {
        int _523 = int(_493) + 1;
        _495 = _523;
    }
    int _525 = _495;
    float _527 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _529 = -_289;
    float _531 = _529 + 0.5;
    float _533 = abs(_449);
    bool _535 = _533 >= 0.375;
    int _537 = _525 * 512;
    float _539 = trunc(_355);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _487 | _507;
    int _547 = _537 | _545;
    float _549 = trunc(_357);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    int _555 = int(_543);
    if (!_389)
    {
        int _557 = int(_519) + 1;
        _521 = _557;
    }
    int _559 = _521;
    float _561 = abs(_471);
    bool _563 = _561 >= 0.375;
    float _565 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    int _567 = _559 * 4096;
    float _569 = trunc(_359);
    float _571 = precise::max(_569, 0.0);
    uint _573 = uint(_571);
    float _575 = trunc(_361);
    float _577 = precise::max(_575, 0.0);
    uint _579 = uint(_577);
    int _581 = int(_573);
    if (!_431)
    {
        int _583 = int(_553) + 1;
        _555 = _583;
    }
    int _585 = _555;
    float _587 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    int _589 = _585 << 21;
    float _591 = trunc(_377);
    float _593 = precise::max(_591, 0.0);
    uint _595 = uint(_593);
    float _597 = trunc(_379);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    int _605 = int(_595);
    if (!_419)
    {
        int _607 = int(_579) + 1;
        _581 = _607;
    }
    int _609 = _581;
    float _611 = -_291;
    float _613 = _611 + 0.5;
    float _615 = abs(_531);
    bool _617 = _615 >= 0.375;
    float _619 = trunc(_385);
    float _621 = precise::max(_619, 0.0);
    uint _623 = uint(_621);
    float _625 = fma(_287, -7.99999904632568359375, 7.99999904632568359375);
    float _627 = -_287;
    float _629 = _627 + 0.5;
    float _631 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    float _633 = -_293;
    float _635 = _633 + 0.5;
    float _637 = abs(_613);
    bool _639 = _637 >= 0.375;
    float _641 = trunc(_413);
    float _643 = precise::max(_641, 0.0);
    uint _645 = uint(_643);
    int _647 = int(_623);
    if (!_437)
    {
        int _649 = int(_601) + 1;
        _605 = _649;
    }
    int _651 = _605;
    float _653 = abs(_629);
    bool _655 = _653 >= 0.375;
    int _657 = _651 << 15;
    float _659 = trunc(_415);
    float _661 = precise::max(_659, 0.0);
    uint _663 = uint(_661);
    int _665 = _547 | _567;
    int _667 = _657 | _665;
    int _669 = _609 << 18;
    int _671 = _667 | _669;
    int _673 = _589 | _671;
    float _675 = trunc(_439);
    float _677 = precise::max(_675, 0.0);
    uint _679 = uint(_677);
    int _681 = int(_663);
    if (!_477)
    {
        int _683 = int(_645) + 1;
        _647 = _683;
    }
    int _685 = _647;
    float _687 = abs(_635);
    bool _689 = _687 >= 0.375;
    float _691 = trunc(_421);
    float _693 = precise::max(_691, 0.0);
    uint _695 = uint(_693);
    float _697 = trunc(_433);
    float _699 = precise::max(_697, 0.0);
    uint _701 = uint(_699);
    int _703 = int(_695);
    if (!_505)
    {
        int _705 = int(_679) + 1;
        _681 = _705;
    }
    int _707 = _681;
    float _709 = trunc(_441);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    float _715 = trunc(_467);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    int _721 = int(_713);
    if (!_535)
    {
        int _723 = int(_701) + 1;
        _703 = _723;
    }
    int _725 = _703;
    int _727 = _707 << 3;
    int _729 = _725 << 6;
    int _731 = _685 | _727;
    float _733 = trunc(_501);
    float _735 = precise::max(_733, 0.0);
    uint _737 = uint(_735);
    float _739 = trunc(_527);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    int _745 = int(_737);
    if (!_563)
    {
        int _747 = int(_719) + 1;
        _721 = _747;
    }
    int _749 = _721;
    int _751 = _749 << 9;
    float _753 = trunc(_485);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    int _759 = _731 | _729;
    int _761 = _751 | _759;
    float _763 = trunc(_625);
    float _765 = precise::max(_763, 0.0);
    uint _767 = uint(_765);
    int _769 = int(_757);
    if (!_617)
    {
        int _771 = int(_743) + 1;
        _745 = _771;
    }
    int _773 = _745;
    int _775 = _773 * 32768;
    float _777 = trunc(_603);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = trunc(_565);
    float _785 = precise::max(_783, 0.0);
    uint _787 = uint(_785);
    int _789 = int(_781);
    if (!_655)
    {
        int _791 = int(_767) + 1;
        _769 = _791;
    }
    int _793 = _769;
    int _795 = _793 << 12;
    float _797 = trunc(_587);
    float _799 = precise::max(_797, 0.0);
    uint _801 = uint(_799);
    int _803 = _761 | _795;
    int _805 = _775 | _803;
    float _807 = trunc(_631);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    int _813 = int(_801);
    if (!_639)
    {
        int _815 = int(_787) + 1;
        _789 = _815;
    }
    int _817 = _789;
    int _819 = _817 * 262144;
    if (!_689)
    {
        int _821 = int(_811) + 1;
        _813 = _821;
    }
    int _823 = _813;
    int _825 = _823 << 21;
    int _827 = _805 | _819;
    int _829 = _825 | _827;
    uint _831 = uint(int(uint(_673) >> uint(16)));
    int _833 = _829 << 8;
    int _835 = _673 & 65535;
    uint _837 = uint(int(uint(_829) >> uint(8)));
    int _839 = 65280 & _833;
    int _841 = int(_831) | _839;
    out.m_32.x = as_type<float>(_179);
    out.m_32.y = as_type<float>(_835);
    out.m_32.z = as_type<float>(_841);
    out.m_32.w = as_type<float>(_837);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

