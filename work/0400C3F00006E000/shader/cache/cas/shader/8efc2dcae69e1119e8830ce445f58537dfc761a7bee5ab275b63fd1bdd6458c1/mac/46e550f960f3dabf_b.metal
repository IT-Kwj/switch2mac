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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_76 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_121);
        out.gl_Position.z = _2449;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_103);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _111;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_157);
        out.gl_Position.z = _2518;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_53.z;
    float _161 = in.m_53.w;
    float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _165 = log2(_163);
    float _167 = as_type<float>(int(gl_VertexIndex));
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = in.m_53.x;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_53.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _187 = 0.0;
    float _189 = _181;
    if (!_171)
    {
        float _191 = in.m_53.z;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = _165 * _139;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = exp2(_195);
    float _201 = _159 * 2.0;
    int _203 = as_type<int>(_167) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_167) & 2;
    bool _209 = _207 != 0;
    float _211 = floor(_201);
    float _213 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _175 * 2.0;
    float _221 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _223 = -_181;
    float _225 = fma(_213, 2.0, _223);
    float _227 = _213;
    float _229 = _193;
    if (_171)
    {
        _189 = _175;
    }
    float _231 = _189;
    float _233 = -_199;
    float _235 = _233 + 1.0;
    float _237 = fma(_221, -2.0, _177);
    float _239 = _231;
    if (!_171)
    {
        _227 = _179;
    }
    float _241 = _227;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _245 = _241;
    if (!_171)
    {
        _239 = _159;
    }
    float _247 = _239;
    float _249 = -_139;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _237);
    float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_171)
    {
        _245 = _175;
    }
    float _257 = _245;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _261 = _211 > 0.0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _265 = _211 >= 0.0;
    bool _267 = isnan(_211);
    bool _269 = _265 || _267;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    float _275 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _277 = -_243;
    float _279 = fma(_255, 2.0, _277);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _263);
    float _283 = _257;
    float _285 = _259;
    float _287 = _275;
    if (_171)
    {
        _283 = _179;
    }
    float _289 = _283;
    float _291 = -_259;
    float _293 = fma(_275, 2.0, _291);
    float _295 = _289;
    if (!_171)
    {
        _285 = _193;
    }
    float _297 = _285;
    float _299 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _281);
    float _301 = -_139;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[86].x, _279);
    float _305 = _297;
    if (_171)
    {
        _305 = _179;
    }
    float _307 = _305;
    float _309 = -_139;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[81].x, _293);
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_171)
    {
        _295 = _175;
    }
    float _315 = _295;
    float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_171)
    {
        _287 = _159;
    }
    float _319 = _287;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _323 = _319;
    if (!_171)
    {
        _323 = _179;
    }
    float _325 = _323;
    float _327 = _315 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _329 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _331 = isnan(1.0);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _337 = _333 || _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _341 = 1.0 + _339;
    if (_171)
    {
        _229 = _179;
    }
    float _343 = _229;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[89].z, _185);
    float _347 = fma(_317, -2.0, _313);
    float _349 = 1.0 / _341;
    float _351 = fma(_327, -2.0, _321);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _355 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _357 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _347);
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _375 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _359);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _381 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _373);
    float _383 = _371 ? _235 : 0.0;
    float _385 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _387 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _379);
    float _389 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _375);
    float _391 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _381);
    float _393 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _385);
    float _395 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _353);
    float _397 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[89].x, _345);
    float _399 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _351);
    if (_337)
    {
        float _401 = _383 * _349;
        _141 = _401;
    }
    float _403 = _141;
    float _405 = _179 * 2.0;
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _415 = !_205;
    float _417 = _415 ? (-0.5) : 0.5;
    float _419 = _355 * _183;
    bool _421 = !_209;
    float _423 = _421 ? (-0.5) : 0.5;
    bool _425 = _159 > 0.5;
    bool _427 = _179 > 0.5;
    float _429 = floor(_405);
    bool _431 = !_217;
    int _433 = _431 ? 0 : 1;
    float _435 = -_423;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_423);
    float _439 = -_417;
    int _441 = _427 ? as_type<int>(_439) : as_type<int>(_417);
    float _443 = _173 * _413;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _443);
    int _459 = _273 ? 0 : 1;
    float _461 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _465 = !_455;
    float _467 = _465 ? _423 : as_type<float>(_437);
    float _469 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _471 = floor(_219);
    bool _473 = !_451;
    float _475 = _473 ? _417 : as_type<float>(_441);
    float _477 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _469);
    bool _493 = _429 > 0.0;
    float _495 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    int _497 = ~_459;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _179 + _159;
    int _505 = _501;
    int _507 = _433;
    if (!_261)
    {
        int _509 = ~_459;
        int _511 = _509 + 1;
        _505 = _511;
    }
    int _513 = _505;
    float _515 = _175 + _179;
    bool _517 = _429 >= 0.0;
    bool _519 = isnan(_429);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    bool _529 = !_481;
    int _531 = _529 ? 0 : 1;
    float _533 = _515 + (-1.0);
    int _535 = _525 ? 0 : 1;
    bool _537 = _161 > 0.5;
    float _539 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _541 = !_485;
    int _543 = _541 ? 0 : 1;
    float _545 = floor(_457);
    bool _547 = _471 >= 0.0;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    int _557 = ~_535;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    int _563 = _561;
    if (!_493)
    {
        int _565 = ~_535;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = _503 + (-1.0);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _579 = _577 != 0;
    float _581 = _457 * 6.283185482025146484375;
    int _583 = _555 ? 0 : 1;
    bool _585 = _471 > 0.0;
    float _587 = _175 + _159;
    float _589 = _581 * 0.15915493667125701904296875;
    float _591 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _491);
    float _593 = _587 + (-1.0);
    int _595 = ~_583;
    int _597 = _595 + 1;
    int _599 = _597 + 1;
    float _601 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _609 = -_545;
    float _611 = _457 + _609;
    float _613 = _527 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _589 * 6.283185482025146484375;
    float _617 = cos(_615);
    float _619 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _621 = _599;
    bool _623 = _575;
    if (!_585)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _613 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _637 = _603 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _641 = _619 + _639;
    bool _643 = !_489;
    int _645 = _643 ? 0 : 1;
    float _647 = _633 * _633;
    int _649 = abs(_531);
    float _651 = -_603;
    float _653 = _651 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _655 = float(_569);
    float _657 = fma(_641, _641, _647);
    float _659 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _419);
    float _661 = fma(_637, _637, _657);
    float _663 = fma(_617, 0.5, 0.5);
    int _665 = abs(_645);
    float _667 = -_611;
    float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _671 = rsqrt(_661);
    float _673 = float(_513);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_649);
    float _681 = abs(_641);
    float _683 = abs(_653);
    float _685 = precise::max(_681, _683);
    float _687 = float(_665);
    float _689 = _679 * _673;
    int _691 = abs(_543);
    float _693 = floor(_659);
    float _695 = _641 * 0.0625;
    bool _697 = _685 >= 16.0;
    float _699 = _687 * _655;
    float _701 = float(_629);
    float _703 = _689 * (-2.0);
    float _705 = _633 * _671;
    float _707 = _697 ? _695 : _641;
    float _709 = _637 * _671;
    float _711 = float(_691);
    float _713 = -_705;
    float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _717 = _641 * _671;
    float _719 = _699 * (-2.0);
    float _721 = -_423;
    int _723 = _537 ? as_type<int>(_721) : as_type<int>(_423);
    float _725 = _711 * _701;
    float _727 = _715 * _715;
    float _729 = -_717;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    float _733 = fma(_605, _719, _605);
    float _735 = -_693;
    float _737 = _659 + _735;
    float _739 = _725 * (-2.0);
    float _741 = _659 * 6.283185482025146484375;
    float _743 = fma(_731, _731, _727);
    float _745 = _175 + (-0.5);
    float _747 = fma(_601, _739, _601);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _653;
    int _753 = as_type<int>(_747);
    float _755 = _717;
    if (_697)
    {
        float _757 = _653 * 0.0625;
        _751 = _757;
    }
    float _759 = _751;
    float _761 = fma(_539, _703, _539);
    float _763 = abs(_707);
    bool _765 = _763 != 0.0;
    bool _767 = isnan(_763);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = _745 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _777 = _611 < 0.5;
    float _779 = float(_777);
    float _781 = _749 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _159 + (-0.5);
    float _787 = _179 + (-0.5);
    float _789 = -_709;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _793 = abs(_759);
    bool _795 = _793 == 0.0;
    bool _797 = !_773;
    bool _799 = _795 && _797;
    float _801 = fma(_761, _403, _775);
    float _803 = in.m_58.x;
    float _805 = in.m_58.y;
    float _807 = -_779;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _811 = _787 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _813 = fma(_791, _791, _743);
    bool _815 = _737 < 0.5;
    float _817 = float(_815);
    float _819 = _801 * 0.15915493667125701904296875;
    bool _821 = !_447;
    float _823 = _821 ? _423 : as_type<float>(_723);
    float _825 = _785 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _827 = abs(_759);
    bool _829 = _827 == 0.0;
    float _831 = fma(_783, 0.5, 0.5);
    float _833 = -_817;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _837 = !_575;
    float _839 = _837 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _841 = _819 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _839;
    int _847 = _829 ? (-1) : 0;
    if (_799)
    {
        bool _849 = as_type<int>(_759) >= 0;
        _623 = _849;
    }
    bool _851 = _623;
    float _853 = fma(_733, _403, _825);
    int _855 = abs(as_type<int>(_839));
    float _857 = -_737;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _861 = -_831;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _865 = abs(_433);
    float _867 = sqrt(_813);
    float _869 = fma(_747, _403, _811);
    if (_799)
    {
        int _871 = _851 ? 0 : 1078530011;
        _753 = _871;
    }
    int _873 = _753;
    bool _875 = !_579;
    int _877 = _875 ? 0 : 1;
    float _879 = as_type<float>(_873);
    if (_799)
    {
        int _881 = int(0x80000000) & as_type<int>(_707);
        int _883 = _873 | _881;
        _845 = as_type<float>(_883);
    }
    float _885 = _845;
    bool _887 = !_773;
    bool _889 = _887 && _829;
    float _891 = _885;
    float _893 = _885;
    if (!_889)
    {
        float _895 = abs(_707);
        bool _897 = _895 != as_type<float>(0x7f800000u /* inf */);
        bool _899 = isnan(_895);
        bool _901 = _897 || _899;
        bool _903 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _905 = _901 || _903;
        float _907 = abs(_759);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        float _911 = abs(_759);
        bool _913 = _911 == as_type<float>(0x7f800000u /* inf */);
        bool _915 = !_905;
        bool _917 = _913 && _915;
        if (_917)
        {
            bool _919 = as_type<int>(_759) >= 0;
            _847 = _919 ? (-1) : 0;
        }
        int _921 = _847;
        if (_917)
        {
            _507 = 1075235812;
        }
        int _923 = _507;
        int _925 = _923;
        if (_917)
        {
            int _927 = ~_921;
            int _929 = (_927 != 0) ? _923 : 1061752795;
            _925 = _929;
        }
        int _931 = _925;
        if (_917)
        {
            int _933 = int(0x80000000) & as_type<int>(_707);
            int _935 = _931 | _933;
            _891 = as_type<float>(_935);
        }
        float _937 = _891;
        bool _939 = !_905;
        bool _941 = _939 && _909;
        _893 = _937;
        if (!_941)
        {
            float _943 = abs(_759);
            float _945 = abs(_707);
            float _947 = precise::max(_943, _945);
            float _949 = abs(_759);
            float _951 = abs(_707);
            float _953 = precise::min(_949, _951);
            float _955 = 1.0 / _947;
            float _957 = abs(_707);
            float _959 = abs(_759);
            bool _961 = _957 > _959;
            bool _963 = as_type<int>(_759) >= 0;
            float _965 = _953 * _955;
            float _967 = _965 * _965;
            float _969 = _967 + 11.33538818359375;
            float _971 = fma(_967, _969, 28.84246826171875);
            float _973 = fma(_967, _971, 19.6966705322265625);
            float _975 = fma(_967, -0.82336294651031494140625, -5.674867153167724609375);
            float _977 = fma(_967, _975, -6.565555095672607421875);
            float _979 = 1.0 / _973;
            float _981 = _967 * _977;
            float _983 = abs(_759);
            float _985 = abs(_707);
            float _987 = _983 + _985;
            int _989 = as_type<int>(_707) & int(0x80000000);
            float _991 = _965 * _981;
            bool _993 = _987 > as_type<float>(0x7f800000u /* inf */);
            bool _995 = isnan(_987);
            bool _997 = _993 || _995;
            bool _999 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1001 = _997 || _999;
            float _1003 = fma(_991, _979, _965);
            float _1005 = _1003;
            _893 = _987;
            if (_961)
            {
                float _1007 = -_1003;
                float _1009 = _1007 + 1.57079637050628662109375;
                _1005 = _1009;
            }
            float _1011 = _1005;
            int _1013 = as_type<int>(_1011);
            if (!_963)
            {
                float _1015 = -_1011;
                float _1017 = _1015 + 3.1415927410125732421875;
                _1013 = as_type<int>(_1017);
            }
            int _1019 = _1013;
            _879 = as_type<float>(_1019);
            if (!_1001)
            {
                int _1021 = _989 | _1019;
                _893 = as_type<float>(_1021);
            }
        }
    }
    float _1023 = _893;
    float _1025 = _879;
    float _1027 = -_1023;
    float _1029 = _869 + _1027;
    float _1031 = _853 * 0.15915493667125701904296875;
    int _1033 = abs(_877);
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = float(_855);
    float _1039 = _819 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = float(_865);
    float _1045 = _671 * _867;
    float _1047 = abs(_669);
    float _1049 = _1037 * _1047;
    float _1051 = abs(_859);
    float _1053 = _1037 * _1051;
    float _1055 = float(_1033);
    float _1057 = fma(_1043, _677, _1049);
    float _1059 = fma(_1043, _863, _1053);
    float _1061 = _1031 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _1067 = abs(_809);
    float _1069 = fma(_1055, _1067, _1057);
    float _1071 = abs(_835);
    float _1073 = fma(_1055, _1071, _1059);
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1077 = _805 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1079 = _1035 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = _1069 * _1075;
    float _1085 = _1073 * _1077;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _417);
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1035 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1045 * _1089;
    float _1099 = _1045 * _1091;
    float _1101 = _843 * _1063;
    float _1103 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1105 = _1103 * 0.5;
    float _1107 = _1097 * _1087;
    float _1109 = _1099 * _1065;
    float _1111 = _1031 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1041 * _1081;
    float _1117 = _1101 * _1109;
    float _1119 = _1081 * _1063;
    float _1121 = _843 * _1095;
    float _1123 = _843 * _1081;
    float _1125 = _1041 * _1095;
    float _1127 = _1095 * _1063;
    float _1129 = _1041 * _1063;
    float _1131 = -_1115;
    float _1133 = fma(_1113, _1121, _1131);
    float _1135 = -_1109;
    float _1137 = _1113 * _1135;
    float _1139 = fma(_1113, _1123, _1125);
    float _1141 = _1129 * _1109;
    float _1143 = fma(_1133, _1107, _1117);
    float _1145 = fma(_1127, _1107, _1137);
    float _1147 = fma(_1113, _1125, _1123);
    float _1149 = -_1121;
    float _1151 = fma(_1113, _1115, _1149);
    float _1153 = fma(_1139, _1105, _1143);
    float _1155 = fma(_1119, _1105, _1145);
    float _1157 = fma(_1147, _1107, _1141);
    float _1159 = _603 + _1153;
    float _1161 = _619 + _1155;
    float _1163 = fma(_1151, _1105, _1157);
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1159 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1171 = _1161 + _1169;
    float _1173 = _613 + _1163;
    float _1175 = _1167 * _1167;
    float _1177 = fma(_1171, _1171, _1175);
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = _1123;
    float _1185 = _1175;
    float _1187 = _1141;
    float _1189 = _1177;
    float _1191 = _1025;
    if (!_1181)
    {
        _1183 = _1161;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    if (!_1181)
    {
        _1185 = _1159;
    }
    float _1197 = _1185;
    float _1199 = _1197;
    if (!_1181)
    {
        _1187 = _1173;
    }
    float _1201 = _1187;
    bool _1203 = !_1181;
    float _1205 = _1201;
    if (!_1203)
    {
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1211 = _1179 + _1209;
        float _1213 = rsqrt(_1177);
        float _1215 = _1211 * _1207;
        float _1217 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = _1215 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1223 + (-1.0);
        float _1231 = fma(_1227, _1217, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = _1213 * _1231;
        float _1237 = fma(_1173, _1223, _1233);
        float _1239 = fma(_1171, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1241 = fma(_1167, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1237;
        _1195 = _1239;
        _1199 = _1241;
    }
    float _1243 = _1205;
    float _1245 = _1195;
    float _1247 = _1199;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1253 = -_717;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1257 = -_709;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1263 = _1251 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1267 = _1255 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1271 = _1259 + _1269;
    float _1273 = -_717;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _1277 = _1263 * _1263;
    float _1279 = -_709;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _1283 = fma(_1267, _1267, _1277);
    float _1285 = fma(_1271, _1271, _1283);
    float _1287 = rsqrt(_1285);
    float _1289 = sqrt(_1285);
    float _1291 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1293 = _1267 * _1291;
    float _1295 = _1271 * _1291;
    float _1297 = _1293 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 + _1299;
    float _1303 = sqrt(_1301);
    bool _1305 = _1303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = _1303 + _1307;
    float _1311 = _1105;
    float _1313 = _1309;
    float _1315 = _1295;
    float _1317 = _1297;
    float _1319 = _1299;
    if (_1305)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1311 = _1321;
    }
    float _1323 = _1311;
    if (!_1305)
    {
        _755 = _1293;
    }
    float _1325 = _755;
    float _1327 = _1325;
    if (_1305)
    {
        float _1329 = rsqrt(_1301);
        _1189 = _1329;
    }
    float _1331 = _1189;
    if (_1305)
    {
        float _1333 = _1309 * _1323;
        _1313 = _1333;
    }
    float _1335 = _1313;
    if (_1305)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1191 = _1337;
    }
    float _1339 = _1191;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1041;
    if (_1305)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = precise::max(0.0, _1341);
    float _1353 = -_1291;
    float _1355 = -_1351;
    float _1357 = fma(_1263, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1351;
    float _1363 = _1357;
    if (_1305)
    {
        float _1365 = _1339 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1373 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1305)
    {
        float _1375 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1381 = _1349;
    float _1383 = _1377;
    if (_1305)
    {
        float _1385 = fma(_1349, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1393 = floor(_1371);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1331 * _1387;
        _1395 = _1397;
    }
    float _1399 = _1395;
    float _1401 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1305)
    {
        float _1407 = _1369 + (-1.0);
        _1383 = _1407;
    }
    float _1409 = _1383;
    float _1411 = _1409;
    if (_1305)
    {
        float _1413 = _1293 * _1399;
        _1327 = _1413;
    }
    float _1415 = _1327;
    if (_1305)
    {
        float _1417 = _1295 * _1399;
        _1315 = _1417;
    }
    float _1419 = _1315;
    float _1421 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    if (_1305)
    {
        float _1423 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1411 = _1423;
    }
    float _1425 = _1411;
    if (_1305)
    {
        float _1427 = _1415 * _1415;
        _1317 = _1427;
    }
    float _1429 = _1317;
    if (_1305)
    {
        float _1431 = _1419 * _1419;
        _1319 = _1431;
    }
    float _1433 = _1319;
    if (_1305)
    {
        float _1435 = fma(_1357, _1369, _1425);
        _1363 = _1435;
    }
    float _1437 = _1363;
    float _1439 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1441 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1443 = fma(_1437, _1437, _1429);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1447 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1445);
    float _1449 = precise::clamp(_1447, 0.0, 1.0);
    float _1451 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = _1443 + _1433;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1461 = -_1449;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1467 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1459);
    float _1469 = rsqrt(_1455);
    float _1471 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1473 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1467);
    float _1475 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1477 = -_1471;
    float _1479 = fma(_1477, _1457, 1.0);
    float _1481 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1485 = abs(_1463);
    float _1487 = log2(_1485);
    float _1489 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1465);
    float _1491 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1493 = _1469 * _1415;
    float _1495 = _1469 * _1437;
    float _1497 = _1469 * _1419;
    float _1499 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1491);
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1503 = floor(_1475);
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1507 = -_1501;
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1507);
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1497;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1509);
    float _1517 = -_1393;
    float _1519 = _1371 + _1517;
    float _1521 = exp2(_1511);
    float _1523 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1505);
    float _1525 = fma(_1515, -0.5, 0.5);
    float _1527 = fma(_1515, 0.5, 0.5);
    float _1529 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1531 = -_1503;
    float _1533 = _1475 + _1531;
    float _1535 = 1.0 / _1499;
    float _1537 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1539 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1541 = fma(_1527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1543 = _1495 + 1.0;
    float _1545 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1547 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1549 = fma(_1527, _1541, -0.212114393711090087890625);
    float _1551 = log2(_1479);
    float _1553 = -_1495;
    float _1555 = fma(_1521, _1543, _1553);
    float _1557 = fma(_1527, _1549, 1.570728778839111328125);
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = sqrt(_1525);
    float _1563 = _1545 * _1535;
    float _1565 = _1547 * _1535;
    float _1567 = _1551 * 0.693147182464599609375;
    float2 _4725 = float2(_1519, _1533);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1571 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1561 * 0.636619746685028076171875;
    float _1575 = fma(_1563, 0.5, 0.5);
    float _1577 = fma(_1565, -0.5, 0.5);
    float _1579 = -_1557;
    float _1581 = fma(_1573, _1579, 1.0);
    float3 _4752 = float3(_1575, _1577, _1571);
    float _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float3 _4763 = float3(_1575, _1577, _1571);
    float4 _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).xyzw;
    float _1588 = _1586.x;
    float _1590 = _1586.y;
    float _1592 = _1586.z;
    float _1594 = _1586.w;
    float2 _4779 = float2(_1581, _1559);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4779, float2(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4779, float2(0.0), isnan(_4779)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = -_705;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _1610 = _397 * (-0.15915493667125701904296875);
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1614 = _179 > 0.5;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -_391;
    float _1624 = _1622 + 1.0;
    float _1626 = -_423;
    int _1628 = _1614 ? as_type<int>(_1626) : as_type<int>(_423);
    float _1630 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1616);
    float _1632 = _1610 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    bool _1636 = !_1620;
    float _1638 = _1636 ? _423 : as_type<float>(_1628);
    float _1640 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1630);
    float _1642 = -_395;
    float _1644 = _1642 + 1.0;
    bool _1646 = _175 > 0.5;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = _1610 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1658 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1638 + (-0.5);
    float _1662 = -_393;
    float _1664 = _1662 + 1.0;
    float _1666 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1668 = -_1656;
    float _1670 = -_253;
    float _1672 = fma(_1668, _1660, _1670);
    float _1674 = 1.0 / _1648;
    float _1676 = _467 * _1634;
    float _1678 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = _1678 + _1648;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = _467 * _1654;
    float _1694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = -_1676;
    float _1702 = fma(_475, _1654, _1700);
    float _1704 = fma(_475, _1634, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1708 = _1686 * _1674;
    float _1710 = _1708 * 0.5;
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1714 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1716);
    float _1720 = -_299;
    float _1722 = _1720 + 1.0;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1734 = -_417;
    int _1736 = _1646 ? as_type<int>(_1734) : as_type<int>(_417);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = 1.0 / _1718;
    bool _1746 = !_1684;
    float _1748 = _1746 ? _417 : as_type<float>(_1736);
    float _1750 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1740;
    out.m_60.y = _1742;
    out.m_60.z = _1698;
    out.m_60.w = _1738;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1756 = _1748 + 0.5;
    float _1758 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_62.x = _1750;
    out.m_62.y = _1714;
    out.m_62.z = _1752;
    out.m_62.w = _1706;
    float _1762 = fma(_1754, _1756, _251);
    float _1764 = -_417;
    int _1766 = _425 ? as_type<int>(_1764) : as_type<int>(_417);
    float _1768 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1744 * _1780;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1786 = _1702 + 0.5;
    float _1788 = _1704 + (-0.5);
    float _1790 = -_423;
    float _1792 = _1790 + 0.5;
    float _1794 = _417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1796 = fma(_1758, _1786, _303);
    float _1798 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1800 = _823 + (-0.5);
    float _1802 = abs(_1782);
    float _1804 = log2(_1802);
    float _1806 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1808 = -_1624;
    float _1810 = fma(_1702, _1808, _1796);
    float _1812 = -_1798;
    float _1814 = -_357;
    float _1816 = fma(_1812, _1800, _1814);
    bool _1818 = !_1690;
    float _1820 = _1818 ? _417 : as_type<float>(_1766);
    float _1822 = -_1806;
    float _1824 = -_399;
    float _1826 = fma(_1822, _1788, _1824);
    float _1828 = fma(_823, _1644, _1816);
    float _1830 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1834 = _1820 + 0.5;
    float _1836 = fma(_1704, _1664, _1826);
    float _1838 = -_1830;
    float _1840 = _1113 * _1838;
    float _1842 = _1129 * _1830;
    float _1844 = _1101 * _1830;
    float _1846 = fma(_1832, _1834, _311);
    float _1848 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_64.y = _1792;
    float _1850 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1852 = -_387;
    float _1854 = _1852 + 1.0;
    float _1856 = -_389;
    float _1858 = _1856 + 1.0;
    float _1860 = in.m_66.x;
    float _1862 = exp2(_1848);
    float _1864 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1850);
    float _1866 = fma(_1638, _1854, _1672);
    float _1868 = -_1858;
    float _1870 = fma(_1748, _1868, _1762);
    float _1872 = -_1722;
    float _1874 = fma(_1820, _1872, _1846);
    bool _1876 = _1782 <= 8000.0;
    bool _1878 = isnan(_1782);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    out.m_68.x = _1810;
    out.m_68.y = _1836;
    float _1888 = fma(_1133, _1794, _1844);
    float _1890 = exp2(_1768);
    out.m_70.x = _1870;
    out.m_70.y = _1866;
    out.m_70.z = _1874;
    out.m_70.w = _1828;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = fma(_1894, -2.0, 3.0);
    float _1898 = _1894 * _1894;
    float _1900 = fma(_1127, _1794, _1840);
    float _1902 = fma(_1147, _1794, _1842);
    float _1904 = _1828;
    float _1906 = _1499;
    float _1908 = _1547;
    if (_1778)
    {
        _1904 = 1.0;
    }
    float _1910 = _1904;
    float _1912 = _1898 * _1896;
    float _1914 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1864);
    float _1916 = -_1912;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1914);
    float _1922 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1912);
    float _1924 = _1920 + _1499;
    float _1926 = _1886 * _1922;
    float _1928 = _1924 * 0.5;
    float _1930 = _1910;
    float _1932 = _1920;
    float _1934 = _1928;
    float _1936 = _1545;
    if (!_1778)
    {
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1946 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1944;
        float _1948 = _1940 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        float _1952 = _1942 * 0.15915493667125701904296875;
        float _1954 = _1940 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        float _1958 = 1.0 / _1950;
        float _1960 = _1952 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = _1956 * _1958;
        float _1966 = _1952 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = 1.0 / _1946;
        float _1974 = 1.0 / _1970;
        float _1976 = _1968 * _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1782, _1976, _1978);
        float _1982 = _1980 * _1972;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1930 = _1984;
    }
    float _1986 = _1930;
    float _1988 = -_1890;
    float _1990 = _1988 + 1.0;
    float _1992 = _1119 + _1900;
    float _1994 = _1151 + _1902;
    float _1996 = _1139 + _1888;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2000 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2002 = -_1569;
    float _2004 = _2002 + 1.0;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    float _2006 = _1998 * _1583;
    float _2008 = -_1998;
    float _2010 = _2008 + 1.0;
    out.m_74.x = _1992;
    out.m_74.y = _1994;
    out.m_74.z = _1996;
    float _2012 = _1594 * _2006;
    float _2014 = _1604 * _2006;
    float _2016 = _1594 * _2010;
    float _2018 = _2004 * _2000;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = fma(_1600, _2012, _1588);
    float _2024 = fma(_1602, _2012, _1590);
    float _2026 = fma(_1594, _2014, _1592);
    bool _2028 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1289);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = -_2020;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1545;
    out.gl_Position.y = _1547;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1499;
    float _2042 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2044 = _2040 * _1860;
    out.m_76.x = _2022;
    out.m_76.y = _2024;
    out.m_76.z = _2026;
    out.m_76.w = _2016;
    float _2046 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.z = _1928;
    out.m_78.w = _1499;
    out.m_80.x = _2046;
    float _2048 = _2046;
    if (!_2036)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2050 = _1906;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2036)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2056 = _1932;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2036)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2062 = _1934;
    float _2064 = _2062;
    float _2066 = _2062;
    if (!_2036)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2068 = _1908;
    float _2070 = _2068;
    float _2072 = _2068;
    if (!_2036)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2074 = _1936;
    float _2076 = _2074;
    float _2078 = _2074;
    if (!_2036)
    {
        _2048 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2080 = _2048;
    bool _2082 = !_2036;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2082)
    {
        bool _2088 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2090 = isnan(_1289);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2100 = _1289 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2104 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2102;
            float _2106 = 1.0 / _2104;
            float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2114 = _2112 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2128 = _2100 * _2106;
            float _2130 = precise::clamp(_2128, 0.0, 1.0);
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2136 = fma(_2130, _2110, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2138 = fma(_2130, _2134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2140 = fma(_2130, _2114, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2142 = fma(_2130, _2118, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2144 = fma(_2130, _2122, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2146 = fma(_2130, _2126, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2138;
            _2078 = _2144;
            _2066 = _2136;
            _2072 = _2142;
            _2060 = _2140;
            _2086 = _2146;
            _2148 = true;
        }
        else
        {
            bool _2150 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2152 = isnan(_1289);
            bool _2154 = _2150 || _2152;
            bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2158 = _2154 || _2156;
            if (!_2158)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2160 = _2064;
            _2066 = _2160;
            if (!_2158)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2162 = _2052;
            _2054 = _2162;
            if (!_2158)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2164 = _2058;
            _2060 = _2164;
            if (!_2158)
            {
                _2070 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2166 = _2070;
            _2072 = _2166;
            if (!_2158)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2168 = _2076;
            _2078 = _2168;
            if (!_2158)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2170 = _2084;
            bool _2172 = !_2158;
            _2086 = _2170;
            if (!_2172)
            {
                bool _2174 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2176 = isnan(_1289);
                bool _2178 = _2174 || _2176;
                bool _2180 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2182 = _2178 || _2180;
                if (!_2182)
                {
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2186 = _1289 + _2184;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2188;
                    float _2192 = 1.0 / _2190;
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2214 = _2186 * _2192;
                    float _2216 = precise::clamp(_2214, 0.0, 1.0);
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2222 = fma(_2216, _2196, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2224 = fma(_2216, _2220, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2226 = fma(_2216, _2200, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2228 = fma(_2216, _2204, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2230 = fma(_2216, _2208, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2232 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2224;
                    _2078 = _2230;
                    _2066 = _2222;
                    _2072 = _2228;
                    _2060 = _2226;
                    _2086 = _2232;
                    _2148 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2072 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2148 = false;
    float _2234 = _2054;
    float _2236 = _2078;
    float _2238 = _2066;
    float _2240 = _2072;
    float _2242 = _2060;
    float _2244 = _2086;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2248 = fma(_1994, -0.5, 0.5);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -_2234;
    float _2254 = _2252 + _2236;
    float _2256 = -_2238;
    float _2258 = _2256 + _2240;
    out.m_49.x = _2246;
    float _2260 = fma(_2250, _2254, _2234);
    float _2262 = -_2242;
    float _2264 = _2262 + _2244;
    float _2266 = fma(_2250, _2258, _2238);
    float _2268 = _2260 * 0.586610972881317138671875;
    bool _2270 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2272 = fma(_2250, _2264, _2242);
    out.m_82.x = 0.0;
    float _2274 = fma(_2266, 0.298911988735198974609375, _2268);
    bool _2276 = _1986 > 0.0;
    bool _2278 = isnan(_1986);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = fma(_2272, 0.114477999508380889892578125, _2274);
    float _2288 = -_2286;
    float _2290 = _2266 + _2288;
    float _2292 = -_2286;
    float _2294 = _2260 + _2292;
    float _2296 = -_2286;
    float _2298 = _2272 + _2296;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2304 = fma(_2298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    bool _2306 = !_2270;
    if (!_2306)
    {
        float _2308 = -_1251;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2312 = -_1255;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2316 = -_1259;
        float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2320 = _2310 * _2310;
        float _2322 = fma(_2314, _2314, _2320);
        float _2324 = fma(_2318, _2318, _2322);
        float _2326 = sqrt(_2324);
        float _2328 = rsqrt(_2324);
        float _2330 = -_2326;
        float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2334 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = _2314 * _2328;
        float _2340 = _2310 * _2328;
        float _2342 = abs(_2336);
        float _2344 = log2(_2342);
        float _2346 = _2318 * _2328;
        float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2350 = _1994 * _2340;
        float _2352 = -_2340;
        float _2354 = -_2348;
        float _2356 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2354);
        float _2358 = fma(_1992, _2338, _2350);
        float _2360 = -_2346;
        float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2356);
        float _2364 = fma(_1996, _2346, _2358);
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2370 = _2362 + _2368;
        float _2372 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2376 = precise::clamp(_2374, 0.0, 1.0);
        float _2378 = exp2(_2372);
        float _2380 = _2378 * _2376;
        float _2382 = _2366 * _2380;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2384;
        out.m_82.y = _2386;
        out.m_82.z = _2388;
    }
    out.m_84.x = _2300;
    out.m_84.y = _2302;
    out.m_84.z = _2304;
    if (_2284)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_121);
        out.gl_Position.z = _2449;
    }
    if (!_107)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_103);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _111;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_157);
        out.gl_Position.z = _2518;
    }
    if (_151)
    {
        return out;
    }
    float _159 = in.m_53.z;
    float _161 = in.m_53.w;
    float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _165 = log2(_163);
    float _167 = as_type<float>(int(gl_VertexIndex));
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = in.m_53.x;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_53.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _187 = 0.0;
    float _189 = _181;
    if (!_171)
    {
        float _191 = in.m_53.z;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = _165 * _139;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = exp2(_195);
    float _201 = _159 * 2.0;
    int _203 = as_type<int>(_167) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_167) & 2;
    bool _209 = _207 != 0;
    float _211 = floor(_201);
    float _213 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _175 * 2.0;
    float _221 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _223 = -_181;
    float _225 = fma(_213, 2.0, _223);
    float _227 = _213;
    float _229 = _193;
    if (_171)
    {
        _189 = _175;
    }
    float _231 = _189;
    float _233 = -_199;
    float _235 = _233 + 1.0;
    float _237 = fma(_221, -2.0, _177);
    float _239 = _231;
    if (!_171)
    {
        _227 = _179;
    }
    float _241 = _227;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _245 = _241;
    if (!_171)
    {
        _239 = _159;
    }
    float _247 = _239;
    float _249 = -_139;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _237);
    float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_171)
    {
        _245 = _175;
    }
    float _257 = _245;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _261 = _211 > 0.0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _265 = _211 >= 0.0;
    bool _267 = isnan(_211);
    bool _269 = _265 || _267;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    float _275 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _277 = -_243;
    float _279 = fma(_255, 2.0, _277);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _263);
    float _283 = _257;
    float _285 = _259;
    float _287 = _275;
    if (_171)
    {
        _283 = _179;
    }
    float _289 = _283;
    float _291 = -_259;
    float _293 = fma(_275, 2.0, _291);
    float _295 = _289;
    if (!_171)
    {
        _285 = _193;
    }
    float _297 = _285;
    float _299 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _281);
    float _301 = -_139;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[86].x, _279);
    float _305 = _297;
    if (_171)
    {
        _305 = _179;
    }
    float _307 = _305;
    float _309 = -_139;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[81].x, _293);
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_171)
    {
        _295 = _175;
    }
    float _315 = _295;
    float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_171)
    {
        _287 = _159;
    }
    float _319 = _287;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _323 = _319;
    if (!_171)
    {
        _323 = _179;
    }
    float _325 = _323;
    float _327 = _315 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _329 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _331 = isnan(1.0);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _337 = _333 || _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _341 = 1.0 + _339;
    if (_171)
    {
        _229 = _179;
    }
    float _343 = _229;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[89].z, _185);
    float _347 = fma(_317, -2.0, _313);
    float _349 = 1.0 / _341;
    float _351 = fma(_327, -2.0, _321);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _355 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _357 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _347);
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _375 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _359);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _381 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _373);
    float _383 = _371 ? _235 : 0.0;
    float _385 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _387 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _379);
    float _389 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _375);
    float _391 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _381);
    float _393 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _385);
    float _395 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _353);
    float _397 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[89].x, _345);
    float _399 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _351);
    if (_337)
    {
        float _401 = _383 * _349;
        _141 = _401;
    }
    float _403 = _141;
    float _405 = _179 * 2.0;
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _415 = !_205;
    float _417 = _415 ? (-0.5) : 0.5;
    float _419 = _355 * _183;
    bool _421 = !_209;
    float _423 = _421 ? (-0.5) : 0.5;
    bool _425 = _159 > 0.5;
    bool _427 = _179 > 0.5;
    float _429 = floor(_405);
    bool _431 = !_217;
    int _433 = _431 ? 0 : 1;
    float _435 = -_423;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_423);
    float _439 = -_417;
    int _441 = _427 ? as_type<int>(_439) : as_type<int>(_417);
    float _443 = _173 * _413;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _443);
    int _459 = _273 ? 0 : 1;
    float _461 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _465 = !_455;
    float _467 = _465 ? _423 : as_type<float>(_437);
    float _469 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _471 = floor(_219);
    bool _473 = !_451;
    float _475 = _473 ? _417 : as_type<float>(_441);
    float _477 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _469);
    bool _493 = _429 > 0.0;
    float _495 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    int _497 = ~_459;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _179 + _159;
    int _505 = _501;
    int _507 = _433;
    if (!_261)
    {
        int _509 = ~_459;
        int _511 = _509 + 1;
        _505 = _511;
    }
    int _513 = _505;
    float _515 = _175 + _179;
    bool _517 = _429 >= 0.0;
    bool _519 = isnan(_429);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    bool _529 = !_481;
    int _531 = _529 ? 0 : 1;
    float _533 = _515 + (-1.0);
    int _535 = _525 ? 0 : 1;
    bool _537 = _161 > 0.5;
    float _539 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _541 = !_485;
    int _543 = _541 ? 0 : 1;
    float _545 = floor(_457);
    bool _547 = _471 >= 0.0;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    int _557 = ~_535;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    int _563 = _561;
    if (!_493)
    {
        int _565 = ~_535;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = _503 + (-1.0);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _579 = _577 != 0;
    float _581 = _457 * 6.283185482025146484375;
    int _583 = _555 ? 0 : 1;
    bool _585 = _471 > 0.0;
    float _587 = _175 + _159;
    float _589 = _581 * 0.15915493667125701904296875;
    float _591 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _491);
    float _593 = _587 + (-1.0);
    int _595 = ~_583;
    int _597 = _595 + 1;
    int _599 = _597 + 1;
    float _601 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _609 = -_545;
    float _611 = _457 + _609;
    float _613 = _527 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _589 * 6.283185482025146484375;
    float _617 = cos(_615);
    float _619 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _621 = _599;
    bool _623 = _575;
    if (!_585)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _613 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _637 = _603 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _641 = _619 + _639;
    bool _643 = !_489;
    int _645 = _643 ? 0 : 1;
    float _647 = _633 * _633;
    int _649 = abs(_531);
    float _651 = -_603;
    float _653 = _651 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _655 = float(_569);
    float _657 = fma(_641, _641, _647);
    float _659 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _419);
    float _661 = fma(_637, _637, _657);
    float _663 = fma(_617, 0.5, 0.5);
    int _665 = abs(_645);
    float _667 = -_611;
    float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _671 = rsqrt(_661);
    float _673 = float(_513);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_649);
    float _681 = abs(_641);
    float _683 = abs(_653);
    float _685 = precise::max(_681, _683);
    float _687 = float(_665);
    float _689 = _679 * _673;
    int _691 = abs(_543);
    float _693 = floor(_659);
    float _695 = _641 * 0.0625;
    bool _697 = _685 >= 16.0;
    float _699 = _687 * _655;
    float _701 = float(_629);
    float _703 = _689 * (-2.0);
    float _705 = _633 * _671;
    float _707 = _697 ? _695 : _641;
    float _709 = _637 * _671;
    float _711 = float(_691);
    float _713 = -_705;
    float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _717 = _641 * _671;
    float _719 = _699 * (-2.0);
    float _721 = -_423;
    int _723 = _537 ? as_type<int>(_721) : as_type<int>(_423);
    float _725 = _711 * _701;
    float _727 = _715 * _715;
    float _729 = -_717;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    float _733 = fma(_605, _719, _605);
    float _735 = -_693;
    float _737 = _659 + _735;
    float _739 = _725 * (-2.0);
    float _741 = _659 * 6.283185482025146484375;
    float _743 = fma(_731, _731, _727);
    float _745 = _175 + (-0.5);
    float _747 = fma(_601, _739, _601);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _653;
    int _753 = as_type<int>(_747);
    float _755 = _717;
    if (_697)
    {
        float _757 = _653 * 0.0625;
        _751 = _757;
    }
    float _759 = _751;
    float _761 = fma(_539, _703, _539);
    float _763 = abs(_707);
    bool _765 = _763 != 0.0;
    bool _767 = isnan(_763);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = _745 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _777 = _611 < 0.5;
    float _779 = float(_777);
    float _781 = _749 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _159 + (-0.5);
    float _787 = _179 + (-0.5);
    float _789 = -_709;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _793 = abs(_759);
    bool _795 = _793 == 0.0;
    bool _797 = !_773;
    bool _799 = _795 && _797;
    float _801 = fma(_761, _403, _775);
    float _803 = in.m_58.x;
    float _805 = in.m_58.y;
    float _807 = -_779;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _811 = _787 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _813 = fma(_791, _791, _743);
    bool _815 = _737 < 0.5;
    float _817 = float(_815);
    float _819 = _801 * 0.15915493667125701904296875;
    bool _821 = !_447;
    float _823 = _821 ? _423 : as_type<float>(_723);
    float _825 = _785 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _827 = abs(_759);
    bool _829 = _827 == 0.0;
    float _831 = fma(_783, 0.5, 0.5);
    float _833 = -_817;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _837 = !_575;
    float _839 = _837 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _841 = _819 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _839;
    int _847 = _829 ? (-1) : 0;
    if (_799)
    {
        bool _849 = as_type<int>(_759) >= 0;
        _623 = _849;
    }
    bool _851 = _623;
    float _853 = fma(_733, _403, _825);
    int _855 = abs(as_type<int>(_839));
    float _857 = -_737;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _861 = -_831;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _865 = abs(_433);
    float _867 = sqrt(_813);
    float _869 = fma(_747, _403, _811);
    if (_799)
    {
        int _871 = _851 ? 0 : 1078530011;
        _753 = _871;
    }
    int _873 = _753;
    bool _875 = !_579;
    int _877 = _875 ? 0 : 1;
    float _879 = as_type<float>(_873);
    if (_799)
    {
        int _881 = int(0x80000000) & as_type<int>(_707);
        int _883 = _873 | _881;
        _845 = as_type<float>(_883);
    }
    float _885 = _845;
    bool _887 = !_773;
    bool _889 = _887 && _829;
    float _891 = _885;
    float _893 = _885;
    if (!_889)
    {
        float _895 = abs(_707);
        bool _897 = _895 != as_type<float>(0x7f800000u /* inf */);
        bool _899 = isnan(_895);
        bool _901 = _897 || _899;
        bool _903 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _905 = _901 || _903;
        float _907 = abs(_759);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        float _911 = abs(_759);
        bool _913 = _911 == as_type<float>(0x7f800000u /* inf */);
        bool _915 = !_905;
        bool _917 = _913 && _915;
        if (_917)
        {
            bool _919 = as_type<int>(_759) >= 0;
            _847 = _919 ? (-1) : 0;
        }
        int _921 = _847;
        if (_917)
        {
            _507 = 1075235812;
        }
        int _923 = _507;
        int _925 = _923;
        if (_917)
        {
            int _927 = ~_921;
            int _929 = (_927 != 0) ? _923 : 1061752795;
            _925 = _929;
        }
        int _931 = _925;
        if (_917)
        {
            int _933 = int(0x80000000) & as_type<int>(_707);
            int _935 = _931 | _933;
            _891 = as_type<float>(_935);
        }
        float _937 = _891;
        bool _939 = !_905;
        bool _941 = _939 && _909;
        _893 = _937;
        if (!_941)
        {
            float _943 = abs(_759);
            float _945 = abs(_707);
            float _947 = precise::max(_943, _945);
            float _949 = abs(_759);
            float _951 = abs(_707);
            float _953 = precise::min(_949, _951);
            float _955 = 1.0 / _947;
            float _957 = abs(_707);
            float _959 = abs(_759);
            bool _961 = _957 > _959;
            bool _963 = as_type<int>(_759) >= 0;
            float _965 = _953 * _955;
            float _967 = _965 * _965;
            float _969 = _967 + 11.33538818359375;
            float _971 = fma(_967, _969, 28.84246826171875);
            float _973 = fma(_967, _971, 19.6966705322265625);
            float _975 = fma(_967, -0.82336294651031494140625, -5.674867153167724609375);
            float _977 = fma(_967, _975, -6.565555095672607421875);
            float _979 = 1.0 / _973;
            float _981 = _967 * _977;
            float _983 = abs(_759);
            float _985 = abs(_707);
            float _987 = _983 + _985;
            int _989 = as_type<int>(_707) & int(0x80000000);
            float _991 = _965 * _981;
            bool _993 = _987 > as_type<float>(0x7f800000u /* inf */);
            bool _995 = isnan(_987);
            bool _997 = _993 || _995;
            bool _999 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1001 = _997 || _999;
            float _1003 = fma(_991, _979, _965);
            float _1005 = _1003;
            _893 = _987;
            if (_961)
            {
                float _1007 = -_1003;
                float _1009 = _1007 + 1.57079637050628662109375;
                _1005 = _1009;
            }
            float _1011 = _1005;
            int _1013 = as_type<int>(_1011);
            if (!_963)
            {
                float _1015 = -_1011;
                float _1017 = _1015 + 3.1415927410125732421875;
                _1013 = as_type<int>(_1017);
            }
            int _1019 = _1013;
            _879 = as_type<float>(_1019);
            if (!_1001)
            {
                int _1021 = _989 | _1019;
                _893 = as_type<float>(_1021);
            }
        }
    }
    float _1023 = _893;
    float _1025 = _879;
    float _1027 = -_1023;
    float _1029 = _869 + _1027;
    float _1031 = _853 * 0.15915493667125701904296875;
    int _1033 = abs(_877);
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = float(_855);
    float _1039 = _819 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = float(_865);
    float _1045 = _671 * _867;
    float _1047 = abs(_669);
    float _1049 = _1037 * _1047;
    float _1051 = abs(_859);
    float _1053 = _1037 * _1051;
    float _1055 = float(_1033);
    float _1057 = fma(_1043, _677, _1049);
    float _1059 = fma(_1043, _863, _1053);
    float _1061 = _1031 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _1067 = abs(_809);
    float _1069 = fma(_1055, _1067, _1057);
    float _1071 = abs(_835);
    float _1073 = fma(_1055, _1071, _1059);
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1077 = _805 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1079 = _1035 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = _1069 * _1075;
    float _1085 = _1073 * _1077;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _417);
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1035 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1045 * _1089;
    float _1099 = _1045 * _1091;
    float _1101 = _843 * _1063;
    float _1103 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1105 = _1103 * 0.5;
    float _1107 = _1097 * _1087;
    float _1109 = _1099 * _1065;
    float _1111 = _1031 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1041 * _1081;
    float _1117 = _1101 * _1109;
    float _1119 = _1081 * _1063;
    float _1121 = _843 * _1095;
    float _1123 = _843 * _1081;
    float _1125 = _1041 * _1095;
    float _1127 = _1095 * _1063;
    float _1129 = _1041 * _1063;
    float _1131 = -_1115;
    float _1133 = fma(_1113, _1121, _1131);
    float _1135 = -_1109;
    float _1137 = _1113 * _1135;
    float _1139 = fma(_1113, _1123, _1125);
    float _1141 = _1129 * _1109;
    float _1143 = fma(_1133, _1107, _1117);
    float _1145 = fma(_1127, _1107, _1137);
    float _1147 = fma(_1113, _1125, _1123);
    float _1149 = -_1121;
    float _1151 = fma(_1113, _1115, _1149);
    float _1153 = fma(_1139, _1105, _1143);
    float _1155 = fma(_1119, _1105, _1145);
    float _1157 = fma(_1147, _1107, _1141);
    float _1159 = _603 + _1153;
    float _1161 = _619 + _1155;
    float _1163 = fma(_1151, _1105, _1157);
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1159 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1171 = _1161 + _1169;
    float _1173 = _613 + _1163;
    float _1175 = _1167 * _1167;
    float _1177 = fma(_1171, _1171, _1175);
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = _1123;
    float _1185 = _1175;
    float _1187 = _1141;
    float _1189 = _1177;
    float _1191 = _1025;
    if (!_1181)
    {
        _1183 = _1161;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    if (!_1181)
    {
        _1185 = _1159;
    }
    float _1197 = _1185;
    float _1199 = _1197;
    if (!_1181)
    {
        _1187 = _1173;
    }
    float _1201 = _1187;
    bool _1203 = !_1181;
    float _1205 = _1201;
    if (!_1203)
    {
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1211 = _1179 + _1209;
        float _1213 = rsqrt(_1177);
        float _1215 = _1211 * _1207;
        float _1217 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = _1215 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1223 + (-1.0);
        float _1231 = fma(_1227, _1217, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = _1213 * _1231;
        float _1237 = fma(_1173, _1223, _1233);
        float _1239 = fma(_1171, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1241 = fma(_1167, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1237;
        _1195 = _1239;
        _1199 = _1241;
    }
    float _1243 = _1205;
    float _1245 = _1195;
    float _1247 = _1199;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1253 = -_717;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1257 = -_709;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1263 = _1251 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1267 = _1255 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1271 = _1259 + _1269;
    float _1273 = -_717;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _1277 = _1263 * _1263;
    float _1279 = -_709;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _1283 = fma(_1267, _1267, _1277);
    float _1285 = fma(_1271, _1271, _1283);
    float _1287 = rsqrt(_1285);
    float _1289 = sqrt(_1285);
    float _1291 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1293 = _1267 * _1291;
    float _1295 = _1271 * _1291;
    float _1297 = _1293 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 + _1299;
    float _1303 = sqrt(_1301);
    bool _1305 = _1303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = _1303 + _1307;
    float _1311 = _1105;
    float _1313 = _1309;
    float _1315 = _1295;
    float _1317 = _1297;
    float _1319 = _1299;
    if (_1305)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1311 = _1321;
    }
    float _1323 = _1311;
    if (!_1305)
    {
        _755 = _1293;
    }
    float _1325 = _755;
    float _1327 = _1325;
    if (_1305)
    {
        float _1329 = rsqrt(_1301);
        _1189 = _1329;
    }
    float _1331 = _1189;
    if (_1305)
    {
        float _1333 = _1309 * _1323;
        _1313 = _1333;
    }
    float _1335 = _1313;
    if (_1305)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1191 = _1337;
    }
    float _1339 = _1191;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1041;
    if (_1305)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = precise::max(0.0, _1341);
    float _1353 = -_1291;
    float _1355 = -_1351;
    float _1357 = fma(_1263, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1351;
    float _1363 = _1357;
    if (_1305)
    {
        float _1365 = _1339 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1373 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1305)
    {
        float _1375 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1381 = _1349;
    float _1383 = _1377;
    if (_1305)
    {
        float _1385 = fma(_1349, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1393 = floor(_1371);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1331 * _1387;
        _1395 = _1397;
    }
    float _1399 = _1395;
    float _1401 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1305)
    {
        float _1407 = _1369 + (-1.0);
        _1383 = _1407;
    }
    float _1409 = _1383;
    float _1411 = _1409;
    if (_1305)
    {
        float _1413 = _1293 * _1399;
        _1327 = _1413;
    }
    float _1415 = _1327;
    if (_1305)
    {
        float _1417 = _1295 * _1399;
        _1315 = _1417;
    }
    float _1419 = _1315;
    float _1421 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    if (_1305)
    {
        float _1423 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1411 = _1423;
    }
    float _1425 = _1411;
    if (_1305)
    {
        float _1427 = _1415 * _1415;
        _1317 = _1427;
    }
    float _1429 = _1317;
    if (_1305)
    {
        float _1431 = _1419 * _1419;
        _1319 = _1431;
    }
    float _1433 = _1319;
    if (_1305)
    {
        float _1435 = fma(_1357, _1369, _1425);
        _1363 = _1435;
    }
    float _1437 = _1363;
    float _1439 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1441 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1443 = fma(_1437, _1437, _1429);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1447 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1445);
    float _1449 = precise::clamp(_1447, 0.0, 1.0);
    float _1451 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = _1443 + _1433;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1461 = -_1449;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1467 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1459);
    float _1469 = rsqrt(_1455);
    float _1471 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1473 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1467);
    float _1475 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1477 = -_1471;
    float _1479 = fma(_1477, _1457, 1.0);
    float _1481 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1485 = abs(_1463);
    float _1487 = log2(_1485);
    float _1489 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1465);
    float _1491 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1493 = _1469 * _1415;
    float _1495 = _1469 * _1437;
    float _1497 = _1469 * _1419;
    float _1499 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1491);
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1503 = floor(_1475);
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1507 = -_1501;
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1507);
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1497;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1509);
    float _1517 = -_1393;
    float _1519 = _1371 + _1517;
    float _1521 = exp2(_1511);
    float _1523 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1505);
    float _1525 = fma(_1515, -0.5, 0.5);
    float _1527 = fma(_1515, 0.5, 0.5);
    float _1529 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1531 = -_1503;
    float _1533 = _1475 + _1531;
    float _1535 = 1.0 / _1499;
    float _1537 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1539 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1541 = fma(_1527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1543 = _1495 + 1.0;
    float _1545 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1547 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1549 = fma(_1527, _1541, -0.212114393711090087890625);
    float _1551 = log2(_1479);
    float _1553 = -_1495;
    float _1555 = fma(_1521, _1543, _1553);
    float _1557 = fma(_1527, _1549, 1.570728778839111328125);
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = sqrt(_1525);
    float _1563 = _1545 * _1535;
    float _1565 = _1547 * _1535;
    float _1567 = _1551 * 0.693147182464599609375;
    float2 _4725 = float2(_1519, _1533);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1571 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1561 * 0.636619746685028076171875;
    float _1575 = fma(_1563, 0.5, 0.5);
    float _1577 = fma(_1565, -0.5, 0.5);
    float _1579 = -_1557;
    float _1581 = fma(_1573, _1579, 1.0);
    float3 _4752 = float3(_1575, _1577, _1571);
    float _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float3 _4763 = float3(_1575, _1577, _1571);
    float4 _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).xyzw;
    float _1588 = _1586.x;
    float _1590 = _1586.y;
    float _1592 = _1586.z;
    float _1594 = _1586.w;
    float2 _4779 = float2(_1581, _1559);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4779, float2(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4779, float2(0.0), isnan(_4779)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = -_705;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _1610 = _397 * (-0.15915493667125701904296875);
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1614 = _179 > 0.5;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -_391;
    float _1624 = _1622 + 1.0;
    float _1626 = -_423;
    int _1628 = _1614 ? as_type<int>(_1626) : as_type<int>(_423);
    float _1630 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1616);
    float _1632 = _1610 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    bool _1636 = !_1620;
    float _1638 = _1636 ? _423 : as_type<float>(_1628);
    float _1640 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1630);
    float _1642 = -_395;
    float _1644 = _1642 + 1.0;
    bool _1646 = _175 > 0.5;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = _1610 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1658 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1638 + (-0.5);
    float _1662 = -_393;
    float _1664 = _1662 + 1.0;
    float _1666 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1668 = -_1656;
    float _1670 = -_253;
    float _1672 = fma(_1668, _1660, _1670);
    float _1674 = 1.0 / _1648;
    float _1676 = _467 * _1634;
    float _1678 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = _1678 + _1648;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = _467 * _1654;
    float _1694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = -_1676;
    float _1702 = fma(_475, _1654, _1700);
    float _1704 = fma(_475, _1634, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1708 = _1686 * _1674;
    float _1710 = _1708 * 0.5;
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1714 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1716);
    float _1720 = -_299;
    float _1722 = _1720 + 1.0;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1734 = -_417;
    int _1736 = _1646 ? as_type<int>(_1734) : as_type<int>(_417);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = 1.0 / _1718;
    bool _1746 = !_1684;
    float _1748 = _1746 ? _417 : as_type<float>(_1736);
    float _1750 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1740;
    out.m_60.y = _1742;
    out.m_60.z = _1698;
    out.m_60.w = _1738;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1756 = _1748 + 0.5;
    float _1758 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_62.x = _1750;
    out.m_62.y = _1714;
    out.m_62.z = _1752;
    out.m_62.w = _1706;
    float _1762 = fma(_1754, _1756, _251);
    float _1764 = -_417;
    int _1766 = _425 ? as_type<int>(_1764) : as_type<int>(_417);
    float _1768 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1744 * _1780;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1786 = _1702 + 0.5;
    float _1788 = _1704 + (-0.5);
    float _1790 = -_423;
    float _1792 = _1790 + 0.5;
    float _1794 = _417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1796 = fma(_1758, _1786, _303);
    float _1798 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1800 = _823 + (-0.5);
    float _1802 = abs(_1782);
    float _1804 = log2(_1802);
    float _1806 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1808 = -_1624;
    float _1810 = fma(_1702, _1808, _1796);
    float _1812 = -_1798;
    float _1814 = -_357;
    float _1816 = fma(_1812, _1800, _1814);
    bool _1818 = !_1690;
    float _1820 = _1818 ? _417 : as_type<float>(_1766);
    float _1822 = -_1806;
    float _1824 = -_399;
    float _1826 = fma(_1822, _1788, _1824);
    float _1828 = fma(_823, _1644, _1816);
    float _1830 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1834 = _1820 + 0.5;
    float _1836 = fma(_1704, _1664, _1826);
    float _1838 = -_1830;
    float _1840 = _1113 * _1838;
    float _1842 = _1129 * _1830;
    float _1844 = _1101 * _1830;
    float _1846 = fma(_1832, _1834, _311);
    float _1848 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_64.y = _1792;
    float _1850 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1852 = -_387;
    float _1854 = _1852 + 1.0;
    float _1856 = -_389;
    float _1858 = _1856 + 1.0;
    float _1860 = in.m_66.x;
    float _1862 = exp2(_1848);
    float _1864 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1850);
    float _1866 = fma(_1638, _1854, _1672);
    float _1868 = -_1858;
    float _1870 = fma(_1748, _1868, _1762);
    float _1872 = -_1722;
    float _1874 = fma(_1820, _1872, _1846);
    bool _1876 = _1782 <= 8000.0;
    bool _1878 = isnan(_1782);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    out.m_68.x = _1810;
    out.m_68.y = _1836;
    float _1888 = fma(_1133, _1794, _1844);
    float _1890 = exp2(_1768);
    out.m_70.x = _1870;
    out.m_70.y = _1866;
    out.m_70.z = _1874;
    out.m_70.w = _1828;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = fma(_1894, -2.0, 3.0);
    float _1898 = _1894 * _1894;
    float _1900 = fma(_1127, _1794, _1840);
    float _1902 = fma(_1147, _1794, _1842);
    float _1904 = _1828;
    float _1906 = _1499;
    float _1908 = _1547;
    if (_1778)
    {
        _1904 = 1.0;
    }
    float _1910 = _1904;
    float _1912 = _1898 * _1896;
    float _1914 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1864);
    float _1916 = -_1912;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1914);
    float _1922 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1912);
    float _1924 = _1920 + _1499;
    float _1926 = _1886 * _1922;
    float _1928 = _1924 * 0.5;
    float _1930 = _1910;
    float _1932 = _1920;
    float _1934 = _1928;
    float _1936 = _1545;
    if (!_1778)
    {
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1946 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1944;
        float _1948 = _1940 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        float _1952 = _1942 * 0.15915493667125701904296875;
        float _1954 = _1940 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        float _1958 = 1.0 / _1950;
        float _1960 = _1952 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = _1956 * _1958;
        float _1966 = _1952 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = 1.0 / _1946;
        float _1974 = 1.0 / _1970;
        float _1976 = _1968 * _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1782, _1976, _1978);
        float _1982 = _1980 * _1972;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1930 = _1984;
    }
    float _1986 = _1930;
    float _1988 = -_1890;
    float _1990 = _1988 + 1.0;
    float _1992 = _1119 + _1900;
    float _1994 = _1151 + _1902;
    float _1996 = _1139 + _1888;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2000 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2002 = -_1569;
    float _2004 = _2002 + 1.0;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    float _2006 = _1998 * _1583;
    float _2008 = -_1998;
    float _2010 = _2008 + 1.0;
    out.m_74.x = _1992;
    out.m_74.y = _1994;
    out.m_74.z = _1996;
    float _2012 = _1594 * _2006;
    float _2014 = _1604 * _2006;
    float _2016 = _1594 * _2010;
    float _2018 = _2004 * _2000;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = fma(_1600, _2012, _1588);
    float _2024 = fma(_1602, _2012, _1590);
    float _2026 = fma(_1594, _2014, _1592);
    bool _2028 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1289);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = -_2020;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1545;
    out.gl_Position.y = _1547;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1499;
    float _2042 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2044 = _2040 * _1860;
    out.m_76.x = _2022;
    out.m_76.y = _2024;
    out.m_76.z = _2026;
    out.m_76.w = _2016;
    float _2046 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.z = _1928;
    out.m_78.w = _1499;
    out.m_80.x = _2046;
    float _2048 = _2046;
    if (!_2036)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2050 = _1906;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2036)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2056 = _1932;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2036)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2062 = _1934;
    float _2064 = _2062;
    float _2066 = _2062;
    if (!_2036)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2068 = _1908;
    float _2070 = _2068;
    float _2072 = _2068;
    if (!_2036)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2074 = _1936;
    float _2076 = _2074;
    float _2078 = _2074;
    if (!_2036)
    {
        _2048 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2080 = _2048;
    bool _2082 = !_2036;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2082)
    {
        bool _2088 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2090 = isnan(_1289);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2100 = _1289 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2104 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2102;
            float _2106 = 1.0 / _2104;
            float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2114 = _2112 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2128 = _2100 * _2106;
            float _2130 = precise::clamp(_2128, 0.0, 1.0);
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2136 = fma(_2130, _2110, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2138 = fma(_2130, _2134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2140 = fma(_2130, _2114, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2142 = fma(_2130, _2118, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2144 = fma(_2130, _2122, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2146 = fma(_2130, _2126, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2138;
            _2078 = _2144;
            _2066 = _2136;
            _2072 = _2142;
            _2060 = _2140;
            _2086 = _2146;
            _2148 = true;
        }
        else
        {
            bool _2150 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2152 = isnan(_1289);
            bool _2154 = _2150 || _2152;
            bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2158 = _2154 || _2156;
            if (!_2158)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2160 = _2064;
            _2066 = _2160;
            if (!_2158)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2162 = _2052;
            _2054 = _2162;
            if (!_2158)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2164 = _2058;
            _2060 = _2164;
            if (!_2158)
            {
                _2070 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2166 = _2070;
            _2072 = _2166;
            if (!_2158)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2168 = _2076;
            _2078 = _2168;
            if (!_2158)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2170 = _2084;
            bool _2172 = !_2158;
            _2086 = _2170;
            if (!_2172)
            {
                bool _2174 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2176 = isnan(_1289);
                bool _2178 = _2174 || _2176;
                bool _2180 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2182 = _2178 || _2180;
                if (!_2182)
                {
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2186 = _1289 + _2184;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2188;
                    float _2192 = 1.0 / _2190;
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2214 = _2186 * _2192;
                    float _2216 = precise::clamp(_2214, 0.0, 1.0);
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2222 = fma(_2216, _2196, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2224 = fma(_2216, _2220, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2226 = fma(_2216, _2200, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2228 = fma(_2216, _2204, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2230 = fma(_2216, _2208, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2232 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2224;
                    _2078 = _2230;
                    _2066 = _2222;
                    _2072 = _2228;
                    _2060 = _2226;
                    _2086 = _2232;
                    _2148 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2072 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2148 = false;
    float _2234 = _2054;
    float _2236 = _2078;
    float _2238 = _2066;
    float _2240 = _2072;
    float _2242 = _2060;
    float _2244 = _2086;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2248 = fma(_1994, -0.5, 0.5);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -_2234;
    float _2254 = _2252 + _2236;
    float _2256 = -_2238;
    float _2258 = _2256 + _2240;
    out.m_49.x = _2246;
    float _2260 = fma(_2250, _2254, _2234);
    float _2262 = -_2242;
    float _2264 = _2262 + _2244;
    float _2266 = fma(_2250, _2258, _2238);
    float _2268 = _2260 * 0.586610972881317138671875;
    bool _2270 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2272 = fma(_2250, _2264, _2242);
    out.m_82.x = 0.0;
    float _2274 = fma(_2266, 0.298911988735198974609375, _2268);
    bool _2276 = _1986 > 0.0;
    bool _2278 = isnan(_1986);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = fma(_2272, 0.114477999508380889892578125, _2274);
    float _2288 = -_2286;
    float _2290 = _2266 + _2288;
    float _2292 = -_2286;
    float _2294 = _2260 + _2292;
    float _2296 = -_2286;
    float _2298 = _2272 + _2296;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2304 = fma(_2298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    bool _2306 = !_2270;
    if (!_2306)
    {
        float _2308 = -_1251;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2312 = -_1255;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2316 = -_1259;
        float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2320 = _2310 * _2310;
        float _2322 = fma(_2314, _2314, _2320);
        float _2324 = fma(_2318, _2318, _2322);
        float _2326 = sqrt(_2324);
        float _2328 = rsqrt(_2324);
        float _2330 = -_2326;
        float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2334 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = _2314 * _2328;
        float _2340 = _2310 * _2328;
        float _2342 = abs(_2336);
        float _2344 = log2(_2342);
        float _2346 = _2318 * _2328;
        float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2350 = _1994 * _2340;
        float _2352 = -_2340;
        float _2354 = -_2348;
        float _2356 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2354);
        float _2358 = fma(_1992, _2338, _2350);
        float _2360 = -_2346;
        float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2356);
        float _2364 = fma(_1996, _2346, _2358);
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2370 = _2362 + _2368;
        float _2372 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2376 = precise::clamp(_2374, 0.0, 1.0);
        float _2378 = exp2(_2372);
        float _2380 = _2378 * _2376;
        float _2382 = _2366 * _2380;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2384;
        out.m_82.y = _2386;
        out.m_82.z = _2388;
    }
    out.m_84.x = _2300;
    out.m_84.y = _2302;
    out.m_84.z = _2304;
    if (_2284)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2148 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    float _115 = _113;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_107)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_121);
        out.gl_Position.z = _2449;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_103);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _111;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2518 = as_type<float>(_157);
        out.gl_Position.z = _2518;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_53.z;
    float _161 = in.m_53.w;
    float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _165 = log2(_163);
    float _167 = as_type<float>(int(gl_VertexIndex));
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _175 = in.m_53.x;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_53.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _187 = 0.0;
    float _189 = _181;
    if (!_171)
    {
        float _191 = in.m_53.z;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = _165 * _139;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = exp2(_195);
    float _201 = _159 * 2.0;
    int _203 = as_type<int>(_167) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_167) & 2;
    bool _209 = _207 != 0;
    float _211 = floor(_201);
    float _213 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _215 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _217 = _215 != 0;
    float _219 = _175 * 2.0;
    float _221 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _223 = -_181;
    float _225 = fma(_213, 2.0, _223);
    float _227 = _213;
    float _229 = _193;
    if (_171)
    {
        _189 = _175;
    }
    float _231 = _189;
    float _233 = -_199;
    float _235 = _233 + 1.0;
    float _237 = fma(_221, -2.0, _177);
    float _239 = _231;
    if (!_171)
    {
        _227 = _179;
    }
    float _241 = _227;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _245 = _241;
    if (!_171)
    {
        _239 = _159;
    }
    float _247 = _239;
    float _249 = -_139;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _237);
    float _255 = _247 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_171)
    {
        _245 = _175;
    }
    float _257 = _245;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _261 = _211 > 0.0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _265 = _211 >= 0.0;
    bool _267 = isnan(_211);
    bool _269 = _265 || _267;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    float _275 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _277 = -_243;
    float _279 = fma(_255, 2.0, _277);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _263);
    float _283 = _257;
    float _285 = _259;
    float _287 = _275;
    if (_171)
    {
        _283 = _179;
    }
    float _289 = _283;
    float _291 = -_259;
    float _293 = fma(_275, 2.0, _291);
    float _295 = _289;
    if (!_171)
    {
        _285 = _193;
    }
    float _297 = _285;
    float _299 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _281);
    float _301 = -_139;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[86].x, _279);
    float _305 = _297;
    if (_171)
    {
        _305 = _179;
    }
    float _307 = _305;
    float _309 = -_139;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[81].x, _293);
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_171)
    {
        _295 = _175;
    }
    float _315 = _295;
    float _317 = _307 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_171)
    {
        _287 = _159;
    }
    float _319 = _287;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _323 = _319;
    if (!_171)
    {
        _323 = _179;
    }
    float _325 = _323;
    float _327 = _315 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _329 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _331 = isnan(1.0);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _337 = _333 || _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _341 = 1.0 + _339;
    if (_171)
    {
        _229 = _179;
    }
    float _343 = _229;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[89].z, _185);
    float _347 = fma(_317, -2.0, _313);
    float _349 = 1.0 / _341;
    float _351 = fma(_327, -2.0, _321);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _355 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _357 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _347);
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _363 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _375 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _359);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _379 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _381 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _373);
    float _383 = _371 ? _235 : 0.0;
    float _385 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _377);
    float _387 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _379);
    float _389 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _375);
    float _391 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _381);
    float _393 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _385);
    float _395 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _353);
    float _397 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[89].x, _345);
    float _399 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _351);
    if (_337)
    {
        float _401 = _383 * _349;
        _141 = _401;
    }
    float _403 = _141;
    float _405 = _179 * 2.0;
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _415 = !_205;
    float _417 = _415 ? (-0.5) : 0.5;
    float _419 = _355 * _183;
    bool _421 = !_209;
    float _423 = _421 ? (-0.5) : 0.5;
    bool _425 = _159 > 0.5;
    bool _427 = _179 > 0.5;
    float _429 = floor(_405);
    bool _431 = !_217;
    int _433 = _431 ? 0 : 1;
    float _435 = -_423;
    int _437 = _425 ? as_type<int>(_435) : as_type<int>(_423);
    float _439 = -_417;
    int _441 = _427 ? as_type<int>(_439) : as_type<int>(_417);
    float _443 = _173 * _413;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _443);
    int _459 = _273 ? 0 : 1;
    float _461 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _463 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _465 = !_455;
    float _467 = _465 ? _423 : as_type<float>(_437);
    float _469 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _471 = floor(_219);
    bool _473 = !_451;
    float _475 = _473 ? _417 : as_type<float>(_441);
    float _477 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _481 = _479 != 0;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _489 = _487 != 0;
    float _491 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _469);
    bool _493 = _429 > 0.0;
    float _495 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _461);
    int _497 = ~_459;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _179 + _159;
    int _505 = _501;
    int _507 = _433;
    if (!_261)
    {
        int _509 = ~_459;
        int _511 = _509 + 1;
        _505 = _511;
    }
    int _513 = _505;
    float _515 = _175 + _179;
    bool _517 = _429 >= 0.0;
    bool _519 = isnan(_429);
    bool _521 = _517 || _519;
    bool _523 = isnan(0.0);
    bool _525 = _521 || _523;
    float _527 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _477);
    bool _529 = !_481;
    int _531 = _529 ? 0 : 1;
    float _533 = _515 + (-1.0);
    int _535 = _525 ? 0 : 1;
    bool _537 = _161 > 0.5;
    float _539 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _541 = !_485;
    int _543 = _541 ? 0 : 1;
    float _545 = floor(_457);
    bool _547 = _471 >= 0.0;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    int _557 = ~_535;
    int _559 = _557 + 1;
    int _561 = _559 + 1;
    int _563 = _561;
    if (!_493)
    {
        int _565 = ~_535;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = _503 + (-1.0);
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _575 = _573 != 0;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _579 = _577 != 0;
    float _581 = _457 * 6.283185482025146484375;
    int _583 = _555 ? 0 : 1;
    bool _585 = _471 > 0.0;
    float _587 = _175 + _159;
    float _589 = _581 * 0.15915493667125701904296875;
    float _591 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _491);
    float _593 = _587 + (-1.0);
    int _595 = ~_583;
    int _597 = _595 + 1;
    int _599 = _597 + 1;
    float _601 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _591 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
    float _609 = -_545;
    float _611 = _457 + _609;
    float _613 = _527 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _589 * 6.283185482025146484375;
    float _617 = cos(_615);
    float _619 = _607 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _621 = _599;
    bool _623 = _575;
    if (!_585)
    {
        int _625 = ~_583;
        int _627 = _625 + 1;
        _621 = _627;
    }
    int _629 = _621;
    float _631 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _633 = _613 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _637 = _603 + _635;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _641 = _619 + _639;
    bool _643 = !_489;
    int _645 = _643 ? 0 : 1;
    float _647 = _633 * _633;
    int _649 = abs(_531);
    float _651 = -_603;
    float _653 = _651 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _655 = float(_569);
    float _657 = fma(_641, _641, _647);
    float _659 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _419);
    float _661 = fma(_637, _637, _657);
    float _663 = fma(_617, 0.5, 0.5);
    int _665 = abs(_645);
    float _667 = -_611;
    float _669 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _671 = rsqrt(_661);
    float _673 = float(_513);
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _679 = float(_649);
    float _681 = abs(_641);
    float _683 = abs(_653);
    float _685 = precise::max(_681, _683);
    float _687 = float(_665);
    float _689 = _679 * _673;
    int _691 = abs(_543);
    float _693 = floor(_659);
    float _695 = _641 * 0.0625;
    bool _697 = _685 >= 16.0;
    float _699 = _687 * _655;
    float _701 = float(_629);
    float _703 = _689 * (-2.0);
    float _705 = _633 * _671;
    float _707 = _697 ? _695 : _641;
    float _709 = _637 * _671;
    float _711 = float(_691);
    float _713 = -_705;
    float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _717 = _641 * _671;
    float _719 = _699 * (-2.0);
    float _721 = -_423;
    int _723 = _537 ? as_type<int>(_721) : as_type<int>(_423);
    float _725 = _711 * _701;
    float _727 = _715 * _715;
    float _729 = -_717;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    float _733 = fma(_605, _719, _605);
    float _735 = -_693;
    float _737 = _659 + _735;
    float _739 = _725 * (-2.0);
    float _741 = _659 * 6.283185482025146484375;
    float _743 = fma(_731, _731, _727);
    float _745 = _175 + (-0.5);
    float _747 = fma(_601, _739, _601);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = _653;
    int _753 = as_type<int>(_747);
    float _755 = _717;
    if (_697)
    {
        float _757 = _653 * 0.0625;
        _751 = _757;
    }
    float _759 = _751;
    float _761 = fma(_539, _703, _539);
    float _763 = abs(_707);
    bool _765 = _763 != 0.0;
    bool _767 = isnan(_763);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = _745 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _777 = _611 < 0.5;
    float _779 = float(_777);
    float _781 = _749 * 6.283185482025146484375;
    float _783 = cos(_781);
    float _785 = _159 + (-0.5);
    float _787 = _179 + (-0.5);
    float _789 = -_709;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _793 = abs(_759);
    bool _795 = _793 == 0.0;
    bool _797 = !_773;
    bool _799 = _795 && _797;
    float _801 = fma(_761, _403, _775);
    float _803 = in.m_58.x;
    float _805 = in.m_58.y;
    float _807 = -_779;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _811 = _787 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _813 = fma(_791, _791, _743);
    bool _815 = _737 < 0.5;
    float _817 = float(_815);
    float _819 = _801 * 0.15915493667125701904296875;
    bool _821 = !_447;
    float _823 = _821 ? _423 : as_type<float>(_723);
    float _825 = _785 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _827 = abs(_759);
    bool _829 = _827 == 0.0;
    float _831 = fma(_783, 0.5, 0.5);
    float _833 = -_817;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _837 = !_575;
    float _839 = _837 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _841 = _819 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = _839;
    int _847 = _829 ? (-1) : 0;
    if (_799)
    {
        bool _849 = as_type<int>(_759) >= 0;
        _623 = _849;
    }
    bool _851 = _623;
    float _853 = fma(_733, _403, _825);
    int _855 = abs(as_type<int>(_839));
    float _857 = -_737;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _861 = -_831;
    float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _865 = abs(_433);
    float _867 = sqrt(_813);
    float _869 = fma(_747, _403, _811);
    if (_799)
    {
        int _871 = _851 ? 0 : 1078530011;
        _753 = _871;
    }
    int _873 = _753;
    bool _875 = !_579;
    int _877 = _875 ? 0 : 1;
    float _879 = as_type<float>(_873);
    if (_799)
    {
        int _881 = int(0x80000000) & as_type<int>(_707);
        int _883 = _873 | _881;
        _845 = as_type<float>(_883);
    }
    float _885 = _845;
    bool _887 = !_773;
    bool _889 = _887 && _829;
    float _891 = _885;
    float _893 = _885;
    if (!_889)
    {
        float _895 = abs(_707);
        bool _897 = _895 != as_type<float>(0x7f800000u /* inf */);
        bool _899 = isnan(_895);
        bool _901 = _897 || _899;
        bool _903 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _905 = _901 || _903;
        float _907 = abs(_759);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        float _911 = abs(_759);
        bool _913 = _911 == as_type<float>(0x7f800000u /* inf */);
        bool _915 = !_905;
        bool _917 = _913 && _915;
        if (_917)
        {
            bool _919 = as_type<int>(_759) >= 0;
            _847 = _919 ? (-1) : 0;
        }
        int _921 = _847;
        if (_917)
        {
            _507 = 1075235812;
        }
        int _923 = _507;
        int _925 = _923;
        if (_917)
        {
            int _927 = ~_921;
            int _929 = (_927 != 0) ? _923 : 1061752795;
            _925 = _929;
        }
        int _931 = _925;
        if (_917)
        {
            int _933 = int(0x80000000) & as_type<int>(_707);
            int _935 = _931 | _933;
            _891 = as_type<float>(_935);
        }
        float _937 = _891;
        bool _939 = !_905;
        bool _941 = _939 && _909;
        _893 = _937;
        if (!_941)
        {
            float _943 = abs(_759);
            float _945 = abs(_707);
            float _947 = precise::max(_943, _945);
            float _949 = abs(_759);
            float _951 = abs(_707);
            float _953 = precise::min(_949, _951);
            float _955 = 1.0 / _947;
            float _957 = abs(_707);
            float _959 = abs(_759);
            bool _961 = _957 > _959;
            bool _963 = as_type<int>(_759) >= 0;
            float _965 = _953 * _955;
            float _967 = _965 * _965;
            float _969 = _967 + 11.33538818359375;
            float _971 = fma(_967, _969, 28.84246826171875);
            float _973 = fma(_967, _971, 19.6966705322265625);
            float _975 = fma(_967, -0.82336294651031494140625, -5.674867153167724609375);
            float _977 = fma(_967, _975, -6.565555095672607421875);
            float _979 = 1.0 / _973;
            float _981 = _967 * _977;
            float _983 = abs(_759);
            float _985 = abs(_707);
            float _987 = _983 + _985;
            int _989 = as_type<int>(_707) & int(0x80000000);
            float _991 = _965 * _981;
            bool _993 = _987 > as_type<float>(0x7f800000u /* inf */);
            bool _995 = isnan(_987);
            bool _997 = _993 || _995;
            bool _999 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1001 = _997 || _999;
            float _1003 = fma(_991, _979, _965);
            float _1005 = _1003;
            _893 = _987;
            if (_961)
            {
                float _1007 = -_1003;
                float _1009 = _1007 + 1.57079637050628662109375;
                _1005 = _1009;
            }
            float _1011 = _1005;
            int _1013 = as_type<int>(_1011);
            if (!_963)
            {
                float _1015 = -_1011;
                float _1017 = _1015 + 3.1415927410125732421875;
                _1013 = as_type<int>(_1017);
            }
            int _1019 = _1013;
            _879 = as_type<float>(_1019);
            if (!_1001)
            {
                int _1021 = _989 | _1019;
                _893 = as_type<float>(_1021);
            }
        }
    }
    float _1023 = _893;
    float _1025 = _879;
    float _1027 = -_1023;
    float _1029 = _869 + _1027;
    float _1031 = _853 * 0.15915493667125701904296875;
    int _1033 = abs(_877);
    float _1035 = _1029 * 0.15915493667125701904296875;
    float _1037 = float(_855);
    float _1039 = _819 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = float(_865);
    float _1045 = _671 * _867;
    float _1047 = abs(_669);
    float _1049 = _1037 * _1047;
    float _1051 = abs(_859);
    float _1053 = _1037 * _1051;
    float _1055 = float(_1033);
    float _1057 = fma(_1043, _677, _1049);
    float _1059 = fma(_1043, _863, _1053);
    float _1061 = _1031 * 6.283185482025146484375;
    float _1063 = cos(_1061);
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _1067 = abs(_809);
    float _1069 = fma(_1055, _1067, _1057);
    float _1071 = abs(_835);
    float _1073 = fma(_1055, _1071, _1059);
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1077 = _805 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1079 = _1035 * 6.283185482025146484375;
    float _1081 = sin(_1079);
    float _1083 = _1069 * _1075;
    float _1085 = _1073 * _1077;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _417);
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1035 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1045 * _1089;
    float _1099 = _1045 * _1091;
    float _1101 = _843 * _1063;
    float _1103 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1105 = _1103 * 0.5;
    float _1107 = _1097 * _1087;
    float _1109 = _1099 * _1065;
    float _1111 = _1031 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1041 * _1081;
    float _1117 = _1101 * _1109;
    float _1119 = _1081 * _1063;
    float _1121 = _843 * _1095;
    float _1123 = _843 * _1081;
    float _1125 = _1041 * _1095;
    float _1127 = _1095 * _1063;
    float _1129 = _1041 * _1063;
    float _1131 = -_1115;
    float _1133 = fma(_1113, _1121, _1131);
    float _1135 = -_1109;
    float _1137 = _1113 * _1135;
    float _1139 = fma(_1113, _1123, _1125);
    float _1141 = _1129 * _1109;
    float _1143 = fma(_1133, _1107, _1117);
    float _1145 = fma(_1127, _1107, _1137);
    float _1147 = fma(_1113, _1125, _1123);
    float _1149 = -_1121;
    float _1151 = fma(_1113, _1115, _1149);
    float _1153 = fma(_1139, _1105, _1143);
    float _1155 = fma(_1119, _1105, _1145);
    float _1157 = fma(_1147, _1107, _1141);
    float _1159 = _603 + _1153;
    float _1161 = _619 + _1155;
    float _1163 = fma(_1151, _1105, _1157);
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1159 + _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1171 = _1161 + _1169;
    float _1173 = _613 + _1163;
    float _1175 = _1167 * _1167;
    float _1177 = fma(_1171, _1171, _1175);
    float _1179 = sqrt(_1177);
    bool _1181 = _1179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1183 = _1123;
    float _1185 = _1175;
    float _1187 = _1141;
    float _1189 = _1177;
    float _1191 = _1025;
    if (!_1181)
    {
        _1183 = _1161;
    }
    float _1193 = _1183;
    float _1195 = _1193;
    if (!_1181)
    {
        _1185 = _1159;
    }
    float _1197 = _1185;
    float _1199 = _1197;
    if (!_1181)
    {
        _1187 = _1173;
    }
    float _1201 = _1187;
    bool _1203 = !_1181;
    float _1205 = _1201;
    if (!_1203)
    {
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1211 = _1179 + _1209;
        float _1213 = rsqrt(_1177);
        float _1215 = _1211 * _1207;
        float _1217 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = _1215 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 6.283185482025146484375;
        float _1227 = sin(_1225);
        float _1229 = _1223 + (-1.0);
        float _1231 = fma(_1227, _1217, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1235 = _1213 * _1231;
        float _1237 = fma(_1173, _1223, _1233);
        float _1239 = fma(_1171, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1241 = fma(_1167, _1235, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1205 = _1237;
        _1195 = _1239;
        _1199 = _1241;
    }
    float _1243 = _1205;
    float _1245 = _1195;
    float _1247 = _1199;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1253 = -_717;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1257 = -_709;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1263 = _1251 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1267 = _1255 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1271 = _1259 + _1269;
    float _1273 = -_717;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _619);
    float _1277 = _1263 * _1263;
    float _1279 = -_709;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _1283 = fma(_1267, _1267, _1277);
    float _1285 = fma(_1271, _1271, _1283);
    float _1287 = rsqrt(_1285);
    float _1289 = sqrt(_1285);
    float _1291 = _1287 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1293 = _1267 * _1291;
    float _1295 = _1271 * _1291;
    float _1297 = _1293 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 + _1299;
    float _1303 = sqrt(_1301);
    bool _1305 = _1303 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = _1303 + _1307;
    float _1311 = _1105;
    float _1313 = _1309;
    float _1315 = _1295;
    float _1317 = _1297;
    float _1319 = _1299;
    if (_1305)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1311 = _1321;
    }
    float _1323 = _1311;
    if (!_1305)
    {
        _755 = _1293;
    }
    float _1325 = _755;
    float _1327 = _1325;
    if (_1305)
    {
        float _1329 = rsqrt(_1301);
        _1189 = _1329;
    }
    float _1331 = _1189;
    if (_1305)
    {
        float _1333 = _1309 * _1323;
        _1313 = _1333;
    }
    float _1335 = _1313;
    if (_1305)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1191 = _1337;
    }
    float _1339 = _1191;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1041;
    if (_1305)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = precise::max(0.0, _1341);
    float _1353 = -_1291;
    float _1355 = -_1351;
    float _1357 = fma(_1263, _1353, _1355);
    float _1359 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1351;
    float _1363 = _1357;
    if (_1305)
    {
        float _1365 = _1339 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        _1359 = _1367;
    }
    float _1369 = _1359;
    float _1371 = fma(_1275, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1373 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1305)
    {
        float _1375 = _1357 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1375;
    }
    float _1377 = _1361;
    float _1379 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1381 = _1349;
    float _1383 = _1377;
    if (_1305)
    {
        float _1385 = fma(_1349, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1379);
    float _1393 = floor(_1371);
    float _1395 = _1387;
    if (_1305)
    {
        float _1397 = _1331 * _1387;
        _1395 = _1397;
    }
    float _1399 = _1395;
    float _1401 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1403 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (_1305)
    {
        float _1407 = _1369 + (-1.0);
        _1383 = _1407;
    }
    float _1409 = _1383;
    float _1411 = _1409;
    if (_1305)
    {
        float _1413 = _1293 * _1399;
        _1327 = _1413;
    }
    float _1415 = _1327;
    if (_1305)
    {
        float _1417 = _1295 * _1399;
        _1315 = _1417;
    }
    float _1419 = _1315;
    float _1421 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1401);
    if (_1305)
    {
        float _1423 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1411 = _1423;
    }
    float _1425 = _1411;
    if (_1305)
    {
        float _1427 = _1415 * _1415;
        _1317 = _1427;
    }
    float _1429 = _1317;
    if (_1305)
    {
        float _1431 = _1419 * _1419;
        _1319 = _1431;
    }
    float _1433 = _1319;
    if (_1305)
    {
        float _1435 = fma(_1357, _1369, _1425);
        _1363 = _1435;
    }
    float _1437 = _1363;
    float _1439 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1421);
    float _1441 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1443 = fma(_1437, _1437, _1429);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1447 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1445);
    float _1449 = precise::clamp(_1447, 0.0, 1.0);
    float _1451 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1455 = _1443 + _1433;
    float _1457 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1459 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1461 = -_1449;
    float _1463 = _1461 + 1.0;
    float _1465 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1467 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1459);
    float _1469 = rsqrt(_1455);
    float _1471 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1473 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1467);
    float _1475 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1477 = -_1471;
    float _1479 = fma(_1477, _1457, 1.0);
    float _1481 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1483 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1485 = abs(_1463);
    float _1487 = log2(_1485);
    float _1489 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1465);
    float _1491 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1489);
    float _1493 = _1469 * _1415;
    float _1495 = _1469 * _1437;
    float _1497 = _1469 * _1419;
    float _1499 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1491);
    float _1501 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1503 = floor(_1475);
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1507 = -_1501;
    float _1509 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1507);
    float _1511 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = -_1497;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1509);
    float _1517 = -_1393;
    float _1519 = _1371 + _1517;
    float _1521 = exp2(_1511);
    float _1523 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1505);
    float _1525 = fma(_1515, -0.5, 0.5);
    float _1527 = fma(_1515, 0.5, 0.5);
    float _1529 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1481);
    float _1531 = -_1503;
    float _1533 = _1475 + _1531;
    float _1535 = 1.0 / _1499;
    float _1537 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1523);
    float _1539 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1529);
    float _1541 = fma(_1527, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1543 = _1495 + 1.0;
    float _1545 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1537);
    float _1547 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1539);
    float _1549 = fma(_1527, _1541, -0.212114393711090087890625);
    float _1551 = log2(_1479);
    float _1553 = -_1495;
    float _1555 = fma(_1521, _1543, _1553);
    float _1557 = fma(_1527, _1549, 1.570728778839111328125);
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = sqrt(_1525);
    float _1563 = _1545 * _1535;
    float _1565 = _1547 * _1535;
    float _1567 = _1551 * 0.693147182464599609375;
    float2 _4725 = float2(_1519, _1533);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1571 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1573 = _1561 * 0.636619746685028076171875;
    float _1575 = fma(_1563, 0.5, 0.5);
    float _1577 = fma(_1565, -0.5, 0.5);
    float _1579 = -_1557;
    float _1581 = fma(_1573, _1579, 1.0);
    float3 _4752 = float3(_1575, _1577, _1571);
    float _1583 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float3 _4763 = float3(_1575, _1577, _1571);
    float4 _1586 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4763, float3(0.0), isnan(_4763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4763, float3(0.0), isnan(_4763)), level(0.0)).xyzw;
    float _1588 = _1586.x;
    float _1590 = _1586.y;
    float _1592 = _1586.z;
    float _1594 = _1586.w;
    float2 _4779 = float2(_1581, _1559);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4779, float2(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4779, float2(0.0), isnan(_4779)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = -_705;
    float _1608 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _1610 = _397 * (-0.15915493667125701904296875);
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1614 = _179 > 0.5;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -_391;
    float _1624 = _1622 + 1.0;
    float _1626 = -_423;
    int _1628 = _1614 ? as_type<int>(_1626) : as_type<int>(_423);
    float _1630 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1616);
    float _1632 = _1610 * 6.283185482025146484375;
    float _1634 = sin(_1632);
    bool _1636 = !_1620;
    float _1638 = _1636 ? _423 : as_type<float>(_1628);
    float _1640 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1630);
    float _1642 = -_395;
    float _1644 = _1642 + 1.0;
    bool _1646 = _175 > 0.5;
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1650 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1652 = _1610 * 6.283185482025146484375;
    float _1654 = cos(_1652);
    float _1656 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1658 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1660 = _1638 + (-0.5);
    float _1662 = -_393;
    float _1664 = _1662 + 1.0;
    float _1666 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1668 = -_1656;
    float _1670 = -_253;
    float _1672 = fma(_1668, _1660, _1670);
    float _1674 = 1.0 / _1648;
    float _1676 = _467 * _1634;
    float _1678 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1684 = _1682 != 0;
    float _1686 = _1678 + _1648;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = _467 * _1654;
    float _1694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = -_1676;
    float _1702 = fma(_475, _1654, _1700);
    float _1704 = fma(_475, _1634, _1692);
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1708 = _1686 * _1674;
    float _1710 = _1708 * 0.5;
    float _1712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1714 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1718 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1716);
    float _1720 = -_299;
    float _1722 = _1720 + 1.0;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1734 = -_417;
    int _1736 = _1646 ? as_type<int>(_1734) : as_type<int>(_417);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1740 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = 1.0 / _1718;
    bool _1746 = !_1684;
    float _1748 = _1746 ? _417 : as_type<float>(_1736);
    float _1750 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1740;
    out.m_60.y = _1742;
    out.m_60.z = _1698;
    out.m_60.w = _1738;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1756 = _1748 + 0.5;
    float _1758 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_62.x = _1750;
    out.m_62.y = _1714;
    out.m_62.z = _1752;
    out.m_62.w = _1706;
    float _1762 = fma(_1754, _1756, _251);
    float _1764 = -_417;
    int _1766 = _425 ? as_type<int>(_1764) : as_type<int>(_417);
    float _1768 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1770 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1772 = isnan(0.5);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1778 = _1774 || _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1744 * _1780;
    float _1784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1786 = _1702 + 0.5;
    float _1788 = _1704 + (-0.5);
    float _1790 = -_423;
    float _1792 = _1790 + 0.5;
    float _1794 = _417 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1796 = fma(_1758, _1786, _303);
    float _1798 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1800 = _823 + (-0.5);
    float _1802 = abs(_1782);
    float _1804 = log2(_1802);
    float _1806 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1808 = -_1624;
    float _1810 = fma(_1702, _1808, _1796);
    float _1812 = -_1798;
    float _1814 = -_357;
    float _1816 = fma(_1812, _1800, _1814);
    bool _1818 = !_1690;
    float _1820 = _1818 ? _417 : as_type<float>(_1766);
    float _1822 = -_1806;
    float _1824 = -_399;
    float _1826 = fma(_1822, _1788, _1824);
    float _1828 = fma(_823, _1644, _1816);
    float _1830 = _423 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1832 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1834 = _1820 + 0.5;
    float _1836 = fma(_1704, _1664, _1826);
    float _1838 = -_1830;
    float _1840 = _1113 * _1838;
    float _1842 = _1129 * _1830;
    float _1844 = _1101 * _1830;
    float _1846 = fma(_1832, _1834, _311);
    float _1848 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_64.y = _1792;
    float _1850 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1852 = -_387;
    float _1854 = _1852 + 1.0;
    float _1856 = -_389;
    float _1858 = _1856 + 1.0;
    float _1860 = in.m_66.x;
    float _1862 = exp2(_1848);
    float _1864 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1850);
    float _1866 = fma(_1638, _1854, _1672);
    float _1868 = -_1858;
    float _1870 = fma(_1748, _1868, _1762);
    float _1872 = -_1722;
    float _1874 = fma(_1820, _1872, _1846);
    bool _1876 = _1782 <= 8000.0;
    bool _1878 = isnan(_1782);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(8000.0);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    out.m_68.x = _1810;
    out.m_68.y = _1836;
    float _1888 = fma(_1133, _1794, _1844);
    float _1890 = exp2(_1768);
    out.m_70.x = _1870;
    out.m_70.y = _1866;
    out.m_70.z = _1874;
    out.m_70.w = _1828;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = fma(_1894, -2.0, 3.0);
    float _1898 = _1894 * _1894;
    float _1900 = fma(_1127, _1794, _1840);
    float _1902 = fma(_1147, _1794, _1842);
    float _1904 = _1828;
    float _1906 = _1499;
    float _1908 = _1547;
    if (_1778)
    {
        _1904 = 1.0;
    }
    float _1910 = _1904;
    float _1912 = _1898 * _1896;
    float _1914 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1864);
    float _1916 = -_1912;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1914);
    float _1922 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1912);
    float _1924 = _1920 + _1499;
    float _1926 = _1886 * _1922;
    float _1928 = _1924 * 0.5;
    float _1930 = _1910;
    float _1932 = _1920;
    float _1934 = _1928;
    float _1936 = _1545;
    if (!_1778)
    {
        float _1938 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1940 = _1938 * 0.15915493667125701904296875;
        float _1942 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1946 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1944;
        float _1948 = _1940 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        float _1952 = _1942 * 0.15915493667125701904296875;
        float _1954 = _1940 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        float _1958 = 1.0 / _1950;
        float _1960 = _1952 * 6.283185482025146484375;
        float _1962 = cos(_1960);
        float _1964 = _1956 * _1958;
        float _1966 = _1952 * 6.283185482025146484375;
        float _1968 = sin(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = 1.0 / _1946;
        float _1974 = 1.0 / _1970;
        float _1976 = _1968 * _1974;
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = fma(_1782, _1976, _1978);
        float _1982 = _1980 * _1972;
        float _1984 = precise::clamp(_1982, 0.0, 1.0);
        _1930 = _1984;
    }
    float _1986 = _1930;
    float _1988 = -_1890;
    float _1990 = _1988 + 1.0;
    float _1992 = _1119 + _1900;
    float _1994 = _1151 + _1902;
    float _1996 = _1139 + _1888;
    float _1998 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2000 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2002 = -_1569;
    float _2004 = _2002 + 1.0;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    float _2006 = _1998 * _1583;
    float _2008 = -_1998;
    float _2010 = _2008 + 1.0;
    out.m_74.x = _1992;
    out.m_74.y = _1994;
    out.m_74.z = _1996;
    float _2012 = _1594 * _2006;
    float _2014 = _1604 * _2006;
    float _2016 = _1594 * _2010;
    float _2018 = _2004 * _2000;
    float _2020 = precise::clamp(_2018, 0.0, 1.0);
    float _2022 = fma(_1600, _2012, _1588);
    float _2024 = fma(_1602, _2012, _1590);
    float _2026 = fma(_1594, _2014, _1592);
    bool _2028 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2030 = isnan(_1289);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2036 = _2032 || _2034;
    float _2038 = -_2020;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1545;
    out.gl_Position.y = _1547;
    out.gl_Position.z = _1920;
    out.gl_Position.w = _1499;
    float _2042 = _1986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2044 = _2040 * _1860;
    out.m_76.x = _2022;
    out.m_76.y = _2024;
    out.m_76.z = _2026;
    out.m_76.w = _2016;
    float _2046 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.z = _1928;
    out.m_78.w = _1499;
    out.m_80.x = _2046;
    float _2048 = _2046;
    if (!_2036)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2050 = _1906;
    float _2052 = _2050;
    float _2054 = _2050;
    if (!_2036)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2056 = _1932;
    float _2058 = _2056;
    float _2060 = _2056;
    if (!_2036)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2062 = _1934;
    float _2064 = _2062;
    float _2066 = _2062;
    if (!_2036)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2068 = _1908;
    float _2070 = _2068;
    float _2072 = _2068;
    if (!_2036)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2074 = _1936;
    float _2076 = _2074;
    float _2078 = _2074;
    if (!_2036)
    {
        _2048 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2080 = _2048;
    bool _2082 = !_2036;
    float _2084 = _2080;
    float _2086 = _2080;
    if (!_2082)
    {
        bool _2088 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2090 = isnan(_1289);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2100 = _1289 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2104 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2102;
            float _2106 = 1.0 / _2104;
            float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2110 = _2108 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2114 = _2112 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2128 = _2100 * _2106;
            float _2130 = precise::clamp(_2128, 0.0, 1.0);
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2136 = fma(_2130, _2110, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2138 = fma(_2130, _2134, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2140 = fma(_2130, _2114, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2142 = fma(_2130, _2118, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2144 = fma(_2130, _2122, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2146 = fma(_2130, _2126, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2054 = _2138;
            _2078 = _2144;
            _2066 = _2136;
            _2072 = _2142;
            _2060 = _2140;
            _2086 = _2146;
            _2148 = true;
        }
        else
        {
            bool _2150 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2152 = isnan(_1289);
            bool _2154 = _2150 || _2152;
            bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2158 = _2154 || _2156;
            if (!_2158)
            {
                _2064 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2160 = _2064;
            _2066 = _2160;
            if (!_2158)
            {
                _2052 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2162 = _2052;
            _2054 = _2162;
            if (!_2158)
            {
                _2058 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2164 = _2058;
            _2060 = _2164;
            if (!_2158)
            {
                _2070 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2166 = _2070;
            _2072 = _2166;
            if (!_2158)
            {
                _2076 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2168 = _2076;
            _2078 = _2168;
            if (!_2158)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2170 = _2084;
            bool _2172 = !_2158;
            _2086 = _2170;
            if (!_2172)
            {
                bool _2174 = _1289 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2176 = isnan(_1289);
                bool _2178 = _2174 || _2176;
                bool _2180 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2182 = _2178 || _2180;
                if (!_2182)
                {
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2186 = _1289 + _2184;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2188;
                    float _2192 = 1.0 / _2190;
                    float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2196 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2204 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2212 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2214 = _2186 * _2192;
                    float _2216 = precise::clamp(_2214, 0.0, 1.0);
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2222 = fma(_2216, _2196, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2224 = fma(_2216, _2220, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2226 = fma(_2216, _2200, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2228 = fma(_2216, _2204, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2230 = fma(_2216, _2208, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2232 = fma(_2216, _2212, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2054 = _2224;
                    _2078 = _2230;
                    _2066 = _2222;
                    _2072 = _2228;
                    _2060 = _2226;
                    _2086 = _2232;
                    _2148 = true;
                }
                else
                {
                    _2054 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2078 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2066 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2072 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2060 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2148 = false;
    float _2234 = _2054;
    float _2236 = _2078;
    float _2238 = _2066;
    float _2240 = _2072;
    float _2242 = _2060;
    float _2244 = _2086;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2248 = fma(_1994, -0.5, 0.5);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -_2234;
    float _2254 = _2252 + _2236;
    float _2256 = -_2238;
    float _2258 = _2256 + _2240;
    out.m_49.x = _2246;
    float _2260 = fma(_2250, _2254, _2234);
    float _2262 = -_2242;
    float _2264 = _2262 + _2244;
    float _2266 = fma(_2250, _2258, _2238);
    float _2268 = _2260 * 0.586610972881317138671875;
    bool _2270 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2272 = fma(_2250, _2264, _2242);
    out.m_82.x = 0.0;
    float _2274 = fma(_2266, 0.298911988735198974609375, _2268);
    bool _2276 = _1986 > 0.0;
    bool _2278 = isnan(_1986);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = fma(_2272, 0.114477999508380889892578125, _2274);
    float _2288 = -_2286;
    float _2290 = _2266 + _2288;
    float _2292 = -_2286;
    float _2294 = _2260 + _2292;
    float _2296 = -_2286;
    float _2298 = _2272 + _2296;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2302 = fma(_2294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    float _2304 = fma(_2298, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2286);
    bool _2306 = !_2270;
    if (!_2306)
    {
        float _2308 = -_1251;
        float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2312 = -_1255;
        float _2314 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2316 = -_1259;
        float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2320 = _2310 * _2310;
        float _2322 = fma(_2314, _2314, _2320);
        float _2324 = fma(_2318, _2318, _2322);
        float _2326 = sqrt(_2324);
        float _2328 = rsqrt(_2324);
        float _2330 = -_2326;
        float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2334 = _2332 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2336 = precise::clamp(_2334, 0.0, 1.0);
        float _2338 = _2314 * _2328;
        float _2340 = _2310 * _2328;
        float _2342 = abs(_2336);
        float _2344 = log2(_2342);
        float _2346 = _2318 * _2328;
        float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2350 = _1994 * _2340;
        float _2352 = -_2340;
        float _2354 = -_2348;
        float _2356 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2354);
        float _2358 = fma(_1992, _2338, _2350);
        float _2360 = -_2346;
        float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2356);
        float _2364 = fma(_1996, _2346, _2358);
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2370 = _2362 + _2368;
        float _2372 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2376 = precise::clamp(_2374, 0.0, 1.0);
        float _2378 = exp2(_2372);
        float _2380 = _2378 * _2376;
        float _2382 = _2366 * _2380;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2388 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2384;
        out.m_82.y = _2386;
        out.m_82.z = _2388;
    }
    out.m_84.x = _2300;
    out.m_84.y = _2302;
    out.m_84.z = _2304;
    if (_2284)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

