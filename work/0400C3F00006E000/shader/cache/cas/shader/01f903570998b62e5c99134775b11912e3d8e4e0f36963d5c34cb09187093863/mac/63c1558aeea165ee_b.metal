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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.z;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _895 = float3(_61, _65, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_895, float3(0.0), isnan(_895)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_895, float3(0.0), isnan(_895)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).x;
    float3 _912 = float3(_61, _65, _63);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float3(0.0), isnan(_912)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_912, float3(0.0), isnan(_912)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).x;
    float3 _924 = float3(_61, _65, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float3(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_924, float3(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).x;
    float3 _936 = float3(_61, _65, _63);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_936, float3(0.0), isnan(_936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_936, float3(0.0), isnan(_936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).x;
    float3 _948 = float3(_61, _65, _63);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_948, float3(0.0), isnan(_948)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_948, float3(0.0), isnan(_948)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).x;
    float3 _960 = float3(_61, _65, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float3(0.0), isnan(_960)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float3(0.0), isnan(_960)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).x;
    float3 _972 = float3(_61, _65, _63);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_972, float3(0.0), isnan(_972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_972, float3(0.0), isnan(_972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).x;
    float3 _984 = float3(_61, _65, _63);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_984, float3(0.0), isnan(_984)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_984, float3(0.0), isnan(_984)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).x;
    float3 _996 = float3(_61, _65, _63);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_996, float3(0.0), isnan(_996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_996, float3(0.0), isnan(_996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).x;
    float3 _1008 = float3(_61, _65, _63);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1008, float3(0.0), isnan(_1008)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1008, float3(0.0), isnan(_1008)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).x;
    float3 _1020 = float3(_61, _65, _63);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1020, float3(0.0), isnan(_1020)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1020, float3(0.0), isnan(_1020)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1031 = float3(_61, _65, _63);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1031, float3(0.0), isnan(_1031)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1031, float3(0.0), isnan(_1031)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).x;
    float3 _1043 = float3(_61, _65, _63);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1043, float3(0.0), isnan(_1043)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1043, float3(0.0), isnan(_1043)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).x;
    float3 _1055 = float3(_61, _65, _63);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1055, float3(0.0), isnan(_1055)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1055, float3(0.0), isnan(_1055)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).x;
    float3 _1067 = float3(_61, _65, _63);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1067, float3(0.0), isnan(_1067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1067, float3(0.0), isnan(_1067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).x;
    float3 _1079 = float3(_61, _65, _63);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1079, float3(0.0), isnan(_1079)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1079, float3(0.0), isnan(_1079)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).x;
    float _99 = precise::max(_67, _69);
    float _101 = precise::min(_67, _69);
    float _103 = precise::max(_71, _73);
    float _105 = precise::max(_99, _103);
    float _107 = precise::min(_71, _73);
    float _109 = precise::min(_101, _107);
    float _111 = precise::max(_75, _77);
    float _113 = precise::max(_79, _81);
    float _115 = precise::min(_79, _81);
    float _117 = precise::max(_83, _85);
    float _119 = precise::min(_83, _85);
    float _121 = precise::max(_113, _117);
    float _123 = precise::min(_115, _119);
    float _125 = precise::min(_75, _77);
    float _127 = precise::max(_87, _89);
    float _129 = precise::min(_87, _89);
    float _131 = precise::max(_127, _111);
    float _133 = precise::min(_129, _125);
    float _135 = precise::max(_91, _93);
    float _137 = precise::min(_91, _93);
    float _139 = precise::max(_95, _97);
    float _141 = precise::min(_95, _97);
    float _143 = precise::max(_135, _139);
    float _145 = precise::min(_137, _141);
    float _147 = precise::max(_131, _105);
    float _149 = precise::max(_121, _143);
    float _151 = precise::min(_133, _109);
    float _153 = precise::min(_123, _145);
    float _155 = precise::max(_147, _149);
    float _157 = precise::min(_151, _153);
    float _159 = _155 * 255.0;
    float _161 = _157 * 255.0;
    float _163 = trunc(_159);
    float _165 = precise::max(_163, 0.0);
    uint _168 = uint(_165);
    float _170 = trunc(_161);
    float _172 = precise::max(_170, 0.0);
    uint _174 = uint(_172);
    bool _178 = _168 > _174;
    int _181 = int(_174) << 8;
    int _183 = _181 & 65280;
    int _185 = 255 & int(_168);
    int _187 = _183 | _185;
    int _189 = as_type<int>(_151);
    int _191 = as_type<int>(_125);
    int _193 = _183;
    if (!_178)
    {
        _189 = 0;
    }
    int _195 = _189;
    if (!_178)
    {
        _191 = 0;
        _193 = 0;
    }
    int _197 = _191;
    int _199 = _193;
    if (!_178)
    {
        out.m_32.x = as_type<float>(_187);
        out.m_32.y = as_type<float>(_195);
        out.m_32.z = as_type<float>(_197);
        out.m_32.w = as_type<float>(_199);
        return out;
    }
    float _201 = -_157;
    float _203 = _155 + _201;
    float _205 = -_157;
    float _207 = _89 + _205;
    float _209 = -_157;
    float _211 = _87 + _209;
    float _213 = -_157;
    float _215 = _75 + _213;
    float _217 = -_157;
    float _219 = _77 + _217;
    float _221 = -_157;
    float _223 = _67 + _221;
    float _225 = 1.0 / _203;
    float _227 = -_157;
    float _229 = _69 + _227;
    float _231 = -_157;
    float _233 = _71 + _231;
    float _235 = -_157;
    float _237 = _73 + _235;
    float _239 = -_157;
    float _241 = _79 + _239;
    float _243 = -_157;
    float _245 = _81 + _243;
    float _247 = -_157;
    float _249 = _85 + _247;
    float _251 = -_157;
    float _253 = _91 + _251;
    float _255 = -_157;
    float _257 = _93 + _255;
    float _259 = -_157;
    float _261 = _97 + _259;
    float _263 = _207 * _225;
    float _265 = -_157;
    float _267 = _83 + _265;
    float _269 = _211 * _225;
    float _271 = _215 * _225;
    float _273 = _219 * _225;
    float _275 = _267 * _225;
    float _277 = -_157;
    float _279 = _95 + _277;
    float _281 = _223 * _225;
    float _283 = _229 * _225;
    float _285 = _233 * _225;
    float _287 = _237 * _225;
    float _289 = _241 * _225;
    float _291 = _245 * _225;
    float _293 = _249 * _225;
    float _295 = _253 * _225;
    float _297 = _257 * _225;
    float _299 = _279 * _225;
    float _301 = _261 * _225;
    float _303 = -_269;
    float _305 = _303 + 0.5;
    float _307 = fma(_269, -1.99999904632568359375, 1.99999904632568359375);
    float _309 = fma(_269, -7.99999904632568359375, 7.99999904632568359375);
    float _311 = fma(_263, -1.99999904632568359375, 1.99999904632568359375);
    float _313 = fma(_263, -7.99999904632568359375, 7.99999904632568359375);
    float _315 = abs(_305);
    bool _317 = _315 >= 0.375;
    float _319 = -_263;
    float _321 = _319 + 0.5;
    float _323 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _325 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _327 = trunc(_307);
    float _329 = precise::max(_327, 0.0);
    uint _331 = uint(_329);
    float _333 = fma(_273, -1.99999904632568359375, 1.99999904632568359375);
    float _335 = abs(_321);
    bool _337 = _335 >= 0.375;
    float _339 = -_271;
    float _341 = _339 + 0.5;
    float _343 = fma(_273, -7.99999904632568359375, 7.99999904632568359375);
    float _345 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _347 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _349 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _351 = trunc(_309);
    float _353 = precise::max(_351, 0.0);
    uint _355 = uint(_353);
    float _357 = abs(_341);
    bool _359 = _357 >= 0.375;
    float _361 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _363 = fma(_285, -1.99999904632568359375, 1.99999904632568359375);
    float _365 = fma(_285, -7.99999904632568359375, 7.99999904632568359375);
    float _367 = -_273;
    float _369 = _367 + 0.5;
    float _371 = -_281;
    float _373 = _371 + 0.5;
    float _375 = fma(_287, -1.99999904632568359375, 1.99999904632568359375);
    float _377 = trunc(_311);
    float _379 = precise::max(_377, 0.0);
    uint _381 = uint(_379);
    float _383 = fma(_287, -7.99999904632568359375, 7.99999904632568359375);
    float _385 = -_283;
    float _387 = _385 + 0.5;
    float _389 = -_285;
    float _391 = _389 + 0.5;
    float _393 = abs(_369);
    bool _395 = _393 >= 0.375;
    float _397 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _399 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _401 = abs(_373);
    bool _403 = _401 >= 0.375;
    float _405 = trunc(_313);
    float _407 = precise::max(_405, 0.0);
    uint _409 = uint(_407);
    float _411 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    float _413 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    float _415 = -_287;
    float _417 = _415 + 0.5;
    float _419 = abs(_387);
    bool _421 = _419 >= 0.375;
    float _423 = -_289;
    float _425 = _423 + 0.5;
    float _427 = abs(_391);
    bool _429 = _427 >= 0.375;
    float _431 = fma(_275, -1.99999904632568359375, 1.99999904632568359375);
    float _433 = trunc(_323);
    float _435 = precise::max(_433, 0.0);
    uint _437 = uint(_435);
    float _439 = fma(_275, -7.99999904632568359375, 7.99999904632568359375);
    float _441 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    float _443 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    int _445 = int(_331);
    int _447 = int(_381);
    int _449 = int(_437);
    if (!_317)
    {
        int _451 = int(_355) + 1;
        _445 = _451;
    }
    int _453 = _445;
    float _455 = -_291;
    float _457 = _455 + 0.5;
    float _459 = abs(_417);
    bool _461 = _459 >= 0.375;
    float _463 = fma(_295, -1.99999904632568359375, 1.99999904632568359375);
    float _465 = trunc(_325);
    float _467 = precise::max(_465, 0.0);
    uint _469 = uint(_467);
    if (!_337)
    {
        int _471 = int(_409) + 1;
        _447 = _471;
    }
    int _473 = _447;
    float _475 = fma(_295, -7.99999904632568359375, 7.99999904632568359375);
    float _477 = abs(_425);
    bool _479 = _477 >= 0.375;
    float _481 = fma(_297, -1.99999904632568359375, 1.99999904632568359375);
    float _483 = fma(_297, -7.99999904632568359375, 7.99999904632568359375);
    float _485 = -_275;
    float _487 = _485 + 0.5;
    float _489 = -_293;
    float _491 = _489 + 0.5;
    float _493 = trunc(_333);
    float _495 = precise::max(_493, 0.0);
    uint _497 = uint(_495);
    float _499 = fma(_299, -1.99999904632568359375, 1.99999904632568359375);
    float _501 = -_295;
    float _503 = _501 + 0.5;
    float _505 = -_297;
    float _507 = _505 + 0.5;
    float _509 = fma(_301, -1.99999904632568359375, 1.99999904632568359375);
    int _511 = _473 * 8;
    float _513 = trunc(_343);
    float _515 = precise::max(_513, 0.0);
    uint _517 = uint(_515);
    int _519 = int(_497);
    if (!_359)
    {
        int _521 = int(_469) + 1;
        _449 = _521;
    }
    int _523 = _449;
    float _525 = abs(_457);
    bool _527 = _525 >= 0.375;
    int _529 = _453 | _511;
    int _531 = _523 << 6;
    float _533 = trunc(_345);
    float _535 = precise::max(_533, 0.0);
    uint _537 = uint(_535);
    float _539 = trunc(_347);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = int(_537);
    if (!_395)
    {
        int _547 = int(_517) + 1;
        _519 = _547;
    }
    int _549 = _519;
    float _551 = fma(_299, -7.99999904632568359375, 7.99999904632568359375);
    float _553 = fma(_301, -7.99999904632568359375, 7.99999904632568359375);
    float _555 = abs(_487);
    bool _557 = _555 >= 0.375;
    float _559 = -_299;
    float _561 = _559 + 0.5;
    float _563 = -_301;
    float _565 = _563 + 0.5;
    int _567 = _549 * 512;
    float _569 = trunc(_349);
    float _571 = precise::max(_569, 0.0);
    uint _573 = uint(_571);
    int _575 = _529 | _531;
    int _577 = _567 | _575;
    float _579 = trunc(_361);
    float _581 = precise::max(_579, 0.0);
    uint _583 = uint(_581);
    int _585 = int(_573);
    if (!_403)
    {
        int _587 = int(_543) + 1;
        _545 = _587;
    }
    int _589 = _545;
    float _591 = abs(_491);
    bool _593 = _591 >= 0.375;
    int _595 = _589 * 4096;
    float _597 = trunc(_363);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = trunc(_365);
    float _605 = precise::max(_603, 0.0);
    uint _607 = uint(_605);
    int _609 = int(_601);
    if (!_421)
    {
        int _611 = int(_583) + 1;
        _585 = _611;
    }
    int _613 = _585;
    float _615 = abs(_503);
    bool _617 = _615 >= 0.375;
    int _619 = _613 << 15;
    float _621 = trunc(_375);
    float _623 = precise::max(_621, 0.0);
    uint _625 = uint(_623);
    int _627 = _577 | _595;
    int _629 = _619 | _627;
    float _631 = trunc(_383);
    float _633 = precise::max(_631, 0.0);
    uint _635 = uint(_633);
    int _637 = int(_625);
    if (!_429)
    {
        int _639 = int(_607) + 1;
        _609 = _639;
    }
    int _641 = _609;
    float _643 = abs(_507);
    bool _645 = _643 >= 0.375;
    int _647 = _641 << 18;
    float _649 = trunc(_397);
    float _651 = precise::max(_649, 0.0);
    uint _653 = uint(_651);
    float _655 = trunc(_399);
    float _657 = precise::max(_655, 0.0);
    uint _659 = uint(_657);
    int _661 = int(_653);
    if (!_461)
    {
        int _663 = int(_635) + 1;
        _637 = _663;
    }
    int _665 = _637;
    float _667 = abs(_561);
    bool _669 = _667 >= 0.375;
    int _671 = _665 << 21;
    float _673 = trunc(_411);
    float _675 = precise::max(_673, 0.0);
    uint _677 = uint(_675);
    int _679 = _629 | _647;
    int _681 = _671 | _679;
    uint _683 = uint(int(uint(_681) >> uint(16)));
    int _685 = _681 & 65535;
    float _687 = trunc(_413);
    float _689 = precise::max(_687, 0.0);
    uint _691 = uint(_689);
    int _693 = int(_677);
    if (!_479)
    {
        int _695 = int(_659) + 1;
        _661 = _695;
    }
    int _697 = _661;
    float _699 = abs(_565);
    bool _701 = _699 >= 0.375;
    float _703 = trunc(_431);
    float _705 = precise::max(_703, 0.0);
    uint _707 = uint(_705);
    float _709 = trunc(_439);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    int _715 = int(_707);
    if (!_527)
    {
        int _717 = int(_691) + 1;
        _693 = _717;
    }
    int _719 = _693;
    int _721 = _719 << 3;
    float _723 = trunc(_441);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    int _729 = _697 | _721;
    float _731 = trunc(_443);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    int _737 = int(_727);
    if (!_557)
    {
        int _739 = int(_713) + 1;
        _715 = _739;
    }
    int _741 = _715;
    int _743 = _741 << 6;
    float _745 = trunc(_481);
    float _747 = precise::max(_745, 0.0);
    uint _749 = uint(_747);
    float _751 = trunc(_483);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    int _757 = int(_749);
    if (!_593)
    {
        int _759 = int(_735) + 1;
        _737 = _759;
    }
    int _761 = _737;
    int _763 = _761 << 9;
    float _765 = trunc(_463);
    float _767 = precise::max(_765, 0.0);
    uint _769 = uint(_767);
    int _771 = _729 | _743;
    int _773 = _763 | _771;
    float _775 = trunc(_475);
    float _777 = precise::max(_775, 0.0);
    uint _779 = uint(_777);
    int _781 = int(_769);
    if (!_645)
    {
        int _783 = int(_755) + 1;
        _757 = _783;
    }
    int _785 = _757;
    int _787 = _785 * 32768;
    float _789 = trunc(_499);
    float _791 = precise::max(_789, 0.0);
    uint _793 = uint(_791);
    float _795 = trunc(_551);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    int _801 = int(_793);
    if (!_617)
    {
        int _803 = int(_779) + 1;
        _781 = _803;
    }
    int _805 = _781;
    int _807 = _805 << 12;
    float _809 = trunc(_509);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    int _815 = _773 | _807;
    int _817 = _787 | _815;
    float _819 = trunc(_553);
    float _821 = precise::max(_819, 0.0);
    uint _823 = uint(_821);
    int _825 = int(_813);
    if (!_669)
    {
        int _827 = int(_799) + 1;
        _801 = _827;
    }
    int _829 = _801;
    int _831 = _829 * 262144;
    if (!_701)
    {
        int _833 = int(_823) + 1;
        _825 = _833;
    }
    int _835 = _825;
    int _837 = _835 << 21;
    int _839 = _817 | _831;
    int _841 = _837 | _839;
    int _843 = _841 << 8;
    uint _845 = uint(int(uint(_841) >> uint(8)));
    int _847 = 65280 & _843;
    int _849 = int(_683) | _847;
    out.m_32.x = as_type<float>(_187);
    out.m_32.y = as_type<float>(_685);
    out.m_32.z = as_type<float>(_849);
    out.m_32.w = as_type<float>(_845);
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
    float _47 = in.m_29.z;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float3 _895 = float3(_61, _65, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_895, float3(0.0), isnan(_895)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_895, float3(0.0), isnan(_895)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 1, 0)).x;
    float3 _912 = float3(_61, _65, _63);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_912, float3(0.0), isnan(_912)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_912, float3(0.0), isnan(_912)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 1, 0)).x;
    float3 _924 = float3(_61, _65, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float3(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_924, float3(0.0), isnan(_924)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 1, 0)).x;
    float3 _936 = float3(_61, _65, _63);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_936, float3(0.0), isnan(_936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_936, float3(0.0), isnan(_936)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 1, 0)).x;
    float3 _948 = float3(_61, _65, _63);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_948, float3(0.0), isnan(_948)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_948, float3(0.0), isnan(_948)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 0, 0)).x;
    float3 _960 = float3(_61, _65, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float3(0.0), isnan(_960)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float3(0.0), isnan(_960)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 0, 0)).x;
    float3 _972 = float3(_61, _65, _63);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_972, float3(0.0), isnan(_972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_972, float3(0.0), isnan(_972)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 2, 0)).x;
    float3 _984 = float3(_61, _65, _63);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_984, float3(0.0), isnan(_984)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_984, float3(0.0), isnan(_984)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 2, 0)).x;
    float3 _996 = float3(_61, _65, _63);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_996, float3(0.0), isnan(_996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_996, float3(0.0), isnan(_996)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 2, 0)).x;
    float3 _1008 = float3(_61, _65, _63);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1008, float3(0.0), isnan(_1008)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1008, float3(0.0), isnan(_1008)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 2, 0)).x;
    float3 _1020 = float3(_61, _65, _63);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1020, float3(0.0), isnan(_1020)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1020, float3(0.0), isnan(_1020)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1031 = float3(_61, _65, _63);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1031, float3(0.0), isnan(_1031)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1031, float3(0.0), isnan(_1031)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 0, 0)).x;
    float3 _1043 = float3(_61, _65, _63);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1043, float3(0.0), isnan(_1043)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1043, float3(0.0), isnan(_1043)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(0, 3, 0)).x;
    float3 _1055 = float3(_61, _65, _63);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1055, float3(0.0), isnan(_1055)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1055, float3(0.0), isnan(_1055)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(1, 3, 0)).x;
    float3 _1067 = float3(_61, _65, _63);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1067, float3(0.0), isnan(_1067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1067, float3(0.0), isnan(_1067)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(2, 3, 0)).x;
    float3 _1079 = float3(_61, _65, _63);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1079, float3(0.0), isnan(_1079)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1079, float3(0.0), isnan(_1079)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int3(3, 3, 0)).x;
    float _99 = precise::max(_67, _69);
    float _101 = precise::min(_67, _69);
    float _103 = precise::max(_71, _73);
    float _105 = precise::max(_99, _103);
    float _107 = precise::min(_71, _73);
    float _109 = precise::min(_101, _107);
    float _111 = precise::max(_75, _77);
    float _113 = precise::max(_79, _81);
    float _115 = precise::min(_79, _81);
    float _117 = precise::max(_83, _85);
    float _119 = precise::min(_83, _85);
    float _121 = precise::max(_113, _117);
    float _123 = precise::min(_115, _119);
    float _125 = precise::min(_75, _77);
    float _127 = precise::max(_87, _89);
    float _129 = precise::min(_87, _89);
    float _131 = precise::max(_127, _111);
    float _133 = precise::min(_129, _125);
    float _135 = precise::max(_91, _93);
    float _137 = precise::min(_91, _93);
    float _139 = precise::max(_95, _97);
    float _141 = precise::min(_95, _97);
    float _143 = precise::max(_135, _139);
    float _145 = precise::min(_137, _141);
    float _147 = precise::max(_131, _105);
    float _149 = precise::max(_121, _143);
    float _151 = precise::min(_133, _109);
    float _153 = precise::min(_123, _145);
    float _155 = precise::max(_147, _149);
    float _157 = precise::min(_151, _153);
    float _159 = _155 * 255.0;
    float _161 = _157 * 255.0;
    float _163 = trunc(_159);
    float _165 = precise::max(_163, 0.0);
    uint _168 = uint(_165);
    float _170 = trunc(_161);
    float _172 = precise::max(_170, 0.0);
    uint _174 = uint(_172);
    bool _178 = _168 > _174;
    int _181 = int(_174) << 8;
    int _183 = _181 & 65280;
    int _185 = 255 & int(_168);
    int _187 = _183 | _185;
    int _189 = as_type<int>(_151);
    int _191 = as_type<int>(_125);
    int _193 = _183;
    if (!_178)
    {
        _189 = 0;
    }
    int _195 = _189;
    if (!_178)
    {
        _191 = 0;
        _193 = 0;
    }
    int _197 = _191;
    int _199 = _193;
    if (!_178)
    {
        out.m_32.x = as_type<float>(_187);
        out.m_32.y = as_type<float>(_195);
        out.m_32.z = as_type<float>(_197);
        out.m_32.w = as_type<float>(_199);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _201 = -_157;
    float _203 = _155 + _201;
    float _205 = -_157;
    float _207 = _89 + _205;
    float _209 = -_157;
    float _211 = _87 + _209;
    float _213 = -_157;
    float _215 = _75 + _213;
    float _217 = -_157;
    float _219 = _77 + _217;
    float _221 = -_157;
    float _223 = _67 + _221;
    float _225 = 1.0 / _203;
    float _227 = -_157;
    float _229 = _69 + _227;
    float _231 = -_157;
    float _233 = _71 + _231;
    float _235 = -_157;
    float _237 = _73 + _235;
    float _239 = -_157;
    float _241 = _79 + _239;
    float _243 = -_157;
    float _245 = _81 + _243;
    float _247 = -_157;
    float _249 = _85 + _247;
    float _251 = -_157;
    float _253 = _91 + _251;
    float _255 = -_157;
    float _257 = _93 + _255;
    float _259 = -_157;
    float _261 = _97 + _259;
    float _263 = _207 * _225;
    float _265 = -_157;
    float _267 = _83 + _265;
    float _269 = _211 * _225;
    float _271 = _215 * _225;
    float _273 = _219 * _225;
    float _275 = _267 * _225;
    float _277 = -_157;
    float _279 = _95 + _277;
    float _281 = _223 * _225;
    float _283 = _229 * _225;
    float _285 = _233 * _225;
    float _287 = _237 * _225;
    float _289 = _241 * _225;
    float _291 = _245 * _225;
    float _293 = _249 * _225;
    float _295 = _253 * _225;
    float _297 = _257 * _225;
    float _299 = _279 * _225;
    float _301 = _261 * _225;
    float _303 = -_269;
    float _305 = _303 + 0.5;
    float _307 = fma(_269, -1.99999904632568359375, 1.99999904632568359375);
    float _309 = fma(_269, -7.99999904632568359375, 7.99999904632568359375);
    float _311 = fma(_263, -1.99999904632568359375, 1.99999904632568359375);
    float _313 = fma(_263, -7.99999904632568359375, 7.99999904632568359375);
    float _315 = abs(_305);
    bool _317 = _315 >= 0.375;
    float _319 = -_263;
    float _321 = _319 + 0.5;
    float _323 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _325 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _327 = trunc(_307);
    float _329 = precise::max(_327, 0.0);
    uint _331 = uint(_329);
    float _333 = fma(_273, -1.99999904632568359375, 1.99999904632568359375);
    float _335 = abs(_321);
    bool _337 = _335 >= 0.375;
    float _339 = -_271;
    float _341 = _339 + 0.5;
    float _343 = fma(_273, -7.99999904632568359375, 7.99999904632568359375);
    float _345 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _347 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _349 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _351 = trunc(_309);
    float _353 = precise::max(_351, 0.0);
    uint _355 = uint(_353);
    float _357 = abs(_341);
    bool _359 = _357 >= 0.375;
    float _361 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _363 = fma(_285, -1.99999904632568359375, 1.99999904632568359375);
    float _365 = fma(_285, -7.99999904632568359375, 7.99999904632568359375);
    float _367 = -_273;
    float _369 = _367 + 0.5;
    float _371 = -_281;
    float _373 = _371 + 0.5;
    float _375 = fma(_287, -1.99999904632568359375, 1.99999904632568359375);
    float _377 = trunc(_311);
    float _379 = precise::max(_377, 0.0);
    uint _381 = uint(_379);
    float _383 = fma(_287, -7.99999904632568359375, 7.99999904632568359375);
    float _385 = -_283;
    float _387 = _385 + 0.5;
    float _389 = -_285;
    float _391 = _389 + 0.5;
    float _393 = abs(_369);
    bool _395 = _393 >= 0.375;
    float _397 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _399 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _401 = abs(_373);
    bool _403 = _401 >= 0.375;
    float _405 = trunc(_313);
    float _407 = precise::max(_405, 0.0);
    uint _409 = uint(_407);
    float _411 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    float _413 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    float _415 = -_287;
    float _417 = _415 + 0.5;
    float _419 = abs(_387);
    bool _421 = _419 >= 0.375;
    float _423 = -_289;
    float _425 = _423 + 0.5;
    float _427 = abs(_391);
    bool _429 = _427 >= 0.375;
    float _431 = fma(_275, -1.99999904632568359375, 1.99999904632568359375);
    float _433 = trunc(_323);
    float _435 = precise::max(_433, 0.0);
    uint _437 = uint(_435);
    float _439 = fma(_275, -7.99999904632568359375, 7.99999904632568359375);
    float _441 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    float _443 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    int _445 = int(_331);
    int _447 = int(_381);
    int _449 = int(_437);
    if (!_317)
    {
        int _451 = int(_355) + 1;
        _445 = _451;
    }
    int _453 = _445;
    float _455 = -_291;
    float _457 = _455 + 0.5;
    float _459 = abs(_417);
    bool _461 = _459 >= 0.375;
    float _463 = fma(_295, -1.99999904632568359375, 1.99999904632568359375);
    float _465 = trunc(_325);
    float _467 = precise::max(_465, 0.0);
    uint _469 = uint(_467);
    if (!_337)
    {
        int _471 = int(_409) + 1;
        _447 = _471;
    }
    int _473 = _447;
    float _475 = fma(_295, -7.99999904632568359375, 7.99999904632568359375);
    float _477 = abs(_425);
    bool _479 = _477 >= 0.375;
    float _481 = fma(_297, -1.99999904632568359375, 1.99999904632568359375);
    float _483 = fma(_297, -7.99999904632568359375, 7.99999904632568359375);
    float _485 = -_275;
    float _487 = _485 + 0.5;
    float _489 = -_293;
    float _491 = _489 + 0.5;
    float _493 = trunc(_333);
    float _495 = precise::max(_493, 0.0);
    uint _497 = uint(_495);
    float _499 = fma(_299, -1.99999904632568359375, 1.99999904632568359375);
    float _501 = -_295;
    float _503 = _501 + 0.5;
    float _505 = -_297;
    float _507 = _505 + 0.5;
    float _509 = fma(_301, -1.99999904632568359375, 1.99999904632568359375);
    int _511 = _473 * 8;
    float _513 = trunc(_343);
    float _515 = precise::max(_513, 0.0);
    uint _517 = uint(_515);
    int _519 = int(_497);
    if (!_359)
    {
        int _521 = int(_469) + 1;
        _449 = _521;
    }
    int _523 = _449;
    float _525 = abs(_457);
    bool _527 = _525 >= 0.375;
    int _529 = _453 | _511;
    int _531 = _523 << 6;
    float _533 = trunc(_345);
    float _535 = precise::max(_533, 0.0);
    uint _537 = uint(_535);
    float _539 = trunc(_347);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = int(_537);
    if (!_395)
    {
        int _547 = int(_517) + 1;
        _519 = _547;
    }
    int _549 = _519;
    float _551 = fma(_299, -7.99999904632568359375, 7.99999904632568359375);
    float _553 = fma(_301, -7.99999904632568359375, 7.99999904632568359375);
    float _555 = abs(_487);
    bool _557 = _555 >= 0.375;
    float _559 = -_299;
    float _561 = _559 + 0.5;
    float _563 = -_301;
    float _565 = _563 + 0.5;
    int _567 = _549 * 512;
    float _569 = trunc(_349);
    float _571 = precise::max(_569, 0.0);
    uint _573 = uint(_571);
    int _575 = _529 | _531;
    int _577 = _567 | _575;
    float _579 = trunc(_361);
    float _581 = precise::max(_579, 0.0);
    uint _583 = uint(_581);
    int _585 = int(_573);
    if (!_403)
    {
        int _587 = int(_543) + 1;
        _545 = _587;
    }
    int _589 = _545;
    float _591 = abs(_491);
    bool _593 = _591 >= 0.375;
    int _595 = _589 * 4096;
    float _597 = trunc(_363);
    float _599 = precise::max(_597, 0.0);
    uint _601 = uint(_599);
    float _603 = trunc(_365);
    float _605 = precise::max(_603, 0.0);
    uint _607 = uint(_605);
    int _609 = int(_601);
    if (!_421)
    {
        int _611 = int(_583) + 1;
        _585 = _611;
    }
    int _613 = _585;
    float _615 = abs(_503);
    bool _617 = _615 >= 0.375;
    int _619 = _613 << 15;
    float _621 = trunc(_375);
    float _623 = precise::max(_621, 0.0);
    uint _625 = uint(_623);
    int _627 = _577 | _595;
    int _629 = _619 | _627;
    float _631 = trunc(_383);
    float _633 = precise::max(_631, 0.0);
    uint _635 = uint(_633);
    int _637 = int(_625);
    if (!_429)
    {
        int _639 = int(_607) + 1;
        _609 = _639;
    }
    int _641 = _609;
    float _643 = abs(_507);
    bool _645 = _643 >= 0.375;
    int _647 = _641 << 18;
    float _649 = trunc(_397);
    float _651 = precise::max(_649, 0.0);
    uint _653 = uint(_651);
    float _655 = trunc(_399);
    float _657 = precise::max(_655, 0.0);
    uint _659 = uint(_657);
    int _661 = int(_653);
    if (!_461)
    {
        int _663 = int(_635) + 1;
        _637 = _663;
    }
    int _665 = _637;
    float _667 = abs(_561);
    bool _669 = _667 >= 0.375;
    int _671 = _665 << 21;
    float _673 = trunc(_411);
    float _675 = precise::max(_673, 0.0);
    uint _677 = uint(_675);
    int _679 = _629 | _647;
    int _681 = _671 | _679;
    uint _683 = uint(int(uint(_681) >> uint(16)));
    int _685 = _681 & 65535;
    float _687 = trunc(_413);
    float _689 = precise::max(_687, 0.0);
    uint _691 = uint(_689);
    int _693 = int(_677);
    if (!_479)
    {
        int _695 = int(_659) + 1;
        _661 = _695;
    }
    int _697 = _661;
    float _699 = abs(_565);
    bool _701 = _699 >= 0.375;
    float _703 = trunc(_431);
    float _705 = precise::max(_703, 0.0);
    uint _707 = uint(_705);
    float _709 = trunc(_439);
    float _711 = precise::max(_709, 0.0);
    uint _713 = uint(_711);
    int _715 = int(_707);
    if (!_527)
    {
        int _717 = int(_691) + 1;
        _693 = _717;
    }
    int _719 = _693;
    int _721 = _719 << 3;
    float _723 = trunc(_441);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    int _729 = _697 | _721;
    float _731 = trunc(_443);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    int _737 = int(_727);
    if (!_557)
    {
        int _739 = int(_713) + 1;
        _715 = _739;
    }
    int _741 = _715;
    int _743 = _741 << 6;
    float _745 = trunc(_481);
    float _747 = precise::max(_745, 0.0);
    uint _749 = uint(_747);
    float _751 = trunc(_483);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    int _757 = int(_749);
    if (!_593)
    {
        int _759 = int(_735) + 1;
        _737 = _759;
    }
    int _761 = _737;
    int _763 = _761 << 9;
    float _765 = trunc(_463);
    float _767 = precise::max(_765, 0.0);
    uint _769 = uint(_767);
    int _771 = _729 | _743;
    int _773 = _763 | _771;
    float _775 = trunc(_475);
    float _777 = precise::max(_775, 0.0);
    uint _779 = uint(_777);
    int _781 = int(_769);
    if (!_645)
    {
        int _783 = int(_755) + 1;
        _757 = _783;
    }
    int _785 = _757;
    int _787 = _785 * 32768;
    float _789 = trunc(_499);
    float _791 = precise::max(_789, 0.0);
    uint _793 = uint(_791);
    float _795 = trunc(_551);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    int _801 = int(_793);
    if (!_617)
    {
        int _803 = int(_779) + 1;
        _781 = _803;
    }
    int _805 = _781;
    int _807 = _805 << 12;
    float _809 = trunc(_509);
    float _811 = precise::max(_809, 0.0);
    uint _813 = uint(_811);
    int _815 = _773 | _807;
    int _817 = _787 | _815;
    float _819 = trunc(_553);
    float _821 = precise::max(_819, 0.0);
    uint _823 = uint(_821);
    int _825 = int(_813);
    if (!_669)
    {
        int _827 = int(_799) + 1;
        _801 = _827;
    }
    int _829 = _801;
    int _831 = _829 * 262144;
    if (!_701)
    {
        int _833 = int(_823) + 1;
        _825 = _833;
    }
    int _835 = _825;
    int _837 = _835 << 21;
    int _839 = _817 | _831;
    int _841 = _837 | _839;
    int _843 = _841 << 8;
    uint _845 = uint(int(uint(_841) >> uint(8)));
    int _847 = 65280 & _843;
    int _849 = int(_683) | _847;
    out.m_32.x = as_type<float>(_187);
    out.m_32.y = as_type<float>(_685);
    out.m_32.z = as_type<float>(_849);
    out.m_32.w = as_type<float>(_845);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

