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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _1601 = false;
    bool _509 = false;
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2793 = as_type<float>(_123);
        out.gl_Position.z = _2793;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_155)
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
        float _185 = in.m_58.x;
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
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_58.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_107);
        float _401 = 1.0 / _399;
        float _403 = _141 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    bool _407 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _409 = isnan(_405);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _425 = isnan(_405);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _405 + _439;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _421;
    float _451 = _433 * _445;
    float _453 = -_433;
    float _455 = _453 + 1.0;
    float _457 = _437 * _449;
    float _459 = fma(_457, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _461 = _459 * _451;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[116].x, _463);
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = in.m_60.x;
    float _483 = in.m_60.y;
    out.m_62.x = _473;
    out.m_62.y = _475;
    out.m_62.z = _477;
    out.m_62.w = _479;
    float _485 = _375 * _483;
    float _487 = _373 * _481;
    bool _489 = !_447;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_107);
        float _513 = 1.0 / _511;
        float _515 = _141 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = in.m_58.x;
    float _521 = in.m_58.y;
    float _523 = in.m_58.z;
    float _525 = in.m_58.w;
    float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _529 = log2(_527);
    float _531 = in.m_48.x;
    float _533 = in.m_48.y;
    float _535 = in.m_48.z;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _559 = _557 != 0;
    float _561 = in.m_66.x;
    float _563 = in.m_66.y;
    float _565 = in.m_66.z;
    float _567 = in.m_66.w;
    float _569 = in.m_68.x;
    float _571 = in.m_68.y;
    float _573 = in.m_68.z;
    float _575 = in.m_68.w;
    float _577 = _529 * _141;
    float _579 = _523 * 2.0;
    bool _581 = _525 > 0.5;
    float _583 = _519 * 2.0;
    float _585 = exp2(_577);
    bool _587 = _519 > 0.5;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _591 = _589 != 0;
    float _593 = _533 * _547;
    float _595 = -_177;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_177);
    bool _599 = _521 > 0.5;
    float _601 = floor(_579);
    float _603 = _533 * _563;
    float _605 = fma(_531, _545, _593);
    float _607 = -_181;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = _533 * _571;
    bool _613 = _523 > 0.5;
    float _615 = fma(_531, _561, _603);
    float _617 = floor(_583);
    float _619 = -_177;
    int _621 = _613 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = fma(_535, _565, _615);
    bool _625 = !_539;
    float _627 = _625 ? _177 : as_type<float>(_597);
    float _629 = fma(_531, _569, _611);
    bool _631 = !_543;
    float _633 = _631 ? _181 : as_type<float>(_609);
    float _635 = _521 * 2.0;
    float _637 = _593;
    float _639 = _545;
    float _641 = _603;
    if (!_591)
    {
        _637 = _521;
    }
    float _643 = _637;
    float _645 = -_585;
    float _647 = _645 + 1.0;
    float _649 = _643;
    if (!_591)
    {
        _639 = _523;
    }
    float _651 = _639;
    float _653 = fma(_535, _549, _605);
    float _655 = _651;
    if (!_591)
    {
        _641 = _523;
    }
    float _657 = _641;
    float _659 = fma(_535, _573, _629);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _675 = _657;
    if (_591)
    {
        _649 = _519;
    }
    float _677 = _649;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_591)
    {
        _655 = _521;
    }
    float _681 = _655;
    float _683 = _521 + _523;
    if (_591)
    {
        _675 = _521;
    }
    float _685 = _675;
    float _687 = _659 + _575;
    bool _689 = _601 >= 0.0;
    bool _691 = isnan(_601);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _701 = floor(_635);
    int _703 = _697 ? 0 : 1;
    bool _705 = _601 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _713 = 1.0 / _709;
    int _715 = ~_703;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    float _727 = _521 + _519;
    float _729 = fma(_673, -2.0, _721);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _733 = _719;
    if (!_705)
    {
        int _735 = ~_703;
        int _737 = _735 + 1;
        _733 = _737;
    }
    int _739 = _733;
    float _741 = _727 + (-1.0);
    bool _743 = _617 >= 0.0;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_731;
    float _757 = fma(_711, 2.0, _755);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _761 = _751 ? 0 : 1;
    float _763 = _725 * _713;
    bool _765 = _617 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _769 = _517 + _767;
    float _771 = _683 + (-1.0);
    int _773 = ~_761;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    float _785 = _653 + _551;
    int _787 = _777;
    if (!_765)
    {
        int _789 = ~_761;
        int _791 = _789 + 1;
        _787 = _791;
    }
    int _793 = _787;
    float _795 = _623 + _567;
    float _797 = -_141;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _757);
    bool _801 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _803 = isnan(_517);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _815 = _627 + 0.5;
    bool _817 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _819 = isnan(_517);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    bool _831 = _701 >= 0.0;
    bool _833 = isnan(_701);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = fma(_813, _815, _799);
    float _843 = -_811;
    float _845 = _843 + 1.0;
    float _847 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _633 + (-0.5);
    int _851 = _839 ? 0 : 1;
    float _853 = _827 * _845;
    float _855 = -_847;
    float _857 = -_829;
    float _859 = fma(_855, _849, _857);
    bool _861 = _701 > 0.0;
    float _863 = _779 * _853;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _869 = _677 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _871 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].z, _867);
    float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _881 = -_827;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_869, 2.0, _885);
    int _889 = ~_851;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_699, -2.0, _879);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[131].x, _863);
    float _899 = -_181;
    int _901 = _581 ? as_type<int>(_899) : as_type<int>(_181);
    float _903 = _865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _905 = !_555;
    float _907 = _905 ? _177 : as_type<float>(_621);
    float _909 = -_141;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _887);
    bool _913 = !_559;
    float _915 = _913 ? _181 : as_type<float>(_901);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    int _919 = _893;
    if (!_861)
    {
        int _921 = ~_851;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    float _927 = _907 + 0.5;
    float _929 = _877 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _931 = _915 + (-0.5);
    float _933 = fma(_903, _927, _911);
    float _935 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[132].x, _897);
    float _937 = -_929;
    float _939 = -_917;
    float _941 = fma(_937, _931, _939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _875);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _963 = 1.0 / _947;
    float _965 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    bool _967 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _961);
    bool _979 = !_663;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _985 = _975 ? _647 : 0.0;
    float _987 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _977);
    int _989 = abs(_981);
    float _991 = -_983;
    float _993 = _991 + 1.0;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _997 = _795 + _995;
    float _999 = -_987;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _783);
    float _1005 = float(_989);
    float _1007 = -_993;
    float _1009 = fma(_627, _1007, _841);
    float _1011 = fma(_633, _1001, _859);
    if (_957)
    {
        float _1013 = _985 * _963;
        _145 = _1013;
    }
    float _1015 = _145;
    bool _1017 = !_667;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _785 + _1021;
    float _1025 = float(_739);
    float _1027 = _997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1029 = -_959;
    float _1031 = _1029 + 1.0;
    int _1033 = abs(_1019);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1037 = _687 + _1035;
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1027);
    float _1041 = _1005 * _1025;
    float _1043 = -_1031;
    float _1045 = fma(_907, _1043, _933);
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1039);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1061 = _997 * _997;
    float _1063 = float(_1033);
    float _1065 = -_1003;
    float _1067 = _1065 + 1.0;
    float _1069 = float(_793);
    float _1071 = fma(_1023, _1023, _1061);
    bool _1073 = _1055 >= 0.0;
    float _1075 = _1041 * (-2.0);
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1063 * _1069;
    float _1081 = fma(_1037, _1037, _1071);
    float _1083 = fma(_915, _1067, _941);
    float _1085 = fma(_759, _1075, _759);
    float _1087 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1093 = rsqrt(_1081);
    float _1095 = _1079 * (-2.0);
    float _1097 = _1059;
    if (_1073)
    {
        _1097 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1099 = _1097;
    float _1101 = fma(_1075, _1047, _1047);
    float _1103 = _519 + (-0.5);
    out.m_72.x = _1087;
    out.m_72.y = _1089;
    out.m_72.z = _1077;
    out.m_72.w = _1091;
    float _1105 = fma(_871, _1095, _871);
    int _1107 = as_type<int>(_1099);
    if (_1073)
    {
        float _1109 = _1099 * 5.0;
        _1107 = as_type<int>(_1109);
    }
    int _1111 = _1107;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1101);
    bool _1115 = !_671;
    int _1117 = _1115 ? 0 : 1;
    out.m_74.x = _1009;
    out.m_74.y = _1011;
    out.m_74.z = _1045;
    out.m_74.w = _1083;
    float _1119 = fma(_1095, _1049, _1049);
    float _1121 = fma(_1085, _1015, _1113);
    float _1123 = _521 + (-0.5);
    if (_1073)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4385 = as_type<float>(_1111);
        out.gl_Position.z = _4385;
    }
    int _1125 = abs(_1117);
    if (_1073)
    {
        out.m_51.x = 0.0;
    }
    float _1127 = _997 * _1093;
    float _1129 = _1023 * _1093;
    float _1131 = _1127;
    if (_1073)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1133 = -_1127;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _1137 = _1037 * _1093;
    float _1139 = -_1129;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1135 + _1147;
    float _1151 = -_1137;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _687);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1141 + _1155;
    float _1159 = float(_1125);
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1153 + _1163;
    float _1167 = float(_925);
    float _1169 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    float _1171 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1161);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1177 = _1145 * _1145;
    float _1179 = fma(_1105, _1015, _1169);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1171);
    float _1183 = _523 + _519;
    float _1185 = _1159 * _1167;
    float _1187 = fma(_1175, _1175, _1177);
    float _1189 = -_1137;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1037);
    bool _1193 = _1181 >= 0.0;
    float _1195 = _1179 * 0.15915493667125701904296875;
    float _1197 = _1183 + (-1.0);
    float _1199 = _1185 * (-2.0);
    float _1201 = fma(_1191, _1191, _1187);
    float _1203 = _1195 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1209 = _523 + (-0.5);
    float _1211 = fma(_1199, _1051, _1051);
    float _1213 = _1121 * 0.15915493667125701904296875;
    float _1215 = fma(_1207, _1199, _1207);
    float _1217 = _1185;
    int _1219 = as_type<int>(_1209);
    float _1221 = _1157;
    if (_1193)
    {
        _1217 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1223 = _1217;
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1211);
    if (_1193)
    {
        out.m_51.x = 0.0;
    }
    if (_1193)
    {
        float _1229 = _1223 * 5.0;
        _1219 = as_type<int>(_1229);
    }
    int _1231 = _1219;
    float _1233 = fma(_1215, _1015, _1227);
    float _1235 = _1195 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1231);
        out.gl_Position.z = _4586;
    }
    float _1239 = _1213 * 6.283185482025146484375;
    float _1241 = sin(_1239);
    float _1243 = _1213 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1233 * 0.15915493667125701904296875;
    if (_1193)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1249 = _1247 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _1093 * _1225;
    float _1255 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1259 = _1241 * _1205;
    float _1261 = _1245 * _1237;
    float _1263 = _1253 * _1255;
    float _1265 = _1241 * _1237;
    float _1267 = _1247 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1245 * _1205;
    float _1273 = _1257 * _1263;
    float _1275 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1279 = _1253 * _1275;
    float _1281 = _1245 * _1251;
    float _1283 = _1237 * _1251;
    float _1285 = _1241 * _1251;
    float _1287 = _1205 * _1251;
    float _1289 = _1277 * _1279;
    float _1291 = _1281 * _1273;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1299 = fma(_1269, _1261, _1259);
    float _1301 = -_1265;
    float _1303 = fma(_1269, _1271, _1301);
    float _1305 = -_1273;
    float _1307 = _1269 * _1305;
    float _1309 = -_1271;
    float _1311 = fma(_1269, _1265, _1309);
    float _1313 = fma(_1299, _1289, _1291);
    float _1315 = _1285 * _1273;
    float _1317 = fma(_1283, _1289, _1307);
    float _1319 = fma(_1269, _1259, _1261);
    float _1321 = fma(_1303, _1295, _1313);
    float _1323 = fma(_1311, _1289, _1315);
    float _1325 = fma(_1287, _1295, _1317);
    float _1327 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1333 = fma(_1319, _1295, _1323);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1329);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1331);
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1339);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = _785 + _1353;
    float _1363 = _687 + _1355;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1327);
    float _1367 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1371 = _1361 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1375 = _1363 + _1373;
    float _1377 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1379 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1381 = _1371 * _1371;
    float _1383 = _1375 * _1375;
    float _1385 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1391 = _1381 + _1383;
    float _1393 = -_1269;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1397 = -_1269;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1297);
    float _1401 = -_1269;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1405 = sqrt(_1391);
    float _1407 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1409 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1367);
    float _1411 = _795 + _1377;
    float _1413 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1379);
    float _1415 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1385);
    float _1417 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1389);
    float _1419 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    bool _1421 = _1405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1389;
    float _1425 = _1361;
    float _1427 = _1387;
    float _1429 = _1363;
    float _1431 = _1381;
    float _1433 = _1409;
    if (!_1421)
    {
        _1423 = _1361;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (!_1421)
    {
        _1425 = _1363;
    }
    float _1439 = _1425;
    float _1441 = _1439;
    if (!_1421)
    {
        _1427 = _1383;
    }
    float _1443 = _1427;
    float _1445 = _1443;
    if (!_1421)
    {
        _1429 = _1411;
    }
    float _1447 = _1429;
    bool _1449 = !_1421;
    float _1451 = _1447;
    if (!_1449)
    {
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1457 = _1405 + _1455;
        float _1459 = rsqrt(_1391);
        float _1461 = _1457 * _1453;
        float _1463 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1465 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = fma(_1469, _1463, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1477 = _1459 * _1475;
        float _1479 = fma(_1371, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = _1473 + (-1.0);
        float _1483 = fma(_1375, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1487 = _1479 + _1485;
        float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1493 = _1483 + _1491;
        float _1495 = _1487 * _1487;
        float _1497 = fma(_1411, _1473, _1489);
        float _1499 = _1493 * _1493;
        _1451 = _1497;
        _1431 = _1495;
        _1445 = _1499;
        _1437 = _1479;
        _1441 = _1483;
    }
    float _1501 = _1451;
    float _1503 = _1431;
    float _1505 = _1445;
    float _1507 = _1437;
    float _1509 = _1441;
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1513 = _1501 + _1511;
    float _1515 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1395);
    float _1517 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1519 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1521 = fma(_1513, _1513, _1503);
    float _1523 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1525 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = _1519 * _1515;
    float _1529 = _1521 + _1505;
    float _1531 = _1519 * _1517;
    float _1533 = _1519 * _1523;
    float _1535 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1413);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1415);
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1417);
    float _1541 = sqrt(_1529);
    float _1543 = fma(_1525, _1407, _1527);
    float _1545 = fma(_1525, _1409, _1531);
    float _1547 = fma(_1525, _1419, _1533);
    float _1549 = _1535 + _1543;
    float _1551 = _1537 + _1545;
    float _1553 = _1539 + _1547;
    out.m_76.x = _1549;
    out.m_76.y = _1551;
    out.m_76.z = _1553;
    bool _1555 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1557 = isnan(_1541);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1563 = _1559 || _1561;
    float _1565 = _1509;
    if (!_1563)
    {
        _1433 = 1.0;
    }
    float _1567 = _1433;
    bool _1569 = !_1563;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1541);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1541 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1541);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1541 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1637 = _1507 + _1635;
    float _1639 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1641 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1643 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    float _1653 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1639);
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1657 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    bool _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.5);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1637, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1671 = 1.0 / _1655;
    float _1673 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1657);
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1677 = _1675 + _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1681 = _1509 + _1679;
    float _1683 = fma(_1681, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1685 = _1677 * _1671;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1691 = _1501 + _1689;
    float _1693 = -_1137;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1683);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1697);
    float _1701 = fma(_1691, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = -_1129;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1669);
    float _1707 = _1631;
    float _1709 = _1705;
    float _1711 = _1695;
    if (_1667)
    {
        _1707 = 1.0;
    }
    float _1713 = _1707;
    float _1715 = -_1127;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1719 = 1.0 / _1699;
    float _1721 = _1717;
    float _1723 = _1713;
    float _1725 = _1719;
    if (!_1651)
    {
        float _1727 = _1149 * _1149;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1731 = -_687;
        float _1733 = _1731 + _1683;
        float _1735 = -_795;
        float _1737 = _1735 + _1701;
        float _1739 = fma(_1157, _1157, _1727);
        float _1741 = fma(_1165, _1165, _1739);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1745 = sqrt(_1741);
        float _1747 = 1.0 / _1253;
        float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1729;
        float _1755 = _1753 * _1747;
        float _1757 = -_785;
        float _1759 = _1757 + _1669;
        float _1761 = _1749 * _1755;
        float _1763 = _1733 * _1755;
        float _1765 = fma(_1737, _1761, _1135);
        float _1767 = fma(_1759, _1761, _1141);
        float _1769 = fma(_1749, _1763, _1153);
        _1721 = _1765;
        _1709 = _1767;
        _1711 = _1769;
        _1131 = _1729;
        _1221 = _1745;
    }
    float _1771 = _1721;
    float _1773 = _1709;
    float _1775 = _1711;
    float _1777 = _1131;
    float _1779 = _1221;
    float _1781 = _1779;
    float _1783 = _1777;
    if (_1667)
    {
        _1781 = 1.0;
    }
    float _1785 = _1781;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1789 = _1719 * _1787;
    float _1791 = _1785;
    if (!_1667)
    {
        float _1793 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1795 = _1793 * 0.15915493667125701904296875;
        float _1797 = _1795 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1795 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = 1.0 / _1799;
        float _1811 = _1803 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = _1803 * 6.283185482025146484375;
        float _1819 = sin(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = 1.0 / _1821;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1827 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1825;
        float _1829 = 1.0 / _1827;
        float _1831 = _1819 * _1823;
        float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1835 = fma(_1789, _1831, _1833);
        float _1837 = _1835 * _1829;
        float _1839 = precise::clamp(_1837, 0.0, 1.0);
        _1783 = _1795;
        _1723 = _1839;
    }
    float _1841 = _1783;
    float _1843 = _1723;
    float _1845 = _1841;
    if (!_1667)
    {
        float _1847 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1849 = _1847 * 0.15915493667125701904296875;
        float _1851 = _1849 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1857 = _1855 * 0.15915493667125701904296875;
        float _1859 = _1849 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = 1.0 / _1853;
        float _1865 = _1857 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1861 * _1863;
        float _1871 = _1857 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = 1.0 / _1875;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = 1.0 / _1881;
        float _1885 = _1873 * _1877;
        float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1889 = fma(_1789, _1885, _1887);
        float _1891 = _1889 * _1883;
        float _1893 = precise::clamp(_1891, 0.0, 1.0);
        float _1895 = -_1893;
        float _1897 = _1895 + 1.0;
        _1845 = _1875;
        _1791 = _1897;
    }
    float _1899 = _1845;
    float _1901 = _1791;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1905 = _1771 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1909 = _1773 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1913 = _1775 + _1911;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1909, _1909, _1915);
    float _1919 = fma(_1913, _1913, _1917);
    float _1921 = rsqrt(_1919);
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1909 * _1923;
    float _1927 = _1913 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1129;
    float _1945 = _1921;
    float _1947 = _1941;
    float _1949 = _1905;
    if (_1937)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1951;
    }
    float _1953 = _1943;
    if (_1937)
    {
        float _1955 = rsqrt(_1933);
        _1945 = _1955;
    }
    float _1957 = _1945;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1937)
    {
        float _1963 = _1941 * _1953;
        _1947 = _1963;
    }
    float _1965 = _1947;
    if (_1937)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1725 = _1967;
    }
    float _1969 = _1725;
    float _1971 = _1913;
    if (_1937)
    {
        float _1973 = _1969 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1981 = precise::max(0.0, _1979);
    float _1983 = _1899;
    if (_1937)
    {
        float _1985 = _1969 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = -_1923;
    float _1993 = -_1981;
    float _1995 = fma(_1905, _1991, _1993);
    float _1997 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _1999 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1999;
    }
    float _2001 = _1949;
    float _2003 = sqrt(_1919);
    float _2005 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2007 = _1977;
    float _2009 = _2001;
    if (_1937)
    {
        float _2011 = fma(_1977, _2001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _2011;
    }
    float _2013 = _1959;
    float _2015 = _2013;
    if (!_1937)
    {
        _2007 = _1927;
    }
    float _2017 = _2007;
    float _2019 = _2017;
    float _2021 = _1989;
    if (_1937)
    {
        float _2023 = _1989 + (-1.0);
        _2009 = _2023;
    }
    float _2025 = _2009;
    float _2027 = _2025;
    if (_1937)
    {
        float _2029 = _1957 * _2013;
        _1565 = _2029;
    }
    float _2031 = _1565;
    if (!_1937)
    {
        _2015 = _1925;
    }
    float _2033 = _2015;
    float _2035 = floor(_2005);
    float _2037 = _2033;
    if (_1937)
    {
        float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2039;
    }
    float _2041 = _1997;
    if (_1937)
    {
        float _2043 = _1925 * _2031;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1937)
    {
        _1961 = _1995;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1937)
    {
        float _2051 = _1927 * _2031;
        _2019 = _2051;
    }
    float _2053 = _2019;
    if (!_1937)
    {
        _2027 = _1929;
    }
    float _2055 = _2027;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = fma(_1995, _1989, _2041);
        _2049 = _2059;
    }
    float _2061 = _2049;
    if (_1937)
    {
        float _2063 = _2045 * _2045;
        _2057 = _2063;
    }
    float _2065 = _2057;
    if (!_1937)
    {
        _2021 = _1931;
    }
    float _2067 = _2021;
    float _2069 = _2067;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2069 = _2071;
    }
    float _2073 = _2069;
    float _2075 = fma(_2061, _2061, _2065);
    float _2077 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2079 = _2075 + _2073;
    float _2081 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2077);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = rsqrt(_2079);
    float _2091 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2093 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2103 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2105 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = -_2035;
    float _2109 = _2005 + _2107;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2113 = abs(_2099);
    float _2115 = log2(_2113);
    float _2117 = -_2111;
    float _2119 = fma(_2117, _2095, 1.0);
    float _2121 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2123 = _2089 * _2045;
    float _2125 = _2089 * _2061;
    float _2127 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2121);
    float _2129 = _2089 * _2053;
    float _2131 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2103);
    float _2133 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2135 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2139 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2141 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2143 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = -_2137;
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2145);
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2157 = -_2129;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2147);
    float _2161 = floor(_2093);
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2167 = fma(_2159, 0.5, 0.5);
    float _2169 = fma(_2159, -0.5, 0.5);
    float _2171 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2163);
    float _2173 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2175 = fma(_2167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2177 = exp2(_2155);
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2171);
    float _2181 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2173);
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2165);
    float _2185 = fma(_2167, _2175, -0.212114393711090087890625);
    float _2187 = _2125 + 1.0;
    float _2189 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2181);
    float _2191 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2193 = log2(_2119);
    float _2195 = -_2161;
    float _2197 = _2093 + _2195;
    float _2199 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2191);
    float _2203 = fma(_2167, _2185, 1.570728778839111328125);
    float _2205 = 1.0 / _2179;
    float _2207 = -_2125;
    float _2209 = fma(_2177, _2187, _2207);
    float _2211 = sqrt(_2169);
    float _2213 = _2193 * 0.693147182464599609375;
    float2 _6185 = float2(_2109, _2197);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6185, float2(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6185, float2(0.0), isnan(_6185)), level(0.0)).x;
    float _2217 = fma(_2209, 0.5, 0.5);
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = _2199 * _2205;
    float _2223 = _2201 * _2205;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _6215 = float3(_2225, _2227, _2219);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float3 _6226 = float3(_2225, _2227, _2219);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2203;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _6247 = float2(_2246, _2217);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6247, float2(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6247, float2(0.0), isnan(_6247)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = abs(_1789);
    float _2260 = log2(_2258);
    float _2262 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2264 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2266 = isnan(_2003);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    float _2276 = in.m_78.x;
    float _2278 = _2179 * 0.5;
    bool _2280 = _1789 <= 8000.0;
    bool _2282 = isnan(_1789);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(8000.0);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2294 = _2199 + _2179;
    float _2296 = _2294 * 0.5;
    float _2298 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2300 = exp2(_2298);
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2308 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2310 = fma(_2304, -2.0, 3.0);
    float _2312 = _2304 * _2304;
    float _2314 = _2308 + _2179;
    float _2316 = exp2(_2306);
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2308;
    out.gl_Position.w = _2179;
    float _2318 = _2312 * _2310;
    float _2320 = _2314 * 0.5;
    float _2322 = -_2318;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2328 = fma(_2201, -0.5, _2278);
    float _2330 = _2290 * _2326;
    float _2332 = -_2316;
    float _2334 = _2332 + 1.0;
    out.m_80.x = _2296;
    out.m_80.y = _2328;
    out.m_80.z = _2320;
    out.m_80.w = _2179;
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = _1843 * _1901;
    float _2340 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2342 = _2179;
    float _2344 = _2308;
    float _2346 = _2201;
    float _2348 = _2338;
    if (!_2272)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2350 = _2342;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2272)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2272)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2346;
    float _2364 = -_2215;
    float _2366 = _2364 + 1.0;
    float _2368 = _2366 * _2336;
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = -_2370;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2376 = _2374 * _2276;
    float _2378 = _2340 * _2231;
    float _2380 = -_2340;
    float _2382 = _2380 + 1.0;
    float _2384 = _2242 * _2378;
    float _2386 = _2256 * _2378;
    float _2388 = fma(_2254, _2384, _2238);
    float _2390 = fma(_2252, _2384, _2236);
    float _2392 = _2376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2394 = _2242 * _2382;
    float _2396 = fma(_2242, _2386, _2240);
    float _2398 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2400 = _2376;
    float _2402 = _2236;
    float _2404 = _2362;
    float _2406 = _2362;
    if (!_2272)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2408 = _2400;
    out.m_82.x = _2392;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2272)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2272)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2348;
    out.m_84.x = _2390;
    out.m_84.y = _2388;
    out.m_84.z = _2396;
    out.m_84.w = _2394;
    bool _2422 = !_2272;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_2003);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _2003 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = 1.0 / _2444;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2468 = _2440 * _2450;
            float _2470 = precise::clamp(_2468, 0.0, 1.0);
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2476 = fma(_2470, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2412 = _2476;
            _2360 = _2482;
            _2354 = _2478;
            _2426 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_2003);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2410;
            _2412 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2352;
            _2354 = _2504;
            if (!_2498)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2358;
            _2360 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2424;
            bool _2512 = !_2498;
            _2426 = _2510;
            if (!_2512)
            {
                bool _2514 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_2003);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _2003 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = 1.0 / _2530;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2554 = _2526 * _2536;
                    float _2556 = precise::clamp(_2554, 0.0, 1.0);
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2562 = fma(_2556, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2564 = fma(_2556, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2556, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2556, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2556, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2412 = _2562;
                    _2360 = _2568;
                    _2354 = _2564;
                    _2426 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2412;
    float _2580 = _2360;
    float _2582 = _2354;
    float _2584 = _2426;
    float _2586 = fma(_1551, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2596 = -_2578;
    float _2598 = _2596 + _2580;
    out.m_86.x = 0.0;
    float _2600 = fma(_2588, _2592, _2574);
    float _2602 = fma(_2588, _2598, _2578);
    out.m_51.x = _2594;
    float _2604 = -_2582;
    float _2606 = _2604 + _2584;
    float _2608 = _2600 * 0.586610972881317138671875;
    bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = fma(_2588, _2606, _2582);
    float _2614 = fma(_2602, 0.298911988735198974609375, _2608);
    bool _2616 = _1843 > 0.0;
    bool _2618 = isnan(_1843);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    float _2626 = fma(_2612, 0.114477999508380889892578125, _2614);
    bool _2628 = _1901 <= 0.0;
    bool _2630 = !_2624;
    bool _2632 = _2628 || _2630;
    float _2634 = -_2626;
    float _2636 = _2602 + _2634;
    float _2638 = -_2626;
    float _2640 = _2600 + _2638;
    float _2642 = -_2626;
    float _2644 = _2612 + _2642;
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2650 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    bool _2652 = !_2610;
    if (!_2652)
    {
        float _2654 = -_1771;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2658 = -_1773;
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2662 = -_1775;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2666 = _2656 * _2656;
        float _2668 = fma(_2660, _2660, _2666);
        float _2670 = fma(_2664, _2664, _2668);
        float _2672 = sqrt(_2670);
        float _2674 = rsqrt(_2670);
        float _2676 = -_2672;
        float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = _2660 * _2674;
        float _2686 = _2656 * _2674;
        float _2688 = abs(_2682);
        float _2690 = log2(_2688);
        float _2692 = _2664 * _2674;
        float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2696 = _1551 * _2686;
        float _2698 = -_2686;
        float _2700 = -_2694;
        float _2702 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2700);
        float _2704 = fma(_1549, _2684, _2696);
        float _2706 = -_2692;
        float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2702);
        float _2710 = fma(_1553, _2692, _2704);
        float _2712 = precise::clamp(_2710, 0.0, 1.0);
        float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2716 = _2708 + _2714;
        float _2718 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2722 = precise::clamp(_2720, 0.0, 1.0);
        float _2724 = exp2(_2718);
        float _2726 = _2724 * _2722;
        float _2728 = _2712 * _2726;
        float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2734 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2730;
        out.m_86.y = _2732;
        out.m_86.z = _2734;
    }
    out.m_88.x = _2646;
    out.m_88.y = _2648;
    out.m_88.z = _2650;
    if (!_2632)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2736;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _1601 = false;
    bool _509 = false;
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2793 = as_type<float>(_123);
        out.gl_Position.z = _2793;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_155)
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
        float _185 = in.m_58.x;
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
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_58.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_107);
        float _401 = 1.0 / _399;
        float _403 = _141 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    bool _407 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _409 = isnan(_405);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _425 = isnan(_405);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _405 + _439;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _421;
    float _451 = _433 * _445;
    float _453 = -_433;
    float _455 = _453 + 1.0;
    float _457 = _437 * _449;
    float _459 = fma(_457, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _461 = _459 * _451;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[116].x, _463);
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = in.m_60.x;
    float _483 = in.m_60.y;
    out.m_62.x = _473;
    out.m_62.y = _475;
    out.m_62.z = _477;
    out.m_62.w = _479;
    float _485 = _375 * _483;
    float _487 = _373 * _481;
    bool _489 = !_447;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_107);
        float _513 = 1.0 / _511;
        float _515 = _141 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = in.m_58.x;
    float _521 = in.m_58.y;
    float _523 = in.m_58.z;
    float _525 = in.m_58.w;
    float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _529 = log2(_527);
    float _531 = in.m_48.x;
    float _533 = in.m_48.y;
    float _535 = in.m_48.z;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _559 = _557 != 0;
    float _561 = in.m_66.x;
    float _563 = in.m_66.y;
    float _565 = in.m_66.z;
    float _567 = in.m_66.w;
    float _569 = in.m_68.x;
    float _571 = in.m_68.y;
    float _573 = in.m_68.z;
    float _575 = in.m_68.w;
    float _577 = _529 * _141;
    float _579 = _523 * 2.0;
    bool _581 = _525 > 0.5;
    float _583 = _519 * 2.0;
    float _585 = exp2(_577);
    bool _587 = _519 > 0.5;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _591 = _589 != 0;
    float _593 = _533 * _547;
    float _595 = -_177;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_177);
    bool _599 = _521 > 0.5;
    float _601 = floor(_579);
    float _603 = _533 * _563;
    float _605 = fma(_531, _545, _593);
    float _607 = -_181;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = _533 * _571;
    bool _613 = _523 > 0.5;
    float _615 = fma(_531, _561, _603);
    float _617 = floor(_583);
    float _619 = -_177;
    int _621 = _613 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = fma(_535, _565, _615);
    bool _625 = !_539;
    float _627 = _625 ? _177 : as_type<float>(_597);
    float _629 = fma(_531, _569, _611);
    bool _631 = !_543;
    float _633 = _631 ? _181 : as_type<float>(_609);
    float _635 = _521 * 2.0;
    float _637 = _593;
    float _639 = _545;
    float _641 = _603;
    if (!_591)
    {
        _637 = _521;
    }
    float _643 = _637;
    float _645 = -_585;
    float _647 = _645 + 1.0;
    float _649 = _643;
    if (!_591)
    {
        _639 = _523;
    }
    float _651 = _639;
    float _653 = fma(_535, _549, _605);
    float _655 = _651;
    if (!_591)
    {
        _641 = _523;
    }
    float _657 = _641;
    float _659 = fma(_535, _573, _629);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _675 = _657;
    if (_591)
    {
        _649 = _519;
    }
    float _677 = _649;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_591)
    {
        _655 = _521;
    }
    float _681 = _655;
    float _683 = _521 + _523;
    if (_591)
    {
        _675 = _521;
    }
    float _685 = _675;
    float _687 = _659 + _575;
    bool _689 = _601 >= 0.0;
    bool _691 = isnan(_601);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _701 = floor(_635);
    int _703 = _697 ? 0 : 1;
    bool _705 = _601 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _713 = 1.0 / _709;
    int _715 = ~_703;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    float _727 = _521 + _519;
    float _729 = fma(_673, -2.0, _721);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _733 = _719;
    if (!_705)
    {
        int _735 = ~_703;
        int _737 = _735 + 1;
        _733 = _737;
    }
    int _739 = _733;
    float _741 = _727 + (-1.0);
    bool _743 = _617 >= 0.0;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_731;
    float _757 = fma(_711, 2.0, _755);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _761 = _751 ? 0 : 1;
    float _763 = _725 * _713;
    bool _765 = _617 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _769 = _517 + _767;
    float _771 = _683 + (-1.0);
    int _773 = ~_761;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    float _785 = _653 + _551;
    int _787 = _777;
    if (!_765)
    {
        int _789 = ~_761;
        int _791 = _789 + 1;
        _787 = _791;
    }
    int _793 = _787;
    float _795 = _623 + _567;
    float _797 = -_141;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _757);
    bool _801 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _803 = isnan(_517);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _815 = _627 + 0.5;
    bool _817 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _819 = isnan(_517);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    bool _831 = _701 >= 0.0;
    bool _833 = isnan(_701);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = fma(_813, _815, _799);
    float _843 = -_811;
    float _845 = _843 + 1.0;
    float _847 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _633 + (-0.5);
    int _851 = _839 ? 0 : 1;
    float _853 = _827 * _845;
    float _855 = -_847;
    float _857 = -_829;
    float _859 = fma(_855, _849, _857);
    bool _861 = _701 > 0.0;
    float _863 = _779 * _853;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _869 = _677 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _871 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].z, _867);
    float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _881 = -_827;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_869, 2.0, _885);
    int _889 = ~_851;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_699, -2.0, _879);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[131].x, _863);
    float _899 = -_181;
    int _901 = _581 ? as_type<int>(_899) : as_type<int>(_181);
    float _903 = _865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _905 = !_555;
    float _907 = _905 ? _177 : as_type<float>(_621);
    float _909 = -_141;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _887);
    bool _913 = !_559;
    float _915 = _913 ? _181 : as_type<float>(_901);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    int _919 = _893;
    if (!_861)
    {
        int _921 = ~_851;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    float _927 = _907 + 0.5;
    float _929 = _877 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _931 = _915 + (-0.5);
    float _933 = fma(_903, _927, _911);
    float _935 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[132].x, _897);
    float _937 = -_929;
    float _939 = -_917;
    float _941 = fma(_937, _931, _939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _875);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _963 = 1.0 / _947;
    float _965 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    bool _967 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _961);
    bool _979 = !_663;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _985 = _975 ? _647 : 0.0;
    float _987 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _977);
    int _989 = abs(_981);
    float _991 = -_983;
    float _993 = _991 + 1.0;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _997 = _795 + _995;
    float _999 = -_987;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _783);
    float _1005 = float(_989);
    float _1007 = -_993;
    float _1009 = fma(_627, _1007, _841);
    float _1011 = fma(_633, _1001, _859);
    if (_957)
    {
        float _1013 = _985 * _963;
        _145 = _1013;
    }
    float _1015 = _145;
    bool _1017 = !_667;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _785 + _1021;
    float _1025 = float(_739);
    float _1027 = _997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1029 = -_959;
    float _1031 = _1029 + 1.0;
    int _1033 = abs(_1019);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1037 = _687 + _1035;
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1027);
    float _1041 = _1005 * _1025;
    float _1043 = -_1031;
    float _1045 = fma(_907, _1043, _933);
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1039);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1061 = _997 * _997;
    float _1063 = float(_1033);
    float _1065 = -_1003;
    float _1067 = _1065 + 1.0;
    float _1069 = float(_793);
    float _1071 = fma(_1023, _1023, _1061);
    bool _1073 = _1055 >= 0.0;
    float _1075 = _1041 * (-2.0);
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1063 * _1069;
    float _1081 = fma(_1037, _1037, _1071);
    float _1083 = fma(_915, _1067, _941);
    float _1085 = fma(_759, _1075, _759);
    float _1087 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1093 = rsqrt(_1081);
    float _1095 = _1079 * (-2.0);
    float _1097 = _1059;
    if (_1073)
    {
        _1097 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1099 = _1097;
    float _1101 = fma(_1075, _1047, _1047);
    float _1103 = _519 + (-0.5);
    out.m_72.x = _1087;
    out.m_72.y = _1089;
    out.m_72.z = _1077;
    out.m_72.w = _1091;
    float _1105 = fma(_871, _1095, _871);
    int _1107 = as_type<int>(_1099);
    if (_1073)
    {
        float _1109 = _1099 * 5.0;
        _1107 = as_type<int>(_1109);
    }
    int _1111 = _1107;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1101);
    bool _1115 = !_671;
    int _1117 = _1115 ? 0 : 1;
    out.m_74.x = _1009;
    out.m_74.y = _1011;
    out.m_74.z = _1045;
    out.m_74.w = _1083;
    float _1119 = fma(_1095, _1049, _1049);
    float _1121 = fma(_1085, _1015, _1113);
    float _1123 = _521 + (-0.5);
    if (_1073)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4385 = as_type<float>(_1111);
        out.gl_Position.z = _4385;
    }
    int _1125 = abs(_1117);
    if (_1073)
    {
        out.m_51.x = 0.0;
    }
    float _1127 = _997 * _1093;
    float _1129 = _1023 * _1093;
    float _1131 = _1127;
    if (_1073)
    {
        return out;
    }
    float _1133 = -_1127;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _1137 = _1037 * _1093;
    float _1139 = -_1129;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1135 + _1147;
    float _1151 = -_1137;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _687);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1141 + _1155;
    float _1159 = float(_1125);
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1153 + _1163;
    float _1167 = float(_925);
    float _1169 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    float _1171 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1161);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1177 = _1145 * _1145;
    float _1179 = fma(_1105, _1015, _1169);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1171);
    float _1183 = _523 + _519;
    float _1185 = _1159 * _1167;
    float _1187 = fma(_1175, _1175, _1177);
    float _1189 = -_1137;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1037);
    bool _1193 = _1181 >= 0.0;
    float _1195 = _1179 * 0.15915493667125701904296875;
    float _1197 = _1183 + (-1.0);
    float _1199 = _1185 * (-2.0);
    float _1201 = fma(_1191, _1191, _1187);
    float _1203 = _1195 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1209 = _523 + (-0.5);
    float _1211 = fma(_1199, _1051, _1051);
    float _1213 = _1121 * 0.15915493667125701904296875;
    float _1215 = fma(_1207, _1199, _1207);
    float _1217 = _1185;
    int _1219 = as_type<int>(_1209);
    float _1221 = _1157;
    if (_1193)
    {
        _1217 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1223 = _1217;
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1211);
    if (_1193)
    {
        out.m_51.x = 0.0;
    }
    if (_1193)
    {
        float _1229 = _1223 * 5.0;
        _1219 = as_type<int>(_1229);
    }
    int _1231 = _1219;
    float _1233 = fma(_1215, _1015, _1227);
    float _1235 = _1195 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1231);
        out.gl_Position.z = _4586;
    }
    float _1239 = _1213 * 6.283185482025146484375;
    float _1241 = sin(_1239);
    float _1243 = _1213 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1233 * 0.15915493667125701904296875;
    if (_1193)
    {
        return out;
    }
    float _1249 = _1247 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _1093 * _1225;
    float _1255 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1259 = _1241 * _1205;
    float _1261 = _1245 * _1237;
    float _1263 = _1253 * _1255;
    float _1265 = _1241 * _1237;
    float _1267 = _1247 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1245 * _1205;
    float _1273 = _1257 * _1263;
    float _1275 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1279 = _1253 * _1275;
    float _1281 = _1245 * _1251;
    float _1283 = _1237 * _1251;
    float _1285 = _1241 * _1251;
    float _1287 = _1205 * _1251;
    float _1289 = _1277 * _1279;
    float _1291 = _1281 * _1273;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1299 = fma(_1269, _1261, _1259);
    float _1301 = -_1265;
    float _1303 = fma(_1269, _1271, _1301);
    float _1305 = -_1273;
    float _1307 = _1269 * _1305;
    float _1309 = -_1271;
    float _1311 = fma(_1269, _1265, _1309);
    float _1313 = fma(_1299, _1289, _1291);
    float _1315 = _1285 * _1273;
    float _1317 = fma(_1283, _1289, _1307);
    float _1319 = fma(_1269, _1259, _1261);
    float _1321 = fma(_1303, _1295, _1313);
    float _1323 = fma(_1311, _1289, _1315);
    float _1325 = fma(_1287, _1295, _1317);
    float _1327 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1333 = fma(_1319, _1295, _1323);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1329);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1331);
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1339);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = _785 + _1353;
    float _1363 = _687 + _1355;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1327);
    float _1367 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1371 = _1361 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1375 = _1363 + _1373;
    float _1377 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1379 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1381 = _1371 * _1371;
    float _1383 = _1375 * _1375;
    float _1385 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1391 = _1381 + _1383;
    float _1393 = -_1269;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1397 = -_1269;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1297);
    float _1401 = -_1269;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1405 = sqrt(_1391);
    float _1407 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1409 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1367);
    float _1411 = _795 + _1377;
    float _1413 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1379);
    float _1415 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1385);
    float _1417 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1389);
    float _1419 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    bool _1421 = _1405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1389;
    float _1425 = _1361;
    float _1427 = _1387;
    float _1429 = _1363;
    float _1431 = _1381;
    float _1433 = _1409;
    if (!_1421)
    {
        _1423 = _1361;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (!_1421)
    {
        _1425 = _1363;
    }
    float _1439 = _1425;
    float _1441 = _1439;
    if (!_1421)
    {
        _1427 = _1383;
    }
    float _1443 = _1427;
    float _1445 = _1443;
    if (!_1421)
    {
        _1429 = _1411;
    }
    float _1447 = _1429;
    bool _1449 = !_1421;
    float _1451 = _1447;
    if (!_1449)
    {
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1457 = _1405 + _1455;
        float _1459 = rsqrt(_1391);
        float _1461 = _1457 * _1453;
        float _1463 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1465 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = fma(_1469, _1463, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1477 = _1459 * _1475;
        float _1479 = fma(_1371, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = _1473 + (-1.0);
        float _1483 = fma(_1375, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1487 = _1479 + _1485;
        float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1493 = _1483 + _1491;
        float _1495 = _1487 * _1487;
        float _1497 = fma(_1411, _1473, _1489);
        float _1499 = _1493 * _1493;
        _1451 = _1497;
        _1431 = _1495;
        _1445 = _1499;
        _1437 = _1479;
        _1441 = _1483;
    }
    float _1501 = _1451;
    float _1503 = _1431;
    float _1505 = _1445;
    float _1507 = _1437;
    float _1509 = _1441;
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1513 = _1501 + _1511;
    float _1515 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1395);
    float _1517 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1519 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1521 = fma(_1513, _1513, _1503);
    float _1523 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1525 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = _1519 * _1515;
    float _1529 = _1521 + _1505;
    float _1531 = _1519 * _1517;
    float _1533 = _1519 * _1523;
    float _1535 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1413);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1415);
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1417);
    float _1541 = sqrt(_1529);
    float _1543 = fma(_1525, _1407, _1527);
    float _1545 = fma(_1525, _1409, _1531);
    float _1547 = fma(_1525, _1419, _1533);
    float _1549 = _1535 + _1543;
    float _1551 = _1537 + _1545;
    float _1553 = _1539 + _1547;
    out.m_76.x = _1549;
    out.m_76.y = _1551;
    out.m_76.z = _1553;
    bool _1555 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1557 = isnan(_1541);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1563 = _1559 || _1561;
    float _1565 = _1509;
    if (!_1563)
    {
        _1433 = 1.0;
    }
    float _1567 = _1433;
    bool _1569 = !_1563;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1541);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1541 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1541);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1541 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1637 = _1507 + _1635;
    float _1639 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1641 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1643 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    float _1653 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1639);
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1657 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    bool _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.5);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1637, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1671 = 1.0 / _1655;
    float _1673 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1657);
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1677 = _1675 + _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1681 = _1509 + _1679;
    float _1683 = fma(_1681, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1685 = _1677 * _1671;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1691 = _1501 + _1689;
    float _1693 = -_1137;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1683);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1697);
    float _1701 = fma(_1691, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = -_1129;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1669);
    float _1707 = _1631;
    float _1709 = _1705;
    float _1711 = _1695;
    if (_1667)
    {
        _1707 = 1.0;
    }
    float _1713 = _1707;
    float _1715 = -_1127;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1719 = 1.0 / _1699;
    float _1721 = _1717;
    float _1723 = _1713;
    float _1725 = _1719;
    if (!_1651)
    {
        float _1727 = _1149 * _1149;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1731 = -_687;
        float _1733 = _1731 + _1683;
        float _1735 = -_795;
        float _1737 = _1735 + _1701;
        float _1739 = fma(_1157, _1157, _1727);
        float _1741 = fma(_1165, _1165, _1739);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1745 = sqrt(_1741);
        float _1747 = 1.0 / _1253;
        float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1729;
        float _1755 = _1753 * _1747;
        float _1757 = -_785;
        float _1759 = _1757 + _1669;
        float _1761 = _1749 * _1755;
        float _1763 = _1733 * _1755;
        float _1765 = fma(_1737, _1761, _1135);
        float _1767 = fma(_1759, _1761, _1141);
        float _1769 = fma(_1749, _1763, _1153);
        _1721 = _1765;
        _1709 = _1767;
        _1711 = _1769;
        _1131 = _1729;
        _1221 = _1745;
    }
    float _1771 = _1721;
    float _1773 = _1709;
    float _1775 = _1711;
    float _1777 = _1131;
    float _1779 = _1221;
    float _1781 = _1779;
    float _1783 = _1777;
    if (_1667)
    {
        _1781 = 1.0;
    }
    float _1785 = _1781;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1789 = _1719 * _1787;
    float _1791 = _1785;
    if (!_1667)
    {
        float _1793 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1795 = _1793 * 0.15915493667125701904296875;
        float _1797 = _1795 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1795 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = 1.0 / _1799;
        float _1811 = _1803 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = _1803 * 6.283185482025146484375;
        float _1819 = sin(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = 1.0 / _1821;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1827 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1825;
        float _1829 = 1.0 / _1827;
        float _1831 = _1819 * _1823;
        float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1835 = fma(_1789, _1831, _1833);
        float _1837 = _1835 * _1829;
        float _1839 = precise::clamp(_1837, 0.0, 1.0);
        _1783 = _1795;
        _1723 = _1839;
    }
    float _1841 = _1783;
    float _1843 = _1723;
    float _1845 = _1841;
    if (!_1667)
    {
        float _1847 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1849 = _1847 * 0.15915493667125701904296875;
        float _1851 = _1849 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1857 = _1855 * 0.15915493667125701904296875;
        float _1859 = _1849 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = 1.0 / _1853;
        float _1865 = _1857 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1861 * _1863;
        float _1871 = _1857 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = 1.0 / _1875;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = 1.0 / _1881;
        float _1885 = _1873 * _1877;
        float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1889 = fma(_1789, _1885, _1887);
        float _1891 = _1889 * _1883;
        float _1893 = precise::clamp(_1891, 0.0, 1.0);
        float _1895 = -_1893;
        float _1897 = _1895 + 1.0;
        _1845 = _1875;
        _1791 = _1897;
    }
    float _1899 = _1845;
    float _1901 = _1791;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1905 = _1771 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1909 = _1773 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1913 = _1775 + _1911;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1909, _1909, _1915);
    float _1919 = fma(_1913, _1913, _1917);
    float _1921 = rsqrt(_1919);
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1909 * _1923;
    float _1927 = _1913 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1129;
    float _1945 = _1921;
    float _1947 = _1941;
    float _1949 = _1905;
    if (_1937)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1951;
    }
    float _1953 = _1943;
    if (_1937)
    {
        float _1955 = rsqrt(_1933);
        _1945 = _1955;
    }
    float _1957 = _1945;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1937)
    {
        float _1963 = _1941 * _1953;
        _1947 = _1963;
    }
    float _1965 = _1947;
    if (_1937)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1725 = _1967;
    }
    float _1969 = _1725;
    float _1971 = _1913;
    if (_1937)
    {
        float _1973 = _1969 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1981 = precise::max(0.0, _1979);
    float _1983 = _1899;
    if (_1937)
    {
        float _1985 = _1969 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = -_1923;
    float _1993 = -_1981;
    float _1995 = fma(_1905, _1991, _1993);
    float _1997 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _1999 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1999;
    }
    float _2001 = _1949;
    float _2003 = sqrt(_1919);
    float _2005 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2007 = _1977;
    float _2009 = _2001;
    if (_1937)
    {
        float _2011 = fma(_1977, _2001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _2011;
    }
    float _2013 = _1959;
    float _2015 = _2013;
    if (!_1937)
    {
        _2007 = _1927;
    }
    float _2017 = _2007;
    float _2019 = _2017;
    float _2021 = _1989;
    if (_1937)
    {
        float _2023 = _1989 + (-1.0);
        _2009 = _2023;
    }
    float _2025 = _2009;
    float _2027 = _2025;
    if (_1937)
    {
        float _2029 = _1957 * _2013;
        _1565 = _2029;
    }
    float _2031 = _1565;
    if (!_1937)
    {
        _2015 = _1925;
    }
    float _2033 = _2015;
    float _2035 = floor(_2005);
    float _2037 = _2033;
    if (_1937)
    {
        float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2039;
    }
    float _2041 = _1997;
    if (_1937)
    {
        float _2043 = _1925 * _2031;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1937)
    {
        _1961 = _1995;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1937)
    {
        float _2051 = _1927 * _2031;
        _2019 = _2051;
    }
    float _2053 = _2019;
    if (!_1937)
    {
        _2027 = _1929;
    }
    float _2055 = _2027;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = fma(_1995, _1989, _2041);
        _2049 = _2059;
    }
    float _2061 = _2049;
    if (_1937)
    {
        float _2063 = _2045 * _2045;
        _2057 = _2063;
    }
    float _2065 = _2057;
    if (!_1937)
    {
        _2021 = _1931;
    }
    float _2067 = _2021;
    float _2069 = _2067;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2069 = _2071;
    }
    float _2073 = _2069;
    float _2075 = fma(_2061, _2061, _2065);
    float _2077 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2079 = _2075 + _2073;
    float _2081 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2077);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = rsqrt(_2079);
    float _2091 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2093 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2103 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2105 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = -_2035;
    float _2109 = _2005 + _2107;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2113 = abs(_2099);
    float _2115 = log2(_2113);
    float _2117 = -_2111;
    float _2119 = fma(_2117, _2095, 1.0);
    float _2121 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2123 = _2089 * _2045;
    float _2125 = _2089 * _2061;
    float _2127 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2121);
    float _2129 = _2089 * _2053;
    float _2131 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2103);
    float _2133 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2135 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2139 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2141 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2143 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = -_2137;
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2145);
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2157 = -_2129;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2147);
    float _2161 = floor(_2093);
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2167 = fma(_2159, 0.5, 0.5);
    float _2169 = fma(_2159, -0.5, 0.5);
    float _2171 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2163);
    float _2173 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2175 = fma(_2167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2177 = exp2(_2155);
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2171);
    float _2181 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2173);
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2165);
    float _2185 = fma(_2167, _2175, -0.212114393711090087890625);
    float _2187 = _2125 + 1.0;
    float _2189 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2181);
    float _2191 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2193 = log2(_2119);
    float _2195 = -_2161;
    float _2197 = _2093 + _2195;
    float _2199 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2191);
    float _2203 = fma(_2167, _2185, 1.570728778839111328125);
    float _2205 = 1.0 / _2179;
    float _2207 = -_2125;
    float _2209 = fma(_2177, _2187, _2207);
    float _2211 = sqrt(_2169);
    float _2213 = _2193 * 0.693147182464599609375;
    float2 _6185 = float2(_2109, _2197);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6185, float2(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6185, float2(0.0), isnan(_6185)), level(0.0)).x;
    float _2217 = fma(_2209, 0.5, 0.5);
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = _2199 * _2205;
    float _2223 = _2201 * _2205;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _6215 = float3(_2225, _2227, _2219);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float3 _6226 = float3(_2225, _2227, _2219);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2203;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _6247 = float2(_2246, _2217);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6247, float2(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6247, float2(0.0), isnan(_6247)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = abs(_1789);
    float _2260 = log2(_2258);
    float _2262 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2264 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2266 = isnan(_2003);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    float _2276 = in.m_78.x;
    float _2278 = _2179 * 0.5;
    bool _2280 = _1789 <= 8000.0;
    bool _2282 = isnan(_1789);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(8000.0);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2294 = _2199 + _2179;
    float _2296 = _2294 * 0.5;
    float _2298 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2300 = exp2(_2298);
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2308 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2310 = fma(_2304, -2.0, 3.0);
    float _2312 = _2304 * _2304;
    float _2314 = _2308 + _2179;
    float _2316 = exp2(_2306);
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2308;
    out.gl_Position.w = _2179;
    float _2318 = _2312 * _2310;
    float _2320 = _2314 * 0.5;
    float _2322 = -_2318;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2328 = fma(_2201, -0.5, _2278);
    float _2330 = _2290 * _2326;
    float _2332 = -_2316;
    float _2334 = _2332 + 1.0;
    out.m_80.x = _2296;
    out.m_80.y = _2328;
    out.m_80.z = _2320;
    out.m_80.w = _2179;
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = _1843 * _1901;
    float _2340 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2342 = _2179;
    float _2344 = _2308;
    float _2346 = _2201;
    float _2348 = _2338;
    if (!_2272)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2350 = _2342;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2272)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2272)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2346;
    float _2364 = -_2215;
    float _2366 = _2364 + 1.0;
    float _2368 = _2366 * _2336;
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = -_2370;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2376 = _2374 * _2276;
    float _2378 = _2340 * _2231;
    float _2380 = -_2340;
    float _2382 = _2380 + 1.0;
    float _2384 = _2242 * _2378;
    float _2386 = _2256 * _2378;
    float _2388 = fma(_2254, _2384, _2238);
    float _2390 = fma(_2252, _2384, _2236);
    float _2392 = _2376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2394 = _2242 * _2382;
    float _2396 = fma(_2242, _2386, _2240);
    float _2398 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2400 = _2376;
    float _2402 = _2236;
    float _2404 = _2362;
    float _2406 = _2362;
    if (!_2272)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2408 = _2400;
    out.m_82.x = _2392;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2272)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2272)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2348;
    out.m_84.x = _2390;
    out.m_84.y = _2388;
    out.m_84.z = _2396;
    out.m_84.w = _2394;
    bool _2422 = !_2272;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_2003);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _2003 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = 1.0 / _2444;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2468 = _2440 * _2450;
            float _2470 = precise::clamp(_2468, 0.0, 1.0);
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2476 = fma(_2470, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2412 = _2476;
            _2360 = _2482;
            _2354 = _2478;
            _2426 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_2003);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2410;
            _2412 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2352;
            _2354 = _2504;
            if (!_2498)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2358;
            _2360 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2424;
            bool _2512 = !_2498;
            _2426 = _2510;
            if (!_2512)
            {
                bool _2514 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_2003);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _2003 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = 1.0 / _2530;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2554 = _2526 * _2536;
                    float _2556 = precise::clamp(_2554, 0.0, 1.0);
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2562 = fma(_2556, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2564 = fma(_2556, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2556, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2556, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2556, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2412 = _2562;
                    _2360 = _2568;
                    _2354 = _2564;
                    _2426 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2412;
    float _2580 = _2360;
    float _2582 = _2354;
    float _2584 = _2426;
    float _2586 = fma(_1551, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2596 = -_2578;
    float _2598 = _2596 + _2580;
    out.m_86.x = 0.0;
    float _2600 = fma(_2588, _2592, _2574);
    float _2602 = fma(_2588, _2598, _2578);
    out.m_51.x = _2594;
    float _2604 = -_2582;
    float _2606 = _2604 + _2584;
    float _2608 = _2600 * 0.586610972881317138671875;
    bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = fma(_2588, _2606, _2582);
    float _2614 = fma(_2602, 0.298911988735198974609375, _2608);
    bool _2616 = _1843 > 0.0;
    bool _2618 = isnan(_1843);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    float _2626 = fma(_2612, 0.114477999508380889892578125, _2614);
    bool _2628 = _1901 <= 0.0;
    bool _2630 = !_2624;
    bool _2632 = _2628 || _2630;
    float _2634 = -_2626;
    float _2636 = _2602 + _2634;
    float _2638 = -_2626;
    float _2640 = _2600 + _2638;
    float _2642 = -_2626;
    float _2644 = _2612 + _2642;
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2650 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    bool _2652 = !_2610;
    if (!_2652)
    {
        float _2654 = -_1771;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2658 = -_1773;
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2662 = -_1775;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2666 = _2656 * _2656;
        float _2668 = fma(_2660, _2660, _2666);
        float _2670 = fma(_2664, _2664, _2668);
        float _2672 = sqrt(_2670);
        float _2674 = rsqrt(_2670);
        float _2676 = -_2672;
        float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = _2660 * _2674;
        float _2686 = _2656 * _2674;
        float _2688 = abs(_2682);
        float _2690 = log2(_2688);
        float _2692 = _2664 * _2674;
        float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2696 = _1551 * _2686;
        float _2698 = -_2686;
        float _2700 = -_2694;
        float _2702 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2700);
        float _2704 = fma(_1549, _2684, _2696);
        float _2706 = -_2692;
        float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2702);
        float _2710 = fma(_1553, _2692, _2704);
        float _2712 = precise::clamp(_2710, 0.0, 1.0);
        float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2716 = _2708 + _2714;
        float _2718 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2722 = precise::clamp(_2720, 0.0, 1.0);
        float _2724 = exp2(_2718);
        float _2726 = _2724 * _2722;
        float _2728 = _2712 * _2726;
        float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2734 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2730;
        out.m_86.y = _2732;
        out.m_86.z = _2734;
    }
    out.m_88.x = _2646;
    out.m_88.y = _2648;
    out.m_88.z = _2650;
    if (!_2632)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2736;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2488 = false;
    bool _1601 = false;
    bool _509 = false;
    bool _397 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2793 = as_type<float>(_123);
        out.gl_Position.z = _2793;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2862 = as_type<float>(_161);
        out.gl_Position.z = _2862;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _185 = in.m_58.x;
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
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _223 = _211 + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _233;
    bool _237 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_211);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = 1.0 / _227;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _235;
    float _255 = 1.0 / _231;
    float _257 = _215 * _249;
    bool _259 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _261 = isnan(_211);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_247;
    float _273 = _271 + 1.0;
    float _275 = _269 * _273;
    float _277 = _219 * _253;
    bool _279 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_211);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -_269;
    float _293 = _291 + 1.0;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = _289 * _293;
    float _301 = -_289;
    float _303 = _301 + 1.0;
    float _305 = _223 * _255;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = fma(_297, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = _317 * _303;
    float _337 = fma(_327, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = fma(_331, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = -_317;
    float _343 = _341 + 1.0;
    float _345 = _333 * _335;
    float _347 = _337 * _335;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _349;
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _355;
    float _359 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[143].y, _347);
    float _361 = fma(_351, _277, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _363 = fma(_323, _299, _353);
    float _365 = fma(_357, _277, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _367 = fma(_339, _299, _359);
    float _369 = fma(_361, _275, _363);
    float _371 = fma(_365, _275, _367);
    float _373 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].x, _369);
    float _375 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[146].y, _371);
    bool _377 = !_251;
    float _395;
    if (!_377)
    {
        float _379 = in.m_58.x;
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _383 = _379 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_107);
        float _401 = 1.0 / _399;
        float _403 = _141 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    bool _407 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _409 = isnan(_405);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _423 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _425 = isnan(_405);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _405 + _439;
    float _443 = -_417;
    float _445 = _443 + 1.0;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _449 = 1.0 / _421;
    float _451 = _433 * _445;
    float _453 = -_433;
    float _455 = _453 + 1.0;
    float _457 = _437 * _449;
    float _459 = fma(_457, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _461 = _459 * _451;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _471 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[116].x, _463);
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = _469 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _481 = in.m_60.x;
    float _483 = in.m_60.y;
    out.m_62.x = _473;
    out.m_62.y = _475;
    out.m_62.z = _477;
    out.m_62.w = _479;
    float _485 = _375 * _483;
    float _487 = _373 * _481;
    bool _489 = !_447;
    float _507;
    if (!_489)
    {
        float _491 = in.m_58.x;
        float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _495 = _491 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _499 = _497 * _493;
        float _501 = floor(_499);
        float _503 = -_501;
        float _505 = _499 + _503;
        _507 = _505;
        _509 = true;
    }
    else
    {
        float _511 = float(_107);
        float _513 = 1.0 / _511;
        float _515 = _141 * _513;
        _507 = _515;
    }
    _509 = false;
    float _517 = _507;
    float _519 = in.m_58.x;
    float _521 = in.m_58.y;
    float _523 = in.m_58.z;
    float _525 = in.m_58.w;
    float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _529 = log2(_527);
    float _531 = in.m_48.x;
    float _533 = in.m_48.y;
    float _535 = in.m_48.z;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    int _553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _555 = _553 != 0;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _559 = _557 != 0;
    float _561 = in.m_66.x;
    float _563 = in.m_66.y;
    float _565 = in.m_66.z;
    float _567 = in.m_66.w;
    float _569 = in.m_68.x;
    float _571 = in.m_68.y;
    float _573 = in.m_68.z;
    float _575 = in.m_68.w;
    float _577 = _529 * _141;
    float _579 = _523 * 2.0;
    bool _581 = _525 > 0.5;
    float _583 = _519 * 2.0;
    float _585 = exp2(_577);
    bool _587 = _519 > 0.5;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _591 = _589 != 0;
    float _593 = _533 * _547;
    float _595 = -_177;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_177);
    bool _599 = _521 > 0.5;
    float _601 = floor(_579);
    float _603 = _533 * _563;
    float _605 = fma(_531, _545, _593);
    float _607 = -_181;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = _533 * _571;
    bool _613 = _523 > 0.5;
    float _615 = fma(_531, _561, _603);
    float _617 = floor(_583);
    float _619 = -_177;
    int _621 = _613 ? as_type<int>(_619) : as_type<int>(_177);
    float _623 = fma(_535, _565, _615);
    bool _625 = !_539;
    float _627 = _625 ? _177 : as_type<float>(_597);
    float _629 = fma(_531, _569, _611);
    bool _631 = !_543;
    float _633 = _631 ? _181 : as_type<float>(_609);
    float _635 = _521 * 2.0;
    float _637 = _593;
    float _639 = _545;
    float _641 = _603;
    if (!_591)
    {
        _637 = _521;
    }
    float _643 = _637;
    float _645 = -_585;
    float _647 = _645 + 1.0;
    float _649 = _643;
    if (!_591)
    {
        _639 = _523;
    }
    float _651 = _639;
    float _653 = fma(_535, _549, _605);
    float _655 = _651;
    if (!_591)
    {
        _641 = _523;
    }
    float _657 = _641;
    float _659 = fma(_535, _573, _629);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _663 = _661 != 0;
    int _665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _667 = _665 != 0;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _671 = _669 != 0;
    float _673 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _675 = _657;
    if (_591)
    {
        _649 = _519;
    }
    float _677 = _649;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_591)
    {
        _655 = _521;
    }
    float _681 = _655;
    float _683 = _521 + _523;
    if (_591)
    {
        _675 = _521;
    }
    float _685 = _675;
    float _687 = _659 + _575;
    bool _689 = _601 >= 0.0;
    bool _691 = isnan(_601);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = _681 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _701 = floor(_635);
    int _703 = _697 ? 0 : 1;
    bool _705 = _601 > 0.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _711 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _713 = 1.0 / _709;
    int _715 = ~_703;
    int _717 = _715 + 1;
    int _719 = _717 + 1;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _723;
    float _727 = _521 + _519;
    float _729 = fma(_673, -2.0, _721);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _733 = _719;
    if (!_705)
    {
        int _735 = ~_703;
        int _737 = _735 + 1;
        _733 = _737;
    }
    int _739 = _733;
    float _741 = _727 + (-1.0);
    bool _743 = _617 >= 0.0;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _755 = -_731;
    float _757 = fma(_711, 2.0, _755);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _761 = _751 ? 0 : 1;
    float _763 = _725 * _713;
    bool _765 = _617 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _769 = _517 + _767;
    float _771 = _683 + (-1.0);
    int _773 = ~_761;
    int _775 = _773 + 1;
    int _777 = _775 + 1;
    float _779 = fma(_763, _769, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _783 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _781);
    float _785 = _653 + _551;
    int _787 = _777;
    if (!_765)
    {
        int _789 = ~_761;
        int _791 = _789 + 1;
        _787 = _791;
    }
    int _793 = _787;
    float _795 = _623 + _567;
    float _797 = -_141;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _757);
    bool _801 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _803 = isnan(_517);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _815 = _627 + 0.5;
    bool _817 = _517 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _819 = isnan(_517);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _729);
    bool _831 = _701 >= 0.0;
    bool _833 = isnan(_701);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = fma(_813, _815, _799);
    float _843 = -_811;
    float _845 = _843 + 1.0;
    float _847 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = _633 + (-0.5);
    int _851 = _839 ? 0 : 1;
    float _853 = _827 * _845;
    float _855 = -_847;
    float _857 = -_829;
    float _859 = fma(_855, _849, _857);
    bool _861 = _701 > 0.0;
    float _863 = _779 * _853;
    float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _869 = _677 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _871 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _875 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].z, _867);
    float _877 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _881 = -_827;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_869, 2.0, _885);
    int _889 = ~_851;
    int _891 = _889 + 1;
    int _893 = _891 + 1;
    float _895 = fma(_699, -2.0, _879);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[131].x, _863);
    float _899 = -_181;
    int _901 = _581 ? as_type<int>(_899) : as_type<int>(_181);
    float _903 = _865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _905 = !_555;
    float _907 = _905 ? _177 : as_type<float>(_621);
    float _909 = -_141;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _887);
    bool _913 = !_559;
    float _915 = _913 ? _181 : as_type<float>(_901);
    float _917 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _895);
    int _919 = _893;
    if (!_861)
    {
        int _921 = ~_851;
        int _923 = _921 + 1;
        _919 = _923;
    }
    int _925 = _919;
    float _927 = _907 + 0.5;
    float _929 = _877 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _931 = _915 + (-0.5);
    float _933 = fma(_903, _927, _911);
    float _935 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[132].x, _897);
    float _937 = -_929;
    float _939 = -_917;
    float _941 = fma(_937, _931, _939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _947 = 1.0 + _945;
    bool _949 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _951 = isnan(1.0);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _957 = _953 || _955;
    float _959 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _875);
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _963 = 1.0 / _947;
    float _965 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    bool _967 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _969 = isnan(0.0);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _975 = _971 || _973;
    float _977 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _961);
    bool _979 = !_663;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _985 = _975 ? _647 : 0.0;
    float _987 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _977);
    int _989 = abs(_981);
    float _991 = -_983;
    float _993 = _991 + 1.0;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _997 = _795 + _995;
    float _999 = -_987;
    float _1001 = _999 + 1.0;
    float _1003 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _783);
    float _1005 = float(_989);
    float _1007 = -_993;
    float _1009 = fma(_627, _1007, _841);
    float _1011 = fma(_633, _1001, _859);
    if (_957)
    {
        float _1013 = _985 * _963;
        _145 = _1013;
    }
    float _1015 = _145;
    bool _1017 = !_667;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1023 = _785 + _1021;
    float _1025 = float(_739);
    float _1027 = _997 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1029 = -_959;
    float _1031 = _1029 + 1.0;
    int _1033 = abs(_1019);
    float _1035 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1037 = _687 + _1035;
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1027);
    float _1041 = _1005 * _1025;
    float _1043 = -_1031;
    float _1045 = fma(_907, _1043, _933);
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1055 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1039);
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1061 = _997 * _997;
    float _1063 = float(_1033);
    float _1065 = -_1003;
    float _1067 = _1065 + 1.0;
    float _1069 = float(_793);
    float _1071 = fma(_1023, _1023, _1061);
    bool _1073 = _1055 >= 0.0;
    float _1075 = _1041 * (-2.0);
    float _1077 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1063 * _1069;
    float _1081 = fma(_1037, _1037, _1071);
    float _1083 = fma(_915, _1067, _941);
    float _1085 = fma(_759, _1075, _759);
    float _1087 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1093 = rsqrt(_1081);
    float _1095 = _1079 * (-2.0);
    float _1097 = _1059;
    if (_1073)
    {
        _1097 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1099 = _1097;
    float _1101 = fma(_1075, _1047, _1047);
    float _1103 = _519 + (-0.5);
    out.m_72.x = _1087;
    out.m_72.y = _1089;
    out.m_72.z = _1077;
    out.m_72.w = _1091;
    float _1105 = fma(_871, _1095, _871);
    int _1107 = as_type<int>(_1099);
    if (_1073)
    {
        float _1109 = _1099 * 5.0;
        _1107 = as_type<int>(_1109);
    }
    int _1111 = _1107;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1101);
    bool _1115 = !_671;
    int _1117 = _1115 ? 0 : 1;
    out.m_74.x = _1009;
    out.m_74.y = _1011;
    out.m_74.z = _1045;
    out.m_74.w = _1083;
    float _1119 = fma(_1095, _1049, _1049);
    float _1121 = fma(_1085, _1015, _1113);
    float _1123 = _521 + (-0.5);
    if (_1073)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4385 = as_type<float>(_1111);
        out.gl_Position.z = _4385;
    }
    int _1125 = abs(_1117);
    if (_1073)
    {
        out.m_51.x = 0.0;
    }
    float _1127 = _997 * _1093;
    float _1129 = _1023 * _1093;
    float _1131 = _1127;
    if (_1073)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1133 = -_1127;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _795);
    float _1137 = _1037 * _1093;
    float _1139 = -_1129;
    float _1141 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[18].w, _785);
    float _1143 = -_1127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _997);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1149 = _1135 + _1147;
    float _1151 = -_1137;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _687);
    float _1155 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1157 = _1141 + _1155;
    float _1159 = float(_1125);
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1165 = _1153 + _1163;
    float _1167 = float(_925);
    float _1169 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1119);
    float _1171 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1161);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _1177 = _1145 * _1145;
    float _1179 = fma(_1105, _1015, _1169);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1171);
    float _1183 = _523 + _519;
    float _1185 = _1159 * _1167;
    float _1187 = fma(_1175, _1175, _1177);
    float _1189 = -_1137;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1037);
    bool _1193 = _1181 >= 0.0;
    float _1195 = _1179 * 0.15915493667125701904296875;
    float _1197 = _1183 + (-1.0);
    float _1199 = _1185 * (-2.0);
    float _1201 = fma(_1191, _1191, _1187);
    float _1203 = _1195 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1209 = _523 + (-0.5);
    float _1211 = fma(_1199, _1051, _1051);
    float _1213 = _1121 * 0.15915493667125701904296875;
    float _1215 = fma(_1207, _1199, _1207);
    float _1217 = _1185;
    int _1219 = as_type<int>(_1209);
    float _1221 = _1157;
    if (_1193)
    {
        _1217 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1223 = _1217;
    float _1225 = sqrt(_1201);
    float _1227 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1211);
    if (_1193)
    {
        out.m_51.x = 0.0;
    }
    if (_1193)
    {
        float _1229 = _1223 * 5.0;
        _1219 = as_type<int>(_1229);
    }
    int _1231 = _1219;
    float _1233 = fma(_1215, _1015, _1227);
    float _1235 = _1195 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    if (_1193)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4586 = as_type<float>(_1231);
        out.gl_Position.z = _4586;
    }
    float _1239 = _1213 * 6.283185482025146484375;
    float _1241 = sin(_1239);
    float _1243 = _1213 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1233 * 0.15915493667125701904296875;
    if (_1193)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1249 = _1247 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _1093 * _1225;
    float _1255 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1257 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1259 = _1241 * _1205;
    float _1261 = _1245 * _1237;
    float _1263 = _1253 * _1255;
    float _1265 = _1241 * _1237;
    float _1267 = _1247 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1245 * _1205;
    float _1273 = _1257 * _1263;
    float _1275 = _487 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1279 = _1253 * _1275;
    float _1281 = _1245 * _1251;
    float _1283 = _1237 * _1251;
    float _1285 = _1241 * _1251;
    float _1287 = _1205 * _1251;
    float _1289 = _1277 * _1279;
    float _1291 = _1281 * _1273;
    float _1293 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1295 = _1293 * 0.5;
    float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1299 = fma(_1269, _1261, _1259);
    float _1301 = -_1265;
    float _1303 = fma(_1269, _1271, _1301);
    float _1305 = -_1273;
    float _1307 = _1269 * _1305;
    float _1309 = -_1271;
    float _1311 = fma(_1269, _1265, _1309);
    float _1313 = fma(_1299, _1289, _1291);
    float _1315 = _1285 * _1273;
    float _1317 = fma(_1283, _1289, _1307);
    float _1319 = fma(_1269, _1259, _1261);
    float _1321 = fma(_1303, _1295, _1313);
    float _1323 = fma(_1311, _1289, _1315);
    float _1325 = fma(_1287, _1295, _1317);
    float _1327 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1329 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1331 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1333 = fma(_1319, _1295, _1323);
    float _1335 = _1321 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1337 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1329);
    float _1339 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1331);
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1343 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1335);
    float _1345 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1337);
    float _1347 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1339);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1351 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1343);
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1357 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = _785 + _1353;
    float _1363 = _687 + _1355;
    float _1365 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1327);
    float _1367 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1371 = _1361 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1375 = _1363 + _1373;
    float _1377 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1379 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1381 = _1371 * _1371;
    float _1383 = _1375 * _1375;
    float _1385 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1349);
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1391 = _1381 + _1383;
    float _1393 = -_1269;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1397 = -_1269;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1297);
    float _1401 = -_1269;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1405 = sqrt(_1391);
    float _1407 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1409 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1367);
    float _1411 = _795 + _1377;
    float _1413 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1379);
    float _1415 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1385);
    float _1417 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1389);
    float _1419 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    bool _1421 = _1405 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1423 = _1389;
    float _1425 = _1361;
    float _1427 = _1387;
    float _1429 = _1363;
    float _1431 = _1381;
    float _1433 = _1409;
    if (!_1421)
    {
        _1423 = _1361;
    }
    float _1435 = _1423;
    float _1437 = _1435;
    if (!_1421)
    {
        _1425 = _1363;
    }
    float _1439 = _1425;
    float _1441 = _1439;
    if (!_1421)
    {
        _1427 = _1383;
    }
    float _1443 = _1427;
    float _1445 = _1443;
    if (!_1421)
    {
        _1429 = _1411;
    }
    float _1447 = _1429;
    bool _1449 = !_1421;
    float _1451 = _1447;
    if (!_1449)
    {
        float _1453 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1457 = _1405 + _1455;
        float _1459 = rsqrt(_1391);
        float _1461 = _1457 * _1453;
        float _1463 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1465 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = fma(_1469, _1463, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1477 = _1459 * _1475;
        float _1479 = fma(_1371, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1481 = _1473 + (-1.0);
        float _1483 = fma(_1375, _1477, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1487 = _1479 + _1485;
        float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1493 = _1483 + _1491;
        float _1495 = _1487 * _1487;
        float _1497 = fma(_1411, _1473, _1489);
        float _1499 = _1493 * _1493;
        _1451 = _1497;
        _1431 = _1495;
        _1445 = _1499;
        _1437 = _1479;
        _1441 = _1483;
    }
    float _1501 = _1451;
    float _1503 = _1431;
    float _1505 = _1445;
    float _1507 = _1437;
    float _1509 = _1441;
    float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1513 = _1501 + _1511;
    float _1515 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1395);
    float _1517 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1519 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1521 = fma(_1513, _1513, _1503);
    float _1523 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1403);
    float _1525 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1527 = _1519 * _1515;
    float _1529 = _1521 + _1505;
    float _1531 = _1519 * _1517;
    float _1533 = _1519 * _1523;
    float _1535 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1413);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1415);
    float _1539 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1417);
    float _1541 = sqrt(_1529);
    float _1543 = fma(_1525, _1407, _1527);
    float _1545 = fma(_1525, _1409, _1531);
    float _1547 = fma(_1525, _1419, _1533);
    float _1549 = _1535 + _1543;
    float _1551 = _1537 + _1545;
    float _1553 = _1539 + _1547;
    out.m_76.x = _1549;
    out.m_76.y = _1551;
    out.m_76.z = _1553;
    bool _1555 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1557 = isnan(_1541);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1563 = _1559 || _1561;
    float _1565 = _1509;
    if (!_1563)
    {
        _1433 = 1.0;
    }
    float _1567 = _1433;
    bool _1569 = !_1563;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1541);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1541 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1541 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1541);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1541 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1637 = _1507 + _1635;
    float _1639 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1641 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1643 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    float _1653 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1639);
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1657 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    bool _1659 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.5);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1637, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1671 = 1.0 / _1655;
    float _1673 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1657);
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1677 = _1675 + _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1681 = _1509 + _1679;
    float _1683 = fma(_1681, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1685 = _1677 * _1671;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1691 = _1501 + _1689;
    float _1693 = -_1137;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1683);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1699 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1697);
    float _1701 = fma(_1691, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1703 = -_1129;
    float _1705 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1669);
    float _1707 = _1631;
    float _1709 = _1705;
    float _1711 = _1695;
    if (_1667)
    {
        _1707 = 1.0;
    }
    float _1713 = _1707;
    float _1715 = -_1127;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1719 = 1.0 / _1699;
    float _1721 = _1717;
    float _1723 = _1713;
    float _1725 = _1719;
    if (!_1651)
    {
        float _1727 = _1149 * _1149;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1731 = -_687;
        float _1733 = _1731 + _1683;
        float _1735 = -_795;
        float _1737 = _1735 + _1701;
        float _1739 = fma(_1157, _1157, _1727);
        float _1741 = fma(_1165, _1165, _1739);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1745 = sqrt(_1741);
        float _1747 = 1.0 / _1253;
        float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1745, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1729;
        float _1755 = _1753 * _1747;
        float _1757 = -_785;
        float _1759 = _1757 + _1669;
        float _1761 = _1749 * _1755;
        float _1763 = _1733 * _1755;
        float _1765 = fma(_1737, _1761, _1135);
        float _1767 = fma(_1759, _1761, _1141);
        float _1769 = fma(_1749, _1763, _1153);
        _1721 = _1765;
        _1709 = _1767;
        _1711 = _1769;
        _1131 = _1729;
        _1221 = _1745;
    }
    float _1771 = _1721;
    float _1773 = _1709;
    float _1775 = _1711;
    float _1777 = _1131;
    float _1779 = _1221;
    float _1781 = _1779;
    float _1783 = _1777;
    if (_1667)
    {
        _1781 = 1.0;
    }
    float _1785 = _1781;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1789 = _1719 * _1787;
    float _1791 = _1785;
    if (!_1667)
    {
        float _1793 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1795 = _1793 * 0.15915493667125701904296875;
        float _1797 = _1795 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1803 = _1801 * 0.15915493667125701904296875;
        float _1805 = _1795 * 6.283185482025146484375;
        float _1807 = sin(_1805);
        float _1809 = 1.0 / _1799;
        float _1811 = _1803 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = _1807 * _1809;
        float _1817 = _1803 * 6.283185482025146484375;
        float _1819 = sin(_1817);
        float _1821 = _1813 * _1815;
        float _1823 = 1.0 / _1821;
        float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1827 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1825;
        float _1829 = 1.0 / _1827;
        float _1831 = _1819 * _1823;
        float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1835 = fma(_1789, _1831, _1833);
        float _1837 = _1835 * _1829;
        float _1839 = precise::clamp(_1837, 0.0, 1.0);
        _1783 = _1795;
        _1723 = _1839;
    }
    float _1841 = _1783;
    float _1843 = _1723;
    float _1845 = _1841;
    if (!_1667)
    {
        float _1847 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1849 = _1847 * 0.15915493667125701904296875;
        float _1851 = _1849 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1857 = _1855 * 0.15915493667125701904296875;
        float _1859 = _1849 * 6.283185482025146484375;
        float _1861 = sin(_1859);
        float _1863 = 1.0 / _1853;
        float _1865 = _1857 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = _1861 * _1863;
        float _1871 = _1857 * 6.283185482025146484375;
        float _1873 = sin(_1871);
        float _1875 = _1867 * _1869;
        float _1877 = 1.0 / _1875;
        float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1881 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1879;
        float _1883 = 1.0 / _1881;
        float _1885 = _1873 * _1877;
        float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1889 = fma(_1789, _1885, _1887);
        float _1891 = _1889 * _1883;
        float _1893 = precise::clamp(_1891, 0.0, 1.0);
        float _1895 = -_1893;
        float _1897 = _1895 + 1.0;
        _1845 = _1875;
        _1791 = _1897;
    }
    float _1899 = _1845;
    float _1901 = _1791;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1905 = _1771 + _1903;
    float _1907 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1909 = _1773 + _1907;
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1913 = _1775 + _1911;
    float _1915 = _1905 * _1905;
    float _1917 = fma(_1909, _1909, _1915);
    float _1919 = fma(_1913, _1913, _1917);
    float _1921 = rsqrt(_1919);
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1925 = _1909 * _1923;
    float _1927 = _1913 * _1923;
    float _1929 = _1925 * _1925;
    float _1931 = _1927 * _1927;
    float _1933 = _1929 + _1931;
    float _1935 = sqrt(_1933);
    bool _1937 = _1935 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1941 = _1935 + _1939;
    float _1943 = _1129;
    float _1945 = _1921;
    float _1947 = _1941;
    float _1949 = _1905;
    if (_1937)
    {
        float _1951 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1943 = _1951;
    }
    float _1953 = _1943;
    if (_1937)
    {
        float _1955 = rsqrt(_1933);
        _1945 = _1955;
    }
    float _1957 = _1945;
    float _1959 = _1953;
    float _1961 = _1957;
    if (_1937)
    {
        float _1963 = _1941 * _1953;
        _1947 = _1963;
    }
    float _1965 = _1947;
    if (_1937)
    {
        float _1967 = _1965 * 0.15915493667125701904296875;
        _1725 = _1967;
    }
    float _1969 = _1725;
    float _1971 = _1913;
    if (_1937)
    {
        float _1973 = _1969 * 6.283185482025146484375;
        float _1975 = sin(_1973);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1981 = precise::max(0.0, _1979);
    float _1983 = _1899;
    if (_1937)
    {
        float _1985 = _1969 * 6.283185482025146484375;
        float _1987 = cos(_1985);
        _1983 = _1987;
    }
    float _1989 = _1983;
    float _1991 = -_1923;
    float _1993 = -_1981;
    float _1995 = fma(_1905, _1991, _1993);
    float _1997 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1937)
    {
        float _1999 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1999;
    }
    float _2001 = _1949;
    float _2003 = sqrt(_1919);
    float _2005 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2007 = _1977;
    float _2009 = _2001;
    if (_1937)
    {
        float _2011 = fma(_1977, _2001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _2011;
    }
    float _2013 = _1959;
    float _2015 = _2013;
    if (!_1937)
    {
        _2007 = _1927;
    }
    float _2017 = _2007;
    float _2019 = _2017;
    float _2021 = _1989;
    if (_1937)
    {
        float _2023 = _1989 + (-1.0);
        _2009 = _2023;
    }
    float _2025 = _2009;
    float _2027 = _2025;
    if (_1937)
    {
        float _2029 = _1957 * _2013;
        _1565 = _2029;
    }
    float _2031 = _1565;
    if (!_1937)
    {
        _2015 = _1925;
    }
    float _2033 = _2015;
    float _2035 = floor(_2005);
    float _2037 = _2033;
    if (_1937)
    {
        float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2039;
    }
    float _2041 = _1997;
    if (_1937)
    {
        float _2043 = _1925 * _2031;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1937)
    {
        _1961 = _1995;
    }
    float _2047 = _1961;
    float _2049 = _2047;
    if (_1937)
    {
        float _2051 = _1927 * _2031;
        _2019 = _2051;
    }
    float _2053 = _2019;
    if (!_1937)
    {
        _2027 = _1929;
    }
    float _2055 = _2027;
    float _2057 = _2055;
    if (_1937)
    {
        float _2059 = fma(_1995, _1989, _2041);
        _2049 = _2059;
    }
    float _2061 = _2049;
    if (_1937)
    {
        float _2063 = _2045 * _2045;
        _2057 = _2063;
    }
    float _2065 = _2057;
    if (!_1937)
    {
        _2021 = _1931;
    }
    float _2067 = _2021;
    float _2069 = _2067;
    if (_1937)
    {
        float _2071 = _2053 * _2053;
        _2069 = _2071;
    }
    float _2073 = _2069;
    float _2075 = fma(_2061, _2061, _2065);
    float _2077 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2079 = _2075 + _2073;
    float _2081 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2077);
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = rsqrt(_2079);
    float _2091 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2093 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2103 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2105 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = -_2035;
    float _2109 = _2005 + _2107;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2113 = abs(_2099);
    float _2115 = log2(_2113);
    float _2117 = -_2111;
    float _2119 = fma(_2117, _2095, 1.0);
    float _2121 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2123 = _2089 * _2045;
    float _2125 = _2089 * _2061;
    float _2127 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2121);
    float _2129 = _2089 * _2053;
    float _2131 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2103);
    float _2133 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2135 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2139 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2131);
    float _2141 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2133);
    float _2143 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2145 = -_2137;
    float _2147 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2145);
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2153 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2155 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2157 = -_2129;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2147);
    float _2161 = floor(_2093);
    float _2163 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2153);
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2167 = fma(_2159, 0.5, 0.5);
    float _2169 = fma(_2159, -0.5, 0.5);
    float _2171 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2163);
    float _2173 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2175 = fma(_2167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2177 = exp2(_2155);
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2171);
    float _2181 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2173);
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2165);
    float _2185 = fma(_2167, _2175, -0.212114393711090087890625);
    float _2187 = _2125 + 1.0;
    float _2189 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2181);
    float _2191 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2193 = log2(_2119);
    float _2195 = -_2161;
    float _2197 = _2093 + _2195;
    float _2199 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2191);
    float _2203 = fma(_2167, _2185, 1.570728778839111328125);
    float _2205 = 1.0 / _2179;
    float _2207 = -_2125;
    float _2209 = fma(_2177, _2187, _2207);
    float _2211 = sqrt(_2169);
    float _2213 = _2193 * 0.693147182464599609375;
    float2 _6185 = float2(_2109, _2197);
    float _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6185, float2(0.0), isnan(_6185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6185, float2(0.0), isnan(_6185)), level(0.0)).x;
    float _2217 = fma(_2209, 0.5, 0.5);
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2221 = _2199 * _2205;
    float _2223 = _2201 * _2205;
    float _2225 = fma(_2221, 0.5, 0.5);
    float _2227 = fma(_2223, -0.5, 0.5);
    float _2229 = _2211 * 0.636619746685028076171875;
    float3 _6215 = float3(_2225, _2227, _2219);
    float _2231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6215, float3(0.0), isnan(_6215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6215, float3(0.0), isnan(_6215)), level(0.0)).x;
    float3 _6226 = float3(_2225, _2227, _2219);
    float4 _2234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6226, float3(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6226, float3(0.0), isnan(_6226)), level(0.0)).xyzw;
    float _2236 = _2234.x;
    float _2238 = _2234.y;
    float _2240 = _2234.z;
    float _2242 = _2234.w;
    float _2244 = -_2203;
    float _2246 = fma(_2229, _2244, 1.0);
    float2 _6247 = float2(_2246, _2217);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6247, float2(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6247, float2(0.0), isnan(_6247)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = abs(_1789);
    float _2260 = log2(_2258);
    float _2262 = _2143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2264 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2266 = isnan(_2003);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    float _2276 = in.m_78.x;
    float _2278 = _2179 * 0.5;
    bool _2280 = _1789 <= 8000.0;
    bool _2282 = isnan(_1789);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(8000.0);
    bool _2288 = _2284 || _2286;
    float _2290 = float(_2288);
    float _2292 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2274);
    float _2294 = _2199 + _2179;
    float _2296 = _2294 * 0.5;
    float _2298 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2300 = exp2(_2298);
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2304 = precise::clamp(_2302, 0.0, 1.0);
    float _2306 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2308 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2310 = fma(_2304, -2.0, 3.0);
    float _2312 = _2304 * _2304;
    float _2314 = _2308 + _2179;
    float _2316 = exp2(_2306);
    out.gl_Position.x = _2199;
    out.gl_Position.y = _2201;
    out.gl_Position.z = _2308;
    out.gl_Position.w = _2179;
    float _2318 = _2312 * _2310;
    float _2320 = _2314 * 0.5;
    float _2322 = -_2318;
    float _2324 = _2322 + 1.0;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2328 = fma(_2201, -0.5, _2278);
    float _2330 = _2290 * _2326;
    float _2332 = -_2316;
    float _2334 = _2332 + 1.0;
    out.m_80.x = _2296;
    out.m_80.y = _2328;
    out.m_80.z = _2320;
    out.m_80.w = _2179;
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2338 = _1843 * _1901;
    float _2340 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2342 = _2179;
    float _2344 = _2308;
    float _2346 = _2201;
    float _2348 = _2338;
    if (!_2272)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2350 = _2342;
    float _2352 = _2350;
    float _2354 = _2350;
    if (!_2272)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2356 = _2344;
    float _2358 = _2356;
    float _2360 = _2356;
    if (!_2272)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2362 = _2346;
    float _2364 = -_2215;
    float _2366 = _2364 + 1.0;
    float _2368 = _2366 * _2336;
    float _2370 = precise::clamp(_2368, 0.0, 1.0);
    float _2372 = -_2370;
    float _2374 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2376 = _2374 * _2276;
    float _2378 = _2340 * _2231;
    float _2380 = -_2340;
    float _2382 = _2380 + 1.0;
    float _2384 = _2242 * _2378;
    float _2386 = _2256 * _2378;
    float _2388 = fma(_2254, _2384, _2238);
    float _2390 = fma(_2252, _2384, _2236);
    float _2392 = _2376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2394 = _2242 * _2382;
    float _2396 = fma(_2242, _2386, _2240);
    float _2398 = _2338 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2400 = _2376;
    float _2402 = _2236;
    float _2404 = _2362;
    float _2406 = _2362;
    if (!_2272)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2408 = _2400;
    out.m_82.x = _2392;
    float _2410 = _2408;
    float _2412 = _2408;
    if (!_2272)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    float _2418 = _2414;
    if (!_2272)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2348;
    out.m_84.x = _2390;
    out.m_84.y = _2388;
    out.m_84.z = _2396;
    out.m_84.w = _2394;
    bool _2422 = !_2272;
    float _2424 = _2420;
    float _2426 = _2420;
    if (!_2422)
    {
        bool _2428 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2430 = isnan(_2003);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2436 = _2432 || _2434;
        if (!_2436)
        {
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2440 = _2003 + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2442;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2450 = 1.0 / _2444;
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2458 = _2456 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2468 = _2440 * _2450;
            float _2470 = precise::clamp(_2468, 0.0, 1.0);
            float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2476 = fma(_2470, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2478 = fma(_2470, _2474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2480 = fma(_2470, _2454, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2482 = fma(_2470, _2458, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2484 = fma(_2470, _2462, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2486 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2418 = _2480;
            _2406 = _2484;
            _2412 = _2476;
            _2360 = _2482;
            _2354 = _2478;
            _2426 = _2486;
            _2488 = true;
        }
        else
        {
            bool _2490 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2492 = isnan(_2003);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2498 = _2494 || _2496;
            if (!_2498)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2500 = _2410;
            _2412 = _2500;
            if (!_2498)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2502 = _2416;
            _2418 = _2502;
            if (!_2498)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2504 = _2352;
            _2354 = _2504;
            if (!_2498)
            {
                _2358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2506 = _2358;
            _2360 = _2506;
            if (!_2498)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2508 = _2404;
            _2406 = _2508;
            if (!_2498)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2510 = _2424;
            bool _2512 = !_2498;
            _2426 = _2510;
            if (!_2512)
            {
                bool _2514 = _2003 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2516 = isnan(_2003);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2522 = _2518 || _2520;
                if (!_2522)
                {
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2526 = _2003 + _2524;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2528;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2536 = 1.0 / _2530;
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2554 = _2526 * _2536;
                    float _2556 = precise::clamp(_2554, 0.0, 1.0);
                    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2562 = fma(_2556, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2564 = fma(_2556, _2560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2566 = fma(_2556, _2540, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2568 = fma(_2556, _2544, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2570 = fma(_2556, _2548, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2572 = fma(_2556, _2552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2418 = _2566;
                    _2406 = _2570;
                    _2412 = _2562;
                    _2360 = _2568;
                    _2354 = _2564;
                    _2426 = _2572;
                    _2488 = true;
                }
                else
                {
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2488 = false;
    float _2574 = _2418;
    float _2576 = _2406;
    float _2578 = _2412;
    float _2580 = _2360;
    float _2582 = _2354;
    float _2584 = _2426;
    float _2586 = fma(_1551, -0.5, 0.5);
    float _2588 = precise::clamp(_2586, 0.0, 1.0);
    float _2590 = -_2574;
    float _2592 = _2590 + _2576;
    float _2594 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2596 = -_2578;
    float _2598 = _2596 + _2580;
    out.m_86.x = 0.0;
    float _2600 = fma(_2588, _2592, _2574);
    float _2602 = fma(_2588, _2598, _2578);
    out.m_51.x = _2594;
    float _2604 = -_2582;
    float _2606 = _2604 + _2584;
    float _2608 = _2600 * 0.586610972881317138671875;
    bool _2610 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = fma(_2588, _2606, _2582);
    float _2614 = fma(_2602, 0.298911988735198974609375, _2608);
    bool _2616 = _1843 > 0.0;
    bool _2618 = isnan(_1843);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    float _2626 = fma(_2612, 0.114477999508380889892578125, _2614);
    bool _2628 = _1901 <= 0.0;
    bool _2630 = !_2624;
    bool _2632 = _2628 || _2630;
    float _2634 = -_2626;
    float _2636 = _2602 + _2634;
    float _2638 = -_2626;
    float _2640 = _2600 + _2638;
    float _2642 = -_2626;
    float _2644 = _2612 + _2642;
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    float _2650 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2626);
    bool _2652 = !_2610;
    if (!_2652)
    {
        float _2654 = -_1771;
        float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2658 = -_1773;
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2662 = -_1775;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2666 = _2656 * _2656;
        float _2668 = fma(_2660, _2660, _2666);
        float _2670 = fma(_2664, _2664, _2668);
        float _2672 = sqrt(_2670);
        float _2674 = rsqrt(_2670);
        float _2676 = -_2672;
        float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2682 = precise::clamp(_2680, 0.0, 1.0);
        float _2684 = _2660 * _2674;
        float _2686 = _2656 * _2674;
        float _2688 = abs(_2682);
        float _2690 = log2(_2688);
        float _2692 = _2664 * _2674;
        float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2696 = _1551 * _2686;
        float _2698 = -_2686;
        float _2700 = -_2694;
        float _2702 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2700);
        float _2704 = fma(_1549, _2684, _2696);
        float _2706 = -_2692;
        float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2702);
        float _2710 = fma(_1553, _2692, _2704);
        float _2712 = precise::clamp(_2710, 0.0, 1.0);
        float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2716 = _2708 + _2714;
        float _2718 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2720 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2722 = precise::clamp(_2720, 0.0, 1.0);
        float _2724 = exp2(_2718);
        float _2726 = _2724 * _2722;
        float _2728 = _2712 * _2726;
        float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2732 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2734 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2730;
        out.m_86.y = _2732;
        out.m_86.z = _2734;
    }
    out.m_88.x = _2646;
    out.m_88.y = _2648;
    out.m_88.z = _2650;
    if (!_2632)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2736;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

