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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _3990 = false;
    bool _3670 = false;
    bool _3358 = false;
    bool _3046 = false;
    bool _2734 = false;
    bool _2422 = false;
    bool _2110 = false;
    bool _1800 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_36.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_36.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _4035 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4035, float2(0.0), isnan(_4035))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4035, float2(0.0), isnan(_4035))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _74 = _72 + 1.0;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _78 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _80 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _82 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _84 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = _82 * _76;
    float _88 = _82 * _84;
    float _90 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _94 = _88 * _92;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _98 = _88 * _96;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _102 = _88 * _100;
    bool _106 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _108 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[3].x, _94);
    float _110 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[4].x, _98);
    float _112 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[2].x, _102);
    bool _114 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _116 = -_90;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].z, _108);
    float _120 = -_90;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[4].z, _110);
    float _124 = -_90;
    float _126 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[2].z, _112);
    bool _128 = _90 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _130 = _118 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _132 = _122 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _136 = !_106;
    int _139 = _136 ? 0 : 1;
    float _141 = _130 * 78.233001708984375;
    float _143 = fma(_132, 12.98980045318603515625, _141);
    float _145 = fma(_134, 12.98980045318603515625, _141);
    float _147 = fma(_134, 45.16400146484375, _143);
    float _149 = fma(_132, 45.16400146484375, _145);
    float _151 = _147 + 94.67299652099609375;
    float _153 = _147 + 568.0379638671875;
    float _155 = _151 * 0.15915493667125701904296875;
    float _157 = _149 + 94.67299652099609375;
    float _159 = _153 * 0.15915493667125701904296875;
    float _161 = _149 + 568.0379638671875;
    float _163 = _157 * 0.15915493667125701904296875;
    float _165 = _147 + 189.3459930419921875;
    float _167 = _161 * 0.15915493667125701904296875;
    float _169 = _147 + 662.71099853515625;
    float _171 = _155 * 6.283185482025146484375;
    float _173 = sin(_171);
    float _175 = _165 * 0.15915493667125701904296875;
    float _177 = _149 + 189.3459930419921875;
    float _179 = _169 * 0.15915493667125701904296875;
    float _181 = _177 * 0.15915493667125701904296875;
    float _183 = _147 + 284.01898193359375;
    float _185 = _163 * 6.283185482025146484375;
    float _187 = sin(_185);
    float _189 = _183 * 0.15915493667125701904296875;
    float _191 = _149 + 284.01898193359375;
    float _193 = _191 * 0.15915493667125701904296875;
    float _195 = _147 + 378.691986083984375;
    float _197 = _181 * 6.283185482025146484375;
    float _199 = sin(_197);
    float _201 = _173 * 43758.546875;
    float _203 = _195 * 0.15915493667125701904296875;
    float _205 = _149 + 378.691986083984375;
    float _207 = _187 * 43758.546875;
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _147 + 473.364990234375;
    float _213 = _175 * 6.283185482025146484375;
    float _215 = sin(_213);
    float _217 = _211 * 0.15915493667125701904296875;
    float _219 = _149 + 473.364990234375;
    float _221 = _199 * 43758.546875;
    float _223 = _219 * 0.15915493667125701904296875;
    float _225 = _189 * 6.283185482025146484375;
    float _227 = sin(_225);
    int _229 = 2;
    if (!_106)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_114)
    {
        _233 = _139;
    }
    int _235 = _233;
    float _237 = _215 * 43758.546875;
    int _239 = _235 + 1;
    float _241 = _193 * 6.283185482025146484375;
    float _243 = sin(_241);
    int _245 = _239;
    if (!_128)
    {
        _245 = _235;
    }
    int _247 = _245;
    float _249 = _147 + 757.38397216796875;
    bool _251 = _247 != 1;
    float _253 = _249 * 0.15915493667125701904296875;
    float _255 = _149 + 662.71099853515625;
    float _257 = _179 * 6.283185482025146484375;
    float _259 = sin(_257);
    bool _261 = _247 != 0;
    float _263 = _149 + 757.38397216796875;
    bool _265 = !_251;
    int _267 = _265 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _269 = _227 * 43758.546875;
    bool _271 = !_251;
    int _273 = _271 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _275 = _263 * 0.15915493667125701904296875;
    float _277 = _261 ? as_type<float>(_267) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _279 = _253 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = _255 * 0.15915493667125701904296875;
    bool _285 = !_251;
    int _287 = _285 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _289 = _243 * 43758.546875;
    bool _291 = !_251;
    int _293 = _291 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _295 = _261 ? as_type<float>(_273) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _297 = _261 ? as_type<float>(_293) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _299 = _283 * 6.283185482025146484375;
    float _301 = sin(_299);
    bool _303 = !_251;
    int _305 = _303 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    float _307 = _130 * _295;
    float _309 = _130 * _297;
    bool _311 = !_251;
    int _313 = _311 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _315 = _203 * 6.283185482025146484375;
    float _317 = sin(_315);
    float _319 = _261 ? as_type<float>(_305) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    bool _321 = !_251;
    int _323 = _321 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _325 = !_251;
    int _327 = _325 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _329 = _130 * _319;
    bool _331 = !_251;
    int _333 = _331 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _335 = _209 * 6.283185482025146484375;
    float _337 = sin(_335);
    float _339 = _261 ? as_type<float>(_313) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _341 = _261 ? as_type<float>(_323) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _343 = _261 ? as_type<float>(_327) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _345 = _130 * _277;
    float _347 = _261 ? as_type<float>(_287) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _349 = fma(_134, _341, _329);
    float _351 = _261 ? as_type<float>(_333) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _353 = fma(_134, _339, _307);
    float _355 = _130 * _347;
    float _357 = fma(_134, _351, _345);
    float _359 = _217 * 6.283185482025146484375;
    float _361 = sin(_359);
    bool _363 = !_251;
    int _365 = _363 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _367 = _317 * 43758.546875;
    bool _369 = !_251;
    int _371 = _369 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _373 = _337 * 43758.546875;
    bool _375 = !_251;
    int _377 = _375 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _379 = _261 ? as_type<float>(_365) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _381 = _223 * 6.283185482025146484375;
    float _383 = sin(_381);
    float _385 = _261 ? as_type<float>(_371) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _387 = _261 ? as_type<float>(_377) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _389 = fma(_132, _379, _353);
    bool _391 = !_251;
    int _393 = _391 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _395 = fma(_134, _385, _355);
    float _397 = fma(_134, _387, _309);
    float _399 = _159 * 6.283185482025146484375;
    float _401 = sin(_399);
    float _403 = _361 * 43758.546875;
    float _405 = _261 ? as_type<float>(_393) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _407 = _130 * _343;
    bool _409 = !_251;
    int _411 = _409 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _413 = _383 * 43758.546875;
    bool _415 = !_251;
    int _417 = _415 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _419 = _130 * _405;
    bool _421 = !_251;
    int _423 = _421 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _425 = _167 * 6.283185482025146484375;
    float _427 = sin(_425);
    float _429 = _261 ? as_type<float>(_411) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _431 = _401 * 43758.546875;
    float _433 = _261 ? as_type<float>(_417) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _435 = _275 * 6.283185482025146484375;
    float _437 = sin(_435);
    float _439 = _261 ? as_type<float>(_423) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _441 = fma(_132, _429, _357);
    bool _443 = !_251;
    int _445 = _443 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _447 = fma(_134, _433, _419);
    bool _449 = !_251;
    int _451 = _449 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _453 = fma(_132, _439, _397);
    float _455 = floor(_207);
    float _457 = _261 ? as_type<float>(_445) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _459 = fma(_132, _457, _349);
    float _461 = _261 ? as_type<float>(_451) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _463 = floor(_221);
    bool _465 = !_251;
    int _467 = _465 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    bool _469 = !_251;
    int _471 = _469 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _473 = fma(_134, _461, _407);
    bool _475 = !_251;
    int _477 = _475 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _479 = _261 ? as_type<float>(_467) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _481 = floor(_201);
    bool _483 = !_251;
    int _485 = _483 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _487 = -_455;
    float _489 = _207 + _487;
    float _491 = _261 ? as_type<float>(_471) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _493 = fma(_132, _479, _473);
    float _495 = _261 ? as_type<float>(_477) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _497 = _259 * 43758.546875;
    float _499 = _261 ? as_type<float>(_485) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _501 = fma(_132, _491, _395);
    bool _503 = !_251;
    int _505 = _503 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _507 = fma(_132, _495, _447);
    bool _509 = !_251;
    int _511 = _509 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _513 = _499 + _493;
    float _515 = _261 ? as_type<float>(_505) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _517 = _301 * 43758.546875;
    float _519 = _261 ? as_type<float>(_511) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _521 = _427 * 43758.546875;
    float _523 = _515 + _389;
    float _525 = _519 + _459;
    float _527 = _281 * 43758.546875;
    bool _529 = !_251;
    int _531 = _529 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _533 = floor(_237);
    float _535 = -_463;
    float _537 = _221 + _535;
    bool _539 = !_251;
    int _541 = _539 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _543 = -_481;
    float _545 = _201 + _543;
    bool _547 = !_251;
    int _549 = _547 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _551 = fma(_489, 2.0, -1.0);
    float _553 = _261 ? as_type<float>(_531) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _555 = floor(_269);
    bool _557 = !_251;
    int _559 = _557 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _561 = fma(_545, 2.0, -1.0);
    float _563 = _261 ? as_type<float>(_541) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _565 = _261 ? as_type<float>(_549) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _567 = _437 * 43758.546875;
    float _569 = _553 + _501;
    float _571 = _261 ? as_type<float>(_559) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _573 = _563 + _507;
    float _575 = floor(_289);
    float _577 = _565 + _453;
    float _579 = -_533;
    float _581 = _237 + _579;
    float _583 = _571 + _441;
    float _585 = float(_247);
    float _587 = -_555;
    float _589 = _269 + _587;
    float _591 = fma(_537, 2.0, -1.0);
    float _593 = floor(_367);
    float _595 = fma(_581, 2.0, -1.0);
    float _597 = _80 * _591;
    float _599 = floor(_373);
    float _601 = -_575;
    float _603 = _289 + _601;
    bool _605 = !_251;
    int _607 = _605 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _609 = fma(_603, 2.0, -1.0);
    float _611 = _261 ? as_type<float>(_607) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _613 = floor(_403);
    float _615 = -_593;
    float _617 = _367 + _615;
    float _619 = _80 * _551;
    float _621 = _80 * _609;
    float _623 = fma(_617, 2.0, -1.0);
    float _625 = _619 * _619;
    float _627 = floor(_413);
    float _629 = -_599;
    float _631 = _373 + _629;
    float _633 = _80 * _623;
    float _635 = _621 * _621;
    float _637 = fma(_631, 2.0, -1.0);
    float _639 = floor(_431);
    float _641 = -_613;
    float _643 = _403 + _641;
    float _645 = fma(_589, 2.0, -1.0);
    float _647 = _80 * _637;
    float _649 = fma(_643, 2.0, -1.0);
    float _651 = _80 * _645;
    float _653 = floor(_521);
    float _655 = -_627;
    float _657 = _413 + _655;
    float _659 = fma(_651, _651, _635);
    float _661 = _659 + 1.0;
    float _663 = floor(_497);
    float _665 = -_639;
    float _667 = _431 + _665;
    float _669 = fma(_657, 2.0, -1.0);
    float _671 = _80 * _595;
    float _673 = fma(_667, 2.0, -1.0);
    float _675 = floor(_517);
    float _677 = -_653;
    float _679 = _521 + _677;
    float _681 = _80 * _673;
    bool _683 = !_251;
    int _685 = _683 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _687 = _261 ? as_type<float>(_685) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _689 = floor(_527);
    float _691 = -_663;
    float _693 = _497 + _691;
    float _695 = fma(_679, 2.0, -1.0);
    float _697 = _80 * _561;
    float _699 = fma(_693, 2.0, -1.0);
    float _701 = _80 * _695;
    float _703 = fma(_697, _697, _625);
    float _705 = floor(_567);
    float _707 = -_675;
    float _709 = _517 + _707;
    float _711 = _80 * _699;
    float _713 = _703 + 1.0;
    bool _715 = !_251;
    int _717 = _715 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _719 = fma(_709, 2.0, -1.0);
    bool _721 = !_251;
    int _723 = _721 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _725 = -_689;
    float _727 = _527 + _725;
    float _729 = rsqrt(_713);
    float _731 = _261 ? as_type<float>(_723) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _733 = fma(_727, 2.0, -1.0);
    float _735 = _80 * _649;
    float _737 = _261 ? as_type<float>(_717) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _739 = -_705;
    float _741 = _567 + _739;
    float _743 = _80 * _669;
    float _745 = _80 * _733;
    float _747 = rsqrt(_661);
    float _749 = fma(_741, 2.0, -1.0);
    float _751 = _80 * _719;
    float _753 = _80 * _749;
    float _755 = _597 * _597;
    bool _757 = !_251;
    int _759 = _757 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _761 = fma(_619, _729, _577);
    float _763 = fma(_697, _729, _569);
    float _765 = fma(_671, _671, _755);
    bool _767 = !_251;
    int _769 = _767 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _771 = _731 * _761;
    bool _773 = !_251;
    int _775 = _773 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _777 = _765 + 1.0;
    bool _779 = !_251;
    int _781 = _779 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _783 = _647 * _647;
    float _785 = _261 ? as_type<float>(_775) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _787 = fma(_737, _763, _771);
    float _789 = _261 ? as_type<float>(_781) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _791 = rsqrt(_777);
    float _793 = fma(_633, _633, _783);
    float _795 = _261 ? as_type<float>(_769) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _797 = _785 * _761;
    float _799 = _261 ? as_type<float>(_759) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _801 = _793 + 1.0;
    float _803 = _789 * _761;
    float _805 = -_729;
    float _807 = _573 + _805;
    float _809 = rsqrt(_801);
    float _811 = fma(_795, _763, _803);
    float _813 = fma(_799, _763, _797);
    bool _815 = !_251;
    int _817 = _815 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _819 = fma(_597, _791, _577);
    float _821 = _687 * _761;
    float _823 = fma(_671, _791, _569);
    float _825 = _261 ? as_type<float>(_817) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _827 = _789 * _819;
    float _829 = fma(_611, _763, _821);
    float _831 = fma(_621, _747, _577);
    float _833 = _687 * _819;
    float _835 = _731 * _819;
    float _837 = _785 * _819;
    float _839 = fma(_795, _823, _827);
    float _841 = fma(_611, _823, _833);
    float _843 = fma(_737, _823, _835);
    float _845 = fma(_799, _823, _837);
    float _847 = fma(_651, _747, _569);
    float _849 = fma(_647, _809, _577);
    float _851 = _731 * _831;
    float _853 = _687 * _831;
    float _855 = _789 * _831;
    float _857 = _785 * _831;
    float _859 = fma(_737, _847, _851);
    float _861 = fma(_611, _847, _853);
    float _863 = fma(_795, _847, _855);
    float _865 = fma(_799, _847, _857);
    float _867 = fma(_633, _809, _569);
    float _869 = _731 * _849;
    float _871 = _687 * _849;
    float _873 = _789 * _849;
    float _875 = _785 * _849;
    float _877 = fma(_737, _867, _869);
    float _879 = fma(_611, _867, _871);
    float _881 = fma(_795, _867, _873);
    float _883 = fma(_799, _867, _875);
    float _885 = -_791;
    float _887 = _573 + _885;
    float _889 = 1.0 / _583;
    bool _891 = !_251;
    int _893 = _891 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _895 = !_251;
    int _897 = _895 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _899 = _261 ? as_type<float>(_893) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _901 = rint(_585);
    float _903 = precise::max(_901, 0.0);
    uint _906 = uint(_903);
    uint _908 = clamp(_906, 0u, 65535u);
    float _910 = _261 ? as_type<float>(_897) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _912 = !_251;
    int _914 = _912 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _916 = fma(_899, _807, _787);
    float _918 = fma(_910, _807, _811);
    float _920 = _261 ? as_type<float>(_914) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _922 = fma(_825, _807, _813);
    float _924 = -_747;
    float _926 = _573 + _924;
    float _928 = fma(_899, _887, _843);
    float _930 = fma(_910, _887, _839);
    float _932 = fma(_825, _887, _845);
    float _934 = fma(_920, _926, _861);
    float _936 = fma(_899, _926, _859);
    float _938 = fma(_910, _926, _863);
    float _940 = fma(_825, _926, _865);
    bool _942 = !_251;
    int _944 = _942 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _946 = _743 * _743;
    float _948 = fma(_920, _887, _841);
    float _950 = fma(_920, _807, _829);
    float _952 = _261 ? as_type<float>(_944) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _954 = fma(_735, _735, _946);
    float _956 = -_809;
    float _958 = _573 + _956;
    float _960 = _513 * _889;
    float _962 = _523 * _889;
    float _964 = _954 + 1.0;
    float _966 = _952 + _922;
    float _968 = fma(_920, _958, _879);
    float _970 = fma(_825, _958, _883);
    float _972 = rsqrt(_964);
    bool _974 = !_251;
    int _976 = _974 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _978 = fma(_899, _958, _877);
    float _980 = fma(_910, _958, _881);
    bool _982 = !_251;
    int _984 = _982 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _986 = !_251;
    int _988 = _986 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _990 = 1.0 / _966;
    float _992 = _261 ? as_type<float>(_976) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _994 = _261 ? as_type<float>(_984) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _996 = _261 ? as_type<float>(_988) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _998 = _992 + _950;
    float _1000 = _992 + _948;
    float _1002 = _994 + _916;
    float _1004 = fma(_743, _972, _577);
    float _1006 = _996 + _918;
    float _1008 = _996 + _930;
    float _1010 = _994 + _928;
    float _1012 = _687 * _1004;
    float _1014 = _789 * _1004;
    float _1016 = _785 * _1004;
    float _1018 = _998 * _990;
    float _1020 = _1002 * _990;
    float _1022 = _1006 * _990;
    float _1024 = fma(_735, _972, _569);
    float _1026 = _731 * _1004;
    float _1028 = fma(_611, _1024, _1012);
    float _1030 = _701 * _701;
    float _1032 = fma(_737, _1024, _1026);
    float _1034 = fma(_795, _1024, _1014);
    float _1036 = fma(_799, _1024, _1016);
    float _1038 = fma(_681, _681, _1030);
    float _1040 = _952 + _932;
    float _1042 = _1038 + 1.0;
    float _1044 = -_972;
    float _1046 = _573 + _1044;
    float _1048 = 1.0 / _1040;
    float _1050 = fma(_920, _1046, _1028);
    float _1052 = fma(_899, _1046, _1032);
    float _1054 = fma(_910, _1046, _1034);
    float _1056 = fma(_825, _1046, _1036);
    float _1058 = rsqrt(_1042);
    float _1060 = _1000 * _1048;
    float _1062 = _1008 * _1048;
    float _1064 = _525 * _889;
    float _1066 = _1010 * _1048;
    float _1068 = fma(_701, _1058, _577);
    float _1070 = fma(_681, _1058, _569);
    float _1072 = -_1058;
    float _1074 = _573 + _1072;
    float _1076 = _687 * _1068;
    float _1078 = _731 * _1068;
    float _1080 = _789 * _1068;
    float _1082 = _785 * _1068;
    float _1084 = fma(_611, _1070, _1076);
    float _1086 = _751 * _751;
    float _1088 = fma(_737, _1070, _1078);
    float _1090 = fma(_795, _1070, _1080);
    float _1092 = fma(_799, _1070, _1082);
    float _1094 = fma(_711, _711, _1086);
    float _1096 = _753 * _753;
    float _1098 = fma(_899, _1074, _1088);
    float _1100 = fma(_920, _1074, _1084);
    float _1102 = fma(_910, _1074, _1090);
    float _1104 = fma(_745, _745, _1096);
    float _1106 = fma(_825, _1074, _1092);
    float _1108 = _1094 + 1.0;
    float _1110 = _1104 + 1.0;
    float _1112 = rsqrt(_1108);
    float _1114 = rsqrt(_1110);
    float _1116 = fma(_751, _1112, _577);
    float _1118 = fma(_711, _1112, _569);
    float _1120 = -_1112;
    float _1122 = _573 + _1120;
    float _1124 = fma(_753, _1114, _577);
    float _1126 = fma(_745, _1114, _569);
    float _1128 = -_1114;
    float _1130 = _573 + _1128;
    float _1132 = _687 * _1116;
    float _1134 = _687 * _1124;
    float _1136 = _731 * _1116;
    float _1138 = _789 * _1116;
    float _1140 = _785 * _1116;
    float _1142 = _731 * _1124;
    float _1144 = _789 * _1124;
    float _1146 = _785 * _1124;
    float3 _5966 = float3(_962, _1064, float(int(_908)));
    float3 _5970 = select(_5966, float3(0.0), isnan(_5966));
    float _1148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5970.xy, uint(rint(_5970.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5970.xy, uint(rint(_5970.z))).x;
    float _1150 = fma(_611, _1118, _1132);
    float _1152 = fma(_611, _1126, _1134);
    float _1154 = fma(_737, _1118, _1136);
    float _1156 = fma(_795, _1118, _1138);
    float _1158 = fma(_799, _1118, _1140);
    float _1160 = fma(_799, _1126, _1146);
    float _1162 = fma(_737, _1126, _1142);
    float _1164 = _952 + _940;
    float _1166 = fma(_920, _1130, _1152);
    float _1168 = fma(_920, _1122, _1150);
    float _1170 = fma(_899, _1122, _1154);
    float _1172 = fma(_910, _1122, _1156);
    float _1174 = fma(_825, _1122, _1158);
    float _1176 = fma(_825, _1130, _1160);
    float _1178 = _952 + _1056;
    float _1180 = _952 + _1106;
    float _1182 = 1.0 / _1164;
    float _1184 = _952 + _970;
    float _1186 = _952 + _1174;
    float _1188 = _952 + _1176;
    float _1190 = fma(_795, _1126, _1144);
    float _1192 = fma(_899, _1130, _1162);
    float _1194 = _992 + _934;
    float _1196 = _992 + _968;
    float _1198 = 1.0 / _1184;
    float _1200 = fma(_910, _1130, _1190);
    float _1202 = _992 + _1050;
    float _1204 = _992 + _1100;
    float _1206 = _992 + _1168;
    float _1208 = _994 + _936;
    float _1210 = _992 + _1166;
    float _1212 = _996 + _938;
    float _1214 = 1.0 / _1178;
    float _1216 = _996 + _1102;
    float _1218 = _996 + _1172;
    float _1220 = _996 + _980;
    float _1222 = _1208 * _1182;
    float _1224 = _994 + _1052;
    float _1226 = _994 + _1098;
    float _1228 = _994 + _1192;
    float _1230 = 1.0 / _1180;
    float _1232 = _996 + _1054;
    float _1234 = _1194 * _1182;
    float _1236 = _1212 * _1182;
    float _1238 = _994 + _978;
    float _1240 = _994 + _1170;
    float _1242 = _996 + _1200;
    float _1244 = 1.0 / _1188;
    float _1246 = _1220 * _1198;
    float _1248 = _1202 * _1214;
    float _1250 = _1224 * _1214;
    float _1252 = _1232 * _1214;
    float _1254 = _1196 * _1198;
    float _1256 = _1238 * _1198;
    float _1258 = 1.0 / _1186;
    float _1260 = _1204 * _1230;
    float _1262 = _1226 * _1230;
    float _1264 = _1216 * _1230;
    float _1266 = fma(_1018, 0.5, 0.5);
    float _1268 = fma(_1020, -0.5, 0.5);
    float _1270 = fma(_1022, 0.5, 0.5);
    float _1272 = fma(_1060, 0.5, 0.5);
    float _1274 = _1210 * _1244;
    float _1276 = _1228 * _1244;
    float _1278 = _1242 * _1244;
    float _1280 = fma(_1234, 0.5, 0.5);
    float _1282 = fma(_1222, -0.5, 0.5);
    float _1284 = fma(_1262, -0.5, 0.5);
    float _1286 = fma(_1276, -0.5, 0.5);
    float _1288 = fma(_1236, 0.5, 0.5);
    float _1290 = _1206 * _1258;
    float _1292 = _1240 * _1258;
    float _1294 = _1218 * _1258;
    float _1296 = fma(_1066, -0.5, 0.5);
    float _1298 = fma(_1062, 0.5, 0.5);
    float _1300 = fma(_1254, 0.5, 0.5);
    float _1302 = fma(_1256, -0.5, 0.5);
    float _1304 = fma(_1246, 0.5, 0.5);
    float _1306 = fma(_1248, 0.5, 0.5);
    float _1308 = fma(_1250, -0.5, 0.5);
    float _1310 = fma(_1252, 0.5, 0.5);
    float _1312 = fma(_1260, 0.5, 0.5);
    float _1314 = fma(_1264, 0.5, 0.5);
    float _1316 = fma(_1290, 0.5, 0.5);
    float _1318 = fma(_1292, -0.5, 0.5);
    float _1320 = fma(_1294, 0.5, 0.5);
    float _1322 = fma(_1274, 0.5, 0.5);
    float _1324 = fma(_1278, 0.5, 0.5);
    float _1326 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1328 = -_1266;
    float _1330 = _962 + _1328;
    float _1332 = -_1268;
    float _1334 = _1064 + _1332;
    float _1336 = -_1270;
    float _1338 = _960 + _1336;
    float _1340 = -_1272;
    float _1342 = _962 + _1340;
    float _1344 = -_1296;
    float _1346 = _1064 + _1344;
    float _1348 = -_1298;
    float _1350 = _960 + _1348;
    float _1352 = _1330 * _1326;
    float _1354 = _1334 * _1326;
    float _1356 = _1338 * _1326;
    float _1358 = _1342 * _1326;
    float _1360 = _1346 * _1326;
    float _1362 = _1350 * _1326;
    float _1364 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1366 = -_1280;
    float _1368 = _962 + _1366;
    float _1370 = -_1282;
    float _1372 = _1064 + _1370;
    float _1374 = -_1288;
    float _1376 = _960 + _1374;
    float _1378 = -_1302;
    float _1380 = _1064 + _1378;
    float _1382 = _1368 * _1364;
    float _1384 = _1372 * _1364;
    float _1386 = _1376 * _1364;
    float _1388 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1390 = -_1306;
    float _1392 = _962 + _1390;
    float _1394 = -_1308;
    float _1396 = _1064 + _1394;
    float _1398 = -_1310;
    float _1400 = _960 + _1398;
    float _1402 = _1392 * _1388;
    float _1404 = _1396 * _1388;
    float _1406 = _1400 * _1388;
    float _1408 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1410 = -_1314;
    float _1412 = _960 + _1410;
    float _1414 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1416 = -_1316;
    float _1418 = _962 + _1416;
    float _1420 = -_1318;
    float _1422 = _1064 + _1420;
    float _1424 = -_1320;
    float _1426 = _960 + _1424;
    float _1428 = _1412 * _1408;
    float _1430 = -_1322;
    float _1432 = _962 + _1430;
    float _1434 = _1418 * _1414;
    float _1436 = _1422 * _1414;
    float _1438 = _1426 * _1414;
    float _1440 = _1356 * 1.5;
    float _1442 = -_1300;
    float _1444 = _962 + _1442;
    float _1446 = -_1304;
    float _1448 = _960 + _1446;
    float _1450 = -_1312;
    float _1452 = _962 + _1450;
    float _1454 = -_1284;
    float _1456 = _1064 + _1454;
    float _1458 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1460 = -_1324;
    float _1462 = _960 + _1460;
    float _1464 = _1452 * _1408;
    float _1466 = _1456 * _1408;
    float _1468 = _1444 * _1458;
    float _1470 = _1380 * _1458;
    float _1472 = _1448 * _1458;
    float _1474 = -_1286;
    float _1476 = _1064 + _1474;
    float _1478 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.100000001490116119384765625;
    float _1480 = _1432 * _1478;
    float _1482 = _1476 * _1478;
    float _1484 = _1462 * _1478;
    float _1486 = -_960;
    float _1488 = _1486 + _1148;
    float _1490 = _1488 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1492 = precise::max(_1490, _1440);
    float _1494 = precise::min(0.0, _1492);
    bool _1496 = _1494 != _1490;
    bool _1498 = isnan(_1494);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(_1490);
    bool _1504 = _1500 || _1502;
    bool _1506 = !_1504;
    float _1798;
    if (!_1506)
    {
        float _1508 = _1064 + _1354;
        float _1510 = _962 + _1352;
        float3 _6486 = float3(_1510, _1508, float(int(_908)));
        float3 _6488 = select(_6486, float3(0.0), isnan(_6486));
        float _1512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6488.xy, uint(rint(_6488.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6488.xy, uint(rint(_6488.z))).x;
        float _1514 = _960 + _1356;
        float _1516 = _1356 * 3.0;
        float _1518 = -_1514;
        float _1520 = _1518 + _1512;
        float _1522 = _1520 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1524 = precise::max(_1522, _1516);
        float _1526 = precise::min(0.0, _1524);
        bool _1528 = _1526 != _1522;
        bool _1530 = isnan(_1526);
        bool _1532 = _1528 || _1530;
        bool _1534 = isnan(_1522);
        bool _1536 = _1532 || _1534;
        bool _1538 = !_1536;
        if (!_1538)
        {
            float _1540 = fma(_1354, 2.0, _1064);
            float _1542 = fma(_1352, 2.0, _962);
            float3 _6541 = float3(_1542, _1540, float(int(_908)));
            float3 _6543 = select(_6541, float3(0.0), isnan(_6541));
            float _1544 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6543.xy, uint(rint(_6543.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6543.xy, uint(rint(_6543.z))).x;
            float _1546 = fma(_1356, 2.0, _960);
            float _1548 = _1356 * 4.5;
            float _1550 = -_1546;
            float _1552 = _1550 + _1544;
            float _1554 = _1552 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1556 = precise::max(_1554, _1548);
            float _1558 = precise::min(0.0, _1556);
            bool _1560 = _1558 != _1554;
            bool _1562 = isnan(_1558);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan(_1554);
            bool _1568 = _1564 || _1566;
            bool _1570 = !_1568;
            if (!_1570)
            {
                float _1572 = fma(_1354, 3.0, _1064);
                float _1574 = fma(_1352, 3.0, _962);
                float3 _6596 = float3(_1574, _1572, float(int(_908)));
                float3 _6598 = select(_6596, float3(0.0), isnan(_6596));
                float _1576 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6598.xy, uint(rint(_6598.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6598.xy, uint(rint(_6598.z))).x;
                float _1578 = fma(_1356, 3.0, _960);
                float _1580 = _1356 * 6.0;
                float _1582 = -_1578;
                float _1584 = _1582 + _1576;
                float _1586 = _1584 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1588 = precise::max(_1586, _1580);
                float _1590 = precise::min(0.0, _1588);
                bool _1592 = _1590 != _1586;
                bool _1594 = isnan(_1590);
                bool _1596 = _1592 || _1594;
                bool _1598 = isnan(_1586);
                bool _1600 = _1596 || _1598;
                bool _1602 = !_1600;
                if (!_1602)
                {
                    float _1604 = fma(_1354, 4.0, _1064);
                    float _1606 = fma(_1352, 4.0, _962);
                    float3 _6652 = float3(_1606, _1604, float(int(_908)));
                    float3 _6654 = select(_6652, float3(0.0), isnan(_6652));
                    float _1608 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6654.xy, uint(rint(_6654.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6654.xy, uint(rint(_6654.z))).x;
                    float _1610 = fma(_1356, 4.0, _960);
                    float _1612 = _1356 * 7.5;
                    float _1614 = -_1610;
                    float _1616 = _1614 + _1608;
                    float _1618 = _1616 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1620 = precise::max(_1618, _1612);
                    float _1622 = precise::min(0.0, _1620);
                    bool _1624 = _1622 != _1618;
                    bool _1626 = isnan(_1622);
                    bool _1628 = _1624 || _1626;
                    bool _1630 = isnan(_1618);
                    bool _1632 = _1628 || _1630;
                    bool _1634 = !_1632;
                    if (!_1634)
                    {
                        float _1636 = fma(_1354, 5.0, _1064);
                        float _1638 = fma(_1352, 5.0, _962);
                        float3 _6708 = float3(_1638, _1636, float(int(_908)));
                        float3 _6710 = select(_6708, float3(0.0), isnan(_6708));
                        float _1640 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6710.xy, uint(rint(_6710.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6710.xy, uint(rint(_6710.z))).x;
                        float _1642 = fma(_1356, 5.0, _960);
                        float _1644 = _1356 * 9.0;
                        float _1646 = -_1642;
                        float _1648 = _1646 + _1640;
                        float _1650 = _1648 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1652 = precise::max(_1650, _1644);
                        float _1654 = precise::min(0.0, _1652);
                        bool _1656 = _1654 != _1650;
                        bool _1658 = isnan(_1654);
                        bool _1660 = _1656 || _1658;
                        bool _1662 = isnan(_1650);
                        bool _1664 = _1660 || _1662;
                        bool _1666 = !_1664;
                        if (!_1666)
                        {
                            float _1668 = fma(_1354, 6.0, _1064);
                            float _1670 = fma(_1352, 6.0, _962);
                            float3 _6763 = float3(_1670, _1668, float(int(_908)));
                            float3 _6765 = select(_6763, float3(0.0), isnan(_6763));
                            float _1672 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6765.xy, uint(rint(_6765.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6765.xy, uint(rint(_6765.z))).x;
                            float _1674 = fma(_1356, 6.0, _960);
                            float _1676 = _1356 * 10.5;
                            float _1678 = -_1674;
                            float _1680 = _1678 + _1672;
                            float _1682 = _1680 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1684 = precise::max(_1682, _1676);
                            float _1686 = precise::min(0.0, _1684);
                            bool _1688 = _1686 != _1682;
                            bool _1690 = isnan(_1686);
                            bool _1692 = _1688 || _1690;
                            bool _1694 = isnan(_1682);
                            bool _1696 = _1692 || _1694;
                            bool _1698 = !_1696;
                            if (!_1698)
                            {
                                float _1700 = fma(_1354, 7.0, _1064);
                                float _1702 = fma(_1352, 7.0, _962);
                                float3 _6819 = float3(_1702, _1700, float(int(_908)));
                                float3 _6821 = select(_6819, float3(0.0), isnan(_6819));
                                float _1704 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6821.xy, uint(rint(_6821.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6821.xy, uint(rint(_6821.z))).x;
                                float _1706 = fma(_1356, 7.0, _960);
                                float _1708 = _1356 * 12.0;
                                float _1710 = -_1706;
                                float _1712 = _1710 + _1704;
                                float _1714 = _1712 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1716 = precise::max(_1714, _1708);
                                float _1718 = precise::min(0.0, _1716);
                                bool _1720 = _1718 != _1714;
                                bool _1722 = isnan(_1718);
                                bool _1724 = _1720 || _1722;
                                bool _1726 = isnan(_1714);
                                bool _1728 = _1724 || _1726;
                                bool _1730 = !_1728;
                                if (!_1730)
                                {
                                    float _1732 = fma(_1354, 8.0, _1064);
                                    float _1734 = fma(_1352, 8.0, _962);
                                    float3 _6875 = float3(_1734, _1732, float(int(_908)));
                                    float3 _6877 = select(_6875, float3(0.0), isnan(_6875));
                                    float _1736 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6877.xy, uint(rint(_6877.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6877.xy, uint(rint(_6877.z))).x;
                                    float _1738 = fma(_1356, 8.0, _960);
                                    float _1740 = fma(_1356, 13.5, -1.0);
                                    float _1742 = -_1738;
                                    float _1744 = _1742 + _1736;
                                    float _1746 = _1744 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1748 = precise::max(_1746, _1740);
                                    float _1750 = precise::min(0.0, _1748);
                                    bool _1752 = _1750 != _1746;
                                    bool _1754 = isnan(_1750);
                                    bool _1756 = _1752 || _1754;
                                    bool _1758 = isnan(_1746);
                                    bool _1760 = _1756 || _1758;
                                    bool _1762 = !_1760;
                                    if (!_1762)
                                    {
                                        float _1764 = fma(_1354, 9.0, _1064);
                                        float _1766 = fma(_1352, 9.0, _962);
                                        float3 _6930 = float3(_1766, _1764, float(int(_908)));
                                        float3 _6932 = select(_6930, float3(0.0), isnan(_6930));
                                        float _1768 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6932.xy, uint(rint(_6932.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6932.xy, uint(rint(_6932.z))).x;
                                        float _1770 = fma(_1356, 9.0, _960);
                                        float _1772 = fma(_1356, 15.0, -1.0);
                                        float _1774 = -_1770;
                                        float _1776 = _1774 + _1768;
                                        float _1778 = _1776 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1780 = precise::max(_1778, _1772);
                                        float _1782 = precise::min(0.0, _1780);
                                        bool _1784 = _1782 != _1778;
                                        bool _1786 = isnan(_1782);
                                        bool _1788 = _1784 || _1786;
                                        bool _1790 = isnan(_1778);
                                        bool _1792 = _1788 || _1790;
                                        float _1794 = _1778;
                                        if (_1792)
                                        {
                                            _1794 = 0.0;
                                        }
                                        float _1796 = _1794;
                                        _1798 = _1796;
                                        _1800 = _1792;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1800)
    {
        _1798 = 1.0;
    }
    _1800 = false;
    float _1802 = _1798;
    float _1804 = _1362 * 1.5;
    float _1806 = precise::max(_1490, _1804);
    float _1808 = precise::min(0.0, _1806);
    bool _1810 = _1808 != _1490;
    bool _1812 = isnan(_1808);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(_1490);
    bool _1818 = _1814 || _1816;
    bool _1820 = !_1818;
    float _1822 = _1802;
    if (!_1820)
    {
        float _1824 = _1064 + _1360;
        float _1826 = _962 + _1358;
        float3 _7027 = float3(_1826, _1824, float(int(_908)));
        float3 _7029 = select(_7027, float3(0.0), isnan(_7027));
        float _1828 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7029.xy, uint(rint(_7029.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7029.xy, uint(rint(_7029.z))).x;
        float _1830 = _960 + _1362;
        float _1832 = _1362 * 3.0;
        float _1834 = -_1830;
        float _1836 = _1834 + _1828;
        float _1838 = _1836 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1840 = precise::max(_1838, _1832);
        float _1842 = precise::min(0.0, _1840);
        bool _1844 = _1842 != _1838;
        bool _1846 = isnan(_1842);
        bool _1848 = _1844 || _1846;
        bool _1850 = isnan(_1838);
        bool _1852 = _1848 || _1850;
        bool _1854 = !_1852;
        if (!_1854)
        {
            float _1856 = fma(_1360, 2.0, _1064);
            float _1858 = fma(_1358, 2.0, _962);
            float3 _7081 = float3(_1858, _1856, float(int(_908)));
            float3 _7083 = select(_7081, float3(0.0), isnan(_7081));
            float _1860 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7083.xy, uint(rint(_7083.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7083.xy, uint(rint(_7083.z))).x;
            float _1862 = fma(_1362, 2.0, _960);
            float _1864 = _1362 * 4.5;
            float _1866 = -_1862;
            float _1868 = _1866 + _1860;
            float _1870 = _1868 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1872 = precise::max(_1870, _1864);
            float _1874 = precise::min(0.0, _1872);
            bool _1876 = _1874 != _1870;
            bool _1878 = isnan(_1874);
            bool _1880 = _1876 || _1878;
            bool _1882 = isnan(_1870);
            bool _1884 = _1880 || _1882;
            bool _1886 = !_1884;
            if (!_1886)
            {
                float _1888 = fma(_1360, 3.0, _1064);
                float _1890 = fma(_1358, 3.0, _962);
                float3 _7135 = float3(_1890, _1888, float(int(_908)));
                float3 _7137 = select(_7135, float3(0.0), isnan(_7135));
                float _1892 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7137.xy, uint(rint(_7137.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7137.xy, uint(rint(_7137.z))).x;
                float _1894 = fma(_1362, 3.0, _960);
                float _1896 = _1362 * 6.0;
                float _1898 = -_1894;
                float _1900 = _1898 + _1892;
                float _1902 = _1900 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1904 = precise::max(_1902, _1896);
                float _1906 = precise::min(0.0, _1904);
                bool _1908 = _1906 != _1902;
                bool _1910 = isnan(_1906);
                bool _1912 = _1908 || _1910;
                bool _1914 = isnan(_1902);
                bool _1916 = _1912 || _1914;
                bool _1918 = !_1916;
                if (!_1918)
                {
                    float _1920 = fma(_1360, 4.0, _1064);
                    float _1922 = fma(_1358, 4.0, _962);
                    float3 _7189 = float3(_1922, _1920, float(int(_908)));
                    float3 _7191 = select(_7189, float3(0.0), isnan(_7189));
                    float _1924 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7191.xy, uint(rint(_7191.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7191.xy, uint(rint(_7191.z))).x;
                    float _1926 = fma(_1362, 4.0, _960);
                    float _1928 = _1362 * 7.5;
                    float _1930 = -_1926;
                    float _1932 = _1930 + _1924;
                    float _1934 = _1932 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1936 = precise::max(_1934, _1928);
                    float _1938 = precise::min(0.0, _1936);
                    bool _1940 = _1938 != _1934;
                    bool _1942 = isnan(_1938);
                    bool _1944 = _1940 || _1942;
                    bool _1946 = isnan(_1934);
                    bool _1948 = _1944 || _1946;
                    bool _1950 = !_1948;
                    if (!_1950)
                    {
                        float _1952 = fma(_1360, 5.0, _1064);
                        float _1954 = fma(_1358, 5.0, _962);
                        float3 _7243 = float3(_1954, _1952, float(int(_908)));
                        float3 _7245 = select(_7243, float3(0.0), isnan(_7243));
                        float _1956 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7245.xy, uint(rint(_7245.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7245.xy, uint(rint(_7245.z))).x;
                        float _1958 = fma(_1362, 5.0, _960);
                        float _1960 = _1362 * 9.0;
                        float _1962 = -_1958;
                        float _1964 = _1962 + _1956;
                        float _1966 = _1964 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1968 = precise::max(_1966, _1960);
                        float _1970 = precise::min(0.0, _1968);
                        bool _1972 = _1970 != _1966;
                        bool _1974 = isnan(_1970);
                        bool _1976 = _1972 || _1974;
                        bool _1978 = isnan(_1966);
                        bool _1980 = _1976 || _1978;
                        bool _1982 = !_1980;
                        if (!_1982)
                        {
                            float _1984 = fma(_1360, 6.0, _1064);
                            float _1986 = fma(_1358, 6.0, _962);
                            float3 _7297 = float3(_1986, _1984, float(int(_908)));
                            float3 _7299 = select(_7297, float3(0.0), isnan(_7297));
                            float _1988 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7299.xy, uint(rint(_7299.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7299.xy, uint(rint(_7299.z))).x;
                            float _1990 = fma(_1362, 6.0, _960);
                            float _1992 = _1362 * 10.5;
                            float _1994 = -_1990;
                            float _1996 = _1994 + _1988;
                            float _1998 = _1996 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2000 = precise::max(_1998, _1992);
                            float _2002 = precise::min(0.0, _2000);
                            bool _2004 = _2002 != _1998;
                            bool _2006 = isnan(_2002);
                            bool _2008 = _2004 || _2006;
                            bool _2010 = isnan(_1998);
                            bool _2012 = _2008 || _2010;
                            bool _2014 = !_2012;
                            if (!_2014)
                            {
                                float _2016 = fma(_1360, 7.0, _1064);
                                float _2018 = fma(_1358, 7.0, _962);
                                float3 _7351 = float3(_2018, _2016, float(int(_908)));
                                float3 _7353 = select(_7351, float3(0.0), isnan(_7351));
                                float _2020 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7353.xy, uint(rint(_7353.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7353.xy, uint(rint(_7353.z))).x;
                                float _2022 = fma(_1362, 7.0, _960);
                                float _2024 = _1362 * 12.0;
                                float _2026 = -_2022;
                                float _2028 = _2026 + _2020;
                                float _2030 = _2028 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2032 = precise::max(_2030, _2024);
                                float _2034 = precise::min(0.0, _2032);
                                bool _2036 = _2034 != _2030;
                                bool _2038 = isnan(_2034);
                                bool _2040 = _2036 || _2038;
                                bool _2042 = isnan(_2030);
                                bool _2044 = _2040 || _2042;
                                bool _2046 = !_2044;
                                if (!_2046)
                                {
                                    float _2048 = fma(_1360, 8.0, _1064);
                                    float _2050 = fma(_1358, 8.0, _962);
                                    float3 _7405 = float3(_2050, _2048, float(int(_908)));
                                    float3 _7407 = select(_7405, float3(0.0), isnan(_7405));
                                    float _2052 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7407.xy, uint(rint(_7407.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7407.xy, uint(rint(_7407.z))).x;
                                    float _2054 = fma(_1362, 8.0, _960);
                                    float _2056 = fma(_1362, 13.5, -1.0);
                                    float _2058 = -_2054;
                                    float _2060 = _2058 + _2052;
                                    float _2062 = _2060 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2064 = precise::max(_2062, _2056);
                                    float _2066 = precise::min(0.0, _2064);
                                    bool _2068 = _2066 != _2062;
                                    bool _2070 = isnan(_2066);
                                    bool _2072 = _2068 || _2070;
                                    bool _2074 = isnan(_2062);
                                    bool _2076 = _2072 || _2074;
                                    bool _2078 = !_2076;
                                    if (!_2078)
                                    {
                                        float _2080 = fma(_1360, 9.0, _1064);
                                        float _2082 = fma(_1358, 9.0, _962);
                                        float3 _7459 = float3(_2082, _2080, float(int(_908)));
                                        float3 _7461 = select(_7459, float3(0.0), isnan(_7459));
                                        float _2084 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7461.xy, uint(rint(_7461.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7461.xy, uint(rint(_7461.z))).x;
                                        float _2086 = fma(_1362, 9.0, _960);
                                        float _2088 = fma(_1362, 15.0, -1.0);
                                        float _2090 = -_2086;
                                        float _2092 = _2090 + _2084;
                                        float _2094 = _2092 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2096 = precise::max(_2094, _2088);
                                        float _2098 = precise::min(0.0, _2096);
                                        bool _2100 = _2098 != _2094;
                                        bool _2102 = isnan(_2098);
                                        bool _2104 = _2100 || _2102;
                                        bool _2106 = isnan(_2094);
                                        bool _2108 = _2104 || _2106;
                                        _2110 = _2108;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2110)
    {
        float _2112 = _1802 + 1.0;
        _1822 = _2112;
    }
    _2110 = false;
    float _2114 = _1822;
    float _2116 = _1386 * 1.5;
    float _2118 = precise::max(_1490, _2116);
    float _2120 = precise::min(0.0, _2118);
    bool _2122 = _2120 != _1490;
    bool _2124 = isnan(_2120);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(_1490);
    bool _2130 = _2126 || _2128;
    bool _2132 = !_2130;
    float _2134 = _2114;
    if (!_2132)
    {
        float _2136 = _1064 + _1384;
        float _2138 = _962 + _1382;
        float3 _7552 = float3(_2138, _2136, float(int(_908)));
        float3 _7554 = select(_7552, float3(0.0), isnan(_7552));
        float _2140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7554.xy, uint(rint(_7554.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7554.xy, uint(rint(_7554.z))).x;
        float _2142 = _960 + _1386;
        float _2144 = -_2142;
        float _2146 = _2144 + _2140;
        float _2148 = _1386 * 3.0;
        float _2150 = _2146 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2152 = precise::max(_2150, _2148);
        float _2154 = precise::min(0.0, _2152);
        bool _2156 = _2154 != _2150;
        bool _2158 = isnan(_2154);
        bool _2160 = _2156 || _2158;
        bool _2162 = isnan(_2150);
        bool _2164 = _2160 || _2162;
        bool _2166 = !_2164;
        if (!_2166)
        {
            float _2168 = fma(_1384, 2.0, _1064);
            float _2170 = fma(_1382, 2.0, _962);
            float3 _7606 = float3(_2170, _2168, float(int(_908)));
            float3 _7608 = select(_7606, float3(0.0), isnan(_7606));
            float _2172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7608.xy, uint(rint(_7608.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7608.xy, uint(rint(_7608.z))).x;
            float _2174 = fma(_1386, 2.0, _960);
            float _2176 = -_2174;
            float _2178 = _2176 + _2172;
            float _2180 = _1386 * 4.5;
            float _2182 = _2178 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2184 = precise::max(_2182, _2180);
            float _2186 = precise::min(0.0, _2184);
            bool _2188 = _2186 != _2182;
            bool _2190 = isnan(_2186);
            bool _2192 = _2188 || _2190;
            bool _2194 = isnan(_2182);
            bool _2196 = _2192 || _2194;
            bool _2198 = !_2196;
            if (!_2198)
            {
                float _2200 = fma(_1384, 3.0, _1064);
                float _2202 = fma(_1382, 3.0, _962);
                float3 _7660 = float3(_2202, _2200, float(int(_908)));
                float3 _7662 = select(_7660, float3(0.0), isnan(_7660));
                float _2204 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7662.xy, uint(rint(_7662.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7662.xy, uint(rint(_7662.z))).x;
                float _2206 = fma(_1386, 3.0, _960);
                float _2208 = -_2206;
                float _2210 = _2208 + _2204;
                float _2212 = _1386 * 6.0;
                float _2214 = _2210 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2216 = precise::max(_2214, _2212);
                float _2218 = precise::min(0.0, _2216);
                bool _2220 = _2218 != _2214;
                bool _2222 = isnan(_2218);
                bool _2224 = _2220 || _2222;
                bool _2226 = isnan(_2214);
                bool _2228 = _2224 || _2226;
                bool _2230 = !_2228;
                if (!_2230)
                {
                    float _2232 = fma(_1384, 4.0, _1064);
                    float _2234 = fma(_1382, 4.0, _962);
                    float3 _7714 = float3(_2234, _2232, float(int(_908)));
                    float3 _7716 = select(_7714, float3(0.0), isnan(_7714));
                    float _2236 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7716.xy, uint(rint(_7716.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7716.xy, uint(rint(_7716.z))).x;
                    float _2238 = fma(_1386, 4.0, _960);
                    float _2240 = -_2238;
                    float _2242 = _2240 + _2236;
                    float _2244 = _1386 * 7.5;
                    float _2246 = _2242 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2248 = precise::max(_2246, _2244);
                    float _2250 = precise::min(0.0, _2248);
                    bool _2252 = _2250 != _2246;
                    bool _2254 = isnan(_2250);
                    bool _2256 = _2252 || _2254;
                    bool _2258 = isnan(_2246);
                    bool _2260 = _2256 || _2258;
                    bool _2262 = !_2260;
                    if (!_2262)
                    {
                        float _2264 = fma(_1384, 5.0, _1064);
                        float _2266 = fma(_1382, 5.0, _962);
                        float3 _7768 = float3(_2266, _2264, float(int(_908)));
                        float3 _7770 = select(_7768, float3(0.0), isnan(_7768));
                        float _2268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7770.xy, uint(rint(_7770.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7770.xy, uint(rint(_7770.z))).x;
                        float _2270 = fma(_1386, 5.0, _960);
                        float _2272 = -_2270;
                        float _2274 = _2272 + _2268;
                        float _2276 = _1386 * 9.0;
                        float _2278 = _2274 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2280 = precise::max(_2278, _2276);
                        float _2282 = precise::min(0.0, _2280);
                        bool _2284 = _2282 != _2278;
                        bool _2286 = isnan(_2282);
                        bool _2288 = _2284 || _2286;
                        bool _2290 = isnan(_2278);
                        bool _2292 = _2288 || _2290;
                        bool _2294 = !_2292;
                        if (!_2294)
                        {
                            float _2296 = fma(_1384, 6.0, _1064);
                            float _2298 = fma(_1382, 6.0, _962);
                            float3 _7822 = float3(_2298, _2296, float(int(_908)));
                            float3 _7824 = select(_7822, float3(0.0), isnan(_7822));
                            float _2300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7824.xy, uint(rint(_7824.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7824.xy, uint(rint(_7824.z))).x;
                            float _2302 = fma(_1386, 6.0, _960);
                            float _2304 = -_2302;
                            float _2306 = _2304 + _2300;
                            float _2308 = _1386 * 10.5;
                            float _2310 = _2306 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2312 = precise::max(_2310, _2308);
                            float _2314 = precise::min(0.0, _2312);
                            bool _2316 = _2314 != _2310;
                            bool _2318 = isnan(_2314);
                            bool _2320 = _2316 || _2318;
                            bool _2322 = isnan(_2310);
                            bool _2324 = _2320 || _2322;
                            bool _2326 = !_2324;
                            if (!_2326)
                            {
                                float _2328 = fma(_1384, 7.0, _1064);
                                float _2330 = fma(_1382, 7.0, _962);
                                float3 _7876 = float3(_2330, _2328, float(int(_908)));
                                float3 _7878 = select(_7876, float3(0.0), isnan(_7876));
                                float _2332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7878.xy, uint(rint(_7878.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7878.xy, uint(rint(_7878.z))).x;
                                float _2334 = fma(_1386, 7.0, _960);
                                float _2336 = -_2334;
                                float _2338 = _2336 + _2332;
                                float _2340 = _1386 * 12.0;
                                float _2342 = _2338 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2344 = precise::max(_2342, _2340);
                                float _2346 = precise::min(0.0, _2344);
                                bool _2348 = _2346 != _2342;
                                bool _2350 = isnan(_2346);
                                bool _2352 = _2348 || _2350;
                                bool _2354 = isnan(_2342);
                                bool _2356 = _2352 || _2354;
                                bool _2358 = !_2356;
                                if (!_2358)
                                {
                                    float _2360 = fma(_1384, 8.0, _1064);
                                    float _2362 = fma(_1382, 8.0, _962);
                                    float3 _7930 = float3(_2362, _2360, float(int(_908)));
                                    float3 _7932 = select(_7930, float3(0.0), isnan(_7930));
                                    float _2364 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7932.xy, uint(rint(_7932.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7932.xy, uint(rint(_7932.z))).x;
                                    float _2366 = fma(_1386, 8.0, _960);
                                    float _2368 = -_2366;
                                    float _2370 = _2368 + _2364;
                                    float _2372 = fma(_1386, 13.5, -1.0);
                                    float _2374 = _2370 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2376 = precise::max(_2374, _2372);
                                    float _2378 = precise::min(0.0, _2376);
                                    bool _2380 = _2378 != _2374;
                                    bool _2382 = isnan(_2378);
                                    bool _2384 = _2380 || _2382;
                                    bool _2386 = isnan(_2374);
                                    bool _2388 = _2384 || _2386;
                                    bool _2390 = !_2388;
                                    if (!_2390)
                                    {
                                        float _2392 = fma(_1384, 9.0, _1064);
                                        float _2394 = fma(_1382, 9.0, _962);
                                        float3 _7984 = float3(_2394, _2392, float(int(_908)));
                                        float3 _7986 = select(_7984, float3(0.0), isnan(_7984));
                                        float _2396 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7986.xy, uint(rint(_7986.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7986.xy, uint(rint(_7986.z))).x;
                                        float _2398 = fma(_1386, 9.0, _960);
                                        float _2400 = fma(_1386, 15.0, -1.0);
                                        float _2402 = -_2398;
                                        float _2404 = _2402 + _2396;
                                        float _2406 = _2404 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2408 = precise::max(_2406, _2400);
                                        float _2410 = precise::min(0.0, _2408);
                                        bool _2412 = _2410 != _2406;
                                        bool _2414 = isnan(_2410);
                                        bool _2416 = _2412 || _2414;
                                        bool _2418 = isnan(_2406);
                                        bool _2420 = _2416 || _2418;
                                        _2422 = _2420;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2422)
    {
        float _2424 = _2114 + 1.0;
        _2134 = _2424;
    }
    _2422 = false;
    float _2426 = _2134;
    float _2428 = _1472 * 1.5;
    float _2430 = precise::max(_1490, _2428);
    float _2432 = precise::min(0.0, _2430);
    bool _2434 = _2432 != _1490;
    bool _2436 = isnan(_2432);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan(_1490);
    bool _2442 = _2438 || _2440;
    bool _2444 = !_2442;
    float _2446 = _2426;
    if (!_2444)
    {
        float _2448 = _1064 + _1470;
        float _2450 = _962 + _1468;
        float3 _8077 = float3(_2450, _2448, float(int(_908)));
        float3 _8079 = select(_8077, float3(0.0), isnan(_8077));
        float _2452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8079.xy, uint(rint(_8079.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8079.xy, uint(rint(_8079.z))).x;
        float _2454 = _960 + _1472;
        float _2456 = -_2454;
        float _2458 = _2456 + _2452;
        float _2460 = _1472 * 3.0;
        float _2462 = _2458 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2464 = precise::max(_2462, _2460);
        float _2466 = precise::min(0.0, _2464);
        bool _2468 = _2466 != _2462;
        bool _2470 = isnan(_2466);
        bool _2472 = _2468 || _2470;
        bool _2474 = isnan(_2462);
        bool _2476 = _2472 || _2474;
        bool _2478 = !_2476;
        if (!_2478)
        {
            float _2480 = fma(_1470, 2.0, _1064);
            float _2482 = fma(_1468, 2.0, _962);
            float3 _8131 = float3(_2482, _2480, float(int(_908)));
            float3 _8133 = select(_8131, float3(0.0), isnan(_8131));
            float _2484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8133.xy, uint(rint(_8133.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8133.xy, uint(rint(_8133.z))).x;
            float _2486 = fma(_1472, 2.0, _960);
            float _2488 = -_2486;
            float _2490 = _2488 + _2484;
            float _2492 = _1472 * 4.5;
            float _2494 = _2490 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2496 = precise::max(_2494, _2492);
            float _2498 = precise::min(0.0, _2496);
            bool _2500 = _2498 != _2494;
            bool _2502 = isnan(_2498);
            bool _2504 = _2500 || _2502;
            bool _2506 = isnan(_2494);
            bool _2508 = _2504 || _2506;
            bool _2510 = !_2508;
            if (!_2510)
            {
                float _2512 = fma(_1470, 3.0, _1064);
                float _2514 = fma(_1468, 3.0, _962);
                float3 _8185 = float3(_2514, _2512, float(int(_908)));
                float3 _8187 = select(_8185, float3(0.0), isnan(_8185));
                float _2516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8187.xy, uint(rint(_8187.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8187.xy, uint(rint(_8187.z))).x;
                float _2518 = fma(_1472, 3.0, _960);
                float _2520 = -_2518;
                float _2522 = _2520 + _2516;
                float _2524 = _1472 * 6.0;
                float _2526 = _2522 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2528 = precise::max(_2526, _2524);
                float _2530 = precise::min(0.0, _2528);
                bool _2532 = _2530 != _2526;
                bool _2534 = isnan(_2530);
                bool _2536 = _2532 || _2534;
                bool _2538 = isnan(_2526);
                bool _2540 = _2536 || _2538;
                bool _2542 = !_2540;
                if (!_2542)
                {
                    float _2544 = fma(_1470, 4.0, _1064);
                    float _2546 = fma(_1468, 4.0, _962);
                    float3 _8239 = float3(_2546, _2544, float(int(_908)));
                    float3 _8241 = select(_8239, float3(0.0), isnan(_8239));
                    float _2548 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8241.xy, uint(rint(_8241.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8241.xy, uint(rint(_8241.z))).x;
                    float _2550 = fma(_1472, 4.0, _960);
                    float _2552 = -_2550;
                    float _2554 = _2552 + _2548;
                    float _2556 = _1472 * 7.5;
                    float _2558 = _2554 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2560 = precise::max(_2558, _2556);
                    float _2562 = precise::min(0.0, _2560);
                    bool _2564 = _2562 != _2558;
                    bool _2566 = isnan(_2562);
                    bool _2568 = _2564 || _2566;
                    bool _2570 = isnan(_2558);
                    bool _2572 = _2568 || _2570;
                    bool _2574 = !_2572;
                    if (!_2574)
                    {
                        float _2576 = fma(_1470, 5.0, _1064);
                        float _2578 = fma(_1468, 5.0, _962);
                        float3 _8293 = float3(_2578, _2576, float(int(_908)));
                        float3 _8295 = select(_8293, float3(0.0), isnan(_8293));
                        float _2580 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8295.xy, uint(rint(_8295.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8295.xy, uint(rint(_8295.z))).x;
                        float _2582 = fma(_1472, 5.0, _960);
                        float _2584 = -_2582;
                        float _2586 = _2584 + _2580;
                        float _2588 = _1472 * 9.0;
                        float _2590 = _2586 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2592 = precise::max(_2590, _2588);
                        float _2594 = precise::min(0.0, _2592);
                        bool _2596 = _2594 != _2590;
                        bool _2598 = isnan(_2594);
                        bool _2600 = _2596 || _2598;
                        bool _2602 = isnan(_2590);
                        bool _2604 = _2600 || _2602;
                        bool _2606 = !_2604;
                        if (!_2606)
                        {
                            float _2608 = fma(_1470, 6.0, _1064);
                            float _2610 = fma(_1468, 6.0, _962);
                            float3 _8347 = float3(_2610, _2608, float(int(_908)));
                            float3 _8349 = select(_8347, float3(0.0), isnan(_8347));
                            float _2612 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8349.xy, uint(rint(_8349.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8349.xy, uint(rint(_8349.z))).x;
                            float _2614 = fma(_1472, 6.0, _960);
                            float _2616 = -_2614;
                            float _2618 = _2616 + _2612;
                            float _2620 = _1472 * 10.5;
                            float _2622 = _2618 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2624 = precise::max(_2622, _2620);
                            float _2626 = precise::min(0.0, _2624);
                            bool _2628 = _2626 != _2622;
                            bool _2630 = isnan(_2626);
                            bool _2632 = _2628 || _2630;
                            bool _2634 = isnan(_2622);
                            bool _2636 = _2632 || _2634;
                            bool _2638 = !_2636;
                            if (!_2638)
                            {
                                float _2640 = fma(_1470, 7.0, _1064);
                                float _2642 = fma(_1468, 7.0, _962);
                                float3 _8401 = float3(_2642, _2640, float(int(_908)));
                                float3 _8403 = select(_8401, float3(0.0), isnan(_8401));
                                float _2644 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8403.xy, uint(rint(_8403.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8403.xy, uint(rint(_8403.z))).x;
                                float _2646 = fma(_1472, 7.0, _960);
                                float _2648 = -_2646;
                                float _2650 = _2648 + _2644;
                                float _2652 = _1472 * 12.0;
                                float _2654 = _2650 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2656 = precise::max(_2654, _2652);
                                float _2658 = precise::min(0.0, _2656);
                                bool _2660 = _2658 != _2654;
                                bool _2662 = isnan(_2658);
                                bool _2664 = _2660 || _2662;
                                bool _2666 = isnan(_2654);
                                bool _2668 = _2664 || _2666;
                                bool _2670 = !_2668;
                                if (!_2670)
                                {
                                    float _2672 = fma(_1470, 8.0, _1064);
                                    float _2674 = fma(_1468, 8.0, _962);
                                    float3 _8455 = float3(_2674, _2672, float(int(_908)));
                                    float3 _8457 = select(_8455, float3(0.0), isnan(_8455));
                                    float _2676 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8457.xy, uint(rint(_8457.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8457.xy, uint(rint(_8457.z))).x;
                                    float _2678 = fma(_1472, 8.0, _960);
                                    float _2680 = -_2678;
                                    float _2682 = _2680 + _2676;
                                    float _2684 = fma(_1472, 13.5, -1.0);
                                    float _2686 = _2682 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2688 = precise::max(_2686, _2684);
                                    float _2690 = precise::min(0.0, _2688);
                                    bool _2692 = _2690 != _2686;
                                    bool _2694 = isnan(_2690);
                                    bool _2696 = _2692 || _2694;
                                    bool _2698 = isnan(_2686);
                                    bool _2700 = _2696 || _2698;
                                    bool _2702 = !_2700;
                                    if (!_2702)
                                    {
                                        float _2704 = fma(_1470, 9.0, _1064);
                                        float _2706 = fma(_1468, 9.0, _962);
                                        float3 _8509 = float3(_2706, _2704, float(int(_908)));
                                        float3 _8511 = select(_8509, float3(0.0), isnan(_8509));
                                        float _2708 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8511.xy, uint(rint(_8511.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8511.xy, uint(rint(_8511.z))).x;
                                        float _2710 = fma(_1472, 9.0, _960);
                                        float _2712 = fma(_1472, 15.0, -1.0);
                                        float _2714 = -_2710;
                                        float _2716 = _2714 + _2708;
                                        float _2718 = _2716 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2720 = precise::max(_2718, _2712);
                                        float _2722 = precise::min(0.0, _2720);
                                        bool _2724 = _2722 != _2718;
                                        bool _2726 = isnan(_2722);
                                        bool _2728 = _2724 || _2726;
                                        bool _2730 = isnan(_2718);
                                        bool _2732 = _2728 || _2730;
                                        _2734 = _2732;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2734)
    {
        float _2736 = _2426 + 1.0;
        _2446 = _2736;
    }
    _2734 = false;
    float _2738 = _2446;
    float _2740 = _1406 * 1.5;
    float _2742 = precise::max(_1490, _2740);
    float _2744 = precise::min(0.0, _2742);
    bool _2746 = _2744 != _1490;
    bool _2748 = isnan(_2744);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan(_1490);
    bool _2754 = _2750 || _2752;
    bool _2756 = !_2754;
    float _2758 = _2738;
    if (!_2756)
    {
        float _2760 = _1064 + _1404;
        float _2762 = _962 + _1402;
        float3 _8602 = float3(_2762, _2760, float(int(_908)));
        float3 _8604 = select(_8602, float3(0.0), isnan(_8602));
        float _2764 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8604.xy, uint(rint(_8604.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8604.xy, uint(rint(_8604.z))).x;
        float _2766 = _960 + _1406;
        float _2768 = -_2766;
        float _2770 = _2768 + _2764;
        float _2772 = _1406 * 3.0;
        float _2774 = _2770 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2776 = precise::max(_2774, _2772);
        float _2778 = precise::min(0.0, _2776);
        bool _2780 = _2778 != _2774;
        bool _2782 = isnan(_2778);
        bool _2784 = _2780 || _2782;
        bool _2786 = isnan(_2774);
        bool _2788 = _2784 || _2786;
        bool _2790 = !_2788;
        if (!_2790)
        {
            float _2792 = fma(_1404, 2.0, _1064);
            float _2794 = fma(_1402, 2.0, _962);
            float3 _8656 = float3(_2794, _2792, float(int(_908)));
            float3 _8658 = select(_8656, float3(0.0), isnan(_8656));
            float _2796 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8658.xy, uint(rint(_8658.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8658.xy, uint(rint(_8658.z))).x;
            float _2798 = fma(_1406, 2.0, _960);
            float _2800 = -_2798;
            float _2802 = _2800 + _2796;
            float _2804 = _1406 * 4.5;
            float _2806 = _2802 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2808 = precise::max(_2806, _2804);
            float _2810 = precise::min(0.0, _2808);
            bool _2812 = _2810 != _2806;
            bool _2814 = isnan(_2810);
            bool _2816 = _2812 || _2814;
            bool _2818 = isnan(_2806);
            bool _2820 = _2816 || _2818;
            bool _2822 = !_2820;
            if (!_2822)
            {
                float _2824 = fma(_1404, 3.0, _1064);
                float _2826 = fma(_1402, 3.0, _962);
                float3 _8710 = float3(_2826, _2824, float(int(_908)));
                float3 _8712 = select(_8710, float3(0.0), isnan(_8710));
                float _2828 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8712.xy, uint(rint(_8712.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8712.xy, uint(rint(_8712.z))).x;
                float _2830 = fma(_1406, 3.0, _960);
                float _2832 = -_2830;
                float _2834 = _2832 + _2828;
                float _2836 = _1406 * 6.0;
                float _2838 = _2834 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2840 = precise::max(_2838, _2836);
                float _2842 = precise::min(0.0, _2840);
                bool _2844 = _2842 != _2838;
                bool _2846 = isnan(_2842);
                bool _2848 = _2844 || _2846;
                bool _2850 = isnan(_2838);
                bool _2852 = _2848 || _2850;
                bool _2854 = !_2852;
                if (!_2854)
                {
                    float _2856 = fma(_1404, 4.0, _1064);
                    float _2858 = fma(_1402, 4.0, _962);
                    float3 _8764 = float3(_2858, _2856, float(int(_908)));
                    float3 _8766 = select(_8764, float3(0.0), isnan(_8764));
                    float _2860 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8766.xy, uint(rint(_8766.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8766.xy, uint(rint(_8766.z))).x;
                    float _2862 = fma(_1406, 4.0, _960);
                    float _2864 = -_2862;
                    float _2866 = _2864 + _2860;
                    float _2868 = _1406 * 7.5;
                    float _2870 = _2866 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2872 = precise::max(_2870, _2868);
                    float _2874 = precise::min(0.0, _2872);
                    bool _2876 = _2874 != _2870;
                    bool _2878 = isnan(_2874);
                    bool _2880 = _2876 || _2878;
                    bool _2882 = isnan(_2870);
                    bool _2884 = _2880 || _2882;
                    bool _2886 = !_2884;
                    if (!_2886)
                    {
                        float _2888 = fma(_1404, 5.0, _1064);
                        float _2890 = fma(_1402, 5.0, _962);
                        float3 _8818 = float3(_2890, _2888, float(int(_908)));
                        float3 _8820 = select(_8818, float3(0.0), isnan(_8818));
                        float _2892 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8820.xy, uint(rint(_8820.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8820.xy, uint(rint(_8820.z))).x;
                        float _2894 = fma(_1406, 5.0, _960);
                        float _2896 = -_2894;
                        float _2898 = _2896 + _2892;
                        float _2900 = _1406 * 9.0;
                        float _2902 = _2898 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2904 = precise::max(_2902, _2900);
                        float _2906 = precise::min(0.0, _2904);
                        bool _2908 = _2906 != _2902;
                        bool _2910 = isnan(_2906);
                        bool _2912 = _2908 || _2910;
                        bool _2914 = isnan(_2902);
                        bool _2916 = _2912 || _2914;
                        bool _2918 = !_2916;
                        if (!_2918)
                        {
                            float _2920 = fma(_1404, 6.0, _1064);
                            float _2922 = fma(_1402, 6.0, _962);
                            float3 _8872 = float3(_2922, _2920, float(int(_908)));
                            float3 _8874 = select(_8872, float3(0.0), isnan(_8872));
                            float _2924 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8874.xy, uint(rint(_8874.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8874.xy, uint(rint(_8874.z))).x;
                            float _2926 = fma(_1406, 6.0, _960);
                            float _2928 = -_2926;
                            float _2930 = _2928 + _2924;
                            float _2932 = _1406 * 10.5;
                            float _2934 = _2930 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2936 = precise::max(_2934, _2932);
                            float _2938 = precise::min(0.0, _2936);
                            bool _2940 = _2938 != _2934;
                            bool _2942 = isnan(_2938);
                            bool _2944 = _2940 || _2942;
                            bool _2946 = isnan(_2934);
                            bool _2948 = _2944 || _2946;
                            bool _2950 = !_2948;
                            if (!_2950)
                            {
                                float _2952 = fma(_1404, 7.0, _1064);
                                float _2954 = fma(_1402, 7.0, _962);
                                float3 _8926 = float3(_2954, _2952, float(int(_908)));
                                float3 _8928 = select(_8926, float3(0.0), isnan(_8926));
                                float _2956 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8928.xy, uint(rint(_8928.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8928.xy, uint(rint(_8928.z))).x;
                                float _2958 = fma(_1406, 7.0, _960);
                                float _2960 = -_2958;
                                float _2962 = _2960 + _2956;
                                float _2964 = _1406 * 12.0;
                                float _2966 = _2962 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2968 = precise::max(_2966, _2964);
                                float _2970 = precise::min(0.0, _2968);
                                bool _2972 = _2970 != _2966;
                                bool _2974 = isnan(_2970);
                                bool _2976 = _2972 || _2974;
                                bool _2978 = isnan(_2966);
                                bool _2980 = _2976 || _2978;
                                bool _2982 = !_2980;
                                if (!_2982)
                                {
                                    float _2984 = fma(_1404, 8.0, _1064);
                                    float _2986 = fma(_1402, 8.0, _962);
                                    float3 _8980 = float3(_2986, _2984, float(int(_908)));
                                    float3 _8982 = select(_8980, float3(0.0), isnan(_8980));
                                    float _2988 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8982.xy, uint(rint(_8982.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8982.xy, uint(rint(_8982.z))).x;
                                    float _2990 = fma(_1406, 8.0, _960);
                                    float _2992 = -_2990;
                                    float _2994 = _2992 + _2988;
                                    float _2996 = fma(_1406, 13.5, -1.0);
                                    float _2998 = _2994 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3000 = precise::max(_2998, _2996);
                                    float _3002 = precise::min(0.0, _3000);
                                    bool _3004 = _3002 != _2998;
                                    bool _3006 = isnan(_3002);
                                    bool _3008 = _3004 || _3006;
                                    bool _3010 = isnan(_2998);
                                    bool _3012 = _3008 || _3010;
                                    bool _3014 = !_3012;
                                    if (!_3014)
                                    {
                                        float _3016 = fma(_1404, 9.0, _1064);
                                        float _3018 = fma(_1402, 9.0, _962);
                                        float3 _9034 = float3(_3018, _3016, float(int(_908)));
                                        float3 _9036 = select(_9034, float3(0.0), isnan(_9034));
                                        float _3020 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9036.xy, uint(rint(_9036.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9036.xy, uint(rint(_9036.z))).x;
                                        float _3022 = fma(_1406, 9.0, _960);
                                        float _3024 = fma(_1406, 15.0, -1.0);
                                        float _3026 = -_3022;
                                        float _3028 = _3026 + _3020;
                                        float _3030 = _3028 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3032 = precise::max(_3030, _3024);
                                        float _3034 = precise::min(0.0, _3032);
                                        bool _3036 = _3034 != _3030;
                                        bool _3038 = isnan(_3034);
                                        bool _3040 = _3036 || _3038;
                                        bool _3042 = isnan(_3030);
                                        bool _3044 = _3040 || _3042;
                                        _3046 = _3044;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3046)
    {
        float _3048 = _2738 + 1.0;
        _2758 = _3048;
    }
    _3046 = false;
    float _3050 = _2758;
    float _3052 = _1428 * 1.5;
    float _3054 = precise::max(_1490, _3052);
    float _3056 = precise::min(0.0, _3054);
    bool _3058 = _3056 != _1490;
    bool _3060 = isnan(_3056);
    bool _3062 = _3058 || _3060;
    bool _3064 = isnan(_1490);
    bool _3066 = _3062 || _3064;
    bool _3068 = !_3066;
    float _3070 = _3050;
    if (!_3068)
    {
        float _3072 = _1064 + _1466;
        float _3074 = _962 + _1464;
        float3 _9127 = float3(_3074, _3072, float(int(_908)));
        float3 _9129 = select(_9127, float3(0.0), isnan(_9127));
        float _3076 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9129.xy, uint(rint(_9129.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9129.xy, uint(rint(_9129.z))).x;
        float _3078 = _960 + _1428;
        float _3080 = -_3078;
        float _3082 = _3080 + _3076;
        float _3084 = _1428 * 3.0;
        float _3086 = _3082 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3088 = precise::max(_3086, _3084);
        float _3090 = precise::min(0.0, _3088);
        bool _3092 = _3090 != _3086;
        bool _3094 = isnan(_3090);
        bool _3096 = _3092 || _3094;
        bool _3098 = isnan(_3086);
        bool _3100 = _3096 || _3098;
        bool _3102 = !_3100;
        if (!_3102)
        {
            float _3104 = fma(_1466, 2.0, _1064);
            float _3106 = fma(_1464, 2.0, _962);
            float3 _9181 = float3(_3106, _3104, float(int(_908)));
            float3 _9183 = select(_9181, float3(0.0), isnan(_9181));
            float _3108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9183.xy, uint(rint(_9183.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9183.xy, uint(rint(_9183.z))).x;
            float _3110 = fma(_1428, 2.0, _960);
            float _3112 = -_3110;
            float _3114 = _3112 + _3108;
            float _3116 = _1428 * 4.5;
            float _3118 = _3114 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3120 = precise::max(_3118, _3116);
            float _3122 = precise::min(0.0, _3120);
            bool _3124 = _3122 != _3118;
            bool _3126 = isnan(_3122);
            bool _3128 = _3124 || _3126;
            bool _3130 = isnan(_3118);
            bool _3132 = _3128 || _3130;
            bool _3134 = !_3132;
            if (!_3134)
            {
                float _3136 = fma(_1466, 3.0, _1064);
                float _3138 = fma(_1464, 3.0, _962);
                float3 _9235 = float3(_3138, _3136, float(int(_908)));
                float3 _9237 = select(_9235, float3(0.0), isnan(_9235));
                float _3140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9237.xy, uint(rint(_9237.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9237.xy, uint(rint(_9237.z))).x;
                float _3142 = fma(_1428, 3.0, _960);
                float _3144 = -_3142;
                float _3146 = _3144 + _3140;
                float _3148 = _1428 * 6.0;
                float _3150 = _3146 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3152 = precise::max(_3150, _3148);
                float _3154 = precise::min(0.0, _3152);
                bool _3156 = _3154 != _3150;
                bool _3158 = isnan(_3154);
                bool _3160 = _3156 || _3158;
                bool _3162 = isnan(_3150);
                bool _3164 = _3160 || _3162;
                bool _3166 = !_3164;
                if (!_3166)
                {
                    float _3168 = fma(_1466, 4.0, _1064);
                    float _3170 = fma(_1464, 4.0, _962);
                    float3 _9289 = float3(_3170, _3168, float(int(_908)));
                    float3 _9291 = select(_9289, float3(0.0), isnan(_9289));
                    float _3172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9291.xy, uint(rint(_9291.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9291.xy, uint(rint(_9291.z))).x;
                    float _3174 = fma(_1428, 4.0, _960);
                    float _3176 = -_3174;
                    float _3178 = _3176 + _3172;
                    float _3180 = _1428 * 7.5;
                    float _3182 = _3178 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3184 = precise::max(_3182, _3180);
                    float _3186 = precise::min(0.0, _3184);
                    bool _3188 = _3186 != _3182;
                    bool _3190 = isnan(_3186);
                    bool _3192 = _3188 || _3190;
                    bool _3194 = isnan(_3182);
                    bool _3196 = _3192 || _3194;
                    bool _3198 = !_3196;
                    if (!_3198)
                    {
                        float _3200 = fma(_1466, 5.0, _1064);
                        float _3202 = fma(_1464, 5.0, _962);
                        float3 _9343 = float3(_3202, _3200, float(int(_908)));
                        float3 _9345 = select(_9343, float3(0.0), isnan(_9343));
                        float _3204 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9345.xy, uint(rint(_9345.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9345.xy, uint(rint(_9345.z))).x;
                        float _3206 = fma(_1428, 5.0, _960);
                        float _3208 = -_3206;
                        float _3210 = _3208 + _3204;
                        float _3212 = _1428 * 9.0;
                        float _3214 = _3210 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3216 = precise::max(_3214, _3212);
                        float _3218 = precise::min(0.0, _3216);
                        bool _3220 = _3218 != _3214;
                        bool _3222 = isnan(_3218);
                        bool _3224 = _3220 || _3222;
                        bool _3226 = isnan(_3214);
                        bool _3228 = _3224 || _3226;
                        bool _3230 = !_3228;
                        if (!_3230)
                        {
                            float _3232 = fma(_1466, 6.0, _1064);
                            float _3234 = fma(_1464, 6.0, _962);
                            float3 _9397 = float3(_3234, _3232, float(int(_908)));
                            float3 _9399 = select(_9397, float3(0.0), isnan(_9397));
                            float _3236 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9399.xy, uint(rint(_9399.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9399.xy, uint(rint(_9399.z))).x;
                            float _3238 = fma(_1428, 6.0, _960);
                            float _3240 = -_3238;
                            float _3242 = _3240 + _3236;
                            float _3244 = _1428 * 10.5;
                            float _3246 = _3242 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3248 = precise::max(_3246, _3244);
                            float _3250 = precise::min(0.0, _3248);
                            bool _3252 = _3250 != _3246;
                            bool _3254 = isnan(_3250);
                            bool _3256 = _3252 || _3254;
                            bool _3258 = isnan(_3246);
                            bool _3260 = _3256 || _3258;
                            bool _3262 = !_3260;
                            if (!_3262)
                            {
                                float _3264 = fma(_1466, 7.0, _1064);
                                float _3266 = fma(_1464, 7.0, _962);
                                float3 _9451 = float3(_3266, _3264, float(int(_908)));
                                float3 _9453 = select(_9451, float3(0.0), isnan(_9451));
                                float _3268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9453.xy, uint(rint(_9453.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9453.xy, uint(rint(_9453.z))).x;
                                float _3270 = fma(_1428, 7.0, _960);
                                float _3272 = -_3270;
                                float _3274 = _3272 + _3268;
                                float _3276 = _1428 * 12.0;
                                float _3278 = _3274 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3280 = precise::max(_3278, _3276);
                                float _3282 = precise::min(0.0, _3280);
                                bool _3284 = _3282 != _3278;
                                bool _3286 = isnan(_3282);
                                bool _3288 = _3284 || _3286;
                                bool _3290 = isnan(_3278);
                                bool _3292 = _3288 || _3290;
                                bool _3294 = !_3292;
                                if (!_3294)
                                {
                                    float _3296 = fma(_1466, 8.0, _1064);
                                    float _3298 = fma(_1464, 8.0, _962);
                                    float3 _9505 = float3(_3298, _3296, float(int(_908)));
                                    float3 _9507 = select(_9505, float3(0.0), isnan(_9505));
                                    float _3300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9507.xy, uint(rint(_9507.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9507.xy, uint(rint(_9507.z))).x;
                                    float _3302 = fma(_1428, 8.0, _960);
                                    float _3304 = -_3302;
                                    float _3306 = _3304 + _3300;
                                    float _3308 = fma(_1428, 13.5, -1.0);
                                    float _3310 = _3306 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3312 = precise::max(_3310, _3308);
                                    float _3314 = precise::min(0.0, _3312);
                                    bool _3316 = _3314 != _3310;
                                    bool _3318 = isnan(_3314);
                                    bool _3320 = _3316 || _3318;
                                    bool _3322 = isnan(_3310);
                                    bool _3324 = _3320 || _3322;
                                    bool _3326 = !_3324;
                                    if (!_3326)
                                    {
                                        float _3328 = fma(_1466, 9.0, _1064);
                                        float _3330 = fma(_1464, 9.0, _962);
                                        float3 _9559 = float3(_3330, _3328, float(int(_908)));
                                        float3 _9561 = select(_9559, float3(0.0), isnan(_9559));
                                        float _3332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9561.xy, uint(rint(_9561.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9561.xy, uint(rint(_9561.z))).x;
                                        float _3334 = fma(_1428, 9.0, _960);
                                        float _3336 = fma(_1428, 15.0, -1.0);
                                        float _3338 = -_3334;
                                        float _3340 = _3338 + _3332;
                                        float _3342 = _3340 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3344 = precise::max(_3342, _3336);
                                        float _3346 = precise::min(0.0, _3344);
                                        bool _3348 = _3346 != _3342;
                                        bool _3350 = isnan(_3346);
                                        bool _3352 = _3348 || _3350;
                                        bool _3354 = isnan(_3342);
                                        bool _3356 = _3352 || _3354;
                                        _3358 = _3356;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3358)
    {
        float _3360 = _3050 + 1.0;
        _3070 = _3360;
    }
    _3358 = false;
    float _3362 = _3070;
    float _3364 = _1438 * 1.5;
    float _3366 = precise::max(_1490, _3364);
    float _3368 = precise::min(0.0, _3366);
    bool _3370 = _3368 != _1490;
    bool _3372 = isnan(_3368);
    bool _3374 = _3370 || _3372;
    bool _3376 = isnan(_1490);
    bool _3378 = _3374 || _3376;
    bool _3380 = !_3378;
    float _3382 = _3362;
    if (!_3380)
    {
        float _3384 = _1064 + _1436;
        float _3386 = _962 + _1434;
        float3 _9652 = float3(_3386, _3384, float(int(_908)));
        float3 _9654 = select(_9652, float3(0.0), isnan(_9652));
        float _3388 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9654.xy, uint(rint(_9654.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9654.xy, uint(rint(_9654.z))).x;
        float _3390 = _960 + _1438;
        float _3392 = -_3390;
        float _3394 = _3392 + _3388;
        float _3396 = _1438 * 3.0;
        float _3398 = _3394 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3400 = precise::max(_3398, _3396);
        float _3402 = precise::min(0.0, _3400);
        bool _3404 = _3402 != _3398;
        bool _3406 = isnan(_3402);
        bool _3408 = _3404 || _3406;
        bool _3410 = isnan(_3398);
        bool _3412 = _3408 || _3410;
        bool _3414 = !_3412;
        if (!_3414)
        {
            float _3416 = fma(_1436, 2.0, _1064);
            float _3418 = fma(_1434, 2.0, _962);
            float3 _9706 = float3(_3418, _3416, float(int(_908)));
            float3 _9708 = select(_9706, float3(0.0), isnan(_9706));
            float _3420 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9708.xy, uint(rint(_9708.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9708.xy, uint(rint(_9708.z))).x;
            float _3422 = fma(_1438, 2.0, _960);
            float _3424 = -_3422;
            float _3426 = _3424 + _3420;
            float _3428 = _1438 * 4.5;
            float _3430 = _3426 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3432 = precise::max(_3430, _3428);
            float _3434 = precise::min(0.0, _3432);
            bool _3436 = _3434 != _3430;
            bool _3438 = isnan(_3434);
            bool _3440 = _3436 || _3438;
            bool _3442 = isnan(_3430);
            bool _3444 = _3440 || _3442;
            bool _3446 = !_3444;
            if (!_3446)
            {
                float _3448 = fma(_1436, 3.0, _1064);
                float _3450 = fma(_1434, 3.0, _962);
                float3 _9760 = float3(_3450, _3448, float(int(_908)));
                float3 _9762 = select(_9760, float3(0.0), isnan(_9760));
                float _3452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9762.xy, uint(rint(_9762.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9762.xy, uint(rint(_9762.z))).x;
                float _3454 = fma(_1438, 3.0, _960);
                float _3456 = -_3454;
                float _3458 = _3456 + _3452;
                float _3460 = _1438 * 6.0;
                float _3462 = _3458 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3464 = precise::max(_3462, _3460);
                float _3466 = precise::min(0.0, _3464);
                bool _3468 = _3466 != _3462;
                bool _3470 = isnan(_3466);
                bool _3472 = _3468 || _3470;
                bool _3474 = isnan(_3462);
                bool _3476 = _3472 || _3474;
                bool _3478 = !_3476;
                if (!_3478)
                {
                    float _3480 = fma(_1436, 4.0, _1064);
                    float _3482 = fma(_1434, 4.0, _962);
                    float3 _9814 = float3(_3482, _3480, float(int(_908)));
                    float3 _9816 = select(_9814, float3(0.0), isnan(_9814));
                    float _3484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9816.xy, uint(rint(_9816.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9816.xy, uint(rint(_9816.z))).x;
                    float _3486 = fma(_1438, 4.0, _960);
                    float _3488 = -_3486;
                    float _3490 = _3488 + _3484;
                    float _3492 = _1438 * 7.5;
                    float _3494 = _3490 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3496 = precise::max(_3494, _3492);
                    float _3498 = precise::min(0.0, _3496);
                    bool _3500 = _3498 != _3494;
                    bool _3502 = isnan(_3498);
                    bool _3504 = _3500 || _3502;
                    bool _3506 = isnan(_3494);
                    bool _3508 = _3504 || _3506;
                    bool _3510 = !_3508;
                    if (!_3510)
                    {
                        float _3512 = fma(_1436, 5.0, _1064);
                        float _3514 = fma(_1434, 5.0, _962);
                        float3 _9868 = float3(_3514, _3512, float(int(_908)));
                        float3 _9870 = select(_9868, float3(0.0), isnan(_9868));
                        float _3516 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9870.xy, uint(rint(_9870.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9870.xy, uint(rint(_9870.z))).x;
                        float _3518 = fma(_1438, 5.0, _960);
                        float _3520 = -_3518;
                        float _3522 = _3520 + _3516;
                        float _3524 = _1438 * 9.0;
                        float _3526 = _3522 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3528 = precise::max(_3526, _3524);
                        float _3530 = precise::min(0.0, _3528);
                        bool _3532 = _3530 != _3526;
                        bool _3534 = isnan(_3530);
                        bool _3536 = _3532 || _3534;
                        bool _3538 = isnan(_3526);
                        bool _3540 = _3536 || _3538;
                        bool _3542 = !_3540;
                        if (!_3542)
                        {
                            float _3544 = fma(_1436, 6.0, _1064);
                            float _3546 = fma(_1434, 6.0, _962);
                            float3 _9922 = float3(_3546, _3544, float(int(_908)));
                            float3 _9924 = select(_9922, float3(0.0), isnan(_9922));
                            float _3548 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9924.xy, uint(rint(_9924.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9924.xy, uint(rint(_9924.z))).x;
                            float _3550 = fma(_1438, 6.0, _960);
                            float _3552 = -_3550;
                            float _3554 = _3552 + _3548;
                            float _3556 = _1438 * 10.5;
                            float _3558 = _3554 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3560 = precise::max(_3558, _3556);
                            float _3562 = precise::min(0.0, _3560);
                            bool _3564 = _3562 != _3558;
                            bool _3566 = isnan(_3562);
                            bool _3568 = _3564 || _3566;
                            bool _3570 = isnan(_3558);
                            bool _3572 = _3568 || _3570;
                            bool _3574 = !_3572;
                            if (!_3574)
                            {
                                float _3576 = fma(_1436, 7.0, _1064);
                                float _3578 = fma(_1434, 7.0, _962);
                                float3 _9976 = float3(_3578, _3576, float(int(_908)));
                                float3 _9978 = select(_9976, float3(0.0), isnan(_9976));
                                float _3580 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9978.xy, uint(rint(_9978.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9978.xy, uint(rint(_9978.z))).x;
                                float _3582 = fma(_1438, 7.0, _960);
                                float _3584 = -_3582;
                                float _3586 = _3584 + _3580;
                                float _3588 = _1438 * 12.0;
                                float _3590 = _3586 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3592 = precise::max(_3590, _3588);
                                float _3594 = precise::min(0.0, _3592);
                                bool _3596 = _3594 != _3590;
                                bool _3598 = isnan(_3594);
                                bool _3600 = _3596 || _3598;
                                bool _3602 = isnan(_3590);
                                bool _3604 = _3600 || _3602;
                                bool _3606 = !_3604;
                                if (!_3606)
                                {
                                    float _3608 = fma(_1436, 8.0, _1064);
                                    float _3610 = fma(_1434, 8.0, _962);
                                    float3 _10030 = float3(_3610, _3608, float(int(_908)));
                                    float3 _10032 = select(_10030, float3(0.0), isnan(_10030));
                                    float _3612 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10032.xy, uint(rint(_10032.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10032.xy, uint(rint(_10032.z))).x;
                                    float _3614 = fma(_1438, 8.0, _960);
                                    float _3616 = -_3614;
                                    float _3618 = _3616 + _3612;
                                    float _3620 = fma(_1438, 13.5, -1.0);
                                    float _3622 = _3618 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3624 = precise::max(_3622, _3620);
                                    float _3626 = precise::min(0.0, _3624);
                                    bool _3628 = _3626 != _3622;
                                    bool _3630 = isnan(_3626);
                                    bool _3632 = _3628 || _3630;
                                    bool _3634 = isnan(_3622);
                                    bool _3636 = _3632 || _3634;
                                    bool _3638 = !_3636;
                                    if (!_3638)
                                    {
                                        float _3640 = fma(_1436, 9.0, _1064);
                                        float _3642 = fma(_1434, 9.0, _962);
                                        float3 _10084 = float3(_3642, _3640, float(int(_908)));
                                        float3 _10086 = select(_10084, float3(0.0), isnan(_10084));
                                        float _3644 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10086.xy, uint(rint(_10086.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10086.xy, uint(rint(_10086.z))).x;
                                        float _3646 = fma(_1438, 9.0, _960);
                                        float _3648 = fma(_1438, 15.0, -1.0);
                                        float _3650 = -_3646;
                                        float _3652 = _3650 + _3644;
                                        float _3654 = _3652 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3656 = precise::max(_3654, _3648);
                                        float _3658 = precise::min(0.0, _3656);
                                        bool _3660 = _3658 != _3654;
                                        bool _3662 = isnan(_3658);
                                        bool _3664 = _3660 || _3662;
                                        bool _3666 = isnan(_3654);
                                        bool _3668 = _3664 || _3666;
                                        _3670 = _3668;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3670)
    {
        float _3672 = _3362 + 1.0;
        _3382 = _3672;
    }
    _3670 = false;
    float _3674 = _3382;
    float _3676 = _1484 * 1.5;
    float _3678 = precise::max(_1490, _3676);
    float _3680 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _3682 = 1.0 + _3680;
    float _3684 = precise::min(0.0, _3678);
    float _3686 = fma(_3682, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _3688 = _3684 != _1490;
    bool _3690 = isnan(_3684);
    bool _3692 = _3688 || _3690;
    bool _3694 = isnan(_1490);
    bool _3696 = _3692 || _3694;
    float _3698 = _3686 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _3700 = !_3696;
    float _3702 = _3674;
    if (!_3700)
    {
        float _3704 = _1064 + _1482;
        float _3706 = _962 + _1480;
        float3 _10192 = float3(_3706, _3704, float(int(_908)));
        float3 _10194 = select(_10192, float3(0.0), isnan(_10192));
        float _3708 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10194.xy, uint(rint(_10194.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10194.xy, uint(rint(_10194.z))).x;
        float _3710 = _960 + _1484;
        float _3712 = _1484 * 3.0;
        float _3714 = -_3710;
        float _3716 = _3714 + _3708;
        float _3718 = _3716 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3720 = precise::max(_3718, _3712);
        float _3722 = precise::min(0.0, _3720);
        bool _3724 = _3722 != _3718;
        bool _3726 = isnan(_3722);
        bool _3728 = _3724 || _3726;
        bool _3730 = isnan(_3718);
        bool _3732 = _3728 || _3730;
        bool _3734 = !_3732;
        if (!_3734)
        {
            float _3736 = fma(_1482, 2.0, _1064);
            float _3738 = fma(_1480, 2.0, _962);
            float3 _10246 = float3(_3738, _3736, float(int(_908)));
            float3 _10248 = select(_10246, float3(0.0), isnan(_10246));
            float _3740 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10248.xy, uint(rint(_10248.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10248.xy, uint(rint(_10248.z))).x;
            float _3742 = fma(_1484, 2.0, _960);
            float _3744 = _1484 * 4.5;
            float _3746 = -_3742;
            float _3748 = _3746 + _3740;
            float _3750 = _3748 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3752 = precise::max(_3750, _3744);
            float _3754 = precise::min(0.0, _3752);
            bool _3756 = _3754 != _3750;
            bool _3758 = isnan(_3754);
            bool _3760 = _3756 || _3758;
            bool _3762 = isnan(_3750);
            bool _3764 = _3760 || _3762;
            bool _3766 = !_3764;
            if (!_3766)
            {
                float _3768 = fma(_1482, 3.0, _1064);
                float _3770 = fma(_1480, 3.0, _962);
                float3 _10300 = float3(_3770, _3768, float(int(_908)));
                float3 _10302 = select(_10300, float3(0.0), isnan(_10300));
                float _3772 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10302.xy, uint(rint(_10302.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10302.xy, uint(rint(_10302.z))).x;
                float _3774 = fma(_1484, 3.0, _960);
                float _3776 = _1484 * 6.0;
                float _3778 = -_3774;
                float _3780 = _3778 + _3772;
                float _3782 = _3780 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3784 = precise::max(_3782, _3776);
                float _3786 = precise::min(0.0, _3784);
                bool _3788 = _3786 != _3782;
                bool _3790 = isnan(_3786);
                bool _3792 = _3788 || _3790;
                bool _3794 = isnan(_3782);
                bool _3796 = _3792 || _3794;
                bool _3798 = !_3796;
                if (!_3798)
                {
                    float _3800 = fma(_1482, 4.0, _1064);
                    float _3802 = fma(_1480, 4.0, _962);
                    float3 _10354 = float3(_3802, _3800, float(int(_908)));
                    float3 _10356 = select(_10354, float3(0.0), isnan(_10354));
                    float _3804 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10356.xy, uint(rint(_10356.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10356.xy, uint(rint(_10356.z))).x;
                    float _3806 = fma(_1484, 4.0, _960);
                    float _3808 = _1484 * 7.5;
                    float _3810 = -_3806;
                    float _3812 = _3810 + _3804;
                    float _3814 = _3812 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3816 = precise::max(_3814, _3808);
                    float _3818 = precise::min(0.0, _3816);
                    bool _3820 = _3818 != _3814;
                    bool _3822 = isnan(_3818);
                    bool _3824 = _3820 || _3822;
                    bool _3826 = isnan(_3814);
                    bool _3828 = _3824 || _3826;
                    bool _3830 = !_3828;
                    if (!_3830)
                    {
                        float _3832 = fma(_1482, 5.0, _1064);
                        float _3834 = fma(_1480, 5.0, _962);
                        float3 _10408 = float3(_3834, _3832, float(int(_908)));
                        float3 _10410 = select(_10408, float3(0.0), isnan(_10408));
                        float _3836 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10410.xy, uint(rint(_10410.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10410.xy, uint(rint(_10410.z))).x;
                        float _3838 = fma(_1484, 5.0, _960);
                        float _3840 = _1484 * 9.0;
                        float _3842 = -_3838;
                        float _3844 = _3842 + _3836;
                        float _3846 = _3844 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3848 = precise::max(_3846, _3840);
                        float _3850 = precise::min(0.0, _3848);
                        bool _3852 = _3850 != _3846;
                        bool _3854 = isnan(_3850);
                        bool _3856 = _3852 || _3854;
                        bool _3858 = isnan(_3846);
                        bool _3860 = _3856 || _3858;
                        bool _3862 = !_3860;
                        if (!_3862)
                        {
                            float _3864 = fma(_1482, 6.0, _1064);
                            float _3866 = fma(_1480, 6.0, _962);
                            float3 _10462 = float3(_3866, _3864, float(int(_908)));
                            float3 _10464 = select(_10462, float3(0.0), isnan(_10462));
                            float _3868 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10464.xy, uint(rint(_10464.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10464.xy, uint(rint(_10464.z))).x;
                            float _3870 = fma(_1484, 6.0, _960);
                            float _3872 = _1484 * 10.5;
                            float _3874 = -_3870;
                            float _3876 = _3874 + _3868;
                            float _3878 = _3876 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3880 = precise::max(_3878, _3872);
                            float _3882 = precise::min(0.0, _3880);
                            bool _3884 = _3882 != _3878;
                            bool _3886 = isnan(_3882);
                            bool _3888 = _3884 || _3886;
                            bool _3890 = isnan(_3878);
                            bool _3892 = _3888 || _3890;
                            bool _3894 = !_3892;
                            if (!_3894)
                            {
                                float _3896 = fma(_1482, 7.0, _1064);
                                float _3898 = fma(_1480, 7.0, _962);
                                float3 _10516 = float3(_3898, _3896, float(int(_908)));
                                float3 _10518 = select(_10516, float3(0.0), isnan(_10516));
                                float _3900 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10518.xy, uint(rint(_10518.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10518.xy, uint(rint(_10518.z))).x;
                                float _3902 = fma(_1484, 7.0, _960);
                                float _3904 = _1484 * 12.0;
                                float _3906 = -_3902;
                                float _3908 = _3906 + _3900;
                                float _3910 = _3908 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3912 = precise::max(_3910, _3904);
                                float _3914 = precise::min(0.0, _3912);
                                bool _3916 = _3914 != _3910;
                                bool _3918 = isnan(_3914);
                                bool _3920 = _3916 || _3918;
                                bool _3922 = isnan(_3910);
                                bool _3924 = _3920 || _3922;
                                bool _3926 = !_3924;
                                if (!_3926)
                                {
                                    float _3928 = fma(_1482, 8.0, _1064);
                                    float _3930 = fma(_1480, 8.0, _962);
                                    float3 _10570 = float3(_3930, _3928, float(int(_908)));
                                    float3 _10572 = select(_10570, float3(0.0), isnan(_10570));
                                    float _3932 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10572.xy, uint(rint(_10572.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10572.xy, uint(rint(_10572.z))).x;
                                    float _3934 = fma(_1484, 8.0, _960);
                                    float _3936 = fma(_1484, 13.5, -1.0);
                                    float _3938 = -_3934;
                                    float _3940 = _3938 + _3932;
                                    float _3942 = _3940 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3944 = precise::max(_3942, _3936);
                                    float _3946 = precise::min(0.0, _3944);
                                    bool _3948 = _3946 != _3942;
                                    bool _3950 = isnan(_3946);
                                    bool _3952 = _3948 || _3950;
                                    bool _3954 = isnan(_3942);
                                    bool _3956 = _3952 || _3954;
                                    bool _3958 = !_3956;
                                    if (!_3958)
                                    {
                                        float _3960 = fma(_1482, 9.0, _1064);
                                        float _3962 = fma(_1480, 9.0, _962);
                                        float3 _10624 = float3(_3962, _3960, float(int(_908)));
                                        float3 _10626 = select(_10624, float3(0.0), isnan(_10624));
                                        float _3964 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10626.xy, uint(rint(_10626.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10626.xy, uint(rint(_10626.z))).x;
                                        float _3966 = fma(_1484, 9.0, _960);
                                        float _3968 = fma(_1484, 15.0, -1.0);
                                        float _3970 = -_3966;
                                        float _3972 = _3970 + _3964;
                                        float _3974 = _3972 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3976 = precise::max(_3974, _3968);
                                        float _3978 = precise::min(0.0, _3976);
                                        bool _3980 = _3978 != _3974;
                                        bool _3982 = isnan(_3978);
                                        bool _3984 = _3980 || _3982;
                                        bool _3986 = isnan(_3974);
                                        bool _3988 = _3984 || _3986;
                                        _3990 = _3988;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3990)
    {
        float _3992 = _3674 + 1.0;
        _3702 = _3992;
    }
    _3990 = false;
    float _3994 = _3702;
    float _3996 = _3994 * 0.125;
    float _3998 = -_3996;
    float _4000 = fma(_3998, _3698, 1.0);
    out.m_39.x = _4000;
    return out;
}

