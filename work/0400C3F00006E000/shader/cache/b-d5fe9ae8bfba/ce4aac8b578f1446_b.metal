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
    float4 m_88 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_80 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_46 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2929 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = in.m_46.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_51.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_137);
        out.gl_Position.z = _3226;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_53.x;
    float _153 = float(_115);
    float _155 = in.m_53.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_53.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_55.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3289 = as_type<float>(_169);
        out.gl_Position.z = _3289;
    }
    out.m_55.y = _155;
    out.m_55.z = _163;
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / _153;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = _119 * _173;
    int _201 = as_type<int>(_171) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_171) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_207;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _177 * _183;
    float _217 = _177 * _189;
    float _219 = fma(_175, _181, _215);
    float _221 = _177 * _195;
    float _223 = fma(_175, _187, _217);
    float _225 = fma(_179, _185, _219);
    float _227 = fma(_175, _193, _221);
    float _229 = fma(_179, _191, _223);
    bool _231 = !_203;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_179, _197, _227);
    bool _237 = !_209;
    float _239 = _199;
    float _241 = _187;
    float _243 = _191;
    float _245 = _229;
    if (!_237)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _239 = _259;
    }
    float _261 = _239;
    float _263 = _151 * 2.0;
    float _265 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _267 = _155 * 2.0;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = floor(_263);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = -_269;
    float _279 = fma(_265, 2.0, _277);
    float _281 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _163 * 2.0;
    float _289 = floor(_267);
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = _173 * _119;
    float _299 = fma(_281, -2.0, _291);
    float _301 = _151 + _163;
    float _303 = 1.0 / _285;
    float _305 = _151 + _155;
    float _307 = _301 + (-1.0);
    bool _309 = _271 >= 0.0;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan(0.0);
    bool _317 = _313 || _315;
    float _319 = _305 + (-1.0);
    bool _321 = _271 > 0.0;
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _325 = floor(_287);
    float _327 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    int _333 = as_type<int>(_307);
    if (_275)
    {
        _333 = 0;
    }
    int _335 = _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _261 + _337;
    int _341 = _335;
    if (!_275)
    {
        _341 = 1;
    }
    int _343 = _341;
    float _345 = -_119;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _349 = _317 ? 0 : 1;
    float _351 = 1.0 / _295;
    bool _353 = _289 > 0.0;
    float _355 = _339 * _303;
    bool _357 = _289 >= 0.0;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    bool _367 = _343 != 1;
    float _369 = 1.0 / _331;
    float _371 = _155 + _163;
    float _373 = _371 + (-1.0);
    bool _375 = _325 > 0.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _383 = int(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _391 = _325 >= 0.0;
    bool _393 = isnan(_325);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _261 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _261 + _413;
    float _417 = fma(_403, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = fma(_407, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = _411 * _351;
    float _423 = _415 * _369;
    int _425 = _399 ? 0 : 1;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    float _431 = _411;
    if (!_367)
    {
        _431 = _155;
    }
    float _433 = _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _437 = _433;
    if (_367)
    {
        _437 = _151;
    }
    float _439 = _437;
    float _441 = fma(_379, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = fma(_387, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _445 = ~_425;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _435);
    int _453 = _449;
    float _455 = _439;
    if (!_375)
    {
        int _457 = ~_425;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    float _467 = float(_383);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_383);
    if (!_367)
    {
        _481 = _155;
    }
    float _483 = _481;
    float _485 = 1.0 / _467;
    float _487 = _483;
    if (_367)
    {
        _487 = _151;
    }
    float _489 = _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _493 = ~_349;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _501 = _497;
    if (!_321)
    {
        int _503 = ~_349;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _511 = _365 ? 0 : 1;
    if (!_367)
    {
        _455 = _163;
    }
    float _513 = _455;
    float _515 = -_491;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    bool _523 = !_471;
    int _525 = _523 ? 0 : 1;
    float _527 = _485 * _119;
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _513;
    if (_367)
    {
        _533 = _155;
    }
    float _535 = _533;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _547 = _545 != 0;
    int _549 = ~_511;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].w, _499);
    int _557 = _553;
    float _559 = _535;
    if (!_353)
    {
        int _561 = ~_511;
        int _563 = _561 + 1;
        _557 = _563;
    }
    int _565 = _557;
    float _567 = float(_429);
    bool _569 = !_547;
    int _571 = _569 ? 0 : 1;
    bool _573 = !_543;
    int _575 = _573 ? 0 : 1;
    float _577 = 1.0 / _567;
    bool _579 = !_539;
    int _581 = _579 ? 0 : 1;
    if (!_367)
    {
        _559 = _163;
    }
    float _583 = _559;
    float _585 = _583;
    if (_367)
    {
        _585 = _155;
    }
    float _587 = _585;
    int _589 = abs(_571);
    int _591 = abs(_575);
    int _593 = abs(_581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = float(_461);
    float _599 = _465 * _119;
    float _601 = float(_507);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _605 = float(_591);
    float _607 = _577 * _119;
    float _609 = float(_593);
    float _611 = fma(_595, -2.0, _603);
    float _613 = exp2(_599);
    float _615 = _605 * _601;
    float _617 = _609 * _597;
    float _619 = in.m_68.x;
    float _621 = in.m_68.y;
    float _623 = in.m_68.z;
    float _625 = float(_565);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _629 = float(_589);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _615 * (-2.0);
    bool _637 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _639 = isnan(1.0);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _633;
    float _649 = _629 * _625;
    float _651 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _627);
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _451);
    float _673 = _665 ? _655 : 0.0;
    float _675 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _611);
    float _677 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _679 = fma(_389, _635, _389);
    bool _681 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _683 = isnan(_261);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_119;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _697 = _617 * (-2.0);
    float _699 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _677);
    float _701 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _651);
    float _703 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _555);
    float _705 = fma(_635, _621, _621);
    if (_645)
    {
        float _707 = _673 * _647;
        _129 = _707;
    }
    float _709 = _129;
    bool _711 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _713 = isnan(_261);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_691;
    float _725 = _723 + 1.0;
    float _727 = fma(_327, _697, _327);
    float _729 = _649 * (-2.0);
    float _731 = _155 + (-0.5);
    float _733 = fma(_697, _619, _619);
    bool _735 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _737 = isnan(_261);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _721 * _725;
    float _749 = fma(_729, _623, _623);
    bool _751 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_261);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _765 = _151 + (-0.5);
    float _767 = _163 + (-0.5);
    float _769 = -_721;
    float _771 = _769 + 1.0;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = fma(_323, _729, _323);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _783 = fma(_679, _709, _763);
    float _785 = _745 * _771;
    float _787 = _761 * _775;
    float _789 = fma(_727, _709, _779);
    float _791 = fma(_777, _709, _781);
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = _441 * _787;
    float _801 = -_761;
    float _803 = _801 + 1.0;
    float _805 = _443 * _787;
    float _807 = in.m_44.x;
    float _809 = in.m_44.y;
    float _811 = in.m_44.z;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _799);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _805);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _821;
    float _825 = fma(_815, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _827 = fma(_417, _785, _817);
    float _829 = fma(_419, _785, _819);
    float _831 = fma(_823, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _833 = _789 * 0.15915493667125701904296875;
    float _835 = fma(_825, _747, _827);
    float _837 = _791 * 0.15915493667125701904296875;
    float _839 = fma(_831, _747, _829);
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].x, _835);
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _849 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].y, _839);
    float _851 = _845 * _795;
    float _853 = _849 * _797;
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _861 = _195 * _809;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _183 * _809;
    float _869 = fma(_193, _807, _861);
    float _871 = _833 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _863 * _859;
    float _877 = _865 * _847;
    float _879 = fma(_181, _807, _867);
    float _881 = fma(_197, _811, _869);
    float _883 = _189 * _809;
    float _885 = _837 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(_187, _807, _883);
    float _891 = _833 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _873 * _843;
    float _897 = _873 * _857;
    float _899 = _837 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _873 * _887;
    float _905 = in.m_62.w;
    float _907 = _903 * _877;
    float _909 = _893 * _857;
    float _911 = _893 * _887;
    float _913 = _893 * _843;
    float _915 = _857 * _887;
    float _917 = _843 * _887;
    float _919 = in.m_66.w;
    float _921 = _911 * _877;
    float _923 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _925 = fma(_901, _909, _895);
    float _927 = -_877;
    float _929 = _901 * _927;
    float _931 = -_897;
    float _933 = fma(_901, _913, _931);
    float _935 = fma(_901, _895, _909);
    float _937 = fma(_925, _875, _921);
    float _939 = -_913;
    float _941 = fma(_901, _897, _939);
    float _943 = fma(_915, _875, _929);
    float _945 = in.m_64.w;
    float _947 = fma(_933, _923, _937);
    float _949 = fma(_941, _875, _907);
    float _951 = fma(_917, _923, _943);
    float _953 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _957 = fma(_935, _923, _949);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].x, _953);
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _955);
    float _963 = fma(_185, _811, _879);
    float _965 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _967 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _959);
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _961);
    float _971 = _881 + _919;
    float _973 = _963 + _905;
    float _975 = _967 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _965);
    float _981 = fma(_191, _811, _889);
    float _983 = _971 + _975;
    float _985 = _973 + _977;
    float _987 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _989 = _981 + _945;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _993 = _983 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _997 = _985 + _995;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _993 * _993;
    float _1003 = fma(_997, _997, _1001);
    float _1005 = _989 + _999;
    float _1007 = sqrt(_1003);
    bool _1009 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1025 = _1023 != 0;
    bool _1027 = !_1017;
    int _1029 = _1027 ? 0 : 1;
    bool _1031 = !_1013;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1021;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _889;
    float _1045 = _807;
    float _1047 = _1003;
    if (!_1009)
    {
        _241 = _985;
    }
    float _1049 = _241;
    float _1051 = _1049;
    if (!_1009)
    {
        _243 = _983;
    }
    float _1053 = _243;
    float _1055 = _1053;
    if (!_1009)
    {
        _1043 = _1005;
    }
    float _1057 = _1043;
    bool _1059 = !_1009;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1007 + _1065;
        float _1069 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = rsqrt(_1003);
        float _1073 = _1067 * _1063;
        float _1075 = _1073 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = cos(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 + (-1.0);
        float _1087 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1083, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = fma(_1005, _1079, _1087);
        float _1093 = _1071 * _1089;
        float _1095 = fma(_997, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1097 = fma(_993, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1061 = _1091;
        _1051 = _1095;
        _1055 = _1097;
        _1045 = _1075;
    }
    float _1099 = _1061;
    float _1101 = _1051;
    float _1103 = _1055;
    float _1105 = _1045;
    float _1107 = -_989;
    float _1109 = _1107 + _1099;
    float _1111 = -_973;
    float _1113 = _1111 + _1101;
    float _1115 = -_971;
    float _1117 = _1115 + _1103;
    float _1119 = _1109 * _1109;
    bool _1121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1123 = isnan(0.5);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_1113, _1113, _1119);
    float _1133 = fma(_1117, _1117, _1131);
    float _1135 = sqrt(_1133);
    bool _1137 = _1135 > 0.0;
    bool _1139 = !_1137;
    float _1141 = _1101;
    float _1143 = _1099;
    float _1145 = _1103;
    float _1147 = _1113;
    float _1149 = _1105;
    if (!_1139)
    {
        float _1151 = _229 * _229;
        float _1153 = fma(_225, _225, _1151);
        float _1155 = fma(_235, _235, _1153);
        float _1157 = rsqrt(_1133);
        float _1159 = sqrt(_1155);
        float _1161 = _1113 * _1157;
        float _1163 = _1109 * _1157;
        float _1165 = _1117 * _1157;
        bool _1167 = _1159 > 0.0;
        bool _1169 = !_1167;
        _1147 = _1163;
        _1149 = _1159;
        _1047 = _1165;
        if (!_1169)
        {
            float _1171 = rsqrt(_1155);
            float _1173 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1175 = _229 * _1171;
            float _1177 = _225 * _1171;
            float _1179 = _235 * _1171;
            float _1181 = _1163 * _1175;
            float _1183 = fma(_1161, _1177, _1181);
            float _1185 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1187 = fma(_1165, _1179, _1183);
            float _1189 = _1187 * _1185;
            float _1191 = fma(_225, _1189, _1101);
            float _1193 = fma(_229, _1189, _1099);
            float _1195 = fma(_235, _1189, _1103);
            _1141 = _1191;
            _1143 = _1193;
            _1145 = _1195;
            _1147 = _1183;
            _1149 = _1175;
        }
    }
    float _1197 = _1141;
    float _1199 = _1143;
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1047;
    float _1209 = _1199;
    float _1211 = _1197;
    float _1213 = _1201;
    float _1215 = _1205;
    float _1217 = _1207;
    if (!_1129)
    {
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1221 = _989 + _1219;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1225 = _973 + _1223;
        float _1227 = _1221 * _1221;
        float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1231 = _971 + _1229;
        float _1233 = fma(_1225, _1225, _1227);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1237 = fma(_1231, _1231, _1233);
        float _1239 = -_973;
        float _1241 = _1239 + _1197;
        float _1243 = sqrt(_1237);
        float _1245 = precise::min(_1243, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1235;
        float _1249 = -_989;
        float _1251 = _1249 + _1199;
        float _1253 = -_971;
        float _1255 = _1253 + _1201;
        float _1257 = fma(_1241, _1247, _973);
        float _1259 = fma(_1251, _1247, _989);
        float _1261 = fma(_1255, _1247, _971);
        _1209 = _1259;
        _1211 = _1257;
        _1213 = _1261;
        _1215 = _1247;
    }
    float _1263 = _1209;
    float _1265 = _1211;
    float _1267 = _1213;
    float _1269 = _1215;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1273 = _1263 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1281 = _1267 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1277, _1277, _1283);
    float _1287 = fma(_1281, _1281, _1285);
    float _1289 = rsqrt(_1287);
    float _1291 = sqrt(_1287);
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1295 = _1277 * _1293;
    float _1297 = _1281 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 + _1301;
    float _1305 = sqrt(_1303);
    bool _1307 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = _1305 + _1309;
    float _1313 = _1203;
    float _1315 = _1311;
    float _1317 = _1273;
    float _1319 = _1295;
    if (_1307)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1313 = _1321;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1307)
    {
        float _1327 = _1311 * _1323;
        _1315 = _1327;
    }
    float _1329 = _1315;
    if (_1307)
    {
        float _1331 = rsqrt(_1303);
        _1325 = _1331;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (_1307)
    {
        float _1337 = _1329 * 0.15915493667125701904296875;
        _245 = _1337;
    }
    float _1339 = _245;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1281;
    if (_1307)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1353 = precise::max(0.0, _1341);
    float _1355 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1351);
    float _1357 = _1269;
    float _1359 = _1353;
    if (_1307)
    {
        float _1361 = _1339 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        _1357 = _1363;
    }
    float _1365 = _1357;
    float _1367 = -_1293;
    float _1369 = -_1353;
    float _1371 = fma(_1273, _1367, _1369);
    float _1373 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1375 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    if (_1307)
    {
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1377;
    }
    float _1379 = _1317;
    float _1381 = _1349;
    float _1383 = _1379;
    if (_1307)
    {
        float _1385 = fma(_1349, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (!_1307)
    {
        _1383 = _1371;
    }
    float _1391 = _1383;
    float _1393 = _1391;
    if (_1307)
    {
        float _1395 = _1333 * _1387;
        _1217 = _1395;
    }
    float _1397 = _1217;
    if (!_1307)
    {
        _1389 = _1299;
    }
    float _1399 = _1389;
    float _1401 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = _1399;
    float _1405 = _1365;
    if (_1307)
    {
        float _1407 = _1365 + (-1.0);
        _1359 = _1407;
    }
    float _1409 = _1359;
    float _1411 = _1409;
    if (_1307)
    {
        float _1413 = _1295 * _1397;
        _1319 = _1413;
    }
    float _1415 = _1319;
    float _1417 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    if (_1307)
    {
        float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1419;
    }
    float _1421 = _1335;
    if (!_1307)
    {
        _1411 = _1297;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1307)
    {
        float _1427 = _1297 * _1397;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1307)
    {
        float _1431 = _1415 * _1415;
        _1403 = _1431;
    }
    float _1433 = _1403;
    if (_1307)
    {
        float _1435 = fma(_1371, _1365, _1421);
        _1393 = _1435;
    }
    float _1437 = _1393;
    if (!_1307)
    {
        _1405 = _1301;
    }
    float _1439 = _1405;
    float _1441 = _1439;
    if (_1307)
    {
        float _1443 = _1429 * _1429;
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1449 = fma(_1437, _1437, _1433);
    float _1451 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1453 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1447);
    float _1455 = _1449 + _1445;
    float _1457 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1463 = rsqrt(_1455);
    float _1465 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1475 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1477 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1485 = -_1475;
    float _1487 = fma(_1485, _1373, 1.0);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = abs(_1481);
    float _1497 = log2(_1495);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1483);
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = _1463 * _1437;
    float _1505 = _1463 * _1429;
    float _1507 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1509 = _1463 * _1415;
    float _1511 = log2(_1487);
    float _1513 = _1503 + 1.0;
    float _1515 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = -_1517;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = 1.0 / _1515;
    float _1527 = -_1505;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1531);
    float _1537 = exp2(_1523);
    float _1539 = fma(_1529, 0.5, 0.5);
    float _1541 = _1511 * 0.693147182464599609375;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1535);
    float _1545 = fma(_1539, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1549 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1551 = sqrt(_1533);
    float _1553 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1555 = fma(_1539, _1545, -0.212114393711090087890625);
    float _1557 = _1549 * _1525;
    float _1559 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1561 = fma(_1539, _1555, 1.570728778839111328125);
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = -_1503;
    float _1567 = fma(_1537, _1513, _1565);
    float _1569 = _1559 * _1525;
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = fma(_1569, -0.5, 0.5);
    float _1575 = _1551 * 0.636619746685028076171875;
    float _1577 = -_1561;
    float _1579 = fma(_1575, _1577, 1.0);
    float3 _5481 = float3(_1563, _1573, _1547);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float3 _5492 = float3(_1563, _1573, _1547);
    float4 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5492, float3(0.0), isnan(_5492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5492, float3(0.0), isnan(_5492)), level(0.0)).xyzw;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1584.w;
    float2 _5509 = float2(_1579, _1571);
    float3 _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1598 = _1596.x;
    float _1600 = _1596.y;
    float _1602 = _1596.z;
    float _1604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1606 = int(_1604);
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1610 = _1608 != 0;
    float _1612 = -_699;
    float _1614 = _1612 + 1.0;
    bool _1616 = _151 > 0.5;
    float _1618 = -_701;
    float _1620 = _1618 + 1.0;
    bool _1622 = _163 > 0.5;
    out.m_72.x = _973;
    out.m_72.y = _989;
    out.m_72.z = _971;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1626 = _1624 != 0;
    float _1628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1630 = int(_1628);
    int _1632 = abs(_1033);
    float _1634 = -_671;
    float _1636 = _1634 + 1.0;
    int _1638 = abs(_1037);
    float _1640 = -_703;
    float _1642 = _1640 + 1.0;
    float _1644 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1646 = 0.0;
    float _1648 = _1559;
    float _1650 = _1549;
    if (_1610)
    {
        _1646 = 1.0;
    }
    float _1652 = _1646;
    out.m_74.x = _1265;
    out.m_74.y = _1263;
    out.m_74.z = _1267;
    float _1654 = float(uint(_1606));
    float _1656 = trunc(_527);
    int _1658 = int(_1656);
    float _1660 = _1652;
    if (!_1610)
    {
        _1660 = 1.2345600128173828125;
    }
    float _1662 = _1660;
    float _1664 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1666 = 0.0;
    if (_1610)
    {
        _1666 = 1.0;
    }
    float _1668 = _1666;
    float _1670 = _1668;
    if (!_1610)
    {
        _1670 = 7.345489978790283203125;
    }
    float _1672 = _1670;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1664);
    float _1676 = float(uint(_1630));
    float _1678 = 1.0 / _1654;
    int _1680 = ~_1630;
    int _1682 = _1680 + 1;
    float _1684 = _1672 * _151;
    int _1686 = ~_1630;
    int _1688 = _1686 + 1;
    float _1690 = 1.0 / _1676;
    float _1692 = trunc(_607);
    int _1694 = int(_1692);
    int _1696 = as_type<int>(_1678) + (-2);
    float _1698 = float(uint(_1658));
    float _1700 = as_type<float>(_1696) * _1698;
    int _1702 = as_type<int>(_1690) + (-2);
    float _1704 = floor(_1684);
    int _1706 = ~_1606;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1694));
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1717 = uint(_1714);
    float _1719 = as_type<float>(_1702) * _1710;
    float _1721 = _1710;
    if (_1610)
    {
        _1721 = _151;
    }
    float _1723 = _1721;
    float _1725 = _1723;
    if (!_1610)
    {
        _1725 = _155;
    }
    float _1727 = _1725;
    float _1729 = -_1704;
    float _1731 = _1684 + _1729;
    float _1733 = trunc(_1719);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1662 * _1727;
    int _1741 = _1708 * int(_1717);
    int _1743 = _1741 + _1658;
    float _1745 = floor(_1739);
    float _1747 = float(uint(_1743));
    float _1749 = in.m_53.w;
    int _1751 = _1682 * int(_1737);
    int _1753 = _1751 + _1694;
    float _1755 = as_type<float>(_1696) * _1747;
    float _1757 = float(uint(_1753));
    float _1759 = trunc(_1755);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    float _1769 = -_1745;
    float _1771 = _1739 + _1769;
    float _1773 = as_type<float>(_1702) * _1757;
    float _1775 = -_233;
    int _1777 = _1616 ? as_type<int>(_1775) : as_type<int>(_233);
    float _1779 = float(_1606);
    bool _1781 = !_1767;
    float _1783 = _1781 ? _233 : as_type<float>(_1777);
    float _1785 = trunc(_1773);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    bool _1791 = _155 > 0.5;
    float _1793 = _1731 * _1779;
    float _1795 = float(_1694);
    float _1797 = _1783 + 0.5;
    bool _1799 = _1749 > 0.5;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[80].x, _347);
    int _1803 = int(_1717) + int(_1763);
    float _1805 = trunc(_1793);
    int _1807 = int(_1805);
    int _1809 = ~_1606;
    int _1811 = _1809 + 1;
    float _1813 = -_1614;
    float _1815 = fma(_1783, _1813, _1801);
    float _1817 = float(_1630);
    int _1819 = int(_1737) + int(_1789);
    int _1821 = _1811 * _1803;
    int _1823 = _1821 + _1658;
    float _1825 = float(_1658);
    float _1827 = _1817 * _297;
    int _1829 = ~_1630;
    int _1831 = _1829 + 1;
    float _1833 = _1771 * _1817;
    bool _1835 = _1825 >= _1779;
    bool _1837 = isnan(_1825);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1779);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1779 * _297;
    bool _1849 = uint(_1823) >= uint(_1606);
    int _1851 = _1831 * _1819;
    int _1853 = _1851 + _1694;
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = !_1849;
    int _1861 = _1859 ? 0 : (-1);
    bool _1863 = _1795 >= _1817;
    bool _1865 = isnan(_1795);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1817);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1877 = _1875 != 0;
    float _1879 = -_213;
    int _1881 = _1791 ? as_type<int>(_1879) : as_type<int>(_213);
    float _1883 = trunc(_1833);
    int _1885 = int(_1883);
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1889 = _1887 != 0;
    int _1891 = ~_1803;
    int _1893 = _1891 + _1861;
    int _1895 = _1893 + 1;
    bool _1897 = !_1877;
    float _1899 = _1897 ? _213 : as_type<float>(_1881);
    bool _1901 = !_1889;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1606 * _1895;
    int _1907 = _1905 + _1658;
    bool _1909 = uint(_1853) >= uint(_1630);
    float _1911 = trunc(_1873);
    int _1913 = int(_1911);
    bool _1915 = _1606 == 0;
    int _1917 = abs(_1903);
    float _1919 = _1899 + (-0.5);
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1923 = _1921 != 0;
    bool _1925 = !_1909;
    int _1927 = _1925 ? 0 : (-1);
    float _1929 = trunc(_1847);
    int _1931 = int(_1929);
    bool _1933 = !_1915;
    int _1935 = _1933 ? _1907 : (-1);
    float _1937 = -_1919;
    float _1939 = -_669;
    float _1941 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1939);
    bool _1943 = !_1923;
    int _1945 = _1943 ? 0 : 1;
    int _1947 = _1807 * _1917;
    int _1949 = _1947 + _1658;
    int _1951 = ~_1819;
    int _1953 = _1951 + _1927;
    int _1955 = _1953 + 1;
    float _1957 = fma(_1899, _1620, _1941);
    int _1959 = ~_1857;
    int _1961 = _1959 + 1;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1827);
    int _1967 = int(_1965);
    int _1969 = abs(_1945);
    int _1971 = _1630 * _1955;
    int _1973 = _1971 + _1694;
    bool _1975 = _1630 == 0;
    int _1977 = _1935 * _1963;
    int _1979 = _1606 + (-1);
    int _1981 = abs(_521);
    bool _1983 = !_1975;
    int _1985 = _1983 ? _1973 : (-1);
    int _1987 = _1885 * _1969;
    int _1989 = _1987 + _1694;
    int _1991 = abs(_525);
    int _1993 = _1857 * _1979;
    int _1995 = _1993 + _1977;
    int _1997 = ~_1913;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = abs(_531);
    int _2005 = _1995 * _1981;
    int _2007 = _1630 + (-1);
    int _2009 = _1985 * _2001;
    bool _2011 = !_1626;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1931 * _1991;
    int _2017 = _2015 + _2005;
    int _2019 = _1913 * _2007;
    int _2021 = _2019 + _2009;
    int _2023 = abs(_1029);
    int _2025 = abs(_2013);
    int _2027 = _1949 * _2003;
    int _2029 = _2027 + _2017;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2033 = _2031 != 0;
    int _2035 = _2021 * _2023;
    float _2037 = -_233;
    int _2039 = _1622 ? as_type<int>(_2037) : as_type<int>(_233);
    int _2041 = abs(_1041);
    int _2043 = _1807 * _2025;
    int _2045 = _2043 + _2029;
    float _2047 = float(uint(_1949));
    bool _2049 = !_2033;
    float _2051 = _2049 ? _233 : as_type<float>(_2039);
    float _2053 = as_type<float>(_1696) * _2047;
    float _2055 = float(uint(_2045));
    float _2057 = _2051 + 0.5;
    int _2059 = ~_1606;
    int _2061 = _2059 + 1;
    int _2063 = _1967 * _1632;
    int _2065 = _2063 + _2035;
    int _2067 = ~_1630;
    int _2069 = _2067 + 1;
    float _2071 = trunc(_2053);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[85].x, _695);
    float _2079 = as_type<float>(_1696) * _2055;
    int _2081 = _1989 * _1638;
    int _2083 = _2081 + _2065;
    int _2085 = ~_1606;
    int _2087 = _2085 + 1;
    float _2089 = -_1636;
    float _2091 = fma(_2051, _2089, _2077);
    float _2093 = float(uint(_1989));
    int _2095 = _1885 * _2041;
    int _2097 = _2095 + _2083;
    float _2099 = trunc(_2079);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = as_type<float>(_1702) * _2093;
    float _2107 = float(uint(_2097));
    int _2109 = _2087 * int(_2075);
    int _2111 = _2109 + _1949;
    int _2113 = ~_1630;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1702) * _2107;
    float _2119 = trunc(_2105);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(uint(_2111));
    int _2127 = ~_1606;
    int _2129 = _2127 + 1;
    int _2131 = _2061 * int(_2103);
    int _2133 = _2131 + _2045;
    float _2135 = as_type<float>(_1696) * _2125;
    float _2137 = -_213;
    int _2139 = _1799 ? as_type<int>(_2137) : as_type<int>(_213);
    float _2141 = trunc(_2117);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2149 = _2147 != 0;
    float _2151 = float(uint(_2133));
    bool _2153 = !_2149;
    float _2155 = _2153 ? _213 : as_type<float>(_2139);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    float _2161 = as_type<float>(_1696) * _2151;
    int _2163 = _2115 * int(_2123);
    int _2165 = _2163 + _1989;
    float _2167 = _2155 + (-0.5);
    float _2169 = trunc(_2135);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2177 = _2175 != 0;
    float _2179 = float(uint(_2165));
    float _2181 = -_2167;
    float _2183 = -_675;
    float _2185 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2183);
    int _2187 = _2069 * int(_2145);
    int _2189 = _2187 + _2097;
    float _2191 = trunc(_2161);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    float _2197 = as_type<float>(_1702) * _2179;
    float _2199 = float(uint(_2189));
    float _2201 = fma(_2155, _1642, _2185);
    float _2203 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2205 = as_type<float>(_1702) * _2199;
    float _2207 = trunc(_2197);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    out.m_76.x = _1815;
    out.m_76.y = _1957;
    out.m_76.z = _2091;
    out.m_76.w = _2201;
    float _2213 = -_901;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2203);
    int _2217 = int(_2075) + int(_2173);
    float _2219 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2221 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2223 = trunc(_2205);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = int(_2103) + int(_2195);
    float _2231 = -_901;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2219);
    float _2235 = -_901;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2221);
    int _2239 = _2129 * _2229;
    int _2241 = _2239 + _2045;
    float _2243 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2245 = int(_2123) + int(_2211);
    float _2247 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2215);
    int _2249 = ~_1630;
    int _2251 = _2249 + 1;
    float _2253 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2255 = uint(_2241) >= uint(_1606);
    float _2257 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2259 = ~_1606;
    int _2261 = _2259 + 1;
    float _2263 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2265 = !_2255;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2243);
    int _2271 = int(_2145) + int(_2227);
    float _2273 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2237);
    int _2275 = ~_2229;
    int _2277 = _2275 + _2267;
    int _2279 = _2277 + 1;
    float _2281 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2283 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2253);
    int _2285 = _1688 * _2271;
    int _2287 = _2285 + _2097;
    float _2289 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2257);
    int _2291 = _1606 * _2279;
    int _2293 = _2291 + _2045;
    float _2295 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2297 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2299 = uint(_2287) >= uint(_1630);
    float _2301 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2281);
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2293 : (-1);
    float _2307 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    bool _2309 = !_2299;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2315 = _2305 & 3;
    bool _2317 = _2315 != 0;
    float _2319 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2321 = ~_2271;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2301);
    bool _2329 = uint(_2315) > 1u;
    float _2331 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 >> 31;
    int _2335 = _1630 * _2325;
    int _2337 = _2335 + _2097;
    int _2339 = _2305 & 3;
    bool _2341 = _2339 != 0;
    float _2343 = _2319 * _2247;
    int _2345 = _2333 & 3;
    bool _2347 = !_1975;
    int _2349 = _2347 ? _2337 : (-1);
    int _2351 = _2341 ? 0 : 1;
    int _2353 = _2251 * _2245;
    int _2355 = _2353 + _1989;
    int _2357 = _2305 + _2345;
    int _2359 = _2261 * _2217;
    int _2361 = _2359 + _1949;
    int _2363 = _2349 >> 31;
    int _2365 = ~_2351;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2357 >> 2;
    int _2373 = _2369;
    if (!_2329)
    {
        int _2375 = ~_2351;
        int _2377 = _2375 + 1;
        _2373 = _2377;
    }
    int _2379 = _2373;
    float _2381 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2313);
    bool _2383 = uint(_2315) >= 2u;
    int _2385 = _2363 & 3;
    int _2387 = _2371 << 4;
    int _2389 = _2387 + 368;
    float _2391 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2283);
    bool _2393 = uint(_2361) >= uint(_1606);
    float _2395 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2269);
    int _2397 = _2383 ? 0 : 1;
    int _2399 = _2389 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    bool _2417 = uint(_2355) >= uint(_1630);
    float _2419 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2307);
    int _2421 = _2349 + _2385;
    float _2423 = fma(_2331, _2391, _2343);
    bool _2425 = !_2393;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2421 >> 2;
    uint _2431 = uint(int(uint(_2389) >> uint(2)));
    uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
    int _2435 = int(_2431) & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    int _2439 = int(_2431) + 1;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    int _2443 = _2439 & 3;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[int(_2441)][_2443];
    bool _2447 = _2315 != 3;
    float _2449 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2289);
    int _2451 = _2429 << 4;
    int _2453 = _2451 + 512;
    float _2455 = _2319 * _2263;
    bool _2457 = !_2417;
    int _2459 = _2457 ? 0 : (-1);
    int _2461 = ~_2217;
    int _2463 = _2461 + _2427;
    int _2465 = _2463 + 1;
    uint _2467 = uint(int(uint(_2453) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = ~_2245;
    int _2485 = _2483 + _2459;
    int _2487 = _2485 + 1;
    float _2489 = fma(_2331, _2327, _2455);
    bool _2491 = !_2317;
    int _2493 = _2491 ? 0 : 1;
    out.m_78.x = _2391;
    out.m_78.y = _2327;
    out.m_78.z = _2449;
    int _2495 = _2349 & 3;
    bool _2497 = _2495 != 0;
    float _2499 = _2319 * _2273;
    int _2501 = ~_2397;
    int _2503 = _2501 + 1;
    int _2505 = _2503 + 1;
    int _2507 = _2453 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    uint _2511 = uint(int(uint(int(_2509)) >> uint(2)));
    int _2513 = int(_2509) & 3;
    float _2515 = (*spvDescriptorSet0.vp_c9)._m0[int(_2511)][_2513];
    int _2517 = int(_2509) + 1;
    uint _2519 = uint(int(uint(_2517) >> uint(2)));
    int _2521 = _2517 & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = _2349 & 3;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2331, _2449, _2499);
    int _2531 = _2505;
    float _2533 = _2489;
    if (_2447)
    {
        int _2535 = ~_2397;
        int _2537 = _2535 + 1;
        _2531 = _2537;
    }
    int _2539 = _2531;
    int _2541 = _1606 * _2465;
    int _2543 = _2541 + _1949;
    bool _2545 = uint(_2495) > 1u;
    int _2547 = _1630 * _2487;
    int _2549 = _2547 + _1989;
    int _2551 = abs(_2379);
    bool _2553 = !_2497;
    int _2555 = _2553 ? 0 : 1;
    bool _2557 = _2495 != 3;
    int _2559 = _2527 ? 0 : 1;
    bool _2561 = uint(_2495) >= 2u;
    int _2563 = abs(_2493);
    int _2565 = _2561 ? 0 : 1;
    int _2567 = ~_2559;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = _2571;
    int _2581 = _2577;
    if (!_2545)
    {
        int _2583 = ~_2559;
        int _2585 = _2583 + 1;
        _2579 = _2585;
    }
    int _2587 = _2579;
    if (_2557)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2581 = _2591;
    }
    int _2593 = _2581;
    int _2595 = ~_2551;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = abs(_2555);
    int _2603 = _2599 * as_type<int>(_2445);
    int _2605 = ~_2563;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2587);
    int _2613 = abs(_2539);
    int _2615 = _2609 * as_type<int>(_2437);
    int _2617 = _2615 + _2603;
    int _2619 = ~_2611;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2319, _2319, 1.0);
    int _2627 = ~_2613;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    bool _2633 = _2315 != 3;
    int _2635 = _2623 * as_type<int>(_2481);
    int _2637 = ~_2601;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2631 * as_type<int>(_2407);
    int _2645 = _2643 + _2617;
    bool _2647 = !_2633;
    int _2649 = _2647 ? 0 : (-1);
    float _2651 = rsqrt(_2625);
    bool _2653 = !_2159;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _2641 * as_type<int>(_2473);
    int _2659 = _2657 + _2635;
    int _2661 = abs(_2649);
    int _2663 = abs(_2593);
    int _2665 = abs(_2655);
    int _2667 = ~_2663;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    bool _2673 = !_2177;
    int _2675 = _2673 ? 0 : 1;
    int _2677 = ~_2661;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2671 * as_type<int>(_2515);
    int _2685 = _2683 + _2659;
    int _2687 = abs(_2675);
    int _2689 = ~_2665;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2681 * as_type<int>(_2415);
    int _2697 = _2695 + _2645;
    bool _2699 = !_1915;
    int _2701 = _2699 ? _2543 : (-1);
    bool _2703 = _2495 != 3;
    int _2705 = _2697 * _2693;
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = _2319 * _2651;
    bool _2715 = !_2703;
    int _2717 = _2715 ? 0 : (-1);
    int _2719 = _2701 * _2665;
    int _2721 = _2719 + _2705;
    float _2723 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2725 = !_1975;
    int _2727 = _2725 ? _2549 : (-1);
    float _2729 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _2731 = abs(_2717);
    float _2733 = exp2(_2723);
    int _2735 = ~_2731;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = _2729 + _1515;
    bool _2743 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1291);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2729;
    out.gl_Position.w = _1515;
    int _2753 = _2739 * as_type<int>(_2523);
    int _2755 = _2753 + _2685;
    float _2757 = -_2381;
    float _2759 = _2713 * _2757;
    float _2761 = _2741 * 0.5;
    int _2763 = _2755 * _2711;
    float _2765 = -_2419;
    float _2767 = _2713 * _2765;
    int _2769 = _2727 * _2687;
    int _2771 = _2769 + _2763;
    float _2773 = -_2395;
    float _2775 = _2713 * _2773;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2651, _2263, _2759);
    float _2783 = fma(_2651, _2273, _2767);
    float _2785 = fma(_2651, _2247, _2775);
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = _1515 * 0.5;
    float _2791 = _1549 + _1515;
    float _2793 = float(_2771);
    float _2795 = _2787 * _1581;
    out.m_80.x = _2785;
    out.m_80.y = _2781;
    out.m_80.z = _2783;
    float _2797 = fma(_1559, -0.5, _2789);
    float _2799 = _2395 + _2423;
    float _2801 = _1592 * _2795;
    float _2803 = _1602 * _2795;
    float _2805 = float(_2721);
    float _2807 = _2791 * 0.5;
    float _2809 = fma(_1598, _2801, _1586);
    float _2811 = _2381 + _2489;
    float _2813 = _2419 + _2529;
    float _2815 = fma(_1600, _2801, _1588);
    float _2817 = fma(_1592, _2803, _1590);
    float _2819 = -_2787;
    float _2821 = _2819 + 1.0;
    out.m_82.x = _2805;
    out.m_82.y = _2793;
    float _2823 = _2783;
    float _2825 = _2781;
    float _2827 = _2821;
    if (!_2751)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2829 = _1648;
    float _2831 = _1592 * _2821;
    out.m_84.x = _2807;
    out.m_84.y = _2797;
    out.m_84.z = _2761;
    out.m_84.w = _1515;
    float _2833 = _2829;
    float _2835 = _2829;
    if (!_2751)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _1650;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2751)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2843 = _2533;
    out.m_86.x = _2809;
    out.m_86.y = _2815;
    out.m_86.z = _2817;
    out.m_86.w = _2831;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2751)
    {
        _2823 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2823;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2751)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2855 = _2825;
    out.m_88.x = _2799;
    out.m_88.y = _2811;
    out.m_88.z = _2813;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2751)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2861 = _2827;
    bool _2863 = !_2751;
    float _2865 = _2861;
    float _2867 = _2861;
    if (!_2863)
    {
        bool _2869 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2871 = isnan(_1291);
        bool _2873 = _2869 || _2871;
        bool _2875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2877 = _2873 || _2875;
        if (!_2877)
        {
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2881 = _1291 + _2879;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2883;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2891 = 1.0 / _2885;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2909 = _2881 * _2891;
            float _2911 = precise::clamp(_2909, 0.0, 1.0);
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2917 = fma(_2911, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2919 = fma(_2911, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2921 = fma(_2911, _2895, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2911, _2899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2925 = fma(_2911, _2903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2927 = fma(_2911, _2907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2841 = _2921;
            _2859 = _2925;
            _2835 = _2917;
            _2853 = _2923;
            _2847 = _2919;
            _2867 = _2927;
            _2929 = true;
        }
        else
        {
            bool _2931 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2933 = isnan(_1291);
            bool _2935 = _2931 || _2933;
            bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2939 = _2935 || _2937;
            if (!_2939)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2941 = _2833;
            _2835 = _2941;
            if (!_2939)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2943 = _2839;
            _2841 = _2943;
            if (!_2939)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2945 = _2845;
            _2847 = _2945;
            if (!_2939)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2947 = _2851;
            _2853 = _2947;
            if (!_2939)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2949 = _2857;
            _2859 = _2949;
            if (!_2939)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2951 = _2865;
            bool _2953 = !_2939;
            _2867 = _2951;
            if (!_2953)
            {
                bool _2955 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2957 = isnan(_1291);
                bool _2959 = _2955 || _2957;
                bool _2961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2963 = _2959 || _2961;
                if (!_2963)
                {
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2967 = _1291 + _2965;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2969;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2977 = 1.0 / _2971;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2995 = _2967 * _2977;
                    float _2997 = precise::clamp(_2995, 0.0, 1.0);
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3003 = fma(_2997, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3005 = fma(_2997, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3007 = fma(_2997, _2981, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2997, _2985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3011 = fma(_2997, _2989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3013 = fma(_2997, _2993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2841 = _3007;
                    _2859 = _3011;
                    _2835 = _3003;
                    _2853 = _3009;
                    _2847 = _3005;
                    _2867 = _3013;
                    _2929 = true;
                }
                else
                {
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2929 = false;
    float _3015 = _2841;
    float _3017 = _2859;
    float _3019 = _2835;
    float _3021 = _2853;
    float _3023 = _2847;
    float _3025 = _2867;
    float _3027 = fma(_2811, -0.5, 0.5);
    float _3029 = precise::clamp(_3027, 0.0, 1.0);
    float _3031 = -_3015;
    float _3033 = _3031 + _3017;
    float _3035 = -_3019;
    float _3037 = _3035 + _3021;
    float _3039 = -_3023;
    float _3041 = _3039 + _3025;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3029, _3033, _3015);
    float _3047 = fma(_3029, _3037, _3019);
    float _3049 = fma(_3029, _3041, _3023);
    float _3051 = _3045 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3053 = fma(_3047, 0.298911988735198974609375, _3051);
    float _3055 = fma(_3049, 0.114477999508380889892578125, _3053);
    out.m_90.x = 0.0;
    float _3057 = -_3055;
    float _3059 = _3047 + _3057;
    float _3061 = -_3055;
    float _3063 = _3045 + _3061;
    float _3065 = -_3055;
    float _3067 = _3049 + _3065;
    float _3069 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = fma(_3059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3073 = fma(_3063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3075 = fma(_3067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    out.m_92.w = _3069;
    out.m_94.x = _3071;
    out.m_94.y = _3073;
    out.m_94.z = _3075;
    if (!_3043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3077 = -_1263;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3081 = -_1265;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3085 = -_1267;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3089 = _3079 * _3079;
    float _3091 = fma(_3083, _3083, _3089);
    float _3093 = fma(_3087, _3087, _3091);
    float _3095 = sqrt(_3093);
    float _3097 = rsqrt(_3093);
    float _3099 = -_3095;
    float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = _3083 * _3097;
    float _3109 = _3079 * _3097;
    float _3111 = abs(_3105);
    float _3113 = log2(_3111);
    float _3115 = _3087 * _3097;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3119 = _2811 * _3109;
    float _3121 = -_3109;
    float _3123 = -_3117;
    float _3125 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3123);
    float _3127 = fma(_2799, _3107, _3119);
    float _3129 = -_3115;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3125);
    float _3133 = fma(_2813, _3115, _3127);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3139 = _3131 + _3137;
    float _3141 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = exp2(_3141);
    float _3149 = _3147 * _3145;
    float _3151 = _3135 * _3149;
    float _3153 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3157 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3153;
    out.m_90.y = _3155;
    out.m_90.z = _3157;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2929 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = in.m_46.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_51.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_137);
        out.gl_Position.z = _3226;
    }
    if (!_123)
    {
        return out;
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_53.x;
    float _153 = float(_115);
    float _155 = in.m_53.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_53.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_55.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3289 = as_type<float>(_169);
        out.gl_Position.z = _3289;
    }
    out.m_55.y = _155;
    out.m_55.z = _163;
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / _153;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = _119 * _173;
    int _201 = as_type<int>(_171) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_171) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_207;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _177 * _183;
    float _217 = _177 * _189;
    float _219 = fma(_175, _181, _215);
    float _221 = _177 * _195;
    float _223 = fma(_175, _187, _217);
    float _225 = fma(_179, _185, _219);
    float _227 = fma(_175, _193, _221);
    float _229 = fma(_179, _191, _223);
    bool _231 = !_203;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_179, _197, _227);
    bool _237 = !_209;
    float _239 = _199;
    float _241 = _187;
    float _243 = _191;
    float _245 = _229;
    if (!_237)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _239 = _259;
    }
    float _261 = _239;
    float _263 = _151 * 2.0;
    float _265 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _267 = _155 * 2.0;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = floor(_263);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = -_269;
    float _279 = fma(_265, 2.0, _277);
    float _281 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _163 * 2.0;
    float _289 = floor(_267);
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = _173 * _119;
    float _299 = fma(_281, -2.0, _291);
    float _301 = _151 + _163;
    float _303 = 1.0 / _285;
    float _305 = _151 + _155;
    float _307 = _301 + (-1.0);
    bool _309 = _271 >= 0.0;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan(0.0);
    bool _317 = _313 || _315;
    float _319 = _305 + (-1.0);
    bool _321 = _271 > 0.0;
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _325 = floor(_287);
    float _327 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    int _333 = as_type<int>(_307);
    if (_275)
    {
        _333 = 0;
    }
    int _335 = _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _261 + _337;
    int _341 = _335;
    if (!_275)
    {
        _341 = 1;
    }
    int _343 = _341;
    float _345 = -_119;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _349 = _317 ? 0 : 1;
    float _351 = 1.0 / _295;
    bool _353 = _289 > 0.0;
    float _355 = _339 * _303;
    bool _357 = _289 >= 0.0;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    bool _367 = _343 != 1;
    float _369 = 1.0 / _331;
    float _371 = _155 + _163;
    float _373 = _371 + (-1.0);
    bool _375 = _325 > 0.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _383 = int(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _391 = _325 >= 0.0;
    bool _393 = isnan(_325);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _261 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _261 + _413;
    float _417 = fma(_403, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = fma(_407, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = _411 * _351;
    float _423 = _415 * _369;
    int _425 = _399 ? 0 : 1;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    float _431 = _411;
    if (!_367)
    {
        _431 = _155;
    }
    float _433 = _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _437 = _433;
    if (_367)
    {
        _437 = _151;
    }
    float _439 = _437;
    float _441 = fma(_379, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = fma(_387, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _445 = ~_425;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _435);
    int _453 = _449;
    float _455 = _439;
    if (!_375)
    {
        int _457 = ~_425;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    float _467 = float(_383);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_383);
    if (!_367)
    {
        _481 = _155;
    }
    float _483 = _481;
    float _485 = 1.0 / _467;
    float _487 = _483;
    if (_367)
    {
        _487 = _151;
    }
    float _489 = _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _493 = ~_349;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _501 = _497;
    if (!_321)
    {
        int _503 = ~_349;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _511 = _365 ? 0 : 1;
    if (!_367)
    {
        _455 = _163;
    }
    float _513 = _455;
    float _515 = -_491;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    bool _523 = !_471;
    int _525 = _523 ? 0 : 1;
    float _527 = _485 * _119;
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _513;
    if (_367)
    {
        _533 = _155;
    }
    float _535 = _533;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _547 = _545 != 0;
    int _549 = ~_511;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].w, _499);
    int _557 = _553;
    float _559 = _535;
    if (!_353)
    {
        int _561 = ~_511;
        int _563 = _561 + 1;
        _557 = _563;
    }
    int _565 = _557;
    float _567 = float(_429);
    bool _569 = !_547;
    int _571 = _569 ? 0 : 1;
    bool _573 = !_543;
    int _575 = _573 ? 0 : 1;
    float _577 = 1.0 / _567;
    bool _579 = !_539;
    int _581 = _579 ? 0 : 1;
    if (!_367)
    {
        _559 = _163;
    }
    float _583 = _559;
    float _585 = _583;
    if (_367)
    {
        _585 = _155;
    }
    float _587 = _585;
    int _589 = abs(_571);
    int _591 = abs(_575);
    int _593 = abs(_581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = float(_461);
    float _599 = _465 * _119;
    float _601 = float(_507);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _605 = float(_591);
    float _607 = _577 * _119;
    float _609 = float(_593);
    float _611 = fma(_595, -2.0, _603);
    float _613 = exp2(_599);
    float _615 = _605 * _601;
    float _617 = _609 * _597;
    float _619 = in.m_68.x;
    float _621 = in.m_68.y;
    float _623 = in.m_68.z;
    float _625 = float(_565);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _629 = float(_589);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _615 * (-2.0);
    bool _637 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _639 = isnan(1.0);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _633;
    float _649 = _629 * _625;
    float _651 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _627);
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _451);
    float _673 = _665 ? _655 : 0.0;
    float _675 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _611);
    float _677 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _679 = fma(_389, _635, _389);
    bool _681 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _683 = isnan(_261);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_119;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _697 = _617 * (-2.0);
    float _699 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _677);
    float _701 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _651);
    float _703 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _555);
    float _705 = fma(_635, _621, _621);
    if (_645)
    {
        float _707 = _673 * _647;
        _129 = _707;
    }
    float _709 = _129;
    bool _711 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _713 = isnan(_261);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_691;
    float _725 = _723 + 1.0;
    float _727 = fma(_327, _697, _327);
    float _729 = _649 * (-2.0);
    float _731 = _155 + (-0.5);
    float _733 = fma(_697, _619, _619);
    bool _735 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _737 = isnan(_261);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _721 * _725;
    float _749 = fma(_729, _623, _623);
    bool _751 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_261);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _765 = _151 + (-0.5);
    float _767 = _163 + (-0.5);
    float _769 = -_721;
    float _771 = _769 + 1.0;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = fma(_323, _729, _323);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _783 = fma(_679, _709, _763);
    float _785 = _745 * _771;
    float _787 = _761 * _775;
    float _789 = fma(_727, _709, _779);
    float _791 = fma(_777, _709, _781);
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = _441 * _787;
    float _801 = -_761;
    float _803 = _801 + 1.0;
    float _805 = _443 * _787;
    float _807 = in.m_44.x;
    float _809 = in.m_44.y;
    float _811 = in.m_44.z;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _799);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _805);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _821;
    float _825 = fma(_815, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _827 = fma(_417, _785, _817);
    float _829 = fma(_419, _785, _819);
    float _831 = fma(_823, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _833 = _789 * 0.15915493667125701904296875;
    float _835 = fma(_825, _747, _827);
    float _837 = _791 * 0.15915493667125701904296875;
    float _839 = fma(_831, _747, _829);
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].x, _835);
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _849 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].y, _839);
    float _851 = _845 * _795;
    float _853 = _849 * _797;
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _861 = _195 * _809;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _183 * _809;
    float _869 = fma(_193, _807, _861);
    float _871 = _833 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _863 * _859;
    float _877 = _865 * _847;
    float _879 = fma(_181, _807, _867);
    float _881 = fma(_197, _811, _869);
    float _883 = _189 * _809;
    float _885 = _837 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(_187, _807, _883);
    float _891 = _833 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _873 * _843;
    float _897 = _873 * _857;
    float _899 = _837 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _873 * _887;
    float _905 = in.m_62.w;
    float _907 = _903 * _877;
    float _909 = _893 * _857;
    float _911 = _893 * _887;
    float _913 = _893 * _843;
    float _915 = _857 * _887;
    float _917 = _843 * _887;
    float _919 = in.m_66.w;
    float _921 = _911 * _877;
    float _923 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _925 = fma(_901, _909, _895);
    float _927 = -_877;
    float _929 = _901 * _927;
    float _931 = -_897;
    float _933 = fma(_901, _913, _931);
    float _935 = fma(_901, _895, _909);
    float _937 = fma(_925, _875, _921);
    float _939 = -_913;
    float _941 = fma(_901, _897, _939);
    float _943 = fma(_915, _875, _929);
    float _945 = in.m_64.w;
    float _947 = fma(_933, _923, _937);
    float _949 = fma(_941, _875, _907);
    float _951 = fma(_917, _923, _943);
    float _953 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _957 = fma(_935, _923, _949);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].x, _953);
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _955);
    float _963 = fma(_185, _811, _879);
    float _965 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _967 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _959);
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _961);
    float _971 = _881 + _919;
    float _973 = _963 + _905;
    float _975 = _967 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _965);
    float _981 = fma(_191, _811, _889);
    float _983 = _971 + _975;
    float _985 = _973 + _977;
    float _987 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _989 = _981 + _945;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _993 = _983 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _997 = _985 + _995;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _993 * _993;
    float _1003 = fma(_997, _997, _1001);
    float _1005 = _989 + _999;
    float _1007 = sqrt(_1003);
    bool _1009 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1025 = _1023 != 0;
    bool _1027 = !_1017;
    int _1029 = _1027 ? 0 : 1;
    bool _1031 = !_1013;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1021;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _889;
    float _1045 = _807;
    float _1047 = _1003;
    if (!_1009)
    {
        _241 = _985;
    }
    float _1049 = _241;
    float _1051 = _1049;
    if (!_1009)
    {
        _243 = _983;
    }
    float _1053 = _243;
    float _1055 = _1053;
    if (!_1009)
    {
        _1043 = _1005;
    }
    float _1057 = _1043;
    bool _1059 = !_1009;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1007 + _1065;
        float _1069 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = rsqrt(_1003);
        float _1073 = _1067 * _1063;
        float _1075 = _1073 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = cos(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 + (-1.0);
        float _1087 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1083, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = fma(_1005, _1079, _1087);
        float _1093 = _1071 * _1089;
        float _1095 = fma(_997, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1097 = fma(_993, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1061 = _1091;
        _1051 = _1095;
        _1055 = _1097;
        _1045 = _1075;
    }
    float _1099 = _1061;
    float _1101 = _1051;
    float _1103 = _1055;
    float _1105 = _1045;
    float _1107 = -_989;
    float _1109 = _1107 + _1099;
    float _1111 = -_973;
    float _1113 = _1111 + _1101;
    float _1115 = -_971;
    float _1117 = _1115 + _1103;
    float _1119 = _1109 * _1109;
    bool _1121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1123 = isnan(0.5);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_1113, _1113, _1119);
    float _1133 = fma(_1117, _1117, _1131);
    float _1135 = sqrt(_1133);
    bool _1137 = _1135 > 0.0;
    bool _1139 = !_1137;
    float _1141 = _1101;
    float _1143 = _1099;
    float _1145 = _1103;
    float _1147 = _1113;
    float _1149 = _1105;
    if (!_1139)
    {
        float _1151 = _229 * _229;
        float _1153 = fma(_225, _225, _1151);
        float _1155 = fma(_235, _235, _1153);
        float _1157 = rsqrt(_1133);
        float _1159 = sqrt(_1155);
        float _1161 = _1113 * _1157;
        float _1163 = _1109 * _1157;
        float _1165 = _1117 * _1157;
        bool _1167 = _1159 > 0.0;
        bool _1169 = !_1167;
        _1147 = _1163;
        _1149 = _1159;
        _1047 = _1165;
        if (!_1169)
        {
            float _1171 = rsqrt(_1155);
            float _1173 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1175 = _229 * _1171;
            float _1177 = _225 * _1171;
            float _1179 = _235 * _1171;
            float _1181 = _1163 * _1175;
            float _1183 = fma(_1161, _1177, _1181);
            float _1185 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1187 = fma(_1165, _1179, _1183);
            float _1189 = _1187 * _1185;
            float _1191 = fma(_225, _1189, _1101);
            float _1193 = fma(_229, _1189, _1099);
            float _1195 = fma(_235, _1189, _1103);
            _1141 = _1191;
            _1143 = _1193;
            _1145 = _1195;
            _1147 = _1183;
            _1149 = _1175;
        }
    }
    float _1197 = _1141;
    float _1199 = _1143;
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1047;
    float _1209 = _1199;
    float _1211 = _1197;
    float _1213 = _1201;
    float _1215 = _1205;
    float _1217 = _1207;
    if (!_1129)
    {
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1221 = _989 + _1219;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1225 = _973 + _1223;
        float _1227 = _1221 * _1221;
        float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1231 = _971 + _1229;
        float _1233 = fma(_1225, _1225, _1227);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1237 = fma(_1231, _1231, _1233);
        float _1239 = -_973;
        float _1241 = _1239 + _1197;
        float _1243 = sqrt(_1237);
        float _1245 = precise::min(_1243, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1235;
        float _1249 = -_989;
        float _1251 = _1249 + _1199;
        float _1253 = -_971;
        float _1255 = _1253 + _1201;
        float _1257 = fma(_1241, _1247, _973);
        float _1259 = fma(_1251, _1247, _989);
        float _1261 = fma(_1255, _1247, _971);
        _1209 = _1259;
        _1211 = _1257;
        _1213 = _1261;
        _1215 = _1247;
    }
    float _1263 = _1209;
    float _1265 = _1211;
    float _1267 = _1213;
    float _1269 = _1215;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1273 = _1263 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1281 = _1267 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1277, _1277, _1283);
    float _1287 = fma(_1281, _1281, _1285);
    float _1289 = rsqrt(_1287);
    float _1291 = sqrt(_1287);
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1295 = _1277 * _1293;
    float _1297 = _1281 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 + _1301;
    float _1305 = sqrt(_1303);
    bool _1307 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = _1305 + _1309;
    float _1313 = _1203;
    float _1315 = _1311;
    float _1317 = _1273;
    float _1319 = _1295;
    if (_1307)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1313 = _1321;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1307)
    {
        float _1327 = _1311 * _1323;
        _1315 = _1327;
    }
    float _1329 = _1315;
    if (_1307)
    {
        float _1331 = rsqrt(_1303);
        _1325 = _1331;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (_1307)
    {
        float _1337 = _1329 * 0.15915493667125701904296875;
        _245 = _1337;
    }
    float _1339 = _245;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1281;
    if (_1307)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1353 = precise::max(0.0, _1341);
    float _1355 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1351);
    float _1357 = _1269;
    float _1359 = _1353;
    if (_1307)
    {
        float _1361 = _1339 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        _1357 = _1363;
    }
    float _1365 = _1357;
    float _1367 = -_1293;
    float _1369 = -_1353;
    float _1371 = fma(_1273, _1367, _1369);
    float _1373 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1375 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    if (_1307)
    {
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1377;
    }
    float _1379 = _1317;
    float _1381 = _1349;
    float _1383 = _1379;
    if (_1307)
    {
        float _1385 = fma(_1349, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (!_1307)
    {
        _1383 = _1371;
    }
    float _1391 = _1383;
    float _1393 = _1391;
    if (_1307)
    {
        float _1395 = _1333 * _1387;
        _1217 = _1395;
    }
    float _1397 = _1217;
    if (!_1307)
    {
        _1389 = _1299;
    }
    float _1399 = _1389;
    float _1401 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = _1399;
    float _1405 = _1365;
    if (_1307)
    {
        float _1407 = _1365 + (-1.0);
        _1359 = _1407;
    }
    float _1409 = _1359;
    float _1411 = _1409;
    if (_1307)
    {
        float _1413 = _1295 * _1397;
        _1319 = _1413;
    }
    float _1415 = _1319;
    float _1417 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    if (_1307)
    {
        float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1419;
    }
    float _1421 = _1335;
    if (!_1307)
    {
        _1411 = _1297;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1307)
    {
        float _1427 = _1297 * _1397;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1307)
    {
        float _1431 = _1415 * _1415;
        _1403 = _1431;
    }
    float _1433 = _1403;
    if (_1307)
    {
        float _1435 = fma(_1371, _1365, _1421);
        _1393 = _1435;
    }
    float _1437 = _1393;
    if (!_1307)
    {
        _1405 = _1301;
    }
    float _1439 = _1405;
    float _1441 = _1439;
    if (_1307)
    {
        float _1443 = _1429 * _1429;
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1449 = fma(_1437, _1437, _1433);
    float _1451 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1453 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1447);
    float _1455 = _1449 + _1445;
    float _1457 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1463 = rsqrt(_1455);
    float _1465 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1475 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1477 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1485 = -_1475;
    float _1487 = fma(_1485, _1373, 1.0);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = abs(_1481);
    float _1497 = log2(_1495);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1483);
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = _1463 * _1437;
    float _1505 = _1463 * _1429;
    float _1507 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1509 = _1463 * _1415;
    float _1511 = log2(_1487);
    float _1513 = _1503 + 1.0;
    float _1515 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = -_1517;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = 1.0 / _1515;
    float _1527 = -_1505;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1531);
    float _1537 = exp2(_1523);
    float _1539 = fma(_1529, 0.5, 0.5);
    float _1541 = _1511 * 0.693147182464599609375;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1535);
    float _1545 = fma(_1539, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1549 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1551 = sqrt(_1533);
    float _1553 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1555 = fma(_1539, _1545, -0.212114393711090087890625);
    float _1557 = _1549 * _1525;
    float _1559 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1561 = fma(_1539, _1555, 1.570728778839111328125);
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = -_1503;
    float _1567 = fma(_1537, _1513, _1565);
    float _1569 = _1559 * _1525;
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = fma(_1569, -0.5, 0.5);
    float _1575 = _1551 * 0.636619746685028076171875;
    float _1577 = -_1561;
    float _1579 = fma(_1575, _1577, 1.0);
    float3 _5481 = float3(_1563, _1573, _1547);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float3 _5492 = float3(_1563, _1573, _1547);
    float4 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5492, float3(0.0), isnan(_5492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5492, float3(0.0), isnan(_5492)), level(0.0)).xyzw;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1584.w;
    float2 _5509 = float2(_1579, _1571);
    float3 _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1598 = _1596.x;
    float _1600 = _1596.y;
    float _1602 = _1596.z;
    float _1604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1606 = int(_1604);
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1610 = _1608 != 0;
    float _1612 = -_699;
    float _1614 = _1612 + 1.0;
    bool _1616 = _151 > 0.5;
    float _1618 = -_701;
    float _1620 = _1618 + 1.0;
    bool _1622 = _163 > 0.5;
    out.m_72.x = _973;
    out.m_72.y = _989;
    out.m_72.z = _971;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1626 = _1624 != 0;
    float _1628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1630 = int(_1628);
    int _1632 = abs(_1033);
    float _1634 = -_671;
    float _1636 = _1634 + 1.0;
    int _1638 = abs(_1037);
    float _1640 = -_703;
    float _1642 = _1640 + 1.0;
    float _1644 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1646 = 0.0;
    float _1648 = _1559;
    float _1650 = _1549;
    if (_1610)
    {
        _1646 = 1.0;
    }
    float _1652 = _1646;
    out.m_74.x = _1265;
    out.m_74.y = _1263;
    out.m_74.z = _1267;
    float _1654 = float(uint(_1606));
    float _1656 = trunc(_527);
    int _1658 = int(_1656);
    float _1660 = _1652;
    if (!_1610)
    {
        _1660 = 1.2345600128173828125;
    }
    float _1662 = _1660;
    float _1664 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1666 = 0.0;
    if (_1610)
    {
        _1666 = 1.0;
    }
    float _1668 = _1666;
    float _1670 = _1668;
    if (!_1610)
    {
        _1670 = 7.345489978790283203125;
    }
    float _1672 = _1670;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1664);
    float _1676 = float(uint(_1630));
    float _1678 = 1.0 / _1654;
    int _1680 = ~_1630;
    int _1682 = _1680 + 1;
    float _1684 = _1672 * _151;
    int _1686 = ~_1630;
    int _1688 = _1686 + 1;
    float _1690 = 1.0 / _1676;
    float _1692 = trunc(_607);
    int _1694 = int(_1692);
    int _1696 = as_type<int>(_1678) + (-2);
    float _1698 = float(uint(_1658));
    float _1700 = as_type<float>(_1696) * _1698;
    int _1702 = as_type<int>(_1690) + (-2);
    float _1704 = floor(_1684);
    int _1706 = ~_1606;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1694));
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1717 = uint(_1714);
    float _1719 = as_type<float>(_1702) * _1710;
    float _1721 = _1710;
    if (_1610)
    {
        _1721 = _151;
    }
    float _1723 = _1721;
    float _1725 = _1723;
    if (!_1610)
    {
        _1725 = _155;
    }
    float _1727 = _1725;
    float _1729 = -_1704;
    float _1731 = _1684 + _1729;
    float _1733 = trunc(_1719);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1662 * _1727;
    int _1741 = _1708 * int(_1717);
    int _1743 = _1741 + _1658;
    float _1745 = floor(_1739);
    float _1747 = float(uint(_1743));
    float _1749 = in.m_53.w;
    int _1751 = _1682 * int(_1737);
    int _1753 = _1751 + _1694;
    float _1755 = as_type<float>(_1696) * _1747;
    float _1757 = float(uint(_1753));
    float _1759 = trunc(_1755);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    float _1769 = -_1745;
    float _1771 = _1739 + _1769;
    float _1773 = as_type<float>(_1702) * _1757;
    float _1775 = -_233;
    int _1777 = _1616 ? as_type<int>(_1775) : as_type<int>(_233);
    float _1779 = float(_1606);
    bool _1781 = !_1767;
    float _1783 = _1781 ? _233 : as_type<float>(_1777);
    float _1785 = trunc(_1773);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    bool _1791 = _155 > 0.5;
    float _1793 = _1731 * _1779;
    float _1795 = float(_1694);
    float _1797 = _1783 + 0.5;
    bool _1799 = _1749 > 0.5;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[80].x, _347);
    int _1803 = int(_1717) + int(_1763);
    float _1805 = trunc(_1793);
    int _1807 = int(_1805);
    int _1809 = ~_1606;
    int _1811 = _1809 + 1;
    float _1813 = -_1614;
    float _1815 = fma(_1783, _1813, _1801);
    float _1817 = float(_1630);
    int _1819 = int(_1737) + int(_1789);
    int _1821 = _1811 * _1803;
    int _1823 = _1821 + _1658;
    float _1825 = float(_1658);
    float _1827 = _1817 * _297;
    int _1829 = ~_1630;
    int _1831 = _1829 + 1;
    float _1833 = _1771 * _1817;
    bool _1835 = _1825 >= _1779;
    bool _1837 = isnan(_1825);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1779);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1779 * _297;
    bool _1849 = uint(_1823) >= uint(_1606);
    int _1851 = _1831 * _1819;
    int _1853 = _1851 + _1694;
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = !_1849;
    int _1861 = _1859 ? 0 : (-1);
    bool _1863 = _1795 >= _1817;
    bool _1865 = isnan(_1795);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1817);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1877 = _1875 != 0;
    float _1879 = -_213;
    int _1881 = _1791 ? as_type<int>(_1879) : as_type<int>(_213);
    float _1883 = trunc(_1833);
    int _1885 = int(_1883);
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1889 = _1887 != 0;
    int _1891 = ~_1803;
    int _1893 = _1891 + _1861;
    int _1895 = _1893 + 1;
    bool _1897 = !_1877;
    float _1899 = _1897 ? _213 : as_type<float>(_1881);
    bool _1901 = !_1889;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1606 * _1895;
    int _1907 = _1905 + _1658;
    bool _1909 = uint(_1853) >= uint(_1630);
    float _1911 = trunc(_1873);
    int _1913 = int(_1911);
    bool _1915 = _1606 == 0;
    int _1917 = abs(_1903);
    float _1919 = _1899 + (-0.5);
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1923 = _1921 != 0;
    bool _1925 = !_1909;
    int _1927 = _1925 ? 0 : (-1);
    float _1929 = trunc(_1847);
    int _1931 = int(_1929);
    bool _1933 = !_1915;
    int _1935 = _1933 ? _1907 : (-1);
    float _1937 = -_1919;
    float _1939 = -_669;
    float _1941 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1939);
    bool _1943 = !_1923;
    int _1945 = _1943 ? 0 : 1;
    int _1947 = _1807 * _1917;
    int _1949 = _1947 + _1658;
    int _1951 = ~_1819;
    int _1953 = _1951 + _1927;
    int _1955 = _1953 + 1;
    float _1957 = fma(_1899, _1620, _1941);
    int _1959 = ~_1857;
    int _1961 = _1959 + 1;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1827);
    int _1967 = int(_1965);
    int _1969 = abs(_1945);
    int _1971 = _1630 * _1955;
    int _1973 = _1971 + _1694;
    bool _1975 = _1630 == 0;
    int _1977 = _1935 * _1963;
    int _1979 = _1606 + (-1);
    int _1981 = abs(_521);
    bool _1983 = !_1975;
    int _1985 = _1983 ? _1973 : (-1);
    int _1987 = _1885 * _1969;
    int _1989 = _1987 + _1694;
    int _1991 = abs(_525);
    int _1993 = _1857 * _1979;
    int _1995 = _1993 + _1977;
    int _1997 = ~_1913;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = abs(_531);
    int _2005 = _1995 * _1981;
    int _2007 = _1630 + (-1);
    int _2009 = _1985 * _2001;
    bool _2011 = !_1626;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1931 * _1991;
    int _2017 = _2015 + _2005;
    int _2019 = _1913 * _2007;
    int _2021 = _2019 + _2009;
    int _2023 = abs(_1029);
    int _2025 = abs(_2013);
    int _2027 = _1949 * _2003;
    int _2029 = _2027 + _2017;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2033 = _2031 != 0;
    int _2035 = _2021 * _2023;
    float _2037 = -_233;
    int _2039 = _1622 ? as_type<int>(_2037) : as_type<int>(_233);
    int _2041 = abs(_1041);
    int _2043 = _1807 * _2025;
    int _2045 = _2043 + _2029;
    float _2047 = float(uint(_1949));
    bool _2049 = !_2033;
    float _2051 = _2049 ? _233 : as_type<float>(_2039);
    float _2053 = as_type<float>(_1696) * _2047;
    float _2055 = float(uint(_2045));
    float _2057 = _2051 + 0.5;
    int _2059 = ~_1606;
    int _2061 = _2059 + 1;
    int _2063 = _1967 * _1632;
    int _2065 = _2063 + _2035;
    int _2067 = ~_1630;
    int _2069 = _2067 + 1;
    float _2071 = trunc(_2053);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[85].x, _695);
    float _2079 = as_type<float>(_1696) * _2055;
    int _2081 = _1989 * _1638;
    int _2083 = _2081 + _2065;
    int _2085 = ~_1606;
    int _2087 = _2085 + 1;
    float _2089 = -_1636;
    float _2091 = fma(_2051, _2089, _2077);
    float _2093 = float(uint(_1989));
    int _2095 = _1885 * _2041;
    int _2097 = _2095 + _2083;
    float _2099 = trunc(_2079);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = as_type<float>(_1702) * _2093;
    float _2107 = float(uint(_2097));
    int _2109 = _2087 * int(_2075);
    int _2111 = _2109 + _1949;
    int _2113 = ~_1630;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1702) * _2107;
    float _2119 = trunc(_2105);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(uint(_2111));
    int _2127 = ~_1606;
    int _2129 = _2127 + 1;
    int _2131 = _2061 * int(_2103);
    int _2133 = _2131 + _2045;
    float _2135 = as_type<float>(_1696) * _2125;
    float _2137 = -_213;
    int _2139 = _1799 ? as_type<int>(_2137) : as_type<int>(_213);
    float _2141 = trunc(_2117);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2149 = _2147 != 0;
    float _2151 = float(uint(_2133));
    bool _2153 = !_2149;
    float _2155 = _2153 ? _213 : as_type<float>(_2139);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    float _2161 = as_type<float>(_1696) * _2151;
    int _2163 = _2115 * int(_2123);
    int _2165 = _2163 + _1989;
    float _2167 = _2155 + (-0.5);
    float _2169 = trunc(_2135);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2177 = _2175 != 0;
    float _2179 = float(uint(_2165));
    float _2181 = -_2167;
    float _2183 = -_675;
    float _2185 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2183);
    int _2187 = _2069 * int(_2145);
    int _2189 = _2187 + _2097;
    float _2191 = trunc(_2161);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    float _2197 = as_type<float>(_1702) * _2179;
    float _2199 = float(uint(_2189));
    float _2201 = fma(_2155, _1642, _2185);
    float _2203 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2205 = as_type<float>(_1702) * _2199;
    float _2207 = trunc(_2197);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    out.m_76.x = _1815;
    out.m_76.y = _1957;
    out.m_76.z = _2091;
    out.m_76.w = _2201;
    float _2213 = -_901;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2203);
    int _2217 = int(_2075) + int(_2173);
    float _2219 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2221 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2223 = trunc(_2205);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = int(_2103) + int(_2195);
    float _2231 = -_901;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2219);
    float _2235 = -_901;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2221);
    int _2239 = _2129 * _2229;
    int _2241 = _2239 + _2045;
    float _2243 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2245 = int(_2123) + int(_2211);
    float _2247 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2215);
    int _2249 = ~_1630;
    int _2251 = _2249 + 1;
    float _2253 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2255 = uint(_2241) >= uint(_1606);
    float _2257 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2259 = ~_1606;
    int _2261 = _2259 + 1;
    float _2263 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2265 = !_2255;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2243);
    int _2271 = int(_2145) + int(_2227);
    float _2273 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2237);
    int _2275 = ~_2229;
    int _2277 = _2275 + _2267;
    int _2279 = _2277 + 1;
    float _2281 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2283 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2253);
    int _2285 = _1688 * _2271;
    int _2287 = _2285 + _2097;
    float _2289 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2257);
    int _2291 = _1606 * _2279;
    int _2293 = _2291 + _2045;
    float _2295 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2297 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2299 = uint(_2287) >= uint(_1630);
    float _2301 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2281);
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2293 : (-1);
    float _2307 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    bool _2309 = !_2299;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2315 = _2305 & 3;
    bool _2317 = _2315 != 0;
    float _2319 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2321 = ~_2271;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2301);
    bool _2329 = uint(_2315) > 1u;
    float _2331 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 >> 31;
    int _2335 = _1630 * _2325;
    int _2337 = _2335 + _2097;
    int _2339 = _2305 & 3;
    bool _2341 = _2339 != 0;
    float _2343 = _2319 * _2247;
    int _2345 = _2333 & 3;
    bool _2347 = !_1975;
    int _2349 = _2347 ? _2337 : (-1);
    int _2351 = _2341 ? 0 : 1;
    int _2353 = _2251 * _2245;
    int _2355 = _2353 + _1989;
    int _2357 = _2305 + _2345;
    int _2359 = _2261 * _2217;
    int _2361 = _2359 + _1949;
    int _2363 = _2349 >> 31;
    int _2365 = ~_2351;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2357 >> 2;
    int _2373 = _2369;
    if (!_2329)
    {
        int _2375 = ~_2351;
        int _2377 = _2375 + 1;
        _2373 = _2377;
    }
    int _2379 = _2373;
    float _2381 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2313);
    bool _2383 = uint(_2315) >= 2u;
    int _2385 = _2363 & 3;
    int _2387 = _2371 << 4;
    int _2389 = _2387 + 368;
    float _2391 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2283);
    bool _2393 = uint(_2361) >= uint(_1606);
    float _2395 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2269);
    int _2397 = _2383 ? 0 : 1;
    int _2399 = _2389 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    bool _2417 = uint(_2355) >= uint(_1630);
    float _2419 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2307);
    int _2421 = _2349 + _2385;
    float _2423 = fma(_2331, _2391, _2343);
    bool _2425 = !_2393;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2421 >> 2;
    uint _2431 = uint(int(uint(_2389) >> uint(2)));
    uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
    int _2435 = int(_2431) & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    int _2439 = int(_2431) + 1;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    int _2443 = _2439 & 3;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[int(_2441)][_2443];
    bool _2447 = _2315 != 3;
    float _2449 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2289);
    int _2451 = _2429 << 4;
    int _2453 = _2451 + 512;
    float _2455 = _2319 * _2263;
    bool _2457 = !_2417;
    int _2459 = _2457 ? 0 : (-1);
    int _2461 = ~_2217;
    int _2463 = _2461 + _2427;
    int _2465 = _2463 + 1;
    uint _2467 = uint(int(uint(_2453) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = ~_2245;
    int _2485 = _2483 + _2459;
    int _2487 = _2485 + 1;
    float _2489 = fma(_2331, _2327, _2455);
    bool _2491 = !_2317;
    int _2493 = _2491 ? 0 : 1;
    out.m_78.x = _2391;
    out.m_78.y = _2327;
    out.m_78.z = _2449;
    int _2495 = _2349 & 3;
    bool _2497 = _2495 != 0;
    float _2499 = _2319 * _2273;
    int _2501 = ~_2397;
    int _2503 = _2501 + 1;
    int _2505 = _2503 + 1;
    int _2507 = _2453 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    uint _2511 = uint(int(uint(int(_2509)) >> uint(2)));
    int _2513 = int(_2509) & 3;
    float _2515 = (*spvDescriptorSet0.vp_c9)._m0[int(_2511)][_2513];
    int _2517 = int(_2509) + 1;
    uint _2519 = uint(int(uint(_2517) >> uint(2)));
    int _2521 = _2517 & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = _2349 & 3;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2331, _2449, _2499);
    int _2531 = _2505;
    float _2533 = _2489;
    if (_2447)
    {
        int _2535 = ~_2397;
        int _2537 = _2535 + 1;
        _2531 = _2537;
    }
    int _2539 = _2531;
    int _2541 = _1606 * _2465;
    int _2543 = _2541 + _1949;
    bool _2545 = uint(_2495) > 1u;
    int _2547 = _1630 * _2487;
    int _2549 = _2547 + _1989;
    int _2551 = abs(_2379);
    bool _2553 = !_2497;
    int _2555 = _2553 ? 0 : 1;
    bool _2557 = _2495 != 3;
    int _2559 = _2527 ? 0 : 1;
    bool _2561 = uint(_2495) >= 2u;
    int _2563 = abs(_2493);
    int _2565 = _2561 ? 0 : 1;
    int _2567 = ~_2559;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = _2571;
    int _2581 = _2577;
    if (!_2545)
    {
        int _2583 = ~_2559;
        int _2585 = _2583 + 1;
        _2579 = _2585;
    }
    int _2587 = _2579;
    if (_2557)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2581 = _2591;
    }
    int _2593 = _2581;
    int _2595 = ~_2551;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = abs(_2555);
    int _2603 = _2599 * as_type<int>(_2445);
    int _2605 = ~_2563;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2587);
    int _2613 = abs(_2539);
    int _2615 = _2609 * as_type<int>(_2437);
    int _2617 = _2615 + _2603;
    int _2619 = ~_2611;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2319, _2319, 1.0);
    int _2627 = ~_2613;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    bool _2633 = _2315 != 3;
    int _2635 = _2623 * as_type<int>(_2481);
    int _2637 = ~_2601;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2631 * as_type<int>(_2407);
    int _2645 = _2643 + _2617;
    bool _2647 = !_2633;
    int _2649 = _2647 ? 0 : (-1);
    float _2651 = rsqrt(_2625);
    bool _2653 = !_2159;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _2641 * as_type<int>(_2473);
    int _2659 = _2657 + _2635;
    int _2661 = abs(_2649);
    int _2663 = abs(_2593);
    int _2665 = abs(_2655);
    int _2667 = ~_2663;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    bool _2673 = !_2177;
    int _2675 = _2673 ? 0 : 1;
    int _2677 = ~_2661;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2671 * as_type<int>(_2515);
    int _2685 = _2683 + _2659;
    int _2687 = abs(_2675);
    int _2689 = ~_2665;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2681 * as_type<int>(_2415);
    int _2697 = _2695 + _2645;
    bool _2699 = !_1915;
    int _2701 = _2699 ? _2543 : (-1);
    bool _2703 = _2495 != 3;
    int _2705 = _2697 * _2693;
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = _2319 * _2651;
    bool _2715 = !_2703;
    int _2717 = _2715 ? 0 : (-1);
    int _2719 = _2701 * _2665;
    int _2721 = _2719 + _2705;
    float _2723 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2725 = !_1975;
    int _2727 = _2725 ? _2549 : (-1);
    float _2729 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _2731 = abs(_2717);
    float _2733 = exp2(_2723);
    int _2735 = ~_2731;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = _2729 + _1515;
    bool _2743 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1291);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2729;
    out.gl_Position.w = _1515;
    int _2753 = _2739 * as_type<int>(_2523);
    int _2755 = _2753 + _2685;
    float _2757 = -_2381;
    float _2759 = _2713 * _2757;
    float _2761 = _2741 * 0.5;
    int _2763 = _2755 * _2711;
    float _2765 = -_2419;
    float _2767 = _2713 * _2765;
    int _2769 = _2727 * _2687;
    int _2771 = _2769 + _2763;
    float _2773 = -_2395;
    float _2775 = _2713 * _2773;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2651, _2263, _2759);
    float _2783 = fma(_2651, _2273, _2767);
    float _2785 = fma(_2651, _2247, _2775);
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = _1515 * 0.5;
    float _2791 = _1549 + _1515;
    float _2793 = float(_2771);
    float _2795 = _2787 * _1581;
    out.m_80.x = _2785;
    out.m_80.y = _2781;
    out.m_80.z = _2783;
    float _2797 = fma(_1559, -0.5, _2789);
    float _2799 = _2395 + _2423;
    float _2801 = _1592 * _2795;
    float _2803 = _1602 * _2795;
    float _2805 = float(_2721);
    float _2807 = _2791 * 0.5;
    float _2809 = fma(_1598, _2801, _1586);
    float _2811 = _2381 + _2489;
    float _2813 = _2419 + _2529;
    float _2815 = fma(_1600, _2801, _1588);
    float _2817 = fma(_1592, _2803, _1590);
    float _2819 = -_2787;
    float _2821 = _2819 + 1.0;
    out.m_82.x = _2805;
    out.m_82.y = _2793;
    float _2823 = _2783;
    float _2825 = _2781;
    float _2827 = _2821;
    if (!_2751)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2829 = _1648;
    float _2831 = _1592 * _2821;
    out.m_84.x = _2807;
    out.m_84.y = _2797;
    out.m_84.z = _2761;
    out.m_84.w = _1515;
    float _2833 = _2829;
    float _2835 = _2829;
    if (!_2751)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _1650;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2751)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2843 = _2533;
    out.m_86.x = _2809;
    out.m_86.y = _2815;
    out.m_86.z = _2817;
    out.m_86.w = _2831;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2751)
    {
        _2823 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2823;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2751)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2855 = _2825;
    out.m_88.x = _2799;
    out.m_88.y = _2811;
    out.m_88.z = _2813;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2751)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2861 = _2827;
    bool _2863 = !_2751;
    float _2865 = _2861;
    float _2867 = _2861;
    if (!_2863)
    {
        bool _2869 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2871 = isnan(_1291);
        bool _2873 = _2869 || _2871;
        bool _2875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2877 = _2873 || _2875;
        if (!_2877)
        {
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2881 = _1291 + _2879;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2883;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2891 = 1.0 / _2885;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2909 = _2881 * _2891;
            float _2911 = precise::clamp(_2909, 0.0, 1.0);
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2917 = fma(_2911, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2919 = fma(_2911, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2921 = fma(_2911, _2895, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2911, _2899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2925 = fma(_2911, _2903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2927 = fma(_2911, _2907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2841 = _2921;
            _2859 = _2925;
            _2835 = _2917;
            _2853 = _2923;
            _2847 = _2919;
            _2867 = _2927;
            _2929 = true;
        }
        else
        {
            bool _2931 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2933 = isnan(_1291);
            bool _2935 = _2931 || _2933;
            bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2939 = _2935 || _2937;
            if (!_2939)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2941 = _2833;
            _2835 = _2941;
            if (!_2939)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2943 = _2839;
            _2841 = _2943;
            if (!_2939)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2945 = _2845;
            _2847 = _2945;
            if (!_2939)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2947 = _2851;
            _2853 = _2947;
            if (!_2939)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2949 = _2857;
            _2859 = _2949;
            if (!_2939)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2951 = _2865;
            bool _2953 = !_2939;
            _2867 = _2951;
            if (!_2953)
            {
                bool _2955 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2957 = isnan(_1291);
                bool _2959 = _2955 || _2957;
                bool _2961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2963 = _2959 || _2961;
                if (!_2963)
                {
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2967 = _1291 + _2965;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2969;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2977 = 1.0 / _2971;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2995 = _2967 * _2977;
                    float _2997 = precise::clamp(_2995, 0.0, 1.0);
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3003 = fma(_2997, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3005 = fma(_2997, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3007 = fma(_2997, _2981, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2997, _2985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3011 = fma(_2997, _2989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3013 = fma(_2997, _2993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2841 = _3007;
                    _2859 = _3011;
                    _2835 = _3003;
                    _2853 = _3009;
                    _2847 = _3005;
                    _2867 = _3013;
                    _2929 = true;
                }
                else
                {
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2929 = false;
    float _3015 = _2841;
    float _3017 = _2859;
    float _3019 = _2835;
    float _3021 = _2853;
    float _3023 = _2847;
    float _3025 = _2867;
    float _3027 = fma(_2811, -0.5, 0.5);
    float _3029 = precise::clamp(_3027, 0.0, 1.0);
    float _3031 = -_3015;
    float _3033 = _3031 + _3017;
    float _3035 = -_3019;
    float _3037 = _3035 + _3021;
    float _3039 = -_3023;
    float _3041 = _3039 + _3025;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3029, _3033, _3015);
    float _3047 = fma(_3029, _3037, _3019);
    float _3049 = fma(_3029, _3041, _3023);
    float _3051 = _3045 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3053 = fma(_3047, 0.298911988735198974609375, _3051);
    float _3055 = fma(_3049, 0.114477999508380889892578125, _3053);
    out.m_90.x = 0.0;
    float _3057 = -_3055;
    float _3059 = _3047 + _3057;
    float _3061 = -_3055;
    float _3063 = _3045 + _3061;
    float _3065 = -_3055;
    float _3067 = _3049 + _3065;
    float _3069 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = fma(_3059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3073 = fma(_3063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3075 = fma(_3067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    out.m_92.w = _3069;
    out.m_94.x = _3071;
    out.m_94.y = _3073;
    out.m_94.z = _3075;
    if (!_3043)
    {
        return out;
    }
    float _3077 = -_1263;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3081 = -_1265;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3085 = -_1267;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3089 = _3079 * _3079;
    float _3091 = fma(_3083, _3083, _3089);
    float _3093 = fma(_3087, _3087, _3091);
    float _3095 = sqrt(_3093);
    float _3097 = rsqrt(_3093);
    float _3099 = -_3095;
    float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = _3083 * _3097;
    float _3109 = _3079 * _3097;
    float _3111 = abs(_3105);
    float _3113 = log2(_3111);
    float _3115 = _3087 * _3097;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3119 = _2811 * _3109;
    float _3121 = -_3109;
    float _3123 = -_3117;
    float _3125 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3123);
    float _3127 = fma(_2799, _3107, _3119);
    float _3129 = -_3115;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3125);
    float _3133 = fma(_2813, _3115, _3127);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3139 = _3131 + _3137;
    float _3141 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = exp2(_3141);
    float _3149 = _3147 * _3145;
    float _3151 = _3135 * _3149;
    float _3153 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3157 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3153;
    out.m_90.y = _3155;
    out.m_90.z = _3157;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2929 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_44.w;
    float _110 = in.m_46.w;
    float _112 = trunc(_108);
    int _115 = int(_112);
    float _117 = -_110;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _119;
    bool _123 = _115 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_115);
    float _129 = _119;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _125;
    if (!_123)
    {
        out.m_51.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3226 = as_type<float>(_137);
        out.gl_Position.z = _3226;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _141 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_110);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = in.m_53.x;
    float _153 = float(_115);
    float _155 = in.m_53.y;
    bool _157 = _119 >= _153;
    bool _159 = !_149;
    bool _161 = _157 || _159;
    float _163 = in.m_53.z;
    if (_161)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _139 = as_type<int>(_167);
    }
    int _169 = _139;
    out.m_55.x = _151;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3289 = as_type<float>(_169);
        out.gl_Position.z = _3289;
    }
    out.m_55.y = _155;
    out.m_55.z = _163;
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = 1.0 / _153;
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = _119 * _173;
    int _201 = as_type<int>(_171) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_171) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_207;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = _177 * _183;
    float _217 = _177 * _189;
    float _219 = fma(_175, _181, _215);
    float _221 = _177 * _195;
    float _223 = fma(_175, _187, _217);
    float _225 = fma(_179, _185, _219);
    float _227 = fma(_175, _193, _221);
    float _229 = fma(_179, _191, _223);
    bool _231 = !_203;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_179, _197, _227);
    bool _237 = !_209;
    float _239 = _199;
    float _241 = _187;
    float _243 = _191;
    float _245 = _229;
    if (!_237)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _239 = _259;
    }
    float _261 = _239;
    float _263 = _151 * 2.0;
    float _265 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _267 = _155 * 2.0;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _271 = floor(_263);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = -_269;
    float _279 = fma(_265, 2.0, _277);
    float _281 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _163 * 2.0;
    float _289 = floor(_267);
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = _173 * _119;
    float _299 = fma(_281, -2.0, _291);
    float _301 = _151 + _163;
    float _303 = 1.0 / _285;
    float _305 = _151 + _155;
    float _307 = _301 + (-1.0);
    bool _309 = _271 >= 0.0;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan(0.0);
    bool _317 = _313 || _315;
    float _319 = _305 + (-1.0);
    bool _321 = _271 > 0.0;
    float _323 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _325 = floor(_287);
    float _327 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _329;
    int _333 = as_type<int>(_307);
    if (_275)
    {
        _333 = 0;
    }
    int _335 = _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _261 + _337;
    int _341 = _335;
    if (!_275)
    {
        _341 = 1;
    }
    int _343 = _341;
    float _345 = -_119;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _349 = _317 ? 0 : 1;
    float _351 = 1.0 / _295;
    bool _353 = _289 > 0.0;
    float _355 = _339 * _303;
    bool _357 = _289 >= 0.0;
    bool _359 = isnan(_289);
    bool _361 = _357 || _359;
    bool _363 = isnan(0.0);
    bool _365 = _361 || _363;
    bool _367 = _343 != 1;
    float _369 = 1.0 / _331;
    float _371 = _155 + _163;
    float _373 = _371 + (-1.0);
    bool _375 = _325 > 0.0;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _383 = int(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _391 = _325 >= 0.0;
    bool _393 = isnan(_325);
    bool _395 = _391 || _393;
    bool _397 = isnan(0.0);
    bool _399 = _395 || _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _261 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _261 + _413;
    float _417 = fma(_403, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _419 = fma(_407, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = _411 * _351;
    float _423 = _415 * _369;
    int _425 = _399 ? 0 : 1;
    float _427 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _429 = int(_427);
    float _431 = _411;
    if (!_367)
    {
        _431 = _155;
    }
    float _433 = _431;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _437 = _433;
    if (_367)
    {
        _437 = _151;
    }
    float _439 = _437;
    float _441 = fma(_379, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _443 = fma(_387, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _445 = ~_425;
    int _447 = _445 + 1;
    int _449 = _447 + 1;
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[83].z, _435);
    int _453 = _449;
    float _455 = _439;
    if (!_375)
    {
        int _457 = ~_425;
        int _459 = _457 + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _465 = log2(_463);
    float _467 = float(_383);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = as_type<float>(_383);
    if (!_367)
    {
        _481 = _155;
    }
    float _483 = _481;
    float _485 = 1.0 / _467;
    float _487 = _483;
    if (_367)
    {
        _487 = _151;
    }
    float _489 = _487;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _493 = ~_349;
    int _495 = _493 + 1;
    int _497 = _495 + 1;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _501 = _497;
    if (!_321)
    {
        int _503 = ~_349;
        int _505 = _503 + 1;
        _501 = _505;
    }
    int _507 = _501;
    float _509 = _489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _511 = _365 ? 0 : 1;
    if (!_367)
    {
        _455 = _163;
    }
    float _513 = _455;
    float _515 = -_491;
    float _517 = fma(_509, 2.0, _515);
    bool _519 = !_475;
    int _521 = _519 ? 0 : 1;
    bool _523 = !_471;
    int _525 = _523 ? 0 : 1;
    float _527 = _485 * _119;
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _513;
    if (_367)
    {
        _533 = _155;
    }
    float _535 = _533;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _543 = _541 != 0;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _547 = _545 != 0;
    int _549 = ~_511;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[83].w, _499);
    int _557 = _553;
    float _559 = _535;
    if (!_353)
    {
        int _561 = ~_511;
        int _563 = _561 + 1;
        _557 = _563;
    }
    int _565 = _557;
    float _567 = float(_429);
    bool _569 = !_547;
    int _571 = _569 ? 0 : 1;
    bool _573 = !_543;
    int _575 = _573 ? 0 : 1;
    float _577 = 1.0 / _567;
    bool _579 = !_539;
    int _581 = _579 ? 0 : 1;
    if (!_367)
    {
        _559 = _163;
    }
    float _583 = _559;
    float _585 = _583;
    if (_367)
    {
        _585 = _155;
    }
    float _587 = _585;
    int _589 = abs(_571);
    int _591 = abs(_575);
    int _593 = abs(_581);
    float _595 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = float(_461);
    float _599 = _465 * _119;
    float _601 = float(_507);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _605 = float(_591);
    float _607 = _577 * _119;
    float _609 = float(_593);
    float _611 = fma(_595, -2.0, _603);
    float _613 = exp2(_599);
    float _615 = _605 * _601;
    float _617 = _609 * _597;
    float _619 = in.m_68.x;
    float _621 = in.m_68.y;
    float _623 = in.m_68.z;
    float _625 = float(_565);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _629 = float(_589);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _633 = 1.0 + _631;
    float _635 = _615 * (-2.0);
    bool _637 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _639 = isnan(1.0);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _645 = _641 || _643;
    float _647 = 1.0 / _633;
    float _649 = _629 * _625;
    float _651 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].w, _627);
    float _653 = -_613;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _665 = _661 || _663;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _299);
    float _671 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _451);
    float _673 = _665 ? _655 : 0.0;
    float _675 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _611);
    float _677 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _679 = fma(_389, _635, _389);
    bool _681 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _683 = isnan(_261);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_119;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[81].x, _517);
    float _697 = _617 * (-2.0);
    float _699 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _677);
    float _701 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _651);
    float _703 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _555);
    float _705 = fma(_635, _621, _621);
    if (_645)
    {
        float _707 = _673 * _647;
        _129 = _707;
    }
    float _709 = _129;
    bool _711 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _713 = isnan(_261);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = -_691;
    float _725 = _723 + 1.0;
    float _727 = fma(_327, _697, _327);
    float _729 = _649 * (-2.0);
    float _731 = _155 + (-0.5);
    float _733 = fma(_697, _619, _619);
    bool _735 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _737 = isnan(_261);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _721 * _725;
    float _749 = fma(_729, _623, _623);
    bool _751 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _753 = isnan(_261);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].y, _705);
    float _765 = _151 + (-0.5);
    float _767 = _163 + (-0.5);
    float _769 = -_721;
    float _771 = _769 + 1.0;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = fma(_323, _729, _323);
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].x, _733);
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _783 = fma(_679, _709, _763);
    float _785 = _745 * _771;
    float _787 = _761 * _775;
    float _789 = fma(_727, _709, _779);
    float _791 = fma(_777, _709, _781);
    float _793 = _783 * 0.15915493667125701904296875;
    float _795 = in.m_70.x;
    float _797 = in.m_70.y;
    float _799 = _441 * _787;
    float _801 = -_761;
    float _803 = _801 + 1.0;
    float _805 = _443 * _787;
    float _807 = in.m_44.x;
    float _809 = in.m_44.y;
    float _811 = in.m_44.z;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _799);
    float _819 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _805);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _821;
    float _825 = fma(_815, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _827 = fma(_417, _785, _817);
    float _829 = fma(_419, _785, _819);
    float _831 = fma(_823, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _833 = _789 * 0.15915493667125701904296875;
    float _835 = fma(_825, _747, _827);
    float _837 = _791 * 0.15915493667125701904296875;
    float _839 = fma(_831, _747, _829);
    float _841 = _793 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].x, _835);
    float _847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    float _849 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[146].y, _839);
    float _851 = _845 * _795;
    float _853 = _849 * _797;
    float _855 = _793 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _861 = _195 * _809;
    float _863 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _867 = _183 * _809;
    float _869 = fma(_193, _807, _861);
    float _871 = _833 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _863 * _859;
    float _877 = _865 * _847;
    float _879 = fma(_181, _807, _867);
    float _881 = fma(_197, _811, _869);
    float _883 = _189 * _809;
    float _885 = _837 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = fma(_187, _807, _883);
    float _891 = _833 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _873 * _843;
    float _897 = _873 * _857;
    float _899 = _837 * 6.283185482025146484375;
    float _901 = sin(_899);
    float _903 = _873 * _887;
    float _905 = in.m_62.w;
    float _907 = _903 * _877;
    float _909 = _893 * _857;
    float _911 = _893 * _887;
    float _913 = _893 * _843;
    float _915 = _857 * _887;
    float _917 = _843 * _887;
    float _919 = in.m_66.w;
    float _921 = _911 * _877;
    float _923 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _925 = fma(_901, _909, _895);
    float _927 = -_877;
    float _929 = _901 * _927;
    float _931 = -_897;
    float _933 = fma(_901, _913, _931);
    float _935 = fma(_901, _895, _909);
    float _937 = fma(_925, _875, _921);
    float _939 = -_913;
    float _941 = fma(_901, _897, _939);
    float _943 = fma(_915, _875, _929);
    float _945 = in.m_64.w;
    float _947 = fma(_933, _923, _937);
    float _949 = fma(_941, _875, _907);
    float _951 = fma(_917, _923, _943);
    float _953 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _957 = fma(_935, _923, _949);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[26].x, _953);
    float _961 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[24].x, _955);
    float _963 = fma(_185, _811, _879);
    float _965 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _967 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[26].z, _959);
    float _969 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[24].z, _961);
    float _971 = _881 + _919;
    float _973 = _963 + _905;
    float _975 = _967 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[25].x, _965);
    float _981 = fma(_191, _811, _889);
    float _983 = _971 + _975;
    float _985 = _973 + _977;
    float _987 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[25].z, _979);
    float _989 = _981 + _945;
    float _991 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _993 = _983 + _991;
    float _995 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _997 = _985 + _995;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _993 * _993;
    float _1003 = fma(_997, _997, _1001);
    float _1005 = _989 + _999;
    float _1007 = sqrt(_1003);
    bool _1009 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1013 = _1011 != 0;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1021 = _1019 != 0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1025 = _1023 != 0;
    bool _1027 = !_1017;
    int _1029 = _1027 ? 0 : 1;
    bool _1031 = !_1013;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_1021;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = !_1025;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = _889;
    float _1045 = _807;
    float _1047 = _1003;
    if (!_1009)
    {
        _241 = _985;
    }
    float _1049 = _241;
    float _1051 = _1049;
    if (!_1009)
    {
        _243 = _983;
    }
    float _1053 = _243;
    float _1055 = _1053;
    if (!_1009)
    {
        _1043 = _1005;
    }
    float _1057 = _1043;
    bool _1059 = !_1009;
    float _1061 = _1057;
    if (!_1059)
    {
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1067 = _1007 + _1065;
        float _1069 = _1005 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = rsqrt(_1003);
        float _1073 = _1067 * _1063;
        float _1075 = _1073 * 0.15915493667125701904296875;
        float _1077 = _1075 * 6.283185482025146484375;
        float _1079 = cos(_1077);
        float _1081 = _1075 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1079 + (-1.0);
        float _1087 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1083, _1069, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1091 = fma(_1005, _1079, _1087);
        float _1093 = _1071 * _1089;
        float _1095 = fma(_997, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1097 = fma(_993, _1093, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1061 = _1091;
        _1051 = _1095;
        _1055 = _1097;
        _1045 = _1075;
    }
    float _1099 = _1061;
    float _1101 = _1051;
    float _1103 = _1055;
    float _1105 = _1045;
    float _1107 = -_989;
    float _1109 = _1107 + _1099;
    float _1111 = -_973;
    float _1113 = _1111 + _1101;
    float _1115 = -_971;
    float _1117 = _1115 + _1103;
    float _1119 = _1109 * _1109;
    bool _1121 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1123 = isnan(0.5);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_1113, _1113, _1119);
    float _1133 = fma(_1117, _1117, _1131);
    float _1135 = sqrt(_1133);
    bool _1137 = _1135 > 0.0;
    bool _1139 = !_1137;
    float _1141 = _1101;
    float _1143 = _1099;
    float _1145 = _1103;
    float _1147 = _1113;
    float _1149 = _1105;
    if (!_1139)
    {
        float _1151 = _229 * _229;
        float _1153 = fma(_225, _225, _1151);
        float _1155 = fma(_235, _235, _1153);
        float _1157 = rsqrt(_1133);
        float _1159 = sqrt(_1155);
        float _1161 = _1113 * _1157;
        float _1163 = _1109 * _1157;
        float _1165 = _1117 * _1157;
        bool _1167 = _1159 > 0.0;
        bool _1169 = !_1167;
        _1147 = _1163;
        _1149 = _1159;
        _1047 = _1165;
        if (!_1169)
        {
            float _1171 = rsqrt(_1155);
            float _1173 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1175 = _229 * _1171;
            float _1177 = _225 * _1171;
            float _1179 = _235 * _1171;
            float _1181 = _1163 * _1175;
            float _1183 = fma(_1161, _1177, _1181);
            float _1185 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1187 = fma(_1165, _1179, _1183);
            float _1189 = _1187 * _1185;
            float _1191 = fma(_225, _1189, _1101);
            float _1193 = fma(_229, _1189, _1099);
            float _1195 = fma(_235, _1189, _1103);
            _1141 = _1191;
            _1143 = _1193;
            _1145 = _1195;
            _1147 = _1183;
            _1149 = _1175;
        }
    }
    float _1197 = _1141;
    float _1199 = _1143;
    float _1201 = _1145;
    float _1203 = _1147;
    float _1205 = _1149;
    float _1207 = _1047;
    float _1209 = _1199;
    float _1211 = _1197;
    float _1213 = _1201;
    float _1215 = _1205;
    float _1217 = _1207;
    if (!_1129)
    {
        float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1221 = _989 + _1219;
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1225 = _973 + _1223;
        float _1227 = _1221 * _1221;
        float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1231 = _971 + _1229;
        float _1233 = fma(_1225, _1225, _1227);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1237 = fma(_1231, _1231, _1233);
        float _1239 = -_973;
        float _1241 = _1239 + _1197;
        float _1243 = sqrt(_1237);
        float _1245 = precise::min(_1243, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1247 = _1245 * _1235;
        float _1249 = -_989;
        float _1251 = _1249 + _1199;
        float _1253 = -_971;
        float _1255 = _1253 + _1201;
        float _1257 = fma(_1241, _1247, _973);
        float _1259 = fma(_1251, _1247, _989);
        float _1261 = fma(_1255, _1247, _971);
        _1209 = _1259;
        _1211 = _1257;
        _1213 = _1261;
        _1215 = _1247;
    }
    float _1263 = _1209;
    float _1265 = _1211;
    float _1267 = _1213;
    float _1269 = _1215;
    float _1271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1273 = _1263 + _1271;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1265 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1281 = _1267 + _1279;
    float _1283 = _1273 * _1273;
    float _1285 = fma(_1277, _1277, _1283);
    float _1287 = fma(_1281, _1281, _1285);
    float _1289 = rsqrt(_1287);
    float _1291 = sqrt(_1287);
    float _1293 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1295 = _1277 * _1293;
    float _1297 = _1281 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 + _1301;
    float _1305 = sqrt(_1303);
    bool _1307 = _1305 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = _1305 + _1309;
    float _1313 = _1203;
    float _1315 = _1311;
    float _1317 = _1273;
    float _1319 = _1295;
    if (_1307)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1313 = _1321;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1307)
    {
        float _1327 = _1311 * _1323;
        _1315 = _1327;
    }
    float _1329 = _1315;
    if (_1307)
    {
        float _1331 = rsqrt(_1303);
        _1325 = _1331;
    }
    float _1333 = _1325;
    float _1335 = _1333;
    if (_1307)
    {
        float _1337 = _1329 * 0.15915493667125701904296875;
        _245 = _1337;
    }
    float _1339 = _245;
    float _1341 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1343 = _1281;
    if (_1307)
    {
        float _1345 = _1339 * 6.283185482025146484375;
        float _1347 = sin(_1345);
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1353 = precise::max(0.0, _1341);
    float _1355 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1351);
    float _1357 = _1269;
    float _1359 = _1353;
    if (_1307)
    {
        float _1361 = _1339 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        _1357 = _1363;
    }
    float _1365 = _1357;
    float _1367 = -_1293;
    float _1369 = -_1353;
    float _1371 = fma(_1273, _1367, _1369);
    float _1373 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1375 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    if (_1307)
    {
        float _1377 = _1371 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1377;
    }
    float _1379 = _1317;
    float _1381 = _1349;
    float _1383 = _1379;
    if (_1307)
    {
        float _1385 = fma(_1349, _1379, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (!_1307)
    {
        _1383 = _1371;
    }
    float _1391 = _1383;
    float _1393 = _1391;
    if (_1307)
    {
        float _1395 = _1333 * _1387;
        _1217 = _1395;
    }
    float _1397 = _1217;
    if (!_1307)
    {
        _1389 = _1299;
    }
    float _1399 = _1389;
    float _1401 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = _1399;
    float _1405 = _1365;
    if (_1307)
    {
        float _1407 = _1365 + (-1.0);
        _1359 = _1407;
    }
    float _1409 = _1359;
    float _1411 = _1409;
    if (_1307)
    {
        float _1413 = _1295 * _1397;
        _1319 = _1413;
    }
    float _1415 = _1319;
    float _1417 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    if (_1307)
    {
        float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1419;
    }
    float _1421 = _1335;
    if (!_1307)
    {
        _1411 = _1297;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1307)
    {
        float _1427 = _1297 * _1397;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1307)
    {
        float _1431 = _1415 * _1415;
        _1403 = _1431;
    }
    float _1433 = _1403;
    if (_1307)
    {
        float _1435 = fma(_1371, _1365, _1421);
        _1393 = _1435;
    }
    float _1437 = _1393;
    if (!_1307)
    {
        _1405 = _1301;
    }
    float _1439 = _1405;
    float _1441 = _1439;
    if (_1307)
    {
        float _1443 = _1429 * _1429;
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1449 = fma(_1437, _1437, _1433);
    float _1451 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1417);
    float _1453 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1447);
    float _1455 = _1449 + _1445;
    float _1457 = _1263 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1459 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1461 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1453);
    float _1463 = rsqrt(_1455);
    float _1465 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1457);
    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1469 = fma(_1291, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1467);
    float _1471 = precise::clamp(_1469, 0.0, 1.0);
    float _1473 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1475 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1477 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1465);
    float _1479 = -_1471;
    float _1481 = _1479 + 1.0;
    float _1483 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1485 = -_1475;
    float _1487 = fma(_1485, _1373, 1.0);
    float _1489 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1491 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1493 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = abs(_1481);
    float _1497 = log2(_1495);
    float _1499 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1483);
    float _1501 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1491);
    float _1503 = _1463 * _1437;
    float _1505 = _1463 * _1429;
    float _1507 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1501);
    float _1509 = _1463 * _1415;
    float _1511 = log2(_1487);
    float _1513 = _1503 + 1.0;
    float _1515 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1507);
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = -_1517;
    float _1521 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1519);
    float _1523 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1525 = 1.0 / _1515;
    float _1527 = -_1505;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1521);
    float _1531 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1531);
    float _1537 = exp2(_1523);
    float _1539 = fma(_1529, 0.5, 0.5);
    float _1541 = _1511 * 0.693147182464599609375;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1535);
    float _1545 = fma(_1539, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1549 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1543);
    float _1551 = sqrt(_1533);
    float _1553 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1499);
    float _1555 = fma(_1539, _1545, -0.212114393711090087890625);
    float _1557 = _1549 * _1525;
    float _1559 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1561 = fma(_1539, _1555, 1.570728778839111328125);
    float _1563 = fma(_1557, 0.5, 0.5);
    float _1565 = -_1503;
    float _1567 = fma(_1537, _1513, _1565);
    float _1569 = _1559 * _1525;
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = fma(_1569, -0.5, 0.5);
    float _1575 = _1551 * 0.636619746685028076171875;
    float _1577 = -_1561;
    float _1579 = fma(_1575, _1577, 1.0);
    float3 _5481 = float3(_1563, _1573, _1547);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5481, float3(0.0), isnan(_5481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5481, float3(0.0), isnan(_5481)), level(0.0)).x;
    float3 _5492 = float3(_1563, _1573, _1547);
    float4 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5492, float3(0.0), isnan(_5492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5492, float3(0.0), isnan(_5492)), level(0.0)).xyzw;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = _1584.w;
    float2 _5509 = float2(_1579, _1571);
    float3 _1596 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5509, float2(0.0), isnan(_5509)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5509, float2(0.0), isnan(_5509)), level(0.0)).xyz;
    float _1598 = _1596.x;
    float _1600 = _1596.y;
    float _1602 = _1596.z;
    float _1604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1606 = int(_1604);
    int _1608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1610 = _1608 != 0;
    float _1612 = -_699;
    float _1614 = _1612 + 1.0;
    bool _1616 = _151 > 0.5;
    float _1618 = -_701;
    float _1620 = _1618 + 1.0;
    bool _1622 = _163 > 0.5;
    out.m_72.x = _973;
    out.m_72.y = _989;
    out.m_72.z = _971;
    int _1624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1626 = _1624 != 0;
    float _1628 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1630 = int(_1628);
    int _1632 = abs(_1033);
    float _1634 = -_671;
    float _1636 = _1634 + 1.0;
    int _1638 = abs(_1037);
    float _1640 = -_703;
    float _1642 = _1640 + 1.0;
    float _1644 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1646 = 0.0;
    float _1648 = _1559;
    float _1650 = _1549;
    if (_1610)
    {
        _1646 = 1.0;
    }
    float _1652 = _1646;
    out.m_74.x = _1265;
    out.m_74.y = _1263;
    out.m_74.z = _1267;
    float _1654 = float(uint(_1606));
    float _1656 = trunc(_527);
    int _1658 = int(_1656);
    float _1660 = _1652;
    if (!_1610)
    {
        _1660 = 1.2345600128173828125;
    }
    float _1662 = _1660;
    float _1664 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1644);
    float _1666 = 0.0;
    if (_1610)
    {
        _1666 = 1.0;
    }
    float _1668 = _1666;
    float _1670 = _1668;
    if (!_1610)
    {
        _1670 = 7.345489978790283203125;
    }
    float _1672 = _1670;
    float _1674 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1664);
    float _1676 = float(uint(_1630));
    float _1678 = 1.0 / _1654;
    int _1680 = ~_1630;
    int _1682 = _1680 + 1;
    float _1684 = _1672 * _151;
    int _1686 = ~_1630;
    int _1688 = _1686 + 1;
    float _1690 = 1.0 / _1676;
    float _1692 = trunc(_607);
    int _1694 = int(_1692);
    int _1696 = as_type<int>(_1678) + (-2);
    float _1698 = float(uint(_1658));
    float _1700 = as_type<float>(_1696) * _1698;
    int _1702 = as_type<int>(_1690) + (-2);
    float _1704 = floor(_1684);
    int _1706 = ~_1606;
    int _1708 = _1706 + 1;
    float _1710 = float(uint(_1694));
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1717 = uint(_1714);
    float _1719 = as_type<float>(_1702) * _1710;
    float _1721 = _1710;
    if (_1610)
    {
        _1721 = _151;
    }
    float _1723 = _1721;
    float _1725 = _1723;
    if (!_1610)
    {
        _1725 = _155;
    }
    float _1727 = _1725;
    float _1729 = -_1704;
    float _1731 = _1684 + _1729;
    float _1733 = trunc(_1719);
    float _1735 = precise::max(_1733, 0.0);
    uint _1737 = uint(_1735);
    float _1739 = _1662 * _1727;
    int _1741 = _1708 * int(_1717);
    int _1743 = _1741 + _1658;
    float _1745 = floor(_1739);
    float _1747 = float(uint(_1743));
    float _1749 = in.m_53.w;
    int _1751 = _1682 * int(_1737);
    int _1753 = _1751 + _1694;
    float _1755 = as_type<float>(_1696) * _1747;
    float _1757 = float(uint(_1753));
    float _1759 = trunc(_1755);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1767 = _1765 != 0;
    float _1769 = -_1745;
    float _1771 = _1739 + _1769;
    float _1773 = as_type<float>(_1702) * _1757;
    float _1775 = -_233;
    int _1777 = _1616 ? as_type<int>(_1775) : as_type<int>(_233);
    float _1779 = float(_1606);
    bool _1781 = !_1767;
    float _1783 = _1781 ? _233 : as_type<float>(_1777);
    float _1785 = trunc(_1773);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    bool _1791 = _155 > 0.5;
    float _1793 = _1731 * _1779;
    float _1795 = float(_1694);
    float _1797 = _1783 + 0.5;
    bool _1799 = _1749 > 0.5;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[80].x, _347);
    int _1803 = int(_1717) + int(_1763);
    float _1805 = trunc(_1793);
    int _1807 = int(_1805);
    int _1809 = ~_1606;
    int _1811 = _1809 + 1;
    float _1813 = -_1614;
    float _1815 = fma(_1783, _1813, _1801);
    float _1817 = float(_1630);
    int _1819 = int(_1737) + int(_1789);
    int _1821 = _1811 * _1803;
    int _1823 = _1821 + _1658;
    float _1825 = float(_1658);
    float _1827 = _1817 * _297;
    int _1829 = ~_1630;
    int _1831 = _1829 + 1;
    float _1833 = _1771 * _1817;
    bool _1835 = _1825 >= _1779;
    bool _1837 = isnan(_1825);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1779);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1779 * _297;
    bool _1849 = uint(_1823) >= uint(_1606);
    int _1851 = _1831 * _1819;
    int _1853 = _1851 + _1694;
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = !_1849;
    int _1861 = _1859 ? 0 : (-1);
    bool _1863 = _1795 >= _1817;
    bool _1865 = isnan(_1795);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan(_1817);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1877 = _1875 != 0;
    float _1879 = -_213;
    int _1881 = _1791 ? as_type<int>(_1879) : as_type<int>(_213);
    float _1883 = trunc(_1833);
    int _1885 = int(_1883);
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1889 = _1887 != 0;
    int _1891 = ~_1803;
    int _1893 = _1891 + _1861;
    int _1895 = _1893 + 1;
    bool _1897 = !_1877;
    float _1899 = _1897 ? _213 : as_type<float>(_1881);
    bool _1901 = !_1889;
    int _1903 = _1901 ? 0 : 1;
    int _1905 = _1606 * _1895;
    int _1907 = _1905 + _1658;
    bool _1909 = uint(_1853) >= uint(_1630);
    float _1911 = trunc(_1873);
    int _1913 = int(_1911);
    bool _1915 = _1606 == 0;
    int _1917 = abs(_1903);
    float _1919 = _1899 + (-0.5);
    int _1921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1923 = _1921 != 0;
    bool _1925 = !_1909;
    int _1927 = _1925 ? 0 : (-1);
    float _1929 = trunc(_1847);
    int _1931 = int(_1929);
    bool _1933 = !_1915;
    int _1935 = _1933 ? _1907 : (-1);
    float _1937 = -_1919;
    float _1939 = -_669;
    float _1941 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1939);
    bool _1943 = !_1923;
    int _1945 = _1943 ? 0 : 1;
    int _1947 = _1807 * _1917;
    int _1949 = _1947 + _1658;
    int _1951 = ~_1819;
    int _1953 = _1951 + _1927;
    int _1955 = _1953 + 1;
    float _1957 = fma(_1899, _1620, _1941);
    int _1959 = ~_1857;
    int _1961 = _1959 + 1;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1827);
    int _1967 = int(_1965);
    int _1969 = abs(_1945);
    int _1971 = _1630 * _1955;
    int _1973 = _1971 + _1694;
    bool _1975 = _1630 == 0;
    int _1977 = _1935 * _1963;
    int _1979 = _1606 + (-1);
    int _1981 = abs(_521);
    bool _1983 = !_1975;
    int _1985 = _1983 ? _1973 : (-1);
    int _1987 = _1885 * _1969;
    int _1989 = _1987 + _1694;
    int _1991 = abs(_525);
    int _1993 = _1857 * _1979;
    int _1995 = _1993 + _1977;
    int _1997 = ~_1913;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = abs(_531);
    int _2005 = _1995 * _1981;
    int _2007 = _1630 + (-1);
    int _2009 = _1985 * _2001;
    bool _2011 = !_1626;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1931 * _1991;
    int _2017 = _2015 + _2005;
    int _2019 = _1913 * _2007;
    int _2021 = _2019 + _2009;
    int _2023 = abs(_1029);
    int _2025 = abs(_2013);
    int _2027 = _1949 * _2003;
    int _2029 = _2027 + _2017;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2033 = _2031 != 0;
    int _2035 = _2021 * _2023;
    float _2037 = -_233;
    int _2039 = _1622 ? as_type<int>(_2037) : as_type<int>(_233);
    int _2041 = abs(_1041);
    int _2043 = _1807 * _2025;
    int _2045 = _2043 + _2029;
    float _2047 = float(uint(_1949));
    bool _2049 = !_2033;
    float _2051 = _2049 ? _233 : as_type<float>(_2039);
    float _2053 = as_type<float>(_1696) * _2047;
    float _2055 = float(uint(_2045));
    float _2057 = _2051 + 0.5;
    int _2059 = ~_1606;
    int _2061 = _2059 + 1;
    int _2063 = _1967 * _1632;
    int _2065 = _2063 + _2035;
    int _2067 = ~_1630;
    int _2069 = _2067 + 1;
    float _2071 = trunc(_2053);
    float _2073 = precise::max(_2071, 0.0);
    uint _2075 = uint(_2073);
    float _2077 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[85].x, _695);
    float _2079 = as_type<float>(_1696) * _2055;
    int _2081 = _1989 * _1638;
    int _2083 = _2081 + _2065;
    int _2085 = ~_1606;
    int _2087 = _2085 + 1;
    float _2089 = -_1636;
    float _2091 = fma(_2051, _2089, _2077);
    float _2093 = float(uint(_1989));
    int _2095 = _1885 * _2041;
    int _2097 = _2095 + _2083;
    float _2099 = trunc(_2079);
    float _2101 = precise::max(_2099, 0.0);
    uint _2103 = uint(_2101);
    float _2105 = as_type<float>(_1702) * _2093;
    float _2107 = float(uint(_2097));
    int _2109 = _2087 * int(_2075);
    int _2111 = _2109 + _1949;
    int _2113 = ~_1630;
    int _2115 = _2113 + 1;
    float _2117 = as_type<float>(_1702) * _2107;
    float _2119 = trunc(_2105);
    float _2121 = precise::max(_2119, 0.0);
    uint _2123 = uint(_2121);
    float _2125 = float(uint(_2111));
    int _2127 = ~_1606;
    int _2129 = _2127 + 1;
    int _2131 = _2061 * int(_2103);
    int _2133 = _2131 + _2045;
    float _2135 = as_type<float>(_1696) * _2125;
    float _2137 = -_213;
    int _2139 = _1799 ? as_type<int>(_2137) : as_type<int>(_213);
    float _2141 = trunc(_2117);
    float _2143 = precise::max(_2141, 0.0);
    uint _2145 = uint(_2143);
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2149 = _2147 != 0;
    float _2151 = float(uint(_2133));
    bool _2153 = !_2149;
    float _2155 = _2153 ? _213 : as_type<float>(_2139);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    float _2161 = as_type<float>(_1696) * _2151;
    int _2163 = _2115 * int(_2123);
    int _2165 = _2163 + _1989;
    float _2167 = _2155 + (-0.5);
    float _2169 = trunc(_2135);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2177 = _2175 != 0;
    float _2179 = float(uint(_2165));
    float _2181 = -_2167;
    float _2183 = -_675;
    float _2185 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2183);
    int _2187 = _2069 * int(_2145);
    int _2189 = _2187 + _2097;
    float _2191 = trunc(_2161);
    float _2193 = precise::max(_2191, 0.0);
    uint _2195 = uint(_2193);
    float _2197 = as_type<float>(_1702) * _2179;
    float _2199 = float(uint(_2189));
    float _2201 = fma(_2155, _1642, _2185);
    float _2203 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2205 = as_type<float>(_1702) * _2199;
    float _2207 = trunc(_2197);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    out.m_76.x = _1815;
    out.m_76.y = _1957;
    out.m_76.z = _2091;
    out.m_76.w = _2201;
    float _2213 = -_901;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2203);
    int _2217 = int(_2075) + int(_2173);
    float _2219 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2221 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2223 = trunc(_2205);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    int _2229 = int(_2103) + int(_2195);
    float _2231 = -_901;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2219);
    float _2235 = -_901;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2221);
    int _2239 = _2129 * _2229;
    int _2241 = _2239 + _2045;
    float _2243 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2245 = int(_2123) + int(_2211);
    float _2247 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2215);
    int _2249 = ~_1630;
    int _2251 = _2249 + 1;
    float _2253 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2255 = uint(_2241) >= uint(_1606);
    float _2257 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2259 = ~_1606;
    int _2261 = _2259 + 1;
    float _2263 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2233);
    bool _2265 = !_2255;
    int _2267 = _2265 ? 0 : (-1);
    float _2269 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2243);
    int _2271 = int(_2145) + int(_2227);
    float _2273 = fma(_903, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2237);
    int _2275 = ~_2229;
    int _2277 = _2275 + _2267;
    int _2279 = _2277 + 1;
    float _2281 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2283 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2253);
    int _2285 = _1688 * _2271;
    int _2287 = _2285 + _2097;
    float _2289 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2257);
    int _2291 = _1606 * _2279;
    int _2293 = _2291 + _2045;
    float _2295 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2297 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2299 = uint(_2287) >= uint(_1630);
    float _2301 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2281);
    bool _2303 = !_1915;
    int _2305 = _2303 ? _2293 : (-1);
    float _2307 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2297);
    bool _2309 = !_2299;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2295);
    int _2315 = _2305 & 3;
    bool _2317 = _2315 != 0;
    float _2319 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2321 = ~_2271;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2301);
    bool _2329 = uint(_2315) > 1u;
    float _2331 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2333 = _2305 >> 31;
    int _2335 = _1630 * _2325;
    int _2337 = _2335 + _2097;
    int _2339 = _2305 & 3;
    bool _2341 = _2339 != 0;
    float _2343 = _2319 * _2247;
    int _2345 = _2333 & 3;
    bool _2347 = !_1975;
    int _2349 = _2347 ? _2337 : (-1);
    int _2351 = _2341 ? 0 : 1;
    int _2353 = _2251 * _2245;
    int _2355 = _2353 + _1989;
    int _2357 = _2305 + _2345;
    int _2359 = _2261 * _2217;
    int _2361 = _2359 + _1949;
    int _2363 = _2349 >> 31;
    int _2365 = ~_2351;
    int _2367 = _2365 + 1;
    int _2369 = _2367 + 1;
    int _2371 = _2357 >> 2;
    int _2373 = _2369;
    if (!_2329)
    {
        int _2375 = ~_2351;
        int _2377 = _2375 + 1;
        _2373 = _2377;
    }
    int _2379 = _2373;
    float _2381 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2313);
    bool _2383 = uint(_2315) >= 2u;
    int _2385 = _2363 & 3;
    int _2387 = _2371 << 4;
    int _2389 = _2387 + 368;
    float _2391 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2283);
    bool _2393 = uint(_2361) >= uint(_1606);
    float _2395 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2269);
    int _2397 = _2383 ? 0 : 1;
    int _2399 = _2389 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    bool _2417 = uint(_2355) >= uint(_1630);
    float _2419 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2307);
    int _2421 = _2349 + _2385;
    float _2423 = fma(_2331, _2391, _2343);
    bool _2425 = !_2393;
    int _2427 = _2425 ? 0 : (-1);
    int _2429 = _2421 >> 2;
    uint _2431 = uint(int(uint(_2389) >> uint(2)));
    uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
    int _2435 = int(_2431) & 3;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[int(_2433)][_2435];
    int _2439 = int(_2431) + 1;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    int _2443 = _2439 & 3;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[int(_2441)][_2443];
    bool _2447 = _2315 != 3;
    float _2449 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2289);
    int _2451 = _2429 << 4;
    int _2453 = _2451 + 512;
    float _2455 = _2319 * _2263;
    bool _2457 = !_2417;
    int _2459 = _2457 ? 0 : (-1);
    int _2461 = ~_2217;
    int _2463 = _2461 + _2427;
    int _2465 = _2463 + 1;
    uint _2467 = uint(int(uint(_2453) >> uint(2)));
    uint _2469 = uint(int(uint(int(_2467)) >> uint(2)));
    int _2471 = int(_2467) & 3;
    float _2473 = (*spvDescriptorSet0.vp_c9)._m0[int(_2469)][_2471];
    int _2475 = int(_2467) + 1;
    uint _2477 = uint(int(uint(_2475) >> uint(2)));
    int _2479 = _2475 & 3;
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[int(_2477)][_2479];
    int _2483 = ~_2245;
    int _2485 = _2483 + _2459;
    int _2487 = _2485 + 1;
    float _2489 = fma(_2331, _2327, _2455);
    bool _2491 = !_2317;
    int _2493 = _2491 ? 0 : 1;
    out.m_78.x = _2391;
    out.m_78.y = _2327;
    out.m_78.z = _2449;
    int _2495 = _2349 & 3;
    bool _2497 = _2495 != 0;
    float _2499 = _2319 * _2273;
    int _2501 = ~_2397;
    int _2503 = _2501 + 1;
    int _2505 = _2503 + 1;
    int _2507 = _2453 + 8;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    uint _2511 = uint(int(uint(int(_2509)) >> uint(2)));
    int _2513 = int(_2509) & 3;
    float _2515 = (*spvDescriptorSet0.vp_c9)._m0[int(_2511)][_2513];
    int _2517 = int(_2509) + 1;
    uint _2519 = uint(int(uint(_2517) >> uint(2)));
    int _2521 = _2517 & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = _2349 & 3;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2331, _2449, _2499);
    int _2531 = _2505;
    float _2533 = _2489;
    if (_2447)
    {
        int _2535 = ~_2397;
        int _2537 = _2535 + 1;
        _2531 = _2537;
    }
    int _2539 = _2531;
    int _2541 = _1606 * _2465;
    int _2543 = _2541 + _1949;
    bool _2545 = uint(_2495) > 1u;
    int _2547 = _1630 * _2487;
    int _2549 = _2547 + _1989;
    int _2551 = abs(_2379);
    bool _2553 = !_2497;
    int _2555 = _2553 ? 0 : 1;
    bool _2557 = _2495 != 3;
    int _2559 = _2527 ? 0 : 1;
    bool _2561 = uint(_2495) >= 2u;
    int _2563 = abs(_2493);
    int _2565 = _2561 ? 0 : 1;
    int _2567 = ~_2559;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = ~_2565;
    int _2575 = _2573 + 1;
    int _2577 = _2575 + 1;
    int _2579 = _2571;
    int _2581 = _2577;
    if (!_2545)
    {
        int _2583 = ~_2559;
        int _2585 = _2583 + 1;
        _2579 = _2585;
    }
    int _2587 = _2579;
    if (_2557)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2581 = _2591;
    }
    int _2593 = _2581;
    int _2595 = ~_2551;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = abs(_2555);
    int _2603 = _2599 * as_type<int>(_2445);
    int _2605 = ~_2563;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    int _2611 = abs(_2587);
    int _2613 = abs(_2539);
    int _2615 = _2609 * as_type<int>(_2437);
    int _2617 = _2615 + _2603;
    int _2619 = ~_2611;
    int _2621 = _2619 + 1;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2319, _2319, 1.0);
    int _2627 = ~_2613;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    bool _2633 = _2315 != 3;
    int _2635 = _2623 * as_type<int>(_2481);
    int _2637 = ~_2601;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2631 * as_type<int>(_2407);
    int _2645 = _2643 + _2617;
    bool _2647 = !_2633;
    int _2649 = _2647 ? 0 : (-1);
    float _2651 = rsqrt(_2625);
    bool _2653 = !_2159;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = _2641 * as_type<int>(_2473);
    int _2659 = _2657 + _2635;
    int _2661 = abs(_2649);
    int _2663 = abs(_2593);
    int _2665 = abs(_2655);
    int _2667 = ~_2663;
    int _2669 = _2667 + 1;
    int _2671 = _2669 + 1;
    bool _2673 = !_2177;
    int _2675 = _2673 ? 0 : 1;
    int _2677 = ~_2661;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2671 * as_type<int>(_2515);
    int _2685 = _2683 + _2659;
    int _2687 = abs(_2675);
    int _2689 = ~_2665;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2681 * as_type<int>(_2415);
    int _2697 = _2695 + _2645;
    bool _2699 = !_1915;
    int _2701 = _2699 ? _2543 : (-1);
    bool _2703 = _2495 != 3;
    int _2705 = _2697 * _2693;
    int _2707 = ~_2687;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    float _2713 = _2319 * _2651;
    bool _2715 = !_2703;
    int _2717 = _2715 ? 0 : (-1);
    int _2719 = _2701 * _2665;
    int _2721 = _2719 + _2705;
    float _2723 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2725 = !_1975;
    int _2727 = _2725 ? _2549 : (-1);
    float _2729 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    int _2731 = abs(_2717);
    float _2733 = exp2(_2723);
    int _2735 = ~_2731;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    float _2741 = _2729 + _1515;
    bool _2743 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2745 = isnan(_1291);
    bool _2747 = _2743 || _2745;
    bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2751 = _2747 || _2749;
    out.gl_Position.x = _1549;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _2729;
    out.gl_Position.w = _1515;
    int _2753 = _2739 * as_type<int>(_2523);
    int _2755 = _2753 + _2685;
    float _2757 = -_2381;
    float _2759 = _2713 * _2757;
    float _2761 = _2741 * 0.5;
    int _2763 = _2755 * _2711;
    float _2765 = -_2419;
    float _2767 = _2713 * _2765;
    int _2769 = _2727 * _2687;
    int _2771 = _2769 + _2763;
    float _2773 = -_2395;
    float _2775 = _2713 * _2773;
    float _2777 = -_2733;
    float _2779 = _2777 + 1.0;
    float _2781 = fma(_2651, _2263, _2759);
    float _2783 = fma(_2651, _2273, _2767);
    float _2785 = fma(_2651, _2247, _2775);
    float _2787 = _2779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = _1515 * 0.5;
    float _2791 = _1549 + _1515;
    float _2793 = float(_2771);
    float _2795 = _2787 * _1581;
    out.m_80.x = _2785;
    out.m_80.y = _2781;
    out.m_80.z = _2783;
    float _2797 = fma(_1559, -0.5, _2789);
    float _2799 = _2395 + _2423;
    float _2801 = _1592 * _2795;
    float _2803 = _1602 * _2795;
    float _2805 = float(_2721);
    float _2807 = _2791 * 0.5;
    float _2809 = fma(_1598, _2801, _1586);
    float _2811 = _2381 + _2489;
    float _2813 = _2419 + _2529;
    float _2815 = fma(_1600, _2801, _1588);
    float _2817 = fma(_1592, _2803, _1590);
    float _2819 = -_2787;
    float _2821 = _2819 + 1.0;
    out.m_82.x = _2805;
    out.m_82.y = _2793;
    float _2823 = _2783;
    float _2825 = _2781;
    float _2827 = _2821;
    if (!_2751)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2829 = _1648;
    float _2831 = _1592 * _2821;
    out.m_84.x = _2807;
    out.m_84.y = _2797;
    out.m_84.z = _2761;
    out.m_84.w = _1515;
    float _2833 = _2829;
    float _2835 = _2829;
    if (!_2751)
    {
        _1650 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2837 = _1650;
    float _2839 = _2837;
    float _2841 = _2837;
    if (!_2751)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2843 = _2533;
    out.m_86.x = _2809;
    out.m_86.y = _2815;
    out.m_86.z = _2817;
    out.m_86.w = _2831;
    float _2845 = _2843;
    float _2847 = _2843;
    if (!_2751)
    {
        _2823 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2849 = _2823;
    float _2851 = _2849;
    float _2853 = _2849;
    if (!_2751)
    {
        _2825 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2855 = _2825;
    out.m_88.x = _2799;
    out.m_88.y = _2811;
    out.m_88.z = _2813;
    float _2857 = _2855;
    float _2859 = _2855;
    if (!_2751)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2861 = _2827;
    bool _2863 = !_2751;
    float _2865 = _2861;
    float _2867 = _2861;
    if (!_2863)
    {
        bool _2869 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2871 = isnan(_1291);
        bool _2873 = _2869 || _2871;
        bool _2875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2877 = _2873 || _2875;
        if (!_2877)
        {
            float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2881 = _1291 + _2879;
            float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2883;
            float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2891 = 1.0 / _2885;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2895 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2903 = _2901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2907 = _2905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2909 = _2881 * _2891;
            float _2911 = precise::clamp(_2909, 0.0, 1.0);
            float _2913 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2915 = _2913 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2917 = fma(_2911, _2889, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2919 = fma(_2911, _2915, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2921 = fma(_2911, _2895, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2911, _2899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2925 = fma(_2911, _2903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2927 = fma(_2911, _2907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2841 = _2921;
            _2859 = _2925;
            _2835 = _2917;
            _2853 = _2923;
            _2847 = _2919;
            _2867 = _2927;
            _2929 = true;
        }
        else
        {
            bool _2931 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2933 = isnan(_1291);
            bool _2935 = _2931 || _2933;
            bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2939 = _2935 || _2937;
            if (!_2939)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2941 = _2833;
            _2835 = _2941;
            if (!_2939)
            {
                _2839 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2943 = _2839;
            _2841 = _2943;
            if (!_2939)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2945 = _2845;
            _2847 = _2945;
            if (!_2939)
            {
                _2851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2947 = _2851;
            _2853 = _2947;
            if (!_2939)
            {
                _2857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2949 = _2857;
            _2859 = _2949;
            if (!_2939)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2951 = _2865;
            bool _2953 = !_2939;
            _2867 = _2951;
            if (!_2953)
            {
                bool _2955 = _1291 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2957 = isnan(_1291);
                bool _2959 = _2955 || _2957;
                bool _2961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2963 = _2959 || _2961;
                if (!_2963)
                {
                    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2967 = _1291 + _2965;
                    float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2969;
                    float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2977 = 1.0 / _2971;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2995 = _2967 * _2977;
                    float _2997 = precise::clamp(_2995, 0.0, 1.0);
                    float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3003 = fma(_2997, _2975, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3005 = fma(_2997, _3001, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3007 = fma(_2997, _2981, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2997, _2985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3011 = fma(_2997, _2989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3013 = fma(_2997, _2993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2841 = _3007;
                    _2859 = _3011;
                    _2835 = _3003;
                    _2853 = _3009;
                    _2847 = _3005;
                    _2867 = _3013;
                    _2929 = true;
                }
                else
                {
                    _2841 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2929 = false;
    float _3015 = _2841;
    float _3017 = _2859;
    float _3019 = _2835;
    float _3021 = _2853;
    float _3023 = _2847;
    float _3025 = _2867;
    float _3027 = fma(_2811, -0.5, 0.5);
    float _3029 = precise::clamp(_3027, 0.0, 1.0);
    float _3031 = -_3015;
    float _3033 = _3031 + _3017;
    float _3035 = -_3019;
    float _3037 = _3035 + _3021;
    float _3039 = -_3023;
    float _3041 = _3039 + _3025;
    bool _3043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3045 = fma(_3029, _3033, _3015);
    float _3047 = fma(_3029, _3037, _3019);
    float _3049 = fma(_3029, _3041, _3023);
    float _3051 = _3045 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3053 = fma(_3047, 0.298911988735198974609375, _3051);
    float _3055 = fma(_3049, 0.114477999508380889892578125, _3053);
    out.m_90.x = 0.0;
    float _3057 = -_3055;
    float _3059 = _3047 + _3057;
    float _3061 = -_3055;
    float _3063 = _3045 + _3061;
    float _3065 = -_3055;
    float _3067 = _3049 + _3065;
    float _3069 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3071 = fma(_3059, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3073 = fma(_3063, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    float _3075 = fma(_3067, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3055);
    out.m_92.w = _3069;
    out.m_94.x = _3071;
    out.m_94.y = _3073;
    out.m_94.z = _3075;
    if (!_3043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3077 = -_1263;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3081 = -_1265;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3085 = -_1267;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3089 = _3079 * _3079;
    float _3091 = fma(_3083, _3083, _3089);
    float _3093 = fma(_3087, _3087, _3091);
    float _3095 = sqrt(_3093);
    float _3097 = rsqrt(_3093);
    float _3099 = -_3095;
    float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3103 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3105 = precise::clamp(_3103, 0.0, 1.0);
    float _3107 = _3083 * _3097;
    float _3109 = _3079 * _3097;
    float _3111 = abs(_3105);
    float _3113 = log2(_3111);
    float _3115 = _3087 * _3097;
    float _3117 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3119 = _2811 * _3109;
    float _3121 = -_3109;
    float _3123 = -_3117;
    float _3125 = fma(_3121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3123);
    float _3127 = fma(_2799, _3107, _3119);
    float _3129 = -_3115;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3125);
    float _3133 = fma(_2813, _3115, _3127);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3139 = _3131 + _3137;
    float _3141 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = exp2(_3141);
    float _3149 = _3147 * _3145;
    float _3151 = _3135 * _3149;
    float _3153 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3155 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3157 = _3151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3153;
    out.m_90.y = _3155;
    out.m_90.z = _3157;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

