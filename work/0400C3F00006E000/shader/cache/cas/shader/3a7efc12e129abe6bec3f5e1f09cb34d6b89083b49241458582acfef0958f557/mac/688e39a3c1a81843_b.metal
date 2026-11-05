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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2797 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_135);
        out.gl_Position.z = _3093;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_167);
        out.gl_Position.z = _3156;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _117 * _171;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_173;
    float _195 = _175;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _195 = _209;
    }
    float _211 = _195;
    float _213 = _147 * 2.0;
    float _215 = _147 + _151;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = floor(_213);
    float _223 = _151 * 2.0;
    float _225 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = _215 + (-1.0);
    float _233 = _147 + _159;
    float _235 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = -_227;
    float _239 = fma(_225, 2.0, _237);
    float _241 = floor(_223);
    float _243 = _159 * 2.0;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = fma(_235, -2.0, _229);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _233 + (-1.0);
    float _257 = floor(_243);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _267 = 1.0 / _247;
    float _269 = _151 + _159;
    bool _271 = _241 > 0.0;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _211 + _273;
    bool _277 = _241 >= 0.0;
    bool _279 = isnan(_241);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = _269 + (-1.0);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    bool _293 = _221 >= 0.0;
    bool _295 = isnan(_221);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = 1.0 / _263;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _211 + _305;
    float _309 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _311 = _257 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _257 >= 0.0;
    bool _319 = isnan(_257);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _331 = _285 ? 0 : 1;
    float _333 = 1.0 / _253;
    float _335 = _307 * _267;
    int _337 = as_type<int>(_263);
    if (_219)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _345 = _339;
    if (!_219)
    {
        _345 = 1;
    }
    int _347 = _345;
    float _349 = fma(_315, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_291, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _353 = _221 > 0.0;
    float _355 = _275 * _303;
    float _357 = _301 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _211 + _359;
    bool _363 = _347 != 1;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    int _369 = ~_331;
    int _371 = _369 + 1;
    int _373 = _371 + 1;
    float _375 = _171 * _117;
    int _377 = _325 ? 0 : 1;
    float _379 = _361 * _333;
    int _381 = _373;
    float _383 = _357;
    float _385 = _379;
    if (!_271)
    {
        int _387 = ~_331;
        int _389 = _387 + 1;
        _381 = _389;
    }
    int _391 = _381;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = fma(_329, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _405 = _401;
    if (!_311)
    {
        int _407 = ~_377;
        int _409 = _407 + 1;
        _405 = _409;
    }
    int _411 = _405;
    float _413 = fma(_343, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _425 = _423 != 0;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    int _431 = ~as_type<int>(_357);
    int _433 = _431 + 1;
    int _435 = _433 + 1;
    float _437 = _367 * _117;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _441 = _435;
    if (!_353)
    {
        int _443 = ~as_type<int>(_357);
        int _445 = _443 + 1;
        _441 = _445;
    }
    int _447 = _441;
    if (!_363)
    {
        _383 = _159;
    }
    float _449 = _383;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _453 = !_421;
    int _455 = _453 ? 0 : 1;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    bool _461 = !_425;
    int _463 = _461 ? 0 : 1;
    float _465 = _449;
    if (!_363)
    {
        _385 = _151;
    }
    float _467 = _385;
    float _469 = _467;
    if (_363)
    {
        _465 = _151;
    }
    float _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _471;
    if (_363)
    {
        _469 = _147;
    }
    float _487 = _469;
    float _489 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _439);
    float _491 = float(_395);
    bool _493 = !_475;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[83].z, _451);
    float _499 = _487;
    if (!_363)
    {
        _485 = _159;
    }
    float _501 = _485;
    float _503 = 1.0 / _491;
    float _505 = _501;
    if (!_363)
    {
        _499 = _151;
    }
    float _507 = _499;
    float _509 = _507;
    if (_363)
    {
        _505 = _151;
    }
    float _511 = _505;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_363)
    {
        _509 = _147;
    }
    float _515 = _509;
    int _517 = abs(_495);
    float _519 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _521 = float(_411);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _525 = float(_517);
    float _527 = -_117;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _239);
    float _531 = -_513;
    float _533 = fma(_523, 2.0, _531);
    bool _535 = !_479;
    int _537 = _535 ? 0 : 1;
    float _539 = _525 * _521;
    float _541 = exp2(_437);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _545 = float(_429);
    float _547 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _497);
    int _549 = abs(_537);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _553 = 1.0 + _551;
    float _555 = 1.0 / _545;
    float _557 = float(_447);
    float _559 = fma(_519, -2.0, _543);
    float _561 = float(_549);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = in.m_60.x;
    float _567 = in.m_60.y;
    float _569 = in.m_60.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = 1.0 / _553;
    float _583 = _561 * _557;
    float _585 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    float _587 = -_541;
    float _589 = _587 + 1.0;
    bool _591 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _599 = _595 || _597;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _603 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_211);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _249);
    bool _617 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _619 = isnan(_211);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _601);
    float _631 = _599 ? _589 : 0.0;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _489);
    float _639 = _503 * _117;
    float _641 = _555 * _117;
    float _643 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _645 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _585);
    float _647 = -_117;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _533);
    float _651 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _559);
    if (_579)
    {
        float _653 = _631 * _581;
        _127 = _653;
    }
    float _655 = _127;
    bool _657 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_211);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _627 * _635;
    bool _671 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_211);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    bool _687 = !_483;
    int _689 = _687 ? 0 : 1;
    float _691 = _539 * (-2.0);
    float _693 = _147 + (-0.5);
    float _695 = _681 * _685;
    float _697 = -_681;
    float _699 = _697 + 1.0;
    int _701 = abs(_689);
    float _703 = fma(_691, _565, _565);
    float _705 = _583 * (-2.0);
    float _707 = _667 * _699;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    float _711 = fma(_265, _691, _265);
    float _713 = _349 * _707;
    float _715 = float(_391);
    float _717 = fma(_309, _705, _309);
    float _719 = float(_701);
    float _721 = _351 * _707;
    float _723 = fma(_705, _567, _567);
    float _725 = _151 + (-0.5);
    float _727 = -_667;
    float _729 = _727 + 1.0;
    float _731 = _719 * _715;
    float _733 = fma(_711, _655, _709);
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].y, _723);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].y, _721);
    float _739 = _731 * (-2.0);
    float _741 = in.m_62.x;
    float _743 = in.m_62.y;
    float _745 = fma(_717, _655, _735);
    float _747 = _733 * 0.15915493667125701904296875;
    float _749 = fma(_739, _569, _569);
    float _751 = _159 + (-0.5);
    float _753 = _745 * 0.15915493667125701904296875;
    float _755 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _761;
    float _765 = fma(_259, _739, _259);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _769 = fma(_759, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _771 = fma(_403, _695, _755);
    float _773 = in.m_44.x;
    float _775 = in.m_44.y;
    float _777 = in.m_44.z;
    float _779 = fma(_763, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = fma(_413, _695, _737);
    float _783 = fma(_765, _655, _767);
    float _785 = in.m_64.x;
    float _787 = in.m_64.y;
    float _789 = in.m_64.z;
    float _791 = in.m_64.w;
    float _793 = fma(_769, _669, _771);
    float _795 = fma(_779, _669, _781);
    float _797 = _783 * 0.15915493667125701904296875;
    float _799 = _747 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].x, _793);
    float _805 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].y, _795);
    float _807 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _803 * _741;
    float _811 = _805 * _743;
    float _813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _815 = _747 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _823 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _825 = _819 * _813;
    float _827 = in.m_66.x;
    float _829 = in.m_66.y;
    float _831 = in.m_66.z;
    float _833 = in.m_66.w;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _823 * _821;
    float _841 = _775 * _787;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = cos(_843);
    float _847 = fma(_773, _785, _841);
    float _849 = fma(_777, _789, _847);
    float _851 = _797 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _801 * _837;
    float _857 = _849 + _791;
    float _859 = _775 * _829;
    float _861 = _797 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _817 * _845;
    float _867 = _801 * _845;
    float _869 = fma(_773, _827, _859);
    float _871 = _817 * _853;
    float _873 = _817 * _837;
    float _875 = _801 * _853;
    float _877 = _845 * _853;
    float _879 = _871 * _839;
    float _881 = _837 * _853;
    float _883 = fma(_863, _865, _855);
    float _885 = -_839;
    float _887 = _863 * _885;
    float _889 = -_867;
    float _891 = fma(_863, _873, _889);
    float _893 = -_873;
    float _895 = fma(_863, _867, _893);
    float _897 = fma(_883, _825, _879);
    float _899 = _875 * _839;
    float _901 = fma(_877, _825, _887);
    float _903 = fma(_863, _855, _865);
    float _905 = fma(_891, _807, _897);
    float _907 = fma(_895, _825, _899);
    float _909 = fma(_881, _807, _901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _913 = fma(_903, _807, _907);
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _919 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _911);
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _923 = fma(_777, _831, _869);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _919);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = _923 + _833;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = in.m_68.x;
    float _937 = in.m_68.y;
    float _939 = in.m_68.z;
    float _941 = in.m_68.w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _927);
    float _947 = _857 + _933;
    float _949 = _931 + _943;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _947 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _949 + _955;
    float _959 = _953 * _953;
    float _961 = fma(_957, _957, _959);
    float _963 = sqrt(_961);
    float _965 = _775 * _937;
    float _967 = fma(_773, _935, _965);
    float _969 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = fma(_777, _939, _967);
    bool _973 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _971 + _941;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _987 = _985 != 0;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _991 = _989 != 0;
    float _993 = _975 + _969;
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    bool _1005 = !_983;
    int _1007 = _1005 ? 0 : 1;
    bool _1009 = !_979;
    int _1011 = _1009 ? 0 : 1;
    bool _1013 = !_987;
    int _1015 = _1013 ? 0 : 1;
    bool _1017 = !_991;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = _969;
    float _1023 = _777;
    float _1025 = _775;
    float _1027 = _961;
    float _1029 = _947;
    if (!_973)
    {
        _1021 = _949;
    }
    float _1031 = _1021;
    float _1033 = _1031;
    if (!_973)
    {
        _1023 = _947;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_973)
    {
        _1025 = _993;
    }
    float _1039 = _1025;
    bool _1041 = !_973;
    float _1043 = _1039;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _963 + _1047;
        float _1051 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = rsqrt(_961);
        float _1055 = _1049 * _1045;
        float _1057 = _1055 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_993, _1061, _1069);
        float _1075 = _1053 * _1071;
        float _1077 = fma(_957, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_953, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1033 = _1077;
        _1043 = _1073;
        _1037 = _1079;
        _1027 = _1053;
    }
    float _1081 = _1033;
    float _1083 = _1043;
    float _1085 = _1037;
    float _1087 = _1027;
    float _1089 = _1083;
    float _1091 = _1081;
    float _1093 = _1085;
    float _1095 = _1087;
    if (!_1003)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _975 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _931 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = -_931;
        float _1109 = _1107 + _1081;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _857 + _1113;
        float _1117 = fma(_1103, _1103, _1111);
        float _1119 = fma(_1115, _1115, _1117);
        float _1121 = sqrt(_1119);
        float _1123 = precise::min(_1121, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1125 = _1123 * _1105;
        float _1127 = -_975;
        float _1129 = _1127 + _1083;
        float _1131 = -_857;
        float _1133 = _1131 + _1085;
        float _1135 = fma(_1109, _1125, _931);
        float _1137 = fma(_1129, _1125, _975);
        float _1139 = fma(_1133, _1125, _857);
        _1089 = _1137;
        _1091 = _1135;
        _1093 = _1139;
    }
    float _1141 = _1089;
    float _1143 = _1091;
    float _1145 = _1093;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1141 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _1143 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1157 = _1145 + _1155;
    float _1159 = _1149 * _1149;
    float _1161 = fma(_1153, _1153, _1159);
    float _1163 = fma(_1157, _1157, _1161);
    float _1165 = rsqrt(_1163);
    float _1167 = sqrt(_1163);
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1153 * _1169;
    float _1173 = _1157 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _945;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1149;
    float _1197 = _1171;
    float _1199 = _1173;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1183)
    {
        float _1211 = _1187 * _1205;
        _1193 = _1211;
    }
    float _1213 = _1193;
    if (_1183)
    {
        float _1215 = _1213 * 0.15915493667125701904296875;
        _1095 = _1215;
    }
    float _1217 = _1095;
    float _1219 = _913;
    if (_1183)
    {
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1229 = precise::max(0.0, _1227);
    float _1231 = _1205;
    float _1233 = _1229;
    if (_1183)
    {
        float _1235 = _1217 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1231 = _1237;
    }
    float _1239 = _1231;
    float _1241 = -_1169;
    float _1243 = -_1229;
    float _1245 = fma(_1149, _1241, _1243);
    if (_1183)
    {
        float _1247 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1247;
    }
    float _1249 = _1195;
    float _1251 = _1225;
    float _1253 = _1249;
    if (_1183)
    {
        float _1255 = fma(_1225, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1251 = _1255;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (!_1183)
    {
        _1253 = _1245;
    }
    float _1261 = _1253;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1265 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1263);
    float _1267 = precise::clamp(_1265, 0.0, 1.0);
    float _1269 = _1261;
    if (_1183)
    {
        float _1271 = _1239 + (-1.0);
        _1233 = _1271;
    }
    float _1273 = _1233;
    float _1275 = _1273;
    if (_1183)
    {
        float _1277 = _1209 * _1257;
        _1029 = _1277;
    }
    float _1279 = _1029;
    float _1281 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = -_1267;
    float _1285 = _1283 + 1.0;
    if (_1183)
    {
        float _1287 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1287;
    }
    float _1289 = _1259;
    if (_1183)
    {
        float _1291 = _1171 * _1279;
        _1197 = _1291;
    }
    float _1293 = _1197;
    if (!_1183)
    {
        _1275 = _1175;
    }
    float _1295 = _1275;
    float _1297 = _1295;
    if (_1183)
    {
        float _1299 = _1173 * _1279;
        _1199 = _1299;
    }
    float _1301 = _1199;
    if (_1183)
    {
        float _1303 = fma(_1245, _1239, _1289);
        _1269 = _1303;
    }
    float _1305 = _1269;
    if (_1183)
    {
        float _1307 = _1293 * _1293;
        _1297 = _1307;
    }
    float _1309 = _1297;
    float _1311 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1183)
    {
        float _1313 = _1301 * _1301;
        _1201 = _1313;
    }
    float _1315 = _1201;
    float _1317 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1319 = fma(_1305, _1305, _1309);
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1311);
    float _1323 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1325 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1327 = _1319 + _1315;
    float _1329 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = abs(_1285);
    float _1337 = log2(_1335);
    float _1339 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = rsqrt(_1327);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1359 = -_1351;
    float _1361 = fma(_1359, _1323, 1.0);
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1349);
    float _1365 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1369 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1373 = log2(_1361);
    float _1375 = _1353 * _1293;
    float _1377 = _1353 * _1305;
    float _1379 = _1353 * _1301;
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1367);
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1385 = exp2(_1371);
    float _1387 = _1377 + 1.0;
    float _1389 = -_1383;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1389);
    float _1393 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1395 = -_1379;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1391);
    float _1399 = 1.0 / _1381;
    float _1401 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1403 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1393);
    float _1405 = fma(_1397, -0.5, 0.5);
    float _1407 = fma(_1397, 0.5, 0.5);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1401);
    float _1411 = fma(_1407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1413 = sqrt(_1405);
    float _1415 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1417 = -_1377;
    float _1419 = fma(_1385, _1387, _1417);
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1423 = fma(_1407, _1411, -0.212114393711090087890625);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1427 = _1373 * 0.693147182464599609375;
    float _1429 = _1421 * _1399;
    float _1431 = fma(_1407, _1423, 1.570728778839111328125);
    float _1433 = _1425 * _1399;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1437 = fma(_1429, -0.5, 0.5);
    float _1439 = fma(_1419, 0.5, 0.5);
    float _1441 = fma(_1433, 0.5, 0.5);
    float _1443 = _1413 * 0.636619746685028076171875;
    float _1445 = -_1431;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _5161 = float3(_1441, _1437, _1435);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1441, _1437, _1435);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _5189 = float2(_1447, _1439);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5189, float2(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5189, float2(0.0), isnan(_5189)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1478 = _1476 != 0;
    float _1480 = -_645;
    float _1482 = _1480 + 1.0;
    bool _1484 = _159 > 0.5;
    float _1486 = -_547;
    float _1488 = _1486 + 1.0;
    bool _1490 = _147 > 0.5;
    out.m_70.x = _931;
    out.m_70.y = _975;
    out.m_70.z = _857;
    bool _1492 = _151 > 0.5;
    float _1494 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1500 = _1498 != 0;
    float _1502 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1504 = abs(_455);
    out.m_72.x = _1143;
    out.m_72.y = _1141;
    out.m_72.z = _1145;
    int _1506 = abs(_459);
    float _1508 = 0.0;
    if (_1478)
    {
        _1508 = 1.0;
    }
    float _1510 = _1508;
    float _1512 = trunc(_639);
    int _1514 = int(_1512);
    float _1516 = float(uint(_1474));
    float _1518 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = _1510;
    if (!_1478)
    {
        _1520 = 1.2345600128173828125;
    }
    float _1522 = _1520;
    float _1524 = 0.0;
    if (_1478)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1478)
    {
        _1528 = 7.345489978790283203125;
    }
    float _1530 = _1528;
    float _1532 = 1.0 / _1516;
    float _1534 = float(uint(_1496));
    int _1536 = ~_1496;
    int _1538 = _1536 + 1;
    float _1540 = _1530 * _147;
    int _1542 = ~_1474;
    int _1544 = _1542 + 1;
    int _1546 = abs(_1015);
    float _1548 = 1.0 / _1534;
    float _1550 = float(uint(_1514));
    int _1552 = ~_1496;
    int _1554 = _1552 + 1;
    float _1556 = trunc(_641);
    int _1558 = int(_1556);
    int _1560 = as_type<int>(_1532) + (-2);
    float _1562 = as_type<float>(_1560) * _1550;
    int _1564 = ~_1474;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1502);
    int _1570 = as_type<int>(_1548) + (-2);
    float _1572 = float(uint(_1558));
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    float _1581 = as_type<float>(_1570) * _1572;
    float _1583 = _1572;
    if (_1478)
    {
        _1583 = _147;
    }
    float _1585 = _1583;
    float _1587 = _1585;
    if (!_1478)
    {
        _1587 = _151;
    }
    float _1589 = _1587;
    float _1591 = floor(_1540);
    float _1593 = float(_1514);
    float _1595 = -_1568;
    float _1597 = _1595 + 1.0;
    float _1599 = _1522 * _1589;
    float _1601 = trunc(_1581);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    int _1607 = _1566 * int(_1579);
    int _1609 = _1607 + _1514;
    float _1611 = float(uint(_1609));
    float _1613 = floor(_1599);
    float _1615 = -_1591;
    float _1617 = _1540 + _1615;
    float _1619 = as_type<float>(_1560) * _1611;
    float _1621 = float(_1474);
    int _1623 = _1538 * int(_1605);
    int _1625 = _1623 + _1558;
    float _1627 = trunc(_1619);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = _1593 >= _1621;
    bool _1635 = isnan(_1593);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1621);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1617 * _1621;
    int _1647 = ~_1496;
    int _1649 = _1647 + 1;
    float _1651 = _1621 * _375;
    float _1653 = float(uint(_1625));
    float _1655 = -_1613;
    float _1657 = _1599 + _1655;
    float _1659 = trunc(_1645);
    int _1661 = int(_1659);
    float _1663 = as_type<float>(_1570) * _1653;
    float _1665 = trunc(_1663);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    int _1671 = int(_1579) + int(_1631);
    int _1673 = _1544 * _1671;
    int _1675 = _1673 + _1514;
    int _1677 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1679 = _1677 != 0;
    float _1681 = trunc(_1651);
    int _1683 = int(_1681);
    bool _1685 = uint(_1675) >= uint(_1474);
    float _1687 = float(_1558);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1691 = _1689 != 0;
    int _1693 = int(_1605) + int(_1669);
    float _1695 = float(_1496);
    float _1697 = trunc(_1643);
    int _1699 = int(_1697);
    bool _1701 = !_1691;
    int _1703 = _1701 ? 0 : 1;
    int _1705 = _1649 * _1693;
    int _1707 = _1705 + _1558;
    bool _1709 = _1687 >= _1695;
    bool _1711 = isnan(_1687);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(_1695);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = _1695 * _375;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1725 = _1723 != 0;
    int _1727 = abs(_1703);
    float _1729 = _1657 * _1695;
    bool _1731 = !_1685;
    int _1733 = _1731 ? 0 : (-1);
    float _1735 = trunc(_1719);
    int _1737 = int(_1735);
    bool _1739 = uint(_1707) >= uint(_1496);
    int _1741 = ~_1671;
    int _1743 = _1741 + _1733;
    int _1745 = _1743 + 1;
    bool _1747 = !_1739;
    int _1749 = _1747 ? 0 : (-1);
    bool _1751 = !_1725;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = trunc(_1721);
    int _1757 = int(_1755);
    int _1759 = ~_1693;
    int _1761 = _1759 + _1749;
    int _1763 = _1761 + 1;
    int _1765 = _1661 * _1727;
    int _1767 = _1765 + _1514;
    bool _1769 = _1474 == 0;
    int _1771 = _1474 * _1745;
    int _1773 = _1771 + _1514;
    int _1775 = abs(_1753);
    int _1777 = _1496 * _1763;
    int _1779 = _1777 + _1558;
    bool _1781 = _1496 == 0;
    float _1783 = trunc(_1729);
    int _1785 = int(_1783);
    bool _1787 = !_1769;
    int _1789 = _1787 ? _1773 : (-1);
    int _1791 = ~_1737;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    bool _1797 = !_1781;
    int _1799 = _1797 ? _1779 : (-1);
    int _1801 = ~_1699;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1496 + (-1);
    int _1809 = _1799 * _1795;
    int _1811 = ~_1496;
    int _1813 = _1811 + 1;
    int _1815 = _1789 * _1805;
    int _1817 = _1474 + (-1);
    int _1819 = _1737 * _1807;
    int _1821 = _1819 + _1809;
    float _1823 = in.m_53.w;
    int _1825 = _1785 * _1775;
    int _1827 = _1825 + _1558;
    int _1829 = _1699 * _1817;
    int _1831 = _1829 + _1815;
    int _1833 = abs(_1007);
    int _1835 = abs(_1011);
    int _1837 = _1831 * _1504;
    int _1839 = abs(_463);
    int _1841 = _1821 * _1833;
    int _1843 = _1683 * _1506;
    int _1845 = _1843 + _1837;
    bool _1847 = !_1500;
    int _1849 = _1847 ? 0 : 1;
    int _1851 = _1757 * _1835;
    int _1853 = _1851 + _1841;
    float _1855 = float(uint(_1767));
    int _1857 = _1767 * _1839;
    int _1859 = _1857 + _1845;
    int _1861 = abs(_1849);
    int _1863 = _1827 * _1546;
    int _1865 = _1863 + _1853;
    float _1867 = float(uint(_1827));
    float _1869 = as_type<float>(_1560) * _1855;
    int _1871 = abs(_1019);
    int _1873 = _1661 * _1861;
    int _1875 = _1873 + _1859;
    float _1877 = -_187;
    int _1879 = _1490 ? as_type<int>(_1877) : as_type<int>(_187);
    float _1881 = as_type<float>(_1570) * _1867;
    bool _1883 = _1823 > 0.5;
    int _1885 = _1785 * _1871;
    int _1887 = _1885 + _1865;
    float _1889 = float(uint(_1875));
    float _1891 = trunc(_1869);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    bool _1897 = !_1679;
    float _1899 = _1897 ? _187 : as_type<float>(_1879);
    float _1901 = float(uint(_1887));
    float _1903 = as_type<float>(_1560) * _1889;
    int _1905 = ~_1474;
    int _1907 = _1905 + 1;
    float _1909 = _1899 + 0.5;
    float _1911 = -_187;
    int _1913 = _1484 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = trunc(_1881);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1570) * _1901;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1925 = ~_1474;
    int _1927 = _1925 + 1;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1931 = _1929 != 0;
    float _1933 = -_191;
    int _1935 = _1492 ? as_type<int>(_1933) : as_type<int>(_191);
    float _1937 = trunc(_1903);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1927 * int(_1895);
    int _1945 = _1943 + _1767;
    int _1947 = ~_1496;
    int _1949 = _1947 + 1;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1953 = _1951 != 0;
    float _1955 = float(uint(_1945));
    float _1957 = trunc(_1921);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1813 * int(_1919);
    int _1965 = _1963 + _1827;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1969 = _1967 != 0;
    float _1971 = as_type<float>(_1560) * _1955;
    float _1973 = -_191;
    int _1975 = _1883 ? as_type<int>(_1973) : as_type<int>(_191);
    float _1977 = float(uint(_1965));
    int _1979 = _1907 * int(_1941);
    int _1981 = _1979 + _1875;
    bool _1983 = !_1931;
    float _1985 = _1983 ? _187 : as_type<float>(_1913);
    float _1987 = as_type<float>(_1570) * _1977;
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1981));
    float _1997 = _1985 + 0.5;
    bool _1999 = !_1953;
    float _2001 = _1999 ? _191 : as_type<float>(_1935);
    int _2003 = _1949 * int(_1961);
    int _2005 = _2003 + _1887;
    bool _2007 = !_1969;
    float _2009 = _2007 ? _191 : as_type<float>(_1975);
    float _2011 = as_type<float>(_1560) * _1995;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c9)._m0[85].x, _649);
    float _2015 = trunc(_1987);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    float _2021 = float(uint(_2005));
    float _2023 = _2001 + (-0.5);
    float _2025 = _2009 + (-0.5);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2029 = _2027 != 0;
    float _2031 = as_type<float>(_1570) * _2021;
    float _2033 = -_643;
    float _2035 = _2033 + 1.0;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = -_2023;
    float _2045 = -_615;
    float _2047 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2045);
    float _2049 = -_2025;
    float _2051 = -_651;
    float _2053 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2051);
    float _2055 = -_637;
    float _2057 = _2055 + 1.0;
    float _2059 = -_2035;
    float _2061 = fma(_1899, _2059, _1923);
    float _2063 = fma(_2001, _1482, _2047);
    float _2065 = -_1488;
    float _2067 = fma(_1985, _2065, _2013);
    float _2069 = fma(_2009, _2057, _2053);
    float _2071 = trunc(_2031);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2079 = _2077 != 0;
    float _2081 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2083 = int(_1895) + int(_1993);
    float _2085 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2087 = int(_1919) + int(_2019);
    out.m_74.x = _2061;
    out.m_74.y = _2063;
    out.m_74.z = _2067;
    out.m_74.w = _2069;
    int _2089 = ~_1496;
    int _2091 = _2089 + 1;
    float _2093 = -_863;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2085);
    int _2097 = int(_1941) + int(_2041);
    float _2099 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2101 = ~_1474;
    int _2103 = _2101 + 1;
    int _2105 = _1554 * _2087;
    int _2107 = _2105 + _1827;
    float _2109 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2111 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2095);
    int _2113 = ~_1474;
    int _2115 = _2113 + 1;
    int _2117 = int(_1961) + int(_2075);
    bool _2119 = uint(_2107) >= uint(_1496);
    float _2121 = -_863;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2125 = -_863;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2099);
    int _2129 = _2103 * _2097;
    int _2131 = _2129 + _1875;
    float _2133 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2135 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2137 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2139 = _2091 * _2117;
    int _2141 = _2139 + _1887;
    bool _2143 = uint(_2131) >= uint(_1474);
    float _2145 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2133);
    float _2147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2137);
    float _2149 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2151 = uint(_2141) >= uint(_1496);
    float _2153 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2155 = !_2143;
    int _2157 = _2155 ? 0 : (-1);
    int _2159 = _2115 * _2083;
    int _2161 = _2159 + _1767;
    bool _2163 = !_2151;
    int _2165 = _2163 ? 0 : (-1);
    float _2167 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2149);
    int _2169 = ~_2097;
    int _2171 = _2169 + _2157;
    int _2173 = _2171 + 1;
    float _2175 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    int _2177 = ~_2117;
    int _2179 = _2177 + _2165;
    int _2181 = _2179 + 1;
    float _2183 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2185 = uint(_2161) >= uint(_1474);
    int _2187 = _1474 * _2173;
    int _2189 = _2187 + _1875;
    float _2191 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2167);
    int _2193 = _1496 * _2181;
    int _2195 = _2193 + _1887;
    float _2197 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2199 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2201 = !_1769;
    int _2203 = _2201 ? _2189 : (-1);
    float _2205 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2207 = !_1781;
    int _2209 = _2207 ? _2195 : (-1);
    float _2211 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    int _2213 = _2203 >> 31;
    float _2215 = _1518 * _2135;
    int _2217 = _2209 >> 31;
    float _2219 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2147);
    int _2221 = _2213 & 3;
    float _2223 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2205);
    int _2225 = _2217 & 3;
    float _2227 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    int _2229 = _2203 + _2221;
    float _2231 = fma(_2109, _2219, _2215);
    int _2233 = _2209 + _2225;
    float _2235 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2145);
    int _2237 = _2229 >> 2;
    float _2239 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    int _2241 = _2203 & 3;
    bool _2243 = _2241 != 0;
    float _2245 = _1518 * _2111;
    int _2247 = _2237 << 4;
    int _2249 = _2247 + 368;
    int _2251 = _2233 >> 2;
    out.m_76.x = _2235;
    out.m_76.y = _2219;
    out.m_76.z = _2239;
    int _2253 = _2243 ? 0 : 1;
    uint _2255 = uint(int(uint(_2249) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = _2203 & 3;
    bool _2273 = _2271 != 0;
    float _2275 = fma(_2109, _2235, _2245);
    int _2277 = _2251 << 4;
    int _2279 = _2277 + 512;
    bool _2281 = !_2185;
    int _2283 = _2281 ? 0 : (-1);
    bool _2285 = uint(_2271) >= 2u;
    uint _2287 = uint(int(uint(_2279) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    bool _2303 = !_2119;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2309 = _2285 ? 0 : 1;
    bool _2311 = uint(_2271) > 1u;
    bool _2313 = _2271 != 3;
    int _2315 = _2249 + 8;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = ~_2083;
    int _2335 = _2333 + _2283;
    int _2337 = _2335 + 1;
    int _2339 = ~_2253;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2087;
    int _2347 = _2345 + _2305;
    int _2349 = _2347 + 1;
    float _2351 = _1518 * _2197;
    int _2353 = ~_2309;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = _1474 * _2337;
    int _2361 = _2359 + _1767;
    int _2363 = _2343;
    int _2365 = _2357;
    float _2367 = _2135;
    if (!_2311)
    {
        int _2369 = ~_2253;
        int _2371 = _2369 + 1;
        _2363 = _2371;
    }
    int _2373 = _2363;
    int _2375 = _1496 * _2349;
    int _2377 = _2375 + _1827;
    int _2379 = _2209 & 3;
    bool _2381 = _2379 != 0;
    if (_2313)
    {
        int _2383 = ~_2309;
        int _2385 = _2383 + 1;
        _2365 = _2385;
    }
    int _2387 = _2365;
    bool _2389 = !_2273;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2209 & 3;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2109, _2239, _2351);
    bool _2399 = uint(_2379) > 1u;
    float _2401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    int _2403 = _2395 ? 0 : 1;
    int _2405 = _2279 + 8;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
    int _2411 = int(_2407) & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = int(_2407) + 1;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    int _2419 = _2415 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[int(_2417)][_2419];
    bool _2423 = _2271 != 3;
    float _2425 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2401);
    int _2427 = ~_2403;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_2381;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = uint(_2379) >= 2u;
    bool _2439 = !_1769;
    int _2441 = _2439 ? _2361 : (-1);
    int _2443 = _2431;
    if (!_2399)
    {
        int _2445 = ~_2403;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    int _2451 = abs(_2373);
    bool _2453 = _2379 != 3;
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = abs(_2449);
    int _2463 = abs(_2391);
    int _2465 = _2459 * as_type<int>(_2269);
    int _2467 = abs(_2435);
    int _2469 = abs(_2387);
    int _2471 = ~_2461;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = ~_2463;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    int _2483 = _2475 * as_type<int>(_2301);
    int _2485 = _2437 ? 0 : 1;
    int _2487 = _2481 * as_type<int>(_2261);
    int _2489 = _2487 + _2465;
    int _2491 = ~_2467;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = ~_2469;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = fma(_1518, _1518, 1.0);
    int _2505 = ~_2485;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2495 * as_type<int>(_2293);
    int _2513 = _2511 + _2483;
    int _2515 = _2509;
    if (_2453)
    {
        int _2517 = ~_2485;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2501 * as_type<int>(_2323);
    int _2525 = _2523 + _2489;
    bool _2527 = _2379 != 3;
    float _2529 = rsqrt(_2503);
    bool _2531 = !_2029;
    int _2533 = _2531 ? 0 : 1;
    bool _2535 = !_2423;
    int _2537 = _2535 ? 0 : (-1);
    int _2539 = abs(_2521);
    bool _2541 = !_2527;
    int _2543 = _2541 ? 0 : (-1);
    int _2545 = abs(_2533);
    int _2547 = abs(_2537);
    bool _2549 = !_2079;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = abs(_2543);
    int _2555 = abs(_2551);
    int _2557 = ~_2539;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = ~_2547;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    int _2569 = _2561 * as_type<int>(_2413);
    int _2571 = _2569 + _2513;
    int _2573 = ~_2553;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = ~_2545;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2567 * as_type<int>(_2331);
    int _2587 = _2585 + _2525;
    int _2589 = ~_2555;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = _2577 * as_type<int>(_2421);
    int _2597 = _2595 + _2571;
    float _2599 = _1518 * _2529;
    int _2601 = _2587 * _2583;
    float _2603 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2605 = _2597 * _2593;
    float _2607 = -_2191;
    float _2609 = _2599 * _2607;
    int _2611 = _2441 * _2545;
    int _2613 = _2611 + _2601;
    float _2615 = -_2223;
    float _2617 = _2599 * _2615;
    float _2619 = -_2227;
    float _2621 = _2599 * _2619;
    float _2623 = _2603 * _1449;
    float _2625 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2425);
    float _2627 = fma(_2529, _2135, _2609);
    bool _2629 = !_1781;
    int _2631 = _2629 ? _2377 : (-1);
    float _2633 = fma(_2529, _2111, _2617);
    float _2635 = _1381 * 0.5;
    float _2637 = fma(_2529, _2197, _2621);
    float _2639 = _1460 * _2623;
    float _2641 = _2625 + _1381;
    float _2643 = _1425 + _1381;
    float _2645 = -_2603;
    float _2647 = _2645 + 1.0;
    float _2649 = _1470 * _2623;
    float _2651 = fma(_1421, -0.5, _2635);
    int _2653 = _2631 * _2555;
    int _2655 = _2653 + _2605;
    float _2657 = float(_2613);
    float _2659 = _2191 + _2231;
    float _2661 = fma(_1466, _2639, _1454);
    float _2663 = _2641 * 0.5;
    float _2665 = _2643 * 0.5;
    float _2667 = _2223 + _2275;
    float _2669 = _2227 + _2397;
    float _2671 = fma(_1468, _2639, _1456);
    float _2673 = _1460 * _2647;
    float _2675 = fma(_1460, _2649, _1458);
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1421;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1381;
    bool _2677 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2679 = isnan(_1167);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2655);
    out.m_78.x = _2665;
    out.m_78.y = _2651;
    out.m_78.z = _2663;
    out.m_78.w = _1381;
    out.m_80.x = _2661;
    out.m_80.y = _2671;
    out.m_80.z = _2675;
    out.m_80.w = _2673;
    out.m_82.x = _2667;
    out.m_82.y = _2659;
    out.m_82.z = _2669;
    float _2689 = _2637;
    float _2691 = _2627;
    float _2693 = _2633;
    float _2695 = _2687;
    float _2697 = _2657;
    if (!_2685)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2699 = _2367;
    out.m_84.x = _2633;
    out.m_84.y = _2627;
    out.m_84.z = _2637;
    out.m_86.x = _2657;
    out.m_86.y = _2687;
    float _2701 = _2699;
    float _2703 = _2699;
    if (!_2685)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    float _2709 = _2705;
    if (!_2685)
    {
        _2691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2711 = _2691;
    float _2713 = _2711;
    float _2715 = _2711;
    if (!_2685)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2717 = _2693;
    float _2719 = _2717;
    float _2721 = _2717;
    if (!_2685)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2723 = _2695;
    float _2725 = _2723;
    float _2727 = _2723;
    if (!_2685)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2697;
    bool _2731 = !_2685;
    float _2733 = _2729;
    float _2735 = _2729;
    if (!_2731)
    {
        bool _2737 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2739 = isnan(_1167);
        bool _2741 = _2737 || _2739;
        bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2745 = _2741 || _2743;
        if (!_2745)
        {
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2749 = _1167 + _2747;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2751;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2759 = 1.0 / _2753;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2777 = _2749 * _2759;
            float _2779 = precise::clamp(_2777, 0.0, 1.0);
            float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2709 = _2789;
            _2727 = _2793;
            _2703 = _2785;
            _2721 = _2791;
            _2715 = _2787;
            _2735 = _2795;
            _2797 = true;
        }
        else
        {
            bool _2799 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2801 = isnan(_1167);
            bool _2803 = _2799 || _2801;
            bool _2805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2807 = _2803 || _2805;
            if (!_2807)
            {
                _2701 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2809 = _2701;
            _2703 = _2809;
            if (!_2807)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2811 = _2707;
            _2709 = _2811;
            if (!_2807)
            {
                _2713 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2813 = _2713;
            _2715 = _2813;
            if (!_2807)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2815 = _2719;
            _2721 = _2815;
            if (!_2807)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2817 = _2725;
            _2727 = _2817;
            if (!_2807)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2819 = _2733;
            bool _2821 = !_2807;
            _2735 = _2819;
            if (!_2821)
            {
                bool _2823 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2825 = isnan(_1167);
                bool _2827 = _2823 || _2825;
                bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2831 = _2827 || _2829;
                if (!_2831)
                {
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2835 = _1167 + _2833;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2837;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2845 = 1.0 / _2839;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2863 = _2835 * _2845;
                    float _2865 = precise::clamp(_2863, 0.0, 1.0);
                    float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2871 = fma(_2865, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2873 = fma(_2865, _2869, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2875 = fma(_2865, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2877 = fma(_2865, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2879 = fma(_2865, _2857, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2881 = fma(_2865, _2861, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2709 = _2875;
                    _2727 = _2879;
                    _2703 = _2871;
                    _2721 = _2877;
                    _2715 = _2873;
                    _2735 = _2881;
                    _2797 = true;
                }
                else
                {
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2703 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2715 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2797 = false;
    float _2883 = _2709;
    float _2885 = _2727;
    float _2887 = _2703;
    float _2889 = _2721;
    float _2891 = _2715;
    float _2893 = _2735;
    float _2895 = fma(_2659, -0.5, 0.5);
    float _2897 = precise::clamp(_2895, 0.0, 1.0);
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = -_2887;
    float _2905 = _2903 + _2889;
    float _2907 = -_2891;
    float _2909 = _2907 + _2893;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2913 = fma(_2897, _2901, _2883);
    float _2915 = fma(_2897, _2905, _2887);
    float _2917 = fma(_2897, _2909, _2891);
    float _2919 = _2913 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2921 = fma(_2915, 0.298911988735198974609375, _2919);
    float _2923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2925 = fma(_2917, 0.114477999508380889892578125, _2921);
    out.m_88.w = _2923;
    float _2927 = -_2925;
    float _2929 = _2913 + _2927;
    float _2931 = -_2925;
    float _2933 = _2915 + _2931;
    float _2935 = -_2925;
    float _2937 = _2917 + _2935;
    out.m_90.x = 0.0;
    float _2939 = fma(_2929, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2941 = fma(_2933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    out.m_92.x = _2941;
    out.m_92.y = _2939;
    out.m_92.z = _2943;
    if (!_2911)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2945 = -_1141;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2949 = -_1143;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2953 = -_1145;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2957 = _2947 * _2947;
    float _2959 = fma(_2951, _2951, _2957);
    float _2961 = fma(_2955, _2955, _2959);
    float _2963 = sqrt(_2961);
    float _2965 = rsqrt(_2961);
    float _2967 = -_2963;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2951 * _2965;
    float _2977 = _2947 * _2965;
    float _2979 = abs(_2973);
    float _2981 = log2(_2979);
    float _2983 = _2955 * _2965;
    float _2985 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2987 = _2659 * _2977;
    float _2989 = -_2977;
    float _2991 = -_2985;
    float _2993 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2991);
    float _2995 = fma(_2667, _2975, _2987);
    float _2997 = -_2983;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2993);
    float _3001 = fma(_2669, _2983, _2995);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3007 = _2999 + _3005;
    float _3009 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = exp2(_3009);
    float _3017 = _3015 * _3013;
    float _3019 = _3003 * _3017;
    float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3023 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3025 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3021;
    out.m_90.y = _3023;
    out.m_90.z = _3025;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2797 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_135);
        out.gl_Position.z = _3093;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_167);
        out.gl_Position.z = _3156;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _117 * _171;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_173;
    float _195 = _175;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _195 = _209;
    }
    float _211 = _195;
    float _213 = _147 * 2.0;
    float _215 = _147 + _151;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = floor(_213);
    float _223 = _151 * 2.0;
    float _225 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = _215 + (-1.0);
    float _233 = _147 + _159;
    float _235 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = -_227;
    float _239 = fma(_225, 2.0, _237);
    float _241 = floor(_223);
    float _243 = _159 * 2.0;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = fma(_235, -2.0, _229);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _233 + (-1.0);
    float _257 = floor(_243);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _267 = 1.0 / _247;
    float _269 = _151 + _159;
    bool _271 = _241 > 0.0;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _211 + _273;
    bool _277 = _241 >= 0.0;
    bool _279 = isnan(_241);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = _269 + (-1.0);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    bool _293 = _221 >= 0.0;
    bool _295 = isnan(_221);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = 1.0 / _263;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _211 + _305;
    float _309 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _311 = _257 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _257 >= 0.0;
    bool _319 = isnan(_257);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _331 = _285 ? 0 : 1;
    float _333 = 1.0 / _253;
    float _335 = _307 * _267;
    int _337 = as_type<int>(_263);
    if (_219)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _345 = _339;
    if (!_219)
    {
        _345 = 1;
    }
    int _347 = _345;
    float _349 = fma(_315, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_291, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _353 = _221 > 0.0;
    float _355 = _275 * _303;
    float _357 = _301 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _211 + _359;
    bool _363 = _347 != 1;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    int _369 = ~_331;
    int _371 = _369 + 1;
    int _373 = _371 + 1;
    float _375 = _171 * _117;
    int _377 = _325 ? 0 : 1;
    float _379 = _361 * _333;
    int _381 = _373;
    float _383 = _357;
    float _385 = _379;
    if (!_271)
    {
        int _387 = ~_331;
        int _389 = _387 + 1;
        _381 = _389;
    }
    int _391 = _381;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = fma(_329, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _405 = _401;
    if (!_311)
    {
        int _407 = ~_377;
        int _409 = _407 + 1;
        _405 = _409;
    }
    int _411 = _405;
    float _413 = fma(_343, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _425 = _423 != 0;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    int _431 = ~as_type<int>(_357);
    int _433 = _431 + 1;
    int _435 = _433 + 1;
    float _437 = _367 * _117;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _441 = _435;
    if (!_353)
    {
        int _443 = ~as_type<int>(_357);
        int _445 = _443 + 1;
        _441 = _445;
    }
    int _447 = _441;
    if (!_363)
    {
        _383 = _159;
    }
    float _449 = _383;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _453 = !_421;
    int _455 = _453 ? 0 : 1;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    bool _461 = !_425;
    int _463 = _461 ? 0 : 1;
    float _465 = _449;
    if (!_363)
    {
        _385 = _151;
    }
    float _467 = _385;
    float _469 = _467;
    if (_363)
    {
        _465 = _151;
    }
    float _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _471;
    if (_363)
    {
        _469 = _147;
    }
    float _487 = _469;
    float _489 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _439);
    float _491 = float(_395);
    bool _493 = !_475;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[83].z, _451);
    float _499 = _487;
    if (!_363)
    {
        _485 = _159;
    }
    float _501 = _485;
    float _503 = 1.0 / _491;
    float _505 = _501;
    if (!_363)
    {
        _499 = _151;
    }
    float _507 = _499;
    float _509 = _507;
    if (_363)
    {
        _505 = _151;
    }
    float _511 = _505;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_363)
    {
        _509 = _147;
    }
    float _515 = _509;
    int _517 = abs(_495);
    float _519 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _521 = float(_411);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _525 = float(_517);
    float _527 = -_117;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _239);
    float _531 = -_513;
    float _533 = fma(_523, 2.0, _531);
    bool _535 = !_479;
    int _537 = _535 ? 0 : 1;
    float _539 = _525 * _521;
    float _541 = exp2(_437);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _545 = float(_429);
    float _547 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _497);
    int _549 = abs(_537);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _553 = 1.0 + _551;
    float _555 = 1.0 / _545;
    float _557 = float(_447);
    float _559 = fma(_519, -2.0, _543);
    float _561 = float(_549);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = in.m_60.x;
    float _567 = in.m_60.y;
    float _569 = in.m_60.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = 1.0 / _553;
    float _583 = _561 * _557;
    float _585 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    float _587 = -_541;
    float _589 = _587 + 1.0;
    bool _591 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _599 = _595 || _597;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _603 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_211);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _249);
    bool _617 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _619 = isnan(_211);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _601);
    float _631 = _599 ? _589 : 0.0;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _489);
    float _639 = _503 * _117;
    float _641 = _555 * _117;
    float _643 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _645 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _585);
    float _647 = -_117;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _533);
    float _651 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _559);
    if (_579)
    {
        float _653 = _631 * _581;
        _127 = _653;
    }
    float _655 = _127;
    bool _657 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_211);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _627 * _635;
    bool _671 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_211);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    bool _687 = !_483;
    int _689 = _687 ? 0 : 1;
    float _691 = _539 * (-2.0);
    float _693 = _147 + (-0.5);
    float _695 = _681 * _685;
    float _697 = -_681;
    float _699 = _697 + 1.0;
    int _701 = abs(_689);
    float _703 = fma(_691, _565, _565);
    float _705 = _583 * (-2.0);
    float _707 = _667 * _699;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    float _711 = fma(_265, _691, _265);
    float _713 = _349 * _707;
    float _715 = float(_391);
    float _717 = fma(_309, _705, _309);
    float _719 = float(_701);
    float _721 = _351 * _707;
    float _723 = fma(_705, _567, _567);
    float _725 = _151 + (-0.5);
    float _727 = -_667;
    float _729 = _727 + 1.0;
    float _731 = _719 * _715;
    float _733 = fma(_711, _655, _709);
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].y, _723);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].y, _721);
    float _739 = _731 * (-2.0);
    float _741 = in.m_62.x;
    float _743 = in.m_62.y;
    float _745 = fma(_717, _655, _735);
    float _747 = _733 * 0.15915493667125701904296875;
    float _749 = fma(_739, _569, _569);
    float _751 = _159 + (-0.5);
    float _753 = _745 * 0.15915493667125701904296875;
    float _755 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _761;
    float _765 = fma(_259, _739, _259);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _769 = fma(_759, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _771 = fma(_403, _695, _755);
    float _773 = in.m_44.x;
    float _775 = in.m_44.y;
    float _777 = in.m_44.z;
    float _779 = fma(_763, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = fma(_413, _695, _737);
    float _783 = fma(_765, _655, _767);
    float _785 = in.m_64.x;
    float _787 = in.m_64.y;
    float _789 = in.m_64.z;
    float _791 = in.m_64.w;
    float _793 = fma(_769, _669, _771);
    float _795 = fma(_779, _669, _781);
    float _797 = _783 * 0.15915493667125701904296875;
    float _799 = _747 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].x, _793);
    float _805 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].y, _795);
    float _807 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _803 * _741;
    float _811 = _805 * _743;
    float _813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _815 = _747 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _823 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _825 = _819 * _813;
    float _827 = in.m_66.x;
    float _829 = in.m_66.y;
    float _831 = in.m_66.z;
    float _833 = in.m_66.w;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _823 * _821;
    float _841 = _775 * _787;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = cos(_843);
    float _847 = fma(_773, _785, _841);
    float _849 = fma(_777, _789, _847);
    float _851 = _797 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _801 * _837;
    float _857 = _849 + _791;
    float _859 = _775 * _829;
    float _861 = _797 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _817 * _845;
    float _867 = _801 * _845;
    float _869 = fma(_773, _827, _859);
    float _871 = _817 * _853;
    float _873 = _817 * _837;
    float _875 = _801 * _853;
    float _877 = _845 * _853;
    float _879 = _871 * _839;
    float _881 = _837 * _853;
    float _883 = fma(_863, _865, _855);
    float _885 = -_839;
    float _887 = _863 * _885;
    float _889 = -_867;
    float _891 = fma(_863, _873, _889);
    float _893 = -_873;
    float _895 = fma(_863, _867, _893);
    float _897 = fma(_883, _825, _879);
    float _899 = _875 * _839;
    float _901 = fma(_877, _825, _887);
    float _903 = fma(_863, _855, _865);
    float _905 = fma(_891, _807, _897);
    float _907 = fma(_895, _825, _899);
    float _909 = fma(_881, _807, _901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _913 = fma(_903, _807, _907);
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _919 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _911);
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _923 = fma(_777, _831, _869);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _919);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = _923 + _833;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = in.m_68.x;
    float _937 = in.m_68.y;
    float _939 = in.m_68.z;
    float _941 = in.m_68.w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _927);
    float _947 = _857 + _933;
    float _949 = _931 + _943;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _947 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _949 + _955;
    float _959 = _953 * _953;
    float _961 = fma(_957, _957, _959);
    float _963 = sqrt(_961);
    float _965 = _775 * _937;
    float _967 = fma(_773, _935, _965);
    float _969 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = fma(_777, _939, _967);
    bool _973 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _971 + _941;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _987 = _985 != 0;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _991 = _989 != 0;
    float _993 = _975 + _969;
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    bool _1005 = !_983;
    int _1007 = _1005 ? 0 : 1;
    bool _1009 = !_979;
    int _1011 = _1009 ? 0 : 1;
    bool _1013 = !_987;
    int _1015 = _1013 ? 0 : 1;
    bool _1017 = !_991;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = _969;
    float _1023 = _777;
    float _1025 = _775;
    float _1027 = _961;
    float _1029 = _947;
    if (!_973)
    {
        _1021 = _949;
    }
    float _1031 = _1021;
    float _1033 = _1031;
    if (!_973)
    {
        _1023 = _947;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_973)
    {
        _1025 = _993;
    }
    float _1039 = _1025;
    bool _1041 = !_973;
    float _1043 = _1039;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _963 + _1047;
        float _1051 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = rsqrt(_961);
        float _1055 = _1049 * _1045;
        float _1057 = _1055 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_993, _1061, _1069);
        float _1075 = _1053 * _1071;
        float _1077 = fma(_957, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_953, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1033 = _1077;
        _1043 = _1073;
        _1037 = _1079;
        _1027 = _1053;
    }
    float _1081 = _1033;
    float _1083 = _1043;
    float _1085 = _1037;
    float _1087 = _1027;
    float _1089 = _1083;
    float _1091 = _1081;
    float _1093 = _1085;
    float _1095 = _1087;
    if (!_1003)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _975 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _931 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = -_931;
        float _1109 = _1107 + _1081;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _857 + _1113;
        float _1117 = fma(_1103, _1103, _1111);
        float _1119 = fma(_1115, _1115, _1117);
        float _1121 = sqrt(_1119);
        float _1123 = precise::min(_1121, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1125 = _1123 * _1105;
        float _1127 = -_975;
        float _1129 = _1127 + _1083;
        float _1131 = -_857;
        float _1133 = _1131 + _1085;
        float _1135 = fma(_1109, _1125, _931);
        float _1137 = fma(_1129, _1125, _975);
        float _1139 = fma(_1133, _1125, _857);
        _1089 = _1137;
        _1091 = _1135;
        _1093 = _1139;
    }
    float _1141 = _1089;
    float _1143 = _1091;
    float _1145 = _1093;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1141 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _1143 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1157 = _1145 + _1155;
    float _1159 = _1149 * _1149;
    float _1161 = fma(_1153, _1153, _1159);
    float _1163 = fma(_1157, _1157, _1161);
    float _1165 = rsqrt(_1163);
    float _1167 = sqrt(_1163);
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1153 * _1169;
    float _1173 = _1157 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _945;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1149;
    float _1197 = _1171;
    float _1199 = _1173;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1183)
    {
        float _1211 = _1187 * _1205;
        _1193 = _1211;
    }
    float _1213 = _1193;
    if (_1183)
    {
        float _1215 = _1213 * 0.15915493667125701904296875;
        _1095 = _1215;
    }
    float _1217 = _1095;
    float _1219 = _913;
    if (_1183)
    {
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1229 = precise::max(0.0, _1227);
    float _1231 = _1205;
    float _1233 = _1229;
    if (_1183)
    {
        float _1235 = _1217 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1231 = _1237;
    }
    float _1239 = _1231;
    float _1241 = -_1169;
    float _1243 = -_1229;
    float _1245 = fma(_1149, _1241, _1243);
    if (_1183)
    {
        float _1247 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1247;
    }
    float _1249 = _1195;
    float _1251 = _1225;
    float _1253 = _1249;
    if (_1183)
    {
        float _1255 = fma(_1225, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1251 = _1255;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (!_1183)
    {
        _1253 = _1245;
    }
    float _1261 = _1253;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1265 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1263);
    float _1267 = precise::clamp(_1265, 0.0, 1.0);
    float _1269 = _1261;
    if (_1183)
    {
        float _1271 = _1239 + (-1.0);
        _1233 = _1271;
    }
    float _1273 = _1233;
    float _1275 = _1273;
    if (_1183)
    {
        float _1277 = _1209 * _1257;
        _1029 = _1277;
    }
    float _1279 = _1029;
    float _1281 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = -_1267;
    float _1285 = _1283 + 1.0;
    if (_1183)
    {
        float _1287 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1287;
    }
    float _1289 = _1259;
    if (_1183)
    {
        float _1291 = _1171 * _1279;
        _1197 = _1291;
    }
    float _1293 = _1197;
    if (!_1183)
    {
        _1275 = _1175;
    }
    float _1295 = _1275;
    float _1297 = _1295;
    if (_1183)
    {
        float _1299 = _1173 * _1279;
        _1199 = _1299;
    }
    float _1301 = _1199;
    if (_1183)
    {
        float _1303 = fma(_1245, _1239, _1289);
        _1269 = _1303;
    }
    float _1305 = _1269;
    if (_1183)
    {
        float _1307 = _1293 * _1293;
        _1297 = _1307;
    }
    float _1309 = _1297;
    float _1311 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1183)
    {
        float _1313 = _1301 * _1301;
        _1201 = _1313;
    }
    float _1315 = _1201;
    float _1317 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1319 = fma(_1305, _1305, _1309);
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1311);
    float _1323 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1325 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1327 = _1319 + _1315;
    float _1329 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = abs(_1285);
    float _1337 = log2(_1335);
    float _1339 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = rsqrt(_1327);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1359 = -_1351;
    float _1361 = fma(_1359, _1323, 1.0);
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1349);
    float _1365 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1369 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1373 = log2(_1361);
    float _1375 = _1353 * _1293;
    float _1377 = _1353 * _1305;
    float _1379 = _1353 * _1301;
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1367);
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1385 = exp2(_1371);
    float _1387 = _1377 + 1.0;
    float _1389 = -_1383;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1389);
    float _1393 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1395 = -_1379;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1391);
    float _1399 = 1.0 / _1381;
    float _1401 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1403 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1393);
    float _1405 = fma(_1397, -0.5, 0.5);
    float _1407 = fma(_1397, 0.5, 0.5);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1401);
    float _1411 = fma(_1407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1413 = sqrt(_1405);
    float _1415 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1417 = -_1377;
    float _1419 = fma(_1385, _1387, _1417);
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1423 = fma(_1407, _1411, -0.212114393711090087890625);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1427 = _1373 * 0.693147182464599609375;
    float _1429 = _1421 * _1399;
    float _1431 = fma(_1407, _1423, 1.570728778839111328125);
    float _1433 = _1425 * _1399;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1437 = fma(_1429, -0.5, 0.5);
    float _1439 = fma(_1419, 0.5, 0.5);
    float _1441 = fma(_1433, 0.5, 0.5);
    float _1443 = _1413 * 0.636619746685028076171875;
    float _1445 = -_1431;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _5161 = float3(_1441, _1437, _1435);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1441, _1437, _1435);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _5189 = float2(_1447, _1439);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5189, float2(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5189, float2(0.0), isnan(_5189)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1478 = _1476 != 0;
    float _1480 = -_645;
    float _1482 = _1480 + 1.0;
    bool _1484 = _159 > 0.5;
    float _1486 = -_547;
    float _1488 = _1486 + 1.0;
    bool _1490 = _147 > 0.5;
    out.m_70.x = _931;
    out.m_70.y = _975;
    out.m_70.z = _857;
    bool _1492 = _151 > 0.5;
    float _1494 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1500 = _1498 != 0;
    float _1502 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1504 = abs(_455);
    out.m_72.x = _1143;
    out.m_72.y = _1141;
    out.m_72.z = _1145;
    int _1506 = abs(_459);
    float _1508 = 0.0;
    if (_1478)
    {
        _1508 = 1.0;
    }
    float _1510 = _1508;
    float _1512 = trunc(_639);
    int _1514 = int(_1512);
    float _1516 = float(uint(_1474));
    float _1518 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = _1510;
    if (!_1478)
    {
        _1520 = 1.2345600128173828125;
    }
    float _1522 = _1520;
    float _1524 = 0.0;
    if (_1478)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1478)
    {
        _1528 = 7.345489978790283203125;
    }
    float _1530 = _1528;
    float _1532 = 1.0 / _1516;
    float _1534 = float(uint(_1496));
    int _1536 = ~_1496;
    int _1538 = _1536 + 1;
    float _1540 = _1530 * _147;
    int _1542 = ~_1474;
    int _1544 = _1542 + 1;
    int _1546 = abs(_1015);
    float _1548 = 1.0 / _1534;
    float _1550 = float(uint(_1514));
    int _1552 = ~_1496;
    int _1554 = _1552 + 1;
    float _1556 = trunc(_641);
    int _1558 = int(_1556);
    int _1560 = as_type<int>(_1532) + (-2);
    float _1562 = as_type<float>(_1560) * _1550;
    int _1564 = ~_1474;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1502);
    int _1570 = as_type<int>(_1548) + (-2);
    float _1572 = float(uint(_1558));
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    float _1581 = as_type<float>(_1570) * _1572;
    float _1583 = _1572;
    if (_1478)
    {
        _1583 = _147;
    }
    float _1585 = _1583;
    float _1587 = _1585;
    if (!_1478)
    {
        _1587 = _151;
    }
    float _1589 = _1587;
    float _1591 = floor(_1540);
    float _1593 = float(_1514);
    float _1595 = -_1568;
    float _1597 = _1595 + 1.0;
    float _1599 = _1522 * _1589;
    float _1601 = trunc(_1581);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    int _1607 = _1566 * int(_1579);
    int _1609 = _1607 + _1514;
    float _1611 = float(uint(_1609));
    float _1613 = floor(_1599);
    float _1615 = -_1591;
    float _1617 = _1540 + _1615;
    float _1619 = as_type<float>(_1560) * _1611;
    float _1621 = float(_1474);
    int _1623 = _1538 * int(_1605);
    int _1625 = _1623 + _1558;
    float _1627 = trunc(_1619);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = _1593 >= _1621;
    bool _1635 = isnan(_1593);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1621);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1617 * _1621;
    int _1647 = ~_1496;
    int _1649 = _1647 + 1;
    float _1651 = _1621 * _375;
    float _1653 = float(uint(_1625));
    float _1655 = -_1613;
    float _1657 = _1599 + _1655;
    float _1659 = trunc(_1645);
    int _1661 = int(_1659);
    float _1663 = as_type<float>(_1570) * _1653;
    float _1665 = trunc(_1663);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    int _1671 = int(_1579) + int(_1631);
    int _1673 = _1544 * _1671;
    int _1675 = _1673 + _1514;
    int _1677 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1679 = _1677 != 0;
    float _1681 = trunc(_1651);
    int _1683 = int(_1681);
    bool _1685 = uint(_1675) >= uint(_1474);
    float _1687 = float(_1558);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1691 = _1689 != 0;
    int _1693 = int(_1605) + int(_1669);
    float _1695 = float(_1496);
    float _1697 = trunc(_1643);
    int _1699 = int(_1697);
    bool _1701 = !_1691;
    int _1703 = _1701 ? 0 : 1;
    int _1705 = _1649 * _1693;
    int _1707 = _1705 + _1558;
    bool _1709 = _1687 >= _1695;
    bool _1711 = isnan(_1687);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(_1695);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = _1695 * _375;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1725 = _1723 != 0;
    int _1727 = abs(_1703);
    float _1729 = _1657 * _1695;
    bool _1731 = !_1685;
    int _1733 = _1731 ? 0 : (-1);
    float _1735 = trunc(_1719);
    int _1737 = int(_1735);
    bool _1739 = uint(_1707) >= uint(_1496);
    int _1741 = ~_1671;
    int _1743 = _1741 + _1733;
    int _1745 = _1743 + 1;
    bool _1747 = !_1739;
    int _1749 = _1747 ? 0 : (-1);
    bool _1751 = !_1725;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = trunc(_1721);
    int _1757 = int(_1755);
    int _1759 = ~_1693;
    int _1761 = _1759 + _1749;
    int _1763 = _1761 + 1;
    int _1765 = _1661 * _1727;
    int _1767 = _1765 + _1514;
    bool _1769 = _1474 == 0;
    int _1771 = _1474 * _1745;
    int _1773 = _1771 + _1514;
    int _1775 = abs(_1753);
    int _1777 = _1496 * _1763;
    int _1779 = _1777 + _1558;
    bool _1781 = _1496 == 0;
    float _1783 = trunc(_1729);
    int _1785 = int(_1783);
    bool _1787 = !_1769;
    int _1789 = _1787 ? _1773 : (-1);
    int _1791 = ~_1737;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    bool _1797 = !_1781;
    int _1799 = _1797 ? _1779 : (-1);
    int _1801 = ~_1699;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1496 + (-1);
    int _1809 = _1799 * _1795;
    int _1811 = ~_1496;
    int _1813 = _1811 + 1;
    int _1815 = _1789 * _1805;
    int _1817 = _1474 + (-1);
    int _1819 = _1737 * _1807;
    int _1821 = _1819 + _1809;
    float _1823 = in.m_53.w;
    int _1825 = _1785 * _1775;
    int _1827 = _1825 + _1558;
    int _1829 = _1699 * _1817;
    int _1831 = _1829 + _1815;
    int _1833 = abs(_1007);
    int _1835 = abs(_1011);
    int _1837 = _1831 * _1504;
    int _1839 = abs(_463);
    int _1841 = _1821 * _1833;
    int _1843 = _1683 * _1506;
    int _1845 = _1843 + _1837;
    bool _1847 = !_1500;
    int _1849 = _1847 ? 0 : 1;
    int _1851 = _1757 * _1835;
    int _1853 = _1851 + _1841;
    float _1855 = float(uint(_1767));
    int _1857 = _1767 * _1839;
    int _1859 = _1857 + _1845;
    int _1861 = abs(_1849);
    int _1863 = _1827 * _1546;
    int _1865 = _1863 + _1853;
    float _1867 = float(uint(_1827));
    float _1869 = as_type<float>(_1560) * _1855;
    int _1871 = abs(_1019);
    int _1873 = _1661 * _1861;
    int _1875 = _1873 + _1859;
    float _1877 = -_187;
    int _1879 = _1490 ? as_type<int>(_1877) : as_type<int>(_187);
    float _1881 = as_type<float>(_1570) * _1867;
    bool _1883 = _1823 > 0.5;
    int _1885 = _1785 * _1871;
    int _1887 = _1885 + _1865;
    float _1889 = float(uint(_1875));
    float _1891 = trunc(_1869);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    bool _1897 = !_1679;
    float _1899 = _1897 ? _187 : as_type<float>(_1879);
    float _1901 = float(uint(_1887));
    float _1903 = as_type<float>(_1560) * _1889;
    int _1905 = ~_1474;
    int _1907 = _1905 + 1;
    float _1909 = _1899 + 0.5;
    float _1911 = -_187;
    int _1913 = _1484 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = trunc(_1881);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1570) * _1901;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1925 = ~_1474;
    int _1927 = _1925 + 1;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1931 = _1929 != 0;
    float _1933 = -_191;
    int _1935 = _1492 ? as_type<int>(_1933) : as_type<int>(_191);
    float _1937 = trunc(_1903);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1927 * int(_1895);
    int _1945 = _1943 + _1767;
    int _1947 = ~_1496;
    int _1949 = _1947 + 1;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1953 = _1951 != 0;
    float _1955 = float(uint(_1945));
    float _1957 = trunc(_1921);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1813 * int(_1919);
    int _1965 = _1963 + _1827;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1969 = _1967 != 0;
    float _1971 = as_type<float>(_1560) * _1955;
    float _1973 = -_191;
    int _1975 = _1883 ? as_type<int>(_1973) : as_type<int>(_191);
    float _1977 = float(uint(_1965));
    int _1979 = _1907 * int(_1941);
    int _1981 = _1979 + _1875;
    bool _1983 = !_1931;
    float _1985 = _1983 ? _187 : as_type<float>(_1913);
    float _1987 = as_type<float>(_1570) * _1977;
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1981));
    float _1997 = _1985 + 0.5;
    bool _1999 = !_1953;
    float _2001 = _1999 ? _191 : as_type<float>(_1935);
    int _2003 = _1949 * int(_1961);
    int _2005 = _2003 + _1887;
    bool _2007 = !_1969;
    float _2009 = _2007 ? _191 : as_type<float>(_1975);
    float _2011 = as_type<float>(_1560) * _1995;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c9)._m0[85].x, _649);
    float _2015 = trunc(_1987);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    float _2021 = float(uint(_2005));
    float _2023 = _2001 + (-0.5);
    float _2025 = _2009 + (-0.5);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2029 = _2027 != 0;
    float _2031 = as_type<float>(_1570) * _2021;
    float _2033 = -_643;
    float _2035 = _2033 + 1.0;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = -_2023;
    float _2045 = -_615;
    float _2047 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2045);
    float _2049 = -_2025;
    float _2051 = -_651;
    float _2053 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2051);
    float _2055 = -_637;
    float _2057 = _2055 + 1.0;
    float _2059 = -_2035;
    float _2061 = fma(_1899, _2059, _1923);
    float _2063 = fma(_2001, _1482, _2047);
    float _2065 = -_1488;
    float _2067 = fma(_1985, _2065, _2013);
    float _2069 = fma(_2009, _2057, _2053);
    float _2071 = trunc(_2031);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2079 = _2077 != 0;
    float _2081 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2083 = int(_1895) + int(_1993);
    float _2085 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2087 = int(_1919) + int(_2019);
    out.m_74.x = _2061;
    out.m_74.y = _2063;
    out.m_74.z = _2067;
    out.m_74.w = _2069;
    int _2089 = ~_1496;
    int _2091 = _2089 + 1;
    float _2093 = -_863;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2085);
    int _2097 = int(_1941) + int(_2041);
    float _2099 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2101 = ~_1474;
    int _2103 = _2101 + 1;
    int _2105 = _1554 * _2087;
    int _2107 = _2105 + _1827;
    float _2109 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2111 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2095);
    int _2113 = ~_1474;
    int _2115 = _2113 + 1;
    int _2117 = int(_1961) + int(_2075);
    bool _2119 = uint(_2107) >= uint(_1496);
    float _2121 = -_863;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2125 = -_863;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2099);
    int _2129 = _2103 * _2097;
    int _2131 = _2129 + _1875;
    float _2133 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2135 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2137 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2139 = _2091 * _2117;
    int _2141 = _2139 + _1887;
    bool _2143 = uint(_2131) >= uint(_1474);
    float _2145 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2133);
    float _2147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2137);
    float _2149 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2151 = uint(_2141) >= uint(_1496);
    float _2153 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2155 = !_2143;
    int _2157 = _2155 ? 0 : (-1);
    int _2159 = _2115 * _2083;
    int _2161 = _2159 + _1767;
    bool _2163 = !_2151;
    int _2165 = _2163 ? 0 : (-1);
    float _2167 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2149);
    int _2169 = ~_2097;
    int _2171 = _2169 + _2157;
    int _2173 = _2171 + 1;
    float _2175 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    int _2177 = ~_2117;
    int _2179 = _2177 + _2165;
    int _2181 = _2179 + 1;
    float _2183 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2185 = uint(_2161) >= uint(_1474);
    int _2187 = _1474 * _2173;
    int _2189 = _2187 + _1875;
    float _2191 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2167);
    int _2193 = _1496 * _2181;
    int _2195 = _2193 + _1887;
    float _2197 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2199 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2201 = !_1769;
    int _2203 = _2201 ? _2189 : (-1);
    float _2205 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2207 = !_1781;
    int _2209 = _2207 ? _2195 : (-1);
    float _2211 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    int _2213 = _2203 >> 31;
    float _2215 = _1518 * _2135;
    int _2217 = _2209 >> 31;
    float _2219 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2147);
    int _2221 = _2213 & 3;
    float _2223 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2205);
    int _2225 = _2217 & 3;
    float _2227 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    int _2229 = _2203 + _2221;
    float _2231 = fma(_2109, _2219, _2215);
    int _2233 = _2209 + _2225;
    float _2235 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2145);
    int _2237 = _2229 >> 2;
    float _2239 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    int _2241 = _2203 & 3;
    bool _2243 = _2241 != 0;
    float _2245 = _1518 * _2111;
    int _2247 = _2237 << 4;
    int _2249 = _2247 + 368;
    int _2251 = _2233 >> 2;
    out.m_76.x = _2235;
    out.m_76.y = _2219;
    out.m_76.z = _2239;
    int _2253 = _2243 ? 0 : 1;
    uint _2255 = uint(int(uint(_2249) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = _2203 & 3;
    bool _2273 = _2271 != 0;
    float _2275 = fma(_2109, _2235, _2245);
    int _2277 = _2251 << 4;
    int _2279 = _2277 + 512;
    bool _2281 = !_2185;
    int _2283 = _2281 ? 0 : (-1);
    bool _2285 = uint(_2271) >= 2u;
    uint _2287 = uint(int(uint(_2279) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    bool _2303 = !_2119;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2309 = _2285 ? 0 : 1;
    bool _2311 = uint(_2271) > 1u;
    bool _2313 = _2271 != 3;
    int _2315 = _2249 + 8;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = ~_2083;
    int _2335 = _2333 + _2283;
    int _2337 = _2335 + 1;
    int _2339 = ~_2253;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2087;
    int _2347 = _2345 + _2305;
    int _2349 = _2347 + 1;
    float _2351 = _1518 * _2197;
    int _2353 = ~_2309;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = _1474 * _2337;
    int _2361 = _2359 + _1767;
    int _2363 = _2343;
    int _2365 = _2357;
    float _2367 = _2135;
    if (!_2311)
    {
        int _2369 = ~_2253;
        int _2371 = _2369 + 1;
        _2363 = _2371;
    }
    int _2373 = _2363;
    int _2375 = _1496 * _2349;
    int _2377 = _2375 + _1827;
    int _2379 = _2209 & 3;
    bool _2381 = _2379 != 0;
    if (_2313)
    {
        int _2383 = ~_2309;
        int _2385 = _2383 + 1;
        _2365 = _2385;
    }
    int _2387 = _2365;
    bool _2389 = !_2273;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2209 & 3;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2109, _2239, _2351);
    bool _2399 = uint(_2379) > 1u;
    float _2401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    int _2403 = _2395 ? 0 : 1;
    int _2405 = _2279 + 8;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
    int _2411 = int(_2407) & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = int(_2407) + 1;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    int _2419 = _2415 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[int(_2417)][_2419];
    bool _2423 = _2271 != 3;
    float _2425 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2401);
    int _2427 = ~_2403;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_2381;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = uint(_2379) >= 2u;
    bool _2439 = !_1769;
    int _2441 = _2439 ? _2361 : (-1);
    int _2443 = _2431;
    if (!_2399)
    {
        int _2445 = ~_2403;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    int _2451 = abs(_2373);
    bool _2453 = _2379 != 3;
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = abs(_2449);
    int _2463 = abs(_2391);
    int _2465 = _2459 * as_type<int>(_2269);
    int _2467 = abs(_2435);
    int _2469 = abs(_2387);
    int _2471 = ~_2461;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = ~_2463;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    int _2483 = _2475 * as_type<int>(_2301);
    int _2485 = _2437 ? 0 : 1;
    int _2487 = _2481 * as_type<int>(_2261);
    int _2489 = _2487 + _2465;
    int _2491 = ~_2467;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = ~_2469;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = fma(_1518, _1518, 1.0);
    int _2505 = ~_2485;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2495 * as_type<int>(_2293);
    int _2513 = _2511 + _2483;
    int _2515 = _2509;
    if (_2453)
    {
        int _2517 = ~_2485;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2501 * as_type<int>(_2323);
    int _2525 = _2523 + _2489;
    bool _2527 = _2379 != 3;
    float _2529 = rsqrt(_2503);
    bool _2531 = !_2029;
    int _2533 = _2531 ? 0 : 1;
    bool _2535 = !_2423;
    int _2537 = _2535 ? 0 : (-1);
    int _2539 = abs(_2521);
    bool _2541 = !_2527;
    int _2543 = _2541 ? 0 : (-1);
    int _2545 = abs(_2533);
    int _2547 = abs(_2537);
    bool _2549 = !_2079;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = abs(_2543);
    int _2555 = abs(_2551);
    int _2557 = ~_2539;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = ~_2547;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    int _2569 = _2561 * as_type<int>(_2413);
    int _2571 = _2569 + _2513;
    int _2573 = ~_2553;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = ~_2545;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2567 * as_type<int>(_2331);
    int _2587 = _2585 + _2525;
    int _2589 = ~_2555;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = _2577 * as_type<int>(_2421);
    int _2597 = _2595 + _2571;
    float _2599 = _1518 * _2529;
    int _2601 = _2587 * _2583;
    float _2603 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2605 = _2597 * _2593;
    float _2607 = -_2191;
    float _2609 = _2599 * _2607;
    int _2611 = _2441 * _2545;
    int _2613 = _2611 + _2601;
    float _2615 = -_2223;
    float _2617 = _2599 * _2615;
    float _2619 = -_2227;
    float _2621 = _2599 * _2619;
    float _2623 = _2603 * _1449;
    float _2625 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2425);
    float _2627 = fma(_2529, _2135, _2609);
    bool _2629 = !_1781;
    int _2631 = _2629 ? _2377 : (-1);
    float _2633 = fma(_2529, _2111, _2617);
    float _2635 = _1381 * 0.5;
    float _2637 = fma(_2529, _2197, _2621);
    float _2639 = _1460 * _2623;
    float _2641 = _2625 + _1381;
    float _2643 = _1425 + _1381;
    float _2645 = -_2603;
    float _2647 = _2645 + 1.0;
    float _2649 = _1470 * _2623;
    float _2651 = fma(_1421, -0.5, _2635);
    int _2653 = _2631 * _2555;
    int _2655 = _2653 + _2605;
    float _2657 = float(_2613);
    float _2659 = _2191 + _2231;
    float _2661 = fma(_1466, _2639, _1454);
    float _2663 = _2641 * 0.5;
    float _2665 = _2643 * 0.5;
    float _2667 = _2223 + _2275;
    float _2669 = _2227 + _2397;
    float _2671 = fma(_1468, _2639, _1456);
    float _2673 = _1460 * _2647;
    float _2675 = fma(_1460, _2649, _1458);
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1421;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1381;
    bool _2677 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2679 = isnan(_1167);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2655);
    out.m_78.x = _2665;
    out.m_78.y = _2651;
    out.m_78.z = _2663;
    out.m_78.w = _1381;
    out.m_80.x = _2661;
    out.m_80.y = _2671;
    out.m_80.z = _2675;
    out.m_80.w = _2673;
    out.m_82.x = _2667;
    out.m_82.y = _2659;
    out.m_82.z = _2669;
    float _2689 = _2637;
    float _2691 = _2627;
    float _2693 = _2633;
    float _2695 = _2687;
    float _2697 = _2657;
    if (!_2685)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2699 = _2367;
    out.m_84.x = _2633;
    out.m_84.y = _2627;
    out.m_84.z = _2637;
    out.m_86.x = _2657;
    out.m_86.y = _2687;
    float _2701 = _2699;
    float _2703 = _2699;
    if (!_2685)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    float _2709 = _2705;
    if (!_2685)
    {
        _2691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2711 = _2691;
    float _2713 = _2711;
    float _2715 = _2711;
    if (!_2685)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2717 = _2693;
    float _2719 = _2717;
    float _2721 = _2717;
    if (!_2685)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2723 = _2695;
    float _2725 = _2723;
    float _2727 = _2723;
    if (!_2685)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2697;
    bool _2731 = !_2685;
    float _2733 = _2729;
    float _2735 = _2729;
    if (!_2731)
    {
        bool _2737 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2739 = isnan(_1167);
        bool _2741 = _2737 || _2739;
        bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2745 = _2741 || _2743;
        if (!_2745)
        {
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2749 = _1167 + _2747;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2751;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2759 = 1.0 / _2753;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2777 = _2749 * _2759;
            float _2779 = precise::clamp(_2777, 0.0, 1.0);
            float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2709 = _2789;
            _2727 = _2793;
            _2703 = _2785;
            _2721 = _2791;
            _2715 = _2787;
            _2735 = _2795;
            _2797 = true;
        }
        else
        {
            bool _2799 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2801 = isnan(_1167);
            bool _2803 = _2799 || _2801;
            bool _2805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2807 = _2803 || _2805;
            if (!_2807)
            {
                _2701 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2809 = _2701;
            _2703 = _2809;
            if (!_2807)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2811 = _2707;
            _2709 = _2811;
            if (!_2807)
            {
                _2713 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2813 = _2713;
            _2715 = _2813;
            if (!_2807)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2815 = _2719;
            _2721 = _2815;
            if (!_2807)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2817 = _2725;
            _2727 = _2817;
            if (!_2807)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2819 = _2733;
            bool _2821 = !_2807;
            _2735 = _2819;
            if (!_2821)
            {
                bool _2823 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2825 = isnan(_1167);
                bool _2827 = _2823 || _2825;
                bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2831 = _2827 || _2829;
                if (!_2831)
                {
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2835 = _1167 + _2833;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2837;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2845 = 1.0 / _2839;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2863 = _2835 * _2845;
                    float _2865 = precise::clamp(_2863, 0.0, 1.0);
                    float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2871 = fma(_2865, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2873 = fma(_2865, _2869, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2875 = fma(_2865, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2877 = fma(_2865, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2879 = fma(_2865, _2857, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2881 = fma(_2865, _2861, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2709 = _2875;
                    _2727 = _2879;
                    _2703 = _2871;
                    _2721 = _2877;
                    _2715 = _2873;
                    _2735 = _2881;
                    _2797 = true;
                }
                else
                {
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2703 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2715 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2797 = false;
    float _2883 = _2709;
    float _2885 = _2727;
    float _2887 = _2703;
    float _2889 = _2721;
    float _2891 = _2715;
    float _2893 = _2735;
    float _2895 = fma(_2659, -0.5, 0.5);
    float _2897 = precise::clamp(_2895, 0.0, 1.0);
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = -_2887;
    float _2905 = _2903 + _2889;
    float _2907 = -_2891;
    float _2909 = _2907 + _2893;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2913 = fma(_2897, _2901, _2883);
    float _2915 = fma(_2897, _2905, _2887);
    float _2917 = fma(_2897, _2909, _2891);
    float _2919 = _2913 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2921 = fma(_2915, 0.298911988735198974609375, _2919);
    float _2923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2925 = fma(_2917, 0.114477999508380889892578125, _2921);
    out.m_88.w = _2923;
    float _2927 = -_2925;
    float _2929 = _2913 + _2927;
    float _2931 = -_2925;
    float _2933 = _2915 + _2931;
    float _2935 = -_2925;
    float _2937 = _2917 + _2935;
    out.m_90.x = 0.0;
    float _2939 = fma(_2929, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2941 = fma(_2933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    out.m_92.x = _2941;
    out.m_92.y = _2939;
    out.m_92.z = _2943;
    if (!_2911)
    {
        return out;
    }
    float _2945 = -_1141;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2949 = -_1143;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2953 = -_1145;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2957 = _2947 * _2947;
    float _2959 = fma(_2951, _2951, _2957);
    float _2961 = fma(_2955, _2955, _2959);
    float _2963 = sqrt(_2961);
    float _2965 = rsqrt(_2961);
    float _2967 = -_2963;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2951 * _2965;
    float _2977 = _2947 * _2965;
    float _2979 = abs(_2973);
    float _2981 = log2(_2979);
    float _2983 = _2955 * _2965;
    float _2985 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2987 = _2659 * _2977;
    float _2989 = -_2977;
    float _2991 = -_2985;
    float _2993 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2991);
    float _2995 = fma(_2667, _2975, _2987);
    float _2997 = -_2983;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2993);
    float _3001 = fma(_2669, _2983, _2995);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3007 = _2999 + _3005;
    float _3009 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = exp2(_3009);
    float _3017 = _3015 * _3013;
    float _3019 = _3003 * _3017;
    float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3023 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3025 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3021;
    out.m_90.y = _3023;
    out.m_90.z = _3025;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2797 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = in.m_46.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_51.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_135);
        out.gl_Position.z = _3093;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = in.m_53.x;
    float _149 = float(_113);
    float _151 = in.m_53.y;
    bool _153 = _117 >= _149;
    bool _155 = !_145;
    bool _157 = _153 || _155;
    float _159 = in.m_53.z;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _147;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3156 = as_type<float>(_167);
        out.gl_Position.z = _3156;
    }
    out.m_55.y = _151;
    out.m_55.z = _159;
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = 1.0 / _149;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _117 * _171;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_173;
    float _195 = _175;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _195 = _209;
    }
    float _211 = _195;
    float _213 = _147 * 2.0;
    float _215 = _147 + _151;
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = floor(_213);
    float _223 = _151 * 2.0;
    float _225 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _231 = _215 + (-1.0);
    float _233 = _147 + _159;
    float _235 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _237 = -_227;
    float _239 = fma(_225, 2.0, _237);
    float _241 = floor(_223);
    float _243 = _159 * 2.0;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = fma(_235, -2.0, _229);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = _233 + (-1.0);
    float _257 = floor(_243);
    float _259 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _261;
    float _265 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _267 = 1.0 / _247;
    float _269 = _151 + _159;
    bool _271 = _241 > 0.0;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _211 + _273;
    bool _277 = _241 >= 0.0;
    bool _279 = isnan(_241);
    bool _281 = _277 || _279;
    bool _283 = isnan(0.0);
    bool _285 = _281 || _283;
    float _287 = _269 + (-1.0);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _289;
    bool _293 = _221 >= 0.0;
    bool _295 = isnan(_221);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    float _303 = 1.0 / _263;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _211 + _305;
    float _309 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _311 = _257 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _257 >= 0.0;
    bool _319 = isnan(_257);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _331 = _285 ? 0 : 1;
    float _333 = 1.0 / _253;
    float _335 = _307 * _267;
    int _337 = as_type<int>(_263);
    if (_219)
    {
        _337 = 0;
    }
    int _339 = _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _345 = _339;
    if (!_219)
    {
        _345 = 1;
    }
    int _347 = _345;
    float _349 = fma(_315, _335, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = fma(_291, _335, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _353 = _221 > 0.0;
    float _355 = _275 * _303;
    float _357 = _301 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _361 = _211 + _359;
    bool _363 = _347 != 1;
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    int _369 = ~_331;
    int _371 = _369 + 1;
    int _373 = _371 + 1;
    float _375 = _171 * _117;
    int _377 = _325 ? 0 : 1;
    float _379 = _361 * _333;
    int _381 = _373;
    float _383 = _357;
    float _385 = _379;
    if (!_271)
    {
        int _387 = ~_331;
        int _389 = _387 + 1;
        _381 = _389;
    }
    int _391 = _381;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = fma(_329, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _405 = _401;
    if (!_311)
    {
        int _407 = ~_377;
        int _409 = _407 + 1;
        _405 = _409;
    }
    int _411 = _405;
    float _413 = fma(_343, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _425 = _423 != 0;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    int _431 = ~as_type<int>(_357);
    int _433 = _431 + 1;
    int _435 = _433 + 1;
    float _437 = _367 * _117;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _441 = _435;
    if (!_353)
    {
        int _443 = ~as_type<int>(_357);
        int _445 = _443 + 1;
        _441 = _445;
    }
    int _447 = _441;
    if (!_363)
    {
        _383 = _159;
    }
    float _449 = _383;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _453 = !_421;
    int _455 = _453 ? 0 : 1;
    bool _457 = !_417;
    int _459 = _457 ? 0 : 1;
    bool _461 = !_425;
    int _463 = _461 ? 0 : 1;
    float _465 = _449;
    if (!_363)
    {
        _385 = _151;
    }
    float _467 = _385;
    float _469 = _467;
    if (_363)
    {
        _465 = _151;
    }
    float _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    float _485 = _471;
    if (_363)
    {
        _469 = _147;
    }
    float _487 = _469;
    float _489 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[83].w, _439);
    float _491 = float(_395);
    bool _493 = !_475;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[83].z, _451);
    float _499 = _487;
    if (!_363)
    {
        _485 = _159;
    }
    float _501 = _485;
    float _503 = 1.0 / _491;
    float _505 = _501;
    if (!_363)
    {
        _499 = _151;
    }
    float _507 = _499;
    float _509 = _507;
    if (_363)
    {
        _505 = _151;
    }
    float _511 = _505;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_363)
    {
        _509 = _147;
    }
    float _515 = _509;
    int _517 = abs(_495);
    float _519 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _521 = float(_411);
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _525 = float(_517);
    float _527 = -_117;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _239);
    float _531 = -_513;
    float _533 = fma(_523, 2.0, _531);
    bool _535 = !_479;
    int _537 = _535 ? 0 : 1;
    float _539 = _525 * _521;
    float _541 = exp2(_437);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _545 = float(_429);
    float _547 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _497);
    int _549 = abs(_537);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _553 = 1.0 + _551;
    float _555 = 1.0 / _545;
    float _557 = float(_447);
    float _559 = fma(_519, -2.0, _543);
    float _561 = float(_549);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = in.m_60.x;
    float _567 = in.m_60.y;
    float _569 = in.m_60.z;
    bool _571 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _579 = _575 || _577;
    float _581 = 1.0 / _553;
    float _583 = _561 * _557;
    float _585 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    float _587 = -_541;
    float _589 = _587 + 1.0;
    bool _591 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _599 = _595 || _597;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _603 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _605 = isnan(_211);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _249);
    bool _617 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _619 = isnan(_211);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].z, _601);
    float _631 = _599 ? _589 : 0.0;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _489);
    float _639 = _503 * _117;
    float _641 = _555 * _117;
    float _643 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _629);
    float _645 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _585);
    float _647 = -_117;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _533);
    float _651 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _559);
    if (_579)
    {
        float _653 = _631 * _581;
        _127 = _653;
    }
    float _655 = _127;
    bool _657 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _659 = isnan(_211);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = _627 * _635;
    bool _671 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _673 = isnan(_211);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -_627;
    float _685 = _683 + 1.0;
    bool _687 = !_483;
    int _689 = _687 ? 0 : 1;
    float _691 = _539 * (-2.0);
    float _693 = _147 + (-0.5);
    float _695 = _681 * _685;
    float _697 = -_681;
    float _699 = _697 + 1.0;
    int _701 = abs(_689);
    float _703 = fma(_691, _565, _565);
    float _705 = _583 * (-2.0);
    float _707 = _667 * _699;
    float _709 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[196].x, _703);
    float _711 = fma(_265, _691, _265);
    float _713 = _349 * _707;
    float _715 = float(_391);
    float _717 = fma(_309, _705, _309);
    float _719 = float(_701);
    float _721 = _351 * _707;
    float _723 = fma(_705, _567, _567);
    float _725 = _151 + (-0.5);
    float _727 = -_667;
    float _729 = _727 + 1.0;
    float _731 = _719 * _715;
    float _733 = fma(_711, _655, _709);
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[196].y, _723);
    float _737 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].y, _721);
    float _739 = _731 * (-2.0);
    float _741 = in.m_62.x;
    float _743 = in.m_62.y;
    float _745 = fma(_717, _655, _735);
    float _747 = _733 * 0.15915493667125701904296875;
    float _749 = fma(_739, _569, _569);
    float _751 = _159 + (-0.5);
    float _753 = _745 * 0.15915493667125701904296875;
    float _755 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[143].x, _713);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _761;
    float _765 = fma(_259, _739, _259);
    float _767 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _769 = fma(_759, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _771 = fma(_403, _695, _755);
    float _773 = in.m_44.x;
    float _775 = in.m_44.y;
    float _777 = in.m_44.z;
    float _779 = fma(_763, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _781 = fma(_413, _695, _737);
    float _783 = fma(_765, _655, _767);
    float _785 = in.m_64.x;
    float _787 = in.m_64.y;
    float _789 = in.m_64.z;
    float _791 = in.m_64.w;
    float _793 = fma(_769, _669, _771);
    float _795 = fma(_779, _669, _781);
    float _797 = _783 * 0.15915493667125701904296875;
    float _799 = _747 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].x, _793);
    float _805 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[146].y, _795);
    float _807 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _809 = _803 * _741;
    float _811 = _805 * _743;
    float _813 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _815 = _747 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _809 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _823 = _811 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _825 = _819 * _813;
    float _827 = in.m_66.x;
    float _829 = in.m_66.y;
    float _831 = in.m_66.z;
    float _833 = in.m_66.w;
    float _835 = _753 * 6.283185482025146484375;
    float _837 = sin(_835);
    float _839 = _823 * _821;
    float _841 = _775 * _787;
    float _843 = _753 * 6.283185482025146484375;
    float _845 = cos(_843);
    float _847 = fma(_773, _785, _841);
    float _849 = fma(_777, _789, _847);
    float _851 = _797 * 6.283185482025146484375;
    float _853 = cos(_851);
    float _855 = _801 * _837;
    float _857 = _849 + _791;
    float _859 = _775 * _829;
    float _861 = _797 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _817 * _845;
    float _867 = _801 * _845;
    float _869 = fma(_773, _827, _859);
    float _871 = _817 * _853;
    float _873 = _817 * _837;
    float _875 = _801 * _853;
    float _877 = _845 * _853;
    float _879 = _871 * _839;
    float _881 = _837 * _853;
    float _883 = fma(_863, _865, _855);
    float _885 = -_839;
    float _887 = _863 * _885;
    float _889 = -_867;
    float _891 = fma(_863, _873, _889);
    float _893 = -_873;
    float _895 = fma(_863, _867, _893);
    float _897 = fma(_883, _825, _879);
    float _899 = _875 * _839;
    float _901 = fma(_877, _825, _887);
    float _903 = fma(_863, _855, _865);
    float _905 = fma(_891, _807, _897);
    float _907 = fma(_895, _825, _899);
    float _909 = fma(_881, _807, _901);
    float _911 = _905 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _913 = fma(_903, _807, _907);
    float _915 = _905 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _917 = _905 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _919 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].x, _911);
    float _921 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].x, _915);
    float _923 = fma(_777, _831, _869);
    float _925 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].z, _919);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].x, _917);
    float _929 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = _923 + _833;
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = in.m_68.x;
    float _937 = in.m_68.y;
    float _939 = in.m_68.z;
    float _941 = in.m_68.w;
    float _943 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _945 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].z, _927);
    float _947 = _857 + _933;
    float _949 = _931 + _943;
    float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _953 = _947 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _957 = _949 + _955;
    float _959 = _953 * _953;
    float _961 = fma(_957, _957, _959);
    float _963 = sqrt(_961);
    float _965 = _775 * _937;
    float _967 = fma(_773, _935, _965);
    float _969 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _971 = fma(_777, _939, _967);
    bool _973 = _963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _975 = _971 + _941;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _987 = _985 != 0;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _991 = _989 != 0;
    float _993 = _975 + _969;
    bool _995 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _997 = isnan(0.5);
    bool _999 = _995 || _997;
    bool _1001 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1003 = _999 || _1001;
    bool _1005 = !_983;
    int _1007 = _1005 ? 0 : 1;
    bool _1009 = !_979;
    int _1011 = _1009 ? 0 : 1;
    bool _1013 = !_987;
    int _1015 = _1013 ? 0 : 1;
    bool _1017 = !_991;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = _969;
    float _1023 = _777;
    float _1025 = _775;
    float _1027 = _961;
    float _1029 = _947;
    if (!_973)
    {
        _1021 = _949;
    }
    float _1031 = _1021;
    float _1033 = _1031;
    if (!_973)
    {
        _1023 = _947;
    }
    float _1035 = _1023;
    float _1037 = _1035;
    if (!_973)
    {
        _1025 = _993;
    }
    float _1039 = _1025;
    bool _1041 = !_973;
    float _1043 = _1039;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _963 + _1047;
        float _1051 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = rsqrt(_961);
        float _1055 = _1049 * _1045;
        float _1057 = _1055 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_993, _1061, _1069);
        float _1075 = _1053 * _1071;
        float _1077 = fma(_957, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_953, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1033 = _1077;
        _1043 = _1073;
        _1037 = _1079;
        _1027 = _1053;
    }
    float _1081 = _1033;
    float _1083 = _1043;
    float _1085 = _1037;
    float _1087 = _1027;
    float _1089 = _1083;
    float _1091 = _1081;
    float _1093 = _1085;
    float _1095 = _1087;
    if (!_1003)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _975 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _931 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1107 = -_931;
        float _1109 = _1107 + _1081;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _857 + _1113;
        float _1117 = fma(_1103, _1103, _1111);
        float _1119 = fma(_1115, _1115, _1117);
        float _1121 = sqrt(_1119);
        float _1123 = precise::min(_1121, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1125 = _1123 * _1105;
        float _1127 = -_975;
        float _1129 = _1127 + _1083;
        float _1131 = -_857;
        float _1133 = _1131 + _1085;
        float _1135 = fma(_1109, _1125, _931);
        float _1137 = fma(_1129, _1125, _975);
        float _1139 = fma(_1133, _1125, _857);
        _1089 = _1137;
        _1091 = _1135;
        _1093 = _1139;
    }
    float _1141 = _1089;
    float _1143 = _1091;
    float _1145 = _1093;
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1141 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _1143 + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1157 = _1145 + _1155;
    float _1159 = _1149 * _1149;
    float _1161 = fma(_1153, _1153, _1159);
    float _1163 = fma(_1157, _1157, _1161);
    float _1165 = rsqrt(_1163);
    float _1167 = sqrt(_1163);
    float _1169 = _1165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1171 = _1153 * _1169;
    float _1173 = _1157 * _1169;
    float _1175 = _1171 * _1171;
    float _1177 = _1173 * _1173;
    float _1179 = _1175 + _1177;
    float _1181 = sqrt(_1179);
    bool _1183 = _1181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1187 = _1181 + _1185;
    float _1189 = _945;
    float _1191 = _1179;
    float _1193 = _1187;
    float _1195 = _1149;
    float _1197 = _1171;
    float _1199 = _1173;
    float _1201 = _1177;
    if (_1183)
    {
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1189 = _1203;
    }
    float _1205 = _1189;
    if (_1183)
    {
        float _1207 = rsqrt(_1179);
        _1191 = _1207;
    }
    float _1209 = _1191;
    if (_1183)
    {
        float _1211 = _1187 * _1205;
        _1193 = _1211;
    }
    float _1213 = _1193;
    if (_1183)
    {
        float _1215 = _1213 * 0.15915493667125701904296875;
        _1095 = _1215;
    }
    float _1217 = _1095;
    float _1219 = _913;
    if (_1183)
    {
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = sin(_1221);
        _1219 = _1223;
    }
    float _1225 = _1219;
    float _1227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1229 = precise::max(0.0, _1227);
    float _1231 = _1205;
    float _1233 = _1229;
    if (_1183)
    {
        float _1235 = _1217 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1231 = _1237;
    }
    float _1239 = _1231;
    float _1241 = -_1169;
    float _1243 = -_1229;
    float _1245 = fma(_1149, _1241, _1243);
    if (_1183)
    {
        float _1247 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1195 = _1247;
    }
    float _1249 = _1195;
    float _1251 = _1225;
    float _1253 = _1249;
    if (_1183)
    {
        float _1255 = fma(_1225, _1249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1251 = _1255;
    }
    float _1257 = _1251;
    float _1259 = _1257;
    if (!_1183)
    {
        _1253 = _1245;
    }
    float _1261 = _1253;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1265 = fma(_1167, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1263);
    float _1267 = precise::clamp(_1265, 0.0, 1.0);
    float _1269 = _1261;
    if (_1183)
    {
        float _1271 = _1239 + (-1.0);
        _1233 = _1271;
    }
    float _1273 = _1233;
    float _1275 = _1273;
    if (_1183)
    {
        float _1277 = _1209 * _1257;
        _1029 = _1277;
    }
    float _1279 = _1029;
    float _1281 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1283 = -_1267;
    float _1285 = _1283 + 1.0;
    if (_1183)
    {
        float _1287 = _1273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1287;
    }
    float _1289 = _1259;
    if (_1183)
    {
        float _1291 = _1171 * _1279;
        _1197 = _1291;
    }
    float _1293 = _1197;
    if (!_1183)
    {
        _1275 = _1175;
    }
    float _1295 = _1275;
    float _1297 = _1295;
    if (_1183)
    {
        float _1299 = _1173 * _1279;
        _1199 = _1299;
    }
    float _1301 = _1199;
    if (_1183)
    {
        float _1303 = fma(_1245, _1239, _1289);
        _1269 = _1303;
    }
    float _1305 = _1269;
    if (_1183)
    {
        float _1307 = _1293 * _1293;
        _1297 = _1307;
    }
    float _1309 = _1297;
    float _1311 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1183)
    {
        float _1313 = _1301 * _1301;
        _1201 = _1313;
    }
    float _1315 = _1201;
    float _1317 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1281);
    float _1319 = fma(_1305, _1305, _1309);
    float _1321 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1311);
    float _1323 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1325 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    float _1327 = _1319 + _1315;
    float _1329 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1331 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1333 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1335 = abs(_1285);
    float _1337 = log2(_1335);
    float _1339 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1329);
    float _1341 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1343 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1339);
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = rsqrt(_1327);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1359 = -_1351;
    float _1361 = fma(_1359, _1323, 1.0);
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1349);
    float _1365 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1357);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1369 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1373 = log2(_1361);
    float _1375 = _1353 * _1293;
    float _1377 = _1353 * _1305;
    float _1379 = _1353 * _1301;
    float _1381 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1367);
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1385 = exp2(_1371);
    float _1387 = _1377 + 1.0;
    float _1389 = -_1383;
    float _1391 = fma(_1377, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1389);
    float _1393 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    float _1395 = -_1379;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1391);
    float _1399 = 1.0 / _1381;
    float _1401 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1403 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1393);
    float _1405 = fma(_1397, -0.5, 0.5);
    float _1407 = fma(_1397, 0.5, 0.5);
    float _1409 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1401);
    float _1411 = fma(_1407, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1413 = sqrt(_1405);
    float _1415 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1409);
    float _1417 = -_1377;
    float _1419 = fma(_1385, _1387, _1417);
    float _1421 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1403);
    float _1423 = fma(_1407, _1411, -0.212114393711090087890625);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1427 = _1373 * 0.693147182464599609375;
    float _1429 = _1421 * _1399;
    float _1431 = fma(_1407, _1423, 1.570728778839111328125);
    float _1433 = _1425 * _1399;
    float _1435 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1437 = fma(_1429, -0.5, 0.5);
    float _1439 = fma(_1419, 0.5, 0.5);
    float _1441 = fma(_1433, 0.5, 0.5);
    float _1443 = _1413 * 0.636619746685028076171875;
    float _1445 = -_1431;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _5161 = float3(_1441, _1437, _1435);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5161, float3(0.0), isnan(_5161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5161, float3(0.0), isnan(_5161)), level(0.0)).x;
    float3 _5172 = float3(_1441, _1437, _1435);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _5189 = float2(_1447, _1439);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5189, float2(0.0), isnan(_5189)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5189, float2(0.0), isnan(_5189)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1478 = _1476 != 0;
    float _1480 = -_645;
    float _1482 = _1480 + 1.0;
    bool _1484 = _159 > 0.5;
    float _1486 = -_547;
    float _1488 = _1486 + 1.0;
    bool _1490 = _147 > 0.5;
    out.m_70.x = _931;
    out.m_70.y = _975;
    out.m_70.z = _857;
    bool _1492 = _151 > 0.5;
    float _1494 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1496 = int(_1494);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1500 = _1498 != 0;
    float _1502 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1504 = abs(_455);
    out.m_72.x = _1143;
    out.m_72.y = _1141;
    out.m_72.z = _1145;
    int _1506 = abs(_459);
    float _1508 = 0.0;
    if (_1478)
    {
        _1508 = 1.0;
    }
    float _1510 = _1508;
    float _1512 = trunc(_639);
    int _1514 = int(_1512);
    float _1516 = float(uint(_1474));
    float _1518 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = _1510;
    if (!_1478)
    {
        _1520 = 1.2345600128173828125;
    }
    float _1522 = _1520;
    float _1524 = 0.0;
    if (_1478)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1478)
    {
        _1528 = 7.345489978790283203125;
    }
    float _1530 = _1528;
    float _1532 = 1.0 / _1516;
    float _1534 = float(uint(_1496));
    int _1536 = ~_1496;
    int _1538 = _1536 + 1;
    float _1540 = _1530 * _147;
    int _1542 = ~_1474;
    int _1544 = _1542 + 1;
    int _1546 = abs(_1015);
    float _1548 = 1.0 / _1534;
    float _1550 = float(uint(_1514));
    int _1552 = ~_1496;
    int _1554 = _1552 + 1;
    float _1556 = trunc(_641);
    int _1558 = int(_1556);
    int _1560 = as_type<int>(_1532) + (-2);
    float _1562 = as_type<float>(_1560) * _1550;
    int _1564 = ~_1474;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1502);
    int _1570 = as_type<int>(_1548) + (-2);
    float _1572 = float(uint(_1558));
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    float _1581 = as_type<float>(_1570) * _1572;
    float _1583 = _1572;
    if (_1478)
    {
        _1583 = _147;
    }
    float _1585 = _1583;
    float _1587 = _1585;
    if (!_1478)
    {
        _1587 = _151;
    }
    float _1589 = _1587;
    float _1591 = floor(_1540);
    float _1593 = float(_1514);
    float _1595 = -_1568;
    float _1597 = _1595 + 1.0;
    float _1599 = _1522 * _1589;
    float _1601 = trunc(_1581);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    int _1607 = _1566 * int(_1579);
    int _1609 = _1607 + _1514;
    float _1611 = float(uint(_1609));
    float _1613 = floor(_1599);
    float _1615 = -_1591;
    float _1617 = _1540 + _1615;
    float _1619 = as_type<float>(_1560) * _1611;
    float _1621 = float(_1474);
    int _1623 = _1538 * int(_1605);
    int _1625 = _1623 + _1558;
    float _1627 = trunc(_1619);
    float _1629 = precise::max(_1627, 0.0);
    uint _1631 = uint(_1629);
    bool _1633 = _1593 >= _1621;
    bool _1635 = isnan(_1593);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(_1621);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = _1617 * _1621;
    int _1647 = ~_1496;
    int _1649 = _1647 + 1;
    float _1651 = _1621 * _375;
    float _1653 = float(uint(_1625));
    float _1655 = -_1613;
    float _1657 = _1599 + _1655;
    float _1659 = trunc(_1645);
    int _1661 = int(_1659);
    float _1663 = as_type<float>(_1570) * _1653;
    float _1665 = trunc(_1663);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    int _1671 = int(_1579) + int(_1631);
    int _1673 = _1544 * _1671;
    int _1675 = _1673 + _1514;
    int _1677 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1679 = _1677 != 0;
    float _1681 = trunc(_1651);
    int _1683 = int(_1681);
    bool _1685 = uint(_1675) >= uint(_1474);
    float _1687 = float(_1558);
    int _1689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1691 = _1689 != 0;
    int _1693 = int(_1605) + int(_1669);
    float _1695 = float(_1496);
    float _1697 = trunc(_1643);
    int _1699 = int(_1697);
    bool _1701 = !_1691;
    int _1703 = _1701 ? 0 : 1;
    int _1705 = _1649 * _1693;
    int _1707 = _1705 + _1558;
    bool _1709 = _1687 >= _1695;
    bool _1711 = isnan(_1687);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(_1695);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = _1695 * _375;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1725 = _1723 != 0;
    int _1727 = abs(_1703);
    float _1729 = _1657 * _1695;
    bool _1731 = !_1685;
    int _1733 = _1731 ? 0 : (-1);
    float _1735 = trunc(_1719);
    int _1737 = int(_1735);
    bool _1739 = uint(_1707) >= uint(_1496);
    int _1741 = ~_1671;
    int _1743 = _1741 + _1733;
    int _1745 = _1743 + 1;
    bool _1747 = !_1739;
    int _1749 = _1747 ? 0 : (-1);
    bool _1751 = !_1725;
    int _1753 = _1751 ? 0 : 1;
    float _1755 = trunc(_1721);
    int _1757 = int(_1755);
    int _1759 = ~_1693;
    int _1761 = _1759 + _1749;
    int _1763 = _1761 + 1;
    int _1765 = _1661 * _1727;
    int _1767 = _1765 + _1514;
    bool _1769 = _1474 == 0;
    int _1771 = _1474 * _1745;
    int _1773 = _1771 + _1514;
    int _1775 = abs(_1753);
    int _1777 = _1496 * _1763;
    int _1779 = _1777 + _1558;
    bool _1781 = _1496 == 0;
    float _1783 = trunc(_1729);
    int _1785 = int(_1783);
    bool _1787 = !_1769;
    int _1789 = _1787 ? _1773 : (-1);
    int _1791 = ~_1737;
    int _1793 = _1791 + 1;
    int _1795 = _1793 + 1;
    bool _1797 = !_1781;
    int _1799 = _1797 ? _1779 : (-1);
    int _1801 = ~_1699;
    int _1803 = _1801 + 1;
    int _1805 = _1803 + 1;
    int _1807 = _1496 + (-1);
    int _1809 = _1799 * _1795;
    int _1811 = ~_1496;
    int _1813 = _1811 + 1;
    int _1815 = _1789 * _1805;
    int _1817 = _1474 + (-1);
    int _1819 = _1737 * _1807;
    int _1821 = _1819 + _1809;
    float _1823 = in.m_53.w;
    int _1825 = _1785 * _1775;
    int _1827 = _1825 + _1558;
    int _1829 = _1699 * _1817;
    int _1831 = _1829 + _1815;
    int _1833 = abs(_1007);
    int _1835 = abs(_1011);
    int _1837 = _1831 * _1504;
    int _1839 = abs(_463);
    int _1841 = _1821 * _1833;
    int _1843 = _1683 * _1506;
    int _1845 = _1843 + _1837;
    bool _1847 = !_1500;
    int _1849 = _1847 ? 0 : 1;
    int _1851 = _1757 * _1835;
    int _1853 = _1851 + _1841;
    float _1855 = float(uint(_1767));
    int _1857 = _1767 * _1839;
    int _1859 = _1857 + _1845;
    int _1861 = abs(_1849);
    int _1863 = _1827 * _1546;
    int _1865 = _1863 + _1853;
    float _1867 = float(uint(_1827));
    float _1869 = as_type<float>(_1560) * _1855;
    int _1871 = abs(_1019);
    int _1873 = _1661 * _1861;
    int _1875 = _1873 + _1859;
    float _1877 = -_187;
    int _1879 = _1490 ? as_type<int>(_1877) : as_type<int>(_187);
    float _1881 = as_type<float>(_1570) * _1867;
    bool _1883 = _1823 > 0.5;
    int _1885 = _1785 * _1871;
    int _1887 = _1885 + _1865;
    float _1889 = float(uint(_1875));
    float _1891 = trunc(_1869);
    float _1893 = precise::max(_1891, 0.0);
    uint _1895 = uint(_1893);
    bool _1897 = !_1679;
    float _1899 = _1897 ? _187 : as_type<float>(_1879);
    float _1901 = float(uint(_1887));
    float _1903 = as_type<float>(_1560) * _1889;
    int _1905 = ~_1474;
    int _1907 = _1905 + 1;
    float _1909 = _1899 + 0.5;
    float _1911 = -_187;
    int _1913 = _1484 ? as_type<int>(_1911) : as_type<int>(_187);
    float _1915 = trunc(_1881);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1570) * _1901;
    float _1923 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[80].x, _529);
    int _1925 = ~_1474;
    int _1927 = _1925 + 1;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1931 = _1929 != 0;
    float _1933 = -_191;
    int _1935 = _1492 ? as_type<int>(_1933) : as_type<int>(_191);
    float _1937 = trunc(_1903);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    int _1943 = _1927 * int(_1895);
    int _1945 = _1943 + _1767;
    int _1947 = ~_1496;
    int _1949 = _1947 + 1;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1953 = _1951 != 0;
    float _1955 = float(uint(_1945));
    float _1957 = trunc(_1921);
    float _1959 = precise::max(_1957, 0.0);
    uint _1961 = uint(_1959);
    int _1963 = _1813 * int(_1919);
    int _1965 = _1963 + _1827;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1969 = _1967 != 0;
    float _1971 = as_type<float>(_1560) * _1955;
    float _1973 = -_191;
    int _1975 = _1883 ? as_type<int>(_1973) : as_type<int>(_191);
    float _1977 = float(uint(_1965));
    int _1979 = _1907 * int(_1941);
    int _1981 = _1979 + _1875;
    bool _1983 = !_1931;
    float _1985 = _1983 ? _187 : as_type<float>(_1913);
    float _1987 = as_type<float>(_1570) * _1977;
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = float(uint(_1981));
    float _1997 = _1985 + 0.5;
    bool _1999 = !_1953;
    float _2001 = _1999 ? _191 : as_type<float>(_1935);
    int _2003 = _1949 * int(_1961);
    int _2005 = _2003 + _1887;
    bool _2007 = !_1969;
    float _2009 = _2007 ? _191 : as_type<float>(_1975);
    float _2011 = as_type<float>(_1560) * _1995;
    float _2013 = fma(_1997, (*spvDescriptorSet0.vp_c9)._m0[85].x, _649);
    float _2015 = trunc(_1987);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    float _2021 = float(uint(_2005));
    float _2023 = _2001 + (-0.5);
    float _2025 = _2009 + (-0.5);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2029 = _2027 != 0;
    float _2031 = as_type<float>(_1570) * _2021;
    float _2033 = -_643;
    float _2035 = _2033 + 1.0;
    float _2037 = trunc(_2011);
    float _2039 = precise::max(_2037, 0.0);
    uint _2041 = uint(_2039);
    float _2043 = -_2023;
    float _2045 = -_615;
    float _2047 = fma(_2043, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2045);
    float _2049 = -_2025;
    float _2051 = -_651;
    float _2053 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2051);
    float _2055 = -_637;
    float _2057 = _2055 + 1.0;
    float _2059 = -_2035;
    float _2061 = fma(_1899, _2059, _1923);
    float _2063 = fma(_2001, _1482, _2047);
    float _2065 = -_1488;
    float _2067 = fma(_1985, _2065, _2013);
    float _2069 = fma(_2009, _2057, _2053);
    float _2071 = trunc(_2031);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2079 = _2077 != 0;
    float _2081 = _871 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2083 = int(_1895) + int(_1993);
    float _2085 = _871 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2087 = int(_1919) + int(_2019);
    out.m_74.x = _2061;
    out.m_74.y = _2063;
    out.m_74.z = _2067;
    out.m_74.w = _2069;
    int _2089 = ~_1496;
    int _2091 = _2089 + 1;
    float _2093 = -_863;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2085);
    int _2097 = int(_1941) + int(_2041);
    float _2099 = _871 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2101 = ~_1474;
    int _2103 = _2101 + 1;
    int _2105 = _1554 * _2087;
    int _2107 = _2105 + _1827;
    float _2109 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2111 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2095);
    int _2113 = ~_1474;
    int _2115 = _2113 + 1;
    int _2117 = int(_1961) + int(_2075);
    bool _2119 = uint(_2107) >= uint(_1496);
    float _2121 = -_863;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2125 = -_863;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2099);
    int _2129 = _2103 * _2097;
    int _2131 = _2129 + _1875;
    float _2133 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2135 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2123);
    float _2137 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2139 = _2091 * _2117;
    int _2141 = _2139 + _1887;
    bool _2143 = uint(_2131) >= uint(_1474);
    float _2145 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2133);
    float _2147 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2137);
    float _2149 = _891 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2151 = uint(_2141) >= uint(_1496);
    float _2153 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2155 = !_2143;
    int _2157 = _2155 ? 0 : (-1);
    int _2159 = _2115 * _2083;
    int _2161 = _2159 + _1767;
    bool _2163 = !_2151;
    int _2165 = _2163 ? 0 : (-1);
    float _2167 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2149);
    int _2169 = ~_2097;
    int _2171 = _2169 + _2157;
    int _2173 = _2171 + 1;
    float _2175 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    int _2177 = ~_2117;
    int _2179 = _2177 + _2165;
    int _2181 = _2179 + 1;
    float _2183 = _891 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2185 = uint(_2161) >= uint(_1474);
    int _2187 = _1474 * _2173;
    int _2189 = _2187 + _1875;
    float _2191 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2167);
    int _2193 = _1496 * _2181;
    int _2195 = _2193 + _1887;
    float _2197 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2199 = _891 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2201 = !_1769;
    int _2203 = _2201 ? _2189 : (-1);
    float _2205 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    bool _2207 = !_1781;
    int _2209 = _2207 ? _2195 : (-1);
    float _2211 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    int _2213 = _2203 >> 31;
    float _2215 = _1518 * _2135;
    int _2217 = _2209 >> 31;
    float _2219 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2147);
    int _2221 = _2213 & 3;
    float _2223 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2205);
    int _2225 = _2217 & 3;
    float _2227 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2211);
    int _2229 = _2203 + _2221;
    float _2231 = fma(_2109, _2219, _2215);
    int _2233 = _2209 + _2225;
    float _2235 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2145);
    int _2237 = _2229 >> 2;
    float _2239 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2175);
    int _2241 = _2203 & 3;
    bool _2243 = _2241 != 0;
    float _2245 = _1518 * _2111;
    int _2247 = _2237 << 4;
    int _2249 = _2247 + 368;
    int _2251 = _2233 >> 2;
    out.m_76.x = _2235;
    out.m_76.y = _2219;
    out.m_76.z = _2239;
    int _2253 = _2243 ? 0 : 1;
    uint _2255 = uint(int(uint(_2249) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = _2203 & 3;
    bool _2273 = _2271 != 0;
    float _2275 = fma(_2109, _2235, _2245);
    int _2277 = _2251 << 4;
    int _2279 = _2277 + 512;
    bool _2281 = !_2185;
    int _2283 = _2281 ? 0 : (-1);
    bool _2285 = uint(_2271) >= 2u;
    uint _2287 = uint(int(uint(_2279) >> uint(2)));
    uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
    int _2291 = int(_2287) & 3;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[int(_2289)][_2291];
    int _2295 = int(_2287) + 1;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    int _2299 = _2295 & 3;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[int(_2297)][_2299];
    bool _2303 = !_2119;
    int _2305 = _2303 ? 0 : (-1);
    float _2307 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2309 = _2285 ? 0 : 1;
    bool _2311 = uint(_2271) > 1u;
    bool _2313 = _2271 != 3;
    int _2315 = _2249 + 8;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = ~_2083;
    int _2335 = _2333 + _2283;
    int _2337 = _2335 + 1;
    int _2339 = ~_2253;
    int _2341 = _2339 + 1;
    int _2343 = _2341 + 1;
    int _2345 = ~_2087;
    int _2347 = _2345 + _2305;
    int _2349 = _2347 + 1;
    float _2351 = _1518 * _2197;
    int _2353 = ~_2309;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = _1474 * _2337;
    int _2361 = _2359 + _1767;
    int _2363 = _2343;
    int _2365 = _2357;
    float _2367 = _2135;
    if (!_2311)
    {
        int _2369 = ~_2253;
        int _2371 = _2369 + 1;
        _2363 = _2371;
    }
    int _2373 = _2363;
    int _2375 = _1496 * _2349;
    int _2377 = _2375 + _1827;
    int _2379 = _2209 & 3;
    bool _2381 = _2379 != 0;
    if (_2313)
    {
        int _2383 = ~_2309;
        int _2385 = _2383 + 1;
        _2365 = _2385;
    }
    int _2387 = _2365;
    bool _2389 = !_2273;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2209 & 3;
    bool _2395 = _2393 != 0;
    float _2397 = fma(_2109, _2239, _2351);
    bool _2399 = uint(_2379) > 1u;
    float _2401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2307);
    int _2403 = _2395 ? 0 : 1;
    int _2405 = _2279 + 8;
    uint _2407 = uint(int(uint(_2405) >> uint(2)));
    uint _2409 = uint(int(uint(int(_2407)) >> uint(2)));
    int _2411 = int(_2407) & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = int(_2407) + 1;
    uint _2417 = uint(int(uint(_2415) >> uint(2)));
    int _2419 = _2415 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[int(_2417)][_2419];
    bool _2423 = _2271 != 3;
    float _2425 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2401);
    int _2427 = ~_2403;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_2381;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = uint(_2379) >= 2u;
    bool _2439 = !_1769;
    int _2441 = _2439 ? _2361 : (-1);
    int _2443 = _2431;
    if (!_2399)
    {
        int _2445 = ~_2403;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    int _2451 = abs(_2373);
    bool _2453 = _2379 != 3;
    int _2455 = ~_2451;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    int _2461 = abs(_2449);
    int _2463 = abs(_2391);
    int _2465 = _2459 * as_type<int>(_2269);
    int _2467 = abs(_2435);
    int _2469 = abs(_2387);
    int _2471 = ~_2461;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = ~_2463;
    int _2479 = _2477 + 1;
    int _2481 = _2479 + 1;
    int _2483 = _2475 * as_type<int>(_2301);
    int _2485 = _2437 ? 0 : 1;
    int _2487 = _2481 * as_type<int>(_2261);
    int _2489 = _2487 + _2465;
    int _2491 = ~_2467;
    int _2493 = _2491 + 1;
    int _2495 = _2493 + 1;
    int _2497 = ~_2469;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = fma(_1518, _1518, 1.0);
    int _2505 = ~_2485;
    int _2507 = _2505 + 1;
    int _2509 = _2507 + 1;
    int _2511 = _2495 * as_type<int>(_2293);
    int _2513 = _2511 + _2483;
    int _2515 = _2509;
    if (_2453)
    {
        int _2517 = ~_2485;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2501 * as_type<int>(_2323);
    int _2525 = _2523 + _2489;
    bool _2527 = _2379 != 3;
    float _2529 = rsqrt(_2503);
    bool _2531 = !_2029;
    int _2533 = _2531 ? 0 : 1;
    bool _2535 = !_2423;
    int _2537 = _2535 ? 0 : (-1);
    int _2539 = abs(_2521);
    bool _2541 = !_2527;
    int _2543 = _2541 ? 0 : (-1);
    int _2545 = abs(_2533);
    int _2547 = abs(_2537);
    bool _2549 = !_2079;
    int _2551 = _2549 ? 0 : 1;
    int _2553 = abs(_2543);
    int _2555 = abs(_2551);
    int _2557 = ~_2539;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = ~_2547;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    int _2569 = _2561 * as_type<int>(_2413);
    int _2571 = _2569 + _2513;
    int _2573 = ~_2553;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = ~_2545;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2567 * as_type<int>(_2331);
    int _2587 = _2585 + _2525;
    int _2589 = ~_2555;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = _2577 * as_type<int>(_2421);
    int _2597 = _2595 + _2571;
    float _2599 = _1518 * _2529;
    int _2601 = _2587 * _2583;
    float _2603 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2605 = _2597 * _2593;
    float _2607 = -_2191;
    float _2609 = _2599 * _2607;
    int _2611 = _2441 * _2545;
    int _2613 = _2611 + _2601;
    float _2615 = -_2223;
    float _2617 = _2599 * _2615;
    float _2619 = -_2227;
    float _2621 = _2599 * _2619;
    float _2623 = _2603 * _1449;
    float _2625 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2425);
    float _2627 = fma(_2529, _2135, _2609);
    bool _2629 = !_1781;
    int _2631 = _2629 ? _2377 : (-1);
    float _2633 = fma(_2529, _2111, _2617);
    float _2635 = _1381 * 0.5;
    float _2637 = fma(_2529, _2197, _2621);
    float _2639 = _1460 * _2623;
    float _2641 = _2625 + _1381;
    float _2643 = _1425 + _1381;
    float _2645 = -_2603;
    float _2647 = _2645 + 1.0;
    float _2649 = _1470 * _2623;
    float _2651 = fma(_1421, -0.5, _2635);
    int _2653 = _2631 * _2555;
    int _2655 = _2653 + _2605;
    float _2657 = float(_2613);
    float _2659 = _2191 + _2231;
    float _2661 = fma(_1466, _2639, _1454);
    float _2663 = _2641 * 0.5;
    float _2665 = _2643 * 0.5;
    float _2667 = _2223 + _2275;
    float _2669 = _2227 + _2397;
    float _2671 = fma(_1468, _2639, _1456);
    float _2673 = _1460 * _2647;
    float _2675 = fma(_1460, _2649, _1458);
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1421;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1381;
    bool _2677 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2679 = isnan(_1167);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2655);
    out.m_78.x = _2665;
    out.m_78.y = _2651;
    out.m_78.z = _2663;
    out.m_78.w = _1381;
    out.m_80.x = _2661;
    out.m_80.y = _2671;
    out.m_80.z = _2675;
    out.m_80.w = _2673;
    out.m_82.x = _2667;
    out.m_82.y = _2659;
    out.m_82.z = _2669;
    float _2689 = _2637;
    float _2691 = _2627;
    float _2693 = _2633;
    float _2695 = _2687;
    float _2697 = _2657;
    if (!_2685)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2699 = _2367;
    out.m_84.x = _2633;
    out.m_84.y = _2627;
    out.m_84.z = _2637;
    out.m_86.x = _2657;
    out.m_86.y = _2687;
    float _2701 = _2699;
    float _2703 = _2699;
    if (!_2685)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    float _2709 = _2705;
    if (!_2685)
    {
        _2691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2711 = _2691;
    float _2713 = _2711;
    float _2715 = _2711;
    if (!_2685)
    {
        _2693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2717 = _2693;
    float _2719 = _2717;
    float _2721 = _2717;
    if (!_2685)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2723 = _2695;
    float _2725 = _2723;
    float _2727 = _2723;
    if (!_2685)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2729 = _2697;
    bool _2731 = !_2685;
    float _2733 = _2729;
    float _2735 = _2729;
    if (!_2731)
    {
        bool _2737 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2739 = isnan(_1167);
        bool _2741 = _2737 || _2739;
        bool _2743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2745 = _2741 || _2743;
        if (!_2745)
        {
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2749 = _1167 + _2747;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2753 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2751;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2759 = 1.0 / _2753;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2771 = _2769 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2777 = _2749 * _2759;
            float _2779 = precise::clamp(_2777, 0.0, 1.0);
            float _2781 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2785 = fma(_2779, _2757, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2787 = fma(_2779, _2783, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2789 = fma(_2779, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2791 = fma(_2779, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2793 = fma(_2779, _2771, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2795 = fma(_2779, _2775, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2709 = _2789;
            _2727 = _2793;
            _2703 = _2785;
            _2721 = _2791;
            _2715 = _2787;
            _2735 = _2795;
            _2797 = true;
        }
        else
        {
            bool _2799 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2801 = isnan(_1167);
            bool _2803 = _2799 || _2801;
            bool _2805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2807 = _2803 || _2805;
            if (!_2807)
            {
                _2701 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2809 = _2701;
            _2703 = _2809;
            if (!_2807)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2811 = _2707;
            _2709 = _2811;
            if (!_2807)
            {
                _2713 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2813 = _2713;
            _2715 = _2813;
            if (!_2807)
            {
                _2719 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2815 = _2719;
            _2721 = _2815;
            if (!_2807)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2817 = _2725;
            _2727 = _2817;
            if (!_2807)
            {
                _2733 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2819 = _2733;
            bool _2821 = !_2807;
            _2735 = _2819;
            if (!_2821)
            {
                bool _2823 = _1167 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2825 = isnan(_1167);
                bool _2827 = _2823 || _2825;
                bool _2829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2831 = _2827 || _2829;
                if (!_2831)
                {
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2835 = _1167 + _2833;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2839 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2837;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2845 = 1.0 / _2839;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2863 = _2835 * _2845;
                    float _2865 = precise::clamp(_2863, 0.0, 1.0);
                    float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2869 = _2867 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2871 = fma(_2865, _2843, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2873 = fma(_2865, _2869, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2875 = fma(_2865, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2877 = fma(_2865, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2879 = fma(_2865, _2857, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2881 = fma(_2865, _2861, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2709 = _2875;
                    _2727 = _2879;
                    _2703 = _2871;
                    _2721 = _2877;
                    _2715 = _2873;
                    _2735 = _2881;
                    _2797 = true;
                }
                else
                {
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2703 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2721 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2715 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2735 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2797 = false;
    float _2883 = _2709;
    float _2885 = _2727;
    float _2887 = _2703;
    float _2889 = _2721;
    float _2891 = _2715;
    float _2893 = _2735;
    float _2895 = fma(_2659, -0.5, 0.5);
    float _2897 = precise::clamp(_2895, 0.0, 1.0);
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = -_2887;
    float _2905 = _2903 + _2889;
    float _2907 = -_2891;
    float _2909 = _2907 + _2893;
    bool _2911 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2913 = fma(_2897, _2901, _2883);
    float _2915 = fma(_2897, _2905, _2887);
    float _2917 = fma(_2897, _2909, _2891);
    float _2919 = _2913 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2921 = fma(_2915, 0.298911988735198974609375, _2919);
    float _2923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2925 = fma(_2917, 0.114477999508380889892578125, _2921);
    out.m_88.w = _2923;
    float _2927 = -_2925;
    float _2929 = _2913 + _2927;
    float _2931 = -_2925;
    float _2933 = _2915 + _2931;
    float _2935 = -_2925;
    float _2937 = _2917 + _2935;
    out.m_90.x = 0.0;
    float _2939 = fma(_2929, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2941 = fma(_2933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2925);
    out.m_92.x = _2941;
    out.m_92.y = _2939;
    out.m_92.z = _2943;
    if (!_2911)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2945 = -_1141;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2949 = -_1143;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2953 = -_1145;
    float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2957 = _2947 * _2947;
    float _2959 = fma(_2951, _2951, _2957);
    float _2961 = fma(_2955, _2955, _2959);
    float _2963 = sqrt(_2961);
    float _2965 = rsqrt(_2961);
    float _2967 = -_2963;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2971 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2951 * _2965;
    float _2977 = _2947 * _2965;
    float _2979 = abs(_2973);
    float _2981 = log2(_2979);
    float _2983 = _2955 * _2965;
    float _2985 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2987 = _2659 * _2977;
    float _2989 = -_2977;
    float _2991 = -_2985;
    float _2993 = fma(_2989, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2991);
    float _2995 = fma(_2667, _2975, _2987);
    float _2997 = -_2983;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2993);
    float _3001 = fma(_2669, _2983, _2995);
    float _3003 = precise::clamp(_3001, 0.0, 1.0);
    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3007 = _2999 + _3005;
    float _3009 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3011 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3013 = precise::clamp(_3011, 0.0, 1.0);
    float _3015 = exp2(_3009);
    float _3017 = _3015 * _3013;
    float _3019 = _3003 * _3017;
    float _3021 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3023 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3025 = _3019 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3021;
    out.m_90.y = _3023;
    out.m_90.z = _3025;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

