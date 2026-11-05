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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_62 [[user(locn13)]];
    float4 m_76 [[user(locn14)]];
    float4 m_74 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3589 = false;
    bool _411 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3888 = as_type<float>(_123);
        out.gl_Position.z = _3888;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_161);
        out.gl_Position.z = _3958;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _223;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _227;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _211 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = fma(_265, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = _261 * _253;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    bool _275 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_211);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _289 = -_285;
    float _291 = _289 + 1.0;
    float _293 = _219 * _255;
    float _295 = -_247;
    float _297 = _295 + 1.0;
    bool _299 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_211);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _285 * _297;
    bool _313 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_211);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _309 * _291;
    float _327 = -_309;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _323 * _329;
    float _341 = fma(_333, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = -_323;
    float _347 = _345 + 1.0;
    float _349 = _267 * _339;
    float _351 = _287 * _339;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _367 = fma(_359, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _325, _361);
    float _371 = fma(_343, _325, _363);
    float _373 = fma(_365, _311, _369);
    float _375 = fma(_367, _311, _371);
    float _377 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _373);
    float _379 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _375);
    float _381 = _377 * _233;
    float _383 = _379 * _235;
    bool _385 = !_251;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _293;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _409;
    if (!_385)
    {
        float _393 = in.m_54.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_107);
        float _415 = 1.0 / _413;
        float _417 = _141 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = in.m_54.x;
    float _423 = in.m_54.y;
    float _425 = in.m_54.z;
    float _427 = in.m_54.w;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    float _433 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _435 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _445 = float(_107);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _449 = 1.0 / _445;
    float _451 = float(_431);
    float _453 = _421 * 2.0;
    bool _455 = _423 > 0.5;
    float _457 = _425 * 2.0;
    bool _459 = _425 > 0.5;
    float _461 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _463 = -_177;
    int _465 = _455 ? as_type<int>(_463) : as_type<int>(_177);
    float _467 = floor(_453);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _479 = _477 != 0;
    float _481 = -_441;
    float _483 = fma(_461, 2.0, _481);
    float _485 = -_181;
    int _487 = _459 ? as_type<int>(_485) : as_type<int>(_181);
    float _489 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _491 = int(_459);
    int _493 = _455 ? 2 : 0;
    int _495 = _491 | _493;
    int _497 = _165 ? 4 : 0;
    int _499 = _495 | _497;
    int _501 = _471 ? 8 : 0;
    int _503 = _499 | _501;
    int _505 = _475 ? 16 : 0;
    int _507 = _503 | _505;
    int _509 = _479 ? 32 : 0;
    int _511 = _507 | _509;
    int _513 = false ? 64 : 0;
    int _515 = _511 | _513;
    int _517 = _515 & 2;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _521 = !_475;
    float _523 = _521 ? _177 : as_type<float>(_465);
    float _525 = floor(_457);
    bool _527 = !_479;
    float _529 = _527 ? _181 : as_type<float>(_487);
    float _531 = fma(_489, -2.0, _443);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _543 = _541 != 0;
    float _545 = -_141;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _531);
    int _555 = int(_459);
    int _557 = _551 ? 2 : 0;
    int _559 = _555 | _557;
    int _561 = _165 ? 4 : 0;
    int _563 = _559 | _561;
    int _565 = _471 ? 8 : 0;
    int _567 = _563 | _565;
    int _569 = _535 ? 16 : 0;
    int _571 = _567 | _569;
    int _573 = _539 ? 32 : 0;
    int _575 = _571 | _573;
    int _577 = _543 ? 64 : 0;
    int _579 = _575 | _577;
    int _581 = _579 & 1;
    float _583 = 1.0 / _451;
    float _585 = _423 * 2.0;
    bool _587 = _467 >= 0.0;
    bool _589 = isnan(_467);
    bool _591 = _587 || _589;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = !_539;
    int _599 = _597 ? 0 : 1;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _603 = _601 != 0;
    float _605 = floor(_585);
    float _607 = _595 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _609 = _467 > 0.0;
    int _611 = ~as_type<int>(_607);
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    bool _617 = !_535;
    int _619 = _617 ? 0 : 1;
    float _621 = _583 * _141;
    bool _623 = !_543;
    int _625 = _623 ? 0 : 1;
    float _627 = float(_439);
    int _629 = as_type<int>(_467);
    int _631 = _615;
    float _633 = _607;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_603)
    {
        _629 = 0;
    }
    int _637 = _629;
    int _639 = _637;
    if (!_603)
    {
        _639 = 1;
    }
    int _641 = _639;
    float _643 = 1.0 / _627;
    int _645 = _641;
    if (!_609)
    {
        int _647 = ~as_type<int>(_607);
        int _649 = _647 + 1;
        _631 = _649;
    }
    int _651 = _631;
    bool _653 = _605 > 0.0;
    bool _655 = _641 != 1;
    if (_603)
    {
        _645 = 0;
    }
    int _657 = _645;
    bool _659 = _605 >= 0.0;
    bool _661 = isnan(_605);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _421 + (-0.5);
    int _671 = _657;
    if (!_603)
    {
        _671 = 2;
    }
    int _673 = _671;
    float _675 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _677 = _673 != 2;
    float _679 = _643 * _141;
    int _681 = ~as_type<int>(_675);
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    float _689 = as_type<float>(_673);
    float _691 = _675;
    if (!_653)
    {
        int _693 = ~as_type<int>(_675);
        int _695 = _693 + 1;
        _687 = _695;
    }
    int _697 = _687;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    bool _711 = _525 >= 0.0;
    bool _713 = isnan(_525);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    if (!_655)
    {
        _689 = _423;
    }
    float _721 = _689;
    int _723 = _719 ? 0 : 1;
    bool _725 = _525 > 0.0;
    float _727 = _421 + _423;
    float _729 = _721;
    if (_677)
    {
        _691 = _421;
    }
    float _731 = _691;
    float _733 = _731;
    if (!_677)
    {
        _733 = _425;
    }
    float _735 = _733;
    float _737 = _727 + (-1.0);
    if (!_655)
    {
        _387 = _721;
    }
    float _739 = _387;
    float _741 = _739;
    if (_655)
    {
        _729 = _423;
    }
    float _743 = _729;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _747 = ~_723;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = _735 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _757 = _751;
    float _759 = _743;
    if (!_725)
    {
        int _761 = ~_723;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _769 = log2(_767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_655)
    {
        _633 = _425;
    }
    float _773 = _633;
    bool _775 = !_701;
    int _777 = _775 ? 0 : 1;
    float _779 = -_771;
    float _781 = fma(_753, 2.0, _779);
    float _783 = _773;
    if (!_655)
    {
        _389 = _739;
    }
    float _785 = _389;
    float _787 = _785;
    if (_655)
    {
        _783 = _743;
    }
    float _789 = _783;
    if (_655)
    {
        _787 = _421;
    }
    float _791 = _787;
    if (_655)
    {
        _741 = _421;
    }
    float _793 = _741;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[83].w, _755);
    int _797 = abs(_777);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_655)
    {
        _391 = _425;
    }
    float _801 = _391;
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[83].z, _447);
    float _805 = _801;
    if (_655)
    {
        _805 = _743;
    }
    float _807 = _805;
    float _809 = -_519;
    float _811 = fma(_799, 2.0, _809);
    if (!_677)
    {
        _759 = _421;
    }
    float _813 = _759;
    float _815 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _803);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _821 = float(_797);
    float _823 = _769 * _141;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _829 = float(_765);
    float _831 = exp2(_823);
    float _833 = fma(_817, -2.0, _825);
    float _835 = fma(_819, -2.0, _827);
    float _837 = in.m_58.x;
    float _839 = in.m_58.y;
    float _841 = in.m_58.z;
    float _843 = _821 * _829;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_705;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _861 = -_831;
    float _863 = _861 + 1.0;
    bool _865 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = 1.0 / _851;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _879 = abs(_855);
    float _881 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[88].z, _859);
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _857);
    float _895 = _873 ? _863 : 0.0;
    float _897 = _449 * _141;
    float _899 = -_141;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[86].x, _781);
    float _903 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[88].w, _877);
    float _905 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _907 = float(_651);
    float _909 = _843 * (-2.0);
    float _911 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _913 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _845);
    float _915 = float(_879);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    float _919 = fma(_909, _837, _837);
    float _921 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _923 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _903);
    bool _925 = !_709;
    int _927 = _925 ? 0 : 1;
    float _929 = -_141;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _811);
    float _933 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _835);
    if (_891)
    {
        float _935 = _895 * _875;
        _143 = _935;
    }
    float _937 = _143;
    float _939 = fma(_745, _909, _745);
    float _941 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _943 = _915 * _907;
    float _945 = _425 + _423;
    int _947 = abs(_927);
    float _949 = fma(_939, _937, _941);
    float _951 = _943 * (-2.0);
    float _953 = _945 + (-1.0);
    float _955 = float(_697);
    float _957 = _423 + (-0.5);
    float _959 = float(_947);
    float _961 = fma(_951, _839, _839);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = _425 + _421;
    float _967 = _425 + (-0.5);
    float _969 = _959 * _955;
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    float _973 = _965 + (-1.0);
    float _975 = _969 * (-2.0);
    float _977 = fma(_963, _951, _963);
    float _979 = _949 * 0.15915493667125701904296875;
    float _981 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _983 = fma(_975, _841, _841);
    float _985 = fma(_977, _937, _971);
    float _987 = _979 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_981, _975, _981);
    float _993 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _995 = _985 * 0.15915493667125701904296875;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    bool _999 = _427 > 0.5;
    float _1001 = fma(_991, _937, _993);
    float _1003 = _979 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = -_181;
    int _1009 = _999 ? as_type<int>(_1007) : as_type<int>(_181);
    float _1011 = _1001 * 0.15915493667125701904296875;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    bool _1015 = !_471;
    float _1017 = _1015 ? _181 : as_type<float>(_1009);
    float _1019 = _433 * _1013;
    float _1021 = _995 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = in.m_44.x;
    float _1027 = in.m_44.y;
    float _1029 = in.m_44.z;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1045 = _1043 != 0;
    bool _1047 = !_1037;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _995 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    bool _1055 = !_1033;
    int _1057 = _1055 ? 0 : 1;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1071 = _1067 || _1069;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1011 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _989 * _1023;
    float _1089 = _1005 * _1023;
    bool _1091 = !_1045;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = _1011 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = _989 * _1053;
    float _1101 = _1005 * _1053;
    float _1103 = _989 * _1085;
    float _1105 = _1053 * _1085;
    float _1107 = _1005 * _1085;
    float _1109 = _1023 * _1085;
    float _1111 = _435 * _997;
    float _1113 = fma(_1097, _1101, _1087);
    float _1115 = fma(_1097, _1087, _1101);
    float _1117 = _1107 * _1111;
    float _1119 = -_1089;
    float _1121 = fma(_1097, _1099, _1119);
    float _1123 = -_1111;
    float _1125 = _1097 * _1123;
    float _1127 = -_1099;
    float _1129 = fma(_1097, _1089, _1127);
    float _1131 = _1103 * _1111;
    float _1133 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = fma(_1113, _1019, _1117);
    float _1137 = fma(_1105, _1019, _1125);
    float _1139 = fma(_1121, _1019, _1131);
    float _1141 = fma(_1129, _1133, _1135);
    float _1143 = fma(_1109, _1133, _1137);
    float _1145 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1147 = fma(_1115, _1133, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1153 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1145);
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1159 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1151);
    float _1161 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1163 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1165 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1167 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1175 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1177 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1181 = _1169 + _1173;
    float _1183 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1175);
    float _1185 = _1177 + _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1189 = _1181 + _1187;
    float _1191 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1183);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = _1189 * _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = sqrt(_1201);
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1207);
    float _1213 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1215 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1219 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1221 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1215);
    float _1223 = 1.0 / _1217;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1221);
    bool _1229 = _1205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1217;
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1235 = _1199 + _1233;
    float _1237 = _1231 * _1223;
    float _1239 = _1237 * 0.5;
    float _1241 = _1231;
    float _1243 = _1211;
    float _1245 = _1233;
    float _1247 = _1141;
    float _1249 = _1205;
    float _1251 = _1189;
    float _1253 = _1235;
    float _1255 = _1185;
    float _1257 = _979;
    if (!_1229)
    {
        _1241 = _1185;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (!_1229)
    {
        _1243 = _1181;
    }
    float _1263 = _1243;
    float _1265 = _1263;
    if (!_1229)
    {
        _1245 = _1235;
    }
    float _1267 = _1245;
    bool _1269 = !_1229;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1205 + _1275;
        float _1279 = rsqrt(_1201);
        float _1281 = _1277 * _1273;
        float _1283 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1235, _1289, _1297);
        float _1303 = _1279 * _1299;
        float _1305 = fma(_1195, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1189, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1261 = _1305;
        _1265 = _1307;
        _1271 = _1301;
        _1247 = _1285;
        _1249 = _1299;
    }
    float _1309 = _1261;
    float _1311 = _1265;
    float _1313 = _1271;
    float _1315 = _1247;
    float _1317 = _1249;
    float _1319 = _1315;
    float _1321 = _1313;
    float _1323 = _1309;
    float _1325 = _1311;
    float _1327 = _1317;
    if (_1081)
    {
        _1251 = 1.0;
    }
    float _1329 = _1251;
    float _1331 = _1329;
    if (!_1071)
    {
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1335 = _1199 + _1333;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1339 = _1177 + _1337;
        float _1341 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = -_1177;
        float _1345 = _1343 + _1309;
        float _1347 = _1335 * _1335;
        float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1351 = _1169 + _1349;
        float _1353 = -_1169;
        float _1355 = _1353 + _1311;
        float _1357 = -_1199;
        float _1359 = _1357 + _1313;
        float _1361 = fma(_1339, _1339, _1347);
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1365 = fma(_1351, _1351, _1361);
        float _1367 = sqrt(_1365);
        float _1369 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1371 = precise::min(_1367, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1373 = _1371 * _1363;
        float _1375 = _1369 * _1373;
        float _1377 = fma(_1345, _1375, _1177);
        float _1379 = fma(_1355, _1375, _1169);
        float _1381 = fma(_1359, _1375, _1199);
        _1319 = _1371;
        _1253 = _1345;
        _1321 = _1381;
        _1323 = _1377;
        _1325 = _1379;
        _1255 = _1341;
        _1327 = _1367;
    }
    float _1383 = _1319;
    float _1385 = _1253;
    float _1387 = _1321;
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1255;
    float _1395 = _1327;
    float _1397 = _1393;
    float _1399 = _1383;
    float _1401 = _1395;
    float _1403 = _1385;
    if (!_1081)
    {
        float _1405 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1413 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
        float _1415 = _1407 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1409 * 0.15915493667125701904296875;
        float _1421 = _1407 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = 1.0 / _1417;
        float _1427 = _1419 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = _1419 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1429 * _1431;
        float _1439 = 1.0 / _1413;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1443 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1441;
        float _1445 = 1.0 / _1437;
        float _1447 = 1.0 / _1443;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = _1439 * _1449;
        float _1453 = _1435 * _1445;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = fma(_1453, _1451, _1455);
        float _1459 = _1457 * _1447;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        float _1463 = -_1461;
        float _1465 = _1463 + 1.0;
        _1397 = _1419;
        _1399 = _1447;
        _1401 = _1413;
        _1403 = _1425;
        _1331 = _1465;
    }
    float _1467 = _1397;
    float _1469 = _1399;
    float _1471 = _1401;
    float _1473 = _1403;
    float _1475 = _1331;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1387 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1389 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1391 + _1485;
    bool _1489 = _517 != 0;
    float _1491 = _1479 * _1479;
    float _1493 = fma(_1483, _1483, _1491);
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1483 * _1501;
    float _1505 = _1487 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1519;
    float _1525 = _1467;
    float _1527 = _1479;
    float _1529 = _1471;
    float _1531 = _1473;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1535;
    if (_1515)
    {
        float _1539 = _1519 * _1535;
        _1523 = _1539;
    }
    float _1541 = _1523;
    if (_1515)
    {
        float _1543 = rsqrt(_1511);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    if (_1515)
    {
        float _1549 = _1541 * 0.15915493667125701904296875;
        _1525 = _1549;
    }
    float _1551 = _1525;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = _1487;
    if (_1515)
    {
        float _1557 = _1551 * 6.283185482025146484375;
        float _1559 = sin(_1557);
        _1555 = _1559;
    }
    float _1561 = _1555;
    float _1563 = precise::max(0.0, _1553);
    float _1565 = _1469;
    float _1567 = _1563;
    if (_1515)
    {
        float _1569 = _1551 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1565 = _1571;
    }
    float _1573 = _1565;
    float _1575 = -_1501;
    float _1577 = -_1563;
    float _1579 = fma(_1479, _1575, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1581;
    }
    float _1583 = _1527;
    float _1585 = _1561;
    float _1587 = _1583;
    if (_1515)
    {
        float _1589 = fma(_1561, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1529 = _1589;
    }
    float _1591 = _1529;
    float _1593 = _1591;
    if (!_1515)
    {
        _1585 = _1503;
    }
    float _1595 = _1585;
    float _1597 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1599 = _1595;
    if (!_1515)
    {
        _1587 = _1509;
    }
    float _1601 = _1587;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1545 * _1591;
        _1257 = _1605;
    }
    float _1607 = _1257;
    if (!_1515)
    {
        _1547 = _1579;
    }
    float _1609 = _1547;
    float _1611 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = _1609;
    if (_1515)
    {
        float _1615 = _1573 + (-1.0);
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (_1515)
    {
        float _1621 = _1503 * _1607;
        _1599 = _1621;
    }
    float _1623 = _1599;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1625 = _1593;
    float _1627 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1629 = _1625;
    if (_1515)
    {
        float _1631 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1631;
    }
    float _1633 = _1531;
    if (!_1515)
    {
        _1619 = _1505;
    }
    float _1635 = _1619;
    float _1637 = _1635;
    if (_1515)
    {
        float _1639 = _1505 * _1607;
        _1637 = _1639;
    }
    float _1641 = _1637;
    if (_1515)
    {
        float _1643 = _1623 * _1623;
        _1629 = _1643;
    }
    float _1645 = _1629;
    if (_1515)
    {
        float _1647 = fma(_1579, _1573, _1633);
        _1613 = _1647;
    }
    float _1649 = _1613;
    if (_1515)
    {
        float _1651 = _1641 * _1641;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1657 = fma(_1649, _1649, _1645);
    float _1659 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1661 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1655);
    float _1665 = _1657 + _1653;
    float _1667 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1671 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1669);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1659);
    float _1677 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1679 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1667);
    float _1681 = rsqrt(_1665);
    float _1683 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = -_1673;
    float _1687 = _1685 + 1.0;
    float _1689 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1691 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1675);
    float _1695 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1697 = abs(_1687);
    float _1699 = log2(_1697);
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1703 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1707 = -_1701;
    float _1709 = fma(_1707, _1597, 1.0);
    float _1711 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1705);
    float _1713 = _1681 * _1623;
    float _1715 = _1681 * _1649;
    float _1717 = _1681 * _1641;
    float _1719 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1709);
    float _1723 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1731 = -_1725;
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1731);
    float _1735 = 1.0 / _1723;
    float _1737 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1729);
    float _1739 = -_1717;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1733);
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1745 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1747 = fma(_1741, -0.5, 0.5);
    float _1749 = exp2(_1727);
    float _1751 = fma(_1741, 0.5, 0.5);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1743);
    float _1755 = _1715 + 1.0;
    float _1757 = fma(_1751, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1753);
    float _1761 = sqrt(_1747);
    float _1763 = fma(_1751, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1769 = fma(_1751, _1763, 1.570728778839111328125);
    float _1771 = _1765 * _1735;
    float _1773 = -_1715;
    float _1775 = fma(_1749, _1755, _1773);
    float _1777 = _1721 * 0.693147182464599609375;
    float _1779 = _1767 * _1735;
    float _1781 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = fma(_1779, -0.5, 0.5);
    float _1787 = _1761 * 0.636619746685028076171875;
    float _1789 = -_1769;
    float _1791 = fma(_1787, _1789, 1.0);
    float _1793 = fma(_1775, 0.5, 0.5);
    float3 _6492 = float3(_1783, _1785, _1781);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6492, float3(0.0), isnan(_6492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6492, float3(0.0), isnan(_6492)), level(0.0)).x;
    float3 _6503 = float3(_1783, _1785, _1781);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6503, float3(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6503, float3(0.0), isnan(_6503)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _6520 = float2(_1791, _1793);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6520, float2(0.0), isnan(_6520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6520, float2(0.0), isnan(_6520)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    out.m_60.y = _435;
    float _1826 = -_905;
    float _1828 = _1826 + 1.0;
    out.m_62.y = _1199;
    float _1830 = -_181;
    int _1832 = _1489 ? as_type<int>(_1830) : as_type<int>(_181);
    float _1834 = trunc(_621);
    int _1836 = int(_1834);
    float _1838 = -_923;
    float _1840 = _1838 + 1.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    float _1846 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1848 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1850 = _1848 != 0;
    float _1852 = _1781;
    float _1854 = _1723;
    float _1856 = _1767;
    if (_1824)
    {
        float _1858 = in.m_54.x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1866;
    float _1870 = float(uint(_1820));
    float _1872 = _1860;
    if (!_1824)
    {
        float _1874 = in.m_54.y;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = ~_1820;
    int _1880 = _1878 + 1;
    float _1882 = 1.0 / _1868;
    int _1884 = ~_1820;
    int _1886 = _1884 + 1;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1892 = -_911;
    float _1894 = _1892 + 1.0;
    float _1896 = float(uint(_1836));
    out.m_64.x = _1389;
    out.m_64.y = _1387;
    out.m_64.z = _1391;
    bool _1898 = _581 != 0;
    float _1900 = 1.0 / _1870;
    bool _1902 = !_1850;
    float _1904 = _1902 ? _181 : as_type<float>(_1832);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1890;
    bool _1918 = !_1844;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1930 = _419 + _1928;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1934 = _1932 != 0;
    float _1936 = as_type<float>(_1880);
    if (_1824)
    {
        _635 = 1.0;
    }
    float _1938 = _635;
    float _1940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1942 = as_type<int>(_1900) + (-2);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1946 = _419 + _1944;
    float _1948 = _1938;
    if (_1824)
    {
        _1936 = 1.0;
    }
    float _1950 = _1936;
    float _1952 = _1950;
    if (!_1824)
    {
        _1948 = 7.345489978790283203125;
    }
    float _1954 = _1948;
    float _1956 = as_type<float>(_1942) * _1896;
    if (!_1824)
    {
        _1952 = 1.2345600128173828125;
    }
    float _1958 = _1952;
    float _1960 = _1946 * _1916;
    float _1962 = float(_1820);
    float _1964 = trunc(_1956);
    float _1966 = precise::max(_1964, 0.0);
    uint _1969 = uint(_1966);
    float _1971 = _1954 * _421;
    float _1973 = floor(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1983 = abs(_1049);
    bool _1985 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1987 = isnan(_419);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    int _1997 = abs(_599);
    int _1999 = _1880 * int(_1969);
    int _2001 = _1999 + _1836;
    float _2003 = 1.0 / _1977;
    int _2005 = abs(_619);
    float _2007 = float(uint(_2001));
    float _2009 = -_1973;
    float _2011 = _1971 + _2009;
    float _2013 = 1.0 / _1981;
    float _2015 = as_type<float>(_1942) * _2007;
    float _2017 = trunc(_2015);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = _1930 * _2003;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _2027 = _419 + _2025;
    float _2029 = _2027 * _1882;
    float _2031 = _1876 * _1958;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2033;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2037;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2043 = int(_2041);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2049 = fma(_2035, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2051 = fma(_2039, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2053 = int(_1969) + int(_2021);
    float _2055 = floor(_2031);
    int _2057 = _1886 * _2053;
    int _2059 = _2057 + _1836;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = exp2(_1846);
    bool _2065 = uint(_2059) >= uint(_1820);
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2075 = _2073 != 0;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _2081 = _419 + _2079;
    int _2083 = ~_2053;
    int _2085 = _2083 + _2071;
    int _2087 = _2085 + 1;
    float _2089 = -_2055;
    float _2091 = _2031 + _2089;
    float _2093 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2081 * _2013;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _2097;
    int _2101 = _1820 * _2087;
    int _2103 = _2101 + _1836;
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    out.m_66.x = _2093;
    out.m_66.y = _2067;
    out.m_66.z = _1922;
    float _2109 = fma(_2099, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _2111 = !_1934;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _1962 * _897;
    bool _2117 = _421 > 0.5;
    float _2119 = -_2063;
    float _2121 = _2119 + 1.0;
    int _2123 = abs(_2113);
    float _2125 = -_177;
    int _2127 = _2117 ? as_type<int>(_2125) : as_type<int>(_177);
    float _2129 = trunc(_2115);
    int _2131 = int(_2129);
    bool _2133 = _1820 == 0;
    float _2135 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2137 = float(_1836);
    float _2139 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2141 = !_2133;
    int _2143 = _2141 ? _2103 : (-1);
    bool _2145 = _2137 >= _1962;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(_1962);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2161 = float(uint(_2043));
    float _2163 = fma(_2159, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2165 = trunc(_2155);
    int _2167 = int(_2165);
    float _2169 = fma(_2047, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _2171 = _2091 * _1962;
    float _2173 = trunc(_2171);
    int _2175 = int(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _2177;
    float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2181;
    int _2185 = ~_2167;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = 1.0 / _2161;
    int _2193 = _2143 * _2189;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _2195;
    int _2199 = _1820 + (-1);
    float _2201 = fma(_2197, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _2203 = fma(_2179, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    int _2205 = abs(_1057);
    int _2207 = _2167 * _2199;
    int _2209 = _2207 + _2193;
    float _2211 = fma(_2183, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2213 = trunc(_679);
    int _2215 = int(_2213);
    int _2217 = abs(_1061);
    int _2219 = _2209 * _1983;
    int _2221 = _2175 * _2123;
    int _2223 = _2221 + _1836;
    bool _2225 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _2227 = isnan(_419);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    int _2237 = _2131 * _2205;
    int _2239 = _2237 + _2219;
    bool _2241 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _2243 = isnan(_419);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = -_2235;
    float _2255 = _2253 + 1.0;
    int _2257 = as_type<int>(_2191) + (-2);
    int _2259 = _2223 * _2217;
    int _2261 = _2259 + _2239;
    int _2263 = abs(_1093);
    float _2265 = _2251 * _2255;
    bool _2267 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2269 = isnan(_419);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    float _2279 = -_2251;
    float _2281 = _2279 + 1.0;
    float _2283 = float(uint(_2215));
    float _2285 = _2277 * _2281;
    float _2287 = -_2277;
    float _2289 = _2287 + 1.0;
    int _2291 = _2175 * _2263;
    int _2293 = _2291 + _2261;
    bool _2295 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2297 = isnan(_419);
    bool _2299 = _2295 || _2297;
    bool _2301 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2303 = _2299 || _2301;
    float _2305 = float(_2303);
    float _2307 = as_type<float>(_2257) * _2283;
    float _2309 = _1995 * _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _2315 = float(uint(_2293));
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _2321 = float(_2043);
    float _2323 = trunc(_2307);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    int _2329 = ~_2043;
    int _2331 = _2329 + 1;
    float _2333 = as_type<float>(_1942) * _2315;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _2337 = _2335 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _2339 = _2011 * _2321;
    float _2341 = -_1995;
    float _2343 = _2341 + 1.0;
    float _2345 = fma(_2319, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _2347 = trunc(_2333);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    float _2353 = fma(_2313, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _2355 = fma(_2337, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    int _2357 = ~_1820;
    int _2359 = _2357 + 1;
    float _2361 = _2305 * _2343;
    bool _2363 = !_2075;
    float _2365 = _2363 ? _177 : as_type<float>(_2127);
    float _2367 = _2321 * _897;
    float _2369 = trunc(_2339);
    int _2371 = int(_2369);
    int _2373 = _2331 * int(_2327);
    int _2375 = _2373 + _2215;
    float _2377 = _2049 * _2361;
    float _2379 = _2051 * _2361;
    float _2381 = _2109 * _2361;
    float _2383 = float(uint(_2375));
    int _2385 = abs(_1920);
    float _2387 = _2365 + 0.5;
    int _2389 = _2359 * int(_2351);
    int _2391 = _2389 + _2293;
    float _2393 = as_type<float>(_2257) * _2383;
    float _2395 = _1904 + (-0.5);
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[80].x, _547);
    float _2399 = trunc(_2367);
    int _2401 = int(_2399);
    float _2403 = float(uint(_2391));
    float _2405 = -_2395;
    float _2407 = -_553;
    float _2409 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2407);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2215;
    float _2415 = -_2305;
    float _2417 = _2415 + 1.0;
    float _2419 = as_type<float>(_1942) * _2403;
    float _2421 = trunc(_2393);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2377);
    float _2429 = float(uint(_2413));
    float _2431 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2379);
    float _2433 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2381);
    float _2435 = fma(_2163, _2309, _2427);
    int _2437 = ~_2043;
    int _2439 = _2437 + 1;
    float _2441 = as_type<float>(_2257) * _2429;
    float _2443 = trunc(_2419);
    float _2445 = precise::max(_2443, 0.0);
    uint _2447 = uint(_2445);
    float _2449 = fma(_2139, _2309, _2433);
    float _2451 = fma(_2201, _2285, _2435);
    float _2453 = float(_2215);
    float _2455 = fma(_2211, _2285, _2449);
    int _2457 = ~_1820;
    int _2459 = _2457 + 1;
    float _2461 = fma(_2345, _2265, _2451);
    float _2463 = trunc(_2441);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    int _2469 = int(_2327) + int(_2425);
    float _2471 = fma(_2169, _2309, _2431);
    bool _2473 = _2453 >= _2321;
    bool _2475 = isnan(_2453);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan(_2321);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].x, _2461);
    int _2487 = _2439 * _2469;
    int _2489 = _2487 + _2215;
    float _2491 = fma(_2203, _2285, _2471);
    int _2493 = ~_2043;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2483);
    int _2499 = int(_2497);
    int _2501 = int(_2351) + int(_2447);
    float _2503 = fma(_2353, _2265, _2491);
    bool _2505 = uint(_2489) >= uint(_2043);
    float _2507 = fma(_2355, _2265, _2455);
    float _2509 = float(uint(_2223));
    int _2511 = _2495 * int(_2467);
    int _2513 = _2511 + _2413;
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2521 = _523 + 0.5;
    float _2523 = as_type<float>(_1942) * _2509;
    int _2525 = ~_2469;
    int _2527 = _2525 + _2517;
    int _2529 = _2527 + 1;
    int _2531 = _2459 * _2501;
    int _2533 = _2531 + _2293;
    float _2535 = float(uint(_2513));
    float _2537 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].y, _2503);
    float _2539 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].z, _2507);
    int _2541 = _2043 * _2529;
    int _2543 = _2541 + _2215;
    bool _2545 = uint(_2533) >= uint(_1820);
    float _2547 = as_type<float>(_2257) * _2535;
    int _2549 = ~_2499;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    float _2555 = trunc(_2523);
    float _2557 = precise::max(_2555, 0.0);
    uint _2559 = uint(_2557);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : (-1);
    float _2565 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2567 = _2043 == 0;
    float _2569 = _2135 * _1795;
    int _2571 = _2043 + (-1);
    float _2573 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2575 = !_2567;
    int _2577 = _2575 ? _2543 : (-1);
    float _2579 = trunc(_2547);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = ~_2501;
    int _2587 = _2585 + _2563;
    int _2589 = _2587 + 1;
    float _2591 = -_2135;
    float _2593 = _2591 + 1.0;
    int _2595 = ~_1820;
    int _2597 = _2595 + 1;
    int _2599 = _2577 * _2553;
    float _2601 = fma(_2519, _2521, _901);
    int _2603 = ~_2043;
    int _2605 = _2603 + 1;
    int _2607 = _1820 * _2589;
    int _2609 = _2607 + _2293;
    bool _2611 = !_1864;
    int _2613 = _2611 ? 0 : 1;
    int _2615 = _2499 * _2571;
    int _2617 = _2615 + _2599;
    int _2619 = _2597 * int(_2559);
    int _2621 = _2619 + _2223;
    int _2623 = abs(_625);
    float _2625 = -_1828;
    float _2627 = fma(_523, _2625, _2601);
    int _2629 = ~_1820;
    int _2631 = _2629 + 1;
    int _2633 = _2617 * _1997;
    int _2635 = int(_2467) + int(_2583);
    float _2637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2639 = _2401 * _2005;
    int _2641 = _2639 + _2633;
    float _2643 = float(uint(_2621));
    int _2645 = _2605 * _2635;
    int _2647 = _2645 + _2413;
    int _2649 = abs(_2613);
    bool _2651 = !_2133;
    int _2653 = _2651 ? _2609 : (-1);
    float _2655 = as_type<float>(_1942) * _2643;
    bool _2657 = uint(_2647) >= uint(_2043);
    int _2659 = _2413 * _2623;
    int _2661 = _2659 + _2641;
    int _2663 = _2653 >> 31;
    float _2665 = _529 + (-0.5);
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    int _2671 = _2371 * _2649;
    int _2673 = _2671 + _2661;
    int _2675 = _2663 & 3;
    float _2677 = trunc(_2655);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    int _2683 = _2653 & 3;
    bool _2685 = _2683 != 0;
    float _2687 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2689 = _2653 + _2675;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = -_2687;
    float _2697 = -_933;
    float _2699 = fma(_2695, _2665, _2697);
    int _2701 = _2653 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _2689 >> 2;
    float _2707 = fma(_529, _1840, _2699);
    float _2709 = float(uint(_2673));
    int _2711 = _2705 << 4;
    int _2713 = _2711 + 512;
    int _2715 = _2703 ? 0 : 1;
    float _2717 = as_type<float>(_2257) * _2709;
    bool _2719 = uint(_2683) > 1u;
    uint _2721 = uint(int(uint(_2713) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2715;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    out.m_68.x = _2627;
    out.m_68.y = _2707;
    int _2743 = int(_2559) + int(_2681);
    float _2745 = trunc(_2717);
    float _2747 = precise::max(_2745, 0.0);
    uint _2749 = uint(_2747);
    int _2751 = ~_2043;
    int _2753 = _2751 + 1;
    int _2755 = ~_2635;
    int _2757 = _2755 + _2669;
    int _2759 = _2757 + 1;
    int _2761 = _2713 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    uint _2765 = uint(int(uint(int(_2763)) >> uint(2)));
    int _2767 = int(_2763) & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    int _2771 = int(_2763) + 1;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    int _2775 = _2771 & 3;
    float _2777 = (*spvDescriptorSet0.vp_c9)._m0[int(_2773)][_2775];
    int _2779 = _2631 * _2743;
    int _2781 = _2779 + _2223;
    float _2783 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2785 = _2741;
    if (!_2719)
    {
        int _2787 = ~_2715;
        int _2789 = _2787 + 1;
        _2785 = _2789;
    }
    int _2791 = _2785;
    float _2793 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2795 = uint(_2683) >= 2u;
    float _2797 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2799 = abs(_2791);
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2795 ? 0 : 1;
    float _2805 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2807 = _2683 != 3;
    int _2809 = _2753 * int(_2749);
    int _2811 = _2809 + _2673;
    int _2813 = ~_2803;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    out.m_70.x = _2573;
    out.m_70.y = _2797;
    out.m_70.z = _2801;
    float _2819 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2821 = _2043 * _2759;
    int _2823 = _2821 + _2413;
    float _2825 = float(uint(_2811));
    float _2827 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2819);
    bool _2829 = !_2567;
    int _2831 = _2829 ? _2823 : (-1);
    int _2833 = _2817;
    if (_2807)
    {
        int _2835 = ~_2803;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    float _2841 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2843 = uint(_2781) >= uint(_1820);
    float _2845 = as_type<float>(_2257) * _2825;
    float _2847 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2849 = abs(_2693);
    float _2851 = -_1097;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2855 = abs(_2839);
    float _2857 = -_1097;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2861 = trunc(_2845);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    float _2873 = -_1097;
    float _2875 = fma(_2873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2877 = ~_2799;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    bool _2883 = !_2843;
    int _2885 = _2883 ? 0 : (-1);
    bool _2887 = _2683 != 3;
    float _2889 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2891 = int(_2889);
    int _2893 = _2881 * as_type<int>(_2735);
    int _2895 = ~_2743;
    int _2897 = _2895 + _2885;
    int _2899 = _2897 + 1;
    float _2901 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2859);
    int _2903 = ~_2855;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2871 * as_type<int>(_2727);
    int _2911 = _2909 + _2893;
    bool _2913 = !_2887;
    int _2915 = _2913 ? 0 : (-1);
    int _2917 = _1820 * _2899;
    int _2919 = _2917 + _2223;
    bool _2921 = !_1926;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2907 * as_type<int>(_2769);
    int _2927 = _2925 + _2911;
    int _2929 = abs(_2915);
    float _2931 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2933 = abs(_2923);
    float _2935 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2853);
    int _2937 = ~_2929;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2875);
    int _2945 = int(_2749) + int(_2865);
    float _2947 = fma(_2931, _2931, 1.0);
    int _2949 = ~_2043;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2777);
    int _2955 = _2953 + _2927;
    int _2957 = abs(_2891);
    float _2959 = float(uint(_2891));
    int _2961 = _2951 * _2945;
    int _2963 = _2961 + _2673;
    float _2965 = float(uint(_2957));
    float _2967 = rsqrt(_2947);
    int _2969 = ~_2933;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    bool _2975 = uint(_2963) >= uint(_2043);
    float _2977 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2979 = !_2133;
    int _2981 = _2979 ? _2919 : (-1);
    int _2983 = _2955 * _2973;
    float _2985 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = 1.0 / _2959;
    float _2989 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2991 = _2981 * _2933;
    int _2993 = _2991 + _2983;
    float _2995 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2997 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _2999 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2977);
    float _3001 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3003 = abs(_2993);
    float _3005 = 1.0 / _2965;
    bool _3007 = !_2975;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2989);
    float _3013 = float(uint(_2993));
    float _3015 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2995);
    int _3017 = ~_2945;
    int _3019 = _3017 + _3009;
    int _3021 = _3019 + 1;
    float _3023 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3025 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2997);
    int _3027 = as_type<int>(_2987) + (-2);
    float _3029 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3001);
    int _3031 = _2043 * _3021;
    int _3033 = _3031 + _2673;
    float _3035 = float(uint(_3003));
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3015);
    float _3039 = as_type<float>(_3027) * _3013;
    float _3041 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3029);
    bool _3043 = !_2567;
    int _3045 = _3043 ? _3033 : (-1);
    float _3047 = _2931 * _2901;
    int _3049 = as_type<int>(_3005) + (-2);
    float _3051 = trunc(_3039);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    int _3057 = _3045 >> 31;
    int _3059 = ~_2957;
    int _3061 = _3059 + 1;
    float _3063 = as_type<float>(_3049) * _3035;
    int _3065 = _3057 & 3;
    float _3067 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2999);
    float _3069 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    float _3071 = -_177;
    int _3073 = _1898 ? as_type<int>(_3071) : as_type<int>(_177);
    float _3075 = trunc(_3063);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = _3045 + _3065;
    out.m_72.x = _3025;
    out.m_72.y = _3067;
    out.m_72.z = _3069;
    int _3083 = ~_2891;
    int _3085 = _3083 + 1;
    int _3087 = _3081 >> 2;
    float _3089 = _2931 * _2967;
    bool _3091 = !_1908;
    float _3093 = _3091 ? _177 : as_type<float>(_3073);
    int _3095 = _3085 * int(_3055);
    int _3097 = _3095 + _2993;
    int _3099 = _3087 << 4;
    int _3101 = _3099 + 368;
    float _3103 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3105 = _3045 & 3;
    bool _3107 = _3105 != 0;
    float _3109 = -_3023;
    float _3111 = _3089 * _3109;
    float _3113 = float(uint(_3097));
    float _3115 = fma(_3103, _3025, _3047);
    uint _3117 = uint(int(uint(_3101) >> uint(2)));
    uint _3119 = uint(int(uint(int(_3117)) >> uint(2)));
    int _3121 = int(_3117) & 3;
    float _3123 = (*spvDescriptorSet0.vp_c9)._m0[int(_3119)][_3121];
    int _3125 = int(_3117) + 1;
    uint _3127 = uint(int(uint(_3125) >> uint(2)));
    int _3129 = _3125 & 3;
    float _3131 = (*spvDescriptorSet0.vp_c9)._m0[int(_3127)][_3129];
    int _3133 = _3061 * int(_3079);
    int _3135 = _3133 + _3003;
    float _3137 = _2931 * _2935;
    int _3139 = _3045 & 3;
    bool _3141 = _3139 != 0;
    float _3143 = as_type<float>(_3027) * _3113;
    float _3145 = fma(_2967, _2901, _3111);
    float _3147 = float(uint(_3135));
    float _3149 = -_3037;
    float _3151 = _3089 * _3149;
    bool _3153 = uint(_3139) > 1u;
    float _3155 = trunc(_3143);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    bool _3161 = _3139 != 3;
    float _3163 = as_type<float>(_3049) * _3147;
    float _3165 = _2931 * _2943;
    float _3167 = -_3041;
    float _3169 = _3089 * _3167;
    float _3171 = fma(_2967, _2935, _3151);
    int _3173 = _3107 ? 0 : 1;
    float _3175 = fma(_2967, _2943, _3169);
    float _3177 = fma(_3103, _3067, _3137);
    float _3179 = trunc(_3163);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    int _3185 = _3101 + 8;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    uint _3189 = uint(int(uint(int(_3187)) >> uint(2)));
    int _3191 = int(_3187) & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    int _3195 = int(_3187) + 1;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    int _3199 = _3195 & 3;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[int(_3197)][_3199];
    int _3203 = ~_3173;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    float _3209 = fma(_3103, _3069, _3165);
    int _3211 = _3207;
    if (!_3153)
    {
        int _3213 = ~_3173;
        int _3215 = _3213 + 1;
        _3211 = _3215;
    }
    int _3217 = _3211;
    out.m_74.x = _3145;
    out.m_74.y = _3171;
    out.m_74.z = _3175;
    int _3219 = ~_2891;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3139) >= 2u;
    bool _3225 = _3139 != 3;
    int _3227 = ~_2957;
    int _3229 = _3227 + 1;
    int _3231 = int(_3055) + int(_3159);
    bool _3233 = !_3141;
    int _3235 = _3233 ? 0 : 1;
    int _3237 = int(_3079) + int(_3183);
    int _3239 = _3221 * _3231;
    int _3241 = _3239 + _2993;
    int _3243 = abs(_3235);
    float _3245 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3247 = abs(_3217);
    int _3249 = _3229 * _3237;
    int _3251 = _3249 + _3003;
    float _3253 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3245);
    int _3255 = ~_3247;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3241) >= uint(_2891);
    float _3263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3265 = _3223 ? 0 : 1;
    int _3267 = _3259 * as_type<int>(_3131);
    bool _3269 = uint(_3251) >= uint(_2957);
    float _3271 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3253);
    int _3273 = ~_3243;
    int _3275 = _3273 + 1;
    int _3277 = _3275 + 1;
    bool _3279 = !_3261;
    int _3281 = _3279 ? 0 : (-1);
    float _3283 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3271);
    int _3285 = _2993 ^ _2891;
    int _3287 = _3277 * as_type<int>(_3123);
    int _3289 = _3287 + _3267;
    int _3291 = ~_3265;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3299 = !_3269;
    int _3301 = _3299 ? 0 : (-1);
    float _3303 = _1816 * _2569;
    int _3305 = _3295;
    float _3307 = _3283;
    if (_3161)
    {
        int _3309 = ~_3265;
        int _3311 = _3309 + 1;
        _3305 = _3311;
    }
    int _3313 = _3305;
    float _3315 = _3037 + _3177;
    int _3317 = ~_3231;
    int _3319 = _3317 + _3281;
    int _3321 = _3319 + 1;
    bool _3323 = !_3225;
    int _3325 = _3323 ? 0 : (-1);
    uint _3327 = uint(int(uint(_3285) >> uint(31)));
    int _3329 = _2891 * _3321;
    int _3331 = _3329 + _2993;
    int _3333 = ~_3301;
    int _3335 = _3237 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = abs(_3313);
    int _3341 = abs(_3325);
    int _3343 = ~int(_3327);
    int _3345 = _3343 + 1;
    bool _3347 = !_1914;
    int _3349 = _3347 ? 0 : 1;
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = _3337 ^ _3345;
    int _3359 = abs(_3349);
    int _3361 = _3355 * as_type<int>(_3193);
    int _3363 = _3361 + _3289;
    bool _3365 = _2891 == 0;
    int _3367 = ~_3341;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    bool _3373 = _2891 == 0;
    int _3375 = ~_3345;
    int _3377 = _3375 + _3357;
    int _3379 = _3377 + 1;
    int _3381 = _3371 * as_type<int>(_3201);
    int _3383 = _3381 + _3363;
    bool _3385 = !_3365;
    int _3387 = _3385 ? _3331 : (-1);
    bool _3389 = !_3373;
    int _3391 = _3389 ? _3379 : (-1);
    float _3393 = float(_3387);
    float _3395 = _3263 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3397 = ~_3359;
    int _3399 = _3397 + 1;
    int _3401 = _3399 + 1;
    float _3403 = float(_3391);
    float _3405 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3407 = fma(_3395, _3393, _931);
    int _3409 = _3383 * _3401;
    float _3411 = _3093 + 0.5;
    float _3413 = -_917;
    float _3415 = fma(_3405, _3403, _3413);
    float _3417 = _1017 + (-0.5);
    int _3419 = _2831 * _3359;
    int _3421 = _3419 + _3409;
    float _3423 = _3283 + _1723;
    float _3425 = fma(_3395, _3411, _3407);
    float _3427 = -_3405;
    float _3429 = fma(_3427, _3417, _3415);
    float _3431 = -_921;
    float _3433 = _3431 + 1.0;
    float _3435 = float(_3421);
    float _3437 = -_815;
    float _3439 = _3437 + 1.0;
    float _3441 = fma(_1017, _1894, _3429);
    float _3443 = _1806 * _2569;
    float _3445 = _3423 * 0.5;
    out.m_76.x = _3435;
    float _3447 = _3023 + _3115;
    float _3449 = _3041 + _3209;
    float _3451 = fma(_1812, _3443, _1800);
    float _3453 = fma(_1814, _3443, _1802);
    float _3455 = _1806 * _2593;
    out.m_78.z = _3445;
    out.m_78.w = _1723;
    float _3457 = fma(_1806, _3303, _1804);
    bool _3459 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3461 = isnan(_1499);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3467 = _3463 || _3465;
    float _3469 = -_893;
    float _3471 = _3469 + 1.0;
    out.m_80.x = _3447;
    out.m_80.y = _3315;
    out.m_80.z = _3449;
    float _3473 = -_3433;
    float _3475 = fma(_2365, _3473, _2397);
    float _3477 = -_3439;
    float _3479 = fma(_3093, _3477, _3425);
    float _3481 = fma(_1904, _3471, _2409);
    out.m_82.x = _3451;
    out.m_82.y = _3453;
    out.m_82.z = _3457;
    out.m_82.w = _3455;
    out.m_84.x = _3475;
    out.m_84.y = _3481;
    out.m_84.z = _3479;
    out.m_84.w = _3441;
    float _3483 = _3443;
    float _3485 = _3475;
    float _3487 = _1765;
    if (!_3467)
    {
        _3483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3489 = _3483;
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _3283;
    out.gl_Position.w = _1723;
    float _3491 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3493 = _3489;
    float _3495 = _3489;
    if (!_3467)
    {
        _3485 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    float _3501 = _3497;
    if (!_3467)
    {
        _1854 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3503 = _1854;
    float _3505 = _3503;
    float _3507 = _3503;
    if (!_3467)
    {
        _3307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3509 = _3307;
    float _3511 = _3509;
    float _3513 = _3509;
    if (!_3467)
    {
        _1856 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3515 = _1856;
    float _3517 = _3515;
    float _3519 = _3515;
    if (!_3467)
    {
        _3487 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3521 = _3487;
    bool _3523 = !_3467;
    float _3525 = _3521;
    float _3527 = _3521;
    if (!_3523)
    {
        bool _3529 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3531 = isnan(_1499);
        bool _3533 = _3529 || _3531;
        bool _3535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3537 = _3533 || _3535;
        if (!_3537)
        {
            float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3541 = _1499 + _3539;
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3543;
            float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3551 = 1.0 / _3545;
            float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3569 = _3541 * _3551;
            float _3571 = precise::clamp(_3569, 0.0, 1.0);
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3577 = fma(_3571, _3549, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3579 = fma(_3571, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3581 = fma(_3571, _3555, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3583 = fma(_3571, _3559, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3585 = fma(_3571, _3563, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3587 = fma(_3571, _3567, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3507 = _3581;
            _3527 = _3585;
            _3501 = _3577;
            _3519 = _3583;
            _3513 = _3579;
            _3495 = _3587;
            _3589 = true;
        }
        else
        {
            bool _3591 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3593 = isnan(_1499);
            bool _3595 = _3591 || _3593;
            bool _3597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3599 = _3595 || _3597;
            if (!_3599)
            {
                _3499 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3601 = _3499;
            _3501 = _3601;
            if (!_3599)
            {
                _3505 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3603 = _3505;
            _3507 = _3603;
            if (!_3599)
            {
                _3511 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3605 = _3511;
            _3513 = _3605;
            if (!_3599)
            {
                _3517 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3607 = _3517;
            _3519 = _3607;
            if (!_3599)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3609 = _3525;
            _3527 = _3609;
            if (!_3599)
            {
                _3493 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3611 = _3493;
            bool _3613 = !_3599;
            _3495 = _3611;
            if (!_3613)
            {
                bool _3615 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3617 = isnan(_1499);
                bool _3619 = _3615 || _3617;
                bool _3621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3623 = _3619 || _3621;
                if (!_3623)
                {
                    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3627 = _1499 + _3625;
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3631 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3629;
                    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3635 = _3633 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3637 = 1.0 / _3631;
                    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3655 = _3627 * _3637;
                    float _3657 = precise::clamp(_3655, 0.0, 1.0);
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3663 = fma(_3657, _3635, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3665 = fma(_3657, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3667 = fma(_3657, _3641, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3669 = fma(_3657, _3645, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3671 = fma(_3657, _3649, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3673 = fma(_3657, _3653, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3507 = _3667;
                    _3527 = _3671;
                    _3501 = _3663;
                    _3519 = _3669;
                    _3513 = _3665;
                    _3495 = _3673;
                    _3589 = true;
                }
                else
                {
                    _3507 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3501 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3519 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3513 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3495 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3589 = false;
    float _3675 = _3507;
    float _3677 = _3527;
    float _3679 = _3501;
    float _3681 = _3519;
    float _3683 = _3513;
    float _3685 = _3495;
    float _3687 = fma(_3315, -0.5, 0.5);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -_3675;
    float _3693 = _3691 + _3677;
    float _3695 = _3491 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3697 = -_3679;
    float _3699 = _3697 + _3681;
    float _3701 = fma(_3689, _3693, _3675);
    out.m_86.x = 0.0;
    float _3703 = -_3683;
    float _3705 = _3703 + _3685;
    float _3707 = fma(_3689, _3699, _3679);
    float _3709 = _3701 * 0.586610972881317138671875;
    out.m_47.x = _3695;
    bool _3711 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3713 = fma(_3689, _3705, _3683);
    float _3715 = fma(_3707, 0.298911988735198974609375, _3709);
    bool _3717 = _1475 > 0.0;
    bool _3719 = isnan(_1475);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(0.0);
    bool _3725 = _3721 || _3723;
    float _3727 = fma(_3713, 0.114477999508380889892578125, _3715);
    float _3729 = -_3727;
    float _3731 = _3707 + _3729;
    float _3733 = -_3727;
    float _3735 = _3701 + _3733;
    float _3737 = -_3727;
    float _3739 = _3713 + _3737;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3743 = fma(_3735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3745 = fma(_3739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    bool _3747 = !_3711;
    if (!_3747)
    {
        float _3749 = -_1387;
        float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3753 = -_1389;
        float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3757 = -_1391;
        float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3761 = _3751 * _3751;
        float _3763 = fma(_3755, _3755, _3761);
        float _3765 = fma(_3759, _3759, _3763);
        float _3767 = sqrt(_3765);
        float _3769 = rsqrt(_3765);
        float _3771 = -_3767;
        float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3775 = _3773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3777 = precise::clamp(_3775, 0.0, 1.0);
        float _3779 = _3755 * _3769;
        float _3781 = _3751 * _3769;
        float _3783 = abs(_3777);
        float _3785 = log2(_3783);
        float _3787 = _3759 * _3769;
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3791 = _3315 * _3781;
        float _3793 = -_3781;
        float _3795 = -_3789;
        float _3797 = fma(_3793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3795);
        float _3799 = fma(_3447, _3779, _3791);
        float _3801 = -_3787;
        float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3797);
        float _3805 = fma(_3449, _3787, _3799);
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3811 = _3803 + _3809;
        float _3813 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3815 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3817 = precise::clamp(_3815, 0.0, 1.0);
        float _3819 = exp2(_3813);
        float _3821 = _3819 * _3817;
        float _3823 = _3807 * _3821;
        float _3825 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3827 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3829 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3825;
        out.m_86.y = _3827;
        out.m_86.z = _3829;
    }
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    if (_3725)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3831;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3589 = false;
    bool _411 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3888 = as_type<float>(_123);
        out.gl_Position.z = _3888;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_161);
        out.gl_Position.z = _3958;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _223;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _227;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _211 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = fma(_265, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = _261 * _253;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    bool _275 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_211);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _289 = -_285;
    float _291 = _289 + 1.0;
    float _293 = _219 * _255;
    float _295 = -_247;
    float _297 = _295 + 1.0;
    bool _299 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_211);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _285 * _297;
    bool _313 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_211);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _309 * _291;
    float _327 = -_309;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _323 * _329;
    float _341 = fma(_333, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = -_323;
    float _347 = _345 + 1.0;
    float _349 = _267 * _339;
    float _351 = _287 * _339;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _367 = fma(_359, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _325, _361);
    float _371 = fma(_343, _325, _363);
    float _373 = fma(_365, _311, _369);
    float _375 = fma(_367, _311, _371);
    float _377 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _373);
    float _379 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _375);
    float _381 = _377 * _233;
    float _383 = _379 * _235;
    bool _385 = !_251;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _293;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _409;
    if (!_385)
    {
        float _393 = in.m_54.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_107);
        float _415 = 1.0 / _413;
        float _417 = _141 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = in.m_54.x;
    float _423 = in.m_54.y;
    float _425 = in.m_54.z;
    float _427 = in.m_54.w;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    float _433 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _435 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _445 = float(_107);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _449 = 1.0 / _445;
    float _451 = float(_431);
    float _453 = _421 * 2.0;
    bool _455 = _423 > 0.5;
    float _457 = _425 * 2.0;
    bool _459 = _425 > 0.5;
    float _461 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _463 = -_177;
    int _465 = _455 ? as_type<int>(_463) : as_type<int>(_177);
    float _467 = floor(_453);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _479 = _477 != 0;
    float _481 = -_441;
    float _483 = fma(_461, 2.0, _481);
    float _485 = -_181;
    int _487 = _459 ? as_type<int>(_485) : as_type<int>(_181);
    float _489 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _491 = int(_459);
    int _493 = _455 ? 2 : 0;
    int _495 = _491 | _493;
    int _497 = _165 ? 4 : 0;
    int _499 = _495 | _497;
    int _501 = _471 ? 8 : 0;
    int _503 = _499 | _501;
    int _505 = _475 ? 16 : 0;
    int _507 = _503 | _505;
    int _509 = _479 ? 32 : 0;
    int _511 = _507 | _509;
    int _513 = false ? 64 : 0;
    int _515 = _511 | _513;
    int _517 = _515 & 2;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _521 = !_475;
    float _523 = _521 ? _177 : as_type<float>(_465);
    float _525 = floor(_457);
    bool _527 = !_479;
    float _529 = _527 ? _181 : as_type<float>(_487);
    float _531 = fma(_489, -2.0, _443);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _543 = _541 != 0;
    float _545 = -_141;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _531);
    int _555 = int(_459);
    int _557 = _551 ? 2 : 0;
    int _559 = _555 | _557;
    int _561 = _165 ? 4 : 0;
    int _563 = _559 | _561;
    int _565 = _471 ? 8 : 0;
    int _567 = _563 | _565;
    int _569 = _535 ? 16 : 0;
    int _571 = _567 | _569;
    int _573 = _539 ? 32 : 0;
    int _575 = _571 | _573;
    int _577 = _543 ? 64 : 0;
    int _579 = _575 | _577;
    int _581 = _579 & 1;
    float _583 = 1.0 / _451;
    float _585 = _423 * 2.0;
    bool _587 = _467 >= 0.0;
    bool _589 = isnan(_467);
    bool _591 = _587 || _589;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = !_539;
    int _599 = _597 ? 0 : 1;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _603 = _601 != 0;
    float _605 = floor(_585);
    float _607 = _595 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _609 = _467 > 0.0;
    int _611 = ~as_type<int>(_607);
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    bool _617 = !_535;
    int _619 = _617 ? 0 : 1;
    float _621 = _583 * _141;
    bool _623 = !_543;
    int _625 = _623 ? 0 : 1;
    float _627 = float(_439);
    int _629 = as_type<int>(_467);
    int _631 = _615;
    float _633 = _607;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_603)
    {
        _629 = 0;
    }
    int _637 = _629;
    int _639 = _637;
    if (!_603)
    {
        _639 = 1;
    }
    int _641 = _639;
    float _643 = 1.0 / _627;
    int _645 = _641;
    if (!_609)
    {
        int _647 = ~as_type<int>(_607);
        int _649 = _647 + 1;
        _631 = _649;
    }
    int _651 = _631;
    bool _653 = _605 > 0.0;
    bool _655 = _641 != 1;
    if (_603)
    {
        _645 = 0;
    }
    int _657 = _645;
    bool _659 = _605 >= 0.0;
    bool _661 = isnan(_605);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _421 + (-0.5);
    int _671 = _657;
    if (!_603)
    {
        _671 = 2;
    }
    int _673 = _671;
    float _675 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _677 = _673 != 2;
    float _679 = _643 * _141;
    int _681 = ~as_type<int>(_675);
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    float _689 = as_type<float>(_673);
    float _691 = _675;
    if (!_653)
    {
        int _693 = ~as_type<int>(_675);
        int _695 = _693 + 1;
        _687 = _695;
    }
    int _697 = _687;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    bool _711 = _525 >= 0.0;
    bool _713 = isnan(_525);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    if (!_655)
    {
        _689 = _423;
    }
    float _721 = _689;
    int _723 = _719 ? 0 : 1;
    bool _725 = _525 > 0.0;
    float _727 = _421 + _423;
    float _729 = _721;
    if (_677)
    {
        _691 = _421;
    }
    float _731 = _691;
    float _733 = _731;
    if (!_677)
    {
        _733 = _425;
    }
    float _735 = _733;
    float _737 = _727 + (-1.0);
    if (!_655)
    {
        _387 = _721;
    }
    float _739 = _387;
    float _741 = _739;
    if (_655)
    {
        _729 = _423;
    }
    float _743 = _729;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _747 = ~_723;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = _735 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _757 = _751;
    float _759 = _743;
    if (!_725)
    {
        int _761 = ~_723;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _769 = log2(_767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_655)
    {
        _633 = _425;
    }
    float _773 = _633;
    bool _775 = !_701;
    int _777 = _775 ? 0 : 1;
    float _779 = -_771;
    float _781 = fma(_753, 2.0, _779);
    float _783 = _773;
    if (!_655)
    {
        _389 = _739;
    }
    float _785 = _389;
    float _787 = _785;
    if (_655)
    {
        _783 = _743;
    }
    float _789 = _783;
    if (_655)
    {
        _787 = _421;
    }
    float _791 = _787;
    if (_655)
    {
        _741 = _421;
    }
    float _793 = _741;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[83].w, _755);
    int _797 = abs(_777);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_655)
    {
        _391 = _425;
    }
    float _801 = _391;
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[83].z, _447);
    float _805 = _801;
    if (_655)
    {
        _805 = _743;
    }
    float _807 = _805;
    float _809 = -_519;
    float _811 = fma(_799, 2.0, _809);
    if (!_677)
    {
        _759 = _421;
    }
    float _813 = _759;
    float _815 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _803);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _821 = float(_797);
    float _823 = _769 * _141;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _829 = float(_765);
    float _831 = exp2(_823);
    float _833 = fma(_817, -2.0, _825);
    float _835 = fma(_819, -2.0, _827);
    float _837 = in.m_58.x;
    float _839 = in.m_58.y;
    float _841 = in.m_58.z;
    float _843 = _821 * _829;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_705;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _861 = -_831;
    float _863 = _861 + 1.0;
    bool _865 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = 1.0 / _851;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _879 = abs(_855);
    float _881 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[88].z, _859);
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _857);
    float _895 = _873 ? _863 : 0.0;
    float _897 = _449 * _141;
    float _899 = -_141;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[86].x, _781);
    float _903 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[88].w, _877);
    float _905 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _907 = float(_651);
    float _909 = _843 * (-2.0);
    float _911 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _913 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _845);
    float _915 = float(_879);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    float _919 = fma(_909, _837, _837);
    float _921 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _923 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _903);
    bool _925 = !_709;
    int _927 = _925 ? 0 : 1;
    float _929 = -_141;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _811);
    float _933 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _835);
    if (_891)
    {
        float _935 = _895 * _875;
        _143 = _935;
    }
    float _937 = _143;
    float _939 = fma(_745, _909, _745);
    float _941 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _943 = _915 * _907;
    float _945 = _425 + _423;
    int _947 = abs(_927);
    float _949 = fma(_939, _937, _941);
    float _951 = _943 * (-2.0);
    float _953 = _945 + (-1.0);
    float _955 = float(_697);
    float _957 = _423 + (-0.5);
    float _959 = float(_947);
    float _961 = fma(_951, _839, _839);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = _425 + _421;
    float _967 = _425 + (-0.5);
    float _969 = _959 * _955;
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    float _973 = _965 + (-1.0);
    float _975 = _969 * (-2.0);
    float _977 = fma(_963, _951, _963);
    float _979 = _949 * 0.15915493667125701904296875;
    float _981 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _983 = fma(_975, _841, _841);
    float _985 = fma(_977, _937, _971);
    float _987 = _979 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_981, _975, _981);
    float _993 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _995 = _985 * 0.15915493667125701904296875;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    bool _999 = _427 > 0.5;
    float _1001 = fma(_991, _937, _993);
    float _1003 = _979 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = -_181;
    int _1009 = _999 ? as_type<int>(_1007) : as_type<int>(_181);
    float _1011 = _1001 * 0.15915493667125701904296875;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    bool _1015 = !_471;
    float _1017 = _1015 ? _181 : as_type<float>(_1009);
    float _1019 = _433 * _1013;
    float _1021 = _995 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = in.m_44.x;
    float _1027 = in.m_44.y;
    float _1029 = in.m_44.z;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1045 = _1043 != 0;
    bool _1047 = !_1037;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _995 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    bool _1055 = !_1033;
    int _1057 = _1055 ? 0 : 1;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1071 = _1067 || _1069;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1011 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _989 * _1023;
    float _1089 = _1005 * _1023;
    bool _1091 = !_1045;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = _1011 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = _989 * _1053;
    float _1101 = _1005 * _1053;
    float _1103 = _989 * _1085;
    float _1105 = _1053 * _1085;
    float _1107 = _1005 * _1085;
    float _1109 = _1023 * _1085;
    float _1111 = _435 * _997;
    float _1113 = fma(_1097, _1101, _1087);
    float _1115 = fma(_1097, _1087, _1101);
    float _1117 = _1107 * _1111;
    float _1119 = -_1089;
    float _1121 = fma(_1097, _1099, _1119);
    float _1123 = -_1111;
    float _1125 = _1097 * _1123;
    float _1127 = -_1099;
    float _1129 = fma(_1097, _1089, _1127);
    float _1131 = _1103 * _1111;
    float _1133 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = fma(_1113, _1019, _1117);
    float _1137 = fma(_1105, _1019, _1125);
    float _1139 = fma(_1121, _1019, _1131);
    float _1141 = fma(_1129, _1133, _1135);
    float _1143 = fma(_1109, _1133, _1137);
    float _1145 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1147 = fma(_1115, _1133, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1153 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1145);
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1159 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1151);
    float _1161 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1163 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1165 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1167 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1175 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1177 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1181 = _1169 + _1173;
    float _1183 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1175);
    float _1185 = _1177 + _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1189 = _1181 + _1187;
    float _1191 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1183);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = _1189 * _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = sqrt(_1201);
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1207);
    float _1213 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1215 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1219 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1221 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1215);
    float _1223 = 1.0 / _1217;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1221);
    bool _1229 = _1205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1217;
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1235 = _1199 + _1233;
    float _1237 = _1231 * _1223;
    float _1239 = _1237 * 0.5;
    float _1241 = _1231;
    float _1243 = _1211;
    float _1245 = _1233;
    float _1247 = _1141;
    float _1249 = _1205;
    float _1251 = _1189;
    float _1253 = _1235;
    float _1255 = _1185;
    float _1257 = _979;
    if (!_1229)
    {
        _1241 = _1185;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (!_1229)
    {
        _1243 = _1181;
    }
    float _1263 = _1243;
    float _1265 = _1263;
    if (!_1229)
    {
        _1245 = _1235;
    }
    float _1267 = _1245;
    bool _1269 = !_1229;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1205 + _1275;
        float _1279 = rsqrt(_1201);
        float _1281 = _1277 * _1273;
        float _1283 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1235, _1289, _1297);
        float _1303 = _1279 * _1299;
        float _1305 = fma(_1195, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1189, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1261 = _1305;
        _1265 = _1307;
        _1271 = _1301;
        _1247 = _1285;
        _1249 = _1299;
    }
    float _1309 = _1261;
    float _1311 = _1265;
    float _1313 = _1271;
    float _1315 = _1247;
    float _1317 = _1249;
    float _1319 = _1315;
    float _1321 = _1313;
    float _1323 = _1309;
    float _1325 = _1311;
    float _1327 = _1317;
    if (_1081)
    {
        _1251 = 1.0;
    }
    float _1329 = _1251;
    float _1331 = _1329;
    if (!_1071)
    {
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1335 = _1199 + _1333;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1339 = _1177 + _1337;
        float _1341 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = -_1177;
        float _1345 = _1343 + _1309;
        float _1347 = _1335 * _1335;
        float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1351 = _1169 + _1349;
        float _1353 = -_1169;
        float _1355 = _1353 + _1311;
        float _1357 = -_1199;
        float _1359 = _1357 + _1313;
        float _1361 = fma(_1339, _1339, _1347);
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1365 = fma(_1351, _1351, _1361);
        float _1367 = sqrt(_1365);
        float _1369 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1371 = precise::min(_1367, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1373 = _1371 * _1363;
        float _1375 = _1369 * _1373;
        float _1377 = fma(_1345, _1375, _1177);
        float _1379 = fma(_1355, _1375, _1169);
        float _1381 = fma(_1359, _1375, _1199);
        _1319 = _1371;
        _1253 = _1345;
        _1321 = _1381;
        _1323 = _1377;
        _1325 = _1379;
        _1255 = _1341;
        _1327 = _1367;
    }
    float _1383 = _1319;
    float _1385 = _1253;
    float _1387 = _1321;
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1255;
    float _1395 = _1327;
    float _1397 = _1393;
    float _1399 = _1383;
    float _1401 = _1395;
    float _1403 = _1385;
    if (!_1081)
    {
        float _1405 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1413 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
        float _1415 = _1407 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1409 * 0.15915493667125701904296875;
        float _1421 = _1407 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = 1.0 / _1417;
        float _1427 = _1419 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = _1419 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1429 * _1431;
        float _1439 = 1.0 / _1413;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1443 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1441;
        float _1445 = 1.0 / _1437;
        float _1447 = 1.0 / _1443;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = _1439 * _1449;
        float _1453 = _1435 * _1445;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = fma(_1453, _1451, _1455);
        float _1459 = _1457 * _1447;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        float _1463 = -_1461;
        float _1465 = _1463 + 1.0;
        _1397 = _1419;
        _1399 = _1447;
        _1401 = _1413;
        _1403 = _1425;
        _1331 = _1465;
    }
    float _1467 = _1397;
    float _1469 = _1399;
    float _1471 = _1401;
    float _1473 = _1403;
    float _1475 = _1331;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1387 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1389 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1391 + _1485;
    bool _1489 = _517 != 0;
    float _1491 = _1479 * _1479;
    float _1493 = fma(_1483, _1483, _1491);
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1483 * _1501;
    float _1505 = _1487 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1519;
    float _1525 = _1467;
    float _1527 = _1479;
    float _1529 = _1471;
    float _1531 = _1473;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1535;
    if (_1515)
    {
        float _1539 = _1519 * _1535;
        _1523 = _1539;
    }
    float _1541 = _1523;
    if (_1515)
    {
        float _1543 = rsqrt(_1511);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    if (_1515)
    {
        float _1549 = _1541 * 0.15915493667125701904296875;
        _1525 = _1549;
    }
    float _1551 = _1525;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = _1487;
    if (_1515)
    {
        float _1557 = _1551 * 6.283185482025146484375;
        float _1559 = sin(_1557);
        _1555 = _1559;
    }
    float _1561 = _1555;
    float _1563 = precise::max(0.0, _1553);
    float _1565 = _1469;
    float _1567 = _1563;
    if (_1515)
    {
        float _1569 = _1551 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1565 = _1571;
    }
    float _1573 = _1565;
    float _1575 = -_1501;
    float _1577 = -_1563;
    float _1579 = fma(_1479, _1575, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1581;
    }
    float _1583 = _1527;
    float _1585 = _1561;
    float _1587 = _1583;
    if (_1515)
    {
        float _1589 = fma(_1561, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1529 = _1589;
    }
    float _1591 = _1529;
    float _1593 = _1591;
    if (!_1515)
    {
        _1585 = _1503;
    }
    float _1595 = _1585;
    float _1597 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1599 = _1595;
    if (!_1515)
    {
        _1587 = _1509;
    }
    float _1601 = _1587;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1545 * _1591;
        _1257 = _1605;
    }
    float _1607 = _1257;
    if (!_1515)
    {
        _1547 = _1579;
    }
    float _1609 = _1547;
    float _1611 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = _1609;
    if (_1515)
    {
        float _1615 = _1573 + (-1.0);
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (_1515)
    {
        float _1621 = _1503 * _1607;
        _1599 = _1621;
    }
    float _1623 = _1599;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1625 = _1593;
    float _1627 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1629 = _1625;
    if (_1515)
    {
        float _1631 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1631;
    }
    float _1633 = _1531;
    if (!_1515)
    {
        _1619 = _1505;
    }
    float _1635 = _1619;
    float _1637 = _1635;
    if (_1515)
    {
        float _1639 = _1505 * _1607;
        _1637 = _1639;
    }
    float _1641 = _1637;
    if (_1515)
    {
        float _1643 = _1623 * _1623;
        _1629 = _1643;
    }
    float _1645 = _1629;
    if (_1515)
    {
        float _1647 = fma(_1579, _1573, _1633);
        _1613 = _1647;
    }
    float _1649 = _1613;
    if (_1515)
    {
        float _1651 = _1641 * _1641;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1657 = fma(_1649, _1649, _1645);
    float _1659 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1661 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1655);
    float _1665 = _1657 + _1653;
    float _1667 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1671 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1669);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1659);
    float _1677 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1679 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1667);
    float _1681 = rsqrt(_1665);
    float _1683 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = -_1673;
    float _1687 = _1685 + 1.0;
    float _1689 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1691 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1675);
    float _1695 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1697 = abs(_1687);
    float _1699 = log2(_1697);
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1703 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1707 = -_1701;
    float _1709 = fma(_1707, _1597, 1.0);
    float _1711 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1705);
    float _1713 = _1681 * _1623;
    float _1715 = _1681 * _1649;
    float _1717 = _1681 * _1641;
    float _1719 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1709);
    float _1723 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1731 = -_1725;
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1731);
    float _1735 = 1.0 / _1723;
    float _1737 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1729);
    float _1739 = -_1717;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1733);
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1745 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1747 = fma(_1741, -0.5, 0.5);
    float _1749 = exp2(_1727);
    float _1751 = fma(_1741, 0.5, 0.5);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1743);
    float _1755 = _1715 + 1.0;
    float _1757 = fma(_1751, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1753);
    float _1761 = sqrt(_1747);
    float _1763 = fma(_1751, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1769 = fma(_1751, _1763, 1.570728778839111328125);
    float _1771 = _1765 * _1735;
    float _1773 = -_1715;
    float _1775 = fma(_1749, _1755, _1773);
    float _1777 = _1721 * 0.693147182464599609375;
    float _1779 = _1767 * _1735;
    float _1781 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = fma(_1779, -0.5, 0.5);
    float _1787 = _1761 * 0.636619746685028076171875;
    float _1789 = -_1769;
    float _1791 = fma(_1787, _1789, 1.0);
    float _1793 = fma(_1775, 0.5, 0.5);
    float3 _6492 = float3(_1783, _1785, _1781);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6492, float3(0.0), isnan(_6492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6492, float3(0.0), isnan(_6492)), level(0.0)).x;
    float3 _6503 = float3(_1783, _1785, _1781);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6503, float3(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6503, float3(0.0), isnan(_6503)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _6520 = float2(_1791, _1793);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6520, float2(0.0), isnan(_6520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6520, float2(0.0), isnan(_6520)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    out.m_60.y = _435;
    float _1826 = -_905;
    float _1828 = _1826 + 1.0;
    out.m_62.y = _1199;
    float _1830 = -_181;
    int _1832 = _1489 ? as_type<int>(_1830) : as_type<int>(_181);
    float _1834 = trunc(_621);
    int _1836 = int(_1834);
    float _1838 = -_923;
    float _1840 = _1838 + 1.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    float _1846 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1848 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1850 = _1848 != 0;
    float _1852 = _1781;
    float _1854 = _1723;
    float _1856 = _1767;
    if (_1824)
    {
        float _1858 = in.m_54.x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1866;
    float _1870 = float(uint(_1820));
    float _1872 = _1860;
    if (!_1824)
    {
        float _1874 = in.m_54.y;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = ~_1820;
    int _1880 = _1878 + 1;
    float _1882 = 1.0 / _1868;
    int _1884 = ~_1820;
    int _1886 = _1884 + 1;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1892 = -_911;
    float _1894 = _1892 + 1.0;
    float _1896 = float(uint(_1836));
    out.m_64.x = _1389;
    out.m_64.y = _1387;
    out.m_64.z = _1391;
    bool _1898 = _581 != 0;
    float _1900 = 1.0 / _1870;
    bool _1902 = !_1850;
    float _1904 = _1902 ? _181 : as_type<float>(_1832);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1890;
    bool _1918 = !_1844;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1930 = _419 + _1928;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1934 = _1932 != 0;
    float _1936 = as_type<float>(_1880);
    if (_1824)
    {
        _635 = 1.0;
    }
    float _1938 = _635;
    float _1940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1942 = as_type<int>(_1900) + (-2);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1946 = _419 + _1944;
    float _1948 = _1938;
    if (_1824)
    {
        _1936 = 1.0;
    }
    float _1950 = _1936;
    float _1952 = _1950;
    if (!_1824)
    {
        _1948 = 7.345489978790283203125;
    }
    float _1954 = _1948;
    float _1956 = as_type<float>(_1942) * _1896;
    if (!_1824)
    {
        _1952 = 1.2345600128173828125;
    }
    float _1958 = _1952;
    float _1960 = _1946 * _1916;
    float _1962 = float(_1820);
    float _1964 = trunc(_1956);
    float _1966 = precise::max(_1964, 0.0);
    uint _1969 = uint(_1966);
    float _1971 = _1954 * _421;
    float _1973 = floor(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1983 = abs(_1049);
    bool _1985 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1987 = isnan(_419);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    int _1997 = abs(_599);
    int _1999 = _1880 * int(_1969);
    int _2001 = _1999 + _1836;
    float _2003 = 1.0 / _1977;
    int _2005 = abs(_619);
    float _2007 = float(uint(_2001));
    float _2009 = -_1973;
    float _2011 = _1971 + _2009;
    float _2013 = 1.0 / _1981;
    float _2015 = as_type<float>(_1942) * _2007;
    float _2017 = trunc(_2015);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = _1930 * _2003;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _2027 = _419 + _2025;
    float _2029 = _2027 * _1882;
    float _2031 = _1876 * _1958;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2033;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2037;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2043 = int(_2041);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2049 = fma(_2035, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2051 = fma(_2039, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2053 = int(_1969) + int(_2021);
    float _2055 = floor(_2031);
    int _2057 = _1886 * _2053;
    int _2059 = _2057 + _1836;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = exp2(_1846);
    bool _2065 = uint(_2059) >= uint(_1820);
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2075 = _2073 != 0;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _2081 = _419 + _2079;
    int _2083 = ~_2053;
    int _2085 = _2083 + _2071;
    int _2087 = _2085 + 1;
    float _2089 = -_2055;
    float _2091 = _2031 + _2089;
    float _2093 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2081 * _2013;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _2097;
    int _2101 = _1820 * _2087;
    int _2103 = _2101 + _1836;
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    out.m_66.x = _2093;
    out.m_66.y = _2067;
    out.m_66.z = _1922;
    float _2109 = fma(_2099, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _2111 = !_1934;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _1962 * _897;
    bool _2117 = _421 > 0.5;
    float _2119 = -_2063;
    float _2121 = _2119 + 1.0;
    int _2123 = abs(_2113);
    float _2125 = -_177;
    int _2127 = _2117 ? as_type<int>(_2125) : as_type<int>(_177);
    float _2129 = trunc(_2115);
    int _2131 = int(_2129);
    bool _2133 = _1820 == 0;
    float _2135 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2137 = float(_1836);
    float _2139 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2141 = !_2133;
    int _2143 = _2141 ? _2103 : (-1);
    bool _2145 = _2137 >= _1962;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(_1962);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2161 = float(uint(_2043));
    float _2163 = fma(_2159, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2165 = trunc(_2155);
    int _2167 = int(_2165);
    float _2169 = fma(_2047, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _2171 = _2091 * _1962;
    float _2173 = trunc(_2171);
    int _2175 = int(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _2177;
    float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2181;
    int _2185 = ~_2167;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = 1.0 / _2161;
    int _2193 = _2143 * _2189;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _2195;
    int _2199 = _1820 + (-1);
    float _2201 = fma(_2197, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _2203 = fma(_2179, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    int _2205 = abs(_1057);
    int _2207 = _2167 * _2199;
    int _2209 = _2207 + _2193;
    float _2211 = fma(_2183, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2213 = trunc(_679);
    int _2215 = int(_2213);
    int _2217 = abs(_1061);
    int _2219 = _2209 * _1983;
    int _2221 = _2175 * _2123;
    int _2223 = _2221 + _1836;
    bool _2225 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _2227 = isnan(_419);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    int _2237 = _2131 * _2205;
    int _2239 = _2237 + _2219;
    bool _2241 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _2243 = isnan(_419);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = -_2235;
    float _2255 = _2253 + 1.0;
    int _2257 = as_type<int>(_2191) + (-2);
    int _2259 = _2223 * _2217;
    int _2261 = _2259 + _2239;
    int _2263 = abs(_1093);
    float _2265 = _2251 * _2255;
    bool _2267 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2269 = isnan(_419);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    float _2279 = -_2251;
    float _2281 = _2279 + 1.0;
    float _2283 = float(uint(_2215));
    float _2285 = _2277 * _2281;
    float _2287 = -_2277;
    float _2289 = _2287 + 1.0;
    int _2291 = _2175 * _2263;
    int _2293 = _2291 + _2261;
    bool _2295 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2297 = isnan(_419);
    bool _2299 = _2295 || _2297;
    bool _2301 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2303 = _2299 || _2301;
    float _2305 = float(_2303);
    float _2307 = as_type<float>(_2257) * _2283;
    float _2309 = _1995 * _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _2315 = float(uint(_2293));
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _2321 = float(_2043);
    float _2323 = trunc(_2307);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    int _2329 = ~_2043;
    int _2331 = _2329 + 1;
    float _2333 = as_type<float>(_1942) * _2315;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _2337 = _2335 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _2339 = _2011 * _2321;
    float _2341 = -_1995;
    float _2343 = _2341 + 1.0;
    float _2345 = fma(_2319, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _2347 = trunc(_2333);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    float _2353 = fma(_2313, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _2355 = fma(_2337, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    int _2357 = ~_1820;
    int _2359 = _2357 + 1;
    float _2361 = _2305 * _2343;
    bool _2363 = !_2075;
    float _2365 = _2363 ? _177 : as_type<float>(_2127);
    float _2367 = _2321 * _897;
    float _2369 = trunc(_2339);
    int _2371 = int(_2369);
    int _2373 = _2331 * int(_2327);
    int _2375 = _2373 + _2215;
    float _2377 = _2049 * _2361;
    float _2379 = _2051 * _2361;
    float _2381 = _2109 * _2361;
    float _2383 = float(uint(_2375));
    int _2385 = abs(_1920);
    float _2387 = _2365 + 0.5;
    int _2389 = _2359 * int(_2351);
    int _2391 = _2389 + _2293;
    float _2393 = as_type<float>(_2257) * _2383;
    float _2395 = _1904 + (-0.5);
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[80].x, _547);
    float _2399 = trunc(_2367);
    int _2401 = int(_2399);
    float _2403 = float(uint(_2391));
    float _2405 = -_2395;
    float _2407 = -_553;
    float _2409 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2407);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2215;
    float _2415 = -_2305;
    float _2417 = _2415 + 1.0;
    float _2419 = as_type<float>(_1942) * _2403;
    float _2421 = trunc(_2393);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2377);
    float _2429 = float(uint(_2413));
    float _2431 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2379);
    float _2433 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2381);
    float _2435 = fma(_2163, _2309, _2427);
    int _2437 = ~_2043;
    int _2439 = _2437 + 1;
    float _2441 = as_type<float>(_2257) * _2429;
    float _2443 = trunc(_2419);
    float _2445 = precise::max(_2443, 0.0);
    uint _2447 = uint(_2445);
    float _2449 = fma(_2139, _2309, _2433);
    float _2451 = fma(_2201, _2285, _2435);
    float _2453 = float(_2215);
    float _2455 = fma(_2211, _2285, _2449);
    int _2457 = ~_1820;
    int _2459 = _2457 + 1;
    float _2461 = fma(_2345, _2265, _2451);
    float _2463 = trunc(_2441);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    int _2469 = int(_2327) + int(_2425);
    float _2471 = fma(_2169, _2309, _2431);
    bool _2473 = _2453 >= _2321;
    bool _2475 = isnan(_2453);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan(_2321);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].x, _2461);
    int _2487 = _2439 * _2469;
    int _2489 = _2487 + _2215;
    float _2491 = fma(_2203, _2285, _2471);
    int _2493 = ~_2043;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2483);
    int _2499 = int(_2497);
    int _2501 = int(_2351) + int(_2447);
    float _2503 = fma(_2353, _2265, _2491);
    bool _2505 = uint(_2489) >= uint(_2043);
    float _2507 = fma(_2355, _2265, _2455);
    float _2509 = float(uint(_2223));
    int _2511 = _2495 * int(_2467);
    int _2513 = _2511 + _2413;
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2521 = _523 + 0.5;
    float _2523 = as_type<float>(_1942) * _2509;
    int _2525 = ~_2469;
    int _2527 = _2525 + _2517;
    int _2529 = _2527 + 1;
    int _2531 = _2459 * _2501;
    int _2533 = _2531 + _2293;
    float _2535 = float(uint(_2513));
    float _2537 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].y, _2503);
    float _2539 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].z, _2507);
    int _2541 = _2043 * _2529;
    int _2543 = _2541 + _2215;
    bool _2545 = uint(_2533) >= uint(_1820);
    float _2547 = as_type<float>(_2257) * _2535;
    int _2549 = ~_2499;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    float _2555 = trunc(_2523);
    float _2557 = precise::max(_2555, 0.0);
    uint _2559 = uint(_2557);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : (-1);
    float _2565 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2567 = _2043 == 0;
    float _2569 = _2135 * _1795;
    int _2571 = _2043 + (-1);
    float _2573 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2575 = !_2567;
    int _2577 = _2575 ? _2543 : (-1);
    float _2579 = trunc(_2547);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = ~_2501;
    int _2587 = _2585 + _2563;
    int _2589 = _2587 + 1;
    float _2591 = -_2135;
    float _2593 = _2591 + 1.0;
    int _2595 = ~_1820;
    int _2597 = _2595 + 1;
    int _2599 = _2577 * _2553;
    float _2601 = fma(_2519, _2521, _901);
    int _2603 = ~_2043;
    int _2605 = _2603 + 1;
    int _2607 = _1820 * _2589;
    int _2609 = _2607 + _2293;
    bool _2611 = !_1864;
    int _2613 = _2611 ? 0 : 1;
    int _2615 = _2499 * _2571;
    int _2617 = _2615 + _2599;
    int _2619 = _2597 * int(_2559);
    int _2621 = _2619 + _2223;
    int _2623 = abs(_625);
    float _2625 = -_1828;
    float _2627 = fma(_523, _2625, _2601);
    int _2629 = ~_1820;
    int _2631 = _2629 + 1;
    int _2633 = _2617 * _1997;
    int _2635 = int(_2467) + int(_2583);
    float _2637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2639 = _2401 * _2005;
    int _2641 = _2639 + _2633;
    float _2643 = float(uint(_2621));
    int _2645 = _2605 * _2635;
    int _2647 = _2645 + _2413;
    int _2649 = abs(_2613);
    bool _2651 = !_2133;
    int _2653 = _2651 ? _2609 : (-1);
    float _2655 = as_type<float>(_1942) * _2643;
    bool _2657 = uint(_2647) >= uint(_2043);
    int _2659 = _2413 * _2623;
    int _2661 = _2659 + _2641;
    int _2663 = _2653 >> 31;
    float _2665 = _529 + (-0.5);
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    int _2671 = _2371 * _2649;
    int _2673 = _2671 + _2661;
    int _2675 = _2663 & 3;
    float _2677 = trunc(_2655);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    int _2683 = _2653 & 3;
    bool _2685 = _2683 != 0;
    float _2687 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2689 = _2653 + _2675;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = -_2687;
    float _2697 = -_933;
    float _2699 = fma(_2695, _2665, _2697);
    int _2701 = _2653 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _2689 >> 2;
    float _2707 = fma(_529, _1840, _2699);
    float _2709 = float(uint(_2673));
    int _2711 = _2705 << 4;
    int _2713 = _2711 + 512;
    int _2715 = _2703 ? 0 : 1;
    float _2717 = as_type<float>(_2257) * _2709;
    bool _2719 = uint(_2683) > 1u;
    uint _2721 = uint(int(uint(_2713) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2715;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    out.m_68.x = _2627;
    out.m_68.y = _2707;
    int _2743 = int(_2559) + int(_2681);
    float _2745 = trunc(_2717);
    float _2747 = precise::max(_2745, 0.0);
    uint _2749 = uint(_2747);
    int _2751 = ~_2043;
    int _2753 = _2751 + 1;
    int _2755 = ~_2635;
    int _2757 = _2755 + _2669;
    int _2759 = _2757 + 1;
    int _2761 = _2713 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    uint _2765 = uint(int(uint(int(_2763)) >> uint(2)));
    int _2767 = int(_2763) & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    int _2771 = int(_2763) + 1;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    int _2775 = _2771 & 3;
    float _2777 = (*spvDescriptorSet0.vp_c9)._m0[int(_2773)][_2775];
    int _2779 = _2631 * _2743;
    int _2781 = _2779 + _2223;
    float _2783 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2785 = _2741;
    if (!_2719)
    {
        int _2787 = ~_2715;
        int _2789 = _2787 + 1;
        _2785 = _2789;
    }
    int _2791 = _2785;
    float _2793 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2795 = uint(_2683) >= 2u;
    float _2797 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2799 = abs(_2791);
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2795 ? 0 : 1;
    float _2805 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2807 = _2683 != 3;
    int _2809 = _2753 * int(_2749);
    int _2811 = _2809 + _2673;
    int _2813 = ~_2803;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    out.m_70.x = _2573;
    out.m_70.y = _2797;
    out.m_70.z = _2801;
    float _2819 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2821 = _2043 * _2759;
    int _2823 = _2821 + _2413;
    float _2825 = float(uint(_2811));
    float _2827 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2819);
    bool _2829 = !_2567;
    int _2831 = _2829 ? _2823 : (-1);
    int _2833 = _2817;
    if (_2807)
    {
        int _2835 = ~_2803;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    float _2841 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2843 = uint(_2781) >= uint(_1820);
    float _2845 = as_type<float>(_2257) * _2825;
    float _2847 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2849 = abs(_2693);
    float _2851 = -_1097;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2855 = abs(_2839);
    float _2857 = -_1097;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2861 = trunc(_2845);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    float _2873 = -_1097;
    float _2875 = fma(_2873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2877 = ~_2799;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    bool _2883 = !_2843;
    int _2885 = _2883 ? 0 : (-1);
    bool _2887 = _2683 != 3;
    float _2889 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2891 = int(_2889);
    int _2893 = _2881 * as_type<int>(_2735);
    int _2895 = ~_2743;
    int _2897 = _2895 + _2885;
    int _2899 = _2897 + 1;
    float _2901 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2859);
    int _2903 = ~_2855;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2871 * as_type<int>(_2727);
    int _2911 = _2909 + _2893;
    bool _2913 = !_2887;
    int _2915 = _2913 ? 0 : (-1);
    int _2917 = _1820 * _2899;
    int _2919 = _2917 + _2223;
    bool _2921 = !_1926;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2907 * as_type<int>(_2769);
    int _2927 = _2925 + _2911;
    int _2929 = abs(_2915);
    float _2931 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2933 = abs(_2923);
    float _2935 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2853);
    int _2937 = ~_2929;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2875);
    int _2945 = int(_2749) + int(_2865);
    float _2947 = fma(_2931, _2931, 1.0);
    int _2949 = ~_2043;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2777);
    int _2955 = _2953 + _2927;
    int _2957 = abs(_2891);
    float _2959 = float(uint(_2891));
    int _2961 = _2951 * _2945;
    int _2963 = _2961 + _2673;
    float _2965 = float(uint(_2957));
    float _2967 = rsqrt(_2947);
    int _2969 = ~_2933;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    bool _2975 = uint(_2963) >= uint(_2043);
    float _2977 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2979 = !_2133;
    int _2981 = _2979 ? _2919 : (-1);
    int _2983 = _2955 * _2973;
    float _2985 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = 1.0 / _2959;
    float _2989 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2991 = _2981 * _2933;
    int _2993 = _2991 + _2983;
    float _2995 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2997 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _2999 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2977);
    float _3001 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3003 = abs(_2993);
    float _3005 = 1.0 / _2965;
    bool _3007 = !_2975;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2989);
    float _3013 = float(uint(_2993));
    float _3015 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2995);
    int _3017 = ~_2945;
    int _3019 = _3017 + _3009;
    int _3021 = _3019 + 1;
    float _3023 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3025 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2997);
    int _3027 = as_type<int>(_2987) + (-2);
    float _3029 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3001);
    int _3031 = _2043 * _3021;
    int _3033 = _3031 + _2673;
    float _3035 = float(uint(_3003));
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3015);
    float _3039 = as_type<float>(_3027) * _3013;
    float _3041 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3029);
    bool _3043 = !_2567;
    int _3045 = _3043 ? _3033 : (-1);
    float _3047 = _2931 * _2901;
    int _3049 = as_type<int>(_3005) + (-2);
    float _3051 = trunc(_3039);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    int _3057 = _3045 >> 31;
    int _3059 = ~_2957;
    int _3061 = _3059 + 1;
    float _3063 = as_type<float>(_3049) * _3035;
    int _3065 = _3057 & 3;
    float _3067 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2999);
    float _3069 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    float _3071 = -_177;
    int _3073 = _1898 ? as_type<int>(_3071) : as_type<int>(_177);
    float _3075 = trunc(_3063);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = _3045 + _3065;
    out.m_72.x = _3025;
    out.m_72.y = _3067;
    out.m_72.z = _3069;
    int _3083 = ~_2891;
    int _3085 = _3083 + 1;
    int _3087 = _3081 >> 2;
    float _3089 = _2931 * _2967;
    bool _3091 = !_1908;
    float _3093 = _3091 ? _177 : as_type<float>(_3073);
    int _3095 = _3085 * int(_3055);
    int _3097 = _3095 + _2993;
    int _3099 = _3087 << 4;
    int _3101 = _3099 + 368;
    float _3103 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3105 = _3045 & 3;
    bool _3107 = _3105 != 0;
    float _3109 = -_3023;
    float _3111 = _3089 * _3109;
    float _3113 = float(uint(_3097));
    float _3115 = fma(_3103, _3025, _3047);
    uint _3117 = uint(int(uint(_3101) >> uint(2)));
    uint _3119 = uint(int(uint(int(_3117)) >> uint(2)));
    int _3121 = int(_3117) & 3;
    float _3123 = (*spvDescriptorSet0.vp_c9)._m0[int(_3119)][_3121];
    int _3125 = int(_3117) + 1;
    uint _3127 = uint(int(uint(_3125) >> uint(2)));
    int _3129 = _3125 & 3;
    float _3131 = (*spvDescriptorSet0.vp_c9)._m0[int(_3127)][_3129];
    int _3133 = _3061 * int(_3079);
    int _3135 = _3133 + _3003;
    float _3137 = _2931 * _2935;
    int _3139 = _3045 & 3;
    bool _3141 = _3139 != 0;
    float _3143 = as_type<float>(_3027) * _3113;
    float _3145 = fma(_2967, _2901, _3111);
    float _3147 = float(uint(_3135));
    float _3149 = -_3037;
    float _3151 = _3089 * _3149;
    bool _3153 = uint(_3139) > 1u;
    float _3155 = trunc(_3143);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    bool _3161 = _3139 != 3;
    float _3163 = as_type<float>(_3049) * _3147;
    float _3165 = _2931 * _2943;
    float _3167 = -_3041;
    float _3169 = _3089 * _3167;
    float _3171 = fma(_2967, _2935, _3151);
    int _3173 = _3107 ? 0 : 1;
    float _3175 = fma(_2967, _2943, _3169);
    float _3177 = fma(_3103, _3067, _3137);
    float _3179 = trunc(_3163);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    int _3185 = _3101 + 8;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    uint _3189 = uint(int(uint(int(_3187)) >> uint(2)));
    int _3191 = int(_3187) & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    int _3195 = int(_3187) + 1;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    int _3199 = _3195 & 3;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[int(_3197)][_3199];
    int _3203 = ~_3173;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    float _3209 = fma(_3103, _3069, _3165);
    int _3211 = _3207;
    if (!_3153)
    {
        int _3213 = ~_3173;
        int _3215 = _3213 + 1;
        _3211 = _3215;
    }
    int _3217 = _3211;
    out.m_74.x = _3145;
    out.m_74.y = _3171;
    out.m_74.z = _3175;
    int _3219 = ~_2891;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3139) >= 2u;
    bool _3225 = _3139 != 3;
    int _3227 = ~_2957;
    int _3229 = _3227 + 1;
    int _3231 = int(_3055) + int(_3159);
    bool _3233 = !_3141;
    int _3235 = _3233 ? 0 : 1;
    int _3237 = int(_3079) + int(_3183);
    int _3239 = _3221 * _3231;
    int _3241 = _3239 + _2993;
    int _3243 = abs(_3235);
    float _3245 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3247 = abs(_3217);
    int _3249 = _3229 * _3237;
    int _3251 = _3249 + _3003;
    float _3253 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3245);
    int _3255 = ~_3247;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3241) >= uint(_2891);
    float _3263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3265 = _3223 ? 0 : 1;
    int _3267 = _3259 * as_type<int>(_3131);
    bool _3269 = uint(_3251) >= uint(_2957);
    float _3271 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3253);
    int _3273 = ~_3243;
    int _3275 = _3273 + 1;
    int _3277 = _3275 + 1;
    bool _3279 = !_3261;
    int _3281 = _3279 ? 0 : (-1);
    float _3283 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3271);
    int _3285 = _2993 ^ _2891;
    int _3287 = _3277 * as_type<int>(_3123);
    int _3289 = _3287 + _3267;
    int _3291 = ~_3265;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3299 = !_3269;
    int _3301 = _3299 ? 0 : (-1);
    float _3303 = _1816 * _2569;
    int _3305 = _3295;
    float _3307 = _3283;
    if (_3161)
    {
        int _3309 = ~_3265;
        int _3311 = _3309 + 1;
        _3305 = _3311;
    }
    int _3313 = _3305;
    float _3315 = _3037 + _3177;
    int _3317 = ~_3231;
    int _3319 = _3317 + _3281;
    int _3321 = _3319 + 1;
    bool _3323 = !_3225;
    int _3325 = _3323 ? 0 : (-1);
    uint _3327 = uint(int(uint(_3285) >> uint(31)));
    int _3329 = _2891 * _3321;
    int _3331 = _3329 + _2993;
    int _3333 = ~_3301;
    int _3335 = _3237 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = abs(_3313);
    int _3341 = abs(_3325);
    int _3343 = ~int(_3327);
    int _3345 = _3343 + 1;
    bool _3347 = !_1914;
    int _3349 = _3347 ? 0 : 1;
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = _3337 ^ _3345;
    int _3359 = abs(_3349);
    int _3361 = _3355 * as_type<int>(_3193);
    int _3363 = _3361 + _3289;
    bool _3365 = _2891 == 0;
    int _3367 = ~_3341;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    bool _3373 = _2891 == 0;
    int _3375 = ~_3345;
    int _3377 = _3375 + _3357;
    int _3379 = _3377 + 1;
    int _3381 = _3371 * as_type<int>(_3201);
    int _3383 = _3381 + _3363;
    bool _3385 = !_3365;
    int _3387 = _3385 ? _3331 : (-1);
    bool _3389 = !_3373;
    int _3391 = _3389 ? _3379 : (-1);
    float _3393 = float(_3387);
    float _3395 = _3263 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3397 = ~_3359;
    int _3399 = _3397 + 1;
    int _3401 = _3399 + 1;
    float _3403 = float(_3391);
    float _3405 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3407 = fma(_3395, _3393, _931);
    int _3409 = _3383 * _3401;
    float _3411 = _3093 + 0.5;
    float _3413 = -_917;
    float _3415 = fma(_3405, _3403, _3413);
    float _3417 = _1017 + (-0.5);
    int _3419 = _2831 * _3359;
    int _3421 = _3419 + _3409;
    float _3423 = _3283 + _1723;
    float _3425 = fma(_3395, _3411, _3407);
    float _3427 = -_3405;
    float _3429 = fma(_3427, _3417, _3415);
    float _3431 = -_921;
    float _3433 = _3431 + 1.0;
    float _3435 = float(_3421);
    float _3437 = -_815;
    float _3439 = _3437 + 1.0;
    float _3441 = fma(_1017, _1894, _3429);
    float _3443 = _1806 * _2569;
    float _3445 = _3423 * 0.5;
    out.m_76.x = _3435;
    float _3447 = _3023 + _3115;
    float _3449 = _3041 + _3209;
    float _3451 = fma(_1812, _3443, _1800);
    float _3453 = fma(_1814, _3443, _1802);
    float _3455 = _1806 * _2593;
    out.m_78.z = _3445;
    out.m_78.w = _1723;
    float _3457 = fma(_1806, _3303, _1804);
    bool _3459 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3461 = isnan(_1499);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3467 = _3463 || _3465;
    float _3469 = -_893;
    float _3471 = _3469 + 1.0;
    out.m_80.x = _3447;
    out.m_80.y = _3315;
    out.m_80.z = _3449;
    float _3473 = -_3433;
    float _3475 = fma(_2365, _3473, _2397);
    float _3477 = -_3439;
    float _3479 = fma(_3093, _3477, _3425);
    float _3481 = fma(_1904, _3471, _2409);
    out.m_82.x = _3451;
    out.m_82.y = _3453;
    out.m_82.z = _3457;
    out.m_82.w = _3455;
    out.m_84.x = _3475;
    out.m_84.y = _3481;
    out.m_84.z = _3479;
    out.m_84.w = _3441;
    float _3483 = _3443;
    float _3485 = _3475;
    float _3487 = _1765;
    if (!_3467)
    {
        _3483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3489 = _3483;
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _3283;
    out.gl_Position.w = _1723;
    float _3491 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3493 = _3489;
    float _3495 = _3489;
    if (!_3467)
    {
        _3485 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    float _3501 = _3497;
    if (!_3467)
    {
        _1854 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3503 = _1854;
    float _3505 = _3503;
    float _3507 = _3503;
    if (!_3467)
    {
        _3307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3509 = _3307;
    float _3511 = _3509;
    float _3513 = _3509;
    if (!_3467)
    {
        _1856 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3515 = _1856;
    float _3517 = _3515;
    float _3519 = _3515;
    if (!_3467)
    {
        _3487 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3521 = _3487;
    bool _3523 = !_3467;
    float _3525 = _3521;
    float _3527 = _3521;
    if (!_3523)
    {
        bool _3529 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3531 = isnan(_1499);
        bool _3533 = _3529 || _3531;
        bool _3535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3537 = _3533 || _3535;
        if (!_3537)
        {
            float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3541 = _1499 + _3539;
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3543;
            float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3551 = 1.0 / _3545;
            float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3569 = _3541 * _3551;
            float _3571 = precise::clamp(_3569, 0.0, 1.0);
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3577 = fma(_3571, _3549, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3579 = fma(_3571, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3581 = fma(_3571, _3555, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3583 = fma(_3571, _3559, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3585 = fma(_3571, _3563, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3587 = fma(_3571, _3567, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3507 = _3581;
            _3527 = _3585;
            _3501 = _3577;
            _3519 = _3583;
            _3513 = _3579;
            _3495 = _3587;
            _3589 = true;
        }
        else
        {
            bool _3591 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3593 = isnan(_1499);
            bool _3595 = _3591 || _3593;
            bool _3597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3599 = _3595 || _3597;
            if (!_3599)
            {
                _3499 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3601 = _3499;
            _3501 = _3601;
            if (!_3599)
            {
                _3505 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3603 = _3505;
            _3507 = _3603;
            if (!_3599)
            {
                _3511 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3605 = _3511;
            _3513 = _3605;
            if (!_3599)
            {
                _3517 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3607 = _3517;
            _3519 = _3607;
            if (!_3599)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3609 = _3525;
            _3527 = _3609;
            if (!_3599)
            {
                _3493 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3611 = _3493;
            bool _3613 = !_3599;
            _3495 = _3611;
            if (!_3613)
            {
                bool _3615 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3617 = isnan(_1499);
                bool _3619 = _3615 || _3617;
                bool _3621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3623 = _3619 || _3621;
                if (!_3623)
                {
                    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3627 = _1499 + _3625;
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3631 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3629;
                    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3635 = _3633 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3637 = 1.0 / _3631;
                    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3655 = _3627 * _3637;
                    float _3657 = precise::clamp(_3655, 0.0, 1.0);
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3663 = fma(_3657, _3635, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3665 = fma(_3657, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3667 = fma(_3657, _3641, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3669 = fma(_3657, _3645, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3671 = fma(_3657, _3649, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3673 = fma(_3657, _3653, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3507 = _3667;
                    _3527 = _3671;
                    _3501 = _3663;
                    _3519 = _3669;
                    _3513 = _3665;
                    _3495 = _3673;
                    _3589 = true;
                }
                else
                {
                    _3507 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3501 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3519 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3513 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3495 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3589 = false;
    float _3675 = _3507;
    float _3677 = _3527;
    float _3679 = _3501;
    float _3681 = _3519;
    float _3683 = _3513;
    float _3685 = _3495;
    float _3687 = fma(_3315, -0.5, 0.5);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -_3675;
    float _3693 = _3691 + _3677;
    float _3695 = _3491 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3697 = -_3679;
    float _3699 = _3697 + _3681;
    float _3701 = fma(_3689, _3693, _3675);
    out.m_86.x = 0.0;
    float _3703 = -_3683;
    float _3705 = _3703 + _3685;
    float _3707 = fma(_3689, _3699, _3679);
    float _3709 = _3701 * 0.586610972881317138671875;
    out.m_47.x = _3695;
    bool _3711 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3713 = fma(_3689, _3705, _3683);
    float _3715 = fma(_3707, 0.298911988735198974609375, _3709);
    bool _3717 = _1475 > 0.0;
    bool _3719 = isnan(_1475);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(0.0);
    bool _3725 = _3721 || _3723;
    float _3727 = fma(_3713, 0.114477999508380889892578125, _3715);
    float _3729 = -_3727;
    float _3731 = _3707 + _3729;
    float _3733 = -_3727;
    float _3735 = _3701 + _3733;
    float _3737 = -_3727;
    float _3739 = _3713 + _3737;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3743 = fma(_3735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3745 = fma(_3739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    bool _3747 = !_3711;
    if (!_3747)
    {
        float _3749 = -_1387;
        float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3753 = -_1389;
        float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3757 = -_1391;
        float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3761 = _3751 * _3751;
        float _3763 = fma(_3755, _3755, _3761);
        float _3765 = fma(_3759, _3759, _3763);
        float _3767 = sqrt(_3765);
        float _3769 = rsqrt(_3765);
        float _3771 = -_3767;
        float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3775 = _3773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3777 = precise::clamp(_3775, 0.0, 1.0);
        float _3779 = _3755 * _3769;
        float _3781 = _3751 * _3769;
        float _3783 = abs(_3777);
        float _3785 = log2(_3783);
        float _3787 = _3759 * _3769;
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3791 = _3315 * _3781;
        float _3793 = -_3781;
        float _3795 = -_3789;
        float _3797 = fma(_3793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3795);
        float _3799 = fma(_3447, _3779, _3791);
        float _3801 = -_3787;
        float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3797);
        float _3805 = fma(_3449, _3787, _3799);
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3811 = _3803 + _3809;
        float _3813 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3815 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3817 = precise::clamp(_3815, 0.0, 1.0);
        float _3819 = exp2(_3813);
        float _3821 = _3819 * _3817;
        float _3823 = _3807 * _3821;
        float _3825 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3827 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3829 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3825;
        out.m_86.y = _3827;
        out.m_86.z = _3829;
    }
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    if (_3725)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3831;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3589 = false;
    bool _411 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3888 = as_type<float>(_123);
        out.gl_Position.z = _3888;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_161);
        out.gl_Position.z = _3958;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = _211 + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = _211 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = in.m_56.x;
    float _235 = in.m_56.y;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _223;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _227;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _211 + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _263;
    float _267 = fma(_265, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = _261 * _253;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    bool _275 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_211);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_273, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _289 = -_285;
    float _291 = _289 + 1.0;
    float _293 = _219 * _255;
    float _295 = -_247;
    float _297 = _295 + 1.0;
    bool _299 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_211);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _285 * _297;
    bool _313 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_211);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = _309 * _291;
    float _327 = -_309;
    float _329 = _327 + 1.0;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = _323 * _329;
    float _341 = fma(_333, _269, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _345 = -_323;
    float _347 = _345 + 1.0;
    float _349 = _267 * _339;
    float _351 = _287 * _339;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _357;
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].x, _349);
    float _363 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _365 = fma(_355, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _367 = fma(_359, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _369 = fma(_341, _325, _361);
    float _371 = fma(_343, _325, _363);
    float _373 = fma(_365, _311, _369);
    float _375 = fma(_367, _311, _371);
    float _377 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _373);
    float _379 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _375);
    float _381 = _377 * _233;
    float _383 = _379 * _235;
    bool _385 = !_251;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _389 = _293;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _409;
    if (!_385)
    {
        float _393 = in.m_54.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_107);
        float _415 = 1.0 / _413;
        float _417 = _141 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = in.m_54.x;
    float _423 = in.m_54.y;
    float _425 = in.m_54.z;
    float _427 = in.m_54.w;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    float _433 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _435 = _383 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _437 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _439 = int(_437);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _445 = float(_107);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _449 = 1.0 / _445;
    float _451 = float(_431);
    float _453 = _421 * 2.0;
    bool _455 = _423 > 0.5;
    float _457 = _425 * 2.0;
    bool _459 = _425 > 0.5;
    float _461 = _421 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _463 = -_177;
    int _465 = _455 ? as_type<int>(_463) : as_type<int>(_177);
    float _467 = floor(_453);
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _479 = _477 != 0;
    float _481 = -_441;
    float _483 = fma(_461, 2.0, _481);
    float _485 = -_181;
    int _487 = _459 ? as_type<int>(_485) : as_type<int>(_181);
    float _489 = _423 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _491 = int(_459);
    int _493 = _455 ? 2 : 0;
    int _495 = _491 | _493;
    int _497 = _165 ? 4 : 0;
    int _499 = _495 | _497;
    int _501 = _471 ? 8 : 0;
    int _503 = _499 | _501;
    int _505 = _475 ? 16 : 0;
    int _507 = _503 | _505;
    int _509 = _479 ? 32 : 0;
    int _511 = _507 | _509;
    int _513 = false ? 64 : 0;
    int _515 = _511 | _513;
    int _517 = _515 & 2;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _521 = !_475;
    float _523 = _521 ? _177 : as_type<float>(_465);
    float _525 = floor(_457);
    bool _527 = !_479;
    float _529 = _527 ? _181 : as_type<float>(_487);
    float _531 = fma(_489, -2.0, _443);
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _543 = _541 != 0;
    float _545 = -_141;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _531);
    int _555 = int(_459);
    int _557 = _551 ? 2 : 0;
    int _559 = _555 | _557;
    int _561 = _165 ? 4 : 0;
    int _563 = _559 | _561;
    int _565 = _471 ? 8 : 0;
    int _567 = _563 | _565;
    int _569 = _535 ? 16 : 0;
    int _571 = _567 | _569;
    int _573 = _539 ? 32 : 0;
    int _575 = _571 | _573;
    int _577 = _543 ? 64 : 0;
    int _579 = _575 | _577;
    int _581 = _579 & 1;
    float _583 = 1.0 / _451;
    float _585 = _423 * 2.0;
    bool _587 = _467 >= 0.0;
    bool _589 = isnan(_467);
    bool _591 = _587 || _589;
    bool _593 = isnan(0.0);
    bool _595 = _591 || _593;
    bool _597 = !_539;
    int _599 = _597 ? 0 : 1;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _603 = _601 != 0;
    float _605 = floor(_585);
    float _607 = _595 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _609 = _467 > 0.0;
    int _611 = ~as_type<int>(_607);
    int _613 = _611 + 1;
    int _615 = _613 + 1;
    bool _617 = !_535;
    int _619 = _617 ? 0 : 1;
    float _621 = _583 * _141;
    bool _623 = !_543;
    int _625 = _623 ? 0 : 1;
    float _627 = float(_439);
    int _629 = as_type<int>(_467);
    int _631 = _615;
    float _633 = _607;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_603)
    {
        _629 = 0;
    }
    int _637 = _629;
    int _639 = _637;
    if (!_603)
    {
        _639 = 1;
    }
    int _641 = _639;
    float _643 = 1.0 / _627;
    int _645 = _641;
    if (!_609)
    {
        int _647 = ~as_type<int>(_607);
        int _649 = _647 + 1;
        _631 = _649;
    }
    int _651 = _631;
    bool _653 = _605 > 0.0;
    bool _655 = _641 != 1;
    if (_603)
    {
        _645 = 0;
    }
    int _657 = _645;
    bool _659 = _605 >= 0.0;
    bool _661 = isnan(_605);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = _421 + (-0.5);
    int _671 = _657;
    if (!_603)
    {
        _671 = 2;
    }
    int _673 = _671;
    float _675 = _667 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _677 = _673 != 2;
    float _679 = _643 * _141;
    int _681 = ~as_type<int>(_675);
    int _683 = _681 + 1;
    int _685 = _683 + 1;
    int _687 = _685;
    float _689 = as_type<float>(_673);
    float _691 = _675;
    if (!_653)
    {
        int _693 = ~as_type<int>(_675);
        int _695 = _693 + 1;
        _687 = _695;
    }
    int _697 = _687;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    bool _711 = _525 >= 0.0;
    bool _713 = isnan(_525);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    if (!_655)
    {
        _689 = _423;
    }
    float _721 = _689;
    int _723 = _719 ? 0 : 1;
    bool _725 = _525 > 0.0;
    float _727 = _421 + _423;
    float _729 = _721;
    if (_677)
    {
        _691 = _421;
    }
    float _731 = _691;
    float _733 = _731;
    if (!_677)
    {
        _733 = _425;
    }
    float _735 = _733;
    float _737 = _727 + (-1.0);
    if (!_655)
    {
        _387 = _721;
    }
    float _739 = _387;
    float _741 = _739;
    if (_655)
    {
        _729 = _423;
    }
    float _743 = _729;
    float _745 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _747 = ~_723;
    int _749 = _747 + 1;
    int _751 = _749 + 1;
    float _753 = _735 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _757 = _751;
    float _759 = _743;
    if (!_725)
    {
        int _761 = ~_723;
        int _763 = _761 + 1;
        _757 = _763;
    }
    int _765 = _757;
    float _767 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _769 = log2(_767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_655)
    {
        _633 = _425;
    }
    float _773 = _633;
    bool _775 = !_701;
    int _777 = _775 ? 0 : 1;
    float _779 = -_771;
    float _781 = fma(_753, 2.0, _779);
    float _783 = _773;
    if (!_655)
    {
        _389 = _739;
    }
    float _785 = _389;
    float _787 = _785;
    if (_655)
    {
        _783 = _743;
    }
    float _789 = _783;
    if (_655)
    {
        _787 = _421;
    }
    float _791 = _787;
    if (_655)
    {
        _741 = _421;
    }
    float _793 = _741;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[83].w, _755);
    int _797 = abs(_777);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_655)
    {
        _391 = _425;
    }
    float _801 = _391;
    float _803 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[83].z, _447);
    float _805 = _801;
    if (_655)
    {
        _805 = _743;
    }
    float _807 = _805;
    float _809 = -_519;
    float _811 = fma(_799, 2.0, _809);
    if (!_677)
    {
        _759 = _421;
    }
    float _813 = _759;
    float _815 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _803);
    float _817 = _807 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _819 = _813 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _821 = float(_797);
    float _823 = _769 * _141;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _829 = float(_765);
    float _831 = exp2(_823);
    float _833 = fma(_817, -2.0, _825);
    float _835 = fma(_819, -2.0, _827);
    float _837 = in.m_58.x;
    float _839 = in.m_58.y;
    float _841 = in.m_58.z;
    float _843 = _821 * _829;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    bool _853 = !_705;
    int _855 = _853 ? 0 : 1;
    float _857 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _861 = -_831;
    float _863 = _861 + 1.0;
    bool _865 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(0.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = 1.0 / _851;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _879 = abs(_855);
    float _881 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[88].z, _859);
    bool _883 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _885 = isnan(1.0);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _891 = _887 || _889;
    float _893 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _857);
    float _895 = _873 ? _863 : 0.0;
    float _897 = _449 * _141;
    float _899 = -_141;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[86].x, _781);
    float _903 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[88].w, _877);
    float _905 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _907 = float(_651);
    float _909 = _843 * (-2.0);
    float _911 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _913 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[78].z, _845);
    float _915 = float(_879);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    float _919 = fma(_909, _837, _837);
    float _921 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _913);
    float _923 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _903);
    bool _925 = !_709;
    int _927 = _925 ? 0 : 1;
    float _929 = -_141;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _811);
    float _933 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _835);
    if (_891)
    {
        float _935 = _895 * _875;
        _143 = _935;
    }
    float _937 = _143;
    float _939 = fma(_745, _909, _745);
    float _941 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[196].x, _919);
    float _943 = _915 * _907;
    float _945 = _425 + _423;
    int _947 = abs(_927);
    float _949 = fma(_939, _937, _941);
    float _951 = _943 * (-2.0);
    float _953 = _945 + (-1.0);
    float _955 = float(_697);
    float _957 = _423 + (-0.5);
    float _959 = float(_947);
    float _961 = fma(_951, _839, _839);
    float _963 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _965 = _425 + _421;
    float _967 = _425 + (-0.5);
    float _969 = _959 * _955;
    float _971 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    float _973 = _965 + (-1.0);
    float _975 = _969 * (-2.0);
    float _977 = fma(_963, _951, _963);
    float _979 = _949 * 0.15915493667125701904296875;
    float _981 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _983 = fma(_975, _841, _841);
    float _985 = fma(_977, _937, _971);
    float _987 = _979 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = fma(_981, _975, _981);
    float _993 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].z, _983);
    float _995 = _985 * 0.15915493667125701904296875;
    float _997 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    bool _999 = _427 > 0.5;
    float _1001 = fma(_991, _937, _993);
    float _1003 = _979 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    float _1007 = -_181;
    int _1009 = _999 ? as_type<int>(_1007) : as_type<int>(_181);
    float _1011 = _1001 * 0.15915493667125701904296875;
    float _1013 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    bool _1015 = !_471;
    float _1017 = _1015 ? _181 : as_type<float>(_1009);
    float _1019 = _433 * _1013;
    float _1021 = _995 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = in.m_44.x;
    float _1027 = in.m_44.y;
    float _1029 = in.m_44.z;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1037 = _1035 != 0;
    int _1039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1041 = _1039 != 0;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1045 = _1043 != 0;
    bool _1047 = !_1037;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _995 * 6.283185482025146484375;
    float _1053 = cos(_1051);
    bool _1055 = !_1033;
    int _1057 = _1055 ? 0 : 1;
    bool _1059 = !_1041;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1071 = _1067 || _1069;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1011 * 6.283185482025146484375;
    float _1085 = cos(_1083);
    float _1087 = _989 * _1023;
    float _1089 = _1005 * _1023;
    bool _1091 = !_1045;
    int _1093 = _1091 ? 0 : 1;
    float _1095 = _1011 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = _989 * _1053;
    float _1101 = _1005 * _1053;
    float _1103 = _989 * _1085;
    float _1105 = _1053 * _1085;
    float _1107 = _1005 * _1085;
    float _1109 = _1023 * _1085;
    float _1111 = _435 * _997;
    float _1113 = fma(_1097, _1101, _1087);
    float _1115 = fma(_1097, _1087, _1101);
    float _1117 = _1107 * _1111;
    float _1119 = -_1089;
    float _1121 = fma(_1097, _1099, _1119);
    float _1123 = -_1111;
    float _1125 = _1097 * _1123;
    float _1127 = -_1099;
    float _1129 = fma(_1097, _1089, _1127);
    float _1131 = _1103 * _1111;
    float _1133 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1135 = fma(_1113, _1019, _1117);
    float _1137 = fma(_1105, _1019, _1125);
    float _1139 = fma(_1121, _1019, _1131);
    float _1141 = fma(_1129, _1133, _1135);
    float _1143 = fma(_1109, _1133, _1137);
    float _1145 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1147 = fma(_1115, _1133, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1151 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1153 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1145);
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1157 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1149);
    float _1159 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1151);
    float _1161 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1153);
    float _1163 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1155);
    float _1165 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1157);
    float _1167 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1159);
    float _1169 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1163);
    float _1173 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1175 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1177 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1179 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1181 = _1169 + _1173;
    float _1183 = fma(_1025, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1175);
    float _1185 = _1177 + _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1189 = _1181 + _1187;
    float _1191 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1183);
    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1195 = _1185 + _1193;
    float _1197 = _1189 * _1189;
    float _1199 = _1191 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1201 = fma(_1195, _1195, _1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1205 = sqrt(_1201);
    float _1207 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1203);
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1211 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1207);
    float _1213 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1209);
    float _1215 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1217 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1219 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1221 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1215);
    float _1223 = 1.0 / _1217;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1221);
    bool _1229 = _1205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1231 = _1225 + _1217;
    float _1233 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1235 = _1199 + _1233;
    float _1237 = _1231 * _1223;
    float _1239 = _1237 * 0.5;
    float _1241 = _1231;
    float _1243 = _1211;
    float _1245 = _1233;
    float _1247 = _1141;
    float _1249 = _1205;
    float _1251 = _1189;
    float _1253 = _1235;
    float _1255 = _1185;
    float _1257 = _979;
    if (!_1229)
    {
        _1241 = _1185;
    }
    float _1259 = _1241;
    float _1261 = _1259;
    if (!_1229)
    {
        _1243 = _1181;
    }
    float _1263 = _1243;
    float _1265 = _1263;
    if (!_1229)
    {
        _1245 = _1235;
    }
    float _1267 = _1245;
    bool _1269 = !_1229;
    float _1271 = _1267;
    if (!_1269)
    {
        float _1273 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1277 = _1205 + _1275;
        float _1279 = rsqrt(_1201);
        float _1281 = _1277 * _1273;
        float _1283 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = _1285 * 6.283185482025146484375;
        float _1289 = cos(_1287);
        float _1291 = _1285 * 6.283185482025146484375;
        float _1293 = sin(_1291);
        float _1295 = _1289 + (-1.0);
        float _1297 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = fma(_1293, _1283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1301 = fma(_1235, _1289, _1297);
        float _1303 = _1279 * _1299;
        float _1305 = fma(_1195, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1307 = fma(_1189, _1303, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1261 = _1305;
        _1265 = _1307;
        _1271 = _1301;
        _1247 = _1285;
        _1249 = _1299;
    }
    float _1309 = _1261;
    float _1311 = _1265;
    float _1313 = _1271;
    float _1315 = _1247;
    float _1317 = _1249;
    float _1319 = _1315;
    float _1321 = _1313;
    float _1323 = _1309;
    float _1325 = _1311;
    float _1327 = _1317;
    if (_1081)
    {
        _1251 = 1.0;
    }
    float _1329 = _1251;
    float _1331 = _1329;
    if (!_1071)
    {
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1335 = _1199 + _1333;
        float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1339 = _1177 + _1337;
        float _1341 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = -_1177;
        float _1345 = _1343 + _1309;
        float _1347 = _1335 * _1335;
        float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1351 = _1169 + _1349;
        float _1353 = -_1169;
        float _1355 = _1353 + _1311;
        float _1357 = -_1199;
        float _1359 = _1357 + _1313;
        float _1361 = fma(_1339, _1339, _1347);
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1365 = fma(_1351, _1351, _1361);
        float _1367 = sqrt(_1365);
        float _1369 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1371 = precise::min(_1367, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1373 = _1371 * _1363;
        float _1375 = _1369 * _1373;
        float _1377 = fma(_1345, _1375, _1177);
        float _1379 = fma(_1355, _1375, _1169);
        float _1381 = fma(_1359, _1375, _1199);
        _1319 = _1371;
        _1253 = _1345;
        _1321 = _1381;
        _1323 = _1377;
        _1325 = _1379;
        _1255 = _1341;
        _1327 = _1367;
    }
    float _1383 = _1319;
    float _1385 = _1253;
    float _1387 = _1321;
    float _1389 = _1323;
    float _1391 = _1325;
    float _1393 = _1255;
    float _1395 = _1327;
    float _1397 = _1393;
    float _1399 = _1383;
    float _1401 = _1395;
    float _1403 = _1385;
    if (!_1081)
    {
        float _1405 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1407 = _1405 * 0.15915493667125701904296875;
        float _1409 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1413 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
        float _1415 = _1407 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = _1409 * 0.15915493667125701904296875;
        float _1421 = _1407 * 6.283185482025146484375;
        float _1423 = sin(_1421);
        float _1425 = 1.0 / _1417;
        float _1427 = _1419 * 6.283185482025146484375;
        float _1429 = cos(_1427);
        float _1431 = _1423 * _1425;
        float _1433 = _1419 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1429 * _1431;
        float _1439 = 1.0 / _1413;
        float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1443 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1441;
        float _1445 = 1.0 / _1437;
        float _1447 = 1.0 / _1443;
        float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1451 = _1439 * _1449;
        float _1453 = _1435 * _1445;
        float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1457 = fma(_1453, _1451, _1455);
        float _1459 = _1457 * _1447;
        float _1461 = precise::clamp(_1459, 0.0, 1.0);
        float _1463 = -_1461;
        float _1465 = _1463 + 1.0;
        _1397 = _1419;
        _1399 = _1447;
        _1401 = _1413;
        _1403 = _1425;
        _1331 = _1465;
    }
    float _1467 = _1397;
    float _1469 = _1399;
    float _1471 = _1401;
    float _1473 = _1403;
    float _1475 = _1331;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1479 = _1387 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1389 + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1487 = _1391 + _1485;
    bool _1489 = _517 != 0;
    float _1491 = _1479 * _1479;
    float _1493 = fma(_1483, _1483, _1491);
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = rsqrt(_1495);
    float _1499 = sqrt(_1495);
    float _1501 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1503 = _1483 * _1501;
    float _1505 = _1487 * _1501;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1497;
    float _1523 = _1519;
    float _1525 = _1467;
    float _1527 = _1479;
    float _1529 = _1471;
    float _1531 = _1473;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    float _1537 = _1535;
    if (_1515)
    {
        float _1539 = _1519 * _1535;
        _1523 = _1539;
    }
    float _1541 = _1523;
    if (_1515)
    {
        float _1543 = rsqrt(_1511);
        _1537 = _1543;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    if (_1515)
    {
        float _1549 = _1541 * 0.15915493667125701904296875;
        _1525 = _1549;
    }
    float _1551 = _1525;
    float _1553 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1555 = _1487;
    if (_1515)
    {
        float _1557 = _1551 * 6.283185482025146484375;
        float _1559 = sin(_1557);
        _1555 = _1559;
    }
    float _1561 = _1555;
    float _1563 = precise::max(0.0, _1553);
    float _1565 = _1469;
    float _1567 = _1563;
    if (_1515)
    {
        float _1569 = _1551 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1565 = _1571;
    }
    float _1573 = _1565;
    float _1575 = -_1501;
    float _1577 = -_1563;
    float _1579 = fma(_1479, _1575, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1581;
    }
    float _1583 = _1527;
    float _1585 = _1561;
    float _1587 = _1583;
    if (_1515)
    {
        float _1589 = fma(_1561, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1529 = _1589;
    }
    float _1591 = _1529;
    float _1593 = _1591;
    if (!_1515)
    {
        _1585 = _1503;
    }
    float _1595 = _1585;
    float _1597 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1599 = _1595;
    if (!_1515)
    {
        _1587 = _1509;
    }
    float _1601 = _1587;
    float _1603 = _1601;
    if (_1515)
    {
        float _1605 = _1545 * _1591;
        _1257 = _1605;
    }
    float _1607 = _1257;
    if (!_1515)
    {
        _1547 = _1579;
    }
    float _1609 = _1547;
    float _1611 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = _1609;
    if (_1515)
    {
        float _1615 = _1573 + (-1.0);
        _1567 = _1615;
    }
    float _1617 = _1567;
    float _1619 = _1617;
    if (_1515)
    {
        float _1621 = _1503 * _1607;
        _1599 = _1621;
    }
    float _1623 = _1599;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1625 = _1593;
    float _1627 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1629 = _1625;
    if (_1515)
    {
        float _1631 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1531 = _1631;
    }
    float _1633 = _1531;
    if (!_1515)
    {
        _1619 = _1505;
    }
    float _1635 = _1619;
    float _1637 = _1635;
    if (_1515)
    {
        float _1639 = _1505 * _1607;
        _1637 = _1639;
    }
    float _1641 = _1637;
    if (_1515)
    {
        float _1643 = _1623 * _1623;
        _1629 = _1643;
    }
    float _1645 = _1629;
    if (_1515)
    {
        float _1647 = fma(_1579, _1573, _1633);
        _1613 = _1647;
    }
    float _1649 = _1613;
    if (_1515)
    {
        float _1651 = _1641 * _1641;
        _1603 = _1651;
    }
    float _1653 = _1603;
    float _1655 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1657 = fma(_1649, _1649, _1645);
    float _1659 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1661 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1627);
    float _1663 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1655);
    float _1665 = _1657 + _1653;
    float _1667 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1671 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1669);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1659);
    float _1677 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1679 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1667);
    float _1681 = rsqrt(_1665);
    float _1683 = _1661 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1685 = -_1673;
    float _1687 = _1685 + 1.0;
    float _1689 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1679);
    float _1691 = _1677 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1693 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1675);
    float _1695 = _1689 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1697 = abs(_1687);
    float _1699 = log2(_1697);
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1703 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1707 = -_1701;
    float _1709 = fma(_1707, _1597, 1.0);
    float _1711 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1705);
    float _1713 = _1681 * _1623;
    float _1715 = _1681 * _1649;
    float _1717 = _1681 * _1641;
    float _1719 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1709);
    float _1723 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1725 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1731 = -_1725;
    float _1733 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1731);
    float _1735 = 1.0 / _1723;
    float _1737 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1729);
    float _1739 = -_1717;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1733);
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1745 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1737);
    float _1747 = fma(_1741, -0.5, 0.5);
    float _1749 = exp2(_1727);
    float _1751 = fma(_1741, 0.5, 0.5);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1743);
    float _1755 = _1715 + 1.0;
    float _1757 = fma(_1751, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1759 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1753);
    float _1761 = sqrt(_1747);
    float _1763 = fma(_1751, _1757, -0.212114393711090087890625);
    float _1765 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1759);
    float _1767 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1745);
    float _1769 = fma(_1751, _1763, 1.570728778839111328125);
    float _1771 = _1765 * _1735;
    float _1773 = -_1715;
    float _1775 = fma(_1749, _1755, _1773);
    float _1777 = _1721 * 0.693147182464599609375;
    float _1779 = _1767 * _1735;
    float _1781 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1783 = fma(_1771, 0.5, 0.5);
    float _1785 = fma(_1779, -0.5, 0.5);
    float _1787 = _1761 * 0.636619746685028076171875;
    float _1789 = -_1769;
    float _1791 = fma(_1787, _1789, 1.0);
    float _1793 = fma(_1775, 0.5, 0.5);
    float3 _6492 = float3(_1783, _1785, _1781);
    float _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6492, float3(0.0), isnan(_6492)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6492, float3(0.0), isnan(_6492)), level(0.0)).x;
    float3 _6503 = float3(_1783, _1785, _1781);
    float4 _1798 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6503, float3(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6503, float3(0.0), isnan(_6503)), level(0.0)).xyzw;
    float _1800 = _1798.x;
    float _1802 = _1798.y;
    float _1804 = _1798.z;
    float _1806 = _1798.w;
    float2 _6520 = float2(_1791, _1793);
    float3 _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6520, float2(0.0), isnan(_6520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6520, float2(0.0), isnan(_6520)), level(0.0)).xyz;
    float _1812 = _1810.x;
    float _1814 = _1810.y;
    float _1816 = _1810.z;
    float _1818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1820 = int(_1818);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    out.m_60.y = _435;
    float _1826 = -_905;
    float _1828 = _1826 + 1.0;
    out.m_62.y = _1199;
    float _1830 = -_181;
    int _1832 = _1489 ? as_type<int>(_1830) : as_type<int>(_181);
    float _1834 = trunc(_621);
    int _1836 = int(_1834);
    float _1838 = -_923;
    float _1840 = _1838 + 1.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1844 = _1842 != 0;
    float _1846 = _1699 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1848 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1850 = _1848 != 0;
    float _1852 = _1781;
    float _1854 = _1723;
    float _1856 = _1767;
    if (_1824)
    {
        float _1858 = in.m_54.x;
        _1852 = _1858;
    }
    float _1860 = _1852;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1864 = _1862 != 0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1866;
    float _1870 = float(uint(_1820));
    float _1872 = _1860;
    if (!_1824)
    {
        float _1874 = in.m_54.y;
        _1872 = _1874;
    }
    float _1876 = _1872;
    int _1878 = ~_1820;
    int _1880 = _1878 + 1;
    float _1882 = 1.0 / _1868;
    int _1884 = ~_1820;
    int _1886 = _1884 + 1;
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1892 = -_911;
    float _1894 = _1892 + 1.0;
    float _1896 = float(uint(_1836));
    out.m_64.x = _1389;
    out.m_64.y = _1387;
    out.m_64.z = _1391;
    bool _1898 = _581 != 0;
    float _1900 = 1.0 / _1870;
    bool _1902 = !_1850;
    float _1904 = _1902 ? _181 : as_type<float>(_1832);
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1914 = _1912 != 0;
    float _1916 = 1.0 / _1890;
    bool _1918 = !_1844;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1926 = _1924 != 0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1930 = _419 + _1928;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1934 = _1932 != 0;
    float _1936 = as_type<float>(_1880);
    if (_1824)
    {
        _635 = 1.0;
    }
    float _1938 = _635;
    float _1940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1942 = as_type<int>(_1900) + (-2);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1946 = _419 + _1944;
    float _1948 = _1938;
    if (_1824)
    {
        _1936 = 1.0;
    }
    float _1950 = _1936;
    float _1952 = _1950;
    if (!_1824)
    {
        _1948 = 7.345489978790283203125;
    }
    float _1954 = _1948;
    float _1956 = as_type<float>(_1942) * _1896;
    if (!_1824)
    {
        _1952 = 1.2345600128173828125;
    }
    float _1958 = _1952;
    float _1960 = _1946 * _1916;
    float _1962 = float(_1820);
    float _1964 = trunc(_1956);
    float _1966 = precise::max(_1964, 0.0);
    uint _1969 = uint(_1966);
    float _1971 = _1954 * _421;
    float _1973 = floor(_1971);
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _1983 = abs(_1049);
    bool _1985 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1987 = isnan(_419);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    int _1997 = abs(_599);
    int _1999 = _1880 * int(_1969);
    int _2001 = _1999 + _1836;
    float _2003 = 1.0 / _1977;
    int _2005 = abs(_619);
    float _2007 = float(uint(_2001));
    float _2009 = -_1973;
    float _2011 = _1971 + _2009;
    float _2013 = 1.0 / _1981;
    float _2015 = as_type<float>(_1942) * _2007;
    float _2017 = trunc(_2015);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = _1930 * _2003;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _2027 = _419 + _2025;
    float _2029 = _2027 * _1882;
    float _2031 = _1876 * _1958;
    float _2033 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _2033;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _2037;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2043 = int(_2041);
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2049 = fma(_2035, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _2051 = fma(_2039, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _2053 = int(_1969) + int(_2021);
    float _2055 = floor(_2031);
    int _2057 = _1886 * _2053;
    int _2059 = _2057 + _1836;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2063 = exp2(_1846);
    bool _2065 = uint(_2059) >= uint(_1820);
    float _2067 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2075 = _2073 != 0;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _2081 = _419 + _2079;
    int _2083 = ~_2053;
    int _2085 = _2083 + _2071;
    int _2087 = _2085 + 1;
    float _2089 = -_2055;
    float _2091 = _2031 + _2089;
    float _2093 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2095 = _2081 * _2013;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _2097;
    int _2101 = _1820 * _2087;
    int _2103 = _2101 + _1836;
    float _2105 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _2107 = _2105 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    out.m_66.x = _2093;
    out.m_66.y = _2067;
    out.m_66.z = _1922;
    float _2109 = fma(_2099, _2023, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _2111 = !_1934;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = _1962 * _897;
    bool _2117 = _421 > 0.5;
    float _2119 = -_2063;
    float _2121 = _2119 + 1.0;
    int _2123 = abs(_2113);
    float _2125 = -_177;
    int _2127 = _2117 ? as_type<int>(_2125) : as_type<int>(_177);
    float _2129 = trunc(_2115);
    int _2131 = int(_2129);
    bool _2133 = _1820 == 0;
    float _2135 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2137 = float(_1836);
    float _2139 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _2141 = !_2133;
    int _2143 = _2141 ? _2103 : (-1);
    bool _2145 = _2137 >= _1962;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(_1962);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2161 = float(uint(_2043));
    float _2163 = fma(_2159, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _2165 = trunc(_2155);
    int _2167 = int(_2165);
    float _2169 = fma(_2047, _2095, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _2171 = _2091 * _1962;
    float _2173 = trunc(_2171);
    int _2175 = int(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _2179 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _2177;
    float _2181 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2181;
    int _2185 = ~_2167;
    int _2187 = _2185 + 1;
    int _2189 = _2187 + 1;
    float _2191 = 1.0 / _2161;
    int _2193 = _2143 * _2189;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _2195;
    int _2199 = _1820 + (-1);
    float _2201 = fma(_2197, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _2203 = fma(_2179, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    int _2205 = abs(_1057);
    int _2207 = _2167 * _2199;
    int _2209 = _2207 + _2193;
    float _2211 = fma(_2183, _2029, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2213 = trunc(_679);
    int _2215 = int(_2213);
    int _2217 = abs(_1061);
    int _2219 = _2209 * _1983;
    int _2221 = _2175 * _2123;
    int _2223 = _2221 + _1836;
    bool _2225 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _2227 = isnan(_419);
    bool _2229 = _2225 || _2227;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _2233 = _2229 || _2231;
    float _2235 = float(_2233);
    int _2237 = _2131 * _2205;
    int _2239 = _2237 + _2219;
    bool _2241 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _2243 = isnan(_419);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _2249 = _2245 || _2247;
    float _2251 = float(_2249);
    float _2253 = -_2235;
    float _2255 = _2253 + 1.0;
    int _2257 = as_type<int>(_2191) + (-2);
    int _2259 = _2223 * _2217;
    int _2261 = _2259 + _2239;
    int _2263 = abs(_1093);
    float _2265 = _2251 * _2255;
    bool _2267 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _2269 = isnan(_419);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    float _2279 = -_2251;
    float _2281 = _2279 + 1.0;
    float _2283 = float(uint(_2215));
    float _2285 = _2277 * _2281;
    float _2287 = -_2277;
    float _2289 = _2287 + 1.0;
    int _2291 = _2175 * _2263;
    int _2293 = _2291 + _2261;
    bool _2295 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _2297 = isnan(_419);
    bool _2299 = _2295 || _2297;
    bool _2301 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _2303 = _2299 || _2301;
    float _2305 = float(_2303);
    float _2307 = as_type<float>(_2257) * _2283;
    float _2309 = _1995 * _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _2315 = float(uint(_2293));
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _2321 = float(_2043);
    float _2323 = trunc(_2307);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    int _2329 = ~_2043;
    int _2331 = _2329 + 1;
    float _2333 = as_type<float>(_1942) * _2315;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _2337 = _2335 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _2339 = _2011 * _2321;
    float _2341 = -_1995;
    float _2343 = _2341 + 1.0;
    float _2345 = fma(_2319, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _2347 = trunc(_2333);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    float _2353 = fma(_2313, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _2355 = fma(_2337, _1960, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    int _2357 = ~_1820;
    int _2359 = _2357 + 1;
    float _2361 = _2305 * _2343;
    bool _2363 = !_2075;
    float _2365 = _2363 ? _177 : as_type<float>(_2127);
    float _2367 = _2321 * _897;
    float _2369 = trunc(_2339);
    int _2371 = int(_2369);
    int _2373 = _2331 * int(_2327);
    int _2375 = _2373 + _2215;
    float _2377 = _2049 * _2361;
    float _2379 = _2051 * _2361;
    float _2381 = _2109 * _2361;
    float _2383 = float(uint(_2375));
    int _2385 = abs(_1920);
    float _2387 = _2365 + 0.5;
    int _2389 = _2359 * int(_2351);
    int _2391 = _2389 + _2293;
    float _2393 = as_type<float>(_2257) * _2383;
    float _2395 = _1904 + (-0.5);
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[80].x, _547);
    float _2399 = trunc(_2367);
    int _2401 = int(_2399);
    float _2403 = float(uint(_2391));
    float _2405 = -_2395;
    float _2407 = -_553;
    float _2409 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2407);
    int _2411 = _2371 * _2385;
    int _2413 = _2411 + _2215;
    float _2415 = -_2305;
    float _2417 = _2415 + 1.0;
    float _2419 = as_type<float>(_1942) * _2403;
    float _2421 = trunc(_2393);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].x, _2377);
    float _2429 = float(uint(_2413));
    float _2431 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].y, _2379);
    float _2433 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[107].z, _2381);
    float _2435 = fma(_2163, _2309, _2427);
    int _2437 = ~_2043;
    int _2439 = _2437 + 1;
    float _2441 = as_type<float>(_2257) * _2429;
    float _2443 = trunc(_2419);
    float _2445 = precise::max(_2443, 0.0);
    uint _2447 = uint(_2445);
    float _2449 = fma(_2139, _2309, _2433);
    float _2451 = fma(_2201, _2285, _2435);
    float _2453 = float(_2215);
    float _2455 = fma(_2211, _2285, _2449);
    int _2457 = ~_1820;
    int _2459 = _2457 + 1;
    float _2461 = fma(_2345, _2265, _2451);
    float _2463 = trunc(_2441);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    int _2469 = int(_2327) + int(_2425);
    float _2471 = fma(_2169, _2309, _2431);
    bool _2473 = _2453 >= _2321;
    bool _2475 = isnan(_2453);
    bool _2477 = _2473 || _2475;
    bool _2479 = isnan(_2321);
    bool _2481 = _2477 || _2479;
    float _2483 = float(_2481);
    float _2485 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].x, _2461);
    int _2487 = _2439 * _2469;
    int _2489 = _2487 + _2215;
    float _2491 = fma(_2203, _2285, _2471);
    int _2493 = ~_2043;
    int _2495 = _2493 + 1;
    float _2497 = trunc(_2483);
    int _2499 = int(_2497);
    int _2501 = int(_2351) + int(_2447);
    float _2503 = fma(_2353, _2265, _2491);
    bool _2505 = uint(_2489) >= uint(_2043);
    float _2507 = fma(_2355, _2265, _2455);
    float _2509 = float(uint(_2223));
    int _2511 = _2495 * int(_2467);
    int _2513 = _2511 + _2413;
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2521 = _523 + 0.5;
    float _2523 = as_type<float>(_1942) * _2509;
    int _2525 = ~_2469;
    int _2527 = _2525 + _2517;
    int _2529 = _2527 + 1;
    int _2531 = _2459 * _2501;
    int _2533 = _2531 + _2293;
    float _2535 = float(uint(_2513));
    float _2537 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].y, _2503);
    float _2539 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[111].z, _2507);
    int _2541 = _2043 * _2529;
    int _2543 = _2541 + _2215;
    bool _2545 = uint(_2533) >= uint(_1820);
    float _2547 = as_type<float>(_2257) * _2535;
    int _2549 = ~_2499;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    float _2555 = trunc(_2523);
    float _2557 = precise::max(_2555, 0.0);
    uint _2559 = uint(_2557);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : (-1);
    float _2565 = _2485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2567 = _2043 == 0;
    float _2569 = _2135 * _1795;
    int _2571 = _2043 + (-1);
    float _2573 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2575 = !_2567;
    int _2577 = _2575 ? _2543 : (-1);
    float _2579 = trunc(_2547);
    float _2581 = precise::max(_2579, 0.0);
    uint _2583 = uint(_2581);
    int _2585 = ~_2501;
    int _2587 = _2585 + _2563;
    int _2589 = _2587 + 1;
    float _2591 = -_2135;
    float _2593 = _2591 + 1.0;
    int _2595 = ~_1820;
    int _2597 = _2595 + 1;
    int _2599 = _2577 * _2553;
    float _2601 = fma(_2519, _2521, _901);
    int _2603 = ~_2043;
    int _2605 = _2603 + 1;
    int _2607 = _1820 * _2589;
    int _2609 = _2607 + _2293;
    bool _2611 = !_1864;
    int _2613 = _2611 ? 0 : 1;
    int _2615 = _2499 * _2571;
    int _2617 = _2615 + _2599;
    int _2619 = _2597 * int(_2559);
    int _2621 = _2619 + _2223;
    int _2623 = abs(_625);
    float _2625 = -_1828;
    float _2627 = fma(_523, _2625, _2601);
    int _2629 = ~_1820;
    int _2631 = _2629 + 1;
    int _2633 = _2617 * _1997;
    int _2635 = int(_2467) + int(_2583);
    float _2637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2639 = _2401 * _2005;
    int _2641 = _2639 + _2633;
    float _2643 = float(uint(_2621));
    int _2645 = _2605 * _2635;
    int _2647 = _2645 + _2413;
    int _2649 = abs(_2613);
    bool _2651 = !_2133;
    int _2653 = _2651 ? _2609 : (-1);
    float _2655 = as_type<float>(_1942) * _2643;
    bool _2657 = uint(_2647) >= uint(_2043);
    int _2659 = _2413 * _2623;
    int _2661 = _2659 + _2641;
    int _2663 = _2653 >> 31;
    float _2665 = _529 + (-0.5);
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    int _2671 = _2371 * _2649;
    int _2673 = _2671 + _2661;
    int _2675 = _2663 & 3;
    float _2677 = trunc(_2655);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    int _2683 = _2653 & 3;
    bool _2685 = _2683 != 0;
    float _2687 = _2637 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2689 = _2653 + _2675;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = -_2687;
    float _2697 = -_933;
    float _2699 = fma(_2695, _2665, _2697);
    int _2701 = _2653 & 3;
    bool _2703 = _2701 != 0;
    int _2705 = _2689 >> 2;
    float _2707 = fma(_529, _1840, _2699);
    float _2709 = float(uint(_2673));
    int _2711 = _2705 << 4;
    int _2713 = _2711 + 512;
    int _2715 = _2703 ? 0 : 1;
    float _2717 = as_type<float>(_2257) * _2709;
    bool _2719 = uint(_2683) > 1u;
    uint _2721 = uint(int(uint(_2713) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = ~_2715;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    out.m_68.x = _2627;
    out.m_68.y = _2707;
    int _2743 = int(_2559) + int(_2681);
    float _2745 = trunc(_2717);
    float _2747 = precise::max(_2745, 0.0);
    uint _2749 = uint(_2747);
    int _2751 = ~_2043;
    int _2753 = _2751 + 1;
    int _2755 = ~_2635;
    int _2757 = _2755 + _2669;
    int _2759 = _2757 + 1;
    int _2761 = _2713 + 8;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    uint _2765 = uint(int(uint(int(_2763)) >> uint(2)));
    int _2767 = int(_2763) & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    int _2771 = int(_2763) + 1;
    uint _2773 = uint(int(uint(_2771) >> uint(2)));
    int _2775 = _2771 & 3;
    float _2777 = (*spvDescriptorSet0.vp_c9)._m0[int(_2773)][_2775];
    int _2779 = _2631 * _2743;
    int _2781 = _2779 + _2223;
    float _2783 = _2537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2785 = _2741;
    if (!_2719)
    {
        int _2787 = ~_2715;
        int _2789 = _2787 + 1;
        _2785 = _2789;
    }
    int _2791 = _2785;
    float _2793 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2795 = uint(_2683) >= 2u;
    float _2797 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2799 = abs(_2791);
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2803 = _2795 ? 0 : 1;
    float _2805 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2807 = _2683 != 3;
    int _2809 = _2753 * int(_2749);
    int _2811 = _2809 + _2673;
    int _2813 = ~_2803;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    out.m_70.x = _2573;
    out.m_70.y = _2797;
    out.m_70.z = _2801;
    float _2819 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2821 = _2043 * _2759;
    int _2823 = _2821 + _2413;
    float _2825 = float(uint(_2811));
    float _2827 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2819);
    bool _2829 = !_2567;
    int _2831 = _2829 ? _2823 : (-1);
    int _2833 = _2817;
    if (_2807)
    {
        int _2835 = ~_2803;
        int _2837 = _2835 + 1;
        _2833 = _2837;
    }
    int _2839 = _2833;
    float _2841 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2843 = uint(_2781) >= uint(_1820);
    float _2845 = as_type<float>(_2257) * _2825;
    float _2847 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2849 = abs(_2693);
    float _2851 = -_1097;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2805);
    int _2855 = abs(_2839);
    float _2857 = -_1097;
    float _2859 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2847);
    float _2861 = trunc(_2845);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    int _2867 = ~_2849;
    int _2869 = _2867 + 1;
    int _2871 = _2869 + 1;
    float _2873 = -_1097;
    float _2875 = fma(_2873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2877 = ~_2799;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    bool _2883 = !_2843;
    int _2885 = _2883 ? 0 : (-1);
    bool _2887 = _2683 != 3;
    float _2889 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2891 = int(_2889);
    int _2893 = _2881 * as_type<int>(_2735);
    int _2895 = ~_2743;
    int _2897 = _2895 + _2885;
    int _2899 = _2897 + 1;
    float _2901 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2859);
    int _2903 = ~_2855;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    int _2909 = _2871 * as_type<int>(_2727);
    int _2911 = _2909 + _2893;
    bool _2913 = !_2887;
    int _2915 = _2913 ? 0 : (-1);
    int _2917 = _1820 * _2899;
    int _2919 = _2917 + _2223;
    bool _2921 = !_1926;
    int _2923 = _2921 ? 0 : 1;
    int _2925 = _2907 * as_type<int>(_2769);
    int _2927 = _2925 + _2911;
    int _2929 = abs(_2915);
    float _2931 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2933 = abs(_2923);
    float _2935 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2853);
    int _2937 = ~_2929;
    int _2939 = _2937 + 1;
    int _2941 = _2939 + 1;
    float _2943 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2875);
    int _2945 = int(_2749) + int(_2865);
    float _2947 = fma(_2931, _2931, 1.0);
    int _2949 = ~_2043;
    int _2951 = _2949 + 1;
    int _2953 = _2941 * as_type<int>(_2777);
    int _2955 = _2953 + _2927;
    int _2957 = abs(_2891);
    float _2959 = float(uint(_2891));
    int _2961 = _2951 * _2945;
    int _2963 = _2961 + _2673;
    float _2965 = float(uint(_2957));
    float _2967 = rsqrt(_2947);
    int _2969 = ~_2933;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    bool _2975 = uint(_2963) >= uint(_2043);
    float _2977 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2979 = !_2133;
    int _2981 = _2979 ? _2919 : (-1);
    int _2983 = _2955 * _2973;
    float _2985 = _1113 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2987 = 1.0 / _2959;
    float _2989 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2991 = _2981 * _2933;
    int _2993 = _2991 + _2983;
    float _2995 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2997 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2985);
    float _2999 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2977);
    float _3001 = _1129 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3003 = abs(_2993);
    float _3005 = 1.0 / _2965;
    bool _3007 = !_2975;
    int _3009 = _3007 ? 0 : (-1);
    float _3011 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2989);
    float _3013 = float(uint(_2993));
    float _3015 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2995);
    int _3017 = ~_2945;
    int _3019 = _3017 + _3009;
    int _3021 = _3019 + 1;
    float _3023 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3025 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2997);
    int _3027 = as_type<int>(_2987) + (-2);
    float _3029 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3001);
    int _3031 = _2043 * _3021;
    int _3033 = _3031 + _2673;
    float _3035 = float(uint(_3003));
    float _3037 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3015);
    float _3039 = as_type<float>(_3027) * _3013;
    float _3041 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3029);
    bool _3043 = !_2567;
    int _3045 = _3043 ? _3033 : (-1);
    float _3047 = _2931 * _2901;
    int _3049 = as_type<int>(_3005) + (-2);
    float _3051 = trunc(_3039);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    int _3057 = _3045 >> 31;
    int _3059 = ~_2957;
    int _3061 = _3059 + 1;
    float _3063 = as_type<float>(_3049) * _3035;
    int _3065 = _3057 & 3;
    float _3067 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2999);
    float _3069 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2827);
    float _3071 = -_177;
    int _3073 = _1898 ? as_type<int>(_3071) : as_type<int>(_177);
    float _3075 = trunc(_3063);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = _3045 + _3065;
    out.m_72.x = _3025;
    out.m_72.y = _3067;
    out.m_72.z = _3069;
    int _3083 = ~_2891;
    int _3085 = _3083 + 1;
    int _3087 = _3081 >> 2;
    float _3089 = _2931 * _2967;
    bool _3091 = !_1908;
    float _3093 = _3091 ? _177 : as_type<float>(_3073);
    int _3095 = _3085 * int(_3055);
    int _3097 = _3095 + _2993;
    int _3099 = _3087 << 4;
    int _3101 = _3099 + 368;
    float _3103 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3105 = _3045 & 3;
    bool _3107 = _3105 != 0;
    float _3109 = -_3023;
    float _3111 = _3089 * _3109;
    float _3113 = float(uint(_3097));
    float _3115 = fma(_3103, _3025, _3047);
    uint _3117 = uint(int(uint(_3101) >> uint(2)));
    uint _3119 = uint(int(uint(int(_3117)) >> uint(2)));
    int _3121 = int(_3117) & 3;
    float _3123 = (*spvDescriptorSet0.vp_c9)._m0[int(_3119)][_3121];
    int _3125 = int(_3117) + 1;
    uint _3127 = uint(int(uint(_3125) >> uint(2)));
    int _3129 = _3125 & 3;
    float _3131 = (*spvDescriptorSet0.vp_c9)._m0[int(_3127)][_3129];
    int _3133 = _3061 * int(_3079);
    int _3135 = _3133 + _3003;
    float _3137 = _2931 * _2935;
    int _3139 = _3045 & 3;
    bool _3141 = _3139 != 0;
    float _3143 = as_type<float>(_3027) * _3113;
    float _3145 = fma(_2967, _2901, _3111);
    float _3147 = float(uint(_3135));
    float _3149 = -_3037;
    float _3151 = _3089 * _3149;
    bool _3153 = uint(_3139) > 1u;
    float _3155 = trunc(_3143);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    bool _3161 = _3139 != 3;
    float _3163 = as_type<float>(_3049) * _3147;
    float _3165 = _2931 * _2943;
    float _3167 = -_3041;
    float _3169 = _3089 * _3167;
    float _3171 = fma(_2967, _2935, _3151);
    int _3173 = _3107 ? 0 : 1;
    float _3175 = fma(_2967, _2943, _3169);
    float _3177 = fma(_3103, _3067, _3137);
    float _3179 = trunc(_3163);
    float _3181 = precise::max(_3179, 0.0);
    uint _3183 = uint(_3181);
    int _3185 = _3101 + 8;
    uint _3187 = uint(int(uint(_3185) >> uint(2)));
    uint _3189 = uint(int(uint(int(_3187)) >> uint(2)));
    int _3191 = int(_3187) & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    int _3195 = int(_3187) + 1;
    uint _3197 = uint(int(uint(_3195) >> uint(2)));
    int _3199 = _3195 & 3;
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[int(_3197)][_3199];
    int _3203 = ~_3173;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    float _3209 = fma(_3103, _3069, _3165);
    int _3211 = _3207;
    if (!_3153)
    {
        int _3213 = ~_3173;
        int _3215 = _3213 + 1;
        _3211 = _3215;
    }
    int _3217 = _3211;
    out.m_74.x = _3145;
    out.m_74.y = _3171;
    out.m_74.z = _3175;
    int _3219 = ~_2891;
    int _3221 = _3219 + 1;
    bool _3223 = uint(_3139) >= 2u;
    bool _3225 = _3139 != 3;
    int _3227 = ~_2957;
    int _3229 = _3227 + 1;
    int _3231 = int(_3055) + int(_3159);
    bool _3233 = !_3141;
    int _3235 = _3233 ? 0 : 1;
    int _3237 = int(_3079) + int(_3183);
    int _3239 = _3221 * _3231;
    int _3241 = _3239 + _2993;
    int _3243 = abs(_3235);
    float _3245 = _1695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3247 = abs(_3217);
    int _3249 = _3229 * _3237;
    int _3251 = _3249 + _3003;
    float _3253 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3245);
    int _3255 = ~_3247;
    int _3257 = _3255 + 1;
    int _3259 = _3257 + 1;
    bool _3261 = uint(_3241) >= uint(_2891);
    float _3263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3265 = _3223 ? 0 : 1;
    int _3267 = _3259 * as_type<int>(_3131);
    bool _3269 = uint(_3251) >= uint(_2957);
    float _3271 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3253);
    int _3273 = ~_3243;
    int _3275 = _3273 + 1;
    int _3277 = _3275 + 1;
    bool _3279 = !_3261;
    int _3281 = _3279 ? 0 : (-1);
    float _3283 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3271);
    int _3285 = _2993 ^ _2891;
    int _3287 = _3277 * as_type<int>(_3123);
    int _3289 = _3287 + _3267;
    int _3291 = ~_3265;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3299 = !_3269;
    int _3301 = _3299 ? 0 : (-1);
    float _3303 = _1816 * _2569;
    int _3305 = _3295;
    float _3307 = _3283;
    if (_3161)
    {
        int _3309 = ~_3265;
        int _3311 = _3309 + 1;
        _3305 = _3311;
    }
    int _3313 = _3305;
    float _3315 = _3037 + _3177;
    int _3317 = ~_3231;
    int _3319 = _3317 + _3281;
    int _3321 = _3319 + 1;
    bool _3323 = !_3225;
    int _3325 = _3323 ? 0 : (-1);
    uint _3327 = uint(int(uint(_3285) >> uint(31)));
    int _3329 = _2891 * _3321;
    int _3331 = _3329 + _2993;
    int _3333 = ~_3301;
    int _3335 = _3237 + _3333;
    int _3337 = _3335 + 1;
    int _3339 = abs(_3313);
    int _3341 = abs(_3325);
    int _3343 = ~int(_3327);
    int _3345 = _3343 + 1;
    bool _3347 = !_1914;
    int _3349 = _3347 ? 0 : 1;
    int _3351 = ~_3339;
    int _3353 = _3351 + 1;
    int _3355 = _3353 + 1;
    int _3357 = _3337 ^ _3345;
    int _3359 = abs(_3349);
    int _3361 = _3355 * as_type<int>(_3193);
    int _3363 = _3361 + _3289;
    bool _3365 = _2891 == 0;
    int _3367 = ~_3341;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    bool _3373 = _2891 == 0;
    int _3375 = ~_3345;
    int _3377 = _3375 + _3357;
    int _3379 = _3377 + 1;
    int _3381 = _3371 * as_type<int>(_3201);
    int _3383 = _3381 + _3363;
    bool _3385 = !_3365;
    int _3387 = _3385 ? _3331 : (-1);
    bool _3389 = !_3373;
    int _3391 = _3389 ? _3379 : (-1);
    float _3393 = float(_3387);
    float _3395 = _3263 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3397 = ~_3359;
    int _3399 = _3397 + 1;
    int _3401 = _3399 + 1;
    float _3403 = float(_3391);
    float _3405 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3407 = fma(_3395, _3393, _931);
    int _3409 = _3383 * _3401;
    float _3411 = _3093 + 0.5;
    float _3413 = -_917;
    float _3415 = fma(_3405, _3403, _3413);
    float _3417 = _1017 + (-0.5);
    int _3419 = _2831 * _3359;
    int _3421 = _3419 + _3409;
    float _3423 = _3283 + _1723;
    float _3425 = fma(_3395, _3411, _3407);
    float _3427 = -_3405;
    float _3429 = fma(_3427, _3417, _3415);
    float _3431 = -_921;
    float _3433 = _3431 + 1.0;
    float _3435 = float(_3421);
    float _3437 = -_815;
    float _3439 = _3437 + 1.0;
    float _3441 = fma(_1017, _1894, _3429);
    float _3443 = _1806 * _2569;
    float _3445 = _3423 * 0.5;
    out.m_76.x = _3435;
    float _3447 = _3023 + _3115;
    float _3449 = _3041 + _3209;
    float _3451 = fma(_1812, _3443, _1800);
    float _3453 = fma(_1814, _3443, _1802);
    float _3455 = _1806 * _2593;
    out.m_78.z = _3445;
    out.m_78.w = _1723;
    float _3457 = fma(_1806, _3303, _1804);
    bool _3459 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3461 = isnan(_1499);
    bool _3463 = _3459 || _3461;
    bool _3465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3467 = _3463 || _3465;
    float _3469 = -_893;
    float _3471 = _3469 + 1.0;
    out.m_80.x = _3447;
    out.m_80.y = _3315;
    out.m_80.z = _3449;
    float _3473 = -_3433;
    float _3475 = fma(_2365, _3473, _2397);
    float _3477 = -_3439;
    float _3479 = fma(_3093, _3477, _3425);
    float _3481 = fma(_1904, _3471, _2409);
    out.m_82.x = _3451;
    out.m_82.y = _3453;
    out.m_82.z = _3457;
    out.m_82.w = _3455;
    out.m_84.x = _3475;
    out.m_84.y = _3481;
    out.m_84.z = _3479;
    out.m_84.w = _3441;
    float _3483 = _3443;
    float _3485 = _3475;
    float _3487 = _1765;
    if (!_3467)
    {
        _3483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3489 = _3483;
    out.gl_Position.x = _1765;
    out.gl_Position.y = _1767;
    out.gl_Position.z = _3283;
    out.gl_Position.w = _1723;
    float _3491 = _1475 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3493 = _3489;
    float _3495 = _3489;
    if (!_3467)
    {
        _3485 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3497 = _3485;
    float _3499 = _3497;
    float _3501 = _3497;
    if (!_3467)
    {
        _1854 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3503 = _1854;
    float _3505 = _3503;
    float _3507 = _3503;
    if (!_3467)
    {
        _3307 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3509 = _3307;
    float _3511 = _3509;
    float _3513 = _3509;
    if (!_3467)
    {
        _1856 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3515 = _1856;
    float _3517 = _3515;
    float _3519 = _3515;
    if (!_3467)
    {
        _3487 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3521 = _3487;
    bool _3523 = !_3467;
    float _3525 = _3521;
    float _3527 = _3521;
    if (!_3523)
    {
        bool _3529 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3531 = isnan(_1499);
        bool _3533 = _3529 || _3531;
        bool _3535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3537 = _3533 || _3535;
        if (!_3537)
        {
            float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3541 = _1499 + _3539;
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3543;
            float _3547 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3549 = _3547 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3551 = 1.0 / _3545;
            float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3557 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3559 = _3557 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3567 = _3565 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3569 = _3541 * _3551;
            float _3571 = precise::clamp(_3569, 0.0, 1.0);
            float _3573 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3575 = _3573 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3577 = fma(_3571, _3549, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3579 = fma(_3571, _3575, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3581 = fma(_3571, _3555, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3583 = fma(_3571, _3559, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3585 = fma(_3571, _3563, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3587 = fma(_3571, _3567, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3507 = _3581;
            _3527 = _3585;
            _3501 = _3577;
            _3519 = _3583;
            _3513 = _3579;
            _3495 = _3587;
            _3589 = true;
        }
        else
        {
            bool _3591 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3593 = isnan(_1499);
            bool _3595 = _3591 || _3593;
            bool _3597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3599 = _3595 || _3597;
            if (!_3599)
            {
                _3499 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3601 = _3499;
            _3501 = _3601;
            if (!_3599)
            {
                _3505 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3603 = _3505;
            _3507 = _3603;
            if (!_3599)
            {
                _3511 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3605 = _3511;
            _3513 = _3605;
            if (!_3599)
            {
                _3517 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3607 = _3517;
            _3519 = _3607;
            if (!_3599)
            {
                _3525 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3609 = _3525;
            _3527 = _3609;
            if (!_3599)
            {
                _3493 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3611 = _3493;
            bool _3613 = !_3599;
            _3495 = _3611;
            if (!_3613)
            {
                bool _3615 = _1499 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3617 = isnan(_1499);
                bool _3619 = _3615 || _3617;
                bool _3621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3623 = _3619 || _3621;
                if (!_3623)
                {
                    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3627 = _1499 + _3625;
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3631 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3629;
                    float _3633 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3635 = _3633 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3637 = 1.0 / _3631;
                    float _3639 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3641 = _3639 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3643 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3645 = _3643 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3647 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3649 = _3647 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3651 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3653 = _3651 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3655 = _3627 * _3637;
                    float _3657 = precise::clamp(_3655, 0.0, 1.0);
                    float _3659 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3661 = _3659 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3663 = fma(_3657, _3635, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3665 = fma(_3657, _3661, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3667 = fma(_3657, _3641, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3669 = fma(_3657, _3645, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3671 = fma(_3657, _3649, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3673 = fma(_3657, _3653, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3507 = _3667;
                    _3527 = _3671;
                    _3501 = _3663;
                    _3519 = _3669;
                    _3513 = _3665;
                    _3495 = _3673;
                    _3589 = true;
                }
                else
                {
                    _3507 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3527 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3501 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3519 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3513 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3495 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3589 = false;
    float _3675 = _3507;
    float _3677 = _3527;
    float _3679 = _3501;
    float _3681 = _3519;
    float _3683 = _3513;
    float _3685 = _3495;
    float _3687 = fma(_3315, -0.5, 0.5);
    float _3689 = precise::clamp(_3687, 0.0, 1.0);
    float _3691 = -_3675;
    float _3693 = _3691 + _3677;
    float _3695 = _3491 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3697 = -_3679;
    float _3699 = _3697 + _3681;
    float _3701 = fma(_3689, _3693, _3675);
    out.m_86.x = 0.0;
    float _3703 = -_3683;
    float _3705 = _3703 + _3685;
    float _3707 = fma(_3689, _3699, _3679);
    float _3709 = _3701 * 0.586610972881317138671875;
    out.m_47.x = _3695;
    bool _3711 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3713 = fma(_3689, _3705, _3683);
    float _3715 = fma(_3707, 0.298911988735198974609375, _3709);
    bool _3717 = _1475 > 0.0;
    bool _3719 = isnan(_1475);
    bool _3721 = _3717 || _3719;
    bool _3723 = isnan(0.0);
    bool _3725 = _3721 || _3723;
    float _3727 = fma(_3713, 0.114477999508380889892578125, _3715);
    float _3729 = -_3727;
    float _3731 = _3707 + _3729;
    float _3733 = -_3727;
    float _3735 = _3701 + _3733;
    float _3737 = -_3727;
    float _3739 = _3713 + _3737;
    float _3741 = fma(_3731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3743 = fma(_3735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    float _3745 = fma(_3739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3727);
    bool _3747 = !_3711;
    if (!_3747)
    {
        float _3749 = -_1387;
        float _3751 = _3749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3753 = -_1389;
        float _3755 = _3753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3757 = -_1391;
        float _3759 = _3757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3761 = _3751 * _3751;
        float _3763 = fma(_3755, _3755, _3761);
        float _3765 = fma(_3759, _3759, _3763);
        float _3767 = sqrt(_3765);
        float _3769 = rsqrt(_3765);
        float _3771 = -_3767;
        float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3775 = _3773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3777 = precise::clamp(_3775, 0.0, 1.0);
        float _3779 = _3755 * _3769;
        float _3781 = _3751 * _3769;
        float _3783 = abs(_3777);
        float _3785 = log2(_3783);
        float _3787 = _3759 * _3769;
        float _3789 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3791 = _3315 * _3781;
        float _3793 = -_3781;
        float _3795 = -_3789;
        float _3797 = fma(_3793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3795);
        float _3799 = fma(_3447, _3779, _3791);
        float _3801 = -_3787;
        float _3803 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3797);
        float _3805 = fma(_3449, _3787, _3799);
        float _3807 = precise::clamp(_3805, 0.0, 1.0);
        float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3811 = _3803 + _3809;
        float _3813 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3815 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3817 = precise::clamp(_3815, 0.0, 1.0);
        float _3819 = exp2(_3813);
        float _3821 = _3819 * _3817;
        float _3823 = _3807 * _3821;
        float _3825 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3827 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3829 = _3823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3825;
        out.m_86.y = _3827;
        out.m_86.z = _3829;
    }
    out.m_88.x = _3741;
    out.m_88.y = _3743;
    out.m_88.z = _3745;
    if (_3725)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3831;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

