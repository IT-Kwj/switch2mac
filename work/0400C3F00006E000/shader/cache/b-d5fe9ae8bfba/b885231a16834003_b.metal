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
    bool _2600 = false;
    bool _2586 = false;
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
    float2 _2641 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2641, float2(0.0), isnan(_2641))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2641, float2(0.0), isnan(_2641))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _74 * _72;
    float _80 = _74 * _76;
    float _82 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _86 = _80 * _84;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _90 = _80 * _88;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _94 = _80 * _92;
    bool _98 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _100 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _86);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _90);
    float _104 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, _94);
    bool _106 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _108 = -_82;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _112 = -_82;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].z, _102);
    float _116 = -_82;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].z, _104);
    bool _120 = _82 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _122 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _124 = _114 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _128 = !_98;
    int _131 = _128 ? 0 : 1;
    float _133 = _122 * 78.233001708984375;
    float _135 = fma(_124, 12.98980045318603515625, _133);
    float _137 = fma(_126, 12.98980045318603515625, _133);
    float _139 = fma(_126, 45.16400146484375, _135);
    float _141 = fma(_124, 45.16400146484375, _137);
    float _143 = _139 + 284.01898193359375;
    float _145 = _139 + 473.364990234375;
    float _147 = _141 + 94.67299652099609375;
    float _149 = _139 + 189.3459930419921875;
    float _151 = _143 * 0.15915493667125701904296875;
    float _153 = _141 + 378.691986083984375;
    float _155 = _145 * 0.15915493667125701904296875;
    float _157 = _141 + 568.0379638671875;
    float _159 = _147 * 0.15915493667125701904296875;
    float _161 = _153 * 0.15915493667125701904296875;
    float _163 = _139 + 378.691986083984375;
    float _165 = _157 * 0.15915493667125701904296875;
    float _167 = _139 + 94.67299652099609375;
    float _169 = _141 + 284.01898193359375;
    float _171 = _163 * 0.15915493667125701904296875;
    float _173 = _141 + 473.364990234375;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = sin(_175);
    float _179 = _167 * 0.15915493667125701904296875;
    float _181 = _141 + 189.3459930419921875;
    float _183 = _173 * 0.15915493667125701904296875;
    float _185 = _149 * 0.15915493667125701904296875;
    int _187 = 2;
    if (!_98)
    {
        _187 = 1;
    }
    int _189 = _187;
    float _191 = _181 * 0.15915493667125701904296875;
    int _193 = _189;
    if (!_106)
    {
        _193 = _131;
    }
    int _195 = _193;
    float _197 = _139 + 568.0379638671875;
    float _199 = _139 + 662.71099853515625;
    float _201 = _169 * 0.15915493667125701904296875;
    int _203 = _195 + 1;
    float _205 = _197 * 0.15915493667125701904296875;
    int _207 = _203;
    if (!_120)
    {
        _207 = _195;
    }
    int _209 = _207;
    float _211 = _141 + 662.71099853515625;
    float _213 = _199 * 0.15915493667125701904296875;
    float _215 = _191 * 6.283185482025146484375;
    float _217 = sin(_215);
    bool _219 = _209 != 1;
    float _221 = _211 * 0.15915493667125701904296875;
    bool _223 = _209 != 0;
    float _225 = _141 + 757.38397216796875;
    bool _227 = !_219;
    int _229 = _227 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _231 = _139 + 757.38397216796875;
    bool _233 = !_219;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _237 = _221 * 6.283185482025146484375;
    float _239 = sin(_237);
    bool _241 = !_219;
    int _243 = _241 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _245 = _225 * 0.15915493667125701904296875;
    bool _247 = !_219;
    int _249 = _247 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    float _251 = _177 * 43758.546875;
    float _253 = _223 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    bool _255 = !_219;
    int _257 = _255 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _259 = _213 * 6.283185482025146484375;
    float _261 = sin(_259);
    float _263 = _223 ? as_type<float>(_243) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _265 = _122 * _253;
    bool _267 = !_219;
    int _269 = _267 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _271 = _217 * 43758.546875;
    bool _273 = !_219;
    int _275 = _273 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _277 = _122 * _263;
    float _279 = _223 ? as_type<float>(_249) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _281 = _179 * 6.283185482025146484375;
    float _283 = sin(_281);
    float _285 = _223 ? as_type<float>(_229) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _287 = _223 ? as_type<float>(_257) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _289 = _231 * 0.15915493667125701904296875;
    bool _291 = !_219;
    int _293 = _291 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _295 = _122 * _285;
    float _297 = _223 ? as_type<float>(_275) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _299 = _122 * _279;
    float _301 = _245 * 6.283185482025146484375;
    float _303 = sin(_301);
    float _305 = _122 * _297;
    float _307 = _223 ? as_type<float>(_293) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _309 = _283 * 43758.546875;
    bool _311 = !_219;
    int _313 = _311 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _315 = _159 * 6.283185482025146484375;
    float _317 = sin(_315);
    bool _319 = !_219;
    int _321 = _319 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _323 = _122 * _307;
    float _325 = fma(_124, _287, _305);
    bool _327 = !_219;
    int _329 = _327 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _331 = _223 ? as_type<float>(_313) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _333 = _185 * 6.283185482025146484375;
    float _335 = sin(_333);
    float _337 = _223 ? as_type<float>(_321) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    bool _339 = !_219;
    int _341 = _339 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _343 = fma(_124, _331, _265);
    float _345 = _223 ? as_type<float>(_329) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _347 = fma(_124, _337, _295);
    float _349 = _201 * 6.283185482025146484375;
    float _351 = sin(_349);
    float _353 = _223 ? as_type<float>(_341) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _355 = fma(_124, _345, _299);
    float _357 = _317 * 43758.546875;
    float _359 = fma(_124, _353, _323);
    bool _361 = !_219;
    int _363 = _361 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _365 = _151 * 6.283185482025146484375;
    float _367 = sin(_365);
    bool _369 = !_219;
    int _371 = _369 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _373 = _335 * 43758.546875;
    float _375 = _223 ? as_type<float>(_269) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    bool _377 = !_219;
    int _379 = _377 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    bool _381 = !_219;
    int _383 = _381 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _385 = _122 * _375;
    float _387 = _223 ? as_type<float>(_363) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _389 = _161 * 6.283185482025146484375;
    float _391 = sin(_389);
    float _393 = _223 ? as_type<float>(_371) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _395 = _351 * 43758.546875;
    float _397 = _223 ? as_type<float>(_379) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _399 = fma(_126, _387, _355);
    float _401 = _223 ? as_type<float>(_383) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _403 = fma(_124, _393, _277);
    float _405 = fma(_124, _397, _385);
    float _407 = fma(_126, _401, _325);
    float _409 = _171 * 6.283185482025146484375;
    float _411 = sin(_409);
    bool _413 = !_219;
    int _415 = _413 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _417 = _367 * 43758.546875;
    bool _419 = !_219;
    int _421 = _419 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _423 = _391 * 43758.546875;
    bool _425 = !_219;
    int _427 = _425 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _429 = _223 ? as_type<float>(_415) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _431 = _183 * 6.283185482025146484375;
    float _433 = sin(_431);
    float _435 = _223 ? as_type<float>(_421) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _437 = _223 ? as_type<float>(_427) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _439 = fma(_126, _429, _343);
    float _441 = fma(_126, _435, _403);
    float _443 = fma(_126, _437, _359);
    float _445 = _155 * 6.283185482025146484375;
    float _447 = sin(_445);
    float _449 = _411 * 43758.546875;
    bool _451 = !_219;
    int _453 = _451 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _455 = !_219;
    int _457 = _455 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _459 = _433 * 43758.546875;
    bool _461 = !_219;
    int _463 = _461 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _465 = _205 * 6.283185482025146484375;
    float _467 = sin(_465);
    bool _469 = !_219;
    int _471 = _469 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    bool _473 = !_219;
    int _475 = _473 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _477 = _223 ? as_type<float>(_453) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _479 = _223 ? as_type<float>(_457) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _481 = _289 * 6.283185482025146484375;
    float _483 = sin(_481);
    float _485 = _223 ? as_type<float>(_463) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _487 = fma(_126, _477, _347);
    float _489 = _223 ? as_type<float>(_471) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _491 = fma(_126, _479, _405);
    float _493 = _223 ? as_type<float>(_475) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _495 = _485 + _407;
    float _497 = _489 + _399;
    float _499 = _239 * 43758.546875;
    float _501 = _493 + _439;
    float _503 = _261 * 43758.546875;
    float _505 = floor(_271);
    bool _507 = !_219;
    int _509 = _507 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _511 = _447 * 43758.546875;
    bool _513 = !_219;
    int _515 = _513 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _517 = _467 * 43758.546875;
    bool _519 = !_219;
    int _521 = _519 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _523 = _483 * 43758.546875;
    bool _525 = !_219;
    int _527 = _525 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _529 = floor(_309);
    float _531 = _223 ? as_type<float>(_515) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _533 = _303 * 43758.546875;
    float _535 = _223 ? as_type<float>(_521) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _537 = _223 ? as_type<float>(_527) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _539 = _531 + _441;
    float _541 = _223 ? as_type<float>(_509) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _543 = _535 + _443;
    float _545 = floor(_357);
    float _547 = _537 + _491;
    float _549 = -_505;
    float _551 = _271 + _549;
    float _553 = _541 + _487;
    float _555 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _557 = _555 + 1.0;
    float _559 = floor(_373);
    float _561 = -_529;
    float _563 = _309 + _561;
    float _565 = fma(_551, 2.0, -1.0);
    float _567 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _569 = !_219;
    int _571 = _569 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    float _573 = _567 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _575 = floor(_395);
    float _577 = -_545;
    float _579 = _357 + _577;
    bool _581 = !_219;
    int _583 = _581 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _585 = !_219;
    int _587 = _585 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    bool _589 = !_219;
    int _591 = _589 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _593 = floor(_417);
    float _595 = -_559;
    float _597 = _373 + _595;
    float _599 = fma(_579, 2.0, -1.0);
    float _601 = _223 ? as_type<float>(_571) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _603 = fma(_597, 2.0, -1.0);
    float _605 = _223 ? as_type<float>(_583) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _607 = floor(_423);
    float _609 = -_575;
    float _611 = _395 + _609;
    float _613 = _223 ? as_type<float>(_587) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _615 = _223 ? as_type<float>(_591) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _617 = fma(_611, 2.0, -1.0);
    float _619 = float(_209);
    float _621 = floor(_449);
    float _623 = -_593;
    float _625 = _417 + _623;
    float _627 = _573 * _617;
    float _629 = fma(_625, 2.0, -1.0);
    float _631 = floor(_459);
    float _633 = -_607;
    float _635 = _423 + _633;
    float _637 = fma(_635, 2.0, -1.0);
    float _639 = floor(_511);
    float _641 = -_621;
    float _643 = _449 + _641;
    float _645 = _573 * _637;
    float _647 = fma(_643, 2.0, -1.0);
    float _649 = floor(_251);
    float _651 = -_631;
    float _653 = _459 + _651;
    float _655 = fma(_653, 2.0, -1.0);
    float _657 = _573 * _565;
    float _659 = floor(_517);
    float _661 = -_639;
    float _663 = _511 + _661;
    float _665 = _573 * _655;
    float _667 = fma(_663, 2.0, -1.0);
    float _669 = floor(_499);
    float _671 = -_649;
    float _673 = _251 + _671;
    float _675 = _573 * _667;
    float _677 = fma(_673, 2.0, -1.0);
    float _679 = _573 * _647;
    float _681 = floor(_503);
    float _683 = -_659;
    float _685 = _517 + _683;
    float _687 = _573 * _677;
    float _689 = fma(_685, 2.0, -1.0);
    float _691 = _573 * _599;
    float _693 = floor(_533);
    float _695 = -_669;
    float _697 = _499 + _695;
    float _699 = _573 * _689;
    float _701 = fma(_697, 2.0, -1.0);
    float _703 = _573 * _629;
    bool _705 = !_219;
    int _707 = _705 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _709 = floor(_523);
    float _711 = -_681;
    float _713 = _503 + _711;
    float _715 = _573 * _701;
    float _717 = _703 * _703;
    float _719 = fma(_713, 2.0, -1.0);
    float _721 = _573 * _603;
    float _723 = fma(_627, _627, _717);
    float _725 = -_693;
    float _727 = _533 + _725;
    float _729 = _573 * _719;
    float _731 = 1.0 / _543;
    float _733 = fma(_727, 2.0, -1.0);
    bool _735 = !_219;
    int _737 = _735 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _739 = -_709;
    float _741 = _523 + _739;
    float _743 = fma(_563, 2.0, -1.0);
    float _745 = _573 * _733;
    float _747 = _721 * _721;
    float _749 = fma(_741, 2.0, -1.0);
    float _751 = _573 * _743;
    float _753 = _723 + 1.0;
    float _755 = fma(_657, _657, _747);
    float _757 = _573 * _749;
    float _759 = _751 * _751;
    float _761 = _755 + 1.0;
    float _763 = rsqrt(_753);
    float _765 = fma(_691, _691, _759);
    bool _767 = !_219;
    int _769 = _767 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _771 = _501 * _731;
    bool _773 = !_219;
    int _775 = _773 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _777 = _765 + 1.0;
    float _779 = _223 ? as_type<float>(_737) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _781 = _495 * _731;
    float _783 = rsqrt(_761);
    bool _785 = !_219;
    int _787 = _785 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _789 = _223 ? as_type<float>(_769) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _791 = _223 ? as_type<float>(_775) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _793 = _223 ? as_type<float>(_787) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _795 = rsqrt(_777);
    float _797 = fma(_627, _763, _553);
    float _799 = _223 ? as_type<float>(_707) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _801 = fma(_721, _783, _539);
    float _803 = _679 * _679;
    float _805 = fma(_657, _783, _553);
    float _807 = -_783;
    float _809 = _547 + _807;
    float _811 = rint(_619);
    float _813 = precise::max(_811, 0.0);
    uint _816 = uint(_813);
    uint _818 = clamp(_816, 0u, 65535u);
    float _820 = fma(_645, _645, _803);
    float _822 = fma(_691, _795, _553);
    float _824 = _820 + 1.0;
    float _826 = fma(_751, _795, _539);
    float _828 = rsqrt(_824);
    float _830 = _779 * _826;
    float _832 = _601 * _826;
    float _834 = _605 * _826;
    float _836 = _613 * _826;
    float _838 = fma(_789, _822, _830);
    float _840 = fma(_791, _822, _832);
    float _842 = fma(_615, _822, _834);
    float _844 = fma(_793, _822, _836);
    float _846 = fma(_703, _763, _539);
    float _848 = _779 * _801;
    float _850 = _601 * _801;
    float _852 = _605 * _801;
    float _854 = _613 * _801;
    float _856 = fma(_789, _805, _848);
    float _858 = fma(_791, _805, _850);
    float _860 = fma(_679, _828, _539);
    float _862 = _779 * _846;
    float _864 = _601 * _846;
    float _866 = fma(_615, _805, _852);
    float _868 = fma(_793, _805, _854);
    float _870 = _605 * _846;
    float _872 = fma(_789, _797, _862);
    float _874 = _613 * _846;
    float _876 = fma(_791, _797, _864);
    float _878 = fma(_645, _828, _553);
    float _880 = _601 * _860;
    float _882 = fma(_615, _797, _870);
    float _884 = fma(_793, _797, _874);
    float _886 = _779 * _860;
    float _888 = _605 * _860;
    float _890 = _613 * _860;
    float _892 = fma(_791, _878, _880);
    float _894 = fma(_789, _878, _886);
    float _896 = -_795;
    float _898 = _547 + _896;
    float _900 = fma(_615, _878, _888);
    bool _902 = !_219;
    int _904 = _902 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _906 = fma(_799, _898, _838);
    bool _908 = !_219;
    int _910 = _908 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _912 = fma(_793, _878, _890);
    bool _914 = !_219;
    int _916 = _914 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _918 = fma(_799, _809, _856);
    float _920 = _223 ? as_type<float>(_904) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _922 = -_828;
    float _924 = _547 + _922;
    float _926 = _223 ? as_type<float>(_910) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _928 = _223 ? as_type<float>(_916) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _930 = fma(_920, _809, _858);
    float _932 = fma(_926, _809, _866);
    float _934 = fma(_920, _898, _840);
    float _936 = fma(_928, _809, _868);
    float _938 = -_763;
    float _940 = _547 + _938;
    bool _942 = !_219;
    int _944 = _942 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _946 = fma(_926, _898, _842);
    float _948 = fma(_928, _898, _844);
    float _950 = fma(_799, _940, _872);
    float _952 = _223 ? as_type<float>(_944) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _954 = fma(_920, _940, _876);
    float _956 = fma(_926, _940, _882);
    float _958 = fma(_928, _940, _884);
    float _960 = fma(_920, _924, _892);
    float _962 = _675 * _675;
    float _964 = _952 + _948;
    float _966 = fma(_926, _924, _900);
    float _968 = _952 + _936;
    float _970 = fma(_665, _665, _962);
    float _972 = fma(_799, _924, _894);
    float _974 = _970 + 1.0;
    float _976 = 1.0 / _964;
    float _978 = fma(_928, _924, _912);
    bool _980 = !_219;
    int _982 = _980 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    bool _984 = !_219;
    int _986 = _984 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _988 = !_219;
    int _990 = _988 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _992 = 1.0 / _968;
    float _994 = _223 ? as_type<float>(_982) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _996 = _223 ? as_type<float>(_986) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _998 = _223 ? as_type<float>(_990) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _1000 = _994 + _906;
    float _1002 = _994 + _918;
    float _1004 = rsqrt(_974);
    float _1006 = _996 + _934;
    float _1008 = _998 + _946;
    float _1010 = _1000 * _976;
    float _1012 = _996 + _930;
    float _1014 = _1006 * _976;
    float _1016 = _1008 * _976;
    float _1018 = _998 + _932;
    float _1020 = _1002 * _992;
    float _1022 = _1012 * _992;
    float _1024 = _994 + _950;
    float _1026 = _1018 * _992;
    float _1028 = _996 + _954;
    float _1030 = fma(_675, _1004, _539);
    float _1032 = fma(_665, _1004, _553);
    float _1034 = _779 * _1030;
    float _1036 = _601 * _1030;
    float _1038 = _605 * _1030;
    float _1040 = _613 * _1030;
    float _1042 = fma(_789, _1032, _1034);
    float _1044 = _699 * _699;
    float _1046 = fma(_791, _1032, _1036);
    float _1048 = fma(_615, _1032, _1038);
    float _1050 = fma(_793, _1032, _1040);
    float _1052 = fma(_687, _687, _1044);
    float _1054 = _952 + _958;
    float _1056 = -_1004;
    float _1058 = _547 + _1056;
    float _1060 = _1052 + 1.0;
    float _1062 = fma(_799, _1058, _1042);
    float _1064 = 1.0 / _1054;
    float _1066 = fma(_926, _1058, _1048);
    float _1068 = _998 + _956;
    float _1070 = fma(_920, _1058, _1046);
    float _1072 = fma(_928, _1058, _1050);
    float _1074 = rsqrt(_1060);
    float _1076 = _1024 * _1064;
    float _1078 = _1028 * _1064;
    float _1080 = _1068 * _1064;
    float _1082 = _497 * _731;
    float _1084 = fma(_699, _1074, _539);
    float _1086 = fma(_687, _1074, _553);
    float _1088 = -_1074;
    float _1090 = _547 + _1088;
    float _1092 = _779 * _1084;
    float _1094 = _601 * _1084;
    float _1096 = _605 * _1084;
    float _1098 = _613 * _1084;
    float _1100 = fma(_789, _1086, _1092);
    float _1102 = fma(_791, _1086, _1094);
    float _1104 = fma(_615, _1086, _1096);
    float _1106 = fma(_793, _1086, _1098);
    float _1108 = fma(_799, _1090, _1100);
    float _1110 = fma(_920, _1090, _1102);
    float _1112 = _729 * _729;
    float _1114 = fma(_926, _1090, _1104);
    float _1116 = fma(_928, _1090, _1106);
    float _1118 = fma(_715, _715, _1112);
    float _1120 = _757 * _757;
    float _1122 = _1118 + 1.0;
    float _1124 = fma(_745, _745, _1120);
    float _1126 = _1124 + 1.0;
    float _1128 = rsqrt(_1122);
    float _1130 = rsqrt(_1126);
    float _1132 = -_1128;
    float _1134 = _547 + _1132;
    float _1136 = fma(_729, _1128, _539);
    float _1138 = fma(_715, _1128, _553);
    float _1140 = _601 * _1136;
    float _1142 = -_1130;
    float _1144 = _547 + _1142;
    float _1146 = fma(_757, _1130, _539);
    float _1148 = fma(_745, _1130, _553);
    float _1150 = _779 * _1136;
    float3 _4577 = float3(_781, _1082, float(int(_818)));
    float3 _4581 = select(_4577, float3(0.0), isnan(_4577));
    float _1152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4581.xy, uint(rint(_4581.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4581.xy, uint(rint(_4581.z))).x;
    float _1154 = _779 * _1146;
    float _1156 = _601 * _1146;
    float _1158 = _605 * _1136;
    float _1160 = _613 * _1136;
    float _1162 = _605 * _1146;
    float _1164 = _613 * _1146;
    float _1166 = fma(_791, _1138, _1140);
    float _1168 = fma(_791, _1148, _1156);
    float _1170 = fma(_789, _1138, _1150);
    float _1172 = fma(_615, _1138, _1158);
    float _1174 = fma(_793, _1138, _1160);
    float _1176 = fma(_789, _1148, _1154);
    float _1178 = fma(_615, _1148, _1162);
    float _1180 = fma(_793, _1148, _1164);
    float _1182 = fma(_920, _1134, _1166);
    float _1184 = fma(_920, _1144, _1168);
    float _1186 = _952 + _1072;
    float _1188 = fma(_799, _1134, _1170);
    float _1190 = fma(_926, _1134, _1172);
    float _1192 = fma(_928, _1134, _1174);
    float _1194 = fma(_799, _1144, _1176);
    float _1196 = fma(_926, _1144, _1178);
    float _1198 = fma(_928, _1144, _1180);
    float _1200 = _952 + _978;
    float _1202 = _952 + _1192;
    float _1204 = 1.0 / _1186;
    float _1206 = _952 + _1116;
    float _1208 = _952 + _1198;
    float _1210 = _994 + _972;
    float _1212 = _996 + _960;
    float _1214 = _996 + _1070;
    float _1216 = _996 + _1110;
    float _1218 = 1.0 / _1200;
    float _1220 = _996 + _1182;
    float _1222 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _1224 = _996 + _1184;
    float _1226 = _994 + _1108;
    float _1228 = _998 + _966;
    float _1230 = _998 + _1114;
    float _1232 = _994 + _1062;
    float _1234 = 1.0 / _1206;
    float _1236 = _994 + _1188;
    float _1238 = _994 + _1194;
    float _1240 = _998 + _1066;
    float _1242 = _998 + _1190;
    float _1244 = _998 + _1196;
    float _1246 = _1232 * _1204;
    float _1248 = _1240 * _1204;
    float _1250 = 1.0 / _1202;
    float _1252 = _1214 * _1204;
    float _1254 = _1210 * _1218;
    float _1256 = _1212 * _1218;
    float _1258 = _1228 * _1218;
    float _1260 = fma(_1010, 0.5, 0.5);
    float _1262 = 1.0 / _1208;
    float _1264 = _1230 * _1234;
    float _1266 = _1216 * _1234;
    float _1268 = _1226 * _1234;
    float _1270 = fma(_1016, 0.5, 0.5);
    float _1272 = fma(_1256, -0.5, 0.5);
    float _1274 = fma(_1252, -0.5, 0.5);
    float _1276 = fma(_1020, 0.5, 0.5);
    float _1278 = _1236 * _1250;
    float _1280 = _1220 * _1250;
    float _1282 = _1242 * _1250;
    float _1284 = fma(_1026, 0.5, 0.5);
    float _1286 = fma(_1254, 0.5, 0.5);
    float _1288 = fma(_1258, 0.5, 0.5);
    float _1290 = fma(_1246, 0.5, 0.5);
    float _1292 = fma(_1248, 0.5, 0.5);
    float _1294 = _1238 * _1262;
    float _1296 = _1224 * _1262;
    float _1298 = _1244 * _1262;
    float _1300 = fma(_1014, -0.5, 0.5);
    float _1302 = fma(_1022, -0.5, 0.5);
    float _1304 = fma(_1076, 0.5, 0.5);
    float _1306 = fma(_1078, -0.5, 0.5);
    float _1308 = fma(_1266, -0.5, 0.5);
    float _1310 = fma(_1080, 0.5, 0.5);
    float _1312 = fma(_1268, 0.5, 0.5);
    float _1314 = fma(_1264, 0.5, 0.5);
    float _1316 = fma(_1278, 0.5, 0.5);
    float _1318 = fma(_1280, -0.5, 0.5);
    float _1320 = fma(_1282, 0.5, 0.5);
    float _1322 = fma(_1294, 0.5, 0.5);
    float _1324 = fma(_1296, -0.5, 0.5);
    float _1326 = fma(_1298, 0.5, 0.5);
    float _1328 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1330 = -_1260;
    float _1332 = _781 + _1330;
    float _1334 = -_1300;
    float _1336 = _1082 + _1334;
    float _1338 = -_1270;
    float _1340 = _771 + _1338;
    float _1342 = _1332 * _1328;
    float _1344 = _1336 * _1328;
    float _1346 = _1340 * _1328;
    float _1348 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1350 = -_1276;
    float _1352 = _781 + _1350;
    float _1354 = -_1302;
    float _1356 = _1082 + _1354;
    float _1358 = -_1284;
    float _1360 = _771 + _1358;
    float _1362 = _1352 * _1348;
    float _1364 = _1356 * _1348;
    float _1366 = _1360 * _1348;
    float _1368 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1370 = -_1304;
    float _1372 = _781 + _1370;
    float _1374 = -_1306;
    float _1376 = _1082 + _1374;
    float _1378 = -_1310;
    float _1380 = _771 + _1378;
    float _1382 = _1372 * _1368;
    float _1384 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1386 = -_1286;
    float _1388 = _781 + _1386;
    float _1390 = -_1272;
    float _1392 = _1082 + _1390;
    float _1394 = -_1288;
    float _1396 = _771 + _1394;
    float _1398 = _1376 * _1368;
    float _1400 = _1380 * _1368;
    float _1402 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1404 = -_1290;
    float _1406 = _781 + _1404;
    float _1408 = -_1274;
    float _1410 = _1082 + _1408;
    float _1412 = _1388 * _1384;
    float _1414 = _1392 * _1384;
    float _1416 = _1396 * _1384;
    float _1418 = -_1292;
    float _1420 = _771 + _1418;
    float _1422 = -_1312;
    float _1424 = _781 + _1422;
    float _1426 = -_1308;
    float _1428 = _1082 + _1426;
    float _1430 = -_1314;
    float _1432 = _771 + _1430;
    float _1434 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1436 = -_1316;
    float _1438 = _781 + _1436;
    float _1440 = -_1318;
    float _1442 = _1082 + _1440;
    float _1444 = _1406 * _1402;
    float _1446 = _1410 * _1402;
    float _1448 = _1420 * _1402;
    float _1450 = _1424 * _1402;
    float _1452 = _1428 * _1402;
    float _1454 = _1432 * _1402;
    float _1456 = _1438 * _1434;
    float _1458 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _1460 = -_1322;
    float _1462 = _781 + _1460;
    float _1464 = -_1324;
    float _1466 = _1082 + _1464;
    float _1468 = -_1326;
    float _1470 = _771 + _1468;
    float _1472 = _1442 * _1434;
    float _1474 = -_1320;
    float _1476 = _771 + _1474;
    float _1478 = _1462 * _1458;
    float _1480 = _1466 * _1458;
    float _1482 = _1470 * _1458;
    float _1484 = _1476 * _1434;
    float _1486 = _1222 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _1488 = -_771;
    float _1490 = _1488 + _1152;
    float _1492 = _1490 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    int _1494 = 0;
    float _1496 = _1152;
    float _1498 = _1212;
    float _1500 = _1476;
    float _1502 = 0.0;
    float _2582;
    float _2584;
    float _2598;
    do
    {
        int _1504 = _1494;
        float _1506 = _1496;
        float _1508 = _1498;
        float _1510 = _1500;
        float _1512 = _1502;
        int _1514 = _1504 << 4;
        int _1516 = _1504 + 1;
        bool _1518 = _1514 == 0;
        bool _1520 = _1514 == 16;
        bool _1522 = _1514 == 32;
        bool _1524 = _1514 == 48;
        bool _1526 = _1514 == 64;
        bool _1528 = _1514 == 80;
        bool _1530 = _1514 == 96;
        _1494 = _1516;
        float _1532 = _1506;
        float _1534 = _1510;
        float _1536 = _1508;
        float _1538 = _1512;
        if (_1518)
        {
            _1532 = _1346;
        }
        float _1540 = _1532;
        float _1542 = _1540;
        if (_1518)
        {
            _1534 = _1342;
        }
        float _1544 = _1534;
        float _1546 = _1544;
        if (_1518)
        {
            _1536 = _1344;
        }
        float _1548 = _1536;
        bool _1550 = _1514 == 112;
        float _1552 = _1548;
        if (_1520)
        {
            _1542 = _1366;
        }
        float _1554 = _1542;
        float _1556 = _1554;
        if (_1522)
        {
            _1556 = _1400;
        }
        float _1558 = _1556;
        float _1560 = _1558;
        if (_1524)
        {
            _1560 = _1416;
        }
        float _1562 = _1560;
        float _1564 = _1562;
        if (_1526)
        {
            _1564 = _1448;
        }
        float _1566 = _1564;
        float _1568 = _1566;
        if (_1528)
        {
            _1568 = _1454;
        }
        float _1570 = _1568;
        float _1572 = _1570;
        if (_1530)
        {
            _1572 = _1484;
        }
        float _1574 = _1572;
        float _1576 = _1574;
        if (_1550)
        {
            _1576 = _1482;
        }
        float _1578 = _1576;
        _1496 = _1578;
        if (_1520)
        {
            _1546 = _1362;
        }
        float _1580 = _1546;
        float _1582 = _1580;
        if (_1520)
        {
            _1552 = _1364;
        }
        float _1584 = _1552;
        float _1586 = _1578 * 1.5;
        float _1588 = _1584;
        if (_1522)
        {
            _1582 = _1382;
        }
        float _1590 = _1582;
        float _1592 = _1590;
        if (_1522)
        {
            _1588 = _1398;
        }
        float _1594 = _1588;
        float _1596 = precise::max(_1492, _1586);
        float _1598 = _1594;
        if (_1524)
        {
            _1592 = _1412;
        }
        float _1600 = _1592;
        float _1602 = precise::min(0.0, _1596);
        float _1604 = _1600;
        if (_1524)
        {
            _1598 = _1414;
        }
        float _1606 = _1598;
        bool _1608 = _1602 != _1492;
        bool _1610 = isnan(_1602);
        bool _1612 = _1608 || _1610;
        bool _1614 = isnan(_1492);
        bool _1616 = _1612 || _1614;
        float _1618 = _1606;
        if (_1526)
        {
            _1604 = _1444;
        }
        float _1620 = _1604;
        float _1622 = _1620;
        if (_1526)
        {
            _1618 = _1446;
        }
        float _1624 = _1618;
        float _1626 = _1624;
        if (_1528)
        {
            _1622 = _1450;
        }
        float _1628 = _1622;
        float _1630 = _1628;
        if (_1528)
        {
            _1626 = _1452;
        }
        float _1632 = _1626;
        float _1634 = _1632;
        if (_1530)
        {
            _1630 = _1456;
        }
        float _1636 = _1630;
        float _1638 = _1636;
        if (_1530)
        {
            _1634 = _1472;
        }
        float _1640 = _1634;
        bool _1642 = _1516 >= 8;
        float _1644 = _1640;
        if (_1550)
        {
            _1638 = _1478;
        }
        float _1646 = _1638;
        float _1648 = _1646;
        if (_1550)
        {
            _1644 = _1480;
        }
        float _1650 = _1644;
        bool _1652 = !_1616;
        float _1654 = _1650;
        if (!_1652)
        {
            float _1656 = _1082 + _1650;
            float _1658 = _781 + _1646;
            float3 _5288 = float3(_1658, _1656, float(int(_818)));
            float3 _5290 = select(_5288, float3(0.0), isnan(_5288));
            float _1660 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5290.xy, uint(rint(_5290.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5290.xy, uint(rint(_5290.z))).x;
            float _1662 = _771 + _1578;
            float _1664 = _1578 * 3.0;
            float _1666 = -_1662;
            float _1668 = _1666 + _1660;
            float _1670 = _1668 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1672 = precise::max(_1670, _1664);
            float _1674 = precise::min(0.0, _1672);
            bool _1676 = _1674 != _1670;
            bool _1678 = isnan(_1674);
            bool _1680 = _1676 || _1678;
            bool _1682 = isnan(_1670);
            bool _1684 = _1680 || _1682;
            bool _1686 = !_1684;
            if (!_1686)
            {
                float _1688 = fma(_1650, 2.0, _1082);
                float _1690 = fma(_1646, 2.0, _781);
                float3 _5343 = float3(_1690, _1688, float(int(_818)));
                float3 _5345 = select(_5343, float3(0.0), isnan(_5343));
                float _1692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5345.xy, uint(rint(_5345.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5345.xy, uint(rint(_5345.z))).x;
                float _1694 = fma(_1578, 2.0, _771);
                float _1696 = _1578 * 4.5;
                float _1698 = -_1694;
                float _1700 = _1698 + _1692;
                float _1702 = _1700 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1704 = precise::max(_1702, _1696);
                float _1706 = precise::min(0.0, _1704);
                bool _1708 = _1706 != _1702;
                bool _1710 = isnan(_1706);
                bool _1712 = _1708 || _1710;
                bool _1714 = isnan(_1702);
                bool _1716 = _1712 || _1714;
                bool _1718 = !_1716;
                if (!_1718)
                {
                    float _1720 = fma(_1650, 3.0, _1082);
                    float _1722 = fma(_1646, 3.0, _781);
                    float3 _5398 = float3(_1722, _1720, float(int(_818)));
                    float3 _5400 = select(_5398, float3(0.0), isnan(_5398));
                    float _1724 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5400.xy, uint(rint(_5400.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5400.xy, uint(rint(_5400.z))).x;
                    float _1726 = fma(_1578, 3.0, _771);
                    float _1728 = _1578 * 6.0;
                    float _1730 = -_1726;
                    float _1732 = _1730 + _1724;
                    float _1734 = _1732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1736 = precise::max(_1734, _1728);
                    float _1738 = precise::min(0.0, _1736);
                    bool _1740 = _1738 != _1734;
                    bool _1742 = isnan(_1738);
                    bool _1744 = _1740 || _1742;
                    bool _1746 = isnan(_1734);
                    bool _1748 = _1744 || _1746;
                    bool _1750 = !_1748;
                    if (!_1750)
                    {
                        float _1752 = fma(_1650, 4.0, _1082);
                        float _1754 = fma(_1646, 4.0, _781);
                        float3 _5454 = float3(_1754, _1752, float(int(_818)));
                        float3 _5456 = select(_5454, float3(0.0), isnan(_5454));
                        float _1756 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5456.xy, uint(rint(_5456.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5456.xy, uint(rint(_5456.z))).x;
                        float _1758 = fma(_1578, 4.0, _771);
                        float _1760 = _1578 * 7.5;
                        float _1762 = -_1758;
                        float _1764 = _1762 + _1756;
                        float _1766 = _1764 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1768 = precise::max(_1766, _1760);
                        float _1770 = precise::min(0.0, _1768);
                        bool _1772 = _1770 != _1766;
                        bool _1774 = isnan(_1770);
                        bool _1776 = _1772 || _1774;
                        bool _1778 = isnan(_1766);
                        bool _1780 = _1776 || _1778;
                        bool _1782 = !_1780;
                        if (!_1782)
                        {
                            float _1784 = fma(_1650, 5.0, _1082);
                            float _1786 = fma(_1646, 5.0, _781);
                            float3 _5510 = float3(_1786, _1784, float(int(_818)));
                            float3 _5512 = select(_5510, float3(0.0), isnan(_5510));
                            float _1788 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5512.xy, uint(rint(_5512.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5512.xy, uint(rint(_5512.z))).x;
                            float _1790 = fma(_1578, 5.0, _771);
                            float _1792 = _1578 * 9.0;
                            float _1794 = -_1790;
                            float _1796 = _1794 + _1788;
                            float _1798 = _1796 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1800 = precise::max(_1798, _1792);
                            float _1802 = precise::min(0.0, _1800);
                            bool _1804 = _1802 != _1798;
                            bool _1806 = isnan(_1802);
                            bool _1808 = _1804 || _1806;
                            bool _1810 = isnan(_1798);
                            bool _1812 = _1808 || _1810;
                            bool _1814 = !_1812;
                            if (!_1814)
                            {
                                float _1816 = fma(_1650, 6.0, _1082);
                                float _1818 = fma(_1646, 6.0, _781);
                                float3 _5565 = float3(_1818, _1816, float(int(_818)));
                                float3 _5567 = select(_5565, float3(0.0), isnan(_5565));
                                float _1820 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5567.xy, uint(rint(_5567.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5567.xy, uint(rint(_5567.z))).x;
                                float _1822 = fma(_1578, 6.0, _771);
                                float _1824 = _1578 * 10.5;
                                float _1826 = -_1822;
                                float _1828 = _1826 + _1820;
                                float _1830 = _1828 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1832 = precise::max(_1830, _1824);
                                float _1834 = precise::min(0.0, _1832);
                                bool _1836 = _1834 != _1830;
                                bool _1838 = isnan(_1834);
                                bool _1840 = _1836 || _1838;
                                bool _1842 = isnan(_1830);
                                bool _1844 = _1840 || _1842;
                                bool _1846 = !_1844;
                                if (!_1846)
                                {
                                    float _1848 = fma(_1650, 7.0, _1082);
                                    float _1850 = fma(_1646, 7.0, _781);
                                    float3 _5621 = float3(_1850, _1848, float(int(_818)));
                                    float3 _5623 = select(_5621, float3(0.0), isnan(_5621));
                                    float _1852 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5623.xy, uint(rint(_5623.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5623.xy, uint(rint(_5623.z))).x;
                                    float _1854 = fma(_1578, 7.0, _771);
                                    float _1856 = _1578 * 12.0;
                                    float _1858 = -_1854;
                                    float _1860 = _1858 + _1852;
                                    float _1862 = _1860 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1864 = precise::max(_1862, _1856);
                                    float _1866 = precise::min(0.0, _1864);
                                    bool _1868 = _1866 != _1862;
                                    bool _1870 = isnan(_1866);
                                    bool _1872 = _1868 || _1870;
                                    bool _1874 = isnan(_1862);
                                    bool _1876 = _1872 || _1874;
                                    bool _1878 = !_1876;
                                    if (!_1878)
                                    {
                                        float _1880 = fma(_1650, 8.0, _1082);
                                        float _1882 = fma(_1646, 8.0, _781);
                                        float3 _5677 = float3(_1882, _1880, float(int(_818)));
                                        float3 _5679 = select(_5677, float3(0.0), isnan(_5677));
                                        float _1884 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5679.xy, uint(rint(_5679.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5679.xy, uint(rint(_5679.z))).x;
                                        float _1886 = fma(_1578, 8.0, _771);
                                        float _1888 = _1578 * 13.5;
                                        float _1890 = -_1886;
                                        float _1892 = _1890 + _1884;
                                        float _1894 = _1892 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1896 = precise::max(_1894, _1888);
                                        float _1898 = precise::min(0.0, _1896);
                                        bool _1900 = _1898 != _1894;
                                        bool _1902 = isnan(_1898);
                                        bool _1904 = _1900 || _1902;
                                        bool _1906 = isnan(_1894);
                                        bool _1908 = _1904 || _1906;
                                        bool _1910 = !_1908;
                                        if (!_1910)
                                        {
                                            float _1912 = fma(_1650, 9.0, _1082);
                                            float _1914 = fma(_1646, 9.0, _781);
                                            float3 _5732 = float3(_1914, _1912, float(int(_818)));
                                            float3 _5734 = select(_5732, float3(0.0), isnan(_5732));
                                            float _1916 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5734.xy, uint(rint(_5734.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5734.xy, uint(rint(_5734.z))).x;
                                            float _1918 = fma(_1578, 9.0, _771);
                                            float _1920 = _1578 * 15.0;
                                            float _1922 = -_1918;
                                            float _1924 = _1922 + _1916;
                                            float _1926 = _1924 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1928 = precise::max(_1926, _1920);
                                            float _1930 = precise::min(0.0, _1928);
                                            bool _1932 = _1930 != _1926;
                                            bool _1934 = isnan(_1930);
                                            bool _1936 = _1932 || _1934;
                                            bool _1938 = isnan(_1926);
                                            bool _1940 = _1936 || _1938;
                                            bool _1942 = !_1940;
                                            if (!_1942)
                                            {
                                                float _1944 = fma(_1650, 10.0, _1082);
                                                float _1946 = fma(_1646, 10.0, _781);
                                                float3 _5788 = float3(_1946, _1944, float(int(_818)));
                                                float3 _5790 = select(_5788, float3(0.0), isnan(_5788));
                                                float _1948 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5790.xy, uint(rint(_5790.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5790.xy, uint(rint(_5790.z))).x;
                                                float _1950 = fma(_1578, 10.0, _771);
                                                float _1952 = _1578 * 16.5;
                                                float _1954 = -_1950;
                                                float _1956 = _1954 + _1948;
                                                float _1958 = _1956 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1960 = precise::max(_1958, _1952);
                                                float _1962 = precise::min(0.0, _1960);
                                                bool _1964 = _1962 != _1958;
                                                bool _1966 = isnan(_1962);
                                                bool _1968 = _1964 || _1966;
                                                bool _1970 = isnan(_1958);
                                                bool _1972 = _1968 || _1970;
                                                bool _1974 = !_1972;
                                                if (!_1974)
                                                {
                                                    float _1976 = fma(_1650, 11.0, _1082);
                                                    float _1978 = fma(_1646, 11.0, _781);
                                                    float3 _5844 = float3(_1978, _1976, float(int(_818)));
                                                    float3 _5846 = select(_5844, float3(0.0), isnan(_5844));
                                                    float _1980 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5846.xy, uint(rint(_5846.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5846.xy, uint(rint(_5846.z))).x;
                                                    float _1982 = fma(_1578, 11.0, _771);
                                                    float _1984 = _1578 * 18.0;
                                                    float _1986 = -_1982;
                                                    float _1988 = _1986 + _1980;
                                                    float _1990 = _1988 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1992 = precise::max(_1990, _1984);
                                                    float _1994 = precise::min(0.0, _1992);
                                                    bool _1996 = _1994 != _1990;
                                                    bool _1998 = isnan(_1994);
                                                    bool _2000 = _1996 || _1998;
                                                    bool _2002 = isnan(_1990);
                                                    bool _2004 = _2000 || _2002;
                                                    bool _2006 = !_2004;
                                                    if (!_2006)
                                                    {
                                                        float _2008 = fma(_1650, 12.0, _1082);
                                                        float _2010 = fma(_1646, 12.0, _781);
                                                        float3 _5899 = float3(_2010, _2008, float(int(_818)));
                                                        float3 _5901 = select(_5899, float3(0.0), isnan(_5899));
                                                        float _2012 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5901.xy, uint(rint(_5901.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5901.xy, uint(rint(_5901.z))).x;
                                                        float _2014 = fma(_1578, 12.0, _771);
                                                        float _2016 = _1578 * 19.5;
                                                        float _2018 = -_2014;
                                                        float _2020 = _2018 + _2012;
                                                        float _2022 = _2020 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2024 = precise::max(_2022, _2016);
                                                        float _2026 = precise::min(0.0, _2024);
                                                        bool _2028 = _2026 != _2022;
                                                        bool _2030 = isnan(_2026);
                                                        bool _2032 = _2028 || _2030;
                                                        bool _2034 = isnan(_2022);
                                                        bool _2036 = _2032 || _2034;
                                                        bool _2038 = !_2036;
                                                        if (!_2038)
                                                        {
                                                            float _2040 = fma(_1650, 13.0, _1082);
                                                            float _2042 = fma(_1646, 13.0, _781);
                                                            float3 _5955 = float3(_2042, _2040, float(int(_818)));
                                                            float3 _5957 = select(_5955, float3(0.0), isnan(_5955));
                                                            float _2044 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5957.xy, uint(rint(_5957.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5957.xy, uint(rint(_5957.z))).x;
                                                            float _2046 = fma(_1578, 13.0, _771);
                                                            float _2048 = _1578 * 21.0;
                                                            float _2050 = -_2046;
                                                            float _2052 = _2050 + _2044;
                                                            float _2054 = _2052 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2056 = precise::max(_2054, _2048);
                                                            float _2058 = precise::min(0.0, _2056);
                                                            bool _2060 = _2058 != _2054;
                                                            bool _2062 = isnan(_2058);
                                                            bool _2064 = _2060 || _2062;
                                                            bool _2066 = isnan(_2054);
                                                            bool _2068 = _2064 || _2066;
                                                            bool _2070 = !_2068;
                                                            if (!_2070)
                                                            {
                                                                float _2072 = fma(_1650, 14.0, _1082);
                                                                float _2074 = fma(_1646, 14.0, _781);
                                                                float3 _6011 = float3(_2074, _2072, float(int(_818)));
                                                                float3 _6013 = select(_6011, float3(0.0), isnan(_6011));
                                                                float _2076 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6013.xy, uint(rint(_6013.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6013.xy, uint(rint(_6013.z))).x;
                                                                float _2078 = fma(_1578, 14.0, _771);
                                                                float _2080 = _1578 * 22.5;
                                                                float _2082 = -_2078;
                                                                float _2084 = _2082 + _2076;
                                                                float _2086 = _2084 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _2088 = precise::max(_2086, _2080);
                                                                float _2090 = precise::min(0.0, _2088);
                                                                bool _2092 = _2090 != _2086;
                                                                bool _2094 = isnan(_2090);
                                                                bool _2096 = _2092 || _2094;
                                                                bool _2098 = isnan(_2086);
                                                                bool _2100 = _2096 || _2098;
                                                                bool _2102 = !_2100;
                                                                if (!_2102)
                                                                {
                                                                    float _2104 = fma(_1650, 15.0, _1082);
                                                                    float _2106 = fma(_1646, 15.0, _781);
                                                                    float3 _6066 = float3(_2106, _2104, float(int(_818)));
                                                                    float3 _6068 = select(_6066, float3(0.0), isnan(_6066));
                                                                    float _2108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6068.xy, uint(rint(_6068.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6068.xy, uint(rint(_6068.z))).x;
                                                                    float _2110 = fma(_1578, 15.0, _771);
                                                                    float _2112 = _1578 * 24.0;
                                                                    float _2114 = -_2110;
                                                                    float _2116 = _2114 + _2108;
                                                                    float _2118 = _2116 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _2120 = precise::max(_2118, _2112);
                                                                    float _2122 = precise::min(0.0, _2120);
                                                                    bool _2124 = _2122 != _2118;
                                                                    bool _2126 = isnan(_2122);
                                                                    bool _2128 = _2124 || _2126;
                                                                    bool _2130 = isnan(_2118);
                                                                    bool _2132 = _2128 || _2130;
                                                                    bool _2134 = !_2132;
                                                                    if (!_2134)
                                                                    {
                                                                        float _2136 = fma(_1650, 16.0, _1082);
                                                                        float _2138 = fma(_1646, 16.0, _781);
                                                                        float3 _6122 = float3(_2138, _2136, float(int(_818)));
                                                                        float3 _6124 = select(_6122, float3(0.0), isnan(_6122));
                                                                        float _2140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6124.xy, uint(rint(_6124.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6124.xy, uint(rint(_6124.z))).x;
                                                                        float _2142 = fma(_1578, 16.0, _771);
                                                                        float _2144 = _1578 * 25.5;
                                                                        float _2146 = -_2142;
                                                                        float _2148 = _2146 + _2140;
                                                                        float _2150 = _2148 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _2152 = precise::max(_2150, _2144);
                                                                        float _2154 = precise::min(0.0, _2152);
                                                                        bool _2156 = _2154 != _2150;
                                                                        bool _2158 = isnan(_2154);
                                                                        bool _2160 = _2156 || _2158;
                                                                        bool _2162 = isnan(_2150);
                                                                        bool _2164 = _2160 || _2162;
                                                                        bool _2166 = !_2164;
                                                                        if (!_2166)
                                                                        {
                                                                            float _2168 = fma(_1650, 17.0, _1082);
                                                                            float _2170 = fma(_1646, 17.0, _781);
                                                                            float3 _6178 = float3(_2170, _2168, float(int(_818)));
                                                                            float3 _6180 = select(_6178, float3(0.0), isnan(_6178));
                                                                            float _2172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6180.xy, uint(rint(_6180.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6180.xy, uint(rint(_6180.z))).x;
                                                                            float _2174 = fma(_1578, 17.0, _771);
                                                                            float _2176 = _1578 * 27.0;
                                                                            float _2178 = -_2174;
                                                                            float _2180 = _2178 + _2172;
                                                                            float _2182 = _2180 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _2184 = precise::max(_2182, _2176);
                                                                            float _2186 = precise::min(0.0, _2184);
                                                                            bool _2188 = _2186 != _2182;
                                                                            bool _2190 = isnan(_2186);
                                                                            bool _2192 = _2188 || _2190;
                                                                            bool _2194 = isnan(_2182);
                                                                            bool _2196 = _2192 || _2194;
                                                                            bool _2198 = !_2196;
                                                                            if (!_2198)
                                                                            {
                                                                                float _2200 = fma(_1650, 18.0, _1082);
                                                                                float _2202 = fma(_1646, 18.0, _781);
                                                                                float3 _6233 = float3(_2202, _2200, float(int(_818)));
                                                                                float3 _6235 = select(_6233, float3(0.0), isnan(_6233));
                                                                                float _2204 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6235.xy, uint(rint(_6235.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6235.xy, uint(rint(_6235.z))).x;
                                                                                float _2206 = fma(_1578, 18.0, _771);
                                                                                float _2208 = _1578 * 28.5;
                                                                                float _2210 = -_2206;
                                                                                float _2212 = _2210 + _2204;
                                                                                float _2214 = _2212 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _2216 = precise::max(_2214, _2208);
                                                                                float _2218 = precise::min(0.0, _2216);
                                                                                bool _2220 = _2218 != _2214;
                                                                                bool _2222 = isnan(_2218);
                                                                                bool _2224 = _2220 || _2222;
                                                                                bool _2226 = isnan(_2214);
                                                                                bool _2228 = _2224 || _2226;
                                                                                bool _2230 = !_2228;
                                                                                if (!_2230)
                                                                                {
                                                                                    float _2232 = fma(_1650, 19.0, _1082);
                                                                                    float _2234 = fma(_1646, 19.0, _781);
                                                                                    float3 _6289 = float3(_2234, _2232, float(int(_818)));
                                                                                    float3 _6291 = select(_6289, float3(0.0), isnan(_6289));
                                                                                    float _2236 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6291.xy, uint(rint(_6291.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6291.xy, uint(rint(_6291.z))).x;
                                                                                    float _2238 = fma(_1578, 19.0, _771);
                                                                                    float _2240 = _1578 * 30.0;
                                                                                    float _2242 = -_2238;
                                                                                    float _2244 = _2242 + _2236;
                                                                                    float _2246 = _2244 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                    float _2248 = precise::max(_2246, _2240);
                                                                                    float _2250 = precise::min(0.0, _2248);
                                                                                    bool _2252 = _2250 != _2246;
                                                                                    bool _2254 = isnan(_2250);
                                                                                    bool _2256 = _2252 || _2254;
                                                                                    bool _2258 = isnan(_2246);
                                                                                    bool _2260 = _2256 || _2258;
                                                                                    bool _2262 = !_2260;
                                                                                    if (!_2262)
                                                                                    {
                                                                                        float _2264 = fma(_1650, 20.0, _1082);
                                                                                        float _2266 = fma(_1646, 20.0, _781);
                                                                                        float3 _6345 = float3(_2266, _2264, float(int(_818)));
                                                                                        float3 _6347 = select(_6345, float3(0.0), isnan(_6345));
                                                                                        float _2268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6347.xy, uint(rint(_6347.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6347.xy, uint(rint(_6347.z))).x;
                                                                                        float _2270 = fma(_1578, 20.0, _771);
                                                                                        float _2272 = _1578 * 31.5;
                                                                                        float _2274 = -_2270;
                                                                                        float _2276 = _2274 + _2268;
                                                                                        float _2278 = _2276 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                        float _2280 = precise::max(_2278, _2272);
                                                                                        float _2282 = precise::min(0.0, _2280);
                                                                                        bool _2284 = _2282 != _2278;
                                                                                        bool _2286 = isnan(_2282);
                                                                                        bool _2288 = _2284 || _2286;
                                                                                        bool _2290 = isnan(_2278);
                                                                                        bool _2292 = _2288 || _2290;
                                                                                        bool _2294 = !_2292;
                                                                                        if (!_2294)
                                                                                        {
                                                                                            float _2296 = fma(_1650, 21.0, _1082);
                                                                                            float _2298 = fma(_1646, 21.0, _781);
                                                                                            float3 _6400 = float3(_2298, _2296, float(int(_818)));
                                                                                            float3 _6402 = select(_6400, float3(0.0), isnan(_6400));
                                                                                            float _2300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6402.xy, uint(rint(_6402.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6402.xy, uint(rint(_6402.z))).x;
                                                                                            float _2302 = fma(_1578, 21.0, _771);
                                                                                            float _2304 = _1578 * 33.0;
                                                                                            float _2306 = -_2302;
                                                                                            float _2308 = _2306 + _2300;
                                                                                            float _2310 = _2308 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                            float _2312 = precise::max(_2310, _2304);
                                                                                            float _2314 = precise::min(0.0, _2312);
                                                                                            bool _2316 = _2314 != _2310;
                                                                                            bool _2318 = isnan(_2314);
                                                                                            bool _2320 = _2316 || _2318;
                                                                                            bool _2322 = isnan(_2310);
                                                                                            bool _2324 = _2320 || _2322;
                                                                                            bool _2326 = !_2324;
                                                                                            if (!_2326)
                                                                                            {
                                                                                                float _2328 = fma(_1650, 22.0, _1082);
                                                                                                float _2330 = fma(_1646, 22.0, _781);
                                                                                                float3 _6456 = float3(_2330, _2328, float(int(_818)));
                                                                                                float3 _6458 = select(_6456, float3(0.0), isnan(_6456));
                                                                                                float _2332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6458.xy, uint(rint(_6458.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6458.xy, uint(rint(_6458.z))).x;
                                                                                                float _2334 = fma(_1578, 22.0, _771);
                                                                                                float _2336 = _1578 * 34.5;
                                                                                                float _2338 = -_2334;
                                                                                                float _2340 = _2338 + _2332;
                                                                                                float _2342 = _2340 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                float _2344 = precise::max(_2342, _2336);
                                                                                                float _2346 = precise::min(0.0, _2344);
                                                                                                bool _2348 = _2346 != _2342;
                                                                                                bool _2350 = isnan(_2346);
                                                                                                bool _2352 = _2348 || _2350;
                                                                                                bool _2354 = isnan(_2342);
                                                                                                bool _2356 = _2352 || _2354;
                                                                                                bool _2358 = !_2356;
                                                                                                if (!_2358)
                                                                                                {
                                                                                                    float _2360 = fma(_1650, 23.0, _1082);
                                                                                                    float _2362 = fma(_1646, 23.0, _781);
                                                                                                    float3 _6512 = float3(_2362, _2360, float(int(_818)));
                                                                                                    float3 _6514 = select(_6512, float3(0.0), isnan(_6512));
                                                                                                    float _2364 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6514.xy, uint(rint(_6514.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6514.xy, uint(rint(_6514.z))).x;
                                                                                                    float _2366 = fma(_1578, 23.0, _771);
                                                                                                    float _2368 = _1578 * 36.0;
                                                                                                    float _2370 = -_2366;
                                                                                                    float _2372 = _2370 + _2364;
                                                                                                    float _2374 = _2372 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                    float _2376 = precise::max(_2374, _2368);
                                                                                                    float _2378 = precise::min(0.0, _2376);
                                                                                                    bool _2380 = _2378 != _2374;
                                                                                                    bool _2382 = isnan(_2378);
                                                                                                    bool _2384 = _2380 || _2382;
                                                                                                    bool _2386 = isnan(_2374);
                                                                                                    bool _2388 = _2384 || _2386;
                                                                                                    bool _2390 = !_2388;
                                                                                                    if (!_2390)
                                                                                                    {
                                                                                                        float _2392 = fma(_1650, 24.0, _1082);
                                                                                                        float _2394 = fma(_1646, 24.0, _781);
                                                                                                        float3 _6567 = float3(_2394, _2392, float(int(_818)));
                                                                                                        float3 _6569 = select(_6567, float3(0.0), isnan(_6567));
                                                                                                        float _2396 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6569.xy, uint(rint(_6569.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6569.xy, uint(rint(_6569.z))).x;
                                                                                                        float _2398 = fma(_1578, 24.0, _771);
                                                                                                        float _2400 = _1578 * 37.5;
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
                                                                                                        bool _2422 = !_2420;
                                                                                                        if (!_2422)
                                                                                                        {
                                                                                                            float _2424 = fma(_1650, 25.0, _1082);
                                                                                                            float _2426 = fma(_1646, 25.0, _781);
                                                                                                            float3 _6623 = float3(_2426, _2424, float(int(_818)));
                                                                                                            float3 _6625 = select(_6623, float3(0.0), isnan(_6623));
                                                                                                            float _2428 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6625.xy, uint(rint(_6625.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6625.xy, uint(rint(_6625.z))).x;
                                                                                                            float _2430 = fma(_1578, 25.0, _771);
                                                                                                            float _2432 = _1578 * 39.0;
                                                                                                            float _2434 = -_2430;
                                                                                                            float _2436 = _2434 + _2428;
                                                                                                            float _2438 = _2436 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                            float _2440 = precise::max(_2438, _2432);
                                                                                                            float _2442 = precise::min(0.0, _2440);
                                                                                                            bool _2444 = _2442 != _2438;
                                                                                                            bool _2446 = isnan(_2442);
                                                                                                            bool _2448 = _2444 || _2446;
                                                                                                            bool _2450 = isnan(_2438);
                                                                                                            bool _2452 = _2448 || _2450;
                                                                                                            bool _2454 = !_2452;
                                                                                                            if (!_2454)
                                                                                                            {
                                                                                                                float _2456 = fma(_1650, 26.0, _1082);
                                                                                                                float _2458 = fma(_1646, 26.0, _781);
                                                                                                                float3 _6679 = float3(_2458, _2456, float(int(_818)));
                                                                                                                float3 _6681 = select(_6679, float3(0.0), isnan(_6679));
                                                                                                                float _2460 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6681.xy, uint(rint(_6681.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6681.xy, uint(rint(_6681.z))).x;
                                                                                                                float _2462 = fma(_1578, 26.0, _771);
                                                                                                                float _2464 = _1578 * 40.5;
                                                                                                                float _2466 = -_2462;
                                                                                                                float _2468 = _2466 + _2460;
                                                                                                                float _2470 = _2468 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                float _2472 = precise::max(_2470, _2464);
                                                                                                                float _2474 = precise::min(0.0, _2472);
                                                                                                                bool _2476 = _2474 != _2470;
                                                                                                                bool _2478 = isnan(_2474);
                                                                                                                bool _2480 = _2476 || _2478;
                                                                                                                bool _2482 = isnan(_2470);
                                                                                                                bool _2484 = _2480 || _2482;
                                                                                                                bool _2486 = !_2484;
                                                                                                                if (!_2486)
                                                                                                                {
                                                                                                                    float _2488 = fma(_1650, 27.0, _1082);
                                                                                                                    float _2490 = fma(_1646, 27.0, _781);
                                                                                                                    float3 _6734 = float3(_2490, _2488, float(int(_818)));
                                                                                                                    float3 _6736 = select(_6734, float3(0.0), isnan(_6734));
                                                                                                                    float _2492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6736.xy, uint(rint(_6736.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6736.xy, uint(rint(_6736.z))).x;
                                                                                                                    float _2494 = fma(_1578, 27.0, _771);
                                                                                                                    float _2496 = _1578 * 42.0;
                                                                                                                    float _2498 = -_2494;
                                                                                                                    float _2500 = _2498 + _2492;
                                                                                                                    float _2502 = _2500 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                    float _2504 = precise::max(_2502, _2496);
                                                                                                                    float _2506 = precise::min(0.0, _2504);
                                                                                                                    bool _2508 = _2506 != _2502;
                                                                                                                    bool _2510 = isnan(_2506);
                                                                                                                    bool _2512 = _2508 || _2510;
                                                                                                                    bool _2514 = isnan(_2502);
                                                                                                                    bool _2516 = _2512 || _2514;
                                                                                                                    bool _2518 = !_2516;
                                                                                                                    if (!_2518)
                                                                                                                    {
                                                                                                                        float _2520 = fma(_1650, 28.0, _1082);
                                                                                                                        float _2522 = fma(_1646, 28.0, _781);
                                                                                                                        float3 _6790 = float3(_2522, _2520, float(int(_818)));
                                                                                                                        float3 _6792 = select(_6790, float3(0.0), isnan(_6790));
                                                                                                                        float _2524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6792.xy, uint(rint(_6792.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6792.xy, uint(rint(_6792.z))).x;
                                                                                                                        float _2526 = fma(_1578, 28.0, _771);
                                                                                                                        float _2528 = fma(_1578, 43.5, -1.0);
                                                                                                                        float _2530 = -_2526;
                                                                                                                        float _2532 = _2530 + _2524;
                                                                                                                        float _2534 = _2532 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                        float _2536 = precise::max(_2534, _2528);
                                                                                                                        float _2538 = precise::min(0.0, _2536);
                                                                                                                        bool _2540 = _2538 != _2534;
                                                                                                                        bool _2542 = isnan(_2538);
                                                                                                                        bool _2544 = _2540 || _2542;
                                                                                                                        bool _2546 = isnan(_2534);
                                                                                                                        bool _2548 = _2544 || _2546;
                                                                                                                        bool _2550 = !_2548;
                                                                                                                        if (!_2550)
                                                                                                                        {
                                                                                                                            float _2552 = fma(_1646, 29.0, _781);
                                                                                                                            float _2554 = fma(_1650, 29.0, _1082);
                                                                                                                            float3 _6846 = float3(_2552, _2554, float(int(_818)));
                                                                                                                            float3 _6848 = select(_6846, float3(0.0), isnan(_6846));
                                                                                                                            float _2556 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6848.xy, uint(rint(_6848.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6848.xy, uint(rint(_6848.z))).x;
                                                                                                                            float _2558 = fma(_1578, 29.0, _771);
                                                                                                                            float _2560 = fma(_1578, 45.0, -1.0);
                                                                                                                            float _2562 = -_2558;
                                                                                                                            float _2564 = _2562 + _2556;
                                                                                                                            float _2566 = _2564 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                            float _2568 = precise::max(_2566, _2560);
                                                                                                                            float _2570 = precise::min(0.0, _2568);
                                                                                                                            bool _2572 = _2570 != _2566;
                                                                                                                            bool _2574 = isnan(_2570);
                                                                                                                            bool _2576 = _2572 || _2574;
                                                                                                                            bool _2578 = isnan(_2566);
                                                                                                                            bool _2580 = _2576 || _2578;
                                                                                                                            _1654 = _2554;
                                                                                                                            _1648 = _2566;
                                                                                                                            _2582 = _2554;
                                                                                                                            _2584 = _2566;
                                                                                                                            _2586 = _2580;
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
        if (!_2586)
        {
            float _2588 = _1654;
            float _2590 = _1648;
            float _2592 = _1512 + 1.0;
            _2582 = _2588;
            _2584 = _2590;
            _1538 = _2592;
        }
        _2586 = false;
        float _2594 = _2582;
        float _2596 = _2584;
        _2598 = _1538;
        _1498 = _2594;
        _1500 = _2596;
        _1502 = _2598;
        if (_1642)
        {
            _2600 = true;
            if (_2600)
            {
                break;
            }
        }
    } while (true);
    _2600 = false;
    float _2602 = _2598 * 0.125;
    float _2604 = -_2602;
    float _2606 = fma(_1486, _2604, 1.0);
    out.m_39.x = _2606;
    return out;
}

