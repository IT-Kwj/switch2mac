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
    bool _6556 = false;
    bool _5916 = false;
    bool _5280 = false;
    bool _4648 = false;
    bool _4016 = false;
    bool _3384 = false;
    bool _2752 = false;
    bool _2122 = false;
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
    float2 _6601 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_6601, float2(0.0), isnan(_6601))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_6601, float2(0.0), isnan(_6601))).x;
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
    float _169 = _155 * 6.283185482025146484375;
    float _171 = sin(_169);
    float _173 = _165 * 0.15915493667125701904296875;
    float _175 = _149 + 189.3459930419921875;
    float _177 = _175 * 0.15915493667125701904296875;
    float _179 = _147 + 284.01898193359375;
    float _181 = _167 * 6.283185482025146484375;
    float _183 = sin(_181);
    float _185 = _179 * 0.15915493667125701904296875;
    float _187 = _149 + 284.01898193359375;
    float _189 = _171 * 43758.546875;
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _147 + 378.691986083984375;
    float _195 = _163 * 6.283185482025146484375;
    float _197 = sin(_195);
    float _199 = _193 * 0.15915493667125701904296875;
    float _201 = _149 + 378.691986083984375;
    float _203 = _201 * 0.15915493667125701904296875;
    float _205 = _147 + 473.364990234375;
    float _207 = _177 * 6.283185482025146484375;
    float _209 = sin(_207);
    float _211 = _205 * 0.15915493667125701904296875;
    float _213 = _149 + 473.364990234375;
    float _215 = _197 * 43758.546875;
    float _217 = _213 * 0.15915493667125701904296875;
    float _219 = _173 * 6.283185482025146484375;
    float _221 = sin(_219);
    int _223 = 2;
    if (!_106)
    {
        _223 = 1;
    }
    int _225 = _223;
    int _227 = _225;
    if (!_114)
    {
        _227 = _139;
    }
    int _229 = _227;
    float _231 = _147 + 662.71099853515625;
    float _233 = _147 + 757.38397216796875;
    float _235 = _209 * 43758.546875;
    int _237 = _229 + 1;
    float _239 = _231 * 0.15915493667125701904296875;
    int _241 = _237;
    if (!_128)
    {
        _241 = _229;
    }
    int _243 = _241;
    float _245 = _233 * 0.15915493667125701904296875;
    float _247 = _149 + 662.71099853515625;
    float _249 = _149 + 757.38397216796875;
    bool _251 = _243 != 1;
    float _253 = _247 * 0.15915493667125701904296875;
    bool _255 = _243 != 0;
    float _257 = _239 * 6.283185482025146484375;
    float _259 = sin(_257);
    bool _261 = !_251;
    int _263 = _261 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _265 = _221 * 43758.546875;
    bool _267 = !_251;
    int _269 = _267 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _271 = !_251;
    int _273 = _271 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _275 = _249 * 0.15915493667125701904296875;
    bool _277 = !_251;
    int _279 = _277 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _281 = _185 * 6.283185482025146484375;
    float _283 = sin(_281);
    bool _285 = !_251;
    int _287 = _285 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _289 = _255 ? as_type<float>(_279) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _291 = _255 ? as_type<float>(_287) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    bool _293 = !_251;
    int _295 = _293 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _297 = _191 * 6.283185482025146484375;
    float _299 = sin(_297);
    bool _301 = !_251;
    int _303 = _301 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _305 = _130 * _291;
    bool _307 = !_251;
    int _309 = _307 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _311 = _255 ? as_type<float>(_295) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _313 = _255 ? as_type<float>(_263) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _315 = _199 * 6.283185482025146484375;
    float _317 = sin(_315);
    float _319 = _255 ? as_type<float>(_269) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _321 = _283 * 43758.546875;
    float _323 = _255 ? as_type<float>(_273) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _325 = _130 * _311;
    float _327 = _255 ? as_type<float>(_303) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _329 = _130 * _313;
    float _331 = _130 * _319;
    float _333 = _255 ? as_type<float>(_309) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _335 = _130 * _323;
    bool _337 = !_251;
    int _339 = _337 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _341 = _130 * _327;
    float _343 = _130 * _333;
    float _345 = fma(_134, _289, _329);
    float _347 = _255 ? as_type<float>(_339) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _349 = _203 * 6.283185482025146484375;
    float _351 = sin(_349);
    bool _353 = !_251;
    int _355 = _353 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _357 = _299 * 43758.546875;
    float _359 = fma(_134, _347, _305);
    bool _361 = !_251;
    int _363 = _361 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _365 = _317 * 43758.546875;
    float _367 = _211 * 6.283185482025146484375;
    float _369 = sin(_367);
    float _371 = _255 ? as_type<float>(_355) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    bool _373 = !_251;
    int _375 = _373 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _377 = _255 ? as_type<float>(_363) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _379 = fma(_134, _371, _331);
    bool _381 = !_251;
    int _383 = _381 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _385 = _217 * 6.283185482025146484375;
    float _387 = sin(_385);
    float _389 = _255 ? as_type<float>(_375) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _391 = fma(_134, _377, _335);
    float _393 = _351 * 43758.546875;
    float _395 = _255 ? as_type<float>(_383) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _397 = fma(_132, _389, _379);
    bool _399 = !_251;
    int _401 = _399 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _403 = _159 * 6.283185482025146484375;
    float _405 = sin(_403);
    float _407 = fma(_134, _395, _343);
    float _409 = _369 * 43758.546875;
    float _411 = _255 ? as_type<float>(_401) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _413 = _245 * 6.283185482025146484375;
    float _415 = sin(_413);
    bool _417 = !_251;
    int _419 = _417 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _421 = _387 * 43758.546875;
    bool _423 = !_251;
    int _425 = _423 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _427 = fma(_134, _411, _325);
    bool _429 = !_251;
    int _431 = _429 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _433 = _255 ? as_type<float>(_419) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _435 = _253 * 6.283185482025146484375;
    float _437 = sin(_435);
    float _439 = _405 * 43758.546875;
    float _441 = _255 ? as_type<float>(_425) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _443 = fma(_132, _433, _391);
    float _445 = _255 ? as_type<float>(_431) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    bool _447 = !_251;
    int _449 = _447 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _451 = fma(_132, _441, _427);
    float _453 = fma(_132, _445, _359);
    float _455 = _183 * 43758.546875;
    float _457 = _255 ? as_type<float>(_449) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _459 = _275 * 6.283185482025146484375;
    float _461 = sin(_459);
    float _463 = _415 * 43758.546875;
    bool _465 = !_251;
    int _467 = _465 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _469 = fma(_134, _457, _341);
    bool _471 = !_251;
    int _473 = _471 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _475 = floor(_215);
    bool _477 = !_251;
    int _479 = _477 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    bool _481 = !_251;
    int _483 = _481 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _485 = _255 ? as_type<float>(_467) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _487 = _255 ? as_type<float>(_473) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _489 = floor(_235);
    bool _491 = !_251;
    int _493 = _491 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _495 = _461 * 43758.546875;
    float _497 = _255 ? as_type<float>(_479) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _499 = fma(_132, _487, _345);
    float _501 = _255 ? as_type<float>(_483) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _503 = fma(_132, _485, _407);
    float _505 = _255 ? as_type<float>(_493) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _507 = _497 + _443;
    bool _509 = !_251;
    int _511 = _509 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _513 = _259 * 43758.546875;
    float _515 = _505 + _499;
    float _517 = _437 * 43758.546875;
    float _519 = _255 ? as_type<float>(_511) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _521 = floor(_189);
    bool _523 = !_251;
    int _525 = _523 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _527 = -_475;
    float _529 = _215 + _527;
    float _531 = fma(_132, _519, _469);
    bool _533 = !_251;
    int _535 = _533 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _537 = _501 + _397;
    float _539 = _255 ? as_type<float>(_525) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _541 = floor(_265);
    bool _543 = !_251;
    int _545 = _543 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _547 = _255 ? as_type<float>(_535) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _549 = _539 + _453;
    float _551 = _255 ? as_type<float>(_545) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    bool _553 = !_251;
    int _555 = _553 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _557 = _547 + _531;
    float _559 = floor(_321);
    float _561 = -_521;
    float _563 = _189 + _561;
    float _565 = _255 ? as_type<float>(_555) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _567 = -_489;
    float _569 = _235 + _567;
    float _571 = fma(_529, 2.0, -1.0);
    float _573 = fma(_563, 2.0, -1.0);
    float _575 = _551 + _451;
    float _577 = -_541;
    float _579 = _265 + _577;
    float _581 = floor(_357);
    float _583 = fma(_569, 2.0, -1.0);
    float _585 = _80 * _571;
    float _587 = fma(_579, 2.0, -1.0);
    float _589 = _80 * _573;
    float _591 = _565 + _503;
    float _593 = floor(_365);
    float _595 = -_559;
    float _597 = _321 + _595;
    float _599 = _80 * _583;
    float _601 = fma(_597, 2.0, -1.0);
    bool _603 = !_251;
    int _605 = _603 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    float _607 = floor(_393);
    float _609 = -_581;
    float _611 = _357 + _609;
    float _613 = _599 * _599;
    float _615 = _80 * _601;
    bool _617 = !_251;
    int _619 = _617 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _621 = floor(_409);
    float _623 = -_593;
    float _625 = _365 + _623;
    float _627 = fma(_611, 2.0, -1.0);
    float _629 = _80 * _587;
    bool _631 = !_251;
    int _633 = _631 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _635 = fma(_625, 2.0, -1.0);
    float _637 = _80 * _627;
    float _639 = fma(_629, _629, _613);
    float _641 = floor(_421);
    float _643 = -_607;
    float _645 = _393 + _643;
    float _647 = _80 * _635;
    float _649 = _637 * _637;
    float _651 = fma(_645, 2.0, -1.0);
    float _653 = fma(_615, _615, _649);
    float _655 = floor(_439);
    float _657 = -_621;
    float _659 = _409 + _657;
    float _661 = _80 * _651;
    float _663 = fma(_659, 2.0, -1.0);
    float _665 = _661 * _661;
    bool _667 = !_251;
    int _669 = _667 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _671 = floor(_455);
    float _673 = -_641;
    float _675 = _421 + _673;
    float _677 = fma(_647, _647, _665);
    float _679 = _653 + 1.0;
    bool _681 = !_251;
    int _683 = _681 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _685 = fma(_675, 2.0, -1.0);
    float _687 = _677 + 1.0;
    float _689 = _255 ? as_type<float>(_619) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _691 = floor(_513);
    float _693 = -_655;
    float _695 = _439 + _693;
    float _697 = _255 ? as_type<float>(_669) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _699 = _255 ? as_type<float>(_605) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _701 = fma(_695, 2.0, -1.0);
    float _703 = _255 ? as_type<float>(_633) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _705 = floor(_517);
    float _707 = -_671;
    float _709 = _455 + _707;
    float _711 = _80 * _685;
    float _713 = _255 ? as_type<float>(_683) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _715 = fma(_709, 2.0, -1.0);
    float _717 = float(_243);
    float _719 = floor(_463);
    float _721 = -_691;
    float _723 = _513 + _721;
    float _725 = fma(_723, 2.0, -1.0);
    float _727 = _80 * _663;
    float _729 = floor(_495);
    float _731 = -_705;
    float _733 = _517 + _731;
    float _735 = _80 * _715;
    float _737 = _80 * _725;
    float _739 = fma(_733, 2.0, -1.0);
    float _741 = -_719;
    float _743 = _463 + _741;
    float _745 = _80 * _739;
    float _747 = rsqrt(_679);
    float _749 = fma(_743, 2.0, -1.0);
    float _751 = _80 * _701;
    float _753 = -_729;
    float _755 = _495 + _753;
    float _757 = _80 * _749;
    float _759 = _639 + 1.0;
    float _761 = rsqrt(_687);
    float _763 = fma(_755, 2.0, -1.0);
    float _765 = _585 * _585;
    bool _767 = !_251;
    int _769 = _767 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _771 = _80 * _763;
    float _773 = fma(_589, _589, _765);
    float _775 = _255 ? as_type<float>(_769) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _777 = rsqrt(_759);
    float _779 = fma(_615, _747, _549);
    float _781 = _773 + 1.0;
    bool _783 = !_251;
    int _785 = _783 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    bool _787 = !_251;
    int _789 = _787 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _791 = _255 ? as_type<float>(_785) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _793 = rsqrt(_781);
    float _795 = _255 ? as_type<float>(_789) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _797 = fma(_661, _761, _557);
    float _799 = fma(_647, _761, _549);
    bool _801 = !_251;
    int _803 = _801 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _805 = _689 * _797;
    float _807 = _697 * _797;
    float _809 = fma(_599, _777, _557);
    float _811 = fma(_629, _777, _549);
    float _813 = _703 * _797;
    float _815 = fma(_713, _799, _805);
    float _817 = _697 * _809;
    float _819 = _699 * _809;
    float _821 = fma(_791, _799, _807);
    float _823 = fma(_775, _799, _813);
    float _825 = fma(_585, _793, _557);
    float _827 = fma(_589, _793, _549);
    float _829 = fma(_791, _811, _817);
    float _831 = fma(_795, _811, _819);
    float _833 = _689 * _825;
    float _835 = _697 * _825;
    float _837 = _699 * _825;
    float _839 = _703 * _825;
    float _841 = fma(_637, _747, _557);
    float _843 = fma(_713, _827, _833);
    float _845 = fma(_791, _827, _835);
    float _847 = fma(_795, _827, _837);
    float _849 = fma(_775, _827, _839);
    float _851 = _689 * _809;
    float _853 = _703 * _809;
    float _855 = _699 * _841;
    float _857 = _689 * _841;
    float _859 = fma(_713, _811, _851);
    float _861 = fma(_775, _811, _853);
    float _863 = _697 * _841;
    float _865 = _703 * _841;
    float _867 = fma(_795, _779, _855);
    float _869 = _699 * _797;
    float _871 = fma(_713, _779, _857);
    float _873 = fma(_791, _779, _863);
    float _875 = fma(_775, _779, _865);
    float _877 = fma(_795, _799, _869);
    float _879 = -_793;
    float _881 = _591 + _879;
    float _883 = -_777;
    float _885 = _591 + _883;
    float _887 = 1.0 / _575;
    bool _889 = !_251;
    int _891 = _889 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _893 = !_251;
    int _895 = _893 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    bool _897 = !_251;
    int _899 = _897 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _901 = _255 ? as_type<float>(_891) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _903 = rint(_717);
    float _905 = precise::max(_903, 0.0);
    uint _908 = uint(_905);
    uint _910 = clamp(_908, 0u, 65535u);
    float _912 = _255 ? as_type<float>(_895) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _914 = _255 ? as_type<float>(_899) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _916 = fma(_901, _881, _845);
    float _918 = _255 ? as_type<float>(_803) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _920 = fma(_912, _881, _847);
    float _922 = fma(_912, _885, _831);
    float _924 = fma(_914, _881, _843);
    float _926 = fma(_914, _885, _859);
    float _928 = fma(_918, _881, _849);
    float _930 = -_747;
    float _932 = _591 + _930;
    float _934 = fma(_901, _885, _829);
    float _936 = fma(_918, _885, _861);
    float _938 = fma(_914, _932, _871);
    bool _940 = !_251;
    int _942 = _940 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _944 = fma(_901, _932, _873);
    float _946 = _711 * _711;
    float _948 = fma(_912, _932, _867);
    float _950 = fma(_918, _932, _875);
    float _952 = _255 ? as_type<float>(_942) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _954 = fma(_727, _727, _946);
    float _956 = -_761;
    float _958 = _591 + _956;
    float _960 = _515 * _887;
    float _962 = _954 + 1.0;
    float _964 = _952 + _928;
    float _966 = fma(_914, _958, _815);
    float _968 = fma(_918, _958, _823);
    float _970 = rsqrt(_962);
    bool _972 = !_251;
    int _974 = _972 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _976 = fma(_901, _958, _821);
    float _978 = fma(_912, _958, _877);
    bool _980 = !_251;
    int _982 = _980 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _984 = !_251;
    int _986 = _984 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _988 = 1.0 / _964;
    float _990 = _255 ? as_type<float>(_974) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _992 = _255 ? as_type<float>(_982) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _994 = _255 ? as_type<float>(_986) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _996 = _990 + _924;
    float _998 = _992 + _916;
    float _1000 = fma(_711, _970, _557);
    float _1002 = _994 + _920;
    float _1004 = fma(_727, _970, _549);
    float _1006 = -_970;
    float _1008 = _591 + _1006;
    float _1010 = _697 * _1000;
    float _1012 = _703 * _1000;
    float _1014 = _992 + _934;
    float _1016 = _996 * _988;
    float _1018 = _998 * _988;
    float _1020 = _1002 * _988;
    float _1022 = _689 * _1000;
    float _1024 = _699 * _1000;
    float _1026 = fma(_791, _1004, _1010);
    float _1028 = fma(_713, _1004, _1022);
    float _1030 = fma(_795, _1004, _1024);
    float _1032 = _735 * _735;
    float _1034 = fma(_775, _1004, _1012);
    float _1036 = _952 + _936;
    float _1038 = fma(_914, _1008, _1028);
    float _1040 = fma(_751, _751, _1032);
    float _1042 = fma(_901, _1008, _1026);
    float _1044 = fma(_912, _1008, _1030);
    float _1046 = fma(_918, _1008, _1034);
    float _1048 = _1040 + 1.0;
    float _1050 = 1.0 / _1036;
    float _1052 = _990 + _926;
    float _1054 = _994 + _922;
    float _1056 = _507 * _887;
    float _1058 = rsqrt(_1048);
    float _1060 = _1052 * _1050;
    float _1062 = _1014 * _1050;
    float _1064 = _1054 * _1050;
    float _1066 = _537 * _887;
    float _1068 = fma(_735, _1058, _557);
    float _1070 = fma(_751, _1058, _549);
    float _1072 = -_1058;
    float _1074 = _591 + _1072;
    float _1076 = _699 * _1068;
    float _1078 = _689 * _1068;
    float _1080 = _697 * _1068;
    float _1082 = _703 * _1068;
    float _1084 = fma(_795, _1070, _1076);
    float _1086 = fma(_713, _1070, _1078);
    float _1088 = fma(_791, _1070, _1080);
    float _1090 = fma(_775, _1070, _1082);
    float _1092 = fma(_912, _1074, _1084);
    float _1094 = _745 * _745;
    float _1096 = fma(_901, _1074, _1088);
    float _1098 = fma(_914, _1074, _1086);
    float _1100 = fma(_918, _1074, _1090);
    float _1102 = fma(_737, _737, _1094);
    float _1104 = _771 * _771;
    float _1106 = _1102 + 1.0;
    float _1108 = fma(_757, _757, _1104);
    float _1110 = rsqrt(_1106);
    float _1112 = _1108 + 1.0;
    float _1114 = rsqrt(_1112);
    float _1116 = fma(_745, _1110, _557);
    float _1118 = fma(_737, _1110, _549);
    float _1120 = -_1110;
    float _1122 = _591 + _1120;
    float _1124 = _699 * _1116;
    float _1126 = _703 * _1116;
    float _1128 = fma(_771, _1114, _557);
    float _1130 = fma(_757, _1114, _549);
    float3 _8509 = float3(_960, _1066, float(int(_910)));
    float3 _8513 = select(_8509, float3(0.0), isnan(_8509));
    float _1132 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _8513.xy, uint(rint(_8513.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _8513.xy, uint(rint(_8513.z))).x;
    float _1134 = -_1114;
    float _1136 = _591 + _1134;
    float _1138 = _689 * _1116;
    float _1140 = _689 * _1128;
    float _1142 = _697 * _1116;
    float _1144 = _699 * _1128;
    float _1146 = _697 * _1128;
    float _1148 = _703 * _1128;
    float _1150 = fma(_713, _1118, _1138);
    float _1152 = fma(_713, _1130, _1140);
    float _1154 = fma(_791, _1118, _1142);
    float _1156 = fma(_795, _1118, _1124);
    float _1158 = _952 + _950;
    float _1160 = fma(_775, _1118, _1126);
    float _1162 = fma(_795, _1130, _1144);
    float _1164 = fma(_791, _1130, _1146);
    float _1166 = fma(_775, _1130, _1148);
    float _1168 = fma(_914, _1122, _1150);
    float _1170 = fma(_914, _1136, _1152);
    float _1172 = _952 + _968;
    float _1174 = fma(_901, _1122, _1154);
    float _1176 = fma(_912, _1122, _1156);
    float _1178 = fma(_918, _1122, _1160);
    float _1180 = fma(_912, _1136, _1162);
    float _1182 = fma(_918, _1136, _1166);
    float _1184 = _990 + _938;
    float _1186 = _952 + _1046;
    float _1188 = _952 + _1100;
    float _1190 = _952 + _1178;
    float _1192 = 1.0 / _1172;
    float _1194 = _952 + _1182;
    float _1196 = fma(_901, _1136, _1164);
    float _1198 = _992 + _944;
    float _1200 = _992 + _976;
    float _1202 = _992 + _1042;
    float _1204 = _992 + _1096;
    float _1206 = _992 + _1174;
    float _1208 = 1.0 / _1158;
    float _1210 = _992 + _1196;
    float _1212 = _990 + _966;
    float _1214 = _994 + _978;
    float _1216 = _990 + _1038;
    float _1218 = _990 + _1098;
    float _1220 = _990 + _1168;
    float _1222 = _990 + _1170;
    float _1224 = 1.0 / _1186;
    float _1226 = _1200 * _1192;
    float _1228 = _994 + _948;
    float _1230 = _994 + _1044;
    float _1232 = _994 + _1092;
    float _1234 = _994 + _1176;
    float _1236 = _1212 * _1192;
    float _1238 = _1214 * _1192;
    float _1240 = 1.0 / _1188;
    float _1242 = _994 + _1180;
    float _1244 = _1184 * _1208;
    float _1246 = _1198 * _1208;
    float _1248 = _1228 * _1208;
    float _1250 = fma(_1016, 0.5, 0.5);
    float _1252 = 1.0 / _1190;
    float _1254 = _1216 * _1224;
    float _1256 = _1202 * _1224;
    float _1258 = _1230 * _1224;
    float _1260 = fma(_1018, -0.5, 0.5);
    float _1262 = fma(_1020, 0.5, 0.5);
    float _1264 = fma(_1236, 0.5, 0.5);
    float _1266 = fma(_1238, 0.5, 0.5);
    float _1268 = 1.0 / _1194;
    float _1270 = _1218 * _1240;
    float _1272 = _1204 * _1240;
    float _1274 = _1232 * _1240;
    float _1276 = fma(_1062, -0.5, 0.5);
    float _1278 = fma(_1064, 0.5, 0.5);
    float _1280 = fma(_1246, -0.5, 0.5);
    float _1282 = fma(_1248, 0.5, 0.5);
    float _1284 = _1220 * _1252;
    float _1286 = _1206 * _1252;
    float _1288 = _1234 * _1252;
    float _1290 = fma(_1060, 0.5, 0.5);
    float _1292 = fma(_1254, 0.5, 0.5);
    float _1294 = fma(_1226, -0.5, 0.5);
    float _1296 = fma(_1256, -0.5, 0.5);
    float _1298 = fma(_1258, 0.5, 0.5);
    float _1300 = _1222 * _1268;
    float _1302 = _1210 * _1268;
    float _1304 = _1242 * _1268;
    float _1306 = fma(_1244, 0.5, 0.5);
    float _1308 = fma(_1270, 0.5, 0.5);
    float _1310 = fma(_1272, -0.5, 0.5);
    float _1312 = fma(_1274, 0.5, 0.5);
    float _1314 = fma(_1284, 0.5, 0.5);
    float _1316 = fma(_1286, -0.5, 0.5);
    float _1318 = fma(_1288, 0.5, 0.5);
    float _1320 = fma(_1300, 0.5, 0.5);
    float _1322 = fma(_1302, -0.5, 0.5);
    float _1324 = fma(_1304, 0.5, 0.5);
    float _1326 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1328 = -_1250;
    float _1330 = _960 + _1328;
    float _1332 = -_1260;
    float _1334 = _1066 + _1332;
    float _1336 = -_1262;
    float _1338 = _1056 + _1336;
    float _1340 = _1330 * _1326;
    float _1342 = _1334 * _1326;
    float _1344 = _1338 * _1326;
    float _1346 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1348 = -_1290;
    float _1350 = _960 + _1348;
    float _1352 = -_1276;
    float _1354 = _1066 + _1352;
    float _1356 = -_1278;
    float _1358 = _1056 + _1356;
    float _1360 = -_1282;
    float _1362 = _1056 + _1360;
    float _1364 = _1350 * _1346;
    float _1366 = _1354 * _1346;
    float _1368 = _1358 * _1346;
    float _1370 = -_1294;
    float _1372 = _1066 + _1370;
    float _1374 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1376 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1378 = -_1306;
    float _1380 = _960 + _1378;
    float _1382 = -_1280;
    float _1384 = _1066 + _1382;
    float _1386 = -_1264;
    float _1388 = _960 + _1386;
    float _1390 = -_1266;
    float _1392 = _1056 + _1390;
    float _1394 = _1380 * _1374;
    float _1396 = _1384 * _1374;
    float _1398 = _1362 * _1374;
    float _1400 = _1388 * _1376;
    float _1402 = _1372 * _1376;
    float _1404 = _1392 * _1376;
    float _1406 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1408 = -_1292;
    float _1410 = _960 + _1408;
    float _1412 = -_1296;
    float _1414 = _1066 + _1412;
    float _1416 = -_1298;
    float _1418 = _1056 + _1416;
    float _1420 = _1410 * _1406;
    float _1422 = _1414 * _1406;
    float _1424 = _1418 * _1406;
    float _1426 = -_1308;
    float _1428 = _960 + _1426;
    float _1430 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1432 = -_1310;
    float _1434 = _1066 + _1432;
    float _1436 = -_1312;
    float _1438 = _1056 + _1436;
    float _1440 = _1428 * _1430;
    float _1442 = _1434 * _1430;
    float _1444 = _1438 * _1430;
    float _1446 = -_1320;
    float _1448 = _960 + _1446;
    float _1450 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1452 = -_1322;
    float _1454 = _1066 + _1452;
    float _1456 = -_1324;
    float _1458 = _1056 + _1456;
    float _1460 = _1344 * 1.5;
    float _1462 = _1448 * _1450;
    float _1464 = _1454 * _1450;
    float _1466 = _1458 * _1450;
    float _1468 = -_1314;
    float _1470 = _960 + _1468;
    float _1472 = -_1316;
    float _1474 = _1066 + _1472;
    float _1476 = -_1318;
    float _1478 = _1056 + _1476;
    float _1480 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0500000007450580596923828125;
    float _1482 = _1470 * _1480;
    float _1484 = _1474 * _1480;
    float _1486 = _1478 * _1480;
    float _1488 = -_1056;
    float _1490 = _1488 + _1132;
    float _1492 = _1490 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1494 = precise::max(_1492, _1460);
    float _1496 = precise::min(0.0, _1494);
    bool _1498 = _1496 != _1492;
    bool _1500 = isnan(_1496);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(_1492);
    bool _1506 = _1502 || _1504;
    bool _1508 = !_1506;
    float _2120;
    if (!_1508)
    {
        float _1510 = _960 + _1340;
        float _1512 = _1066 + _1342;
        float3 _9055 = float3(_1510, _1512, float(int(_910)));
        float3 _9057 = select(_9055, float3(0.0), isnan(_9055));
        float _1514 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9057.xy, uint(rint(_9057.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9057.xy, uint(rint(_9057.z))).x;
        float _1516 = _1056 + _1344;
        float _1518 = _1344 * 3.0;
        float _1520 = -_1516;
        float _1522 = _1520 + _1514;
        float _1524 = _1522 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1526 = precise::max(_1524, _1518);
        float _1528 = precise::min(0.0, _1526);
        bool _1530 = _1528 != _1524;
        bool _1532 = isnan(_1528);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan(_1524);
        bool _1538 = _1534 || _1536;
        bool _1540 = !_1538;
        if (!_1540)
        {
            float _1542 = fma(_1340, 2.0, _960);
            float _1544 = fma(_1342, 2.0, _1066);
            float3 _9110 = float3(_1542, _1544, float(int(_910)));
            float3 _9112 = select(_9110, float3(0.0), isnan(_9110));
            float _1546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9112.xy, uint(rint(_9112.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9112.xy, uint(rint(_9112.z))).x;
            float _1548 = fma(_1344, 2.0, _1056);
            float _1550 = _1344 * 4.5;
            float _1552 = -_1548;
            float _1554 = _1552 + _1546;
            float _1556 = _1554 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1558 = precise::max(_1556, _1550);
            float _1560 = precise::min(0.0, _1558);
            bool _1562 = _1560 != _1556;
            bool _1564 = isnan(_1560);
            bool _1566 = _1562 || _1564;
            bool _1568 = isnan(_1556);
            bool _1570 = _1566 || _1568;
            bool _1572 = !_1570;
            if (!_1572)
            {
                float _1574 = fma(_1340, 3.0, _960);
                float _1576 = fma(_1342, 3.0, _1066);
                float3 _9165 = float3(_1574, _1576, float(int(_910)));
                float3 _9167 = select(_9165, float3(0.0), isnan(_9165));
                float _1578 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9167.xy, uint(rint(_9167.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9167.xy, uint(rint(_9167.z))).x;
                float _1580 = fma(_1344, 3.0, _1056);
                float _1582 = _1344 * 6.0;
                float _1584 = -_1580;
                float _1586 = _1584 + _1578;
                float _1588 = _1586 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1590 = precise::max(_1588, _1582);
                float _1592 = precise::min(0.0, _1590);
                bool _1594 = _1592 != _1588;
                bool _1596 = isnan(_1592);
                bool _1598 = _1594 || _1596;
                bool _1600 = isnan(_1588);
                bool _1602 = _1598 || _1600;
                bool _1604 = !_1602;
                if (!_1604)
                {
                    float _1606 = fma(_1340, 4.0, _960);
                    float _1608 = fma(_1342, 4.0, _1066);
                    float3 _9221 = float3(_1606, _1608, float(int(_910)));
                    float3 _9223 = select(_9221, float3(0.0), isnan(_9221));
                    float _1610 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9223.xy, uint(rint(_9223.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9223.xy, uint(rint(_9223.z))).x;
                    float _1612 = fma(_1344, 4.0, _1056);
                    float _1614 = _1344 * 7.5;
                    float _1616 = -_1612;
                    float _1618 = _1616 + _1610;
                    float _1620 = _1618 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1622 = precise::max(_1620, _1614);
                    float _1624 = precise::min(0.0, _1622);
                    bool _1626 = _1624 != _1620;
                    bool _1628 = isnan(_1624);
                    bool _1630 = _1626 || _1628;
                    bool _1632 = isnan(_1620);
                    bool _1634 = _1630 || _1632;
                    bool _1636 = !_1634;
                    if (!_1636)
                    {
                        float _1638 = fma(_1340, 5.0, _960);
                        float _1640 = fma(_1342, 5.0, _1066);
                        float3 _9277 = float3(_1638, _1640, float(int(_910)));
                        float3 _9279 = select(_9277, float3(0.0), isnan(_9277));
                        float _1642 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9279.xy, uint(rint(_9279.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9279.xy, uint(rint(_9279.z))).x;
                        float _1644 = fma(_1344, 5.0, _1056);
                        float _1646 = _1344 * 9.0;
                        float _1648 = -_1644;
                        float _1650 = _1648 + _1642;
                        float _1652 = _1650 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1654 = precise::max(_1652, _1646);
                        float _1656 = precise::min(0.0, _1654);
                        bool _1658 = _1656 != _1652;
                        bool _1660 = isnan(_1656);
                        bool _1662 = _1658 || _1660;
                        bool _1664 = isnan(_1652);
                        bool _1666 = _1662 || _1664;
                        bool _1668 = !_1666;
                        if (!_1668)
                        {
                            float _1670 = fma(_1340, 6.0, _960);
                            float _1672 = fma(_1342, 6.0, _1066);
                            float3 _9332 = float3(_1670, _1672, float(int(_910)));
                            float3 _9334 = select(_9332, float3(0.0), isnan(_9332));
                            float _1674 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9334.xy, uint(rint(_9334.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9334.xy, uint(rint(_9334.z))).x;
                            float _1676 = fma(_1344, 6.0, _1056);
                            float _1678 = _1344 * 10.5;
                            float _1680 = -_1676;
                            float _1682 = _1680 + _1674;
                            float _1684 = _1682 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1686 = precise::max(_1684, _1678);
                            float _1688 = precise::min(0.0, _1686);
                            bool _1690 = _1688 != _1684;
                            bool _1692 = isnan(_1688);
                            bool _1694 = _1690 || _1692;
                            bool _1696 = isnan(_1684);
                            bool _1698 = _1694 || _1696;
                            bool _1700 = !_1698;
                            if (!_1700)
                            {
                                float _1702 = fma(_1340, 7.0, _960);
                                float _1704 = fma(_1342, 7.0, _1066);
                                float3 _9388 = float3(_1702, _1704, float(int(_910)));
                                float3 _9390 = select(_9388, float3(0.0), isnan(_9388));
                                float _1706 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9390.xy, uint(rint(_9390.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9390.xy, uint(rint(_9390.z))).x;
                                float _1708 = fma(_1344, 7.0, _1056);
                                float _1710 = _1344 * 12.0;
                                float _1712 = -_1708;
                                float _1714 = _1712 + _1706;
                                float _1716 = _1714 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1718 = precise::max(_1716, _1710);
                                float _1720 = precise::min(0.0, _1718);
                                bool _1722 = _1720 != _1716;
                                bool _1724 = isnan(_1720);
                                bool _1726 = _1722 || _1724;
                                bool _1728 = isnan(_1716);
                                bool _1730 = _1726 || _1728;
                                bool _1732 = !_1730;
                                if (!_1732)
                                {
                                    float _1734 = fma(_1340, 8.0, _960);
                                    float _1736 = fma(_1342, 8.0, _1066);
                                    float3 _9444 = float3(_1734, _1736, float(int(_910)));
                                    float3 _9446 = select(_9444, float3(0.0), isnan(_9444));
                                    float _1738 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9446.xy, uint(rint(_9446.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9446.xy, uint(rint(_9446.z))).x;
                                    float _1740 = fma(_1344, 8.0, _1056);
                                    float _1742 = _1344 * 13.5;
                                    float _1744 = -_1740;
                                    float _1746 = _1744 + _1738;
                                    float _1748 = _1746 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1750 = precise::max(_1748, _1742);
                                    float _1752 = precise::min(0.0, _1750);
                                    bool _1754 = _1752 != _1748;
                                    bool _1756 = isnan(_1752);
                                    bool _1758 = _1754 || _1756;
                                    bool _1760 = isnan(_1748);
                                    bool _1762 = _1758 || _1760;
                                    bool _1764 = !_1762;
                                    if (!_1764)
                                    {
                                        float _1766 = fma(_1340, 9.0, _960);
                                        float _1768 = fma(_1342, 9.0, _1066);
                                        float3 _9499 = float3(_1766, _1768, float(int(_910)));
                                        float3 _9501 = select(_9499, float3(0.0), isnan(_9499));
                                        float _1770 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9501.xy, uint(rint(_9501.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9501.xy, uint(rint(_9501.z))).x;
                                        float _1772 = fma(_1344, 9.0, _1056);
                                        float _1774 = _1344 * 15.0;
                                        float _1776 = -_1772;
                                        float _1778 = _1776 + _1770;
                                        float _1780 = _1778 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1782 = precise::max(_1780, _1774);
                                        float _1784 = precise::min(0.0, _1782);
                                        bool _1786 = _1784 != _1780;
                                        bool _1788 = isnan(_1784);
                                        bool _1790 = _1786 || _1788;
                                        bool _1792 = isnan(_1780);
                                        bool _1794 = _1790 || _1792;
                                        bool _1796 = !_1794;
                                        if (!_1796)
                                        {
                                            float _1798 = fma(_1340, 10.0, _960);
                                            float _1800 = fma(_1342, 10.0, _1066);
                                            float3 _9555 = float3(_1798, _1800, float(int(_910)));
                                            float3 _9557 = select(_9555, float3(0.0), isnan(_9555));
                                            float _1802 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9557.xy, uint(rint(_9557.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9557.xy, uint(rint(_9557.z))).x;
                                            float _1804 = fma(_1344, 10.0, _1056);
                                            float _1806 = _1344 * 16.5;
                                            float _1808 = -_1804;
                                            float _1810 = _1808 + _1802;
                                            float _1812 = _1810 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1814 = precise::max(_1812, _1806);
                                            float _1816 = precise::min(0.0, _1814);
                                            bool _1818 = _1816 != _1812;
                                            bool _1820 = isnan(_1816);
                                            bool _1822 = _1818 || _1820;
                                            bool _1824 = isnan(_1812);
                                            bool _1826 = _1822 || _1824;
                                            bool _1828 = !_1826;
                                            if (!_1828)
                                            {
                                                float _1830 = fma(_1340, 11.0, _960);
                                                float _1832 = fma(_1342, 11.0, _1066);
                                                float3 _9611 = float3(_1830, _1832, float(int(_910)));
                                                float3 _9613 = select(_9611, float3(0.0), isnan(_9611));
                                                float _1834 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9613.xy, uint(rint(_9613.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9613.xy, uint(rint(_9613.z))).x;
                                                float _1836 = fma(_1344, 11.0, _1056);
                                                float _1838 = _1344 * 18.0;
                                                float _1840 = -_1836;
                                                float _1842 = _1840 + _1834;
                                                float _1844 = _1842 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1846 = precise::max(_1844, _1838);
                                                float _1848 = precise::min(0.0, _1846);
                                                bool _1850 = _1848 != _1844;
                                                bool _1852 = isnan(_1848);
                                                bool _1854 = _1850 || _1852;
                                                bool _1856 = isnan(_1844);
                                                bool _1858 = _1854 || _1856;
                                                bool _1860 = !_1858;
                                                if (!_1860)
                                                {
                                                    float _1862 = fma(_1340, 12.0, _960);
                                                    float _1864 = fma(_1342, 12.0, _1066);
                                                    float3 _9666 = float3(_1862, _1864, float(int(_910)));
                                                    float3 _9668 = select(_9666, float3(0.0), isnan(_9666));
                                                    float _1866 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9668.xy, uint(rint(_9668.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9668.xy, uint(rint(_9668.z))).x;
                                                    float _1868 = fma(_1344, 12.0, _1056);
                                                    float _1870 = _1344 * 19.5;
                                                    float _1872 = -_1868;
                                                    float _1874 = _1872 + _1866;
                                                    float _1876 = _1874 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1878 = precise::max(_1876, _1870);
                                                    float _1880 = precise::min(0.0, _1878);
                                                    bool _1882 = _1880 != _1876;
                                                    bool _1884 = isnan(_1880);
                                                    bool _1886 = _1882 || _1884;
                                                    bool _1888 = isnan(_1876);
                                                    bool _1890 = _1886 || _1888;
                                                    bool _1892 = !_1890;
                                                    if (!_1892)
                                                    {
                                                        float _1894 = fma(_1340, 13.0, _960);
                                                        float _1896 = fma(_1342, 13.0, _1066);
                                                        float3 _9722 = float3(_1894, _1896, float(int(_910)));
                                                        float3 _9724 = select(_9722, float3(0.0), isnan(_9722));
                                                        float _1898 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9724.xy, uint(rint(_9724.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9724.xy, uint(rint(_9724.z))).x;
                                                        float _1900 = fma(_1344, 13.0, _1056);
                                                        float _1902 = _1344 * 21.0;
                                                        float _1904 = -_1900;
                                                        float _1906 = _1904 + _1898;
                                                        float _1908 = _1906 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1910 = precise::max(_1908, _1902);
                                                        float _1912 = precise::min(0.0, _1910);
                                                        bool _1914 = _1912 != _1908;
                                                        bool _1916 = isnan(_1912);
                                                        bool _1918 = _1914 || _1916;
                                                        bool _1920 = isnan(_1908);
                                                        bool _1922 = _1918 || _1920;
                                                        bool _1924 = !_1922;
                                                        if (!_1924)
                                                        {
                                                            float _1926 = fma(_1340, 14.0, _960);
                                                            float _1928 = fma(_1342, 14.0, _1066);
                                                            float3 _9778 = float3(_1926, _1928, float(int(_910)));
                                                            float3 _9780 = select(_9778, float3(0.0), isnan(_9778));
                                                            float _1930 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9780.xy, uint(rint(_9780.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9780.xy, uint(rint(_9780.z))).x;
                                                            float _1932 = fma(_1344, 14.0, _1056);
                                                            float _1934 = _1344 * 22.5;
                                                            float _1936 = -_1932;
                                                            float _1938 = _1936 + _1930;
                                                            float _1940 = _1938 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1942 = precise::max(_1940, _1934);
                                                            float _1944 = precise::min(0.0, _1942);
                                                            bool _1946 = _1944 != _1940;
                                                            bool _1948 = isnan(_1944);
                                                            bool _1950 = _1946 || _1948;
                                                            bool _1952 = isnan(_1940);
                                                            bool _1954 = _1950 || _1952;
                                                            bool _1956 = !_1954;
                                                            if (!_1956)
                                                            {
                                                                float _1958 = fma(_1340, 15.0, _960);
                                                                float _1960 = fma(_1342, 15.0, _1066);
                                                                float3 _9833 = float3(_1958, _1960, float(int(_910)));
                                                                float3 _9835 = select(_9833, float3(0.0), isnan(_9833));
                                                                float _1962 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9835.xy, uint(rint(_9835.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9835.xy, uint(rint(_9835.z))).x;
                                                                float _1964 = fma(_1344, 15.0, _1056);
                                                                float _1966 = _1344 * 24.0;
                                                                float _1968 = -_1964;
                                                                float _1970 = _1968 + _1962;
                                                                float _1972 = _1970 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _1974 = precise::max(_1972, _1966);
                                                                float _1976 = precise::min(0.0, _1974);
                                                                bool _1978 = _1976 != _1972;
                                                                bool _1980 = isnan(_1976);
                                                                bool _1982 = _1978 || _1980;
                                                                bool _1984 = isnan(_1972);
                                                                bool _1986 = _1982 || _1984;
                                                                bool _1988 = !_1986;
                                                                if (!_1988)
                                                                {
                                                                    float _1990 = fma(_1340, 16.0, _960);
                                                                    float _1992 = fma(_1342, 16.0, _1066);
                                                                    float3 _9889 = float3(_1990, _1992, float(int(_910)));
                                                                    float3 _9891 = select(_9889, float3(0.0), isnan(_9889));
                                                                    float _1994 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9891.xy, uint(rint(_9891.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9891.xy, uint(rint(_9891.z))).x;
                                                                    float _1996 = fma(_1344, 16.0, _1056);
                                                                    float _1998 = _1344 * 25.5;
                                                                    float _2000 = -_1996;
                                                                    float _2002 = _2000 + _1994;
                                                                    float _2004 = _2002 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _2006 = precise::max(_2004, _1998);
                                                                    float _2008 = precise::min(0.0, _2006);
                                                                    bool _2010 = _2008 != _2004;
                                                                    bool _2012 = isnan(_2008);
                                                                    bool _2014 = _2010 || _2012;
                                                                    bool _2016 = isnan(_2004);
                                                                    bool _2018 = _2014 || _2016;
                                                                    bool _2020 = !_2018;
                                                                    if (!_2020)
                                                                    {
                                                                        float _2022 = fma(_1340, 17.0, _960);
                                                                        float _2024 = fma(_1342, 17.0, _1066);
                                                                        float3 _9945 = float3(_2022, _2024, float(int(_910)));
                                                                        float3 _9947 = select(_9945, float3(0.0), isnan(_9945));
                                                                        float _2026 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _9947.xy, uint(rint(_9947.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _9947.xy, uint(rint(_9947.z))).x;
                                                                        float _2028 = fma(_1344, 17.0, _1056);
                                                                        float _2030 = _1344 * 27.0;
                                                                        float _2032 = -_2028;
                                                                        float _2034 = _2032 + _2026;
                                                                        float _2036 = _2034 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _2038 = precise::max(_2036, _2030);
                                                                        float _2040 = precise::min(0.0, _2038);
                                                                        bool _2042 = _2040 != _2036;
                                                                        bool _2044 = isnan(_2040);
                                                                        bool _2046 = _2042 || _2044;
                                                                        bool _2048 = isnan(_2036);
                                                                        bool _2050 = _2046 || _2048;
                                                                        bool _2052 = !_2050;
                                                                        if (!_2052)
                                                                        {
                                                                            float _2054 = fma(_1340, 18.0, _960);
                                                                            float _2056 = fma(_1342, 18.0, _1066);
                                                                            float3 _10000 = float3(_2054, _2056, float(int(_910)));
                                                                            float3 _10002 = select(_10000, float3(0.0), isnan(_10000));
                                                                            float _2058 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10002.xy, uint(rint(_10002.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10002.xy, uint(rint(_10002.z))).x;
                                                                            float _2060 = fma(_1344, 18.0, _1056);
                                                                            float _2062 = fma(_1344, 28.5, -1.0);
                                                                            float _2064 = -_2060;
                                                                            float _2066 = _2064 + _2058;
                                                                            float _2068 = _2066 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _2070 = precise::max(_2068, _2062);
                                                                            float _2072 = precise::min(0.0, _2070);
                                                                            bool _2074 = _2072 != _2068;
                                                                            bool _2076 = isnan(_2072);
                                                                            bool _2078 = _2074 || _2076;
                                                                            bool _2080 = isnan(_2068);
                                                                            bool _2082 = _2078 || _2080;
                                                                            bool _2084 = !_2082;
                                                                            if (!_2084)
                                                                            {
                                                                                float _2086 = fma(_1342, 19.0, _1066);
                                                                                float _2088 = fma(_1340, 19.0, _960);
                                                                                float3 _10056 = float3(_2088, _2086, float(int(_910)));
                                                                                float3 _10058 = select(_10056, float3(0.0), isnan(_10056));
                                                                                float _2090 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10058.xy, uint(rint(_10058.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10058.xy, uint(rint(_10058.z))).x;
                                                                                float _2092 = fma(_1344, 19.0, _1056);
                                                                                float _2094 = -_2092;
                                                                                float _2096 = _2094 + _2090;
                                                                                float _2098 = fma(_1344, 30.0, -1.0);
                                                                                float _2100 = _2096 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _2102 = precise::max(_2100, _2098);
                                                                                float _2104 = precise::min(0.0, _2102);
                                                                                bool _2106 = _2104 != _2100;
                                                                                bool _2108 = isnan(_2104);
                                                                                bool _2110 = _2106 || _2108;
                                                                                bool _2112 = isnan(_2100);
                                                                                bool _2114 = _2110 || _2112;
                                                                                float _2116 = _2100;
                                                                                if (_2114)
                                                                                {
                                                                                    _2116 = 0.0;
                                                                                }
                                                                                float _2118 = _2116;
                                                                                _2120 = _2118;
                                                                                _2122 = _2114;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2122)
    {
        _2120 = 1.0;
    }
    _2122 = false;
    float _2124 = _2120;
    float _2126 = _1368 * 1.5;
    float _2128 = precise::max(_1492, _2126);
    float _2130 = precise::min(0.0, _2128);
    bool _2132 = _2130 != _1492;
    bool _2134 = isnan(_2130);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(_1492);
    bool _2140 = _2136 || _2138;
    bool _2142 = !_2140;
    float _2144 = _2124;
    if (!_2142)
    {
        float _2146 = _1066 + _1366;
        float _2148 = _960 + _1364;
        float3 _10163 = float3(_2148, _2146, float(int(_910)));
        float3 _10165 = select(_10163, float3(0.0), isnan(_10163));
        float _2150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10165.xy, uint(rint(_10165.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10165.xy, uint(rint(_10165.z))).x;
        float _2152 = _1056 + _1368;
        float _2154 = _1368 * 3.0;
        float _2156 = -_2152;
        float _2158 = _2156 + _2150;
        float _2160 = _2158 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2162 = precise::max(_2160, _2154);
        float _2164 = precise::min(0.0, _2162);
        bool _2166 = _2164 != _2160;
        bool _2168 = isnan(_2164);
        bool _2170 = _2166 || _2168;
        bool _2172 = isnan(_2160);
        bool _2174 = _2170 || _2172;
        bool _2176 = !_2174;
        if (!_2176)
        {
            float _2178 = fma(_1366, 2.0, _1066);
            float _2180 = fma(_1364, 2.0, _960);
            float3 _10217 = float3(_2180, _2178, float(int(_910)));
            float3 _10219 = select(_10217, float3(0.0), isnan(_10217));
            float _2182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10219.xy, uint(rint(_10219.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10219.xy, uint(rint(_10219.z))).x;
            float _2184 = fma(_1368, 2.0, _1056);
            float _2186 = _1368 * 4.5;
            float _2188 = -_2184;
            float _2190 = _2188 + _2182;
            float _2192 = _2190 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2194 = precise::max(_2192, _2186);
            float _2196 = precise::min(0.0, _2194);
            bool _2198 = _2196 != _2192;
            bool _2200 = isnan(_2196);
            bool _2202 = _2198 || _2200;
            bool _2204 = isnan(_2192);
            bool _2206 = _2202 || _2204;
            bool _2208 = !_2206;
            if (!_2208)
            {
                float _2210 = fma(_1366, 3.0, _1066);
                float _2212 = fma(_1364, 3.0, _960);
                float3 _10271 = float3(_2212, _2210, float(int(_910)));
                float3 _10273 = select(_10271, float3(0.0), isnan(_10271));
                float _2214 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10273.xy, uint(rint(_10273.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10273.xy, uint(rint(_10273.z))).x;
                float _2216 = fma(_1368, 3.0, _1056);
                float _2218 = _1368 * 6.0;
                float _2220 = -_2216;
                float _2222 = _2220 + _2214;
                float _2224 = _2222 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2226 = precise::max(_2224, _2218);
                float _2228 = precise::min(0.0, _2226);
                bool _2230 = _2228 != _2224;
                bool _2232 = isnan(_2228);
                bool _2234 = _2230 || _2232;
                bool _2236 = isnan(_2224);
                bool _2238 = _2234 || _2236;
                bool _2240 = !_2238;
                if (!_2240)
                {
                    float _2242 = fma(_1366, 4.0, _1066);
                    float _2244 = fma(_1364, 4.0, _960);
                    float3 _10325 = float3(_2244, _2242, float(int(_910)));
                    float3 _10327 = select(_10325, float3(0.0), isnan(_10325));
                    float _2246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10327.xy, uint(rint(_10327.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10327.xy, uint(rint(_10327.z))).x;
                    float _2248 = fma(_1368, 4.0, _1056);
                    float _2250 = _1368 * 7.5;
                    float _2252 = -_2248;
                    float _2254 = _2252 + _2246;
                    float _2256 = _2254 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2258 = precise::max(_2256, _2250);
                    float _2260 = precise::min(0.0, _2258);
                    bool _2262 = _2260 != _2256;
                    bool _2264 = isnan(_2260);
                    bool _2266 = _2262 || _2264;
                    bool _2268 = isnan(_2256);
                    bool _2270 = _2266 || _2268;
                    bool _2272 = !_2270;
                    if (!_2272)
                    {
                        float _2274 = fma(_1366, 5.0, _1066);
                        float _2276 = fma(_1364, 5.0, _960);
                        float3 _10379 = float3(_2276, _2274, float(int(_910)));
                        float3 _10381 = select(_10379, float3(0.0), isnan(_10379));
                        float _2278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10381.xy, uint(rint(_10381.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10381.xy, uint(rint(_10381.z))).x;
                        float _2280 = fma(_1368, 5.0, _1056);
                        float _2282 = _1368 * 9.0;
                        float _2284 = -_2280;
                        float _2286 = _2284 + _2278;
                        float _2288 = _2286 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2290 = precise::max(_2288, _2282);
                        float _2292 = precise::min(0.0, _2290);
                        bool _2294 = _2292 != _2288;
                        bool _2296 = isnan(_2292);
                        bool _2298 = _2294 || _2296;
                        bool _2300 = isnan(_2288);
                        bool _2302 = _2298 || _2300;
                        bool _2304 = !_2302;
                        if (!_2304)
                        {
                            float _2306 = fma(_1366, 6.0, _1066);
                            float _2308 = fma(_1364, 6.0, _960);
                            float3 _10433 = float3(_2308, _2306, float(int(_910)));
                            float3 _10435 = select(_10433, float3(0.0), isnan(_10433));
                            float _2310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10435.xy, uint(rint(_10435.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10435.xy, uint(rint(_10435.z))).x;
                            float _2312 = fma(_1368, 6.0, _1056);
                            float _2314 = _1368 * 10.5;
                            float _2316 = -_2312;
                            float _2318 = _2316 + _2310;
                            float _2320 = _2318 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2322 = precise::max(_2320, _2314);
                            float _2324 = precise::min(0.0, _2322);
                            bool _2326 = _2324 != _2320;
                            bool _2328 = isnan(_2324);
                            bool _2330 = _2326 || _2328;
                            bool _2332 = isnan(_2320);
                            bool _2334 = _2330 || _2332;
                            bool _2336 = !_2334;
                            if (!_2336)
                            {
                                float _2338 = fma(_1366, 7.0, _1066);
                                float _2340 = fma(_1364, 7.0, _960);
                                float3 _10487 = float3(_2340, _2338, float(int(_910)));
                                float3 _10489 = select(_10487, float3(0.0), isnan(_10487));
                                float _2342 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10489.xy, uint(rint(_10489.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10489.xy, uint(rint(_10489.z))).x;
                                float _2344 = fma(_1368, 7.0, _1056);
                                float _2346 = _1368 * 12.0;
                                float _2348 = -_2344;
                                float _2350 = _2348 + _2342;
                                float _2352 = _2350 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2354 = precise::max(_2352, _2346);
                                float _2356 = precise::min(0.0, _2354);
                                bool _2358 = _2356 != _2352;
                                bool _2360 = isnan(_2356);
                                bool _2362 = _2358 || _2360;
                                bool _2364 = isnan(_2352);
                                bool _2366 = _2362 || _2364;
                                bool _2368 = !_2366;
                                if (!_2368)
                                {
                                    float _2370 = fma(_1366, 8.0, _1066);
                                    float _2372 = fma(_1364, 8.0, _960);
                                    float3 _10541 = float3(_2372, _2370, float(int(_910)));
                                    float3 _10543 = select(_10541, float3(0.0), isnan(_10541));
                                    float _2374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10543.xy, uint(rint(_10543.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10543.xy, uint(rint(_10543.z))).x;
                                    float _2376 = fma(_1368, 8.0, _1056);
                                    float _2378 = _1368 * 13.5;
                                    float _2380 = -_2376;
                                    float _2382 = _2380 + _2374;
                                    float _2384 = _2382 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _2386 = precise::max(_2384, _2378);
                                    float _2388 = precise::min(0.0, _2386);
                                    bool _2390 = _2388 != _2384;
                                    bool _2392 = isnan(_2388);
                                    bool _2394 = _2390 || _2392;
                                    bool _2396 = isnan(_2384);
                                    bool _2398 = _2394 || _2396;
                                    bool _2400 = !_2398;
                                    if (!_2400)
                                    {
                                        float _2402 = fma(_1366, 9.0, _1066);
                                        float _2404 = fma(_1364, 9.0, _960);
                                        float3 _10595 = float3(_2404, _2402, float(int(_910)));
                                        float3 _10597 = select(_10595, float3(0.0), isnan(_10595));
                                        float _2406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10597.xy, uint(rint(_10597.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10597.xy, uint(rint(_10597.z))).x;
                                        float _2408 = fma(_1368, 9.0, _1056);
                                        float _2410 = _1368 * 15.0;
                                        float _2412 = -_2408;
                                        float _2414 = _2412 + _2406;
                                        float _2416 = _2414 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2418 = precise::max(_2416, _2410);
                                        float _2420 = precise::min(0.0, _2418);
                                        bool _2422 = _2420 != _2416;
                                        bool _2424 = isnan(_2420);
                                        bool _2426 = _2422 || _2424;
                                        bool _2428 = isnan(_2416);
                                        bool _2430 = _2426 || _2428;
                                        bool _2432 = !_2430;
                                        if (!_2432)
                                        {
                                            float _2434 = fma(_1366, 10.0, _1066);
                                            float _2436 = fma(_1364, 10.0, _960);
                                            float3 _10649 = float3(_2436, _2434, float(int(_910)));
                                            float3 _10651 = select(_10649, float3(0.0), isnan(_10649));
                                            float _2438 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10651.xy, uint(rint(_10651.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10651.xy, uint(rint(_10651.z))).x;
                                            float _2440 = fma(_1368, 10.0, _1056);
                                            float _2442 = _1368 * 16.5;
                                            float _2444 = -_2440;
                                            float _2446 = _2444 + _2438;
                                            float _2448 = _2446 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2450 = precise::max(_2448, _2442);
                                            float _2452 = precise::min(0.0, _2450);
                                            bool _2454 = _2452 != _2448;
                                            bool _2456 = isnan(_2452);
                                            bool _2458 = _2454 || _2456;
                                            bool _2460 = isnan(_2448);
                                            bool _2462 = _2458 || _2460;
                                            bool _2464 = !_2462;
                                            if (!_2464)
                                            {
                                                float _2466 = fma(_1366, 11.0, _1066);
                                                float _2468 = fma(_1364, 11.0, _960);
                                                float3 _10703 = float3(_2468, _2466, float(int(_910)));
                                                float3 _10705 = select(_10703, float3(0.0), isnan(_10703));
                                                float _2470 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10705.xy, uint(rint(_10705.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10705.xy, uint(rint(_10705.z))).x;
                                                float _2472 = fma(_1368, 11.0, _1056);
                                                float _2474 = _1368 * 18.0;
                                                float _2476 = -_2472;
                                                float _2478 = _2476 + _2470;
                                                float _2480 = _2478 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2482 = precise::max(_2480, _2474);
                                                float _2484 = precise::min(0.0, _2482);
                                                bool _2486 = _2484 != _2480;
                                                bool _2488 = isnan(_2484);
                                                bool _2490 = _2486 || _2488;
                                                bool _2492 = isnan(_2480);
                                                bool _2494 = _2490 || _2492;
                                                bool _2496 = !_2494;
                                                if (!_2496)
                                                {
                                                    float _2498 = fma(_1366, 12.0, _1066);
                                                    float _2500 = fma(_1364, 12.0, _960);
                                                    float3 _10757 = float3(_2500, _2498, float(int(_910)));
                                                    float3 _10759 = select(_10757, float3(0.0), isnan(_10757));
                                                    float _2502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10759.xy, uint(rint(_10759.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10759.xy, uint(rint(_10759.z))).x;
                                                    float _2504 = fma(_1368, 12.0, _1056);
                                                    float _2506 = _1368 * 19.5;
                                                    float _2508 = -_2504;
                                                    float _2510 = _2508 + _2502;
                                                    float _2512 = _2510 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2514 = precise::max(_2512, _2506);
                                                    float _2516 = precise::min(0.0, _2514);
                                                    bool _2518 = _2516 != _2512;
                                                    bool _2520 = isnan(_2516);
                                                    bool _2522 = _2518 || _2520;
                                                    bool _2524 = isnan(_2512);
                                                    bool _2526 = _2522 || _2524;
                                                    bool _2528 = !_2526;
                                                    if (!_2528)
                                                    {
                                                        float _2530 = fma(_1366, 13.0, _1066);
                                                        float _2532 = fma(_1364, 13.0, _960);
                                                        float3 _10811 = float3(_2532, _2530, float(int(_910)));
                                                        float3 _10813 = select(_10811, float3(0.0), isnan(_10811));
                                                        float _2534 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10813.xy, uint(rint(_10813.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10813.xy, uint(rint(_10813.z))).x;
                                                        float _2536 = fma(_1368, 13.0, _1056);
                                                        float _2538 = _1368 * 21.0;
                                                        float _2540 = -_2536;
                                                        float _2542 = _2540 + _2534;
                                                        float _2544 = _2542 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2546 = precise::max(_2544, _2538);
                                                        float _2548 = precise::min(0.0, _2546);
                                                        bool _2550 = _2548 != _2544;
                                                        bool _2552 = isnan(_2548);
                                                        bool _2554 = _2550 || _2552;
                                                        bool _2556 = isnan(_2544);
                                                        bool _2558 = _2554 || _2556;
                                                        bool _2560 = !_2558;
                                                        if (!_2560)
                                                        {
                                                            float _2562 = fma(_1366, 14.0, _1066);
                                                            float _2564 = fma(_1364, 14.0, _960);
                                                            float3 _10865 = float3(_2564, _2562, float(int(_910)));
                                                            float3 _10867 = select(_10865, float3(0.0), isnan(_10865));
                                                            float _2566 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10867.xy, uint(rint(_10867.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10867.xy, uint(rint(_10867.z))).x;
                                                            float _2568 = fma(_1368, 14.0, _1056);
                                                            float _2570 = _1368 * 22.5;
                                                            float _2572 = -_2568;
                                                            float _2574 = _2572 + _2566;
                                                            float _2576 = _2574 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2578 = precise::max(_2576, _2570);
                                                            float _2580 = precise::min(0.0, _2578);
                                                            bool _2582 = _2580 != _2576;
                                                            bool _2584 = isnan(_2580);
                                                            bool _2586 = _2582 || _2584;
                                                            bool _2588 = isnan(_2576);
                                                            bool _2590 = _2586 || _2588;
                                                            bool _2592 = !_2590;
                                                            if (!_2592)
                                                            {
                                                                float _2594 = fma(_1366, 15.0, _1066);
                                                                float _2596 = fma(_1364, 15.0, _960);
                                                                float3 _10919 = float3(_2596, _2594, float(int(_910)));
                                                                float3 _10921 = select(_10919, float3(0.0), isnan(_10919));
                                                                float _2598 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10921.xy, uint(rint(_10921.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10921.xy, uint(rint(_10921.z))).x;
                                                                float _2600 = fma(_1368, 15.0, _1056);
                                                                float _2602 = _1368 * 24.0;
                                                                float _2604 = -_2600;
                                                                float _2606 = _2604 + _2598;
                                                                float _2608 = _2606 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _2610 = precise::max(_2608, _2602);
                                                                float _2612 = precise::min(0.0, _2610);
                                                                bool _2614 = _2612 != _2608;
                                                                bool _2616 = isnan(_2612);
                                                                bool _2618 = _2614 || _2616;
                                                                bool _2620 = isnan(_2608);
                                                                bool _2622 = _2618 || _2620;
                                                                bool _2624 = !_2622;
                                                                if (!_2624)
                                                                {
                                                                    float _2626 = fma(_1366, 16.0, _1066);
                                                                    float _2628 = fma(_1364, 16.0, _960);
                                                                    float3 _10973 = float3(_2628, _2626, float(int(_910)));
                                                                    float3 _10975 = select(_10973, float3(0.0), isnan(_10973));
                                                                    float _2630 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _10975.xy, uint(rint(_10975.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _10975.xy, uint(rint(_10975.z))).x;
                                                                    float _2632 = fma(_1368, 16.0, _1056);
                                                                    float _2634 = _1368 * 25.5;
                                                                    float _2636 = -_2632;
                                                                    float _2638 = _2636 + _2630;
                                                                    float _2640 = _2638 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _2642 = precise::max(_2640, _2634);
                                                                    float _2644 = precise::min(0.0, _2642);
                                                                    bool _2646 = _2644 != _2640;
                                                                    bool _2648 = isnan(_2644);
                                                                    bool _2650 = _2646 || _2648;
                                                                    bool _2652 = isnan(_2640);
                                                                    bool _2654 = _2650 || _2652;
                                                                    bool _2656 = !_2654;
                                                                    if (!_2656)
                                                                    {
                                                                        float _2658 = fma(_1366, 17.0, _1066);
                                                                        float _2660 = fma(_1364, 17.0, _960);
                                                                        float3 _11027 = float3(_2660, _2658, float(int(_910)));
                                                                        float3 _11029 = select(_11027, float3(0.0), isnan(_11027));
                                                                        float _2662 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11029.xy, uint(rint(_11029.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11029.xy, uint(rint(_11029.z))).x;
                                                                        float _2664 = fma(_1368, 17.0, _1056);
                                                                        float _2666 = _1368 * 27.0;
                                                                        float _2668 = -_2664;
                                                                        float _2670 = _2668 + _2662;
                                                                        float _2672 = _2670 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _2674 = precise::max(_2672, _2666);
                                                                        float _2676 = precise::min(0.0, _2674);
                                                                        bool _2678 = _2676 != _2672;
                                                                        bool _2680 = isnan(_2676);
                                                                        bool _2682 = _2678 || _2680;
                                                                        bool _2684 = isnan(_2672);
                                                                        bool _2686 = _2682 || _2684;
                                                                        bool _2688 = !_2686;
                                                                        if (!_2688)
                                                                        {
                                                                            float _2690 = fma(_1366, 18.0, _1066);
                                                                            float _2692 = fma(_1364, 18.0, _960);
                                                                            float3 _11081 = float3(_2692, _2690, float(int(_910)));
                                                                            float3 _11083 = select(_11081, float3(0.0), isnan(_11081));
                                                                            float _2694 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11083.xy, uint(rint(_11083.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11083.xy, uint(rint(_11083.z))).x;
                                                                            float _2696 = fma(_1368, 18.0, _1056);
                                                                            float _2698 = fma(_1368, 28.5, -1.0);
                                                                            float _2700 = -_2696;
                                                                            float _2702 = _2700 + _2694;
                                                                            float _2704 = _2702 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _2706 = precise::max(_2704, _2698);
                                                                            float _2708 = precise::min(0.0, _2706);
                                                                            bool _2710 = _2708 != _2704;
                                                                            bool _2712 = isnan(_2708);
                                                                            bool _2714 = _2710 || _2712;
                                                                            bool _2716 = isnan(_2704);
                                                                            bool _2718 = _2714 || _2716;
                                                                            bool _2720 = !_2718;
                                                                            if (!_2720)
                                                                            {
                                                                                float _2722 = fma(_1366, 19.0, _1066);
                                                                                float _2724 = fma(_1364, 19.0, _960);
                                                                                float3 _11135 = float3(_2724, _2722, float(int(_910)));
                                                                                float3 _11137 = select(_11135, float3(0.0), isnan(_11135));
                                                                                float _2726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11137.xy, uint(rint(_11137.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11137.xy, uint(rint(_11137.z))).x;
                                                                                float _2728 = fma(_1368, 19.0, _1056);
                                                                                float _2730 = fma(_1368, 30.0, -1.0);
                                                                                float _2732 = -_2728;
                                                                                float _2734 = _2732 + _2726;
                                                                                float _2736 = _2734 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _2738 = precise::max(_2736, _2730);
                                                                                float _2740 = precise::min(0.0, _2738);
                                                                                bool _2742 = _2740 != _2736;
                                                                                bool _2744 = isnan(_2740);
                                                                                bool _2746 = _2742 || _2744;
                                                                                bool _2748 = isnan(_2736);
                                                                                bool _2750 = _2746 || _2748;
                                                                                _2752 = _2750;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2752)
    {
        float _2754 = _2124 + 1.0;
        _2144 = _2754;
    }
    _2752 = false;
    float _2756 = _2144;
    float _2758 = _1398 * 1.5;
    float _2760 = precise::max(_1492, _2758);
    float _2762 = precise::min(0.0, _2760);
    bool _2764 = _2762 != _1492;
    bool _2766 = isnan(_2762);
    bool _2768 = _2764 || _2766;
    bool _2770 = isnan(_1492);
    bool _2772 = _2768 || _2770;
    bool _2774 = !_2772;
    float _2776 = _2756;
    if (!_2774)
    {
        float _2778 = _1066 + _1396;
        float _2780 = _960 + _1394;
        float3 _11238 = float3(_2780, _2778, float(int(_910)));
        float3 _11240 = select(_11238, float3(0.0), isnan(_11238));
        float _2782 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11240.xy, uint(rint(_11240.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11240.xy, uint(rint(_11240.z))).x;
        float _2784 = _1056 + _1398;
        float _2786 = _1398 * 3.0;
        float _2788 = -_2784;
        float _2790 = _2788 + _2782;
        float _2792 = _2790 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _2794 = precise::max(_2792, _2786);
        float _2796 = precise::min(0.0, _2794);
        bool _2798 = _2796 != _2792;
        bool _2800 = isnan(_2796);
        bool _2802 = _2798 || _2800;
        bool _2804 = isnan(_2792);
        bool _2806 = _2802 || _2804;
        bool _2808 = !_2806;
        if (!_2808)
        {
            float _2810 = fma(_1396, 2.0, _1066);
            float _2812 = fma(_1394, 2.0, _960);
            float3 _11292 = float3(_2812, _2810, float(int(_910)));
            float3 _11294 = select(_11292, float3(0.0), isnan(_11292));
            float _2814 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11294.xy, uint(rint(_11294.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11294.xy, uint(rint(_11294.z))).x;
            float _2816 = fma(_1398, 2.0, _1056);
            float _2818 = _1398 * 4.5;
            float _2820 = -_2816;
            float _2822 = _2820 + _2814;
            float _2824 = _2822 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _2826 = precise::max(_2824, _2818);
            float _2828 = precise::min(0.0, _2826);
            bool _2830 = _2828 != _2824;
            bool _2832 = isnan(_2828);
            bool _2834 = _2830 || _2832;
            bool _2836 = isnan(_2824);
            bool _2838 = _2834 || _2836;
            bool _2840 = !_2838;
            if (!_2840)
            {
                float _2842 = fma(_1396, 3.0, _1066);
                float _2844 = fma(_1394, 3.0, _960);
                float3 _11346 = float3(_2844, _2842, float(int(_910)));
                float3 _11348 = select(_11346, float3(0.0), isnan(_11346));
                float _2846 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11348.xy, uint(rint(_11348.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11348.xy, uint(rint(_11348.z))).x;
                float _2848 = fma(_1398, 3.0, _1056);
                float _2850 = _1398 * 6.0;
                float _2852 = -_2848;
                float _2854 = _2852 + _2846;
                float _2856 = _2854 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _2858 = precise::max(_2856, _2850);
                float _2860 = precise::min(0.0, _2858);
                bool _2862 = _2860 != _2856;
                bool _2864 = isnan(_2860);
                bool _2866 = _2862 || _2864;
                bool _2868 = isnan(_2856);
                bool _2870 = _2866 || _2868;
                bool _2872 = !_2870;
                if (!_2872)
                {
                    float _2874 = fma(_1396, 4.0, _1066);
                    float _2876 = fma(_1394, 4.0, _960);
                    float3 _11400 = float3(_2876, _2874, float(int(_910)));
                    float3 _11402 = select(_11400, float3(0.0), isnan(_11400));
                    float _2878 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11402.xy, uint(rint(_11402.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11402.xy, uint(rint(_11402.z))).x;
                    float _2880 = fma(_1398, 4.0, _1056);
                    float _2882 = _1398 * 7.5;
                    float _2884 = -_2880;
                    float _2886 = _2884 + _2878;
                    float _2888 = _2886 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _2890 = precise::max(_2888, _2882);
                    float _2892 = precise::min(0.0, _2890);
                    bool _2894 = _2892 != _2888;
                    bool _2896 = isnan(_2892);
                    bool _2898 = _2894 || _2896;
                    bool _2900 = isnan(_2888);
                    bool _2902 = _2898 || _2900;
                    bool _2904 = !_2902;
                    if (!_2904)
                    {
                        float _2906 = fma(_1396, 5.0, _1066);
                        float _2908 = fma(_1394, 5.0, _960);
                        float3 _11454 = float3(_2908, _2906, float(int(_910)));
                        float3 _11456 = select(_11454, float3(0.0), isnan(_11454));
                        float _2910 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11456.xy, uint(rint(_11456.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11456.xy, uint(rint(_11456.z))).x;
                        float _2912 = fma(_1398, 5.0, _1056);
                        float _2914 = _1398 * 9.0;
                        float _2916 = -_2912;
                        float _2918 = _2916 + _2910;
                        float _2920 = _2918 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _2922 = precise::max(_2920, _2914);
                        float _2924 = precise::min(0.0, _2922);
                        bool _2926 = _2924 != _2920;
                        bool _2928 = isnan(_2924);
                        bool _2930 = _2926 || _2928;
                        bool _2932 = isnan(_2920);
                        bool _2934 = _2930 || _2932;
                        bool _2936 = !_2934;
                        if (!_2936)
                        {
                            float _2938 = fma(_1396, 6.0, _1066);
                            float _2940 = fma(_1394, 6.0, _960);
                            float3 _11508 = float3(_2940, _2938, float(int(_910)));
                            float3 _11510 = select(_11508, float3(0.0), isnan(_11508));
                            float _2942 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11510.xy, uint(rint(_11510.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11510.xy, uint(rint(_11510.z))).x;
                            float _2944 = fma(_1398, 6.0, _1056);
                            float _2946 = _1398 * 10.5;
                            float _2948 = -_2944;
                            float _2950 = _2948 + _2942;
                            float _2952 = _2950 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _2954 = precise::max(_2952, _2946);
                            float _2956 = precise::min(0.0, _2954);
                            bool _2958 = _2956 != _2952;
                            bool _2960 = isnan(_2956);
                            bool _2962 = _2958 || _2960;
                            bool _2964 = isnan(_2952);
                            bool _2966 = _2962 || _2964;
                            bool _2968 = !_2966;
                            if (!_2968)
                            {
                                float _2970 = fma(_1396, 7.0, _1066);
                                float _2972 = fma(_1394, 7.0, _960);
                                float3 _11562 = float3(_2972, _2970, float(int(_910)));
                                float3 _11564 = select(_11562, float3(0.0), isnan(_11562));
                                float _2974 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11564.xy, uint(rint(_11564.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11564.xy, uint(rint(_11564.z))).x;
                                float _2976 = fma(_1398, 7.0, _1056);
                                float _2978 = _1398 * 12.0;
                                float _2980 = -_2976;
                                float _2982 = _2980 + _2974;
                                float _2984 = _2982 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _2986 = precise::max(_2984, _2978);
                                float _2988 = precise::min(0.0, _2986);
                                bool _2990 = _2988 != _2984;
                                bool _2992 = isnan(_2988);
                                bool _2994 = _2990 || _2992;
                                bool _2996 = isnan(_2984);
                                bool _2998 = _2994 || _2996;
                                bool _3000 = !_2998;
                                if (!_3000)
                                {
                                    float _3002 = fma(_1396, 8.0, _1066);
                                    float _3004 = fma(_1394, 8.0, _960);
                                    float3 _11616 = float3(_3004, _3002, float(int(_910)));
                                    float3 _11618 = select(_11616, float3(0.0), isnan(_11616));
                                    float _3006 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11618.xy, uint(rint(_11618.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11618.xy, uint(rint(_11618.z))).x;
                                    float _3008 = fma(_1398, 8.0, _1056);
                                    float _3010 = _1398 * 13.5;
                                    float _3012 = -_3008;
                                    float _3014 = _3012 + _3006;
                                    float _3016 = _3014 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3018 = precise::max(_3016, _3010);
                                    float _3020 = precise::min(0.0, _3018);
                                    bool _3022 = _3020 != _3016;
                                    bool _3024 = isnan(_3020);
                                    bool _3026 = _3022 || _3024;
                                    bool _3028 = isnan(_3016);
                                    bool _3030 = _3026 || _3028;
                                    bool _3032 = !_3030;
                                    if (!_3032)
                                    {
                                        float _3034 = fma(_1396, 9.0, _1066);
                                        float _3036 = fma(_1394, 9.0, _960);
                                        float3 _11670 = float3(_3036, _3034, float(int(_910)));
                                        float3 _11672 = select(_11670, float3(0.0), isnan(_11670));
                                        float _3038 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11672.xy, uint(rint(_11672.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11672.xy, uint(rint(_11672.z))).x;
                                        float _3040 = fma(_1398, 9.0, _1056);
                                        float _3042 = _1398 * 15.0;
                                        float _3044 = -_3040;
                                        float _3046 = _3044 + _3038;
                                        float _3048 = _3046 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3050 = precise::max(_3048, _3042);
                                        float _3052 = precise::min(0.0, _3050);
                                        bool _3054 = _3052 != _3048;
                                        bool _3056 = isnan(_3052);
                                        bool _3058 = _3054 || _3056;
                                        bool _3060 = isnan(_3048);
                                        bool _3062 = _3058 || _3060;
                                        bool _3064 = !_3062;
                                        if (!_3064)
                                        {
                                            float _3066 = fma(_1396, 10.0, _1066);
                                            float _3068 = fma(_1394, 10.0, _960);
                                            float3 _11724 = float3(_3068, _3066, float(int(_910)));
                                            float3 _11726 = select(_11724, float3(0.0), isnan(_11724));
                                            float _3070 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11726.xy, uint(rint(_11726.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11726.xy, uint(rint(_11726.z))).x;
                                            float _3072 = fma(_1398, 10.0, _1056);
                                            float _3074 = _1398 * 16.5;
                                            float _3076 = -_3072;
                                            float _3078 = _3076 + _3070;
                                            float _3080 = _3078 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _3082 = precise::max(_3080, _3074);
                                            float _3084 = precise::min(0.0, _3082);
                                            bool _3086 = _3084 != _3080;
                                            bool _3088 = isnan(_3084);
                                            bool _3090 = _3086 || _3088;
                                            bool _3092 = isnan(_3080);
                                            bool _3094 = _3090 || _3092;
                                            bool _3096 = !_3094;
                                            if (!_3096)
                                            {
                                                float _3098 = fma(_1396, 11.0, _1066);
                                                float _3100 = fma(_1394, 11.0, _960);
                                                float3 _11778 = float3(_3100, _3098, float(int(_910)));
                                                float3 _11780 = select(_11778, float3(0.0), isnan(_11778));
                                                float _3102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11780.xy, uint(rint(_11780.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11780.xy, uint(rint(_11780.z))).x;
                                                float _3104 = fma(_1398, 11.0, _1056);
                                                float _3106 = _1398 * 18.0;
                                                float _3108 = -_3104;
                                                float _3110 = _3108 + _3102;
                                                float _3112 = _3110 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _3114 = precise::max(_3112, _3106);
                                                float _3116 = precise::min(0.0, _3114);
                                                bool _3118 = _3116 != _3112;
                                                bool _3120 = isnan(_3116);
                                                bool _3122 = _3118 || _3120;
                                                bool _3124 = isnan(_3112);
                                                bool _3126 = _3122 || _3124;
                                                bool _3128 = !_3126;
                                                if (!_3128)
                                                {
                                                    float _3130 = fma(_1396, 12.0, _1066);
                                                    float _3132 = fma(_1394, 12.0, _960);
                                                    float3 _11832 = float3(_3132, _3130, float(int(_910)));
                                                    float3 _11834 = select(_11832, float3(0.0), isnan(_11832));
                                                    float _3134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11834.xy, uint(rint(_11834.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11834.xy, uint(rint(_11834.z))).x;
                                                    float _3136 = fma(_1398, 12.0, _1056);
                                                    float _3138 = _1398 * 19.5;
                                                    float _3140 = -_3136;
                                                    float _3142 = _3140 + _3134;
                                                    float _3144 = _3142 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _3146 = precise::max(_3144, _3138);
                                                    float _3148 = precise::min(0.0, _3146);
                                                    bool _3150 = _3148 != _3144;
                                                    bool _3152 = isnan(_3148);
                                                    bool _3154 = _3150 || _3152;
                                                    bool _3156 = isnan(_3144);
                                                    bool _3158 = _3154 || _3156;
                                                    bool _3160 = !_3158;
                                                    if (!_3160)
                                                    {
                                                        float _3162 = fma(_1396, 13.0, _1066);
                                                        float _3164 = fma(_1394, 13.0, _960);
                                                        float3 _11886 = float3(_3164, _3162, float(int(_910)));
                                                        float3 _11888 = select(_11886, float3(0.0), isnan(_11886));
                                                        float _3166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11888.xy, uint(rint(_11888.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11888.xy, uint(rint(_11888.z))).x;
                                                        float _3168 = fma(_1398, 13.0, _1056);
                                                        float _3170 = _1398 * 21.0;
                                                        float _3172 = -_3168;
                                                        float _3174 = _3172 + _3166;
                                                        float _3176 = _3174 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _3178 = precise::max(_3176, _3170);
                                                        float _3180 = precise::min(0.0, _3178);
                                                        bool _3182 = _3180 != _3176;
                                                        bool _3184 = isnan(_3180);
                                                        bool _3186 = _3182 || _3184;
                                                        bool _3188 = isnan(_3176);
                                                        bool _3190 = _3186 || _3188;
                                                        bool _3192 = !_3190;
                                                        if (!_3192)
                                                        {
                                                            float _3194 = fma(_1396, 14.0, _1066);
                                                            float _3196 = fma(_1394, 14.0, _960);
                                                            float3 _11940 = float3(_3196, _3194, float(int(_910)));
                                                            float3 _11942 = select(_11940, float3(0.0), isnan(_11940));
                                                            float _3198 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11942.xy, uint(rint(_11942.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11942.xy, uint(rint(_11942.z))).x;
                                                            float _3200 = fma(_1398, 14.0, _1056);
                                                            float _3202 = _1398 * 22.5;
                                                            float _3204 = -_3200;
                                                            float _3206 = _3204 + _3198;
                                                            float _3208 = _3206 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _3210 = precise::max(_3208, _3202);
                                                            float _3212 = precise::min(0.0, _3210);
                                                            bool _3214 = _3212 != _3208;
                                                            bool _3216 = isnan(_3212);
                                                            bool _3218 = _3214 || _3216;
                                                            bool _3220 = isnan(_3208);
                                                            bool _3222 = _3218 || _3220;
                                                            bool _3224 = !_3222;
                                                            if (!_3224)
                                                            {
                                                                float _3226 = fma(_1396, 15.0, _1066);
                                                                float _3228 = fma(_1394, 15.0, _960);
                                                                float3 _11994 = float3(_3228, _3226, float(int(_910)));
                                                                float3 _11996 = select(_11994, float3(0.0), isnan(_11994));
                                                                float _3230 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _11996.xy, uint(rint(_11996.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _11996.xy, uint(rint(_11996.z))).x;
                                                                float _3232 = fma(_1398, 15.0, _1056);
                                                                float _3234 = _1398 * 24.0;
                                                                float _3236 = -_3232;
                                                                float _3238 = _3236 + _3230;
                                                                float _3240 = _3238 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _3242 = precise::max(_3240, _3234);
                                                                float _3244 = precise::min(0.0, _3242);
                                                                bool _3246 = _3244 != _3240;
                                                                bool _3248 = isnan(_3244);
                                                                bool _3250 = _3246 || _3248;
                                                                bool _3252 = isnan(_3240);
                                                                bool _3254 = _3250 || _3252;
                                                                bool _3256 = !_3254;
                                                                if (!_3256)
                                                                {
                                                                    float _3258 = fma(_1396, 16.0, _1066);
                                                                    float _3260 = fma(_1394, 16.0, _960);
                                                                    float3 _12048 = float3(_3260, _3258, float(int(_910)));
                                                                    float3 _12050 = select(_12048, float3(0.0), isnan(_12048));
                                                                    float _3262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12050.xy, uint(rint(_12050.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12050.xy, uint(rint(_12050.z))).x;
                                                                    float _3264 = fma(_1398, 16.0, _1056);
                                                                    float _3266 = _1398 * 25.5;
                                                                    float _3268 = -_3264;
                                                                    float _3270 = _3268 + _3262;
                                                                    float _3272 = _3270 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _3274 = precise::max(_3272, _3266);
                                                                    float _3276 = precise::min(0.0, _3274);
                                                                    bool _3278 = _3276 != _3272;
                                                                    bool _3280 = isnan(_3276);
                                                                    bool _3282 = _3278 || _3280;
                                                                    bool _3284 = isnan(_3272);
                                                                    bool _3286 = _3282 || _3284;
                                                                    bool _3288 = !_3286;
                                                                    if (!_3288)
                                                                    {
                                                                        float _3290 = fma(_1396, 17.0, _1066);
                                                                        float _3292 = fma(_1394, 17.0, _960);
                                                                        float3 _12102 = float3(_3292, _3290, float(int(_910)));
                                                                        float3 _12104 = select(_12102, float3(0.0), isnan(_12102));
                                                                        float _3294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12104.xy, uint(rint(_12104.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12104.xy, uint(rint(_12104.z))).x;
                                                                        float _3296 = fma(_1398, 17.0, _1056);
                                                                        float _3298 = _1398 * 27.0;
                                                                        float _3300 = -_3296;
                                                                        float _3302 = _3300 + _3294;
                                                                        float _3304 = _3302 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _3306 = precise::max(_3304, _3298);
                                                                        float _3308 = precise::min(0.0, _3306);
                                                                        bool _3310 = _3308 != _3304;
                                                                        bool _3312 = isnan(_3308);
                                                                        bool _3314 = _3310 || _3312;
                                                                        bool _3316 = isnan(_3304);
                                                                        bool _3318 = _3314 || _3316;
                                                                        bool _3320 = !_3318;
                                                                        if (!_3320)
                                                                        {
                                                                            float _3322 = fma(_1396, 18.0, _1066);
                                                                            float _3324 = fma(_1394, 18.0, _960);
                                                                            float3 _12156 = float3(_3324, _3322, float(int(_910)));
                                                                            float3 _12158 = select(_12156, float3(0.0), isnan(_12156));
                                                                            float _3326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12158.xy, uint(rint(_12158.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12158.xy, uint(rint(_12158.z))).x;
                                                                            float _3328 = fma(_1398, 18.0, _1056);
                                                                            float _3330 = fma(_1398, 28.5, -1.0);
                                                                            float _3332 = -_3328;
                                                                            float _3334 = _3332 + _3326;
                                                                            float _3336 = _3334 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _3338 = precise::max(_3336, _3330);
                                                                            float _3340 = precise::min(0.0, _3338);
                                                                            bool _3342 = _3340 != _3336;
                                                                            bool _3344 = isnan(_3340);
                                                                            bool _3346 = _3342 || _3344;
                                                                            bool _3348 = isnan(_3336);
                                                                            bool _3350 = _3346 || _3348;
                                                                            bool _3352 = !_3350;
                                                                            if (!_3352)
                                                                            {
                                                                                float _3354 = fma(_1394, 19.0, _960);
                                                                                float _3356 = fma(_1396, 19.0, _1066);
                                                                                float3 _12210 = float3(_3354, _3356, float(int(_910)));
                                                                                float3 _12212 = select(_12210, float3(0.0), isnan(_12210));
                                                                                float _3358 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12212.xy, uint(rint(_12212.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12212.xy, uint(rint(_12212.z))).x;
                                                                                float _3360 = fma(_1398, 19.0, _1056);
                                                                                float _3362 = fma(_1398, 30.0, -1.0);
                                                                                float _3364 = -_3360;
                                                                                float _3366 = _3364 + _3358;
                                                                                float _3368 = _3366 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _3370 = precise::max(_3368, _3362);
                                                                                float _3372 = precise::min(0.0, _3370);
                                                                                bool _3374 = _3372 != _3368;
                                                                                bool _3376 = isnan(_3372);
                                                                                bool _3378 = _3374 || _3376;
                                                                                bool _3380 = isnan(_3368);
                                                                                bool _3382 = _3378 || _3380;
                                                                                _3384 = _3382;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_3384)
    {
        float _3386 = _2756 + 1.0;
        _2776 = _3386;
    }
    _3384 = false;
    float _3388 = _2776;
    float _3390 = _1404 * 1.5;
    float _3392 = precise::max(_1492, _3390);
    float _3394 = precise::min(0.0, _3392);
    bool _3396 = _3394 != _1492;
    bool _3398 = isnan(_3394);
    bool _3400 = _3396 || _3398;
    bool _3402 = isnan(_1492);
    bool _3404 = _3400 || _3402;
    bool _3406 = !_3404;
    float _3408 = _3388;
    if (!_3406)
    {
        float _3410 = _1066 + _1402;
        float _3412 = _960 + _1400;
        float3 _12313 = float3(_3412, _3410, float(int(_910)));
        float3 _12315 = select(_12313, float3(0.0), isnan(_12313));
        float _3414 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12315.xy, uint(rint(_12315.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12315.xy, uint(rint(_12315.z))).x;
        float _3416 = _1056 + _1404;
        float _3418 = _1404 * 3.0;
        float _3420 = -_3416;
        float _3422 = _3420 + _3414;
        float _3424 = _3422 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _3426 = precise::max(_3424, _3418);
        float _3428 = precise::min(0.0, _3426);
        bool _3430 = _3428 != _3424;
        bool _3432 = isnan(_3428);
        bool _3434 = _3430 || _3432;
        bool _3436 = isnan(_3424);
        bool _3438 = _3434 || _3436;
        bool _3440 = !_3438;
        if (!_3440)
        {
            float _3442 = fma(_1402, 2.0, _1066);
            float _3444 = fma(_1400, 2.0, _960);
            float3 _12367 = float3(_3444, _3442, float(int(_910)));
            float3 _12369 = select(_12367, float3(0.0), isnan(_12367));
            float _3446 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12369.xy, uint(rint(_12369.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12369.xy, uint(rint(_12369.z))).x;
            float _3448 = fma(_1404, 2.0, _1056);
            float _3450 = _1404 * 4.5;
            float _3452 = -_3448;
            float _3454 = _3452 + _3446;
            float _3456 = _3454 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _3458 = precise::max(_3456, _3450);
            float _3460 = precise::min(0.0, _3458);
            bool _3462 = _3460 != _3456;
            bool _3464 = isnan(_3460);
            bool _3466 = _3462 || _3464;
            bool _3468 = isnan(_3456);
            bool _3470 = _3466 || _3468;
            bool _3472 = !_3470;
            if (!_3472)
            {
                float _3474 = fma(_1402, 3.0, _1066);
                float _3476 = fma(_1400, 3.0, _960);
                float3 _12421 = float3(_3476, _3474, float(int(_910)));
                float3 _12423 = select(_12421, float3(0.0), isnan(_12421));
                float _3478 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12423.xy, uint(rint(_12423.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12423.xy, uint(rint(_12423.z))).x;
                float _3480 = fma(_1404, 3.0, _1056);
                float _3482 = _1404 * 6.0;
                float _3484 = -_3480;
                float _3486 = _3484 + _3478;
                float _3488 = _3486 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _3490 = precise::max(_3488, _3482);
                float _3492 = precise::min(0.0, _3490);
                bool _3494 = _3492 != _3488;
                bool _3496 = isnan(_3492);
                bool _3498 = _3494 || _3496;
                bool _3500 = isnan(_3488);
                bool _3502 = _3498 || _3500;
                bool _3504 = !_3502;
                if (!_3504)
                {
                    float _3506 = fma(_1402, 4.0, _1066);
                    float _3508 = fma(_1400, 4.0, _960);
                    float3 _12475 = float3(_3508, _3506, float(int(_910)));
                    float3 _12477 = select(_12475, float3(0.0), isnan(_12475));
                    float _3510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12477.xy, uint(rint(_12477.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12477.xy, uint(rint(_12477.z))).x;
                    float _3512 = fma(_1404, 4.0, _1056);
                    float _3514 = _1404 * 7.5;
                    float _3516 = -_3512;
                    float _3518 = _3516 + _3510;
                    float _3520 = _3518 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _3522 = precise::max(_3520, _3514);
                    float _3524 = precise::min(0.0, _3522);
                    bool _3526 = _3524 != _3520;
                    bool _3528 = isnan(_3524);
                    bool _3530 = _3526 || _3528;
                    bool _3532 = isnan(_3520);
                    bool _3534 = _3530 || _3532;
                    bool _3536 = !_3534;
                    if (!_3536)
                    {
                        float _3538 = fma(_1402, 5.0, _1066);
                        float _3540 = fma(_1400, 5.0, _960);
                        float3 _12529 = float3(_3540, _3538, float(int(_910)));
                        float3 _12531 = select(_12529, float3(0.0), isnan(_12529));
                        float _3542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12531.xy, uint(rint(_12531.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12531.xy, uint(rint(_12531.z))).x;
                        float _3544 = fma(_1404, 5.0, _1056);
                        float _3546 = _1404 * 9.0;
                        float _3548 = -_3544;
                        float _3550 = _3548 + _3542;
                        float _3552 = _3550 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _3554 = precise::max(_3552, _3546);
                        float _3556 = precise::min(0.0, _3554);
                        bool _3558 = _3556 != _3552;
                        bool _3560 = isnan(_3556);
                        bool _3562 = _3558 || _3560;
                        bool _3564 = isnan(_3552);
                        bool _3566 = _3562 || _3564;
                        bool _3568 = !_3566;
                        if (!_3568)
                        {
                            float _3570 = fma(_1402, 6.0, _1066);
                            float _3572 = fma(_1400, 6.0, _960);
                            float3 _12583 = float3(_3572, _3570, float(int(_910)));
                            float3 _12585 = select(_12583, float3(0.0), isnan(_12583));
                            float _3574 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12585.xy, uint(rint(_12585.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12585.xy, uint(rint(_12585.z))).x;
                            float _3576 = fma(_1404, 6.0, _1056);
                            float _3578 = _1404 * 10.5;
                            float _3580 = -_3576;
                            float _3582 = _3580 + _3574;
                            float _3584 = _3582 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _3586 = precise::max(_3584, _3578);
                            float _3588 = precise::min(0.0, _3586);
                            bool _3590 = _3588 != _3584;
                            bool _3592 = isnan(_3588);
                            bool _3594 = _3590 || _3592;
                            bool _3596 = isnan(_3584);
                            bool _3598 = _3594 || _3596;
                            bool _3600 = !_3598;
                            if (!_3600)
                            {
                                float _3602 = fma(_1402, 7.0, _1066);
                                float _3604 = fma(_1400, 7.0, _960);
                                float3 _12637 = float3(_3604, _3602, float(int(_910)));
                                float3 _12639 = select(_12637, float3(0.0), isnan(_12637));
                                float _3606 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12639.xy, uint(rint(_12639.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12639.xy, uint(rint(_12639.z))).x;
                                float _3608 = fma(_1404, 7.0, _1056);
                                float _3610 = _1404 * 12.0;
                                float _3612 = -_3608;
                                float _3614 = _3612 + _3606;
                                float _3616 = _3614 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _3618 = precise::max(_3616, _3610);
                                float _3620 = precise::min(0.0, _3618);
                                bool _3622 = _3620 != _3616;
                                bool _3624 = isnan(_3620);
                                bool _3626 = _3622 || _3624;
                                bool _3628 = isnan(_3616);
                                bool _3630 = _3626 || _3628;
                                bool _3632 = !_3630;
                                if (!_3632)
                                {
                                    float _3634 = fma(_1402, 8.0, _1066);
                                    float _3636 = fma(_1400, 8.0, _960);
                                    float3 _12691 = float3(_3636, _3634, float(int(_910)));
                                    float3 _12693 = select(_12691, float3(0.0), isnan(_12691));
                                    float _3638 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12693.xy, uint(rint(_12693.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12693.xy, uint(rint(_12693.z))).x;
                                    float _3640 = fma(_1404, 8.0, _1056);
                                    float _3642 = _1404 * 13.5;
                                    float _3644 = -_3640;
                                    float _3646 = _3644 + _3638;
                                    float _3648 = _3646 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _3650 = precise::max(_3648, _3642);
                                    float _3652 = precise::min(0.0, _3650);
                                    bool _3654 = _3652 != _3648;
                                    bool _3656 = isnan(_3652);
                                    bool _3658 = _3654 || _3656;
                                    bool _3660 = isnan(_3648);
                                    bool _3662 = _3658 || _3660;
                                    bool _3664 = !_3662;
                                    if (!_3664)
                                    {
                                        float _3666 = fma(_1402, 9.0, _1066);
                                        float _3668 = fma(_1400, 9.0, _960);
                                        float3 _12745 = float3(_3668, _3666, float(int(_910)));
                                        float3 _12747 = select(_12745, float3(0.0), isnan(_12745));
                                        float _3670 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12747.xy, uint(rint(_12747.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12747.xy, uint(rint(_12747.z))).x;
                                        float _3672 = fma(_1404, 9.0, _1056);
                                        float _3674 = _1404 * 15.0;
                                        float _3676 = -_3672;
                                        float _3678 = _3676 + _3670;
                                        float _3680 = _3678 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _3682 = precise::max(_3680, _3674);
                                        float _3684 = precise::min(0.0, _3682);
                                        bool _3686 = _3684 != _3680;
                                        bool _3688 = isnan(_3684);
                                        bool _3690 = _3686 || _3688;
                                        bool _3692 = isnan(_3680);
                                        bool _3694 = _3690 || _3692;
                                        bool _3696 = !_3694;
                                        if (!_3696)
                                        {
                                            float _3698 = fma(_1402, 10.0, _1066);
                                            float _3700 = fma(_1400, 10.0, _960);
                                            float3 _12799 = float3(_3700, _3698, float(int(_910)));
                                            float3 _12801 = select(_12799, float3(0.0), isnan(_12799));
                                            float _3702 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12801.xy, uint(rint(_12801.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12801.xy, uint(rint(_12801.z))).x;
                                            float _3704 = fma(_1404, 10.0, _1056);
                                            float _3706 = _1404 * 16.5;
                                            float _3708 = -_3704;
                                            float _3710 = _3708 + _3702;
                                            float _3712 = _3710 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _3714 = precise::max(_3712, _3706);
                                            float _3716 = precise::min(0.0, _3714);
                                            bool _3718 = _3716 != _3712;
                                            bool _3720 = isnan(_3716);
                                            bool _3722 = _3718 || _3720;
                                            bool _3724 = isnan(_3712);
                                            bool _3726 = _3722 || _3724;
                                            bool _3728 = !_3726;
                                            if (!_3728)
                                            {
                                                float _3730 = fma(_1402, 11.0, _1066);
                                                float _3732 = fma(_1400, 11.0, _960);
                                                float3 _12853 = float3(_3732, _3730, float(int(_910)));
                                                float3 _12855 = select(_12853, float3(0.0), isnan(_12853));
                                                float _3734 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12855.xy, uint(rint(_12855.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12855.xy, uint(rint(_12855.z))).x;
                                                float _3736 = fma(_1404, 11.0, _1056);
                                                float _3738 = _1404 * 18.0;
                                                float _3740 = -_3736;
                                                float _3742 = _3740 + _3734;
                                                float _3744 = _3742 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _3746 = precise::max(_3744, _3738);
                                                float _3748 = precise::min(0.0, _3746);
                                                bool _3750 = _3748 != _3744;
                                                bool _3752 = isnan(_3748);
                                                bool _3754 = _3750 || _3752;
                                                bool _3756 = isnan(_3744);
                                                bool _3758 = _3754 || _3756;
                                                bool _3760 = !_3758;
                                                if (!_3760)
                                                {
                                                    float _3762 = fma(_1402, 12.0, _1066);
                                                    float _3764 = fma(_1400, 12.0, _960);
                                                    float3 _12907 = float3(_3764, _3762, float(int(_910)));
                                                    float3 _12909 = select(_12907, float3(0.0), isnan(_12907));
                                                    float _3766 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12909.xy, uint(rint(_12909.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12909.xy, uint(rint(_12909.z))).x;
                                                    float _3768 = fma(_1404, 12.0, _1056);
                                                    float _3770 = _1404 * 19.5;
                                                    float _3772 = -_3768;
                                                    float _3774 = _3772 + _3766;
                                                    float _3776 = _3774 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _3778 = precise::max(_3776, _3770);
                                                    float _3780 = precise::min(0.0, _3778);
                                                    bool _3782 = _3780 != _3776;
                                                    bool _3784 = isnan(_3780);
                                                    bool _3786 = _3782 || _3784;
                                                    bool _3788 = isnan(_3776);
                                                    bool _3790 = _3786 || _3788;
                                                    bool _3792 = !_3790;
                                                    if (!_3792)
                                                    {
                                                        float _3794 = fma(_1402, 13.0, _1066);
                                                        float _3796 = fma(_1400, 13.0, _960);
                                                        float3 _12961 = float3(_3796, _3794, float(int(_910)));
                                                        float3 _12963 = select(_12961, float3(0.0), isnan(_12961));
                                                        float _3798 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _12963.xy, uint(rint(_12963.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _12963.xy, uint(rint(_12963.z))).x;
                                                        float _3800 = fma(_1404, 13.0, _1056);
                                                        float _3802 = _1404 * 21.0;
                                                        float _3804 = -_3800;
                                                        float _3806 = _3804 + _3798;
                                                        float _3808 = _3806 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _3810 = precise::max(_3808, _3802);
                                                        float _3812 = precise::min(0.0, _3810);
                                                        bool _3814 = _3812 != _3808;
                                                        bool _3816 = isnan(_3812);
                                                        bool _3818 = _3814 || _3816;
                                                        bool _3820 = isnan(_3808);
                                                        bool _3822 = _3818 || _3820;
                                                        bool _3824 = !_3822;
                                                        if (!_3824)
                                                        {
                                                            float _3826 = fma(_1402, 14.0, _1066);
                                                            float _3828 = fma(_1400, 14.0, _960);
                                                            float3 _13015 = float3(_3828, _3826, float(int(_910)));
                                                            float3 _13017 = select(_13015, float3(0.0), isnan(_13015));
                                                            float _3830 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13017.xy, uint(rint(_13017.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13017.xy, uint(rint(_13017.z))).x;
                                                            float _3832 = fma(_1404, 14.0, _1056);
                                                            float _3834 = _1404 * 22.5;
                                                            float _3836 = -_3832;
                                                            float _3838 = _3836 + _3830;
                                                            float _3840 = _3838 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _3842 = precise::max(_3840, _3834);
                                                            float _3844 = precise::min(0.0, _3842);
                                                            bool _3846 = _3844 != _3840;
                                                            bool _3848 = isnan(_3844);
                                                            bool _3850 = _3846 || _3848;
                                                            bool _3852 = isnan(_3840);
                                                            bool _3854 = _3850 || _3852;
                                                            bool _3856 = !_3854;
                                                            if (!_3856)
                                                            {
                                                                float _3858 = fma(_1402, 15.0, _1066);
                                                                float _3860 = fma(_1400, 15.0, _960);
                                                                float3 _13069 = float3(_3860, _3858, float(int(_910)));
                                                                float3 _13071 = select(_13069, float3(0.0), isnan(_13069));
                                                                float _3862 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13071.xy, uint(rint(_13071.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13071.xy, uint(rint(_13071.z))).x;
                                                                float _3864 = fma(_1404, 15.0, _1056);
                                                                float _3866 = _1404 * 24.0;
                                                                float _3868 = -_3864;
                                                                float _3870 = _3868 + _3862;
                                                                float _3872 = _3870 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _3874 = precise::max(_3872, _3866);
                                                                float _3876 = precise::min(0.0, _3874);
                                                                bool _3878 = _3876 != _3872;
                                                                bool _3880 = isnan(_3876);
                                                                bool _3882 = _3878 || _3880;
                                                                bool _3884 = isnan(_3872);
                                                                bool _3886 = _3882 || _3884;
                                                                bool _3888 = !_3886;
                                                                if (!_3888)
                                                                {
                                                                    float _3890 = fma(_1402, 16.0, _1066);
                                                                    float _3892 = fma(_1400, 16.0, _960);
                                                                    float3 _13123 = float3(_3892, _3890, float(int(_910)));
                                                                    float3 _13125 = select(_13123, float3(0.0), isnan(_13123));
                                                                    float _3894 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13125.xy, uint(rint(_13125.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13125.xy, uint(rint(_13125.z))).x;
                                                                    float _3896 = fma(_1404, 16.0, _1056);
                                                                    float _3898 = _1404 * 25.5;
                                                                    float _3900 = -_3896;
                                                                    float _3902 = _3900 + _3894;
                                                                    float _3904 = _3902 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _3906 = precise::max(_3904, _3898);
                                                                    float _3908 = precise::min(0.0, _3906);
                                                                    bool _3910 = _3908 != _3904;
                                                                    bool _3912 = isnan(_3908);
                                                                    bool _3914 = _3910 || _3912;
                                                                    bool _3916 = isnan(_3904);
                                                                    bool _3918 = _3914 || _3916;
                                                                    bool _3920 = !_3918;
                                                                    if (!_3920)
                                                                    {
                                                                        float _3922 = fma(_1402, 17.0, _1066);
                                                                        float _3924 = fma(_1400, 17.0, _960);
                                                                        float3 _13177 = float3(_3924, _3922, float(int(_910)));
                                                                        float3 _13179 = select(_13177, float3(0.0), isnan(_13177));
                                                                        float _3926 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13179.xy, uint(rint(_13179.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13179.xy, uint(rint(_13179.z))).x;
                                                                        float _3928 = fma(_1404, 17.0, _1056);
                                                                        float _3930 = _1404 * 27.0;
                                                                        float _3932 = -_3928;
                                                                        float _3934 = _3932 + _3926;
                                                                        float _3936 = _3934 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _3938 = precise::max(_3936, _3930);
                                                                        float _3940 = precise::min(0.0, _3938);
                                                                        bool _3942 = _3940 != _3936;
                                                                        bool _3944 = isnan(_3940);
                                                                        bool _3946 = _3942 || _3944;
                                                                        bool _3948 = isnan(_3936);
                                                                        bool _3950 = _3946 || _3948;
                                                                        bool _3952 = !_3950;
                                                                        if (!_3952)
                                                                        {
                                                                            float _3954 = fma(_1402, 18.0, _1066);
                                                                            float _3956 = fma(_1400, 18.0, _960);
                                                                            float3 _13231 = float3(_3956, _3954, float(int(_910)));
                                                                            float3 _13233 = select(_13231, float3(0.0), isnan(_13231));
                                                                            float _3958 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13233.xy, uint(rint(_13233.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13233.xy, uint(rint(_13233.z))).x;
                                                                            float _3960 = fma(_1404, 18.0, _1056);
                                                                            float _3962 = fma(_1404, 28.5, -1.0);
                                                                            float _3964 = -_3960;
                                                                            float _3966 = _3964 + _3958;
                                                                            float _3968 = _3966 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _3970 = precise::max(_3968, _3962);
                                                                            float _3972 = precise::min(0.0, _3970);
                                                                            bool _3974 = _3972 != _3968;
                                                                            bool _3976 = isnan(_3972);
                                                                            bool _3978 = _3974 || _3976;
                                                                            bool _3980 = isnan(_3968);
                                                                            bool _3982 = _3978 || _3980;
                                                                            bool _3984 = !_3982;
                                                                            if (!_3984)
                                                                            {
                                                                                float _3986 = fma(_1402, 19.0, _1066);
                                                                                float _3988 = fma(_1400, 19.0, _960);
                                                                                float3 _13285 = float3(_3988, _3986, float(int(_910)));
                                                                                float3 _13287 = select(_13285, float3(0.0), isnan(_13285));
                                                                                float _3990 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13287.xy, uint(rint(_13287.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13287.xy, uint(rint(_13287.z))).x;
                                                                                float _3992 = fma(_1404, 19.0, _1056);
                                                                                float _3994 = fma(_1404, 30.0, -1.0);
                                                                                float _3996 = -_3992;
                                                                                float _3998 = _3996 + _3990;
                                                                                float _4000 = _3998 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _4002 = precise::max(_4000, _3994);
                                                                                float _4004 = precise::min(0.0, _4002);
                                                                                bool _4006 = _4004 != _4000;
                                                                                bool _4008 = isnan(_4004);
                                                                                bool _4010 = _4006 || _4008;
                                                                                bool _4012 = isnan(_4000);
                                                                                bool _4014 = _4010 || _4012;
                                                                                _4016 = _4014;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4016)
    {
        float _4018 = _3388 + 1.0;
        _3408 = _4018;
    }
    _4016 = false;
    float _4020 = _3408;
    float _4022 = _1424 * 1.5;
    float _4024 = precise::max(_1492, _4022);
    float _4026 = precise::min(0.0, _4024);
    bool _4028 = _4026 != _1492;
    bool _4030 = isnan(_4026);
    bool _4032 = _4028 || _4030;
    bool _4034 = isnan(_1492);
    bool _4036 = _4032 || _4034;
    bool _4038 = !_4036;
    float _4040 = _4020;
    if (!_4038)
    {
        float _4042 = _1066 + _1422;
        float _4044 = _960 + _1420;
        float3 _13388 = float3(_4044, _4042, float(int(_910)));
        float3 _13390 = select(_13388, float3(0.0), isnan(_13388));
        float _4046 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13390.xy, uint(rint(_13390.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13390.xy, uint(rint(_13390.z))).x;
        float _4048 = _1056 + _1424;
        float _4050 = _1424 * 3.0;
        float _4052 = -_4048;
        float _4054 = _4052 + _4046;
        float _4056 = _4054 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4058 = precise::max(_4056, _4050);
        float _4060 = precise::min(0.0, _4058);
        bool _4062 = _4060 != _4056;
        bool _4064 = isnan(_4060);
        bool _4066 = _4062 || _4064;
        bool _4068 = isnan(_4056);
        bool _4070 = _4066 || _4068;
        bool _4072 = !_4070;
        if (!_4072)
        {
            float _4074 = fma(_1422, 2.0, _1066);
            float _4076 = fma(_1420, 2.0, _960);
            float3 _13442 = float3(_4076, _4074, float(int(_910)));
            float3 _13444 = select(_13442, float3(0.0), isnan(_13442));
            float _4078 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13444.xy, uint(rint(_13444.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13444.xy, uint(rint(_13444.z))).x;
            float _4080 = fma(_1424, 2.0, _1056);
            float _4082 = _1424 * 4.5;
            float _4084 = -_4080;
            float _4086 = _4084 + _4078;
            float _4088 = _4086 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4090 = precise::max(_4088, _4082);
            float _4092 = precise::min(0.0, _4090);
            bool _4094 = _4092 != _4088;
            bool _4096 = isnan(_4092);
            bool _4098 = _4094 || _4096;
            bool _4100 = isnan(_4088);
            bool _4102 = _4098 || _4100;
            bool _4104 = !_4102;
            if (!_4104)
            {
                float _4106 = fma(_1422, 3.0, _1066);
                float _4108 = fma(_1420, 3.0, _960);
                float3 _13496 = float3(_4108, _4106, float(int(_910)));
                float3 _13498 = select(_13496, float3(0.0), isnan(_13496));
                float _4110 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13498.xy, uint(rint(_13498.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13498.xy, uint(rint(_13498.z))).x;
                float _4112 = fma(_1424, 3.0, _1056);
                float _4114 = _1424 * 6.0;
                float _4116 = -_4112;
                float _4118 = _4116 + _4110;
                float _4120 = _4118 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4122 = precise::max(_4120, _4114);
                float _4124 = precise::min(0.0, _4122);
                bool _4126 = _4124 != _4120;
                bool _4128 = isnan(_4124);
                bool _4130 = _4126 || _4128;
                bool _4132 = isnan(_4120);
                bool _4134 = _4130 || _4132;
                bool _4136 = !_4134;
                if (!_4136)
                {
                    float _4138 = fma(_1422, 4.0, _1066);
                    float _4140 = fma(_1420, 4.0, _960);
                    float3 _13550 = float3(_4140, _4138, float(int(_910)));
                    float3 _13552 = select(_13550, float3(0.0), isnan(_13550));
                    float _4142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13552.xy, uint(rint(_13552.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13552.xy, uint(rint(_13552.z))).x;
                    float _4144 = fma(_1424, 4.0, _1056);
                    float _4146 = _1424 * 7.5;
                    float _4148 = -_4144;
                    float _4150 = _4148 + _4142;
                    float _4152 = _4150 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4154 = precise::max(_4152, _4146);
                    float _4156 = precise::min(0.0, _4154);
                    bool _4158 = _4156 != _4152;
                    bool _4160 = isnan(_4156);
                    bool _4162 = _4158 || _4160;
                    bool _4164 = isnan(_4152);
                    bool _4166 = _4162 || _4164;
                    bool _4168 = !_4166;
                    if (!_4168)
                    {
                        float _4170 = fma(_1422, 5.0, _1066);
                        float _4172 = fma(_1420, 5.0, _960);
                        float3 _13604 = float3(_4172, _4170, float(int(_910)));
                        float3 _13606 = select(_13604, float3(0.0), isnan(_13604));
                        float _4174 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13606.xy, uint(rint(_13606.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13606.xy, uint(rint(_13606.z))).x;
                        float _4176 = fma(_1424, 5.0, _1056);
                        float _4178 = _1424 * 9.0;
                        float _4180 = -_4176;
                        float _4182 = _4180 + _4174;
                        float _4184 = _4182 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4186 = precise::max(_4184, _4178);
                        float _4188 = precise::min(0.0, _4186);
                        bool _4190 = _4188 != _4184;
                        bool _4192 = isnan(_4188);
                        bool _4194 = _4190 || _4192;
                        bool _4196 = isnan(_4184);
                        bool _4198 = _4194 || _4196;
                        bool _4200 = !_4198;
                        if (!_4200)
                        {
                            float _4202 = fma(_1422, 6.0, _1066);
                            float _4204 = fma(_1420, 6.0, _960);
                            float3 _13658 = float3(_4204, _4202, float(int(_910)));
                            float3 _13660 = select(_13658, float3(0.0), isnan(_13658));
                            float _4206 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13660.xy, uint(rint(_13660.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13660.xy, uint(rint(_13660.z))).x;
                            float _4208 = fma(_1424, 6.0, _1056);
                            float _4210 = _1424 * 10.5;
                            float _4212 = -_4208;
                            float _4214 = _4212 + _4206;
                            float _4216 = _4214 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4218 = precise::max(_4216, _4210);
                            float _4220 = precise::min(0.0, _4218);
                            bool _4222 = _4220 != _4216;
                            bool _4224 = isnan(_4220);
                            bool _4226 = _4222 || _4224;
                            bool _4228 = isnan(_4216);
                            bool _4230 = _4226 || _4228;
                            bool _4232 = !_4230;
                            if (!_4232)
                            {
                                float _4234 = fma(_1422, 7.0, _1066);
                                float _4236 = fma(_1420, 7.0, _960);
                                float3 _13712 = float3(_4236, _4234, float(int(_910)));
                                float3 _13714 = select(_13712, float3(0.0), isnan(_13712));
                                float _4238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13714.xy, uint(rint(_13714.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13714.xy, uint(rint(_13714.z))).x;
                                float _4240 = fma(_1424, 7.0, _1056);
                                float _4242 = _1424 * 12.0;
                                float _4244 = -_4240;
                                float _4246 = _4244 + _4238;
                                float _4248 = _4246 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4250 = precise::max(_4248, _4242);
                                float _4252 = precise::min(0.0, _4250);
                                bool _4254 = _4252 != _4248;
                                bool _4256 = isnan(_4252);
                                bool _4258 = _4254 || _4256;
                                bool _4260 = isnan(_4248);
                                bool _4262 = _4258 || _4260;
                                bool _4264 = !_4262;
                                if (!_4264)
                                {
                                    float _4266 = fma(_1422, 8.0, _1066);
                                    float _4268 = fma(_1420, 8.0, _960);
                                    float3 _13766 = float3(_4268, _4266, float(int(_910)));
                                    float3 _13768 = select(_13766, float3(0.0), isnan(_13766));
                                    float _4270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13768.xy, uint(rint(_13768.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13768.xy, uint(rint(_13768.z))).x;
                                    float _4272 = fma(_1424, 8.0, _1056);
                                    float _4274 = _1424 * 13.5;
                                    float _4276 = -_4272;
                                    float _4278 = _4276 + _4270;
                                    float _4280 = _4278 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4282 = precise::max(_4280, _4274);
                                    float _4284 = precise::min(0.0, _4282);
                                    bool _4286 = _4284 != _4280;
                                    bool _4288 = isnan(_4284);
                                    bool _4290 = _4286 || _4288;
                                    bool _4292 = isnan(_4280);
                                    bool _4294 = _4290 || _4292;
                                    bool _4296 = !_4294;
                                    if (!_4296)
                                    {
                                        float _4298 = fma(_1422, 9.0, _1066);
                                        float _4300 = fma(_1420, 9.0, _960);
                                        float3 _13820 = float3(_4300, _4298, float(int(_910)));
                                        float3 _13822 = select(_13820, float3(0.0), isnan(_13820));
                                        float _4302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13822.xy, uint(rint(_13822.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13822.xy, uint(rint(_13822.z))).x;
                                        float _4304 = fma(_1424, 9.0, _1056);
                                        float _4306 = _1424 * 15.0;
                                        float _4308 = -_4304;
                                        float _4310 = _4308 + _4302;
                                        float _4312 = _4310 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4314 = precise::max(_4312, _4306);
                                        float _4316 = precise::min(0.0, _4314);
                                        bool _4318 = _4316 != _4312;
                                        bool _4320 = isnan(_4316);
                                        bool _4322 = _4318 || _4320;
                                        bool _4324 = isnan(_4312);
                                        bool _4326 = _4322 || _4324;
                                        bool _4328 = !_4326;
                                        if (!_4328)
                                        {
                                            float _4330 = fma(_1422, 10.0, _1066);
                                            float _4332 = fma(_1420, 10.0, _960);
                                            float3 _13874 = float3(_4332, _4330, float(int(_910)));
                                            float3 _13876 = select(_13874, float3(0.0), isnan(_13874));
                                            float _4334 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13876.xy, uint(rint(_13876.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13876.xy, uint(rint(_13876.z))).x;
                                            float _4336 = fma(_1424, 10.0, _1056);
                                            float _4338 = _1424 * 16.5;
                                            float _4340 = -_4336;
                                            float _4342 = _4340 + _4334;
                                            float _4344 = _4342 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _4346 = precise::max(_4344, _4338);
                                            float _4348 = precise::min(0.0, _4346);
                                            bool _4350 = _4348 != _4344;
                                            bool _4352 = isnan(_4348);
                                            bool _4354 = _4350 || _4352;
                                            bool _4356 = isnan(_4344);
                                            bool _4358 = _4354 || _4356;
                                            bool _4360 = !_4358;
                                            if (!_4360)
                                            {
                                                float _4362 = fma(_1422, 11.0, _1066);
                                                float _4364 = fma(_1420, 11.0, _960);
                                                float3 _13928 = float3(_4364, _4362, float(int(_910)));
                                                float3 _13930 = select(_13928, float3(0.0), isnan(_13928));
                                                float _4366 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13930.xy, uint(rint(_13930.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13930.xy, uint(rint(_13930.z))).x;
                                                float _4368 = fma(_1424, 11.0, _1056);
                                                float _4370 = _1424 * 18.0;
                                                float _4372 = -_4368;
                                                float _4374 = _4372 + _4366;
                                                float _4376 = _4374 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _4378 = precise::max(_4376, _4370);
                                                float _4380 = precise::min(0.0, _4378);
                                                bool _4382 = _4380 != _4376;
                                                bool _4384 = isnan(_4380);
                                                bool _4386 = _4382 || _4384;
                                                bool _4388 = isnan(_4376);
                                                bool _4390 = _4386 || _4388;
                                                bool _4392 = !_4390;
                                                if (!_4392)
                                                {
                                                    float _4394 = fma(_1422, 12.0, _1066);
                                                    float _4396 = fma(_1420, 12.0, _960);
                                                    float3 _13982 = float3(_4396, _4394, float(int(_910)));
                                                    float3 _13984 = select(_13982, float3(0.0), isnan(_13982));
                                                    float _4398 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _13984.xy, uint(rint(_13984.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _13984.xy, uint(rint(_13984.z))).x;
                                                    float _4400 = fma(_1424, 12.0, _1056);
                                                    float _4402 = _1424 * 19.5;
                                                    float _4404 = -_4400;
                                                    float _4406 = _4404 + _4398;
                                                    float _4408 = _4406 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _4410 = precise::max(_4408, _4402);
                                                    float _4412 = precise::min(0.0, _4410);
                                                    bool _4414 = _4412 != _4408;
                                                    bool _4416 = isnan(_4412);
                                                    bool _4418 = _4414 || _4416;
                                                    bool _4420 = isnan(_4408);
                                                    bool _4422 = _4418 || _4420;
                                                    bool _4424 = !_4422;
                                                    if (!_4424)
                                                    {
                                                        float _4426 = fma(_1422, 13.0, _1066);
                                                        float _4428 = fma(_1420, 13.0, _960);
                                                        float3 _14036 = float3(_4428, _4426, float(int(_910)));
                                                        float3 _14038 = select(_14036, float3(0.0), isnan(_14036));
                                                        float _4430 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14038.xy, uint(rint(_14038.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14038.xy, uint(rint(_14038.z))).x;
                                                        float _4432 = fma(_1424, 13.0, _1056);
                                                        float _4434 = _1424 * 21.0;
                                                        float _4436 = -_4432;
                                                        float _4438 = _4436 + _4430;
                                                        float _4440 = _4438 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _4442 = precise::max(_4440, _4434);
                                                        float _4444 = precise::min(0.0, _4442);
                                                        bool _4446 = _4444 != _4440;
                                                        bool _4448 = isnan(_4444);
                                                        bool _4450 = _4446 || _4448;
                                                        bool _4452 = isnan(_4440);
                                                        bool _4454 = _4450 || _4452;
                                                        bool _4456 = !_4454;
                                                        if (!_4456)
                                                        {
                                                            float _4458 = fma(_1422, 14.0, _1066);
                                                            float _4460 = fma(_1420, 14.0, _960);
                                                            float3 _14090 = float3(_4460, _4458, float(int(_910)));
                                                            float3 _14092 = select(_14090, float3(0.0), isnan(_14090));
                                                            float _4462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14092.xy, uint(rint(_14092.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14092.xy, uint(rint(_14092.z))).x;
                                                            float _4464 = fma(_1424, 14.0, _1056);
                                                            float _4466 = _1424 * 22.5;
                                                            float _4468 = -_4464;
                                                            float _4470 = _4468 + _4462;
                                                            float _4472 = _4470 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _4474 = precise::max(_4472, _4466);
                                                            float _4476 = precise::min(0.0, _4474);
                                                            bool _4478 = _4476 != _4472;
                                                            bool _4480 = isnan(_4476);
                                                            bool _4482 = _4478 || _4480;
                                                            bool _4484 = isnan(_4472);
                                                            bool _4486 = _4482 || _4484;
                                                            bool _4488 = !_4486;
                                                            if (!_4488)
                                                            {
                                                                float _4490 = fma(_1422, 15.0, _1066);
                                                                float _4492 = fma(_1420, 15.0, _960);
                                                                float3 _14144 = float3(_4492, _4490, float(int(_910)));
                                                                float3 _14146 = select(_14144, float3(0.0), isnan(_14144));
                                                                float _4494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14146.xy, uint(rint(_14146.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14146.xy, uint(rint(_14146.z))).x;
                                                                float _4496 = fma(_1424, 15.0, _1056);
                                                                float _4498 = _1424 * 24.0;
                                                                float _4500 = -_4496;
                                                                float _4502 = _4500 + _4494;
                                                                float _4504 = _4502 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _4506 = precise::max(_4504, _4498);
                                                                float _4508 = precise::min(0.0, _4506);
                                                                bool _4510 = _4508 != _4504;
                                                                bool _4512 = isnan(_4508);
                                                                bool _4514 = _4510 || _4512;
                                                                bool _4516 = isnan(_4504);
                                                                bool _4518 = _4514 || _4516;
                                                                bool _4520 = !_4518;
                                                                if (!_4520)
                                                                {
                                                                    float _4522 = fma(_1422, 16.0, _1066);
                                                                    float _4524 = fma(_1420, 16.0, _960);
                                                                    float3 _14198 = float3(_4524, _4522, float(int(_910)));
                                                                    float3 _14200 = select(_14198, float3(0.0), isnan(_14198));
                                                                    float _4526 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14200.xy, uint(rint(_14200.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14200.xy, uint(rint(_14200.z))).x;
                                                                    float _4528 = fma(_1424, 16.0, _1056);
                                                                    float _4530 = _1424 * 25.5;
                                                                    float _4532 = -_4528;
                                                                    float _4534 = _4532 + _4526;
                                                                    float _4536 = _4534 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _4538 = precise::max(_4536, _4530);
                                                                    float _4540 = precise::min(0.0, _4538);
                                                                    bool _4542 = _4540 != _4536;
                                                                    bool _4544 = isnan(_4540);
                                                                    bool _4546 = _4542 || _4544;
                                                                    bool _4548 = isnan(_4536);
                                                                    bool _4550 = _4546 || _4548;
                                                                    bool _4552 = !_4550;
                                                                    if (!_4552)
                                                                    {
                                                                        float _4554 = fma(_1422, 17.0, _1066);
                                                                        float _4556 = fma(_1420, 17.0, _960);
                                                                        float3 _14252 = float3(_4556, _4554, float(int(_910)));
                                                                        float3 _14254 = select(_14252, float3(0.0), isnan(_14252));
                                                                        float _4558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14254.xy, uint(rint(_14254.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14254.xy, uint(rint(_14254.z))).x;
                                                                        float _4560 = fma(_1424, 17.0, _1056);
                                                                        float _4562 = _1424 * 27.0;
                                                                        float _4564 = -_4560;
                                                                        float _4566 = _4564 + _4558;
                                                                        float _4568 = _4566 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _4570 = precise::max(_4568, _4562);
                                                                        float _4572 = precise::min(0.0, _4570);
                                                                        bool _4574 = _4572 != _4568;
                                                                        bool _4576 = isnan(_4572);
                                                                        bool _4578 = _4574 || _4576;
                                                                        bool _4580 = isnan(_4568);
                                                                        bool _4582 = _4578 || _4580;
                                                                        bool _4584 = !_4582;
                                                                        if (!_4584)
                                                                        {
                                                                            float _4586 = fma(_1422, 18.0, _1066);
                                                                            float _4588 = fma(_1420, 18.0, _960);
                                                                            float3 _14306 = float3(_4588, _4586, float(int(_910)));
                                                                            float3 _14308 = select(_14306, float3(0.0), isnan(_14306));
                                                                            float _4590 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14308.xy, uint(rint(_14308.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14308.xy, uint(rint(_14308.z))).x;
                                                                            float _4592 = fma(_1424, 18.0, _1056);
                                                                            float _4594 = fma(_1424, 28.5, -1.0);
                                                                            float _4596 = -_4592;
                                                                            float _4598 = _4596 + _4590;
                                                                            float _4600 = _4598 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _4602 = precise::max(_4600, _4594);
                                                                            float _4604 = precise::min(0.0, _4602);
                                                                            bool _4606 = _4604 != _4600;
                                                                            bool _4608 = isnan(_4604);
                                                                            bool _4610 = _4606 || _4608;
                                                                            bool _4612 = isnan(_4600);
                                                                            bool _4614 = _4610 || _4612;
                                                                            bool _4616 = !_4614;
                                                                            if (!_4616)
                                                                            {
                                                                                float _4618 = fma(_1422, 19.0, _1066);
                                                                                float _4620 = fma(_1420, 19.0, _960);
                                                                                float3 _14360 = float3(_4620, _4618, float(int(_910)));
                                                                                float3 _14362 = select(_14360, float3(0.0), isnan(_14360));
                                                                                float _4622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14362.xy, uint(rint(_14362.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14362.xy, uint(rint(_14362.z))).x;
                                                                                float _4624 = fma(_1424, 19.0, _1056);
                                                                                float _4626 = fma(_1424, 30.0, -1.0);
                                                                                float _4628 = -_4624;
                                                                                float _4630 = _4628 + _4622;
                                                                                float _4632 = _4630 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _4634 = precise::max(_4632, _4626);
                                                                                float _4636 = precise::min(0.0, _4634);
                                                                                bool _4638 = _4636 != _4632;
                                                                                bool _4640 = isnan(_4636);
                                                                                bool _4642 = _4638 || _4640;
                                                                                bool _4644 = isnan(_4632);
                                                                                bool _4646 = _4642 || _4644;
                                                                                _4648 = _4646;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_4648)
    {
        float _4650 = _4020 + 1.0;
        _4040 = _4650;
    }
    _4648 = false;
    float _4652 = _4040;
    float _4654 = _1444 * 1.5;
    float _4656 = precise::max(_1492, _4654);
    float _4658 = precise::min(0.0, _4656);
    bool _4660 = _4658 != _1492;
    bool _4662 = isnan(_4658);
    bool _4664 = _4660 || _4662;
    bool _4666 = isnan(_1492);
    bool _4668 = _4664 || _4666;
    bool _4670 = !_4668;
    float _4672 = _4652;
    if (!_4670)
    {
        float _4674 = _1066 + _1442;
        float _4676 = _960 + _1440;
        float3 _14463 = float3(_4676, _4674, float(int(_910)));
        float3 _14465 = select(_14463, float3(0.0), isnan(_14463));
        float _4678 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14465.xy, uint(rint(_14465.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14465.xy, uint(rint(_14465.z))).x;
        float _4680 = _1056 + _1444;
        float _4682 = _1444 * 3.0;
        float _4684 = -_4680;
        float _4686 = _4684 + _4678;
        float _4688 = _4686 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _4690 = precise::max(_4688, _4682);
        float _4692 = precise::min(0.0, _4690);
        bool _4694 = _4692 != _4688;
        bool _4696 = isnan(_4692);
        bool _4698 = _4694 || _4696;
        bool _4700 = isnan(_4688);
        bool _4702 = _4698 || _4700;
        bool _4704 = !_4702;
        if (!_4704)
        {
            float _4706 = fma(_1442, 2.0, _1066);
            float _4708 = fma(_1440, 2.0, _960);
            float3 _14517 = float3(_4708, _4706, float(int(_910)));
            float3 _14519 = select(_14517, float3(0.0), isnan(_14517));
            float _4710 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14519.xy, uint(rint(_14519.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14519.xy, uint(rint(_14519.z))).x;
            float _4712 = fma(_1444, 2.0, _1056);
            float _4714 = _1444 * 4.5;
            float _4716 = -_4712;
            float _4718 = _4716 + _4710;
            float _4720 = _4718 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _4722 = precise::max(_4720, _4714);
            float _4724 = precise::min(0.0, _4722);
            bool _4726 = _4724 != _4720;
            bool _4728 = isnan(_4724);
            bool _4730 = _4726 || _4728;
            bool _4732 = isnan(_4720);
            bool _4734 = _4730 || _4732;
            bool _4736 = !_4734;
            if (!_4736)
            {
                float _4738 = fma(_1442, 3.0, _1066);
                float _4740 = fma(_1440, 3.0, _960);
                float3 _14571 = float3(_4740, _4738, float(int(_910)));
                float3 _14573 = select(_14571, float3(0.0), isnan(_14571));
                float _4742 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14573.xy, uint(rint(_14573.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14573.xy, uint(rint(_14573.z))).x;
                float _4744 = fma(_1444, 3.0, _1056);
                float _4746 = _1444 * 6.0;
                float _4748 = -_4744;
                float _4750 = _4748 + _4742;
                float _4752 = _4750 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _4754 = precise::max(_4752, _4746);
                float _4756 = precise::min(0.0, _4754);
                bool _4758 = _4756 != _4752;
                bool _4760 = isnan(_4756);
                bool _4762 = _4758 || _4760;
                bool _4764 = isnan(_4752);
                bool _4766 = _4762 || _4764;
                bool _4768 = !_4766;
                if (!_4768)
                {
                    float _4770 = fma(_1442, 4.0, _1066);
                    float _4772 = fma(_1440, 4.0, _960);
                    float3 _14625 = float3(_4772, _4770, float(int(_910)));
                    float3 _14627 = select(_14625, float3(0.0), isnan(_14625));
                    float _4774 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14627.xy, uint(rint(_14627.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14627.xy, uint(rint(_14627.z))).x;
                    float _4776 = fma(_1444, 4.0, _1056);
                    float _4778 = _1444 * 7.5;
                    float _4780 = -_4776;
                    float _4782 = _4780 + _4774;
                    float _4784 = _4782 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _4786 = precise::max(_4784, _4778);
                    float _4788 = precise::min(0.0, _4786);
                    bool _4790 = _4788 != _4784;
                    bool _4792 = isnan(_4788);
                    bool _4794 = _4790 || _4792;
                    bool _4796 = isnan(_4784);
                    bool _4798 = _4794 || _4796;
                    bool _4800 = !_4798;
                    if (!_4800)
                    {
                        float _4802 = fma(_1442, 5.0, _1066);
                        float _4804 = fma(_1440, 5.0, _960);
                        float3 _14679 = float3(_4804, _4802, float(int(_910)));
                        float3 _14681 = select(_14679, float3(0.0), isnan(_14679));
                        float _4806 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14681.xy, uint(rint(_14681.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14681.xy, uint(rint(_14681.z))).x;
                        float _4808 = fma(_1444, 5.0, _1056);
                        float _4810 = _1444 * 9.0;
                        float _4812 = -_4808;
                        float _4814 = _4812 + _4806;
                        float _4816 = _4814 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _4818 = precise::max(_4816, _4810);
                        float _4820 = precise::min(0.0, _4818);
                        bool _4822 = _4820 != _4816;
                        bool _4824 = isnan(_4820);
                        bool _4826 = _4822 || _4824;
                        bool _4828 = isnan(_4816);
                        bool _4830 = _4826 || _4828;
                        bool _4832 = !_4830;
                        if (!_4832)
                        {
                            float _4834 = fma(_1442, 6.0, _1066);
                            float _4836 = fma(_1440, 6.0, _960);
                            float3 _14733 = float3(_4836, _4834, float(int(_910)));
                            float3 _14735 = select(_14733, float3(0.0), isnan(_14733));
                            float _4838 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14735.xy, uint(rint(_14735.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14735.xy, uint(rint(_14735.z))).x;
                            float _4840 = fma(_1444, 6.0, _1056);
                            float _4842 = _1444 * 10.5;
                            float _4844 = -_4840;
                            float _4846 = _4844 + _4838;
                            float _4848 = _4846 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _4850 = precise::max(_4848, _4842);
                            float _4852 = precise::min(0.0, _4850);
                            bool _4854 = _4852 != _4848;
                            bool _4856 = isnan(_4852);
                            bool _4858 = _4854 || _4856;
                            bool _4860 = isnan(_4848);
                            bool _4862 = _4858 || _4860;
                            bool _4864 = !_4862;
                            if (!_4864)
                            {
                                float _4866 = fma(_1442, 7.0, _1066);
                                float _4868 = fma(_1440, 7.0, _960);
                                float3 _14787 = float3(_4868, _4866, float(int(_910)));
                                float3 _14789 = select(_14787, float3(0.0), isnan(_14787));
                                float _4870 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14789.xy, uint(rint(_14789.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14789.xy, uint(rint(_14789.z))).x;
                                float _4872 = fma(_1444, 7.0, _1056);
                                float _4874 = _1444 * 12.0;
                                float _4876 = -_4872;
                                float _4878 = _4876 + _4870;
                                float _4880 = _4878 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _4882 = precise::max(_4880, _4874);
                                float _4884 = precise::min(0.0, _4882);
                                bool _4886 = _4884 != _4880;
                                bool _4888 = isnan(_4884);
                                bool _4890 = _4886 || _4888;
                                bool _4892 = isnan(_4880);
                                bool _4894 = _4890 || _4892;
                                bool _4896 = !_4894;
                                if (!_4896)
                                {
                                    float _4898 = fma(_1442, 8.0, _1066);
                                    float _4900 = fma(_1440, 8.0, _960);
                                    float3 _14841 = float3(_4900, _4898, float(int(_910)));
                                    float3 _14843 = select(_14841, float3(0.0), isnan(_14841));
                                    float _4902 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14843.xy, uint(rint(_14843.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14843.xy, uint(rint(_14843.z))).x;
                                    float _4904 = fma(_1444, 8.0, _1056);
                                    float _4906 = _1444 * 13.5;
                                    float _4908 = -_4904;
                                    float _4910 = _4908 + _4902;
                                    float _4912 = _4910 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _4914 = precise::max(_4912, _4906);
                                    float _4916 = precise::min(0.0, _4914);
                                    bool _4918 = _4916 != _4912;
                                    bool _4920 = isnan(_4916);
                                    bool _4922 = _4918 || _4920;
                                    bool _4924 = isnan(_4912);
                                    bool _4926 = _4922 || _4924;
                                    bool _4928 = !_4926;
                                    if (!_4928)
                                    {
                                        float _4930 = fma(_1442, 9.0, _1066);
                                        float _4932 = fma(_1440, 9.0, _960);
                                        float3 _14895 = float3(_4932, _4930, float(int(_910)));
                                        float3 _14897 = select(_14895, float3(0.0), isnan(_14895));
                                        float _4934 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14897.xy, uint(rint(_14897.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14897.xy, uint(rint(_14897.z))).x;
                                        float _4936 = fma(_1444, 9.0, _1056);
                                        float _4938 = _1444 * 15.0;
                                        float _4940 = -_4936;
                                        float _4942 = _4940 + _4934;
                                        float _4944 = _4942 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _4946 = precise::max(_4944, _4938);
                                        float _4948 = precise::min(0.0, _4946);
                                        bool _4950 = _4948 != _4944;
                                        bool _4952 = isnan(_4948);
                                        bool _4954 = _4950 || _4952;
                                        bool _4956 = isnan(_4944);
                                        bool _4958 = _4954 || _4956;
                                        bool _4960 = !_4958;
                                        if (!_4960)
                                        {
                                            float _4962 = fma(_1442, 10.0, _1066);
                                            float _4964 = fma(_1440, 10.0, _960);
                                            float3 _14949 = float3(_4964, _4962, float(int(_910)));
                                            float3 _14951 = select(_14949, float3(0.0), isnan(_14949));
                                            float _4966 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _14951.xy, uint(rint(_14951.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _14951.xy, uint(rint(_14951.z))).x;
                                            float _4968 = fma(_1444, 10.0, _1056);
                                            float _4970 = _1444 * 16.5;
                                            float _4972 = -_4968;
                                            float _4974 = _4972 + _4966;
                                            float _4976 = _4974 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _4978 = precise::max(_4976, _4970);
                                            float _4980 = precise::min(0.0, _4978);
                                            bool _4982 = _4980 != _4976;
                                            bool _4984 = isnan(_4980);
                                            bool _4986 = _4982 || _4984;
                                            bool _4988 = isnan(_4976);
                                            bool _4990 = _4986 || _4988;
                                            bool _4992 = !_4990;
                                            if (!_4992)
                                            {
                                                float _4994 = fma(_1442, 11.0, _1066);
                                                float _4996 = fma(_1440, 11.0, _960);
                                                float3 _15003 = float3(_4996, _4994, float(int(_910)));
                                                float3 _15005 = select(_15003, float3(0.0), isnan(_15003));
                                                float _4998 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15005.xy, uint(rint(_15005.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15005.xy, uint(rint(_15005.z))).x;
                                                float _5000 = fma(_1444, 11.0, _1056);
                                                float _5002 = _1444 * 18.0;
                                                float _5004 = -_5000;
                                                float _5006 = _5004 + _4998;
                                                float _5008 = _5006 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _5010 = precise::max(_5008, _5002);
                                                float _5012 = precise::min(0.0, _5010);
                                                bool _5014 = _5012 != _5008;
                                                bool _5016 = isnan(_5012);
                                                bool _5018 = _5014 || _5016;
                                                bool _5020 = isnan(_5008);
                                                bool _5022 = _5018 || _5020;
                                                bool _5024 = !_5022;
                                                if (!_5024)
                                                {
                                                    float _5026 = fma(_1442, 12.0, _1066);
                                                    float _5028 = fma(_1440, 12.0, _960);
                                                    float3 _15057 = float3(_5028, _5026, float(int(_910)));
                                                    float3 _15059 = select(_15057, float3(0.0), isnan(_15057));
                                                    float _5030 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15059.xy, uint(rint(_15059.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15059.xy, uint(rint(_15059.z))).x;
                                                    float _5032 = fma(_1444, 12.0, _1056);
                                                    float _5034 = _1444 * 19.5;
                                                    float _5036 = -_5032;
                                                    float _5038 = _5036 + _5030;
                                                    float _5040 = _5038 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _5042 = precise::max(_5040, _5034);
                                                    float _5044 = precise::min(0.0, _5042);
                                                    bool _5046 = _5044 != _5040;
                                                    bool _5048 = isnan(_5044);
                                                    bool _5050 = _5046 || _5048;
                                                    bool _5052 = isnan(_5040);
                                                    bool _5054 = _5050 || _5052;
                                                    bool _5056 = !_5054;
                                                    if (!_5056)
                                                    {
                                                        float _5058 = fma(_1442, 13.0, _1066);
                                                        float _5060 = fma(_1440, 13.0, _960);
                                                        float3 _15111 = float3(_5060, _5058, float(int(_910)));
                                                        float3 _15113 = select(_15111, float3(0.0), isnan(_15111));
                                                        float _5062 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15113.xy, uint(rint(_15113.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15113.xy, uint(rint(_15113.z))).x;
                                                        float _5064 = fma(_1444, 13.0, _1056);
                                                        float _5066 = _1444 * 21.0;
                                                        float _5068 = -_5064;
                                                        float _5070 = _5068 + _5062;
                                                        float _5072 = _5070 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _5074 = precise::max(_5072, _5066);
                                                        float _5076 = precise::min(0.0, _5074);
                                                        bool _5078 = _5076 != _5072;
                                                        bool _5080 = isnan(_5076);
                                                        bool _5082 = _5078 || _5080;
                                                        bool _5084 = isnan(_5072);
                                                        bool _5086 = _5082 || _5084;
                                                        bool _5088 = !_5086;
                                                        if (!_5088)
                                                        {
                                                            float _5090 = fma(_1442, 14.0, _1066);
                                                            float _5092 = fma(_1440, 14.0, _960);
                                                            float3 _15165 = float3(_5092, _5090, float(int(_910)));
                                                            float3 _15167 = select(_15165, float3(0.0), isnan(_15165));
                                                            float _5094 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15167.xy, uint(rint(_15167.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15167.xy, uint(rint(_15167.z))).x;
                                                            float _5096 = fma(_1444, 14.0, _1056);
                                                            float _5098 = _1444 * 22.5;
                                                            float _5100 = -_5096;
                                                            float _5102 = _5100 + _5094;
                                                            float _5104 = _5102 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _5106 = precise::max(_5104, _5098);
                                                            float _5108 = precise::min(0.0, _5106);
                                                            bool _5110 = _5108 != _5104;
                                                            bool _5112 = isnan(_5108);
                                                            bool _5114 = _5110 || _5112;
                                                            bool _5116 = isnan(_5104);
                                                            bool _5118 = _5114 || _5116;
                                                            bool _5120 = !_5118;
                                                            if (!_5120)
                                                            {
                                                                float _5122 = fma(_1442, 15.0, _1066);
                                                                float _5124 = fma(_1440, 15.0, _960);
                                                                float3 _15219 = float3(_5124, _5122, float(int(_910)));
                                                                float3 _15221 = select(_15219, float3(0.0), isnan(_15219));
                                                                float _5126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15221.xy, uint(rint(_15221.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15221.xy, uint(rint(_15221.z))).x;
                                                                float _5128 = fma(_1444, 15.0, _1056);
                                                                float _5130 = _1444 * 24.0;
                                                                float _5132 = -_5128;
                                                                float _5134 = _5132 + _5126;
                                                                float _5136 = _5134 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _5138 = precise::max(_5136, _5130);
                                                                float _5140 = precise::min(0.0, _5138);
                                                                bool _5142 = _5140 != _5136;
                                                                bool _5144 = isnan(_5140);
                                                                bool _5146 = _5142 || _5144;
                                                                bool _5148 = isnan(_5136);
                                                                bool _5150 = _5146 || _5148;
                                                                bool _5152 = !_5150;
                                                                if (!_5152)
                                                                {
                                                                    float _5154 = fma(_1442, 16.0, _1066);
                                                                    float _5156 = fma(_1440, 16.0, _960);
                                                                    float3 _15273 = float3(_5156, _5154, float(int(_910)));
                                                                    float3 _15275 = select(_15273, float3(0.0), isnan(_15273));
                                                                    float _5158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15275.xy, uint(rint(_15275.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15275.xy, uint(rint(_15275.z))).x;
                                                                    float _5160 = fma(_1444, 16.0, _1056);
                                                                    float _5162 = _1444 * 25.5;
                                                                    float _5164 = -_5160;
                                                                    float _5166 = _5164 + _5158;
                                                                    float _5168 = _5166 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _5170 = precise::max(_5168, _5162);
                                                                    float _5172 = precise::min(0.0, _5170);
                                                                    bool _5174 = _5172 != _5168;
                                                                    bool _5176 = isnan(_5172);
                                                                    bool _5178 = _5174 || _5176;
                                                                    bool _5180 = isnan(_5168);
                                                                    bool _5182 = _5178 || _5180;
                                                                    bool _5184 = !_5182;
                                                                    if (!_5184)
                                                                    {
                                                                        float _5186 = fma(_1442, 17.0, _1066);
                                                                        float _5188 = fma(_1440, 17.0, _960);
                                                                        float3 _15327 = float3(_5188, _5186, float(int(_910)));
                                                                        float3 _15329 = select(_15327, float3(0.0), isnan(_15327));
                                                                        float _5190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15329.xy, uint(rint(_15329.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15329.xy, uint(rint(_15329.z))).x;
                                                                        float _5192 = fma(_1444, 17.0, _1056);
                                                                        float _5194 = _1444 * 27.0;
                                                                        float _5196 = -_5192;
                                                                        float _5198 = _5196 + _5190;
                                                                        float _5200 = _5198 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _5202 = precise::max(_5200, _5194);
                                                                        float _5204 = precise::min(0.0, _5202);
                                                                        bool _5206 = _5204 != _5200;
                                                                        bool _5208 = isnan(_5204);
                                                                        bool _5210 = _5206 || _5208;
                                                                        bool _5212 = isnan(_5200);
                                                                        bool _5214 = _5210 || _5212;
                                                                        bool _5216 = !_5214;
                                                                        if (!_5216)
                                                                        {
                                                                            float _5218 = fma(_1442, 18.0, _1066);
                                                                            float _5220 = fma(_1440, 18.0, _960);
                                                                            float3 _15381 = float3(_5220, _5218, float(int(_910)));
                                                                            float3 _15383 = select(_15381, float3(0.0), isnan(_15381));
                                                                            float _5222 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15383.xy, uint(rint(_15383.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15383.xy, uint(rint(_15383.z))).x;
                                                                            float _5224 = fma(_1444, 18.0, _1056);
                                                                            float _5226 = fma(_1444, 28.5, -1.0);
                                                                            float _5228 = -_5224;
                                                                            float _5230 = _5228 + _5222;
                                                                            float _5232 = _5230 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _5234 = precise::max(_5232, _5226);
                                                                            float _5236 = precise::min(0.0, _5234);
                                                                            bool _5238 = _5236 != _5232;
                                                                            bool _5240 = isnan(_5236);
                                                                            bool _5242 = _5238 || _5240;
                                                                            bool _5244 = isnan(_5232);
                                                                            bool _5246 = _5242 || _5244;
                                                                            bool _5248 = !_5246;
                                                                            if (!_5248)
                                                                            {
                                                                                float _5250 = fma(_1442, 19.0, _1066);
                                                                                float _5252 = fma(_1440, 19.0, _960);
                                                                                float3 _15435 = float3(_5252, _5250, float(int(_910)));
                                                                                float3 _15437 = select(_15435, float3(0.0), isnan(_15435));
                                                                                float _5254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15437.xy, uint(rint(_15437.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15437.xy, uint(rint(_15437.z))).x;
                                                                                float _5256 = fma(_1444, 19.0, _1056);
                                                                                float _5258 = fma(_1444, 30.0, -1.0);
                                                                                float _5260 = -_5256;
                                                                                float _5262 = _5260 + _5254;
                                                                                float _5264 = _5262 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _5266 = precise::max(_5264, _5258);
                                                                                float _5268 = precise::min(0.0, _5266);
                                                                                bool _5270 = _5268 != _5264;
                                                                                bool _5272 = isnan(_5268);
                                                                                bool _5274 = _5270 || _5272;
                                                                                bool _5276 = isnan(_5264);
                                                                                bool _5278 = _5274 || _5276;
                                                                                _5280 = _5278;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5280)
    {
        float _5282 = _4652 + 1.0;
        _4672 = _5282;
    }
    _5280 = false;
    float _5284 = _4672;
    float _5286 = _1486 * 1.5;
    float _5288 = precise::max(_1492, _5286);
    float _5290 = precise::min(0.0, _5288);
    bool _5292 = _5290 != _1492;
    bool _5294 = isnan(_5290);
    bool _5296 = _5292 || _5294;
    bool _5298 = isnan(_1492);
    bool _5300 = _5296 || _5298;
    bool _5302 = !_5300;
    float _5914;
    if (!_5302)
    {
        float _5304 = _1066 + _1484;
        float _5306 = _960 + _1482;
        float3 _15537 = float3(_5306, _5304, float(int(_910)));
        float3 _15539 = select(_15537, float3(0.0), isnan(_15537));
        float _5308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15539.xy, uint(rint(_15539.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15539.xy, uint(rint(_15539.z))).x;
        float _5310 = _1056 + _1486;
        float _5312 = _1486 * 3.0;
        float _5314 = -_5310;
        float _5316 = _5314 + _5308;
        float _5318 = _5316 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5320 = precise::max(_5318, _5312);
        float _5322 = precise::min(0.0, _5320);
        bool _5324 = _5322 != _5318;
        bool _5326 = isnan(_5322);
        bool _5328 = _5324 || _5326;
        bool _5330 = isnan(_5318);
        bool _5332 = _5328 || _5330;
        bool _5334 = !_5332;
        if (!_5334)
        {
            float _5336 = fma(_1484, 2.0, _1066);
            float _5338 = fma(_1482, 2.0, _960);
            float3 _15591 = float3(_5338, _5336, float(int(_910)));
            float3 _15593 = select(_15591, float3(0.0), isnan(_15591));
            float _5340 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15593.xy, uint(rint(_15593.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15593.xy, uint(rint(_15593.z))).x;
            float _5342 = fma(_1486, 2.0, _1056);
            float _5344 = _1486 * 4.5;
            float _5346 = -_5342;
            float _5348 = _5346 + _5340;
            float _5350 = _5348 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5352 = precise::max(_5350, _5344);
            float _5354 = precise::min(0.0, _5352);
            bool _5356 = _5354 != _5350;
            bool _5358 = isnan(_5354);
            bool _5360 = _5356 || _5358;
            bool _5362 = isnan(_5350);
            bool _5364 = _5360 || _5362;
            bool _5366 = !_5364;
            if (!_5366)
            {
                float _5368 = fma(_1484, 3.0, _1066);
                float _5370 = fma(_1482, 3.0, _960);
                float3 _15645 = float3(_5370, _5368, float(int(_910)));
                float3 _15647 = select(_15645, float3(0.0), isnan(_15645));
                float _5372 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15647.xy, uint(rint(_15647.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15647.xy, uint(rint(_15647.z))).x;
                float _5374 = fma(_1486, 3.0, _1056);
                float _5376 = _1486 * 6.0;
                float _5378 = -_5374;
                float _5380 = _5378 + _5372;
                float _5382 = _5380 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _5384 = precise::max(_5382, _5376);
                float _5386 = precise::min(0.0, _5384);
                bool _5388 = _5386 != _5382;
                bool _5390 = isnan(_5386);
                bool _5392 = _5388 || _5390;
                bool _5394 = isnan(_5382);
                bool _5396 = _5392 || _5394;
                bool _5398 = !_5396;
                if (!_5398)
                {
                    float _5400 = fma(_1484, 4.0, _1066);
                    float _5402 = fma(_1482, 4.0, _960);
                    float3 _15699 = float3(_5402, _5400, float(int(_910)));
                    float3 _15701 = select(_15699, float3(0.0), isnan(_15699));
                    float _5404 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15701.xy, uint(rint(_15701.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15701.xy, uint(rint(_15701.z))).x;
                    float _5406 = fma(_1486, 4.0, _1056);
                    float _5408 = _1486 * 7.5;
                    float _5410 = -_5406;
                    float _5412 = _5410 + _5404;
                    float _5414 = _5412 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _5416 = precise::max(_5414, _5408);
                    float _5418 = precise::min(0.0, _5416);
                    bool _5420 = _5418 != _5414;
                    bool _5422 = isnan(_5418);
                    bool _5424 = _5420 || _5422;
                    bool _5426 = isnan(_5414);
                    bool _5428 = _5424 || _5426;
                    bool _5430 = !_5428;
                    if (!_5430)
                    {
                        float _5432 = fma(_1484, 5.0, _1066);
                        float _5434 = fma(_1482, 5.0, _960);
                        float3 _15753 = float3(_5434, _5432, float(int(_910)));
                        float3 _15755 = select(_15753, float3(0.0), isnan(_15753));
                        float _5436 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15755.xy, uint(rint(_15755.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15755.xy, uint(rint(_15755.z))).x;
                        float _5438 = fma(_1486, 5.0, _1056);
                        float _5440 = _1486 * 9.0;
                        float _5442 = -_5438;
                        float _5444 = _5442 + _5436;
                        float _5446 = _5444 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _5448 = precise::max(_5446, _5440);
                        float _5450 = precise::min(0.0, _5448);
                        bool _5452 = _5450 != _5446;
                        bool _5454 = isnan(_5450);
                        bool _5456 = _5452 || _5454;
                        bool _5458 = isnan(_5446);
                        bool _5460 = _5456 || _5458;
                        bool _5462 = !_5460;
                        if (!_5462)
                        {
                            float _5464 = fma(_1484, 6.0, _1066);
                            float _5466 = fma(_1482, 6.0, _960);
                            float3 _15807 = float3(_5466, _5464, float(int(_910)));
                            float3 _15809 = select(_15807, float3(0.0), isnan(_15807));
                            float _5468 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15809.xy, uint(rint(_15809.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15809.xy, uint(rint(_15809.z))).x;
                            float _5470 = fma(_1486, 6.0, _1056);
                            float _5472 = _1486 * 10.5;
                            float _5474 = -_5470;
                            float _5476 = _5474 + _5468;
                            float _5478 = _5476 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _5480 = precise::max(_5478, _5472);
                            float _5482 = precise::min(0.0, _5480);
                            bool _5484 = _5482 != _5478;
                            bool _5486 = isnan(_5482);
                            bool _5488 = _5484 || _5486;
                            bool _5490 = isnan(_5478);
                            bool _5492 = _5488 || _5490;
                            bool _5494 = !_5492;
                            if (!_5494)
                            {
                                float _5496 = fma(_1484, 7.0, _1066);
                                float _5498 = fma(_1482, 7.0, _960);
                                float3 _15861 = float3(_5498, _5496, float(int(_910)));
                                float3 _15863 = select(_15861, float3(0.0), isnan(_15861));
                                float _5500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15863.xy, uint(rint(_15863.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15863.xy, uint(rint(_15863.z))).x;
                                float _5502 = fma(_1486, 7.0, _1056);
                                float _5504 = _1486 * 12.0;
                                float _5506 = -_5502;
                                float _5508 = _5506 + _5500;
                                float _5510 = _5508 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _5512 = precise::max(_5510, _5504);
                                float _5514 = precise::min(0.0, _5512);
                                bool _5516 = _5514 != _5510;
                                bool _5518 = isnan(_5514);
                                bool _5520 = _5516 || _5518;
                                bool _5522 = isnan(_5510);
                                bool _5524 = _5520 || _5522;
                                bool _5526 = !_5524;
                                if (!_5526)
                                {
                                    float _5528 = fma(_1484, 8.0, _1066);
                                    float _5530 = fma(_1482, 8.0, _960);
                                    float3 _15915 = float3(_5530, _5528, float(int(_910)));
                                    float3 _15917 = select(_15915, float3(0.0), isnan(_15915));
                                    float _5532 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15917.xy, uint(rint(_15917.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15917.xy, uint(rint(_15917.z))).x;
                                    float _5534 = fma(_1486, 8.0, _1056);
                                    float _5536 = _1486 * 13.5;
                                    float _5538 = -_5534;
                                    float _5540 = _5538 + _5532;
                                    float _5542 = _5540 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _5544 = precise::max(_5542, _5536);
                                    float _5546 = precise::min(0.0, _5544);
                                    bool _5548 = _5546 != _5542;
                                    bool _5550 = isnan(_5546);
                                    bool _5552 = _5548 || _5550;
                                    bool _5554 = isnan(_5542);
                                    bool _5556 = _5552 || _5554;
                                    bool _5558 = !_5556;
                                    if (!_5558)
                                    {
                                        float _5560 = fma(_1484, 9.0, _1066);
                                        float _5562 = fma(_1482, 9.0, _960);
                                        float3 _15969 = float3(_5562, _5560, float(int(_910)));
                                        float3 _15971 = select(_15969, float3(0.0), isnan(_15969));
                                        float _5564 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _15971.xy, uint(rint(_15971.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _15971.xy, uint(rint(_15971.z))).x;
                                        float _5566 = fma(_1486, 9.0, _1056);
                                        float _5568 = _1486 * 15.0;
                                        float _5570 = -_5566;
                                        float _5572 = _5570 + _5564;
                                        float _5574 = _5572 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _5576 = precise::max(_5574, _5568);
                                        float _5578 = precise::min(0.0, _5576);
                                        bool _5580 = _5578 != _5574;
                                        bool _5582 = isnan(_5578);
                                        bool _5584 = _5580 || _5582;
                                        bool _5586 = isnan(_5574);
                                        bool _5588 = _5584 || _5586;
                                        bool _5590 = !_5588;
                                        if (!_5590)
                                        {
                                            float _5592 = fma(_1484, 10.0, _1066);
                                            float _5594 = fma(_1482, 10.0, _960);
                                            float3 _16023 = float3(_5594, _5592, float(int(_910)));
                                            float3 _16025 = select(_16023, float3(0.0), isnan(_16023));
                                            float _5596 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16025.xy, uint(rint(_16025.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16025.xy, uint(rint(_16025.z))).x;
                                            float _5598 = fma(_1486, 10.0, _1056);
                                            float _5600 = _1486 * 16.5;
                                            float _5602 = -_5598;
                                            float _5604 = _5602 + _5596;
                                            float _5606 = _5604 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _5608 = precise::max(_5606, _5600);
                                            float _5610 = precise::min(0.0, _5608);
                                            bool _5612 = _5610 != _5606;
                                            bool _5614 = isnan(_5610);
                                            bool _5616 = _5612 || _5614;
                                            bool _5618 = isnan(_5606);
                                            bool _5620 = _5616 || _5618;
                                            bool _5622 = !_5620;
                                            if (!_5622)
                                            {
                                                float _5624 = fma(_1484, 11.0, _1066);
                                                float _5626 = fma(_1482, 11.0, _960);
                                                float3 _16077 = float3(_5626, _5624, float(int(_910)));
                                                float3 _16079 = select(_16077, float3(0.0), isnan(_16077));
                                                float _5628 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16079.xy, uint(rint(_16079.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16079.xy, uint(rint(_16079.z))).x;
                                                float _5630 = fma(_1486, 11.0, _1056);
                                                float _5632 = _1486 * 18.0;
                                                float _5634 = -_5630;
                                                float _5636 = _5634 + _5628;
                                                float _5638 = _5636 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _5640 = precise::max(_5638, _5632);
                                                float _5642 = precise::min(0.0, _5640);
                                                bool _5644 = _5642 != _5638;
                                                bool _5646 = isnan(_5642);
                                                bool _5648 = _5644 || _5646;
                                                bool _5650 = isnan(_5638);
                                                bool _5652 = _5648 || _5650;
                                                bool _5654 = !_5652;
                                                if (!_5654)
                                                {
                                                    float _5656 = fma(_1484, 12.0, _1066);
                                                    float _5658 = fma(_1482, 12.0, _960);
                                                    float3 _16131 = float3(_5658, _5656, float(int(_910)));
                                                    float3 _16133 = select(_16131, float3(0.0), isnan(_16131));
                                                    float _5660 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16133.xy, uint(rint(_16133.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16133.xy, uint(rint(_16133.z))).x;
                                                    float _5662 = fma(_1486, 12.0, _1056);
                                                    float _5664 = _1486 * 19.5;
                                                    float _5666 = -_5662;
                                                    float _5668 = _5666 + _5660;
                                                    float _5670 = _5668 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _5672 = precise::max(_5670, _5664);
                                                    float _5674 = precise::min(0.0, _5672);
                                                    bool _5676 = _5674 != _5670;
                                                    bool _5678 = isnan(_5674);
                                                    bool _5680 = _5676 || _5678;
                                                    bool _5682 = isnan(_5670);
                                                    bool _5684 = _5680 || _5682;
                                                    bool _5686 = !_5684;
                                                    if (!_5686)
                                                    {
                                                        float _5688 = fma(_1484, 13.0, _1066);
                                                        float _5690 = fma(_1482, 13.0, _960);
                                                        float3 _16185 = float3(_5690, _5688, float(int(_910)));
                                                        float3 _16187 = select(_16185, float3(0.0), isnan(_16185));
                                                        float _5692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16187.xy, uint(rint(_16187.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16187.xy, uint(rint(_16187.z))).x;
                                                        float _5694 = fma(_1486, 13.0, _1056);
                                                        float _5696 = _1486 * 21.0;
                                                        float _5698 = -_5694;
                                                        float _5700 = _5698 + _5692;
                                                        float _5702 = _5700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _5704 = precise::max(_5702, _5696);
                                                        float _5706 = precise::min(0.0, _5704);
                                                        bool _5708 = _5706 != _5702;
                                                        bool _5710 = isnan(_5706);
                                                        bool _5712 = _5708 || _5710;
                                                        bool _5714 = isnan(_5702);
                                                        bool _5716 = _5712 || _5714;
                                                        bool _5718 = !_5716;
                                                        if (!_5718)
                                                        {
                                                            float _5720 = fma(_1484, 14.0, _1066);
                                                            float _5722 = fma(_1482, 14.0, _960);
                                                            float3 _16239 = float3(_5722, _5720, float(int(_910)));
                                                            float3 _16241 = select(_16239, float3(0.0), isnan(_16239));
                                                            float _5724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16241.xy, uint(rint(_16241.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16241.xy, uint(rint(_16241.z))).x;
                                                            float _5726 = fma(_1486, 14.0, _1056);
                                                            float _5728 = _1486 * 22.5;
                                                            float _5730 = -_5726;
                                                            float _5732 = _5730 + _5724;
                                                            float _5734 = _5732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _5736 = precise::max(_5734, _5728);
                                                            float _5738 = precise::min(0.0, _5736);
                                                            bool _5740 = _5738 != _5734;
                                                            bool _5742 = isnan(_5738);
                                                            bool _5744 = _5740 || _5742;
                                                            bool _5746 = isnan(_5734);
                                                            bool _5748 = _5744 || _5746;
                                                            bool _5750 = !_5748;
                                                            if (!_5750)
                                                            {
                                                                float _5752 = fma(_1484, 15.0, _1066);
                                                                float _5754 = fma(_1482, 15.0, _960);
                                                                float3 _16293 = float3(_5754, _5752, float(int(_910)));
                                                                float3 _16295 = select(_16293, float3(0.0), isnan(_16293));
                                                                float _5756 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16295.xy, uint(rint(_16295.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16295.xy, uint(rint(_16295.z))).x;
                                                                float _5758 = fma(_1486, 15.0, _1056);
                                                                float _5760 = _1486 * 24.0;
                                                                float _5762 = -_5758;
                                                                float _5764 = _5762 + _5756;
                                                                float _5766 = _5764 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _5768 = precise::max(_5766, _5760);
                                                                float _5770 = precise::min(0.0, _5768);
                                                                bool _5772 = _5770 != _5766;
                                                                bool _5774 = isnan(_5770);
                                                                bool _5776 = _5772 || _5774;
                                                                bool _5778 = isnan(_5766);
                                                                bool _5780 = _5776 || _5778;
                                                                bool _5782 = !_5780;
                                                                if (!_5782)
                                                                {
                                                                    float _5784 = fma(_1484, 16.0, _1066);
                                                                    float _5786 = fma(_1482, 16.0, _960);
                                                                    float3 _16347 = float3(_5786, _5784, float(int(_910)));
                                                                    float3 _16349 = select(_16347, float3(0.0), isnan(_16347));
                                                                    float _5788 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16349.xy, uint(rint(_16349.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16349.xy, uint(rint(_16349.z))).x;
                                                                    float _5790 = fma(_1486, 16.0, _1056);
                                                                    float _5792 = _1486 * 25.5;
                                                                    float _5794 = -_5790;
                                                                    float _5796 = _5794 + _5788;
                                                                    float _5798 = _5796 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _5800 = precise::max(_5798, _5792);
                                                                    float _5802 = precise::min(0.0, _5800);
                                                                    bool _5804 = _5802 != _5798;
                                                                    bool _5806 = isnan(_5802);
                                                                    bool _5808 = _5804 || _5806;
                                                                    bool _5810 = isnan(_5798);
                                                                    bool _5812 = _5808 || _5810;
                                                                    bool _5814 = !_5812;
                                                                    if (!_5814)
                                                                    {
                                                                        float _5816 = fma(_1484, 17.0, _1066);
                                                                        float _5818 = fma(_1482, 17.0, _960);
                                                                        float3 _16401 = float3(_5818, _5816, float(int(_910)));
                                                                        float3 _16403 = select(_16401, float3(0.0), isnan(_16401));
                                                                        float _5820 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16403.xy, uint(rint(_16403.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16403.xy, uint(rint(_16403.z))).x;
                                                                        float _5822 = fma(_1486, 17.0, _1056);
                                                                        float _5824 = _1486 * 27.0;
                                                                        float _5826 = -_5822;
                                                                        float _5828 = _5826 + _5820;
                                                                        float _5830 = _5828 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _5832 = precise::max(_5830, _5824);
                                                                        float _5834 = precise::min(0.0, _5832);
                                                                        bool _5836 = _5834 != _5830;
                                                                        bool _5838 = isnan(_5834);
                                                                        bool _5840 = _5836 || _5838;
                                                                        bool _5842 = isnan(_5830);
                                                                        bool _5844 = _5840 || _5842;
                                                                        bool _5846 = !_5844;
                                                                        if (!_5846)
                                                                        {
                                                                            float _5848 = fma(_1484, 18.0, _1066);
                                                                            float _5850 = fma(_1482, 18.0, _960);
                                                                            float3 _16455 = float3(_5850, _5848, float(int(_910)));
                                                                            float3 _16457 = select(_16455, float3(0.0), isnan(_16455));
                                                                            float _5852 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16457.xy, uint(rint(_16457.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16457.xy, uint(rint(_16457.z))).x;
                                                                            float _5854 = fma(_1486, 18.0, _1056);
                                                                            float _5856 = fma(_1486, 28.5, -1.0);
                                                                            float _5858 = -_5854;
                                                                            float _5860 = _5858 + _5852;
                                                                            float _5862 = _5860 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _5864 = precise::max(_5862, _5856);
                                                                            float _5866 = precise::min(0.0, _5864);
                                                                            bool _5868 = _5866 != _5862;
                                                                            bool _5870 = isnan(_5866);
                                                                            bool _5872 = _5868 || _5870;
                                                                            bool _5874 = isnan(_5862);
                                                                            bool _5876 = _5872 || _5874;
                                                                            bool _5878 = !_5876;
                                                                            if (!_5878)
                                                                            {
                                                                                float _5880 = fma(_1484, 19.0, _1066);
                                                                                float _5882 = fma(_1482, 19.0, _960);
                                                                                float3 _16509 = float3(_5882, _5880, float(int(_910)));
                                                                                float3 _16511 = select(_16509, float3(0.0), isnan(_16509));
                                                                                float _5884 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16511.xy, uint(rint(_16511.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16511.xy, uint(rint(_16511.z))).x;
                                                                                float _5886 = fma(_1486, 19.0, _1056);
                                                                                float _5888 = fma(_1486, 30.0, -1.0);
                                                                                float _5890 = -_5886;
                                                                                float _5892 = _5890 + _5884;
                                                                                float _5894 = _5892 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _5896 = precise::max(_5894, _5888);
                                                                                float _5898 = precise::min(0.0, _5896);
                                                                                bool _5900 = _5898 != _5894;
                                                                                bool _5902 = isnan(_5898);
                                                                                bool _5904 = _5900 || _5902;
                                                                                bool _5906 = isnan(_5894);
                                                                                bool _5908 = _5904 || _5906;
                                                                                float _5910 = _5894;
                                                                                if (_5908)
                                                                                {
                                                                                    _5910 = _5284;
                                                                                }
                                                                                float _5912 = _5910;
                                                                                _5914 = _5912;
                                                                                _5916 = _5908;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_5916)
    {
        float _5918 = _5284 + 1.0;
        _5914 = _5918;
    }
    _5916 = false;
    float _5920 = _5914;
    float _5922 = _1466 * 1.5;
    float _5924 = precise::max(_1492, _5922);
    float _5926 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _5928 = 1.0 + _5926;
    float _5930 = precise::min(0.0, _5924);
    bool _5932 = _5930 != _1492;
    bool _5934 = isnan(_5930);
    bool _5936 = _5932 || _5934;
    bool _5938 = isnan(_1492);
    bool _5940 = _5936 || _5938;
    float _5942 = fma(_5928, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _5944 = _5942 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _5946 = !_5940;
    float _5948 = _5920;
    if (!_5946)
    {
        float _5950 = _1066 + _1464;
        float _5952 = _960 + _1462;
        float3 _16634 = float3(_5952, _5950, float(int(_910)));
        float3 _16636 = select(_16634, float3(0.0), isnan(_16634));
        float _5954 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16636.xy, uint(rint(_16636.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16636.xy, uint(rint(_16636.z))).x;
        float _5956 = _1056 + _1466;
        float _5958 = _1466 * 3.0;
        float _5960 = -_5956;
        float _5962 = _5960 + _5954;
        float _5964 = _5962 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _5966 = precise::max(_5964, _5958);
        float _5968 = precise::min(0.0, _5966);
        bool _5970 = _5968 != _5964;
        bool _5972 = isnan(_5968);
        bool _5974 = _5970 || _5972;
        bool _5976 = isnan(_5964);
        bool _5978 = _5974 || _5976;
        bool _5980 = !_5978;
        if (!_5980)
        {
            float _5982 = fma(_1464, 2.0, _1066);
            float _5984 = fma(_1462, 2.0, _960);
            float3 _16688 = float3(_5984, _5982, float(int(_910)));
            float3 _16690 = select(_16688, float3(0.0), isnan(_16688));
            float _5986 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16690.xy, uint(rint(_16690.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16690.xy, uint(rint(_16690.z))).x;
            float _5988 = fma(_1466, 2.0, _1056);
            float _5990 = _1466 * 4.5;
            float _5992 = -_5988;
            float _5994 = _5992 + _5986;
            float _5996 = _5994 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _5998 = precise::max(_5996, _5990);
            float _6000 = precise::min(0.0, _5998);
            bool _6002 = _6000 != _5996;
            bool _6004 = isnan(_6000);
            bool _6006 = _6002 || _6004;
            bool _6008 = isnan(_5996);
            bool _6010 = _6006 || _6008;
            bool _6012 = !_6010;
            if (!_6012)
            {
                float _6014 = fma(_1464, 3.0, _1066);
                float _6016 = fma(_1462, 3.0, _960);
                float3 _16742 = float3(_6016, _6014, float(int(_910)));
                float3 _16744 = select(_16742, float3(0.0), isnan(_16742));
                float _6018 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16744.xy, uint(rint(_16744.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16744.xy, uint(rint(_16744.z))).x;
                float _6020 = fma(_1466, 3.0, _1056);
                float _6022 = _1466 * 6.0;
                float _6024 = -_6020;
                float _6026 = _6024 + _6018;
                float _6028 = _6026 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _6030 = precise::max(_6028, _6022);
                float _6032 = precise::min(0.0, _6030);
                bool _6034 = _6032 != _6028;
                bool _6036 = isnan(_6032);
                bool _6038 = _6034 || _6036;
                bool _6040 = isnan(_6028);
                bool _6042 = _6038 || _6040;
                bool _6044 = !_6042;
                if (!_6044)
                {
                    float _6046 = fma(_1464, 4.0, _1066);
                    float _6048 = fma(_1462, 4.0, _960);
                    float3 _16796 = float3(_6048, _6046, float(int(_910)));
                    float3 _16798 = select(_16796, float3(0.0), isnan(_16796));
                    float _6050 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16798.xy, uint(rint(_16798.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16798.xy, uint(rint(_16798.z))).x;
                    float _6052 = fma(_1466, 4.0, _1056);
                    float _6054 = _1466 * 7.5;
                    float _6056 = -_6052;
                    float _6058 = _6056 + _6050;
                    float _6060 = _6058 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _6062 = precise::max(_6060, _6054);
                    float _6064 = precise::min(0.0, _6062);
                    bool _6066 = _6064 != _6060;
                    bool _6068 = isnan(_6064);
                    bool _6070 = _6066 || _6068;
                    bool _6072 = isnan(_6060);
                    bool _6074 = _6070 || _6072;
                    bool _6076 = !_6074;
                    if (!_6076)
                    {
                        float _6078 = fma(_1464, 5.0, _1066);
                        float _6080 = fma(_1462, 5.0, _960);
                        float3 _16850 = float3(_6080, _6078, float(int(_910)));
                        float3 _16852 = select(_16850, float3(0.0), isnan(_16850));
                        float _6082 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16852.xy, uint(rint(_16852.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16852.xy, uint(rint(_16852.z))).x;
                        float _6084 = fma(_1466, 5.0, _1056);
                        float _6086 = _1466 * 9.0;
                        float _6088 = -_6084;
                        float _6090 = _6088 + _6082;
                        float _6092 = _6090 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _6094 = precise::max(_6092, _6086);
                        float _6096 = precise::min(0.0, _6094);
                        bool _6098 = _6096 != _6092;
                        bool _6100 = isnan(_6096);
                        bool _6102 = _6098 || _6100;
                        bool _6104 = isnan(_6092);
                        bool _6106 = _6102 || _6104;
                        bool _6108 = !_6106;
                        if (!_6108)
                        {
                            float _6110 = fma(_1464, 6.0, _1066);
                            float _6112 = fma(_1462, 6.0, _960);
                            float3 _16904 = float3(_6112, _6110, float(int(_910)));
                            float3 _16906 = select(_16904, float3(0.0), isnan(_16904));
                            float _6114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16906.xy, uint(rint(_16906.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16906.xy, uint(rint(_16906.z))).x;
                            float _6116 = fma(_1466, 6.0, _1056);
                            float _6118 = _1466 * 10.5;
                            float _6120 = -_6116;
                            float _6122 = _6120 + _6114;
                            float _6124 = _6122 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _6126 = precise::max(_6124, _6118);
                            float _6128 = precise::min(0.0, _6126);
                            bool _6130 = _6128 != _6124;
                            bool _6132 = isnan(_6128);
                            bool _6134 = _6130 || _6132;
                            bool _6136 = isnan(_6124);
                            bool _6138 = _6134 || _6136;
                            bool _6140 = !_6138;
                            if (!_6140)
                            {
                                float _6142 = fma(_1464, 7.0, _1066);
                                float _6144 = fma(_1462, 7.0, _960);
                                float3 _16958 = float3(_6144, _6142, float(int(_910)));
                                float3 _16960 = select(_16958, float3(0.0), isnan(_16958));
                                float _6146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _16960.xy, uint(rint(_16960.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _16960.xy, uint(rint(_16960.z))).x;
                                float _6148 = fma(_1466, 7.0, _1056);
                                float _6150 = _1466 * 12.0;
                                float _6152 = -_6148;
                                float _6154 = _6152 + _6146;
                                float _6156 = _6154 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _6158 = precise::max(_6156, _6150);
                                float _6160 = precise::min(0.0, _6158);
                                bool _6162 = _6160 != _6156;
                                bool _6164 = isnan(_6160);
                                bool _6166 = _6162 || _6164;
                                bool _6168 = isnan(_6156);
                                bool _6170 = _6166 || _6168;
                                bool _6172 = !_6170;
                                if (!_6172)
                                {
                                    float _6174 = fma(_1464, 8.0, _1066);
                                    float _6176 = fma(_1462, 8.0, _960);
                                    float3 _17012 = float3(_6176, _6174, float(int(_910)));
                                    float3 _17014 = select(_17012, float3(0.0), isnan(_17012));
                                    float _6178 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17014.xy, uint(rint(_17014.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17014.xy, uint(rint(_17014.z))).x;
                                    float _6180 = fma(_1466, 8.0, _1056);
                                    float _6182 = _1466 * 13.5;
                                    float _6184 = -_6180;
                                    float _6186 = _6184 + _6178;
                                    float _6188 = _6186 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _6190 = precise::max(_6188, _6182);
                                    float _6192 = precise::min(0.0, _6190);
                                    bool _6194 = _6192 != _6188;
                                    bool _6196 = isnan(_6192);
                                    bool _6198 = _6194 || _6196;
                                    bool _6200 = isnan(_6188);
                                    bool _6202 = _6198 || _6200;
                                    bool _6204 = !_6202;
                                    if (!_6204)
                                    {
                                        float _6206 = fma(_1464, 9.0, _1066);
                                        float _6208 = fma(_1462, 9.0, _960);
                                        float3 _17066 = float3(_6208, _6206, float(int(_910)));
                                        float3 _17068 = select(_17066, float3(0.0), isnan(_17066));
                                        float _6210 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17068.xy, uint(rint(_17068.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17068.xy, uint(rint(_17068.z))).x;
                                        float _6212 = fma(_1466, 9.0, _1056);
                                        float _6214 = _1466 * 15.0;
                                        float _6216 = -_6212;
                                        float _6218 = _6216 + _6210;
                                        float _6220 = _6218 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _6222 = precise::max(_6220, _6214);
                                        float _6224 = precise::min(0.0, _6222);
                                        bool _6226 = _6224 != _6220;
                                        bool _6228 = isnan(_6224);
                                        bool _6230 = _6226 || _6228;
                                        bool _6232 = isnan(_6220);
                                        bool _6234 = _6230 || _6232;
                                        bool _6236 = !_6234;
                                        if (!_6236)
                                        {
                                            float _6238 = fma(_1464, 10.0, _1066);
                                            float _6240 = fma(_1462, 10.0, _960);
                                            float3 _17120 = float3(_6240, _6238, float(int(_910)));
                                            float3 _17122 = select(_17120, float3(0.0), isnan(_17120));
                                            float _6242 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17122.xy, uint(rint(_17122.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17122.xy, uint(rint(_17122.z))).x;
                                            float _6244 = fma(_1466, 10.0, _1056);
                                            float _6246 = _1466 * 16.5;
                                            float _6248 = -_6244;
                                            float _6250 = _6248 + _6242;
                                            float _6252 = _6250 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _6254 = precise::max(_6252, _6246);
                                            float _6256 = precise::min(0.0, _6254);
                                            bool _6258 = _6256 != _6252;
                                            bool _6260 = isnan(_6256);
                                            bool _6262 = _6258 || _6260;
                                            bool _6264 = isnan(_6252);
                                            bool _6266 = _6262 || _6264;
                                            bool _6268 = !_6266;
                                            if (!_6268)
                                            {
                                                float _6270 = fma(_1464, 11.0, _1066);
                                                float _6272 = fma(_1462, 11.0, _960);
                                                float3 _17174 = float3(_6272, _6270, float(int(_910)));
                                                float3 _17176 = select(_17174, float3(0.0), isnan(_17174));
                                                float _6274 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17176.xy, uint(rint(_17176.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17176.xy, uint(rint(_17176.z))).x;
                                                float _6276 = fma(_1466, 11.0, _1056);
                                                float _6278 = _1466 * 18.0;
                                                float _6280 = -_6276;
                                                float _6282 = _6280 + _6274;
                                                float _6284 = _6282 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _6286 = precise::max(_6284, _6278);
                                                float _6288 = precise::min(0.0, _6286);
                                                bool _6290 = _6288 != _6284;
                                                bool _6292 = isnan(_6288);
                                                bool _6294 = _6290 || _6292;
                                                bool _6296 = isnan(_6284);
                                                bool _6298 = _6294 || _6296;
                                                bool _6300 = !_6298;
                                                if (!_6300)
                                                {
                                                    float _6302 = fma(_1464, 12.0, _1066);
                                                    float _6304 = fma(_1462, 12.0, _960);
                                                    float3 _17228 = float3(_6304, _6302, float(int(_910)));
                                                    float3 _17230 = select(_17228, float3(0.0), isnan(_17228));
                                                    float _6306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17230.xy, uint(rint(_17230.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17230.xy, uint(rint(_17230.z))).x;
                                                    float _6308 = fma(_1466, 12.0, _1056);
                                                    float _6310 = _1466 * 19.5;
                                                    float _6312 = -_6308;
                                                    float _6314 = _6312 + _6306;
                                                    float _6316 = _6314 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _6318 = precise::max(_6316, _6310);
                                                    float _6320 = precise::min(0.0, _6318);
                                                    bool _6322 = _6320 != _6316;
                                                    bool _6324 = isnan(_6320);
                                                    bool _6326 = _6322 || _6324;
                                                    bool _6328 = isnan(_6316);
                                                    bool _6330 = _6326 || _6328;
                                                    bool _6332 = !_6330;
                                                    if (!_6332)
                                                    {
                                                        float _6334 = fma(_1464, 13.0, _1066);
                                                        float _6336 = fma(_1462, 13.0, _960);
                                                        float3 _17282 = float3(_6336, _6334, float(int(_910)));
                                                        float3 _17284 = select(_17282, float3(0.0), isnan(_17282));
                                                        float _6338 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17284.xy, uint(rint(_17284.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17284.xy, uint(rint(_17284.z))).x;
                                                        float _6340 = fma(_1466, 13.0, _1056);
                                                        float _6342 = _1466 * 21.0;
                                                        float _6344 = -_6340;
                                                        float _6346 = _6344 + _6338;
                                                        float _6348 = _6346 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _6350 = precise::max(_6348, _6342);
                                                        float _6352 = precise::min(0.0, _6350);
                                                        bool _6354 = _6352 != _6348;
                                                        bool _6356 = isnan(_6352);
                                                        bool _6358 = _6354 || _6356;
                                                        bool _6360 = isnan(_6348);
                                                        bool _6362 = _6358 || _6360;
                                                        bool _6364 = !_6362;
                                                        if (!_6364)
                                                        {
                                                            float _6366 = fma(_1464, 14.0, _1066);
                                                            float _6368 = fma(_1462, 14.0, _960);
                                                            float3 _17336 = float3(_6368, _6366, float(int(_910)));
                                                            float3 _17338 = select(_17336, float3(0.0), isnan(_17336));
                                                            float _6370 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17338.xy, uint(rint(_17338.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17338.xy, uint(rint(_17338.z))).x;
                                                            float _6372 = fma(_1466, 14.0, _1056);
                                                            float _6374 = _1466 * 22.5;
                                                            float _6376 = -_6372;
                                                            float _6378 = _6376 + _6370;
                                                            float _6380 = _6378 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _6382 = precise::max(_6380, _6374);
                                                            float _6384 = precise::min(0.0, _6382);
                                                            bool _6386 = _6384 != _6380;
                                                            bool _6388 = isnan(_6384);
                                                            bool _6390 = _6386 || _6388;
                                                            bool _6392 = isnan(_6380);
                                                            bool _6394 = _6390 || _6392;
                                                            bool _6396 = !_6394;
                                                            if (!_6396)
                                                            {
                                                                float _6398 = fma(_1464, 15.0, _1066);
                                                                float _6400 = fma(_1462, 15.0, _960);
                                                                float3 _17390 = float3(_6400, _6398, float(int(_910)));
                                                                float3 _17392 = select(_17390, float3(0.0), isnan(_17390));
                                                                float _6402 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17392.xy, uint(rint(_17392.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17392.xy, uint(rint(_17392.z))).x;
                                                                float _6404 = fma(_1466, 15.0, _1056);
                                                                float _6406 = _1466 * 24.0;
                                                                float _6408 = -_6404;
                                                                float _6410 = _6408 + _6402;
                                                                float _6412 = _6410 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _6414 = precise::max(_6412, _6406);
                                                                float _6416 = precise::min(0.0, _6414);
                                                                bool _6418 = _6416 != _6412;
                                                                bool _6420 = isnan(_6416);
                                                                bool _6422 = _6418 || _6420;
                                                                bool _6424 = isnan(_6412);
                                                                bool _6426 = _6422 || _6424;
                                                                bool _6428 = !_6426;
                                                                if (!_6428)
                                                                {
                                                                    float _6430 = fma(_1464, 16.0, _1066);
                                                                    float _6432 = fma(_1462, 16.0, _960);
                                                                    float3 _17444 = float3(_6432, _6430, float(int(_910)));
                                                                    float3 _17446 = select(_17444, float3(0.0), isnan(_17444));
                                                                    float _6434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17446.xy, uint(rint(_17446.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17446.xy, uint(rint(_17446.z))).x;
                                                                    float _6436 = fma(_1466, 16.0, _1056);
                                                                    float _6438 = _1466 * 25.5;
                                                                    float _6440 = -_6436;
                                                                    float _6442 = _6440 + _6434;
                                                                    float _6444 = _6442 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _6446 = precise::max(_6444, _6438);
                                                                    float _6448 = precise::min(0.0, _6446);
                                                                    bool _6450 = _6448 != _6444;
                                                                    bool _6452 = isnan(_6448);
                                                                    bool _6454 = _6450 || _6452;
                                                                    bool _6456 = isnan(_6444);
                                                                    bool _6458 = _6454 || _6456;
                                                                    bool _6460 = !_6458;
                                                                    if (!_6460)
                                                                    {
                                                                        float _6462 = fma(_1464, 17.0, _1066);
                                                                        float _6464 = fma(_1462, 17.0, _960);
                                                                        float3 _17498 = float3(_6464, _6462, float(int(_910)));
                                                                        float3 _17500 = select(_17498, float3(0.0), isnan(_17498));
                                                                        float _6466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17500.xy, uint(rint(_17500.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17500.xy, uint(rint(_17500.z))).x;
                                                                        float _6468 = fma(_1466, 17.0, _1056);
                                                                        float _6470 = _1466 * 27.0;
                                                                        float _6472 = -_6468;
                                                                        float _6474 = _6472 + _6466;
                                                                        float _6476 = _6474 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _6478 = precise::max(_6476, _6470);
                                                                        float _6480 = precise::min(0.0, _6478);
                                                                        bool _6482 = _6480 != _6476;
                                                                        bool _6484 = isnan(_6480);
                                                                        bool _6486 = _6482 || _6484;
                                                                        bool _6488 = isnan(_6476);
                                                                        bool _6490 = _6486 || _6488;
                                                                        bool _6492 = !_6490;
                                                                        if (!_6492)
                                                                        {
                                                                            float _6494 = fma(_1464, 18.0, _1066);
                                                                            float _6496 = fma(_1462, 18.0, _960);
                                                                            float3 _17552 = float3(_6496, _6494, float(int(_910)));
                                                                            float3 _17554 = select(_17552, float3(0.0), isnan(_17552));
                                                                            float _6498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17554.xy, uint(rint(_17554.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17554.xy, uint(rint(_17554.z))).x;
                                                                            float _6500 = fma(_1466, 18.0, _1056);
                                                                            float _6502 = fma(_1466, 28.5, -1.0);
                                                                            float _6504 = -_6500;
                                                                            float _6506 = _6504 + _6498;
                                                                            float _6508 = _6506 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _6510 = precise::max(_6508, _6502);
                                                                            float _6512 = precise::min(0.0, _6510);
                                                                            bool _6514 = _6512 != _6508;
                                                                            bool _6516 = isnan(_6512);
                                                                            bool _6518 = _6514 || _6516;
                                                                            bool _6520 = isnan(_6508);
                                                                            bool _6522 = _6518 || _6520;
                                                                            bool _6524 = !_6522;
                                                                            if (!_6524)
                                                                            {
                                                                                float _6526 = fma(_1464, 19.0, _1066);
                                                                                float _6528 = fma(_1462, 19.0, _960);
                                                                                float3 _17606 = float3(_6528, _6526, float(int(_910)));
                                                                                float3 _17608 = select(_17606, float3(0.0), isnan(_17606));
                                                                                float _6530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _17608.xy, uint(rint(_17608.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _17608.xy, uint(rint(_17608.z))).x;
                                                                                float _6532 = fma(_1466, 19.0, _1056);
                                                                                float _6534 = fma(_1466, 30.0, -1.0);
                                                                                float _6536 = -_6532;
                                                                                float _6538 = _6536 + _6530;
                                                                                float _6540 = _6538 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _6542 = precise::max(_6540, _6534);
                                                                                float _6544 = precise::min(0.0, _6542);
                                                                                bool _6546 = _6544 != _6540;
                                                                                bool _6548 = isnan(_6544);
                                                                                bool _6550 = _6546 || _6548;
                                                                                bool _6552 = isnan(_6540);
                                                                                bool _6554 = _6550 || _6552;
                                                                                _6556 = _6554;
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_6556)
    {
        float _6558 = _5920 + 1.0;
        _5948 = _6558;
    }
    _6556 = false;
    float _6560 = _5948;
    float _6562 = _6560 * 0.125;
    float _6564 = -_6562;
    float _6566 = fma(_6564, _5944, 1.0);
    out.m_39.x = _6566;
    return out;
}

