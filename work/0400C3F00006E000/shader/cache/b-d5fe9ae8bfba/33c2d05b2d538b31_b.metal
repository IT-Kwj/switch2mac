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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _511 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_97)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1808 = as_type<float>(_107);
        out.gl_Position.z = _1808;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_93);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_145);
        out.gl_Position.z = _1877;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    bool _213 = !_177;
    int _215 = _213 ? 0 : 1;
    float _217 = -_211;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_205);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_199, 0.5, 0.5);
    int _227 = abs(_215);
    float _229 = abs(_219);
    float _231 = _221 * _229;
    float _233 = float(_207);
    bool _235 = _211 < 0.5;
    float _237 = float(_235);
    float _239 = -_225;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_233, _241, _231);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_223;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _281 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _281 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = 1.0 / _305;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _301;
    float _319 = _285 * _311;
    bool _321 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = isnan(_281);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _309;
    float _339 = _289 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _281 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _293 * _317;
    bool _353 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_281);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_281);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _363 * _335;
    bool _379 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_281);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _343 * _337;
    float _393 = -_363;
    float _395 = _393 + 1.0;
    bool _397 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_281);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = _375 * _395;
    float _419 = -_375;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_411, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _431 = _389 * _421;
    float _433 = -_389;
    float _435 = _433 + 1.0;
    float _437 = -_407;
    float _439 = _437 + 1.0;
    float _441 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _407 * _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _427 * _443;
    float _455 = _349 * _443;
    float _457 = fma(_447, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_451, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_429, _431, _461);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _481 = fma(_457, _417, _473);
    float _483 = fma(_459, _417, _475);
    float _485 = fma(_477, _377, _481);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].x, _485);
    float _491 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].y, _487);
    bool _493 = !_313;
    float _509;
    if (!_493)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _497 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_93);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = _153 > 0.5;
    float _529 = in.m_56.x;
    float _531 = in.m_56.y;
    float _533 = in.m_56.z;
    float _535 = in.m_56.w;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_54.z;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _553 = _551 != 0;
    float _555 = in.m_58.x;
    float _557 = in.m_58.y;
    float _559 = in.m_58.z;
    float _561 = in.m_58.w;
    float _563 = -_187;
    int _565 = _527 ? as_type<int>(_563) : as_type<int>(_187);
    float _567 = in.m_60.x;
    float _569 = in.m_60.y;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = in.m_54.y;
    float _581 = in.m_54.w;
    float _583 = _523 * _531;
    bool _585 = _545 > 0.5;
    float _587 = fma(_521, _529, _583);
    float _589 = _523 * _557;
    float _591 = fma(_525, _533, _587);
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _595 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _597 = _489 * _567;
    float _599 = _491 * _569;
    float _601 = fma(_521, _555, _589);
    float _603 = _591 + _535;
    float _605 = _523 * _573;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = fma(_525, _559, _601);
    bool _613 = _579 > 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _615;
    float _619 = fma(_521, _571, _605);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _623 = _607 * _593;
    bool _625 = _581 > 0.5;
    float _627 = fma(_525, _575, _619);
    float _629 = 1.0 / _617;
    float _631 = _609 * _621;
    float _633 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _641 = _519 + _639;
    float _643 = _611 + _561;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _633);
    float _647 = 1.0 / _637;
    float _649 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _653 = -_169;
    int _655 = _625 ? as_type<int>(_653) : as_type<int>(_169);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _657;
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _663 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _665 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = _641 * _629;
    float _669 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _661);
    bool _671 = !_539;
    float _673 = _671 ? _187 : as_type<float>(_565);
    float _675 = _603 + _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _679 = _519 + _677;
    float _681 = _669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _675 + _683;
    float _687 = _679 * _647;
    float _689 = _643 + _681;
    float _691 = -_187;
    int _693 = _585 ? as_type<int>(_691) : as_type<int>(_187);
    float _695 = _685 * _685;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _689 + _701;
    bool _705 = !_549;
    float _707 = _705 ? _187 : as_type<float>(_693);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -_169;
    int _715 = _613 ? as_type<int>(_713) : as_type<int>(_169);
    float _717 = _703 * _703;
    float _719 = fma(_699, _667, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _667, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _723 = !_543;
    float _725 = _723 ? _169 : as_type<float>(_715);
    float _727 = _695 + _717;
    bool _729 = !_553;
    float _731 = _729 ? _169 : as_type<float>(_655);
    float _733 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _735 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _737 = isnan(_519);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = sqrt(_727);
    bool _749 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _751 = isnan(_519);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _765 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _767 = isnan(_519);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _787 = -_745;
    float _789 = _787 + 1.0;
    float _791 = -_775;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _797 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _799 = _775 * _789;
    float _801 = _759 * _793;
    float _803 = _627 + _577;
    float _805 = -_759;
    float _807 = _805 + 1.0;
    float _809 = _797 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _811 = _747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _815 = _719 * _801;
    float _817 = _721 * _801;
    float _819 = _733 * _801;
    float _821 = fma(_763, _687, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _815);
    float _825 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _827 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _819);
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _831 = _803 + _809;
    float _833 = fma(_779, _687, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _835 = fma(_783, _687, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _837 = _809;
    float _839 = _797;
    float _841 = _695;
    float _843 = _717;
    float _845 = _675;
    float _847 = _803;
    float _849 = _643;
    if (!_811)
    {
        _837 = _689;
    }
    float _851 = _837;
    float _853 = _851;
    if (!_811)
    {
        _839 = _831;
    }
    float _855 = _839;
    bool _857 = !_811;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _747 + _863;
        float _867 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_727);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = cos(_879);
        float _883 = fma(_877, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _885 = _869 * _883;
        float _887 = _881 + (-1.0);
        float _889 = fma(_685, _885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _891 = fma(_703, _885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _893 = _887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _897 = _889 + _895;
        float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _901 = _891 + _899;
        float _903 = fma(_831, _881, _893);
        float _905 = _897 * _897;
        float _907 = _901 * _901;
        _859 = _903;
        _841 = _905;
        _843 = _907;
        _845 = _889;
        _853 = _891;
    }
    float _909 = _859;
    float _911 = _841;
    float _913 = _843;
    float _915 = _845;
    float _917 = _853;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _921 = _909 + _919;
    float _923 = fma(_821, _799, _823);
    float _925 = fma(_833, _799, _825);
    float _927 = fma(_835, _799, _827);
    float _929 = fma(_921, _921, _911);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].x, _923);
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _935 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].y, _925);
    float _937 = _929 + _913;
    float _939 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].z, _927);
    float _941 = _673 + 0.5;
    float _943 = -_725;
    float _945 = _943 + 0.5;
    float _947 = _707 + 0.5;
    float _949 = -_731;
    float _951 = _949 + 0.5;
    float _953 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = sqrt(_937);
    float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _959 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _939 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _975 = _953 * _795;
    float _977 = _957 * _813;
    float _979 = _961 * _829;
    float _981 = _963 * _933;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _975;
    out.m_64.y = _977;
    out.m_64.z = _979;
    out.m_64.w = _981;
    bool _999 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1001 = isnan(_955);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1007 = _1003 || _1005;
    out.m_66.x = _987;
    out.m_66.y = _989;
    out.m_66.z = _991;
    out.m_66.w = _985;
    out.m_68.x = _993;
    out.m_68.y = _995;
    out.m_68.z = _997;
    out.m_68.w = _983;
    float _1009 = _957;
    float _1011 = _987;
    if (!_1007)
    {
        _1009 = 1.0;
    }
    float _1013 = _1009;
    bool _1015 = !_1007;
    float _1017 = _1013;
    if (!_1015)
    {
        bool _1019 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1021 = isnan(_955);
        bool _1023 = _1019 || _1021;
        bool _1025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1027 = _1023 || _1025;
        if (!_1027)
        {
            float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1031 = _955 + _1029;
            float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1033;
            float _1037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1039 = _1037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1041 = 1.0 / _1035;
            float _1043 = _1031 * _1041;
            float _1045 = fma(_1043, _1039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1017 = _1045;
            _1047 = true;
        }
        else
        {
            bool _1049 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1051 = isnan(_955);
            bool _1053 = _1049 || _1051;
            bool _1055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1057 = _1053 || _1055;
            if (!_1057)
            {
                float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1061 = _955 + _1059;
                float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1065 = _1063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1069 = _1067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1071 = 1.0 / _1065;
                float _1073 = _1061 * _1071;
                float _1075 = fma(_1073, _1069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1017 = _1075;
                _1047 = true;
            }
            else
            {
                _1017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1047 = false;
    float _1077 = _1017;
    float _1079 = _803 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1083 = _915 + _1081;
    float _1085 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1079);
    float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1089 = _909 + _1087;
    bool _1091 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.5);
    bool _1099 = _1095 || _1097;
    float _1101 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1103 = _803 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1105 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    float _1115 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1119 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1121 = fma(_1089, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1123 = 1.0 / _1117;
    float _1125 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1119);
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1131 = _1077;
    float _1133 = _1121;
    if (_1113)
    {
        _1129 = 1.0;
    }
    float _1135 = _1129;
    float _1137 = _1127 + _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1141 = _917 + _1139;
    float _1143 = fma(_1141, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1145 = _1141;
    float _1147 = _1135;
    if (_1099)
    {
        _1131 = _1115;
    }
    float _1149 = _1131;
    float _1151 = _1137 * _1123;
    float _1153 = _1151 * 0.5;
    float _1155 = _1153;
    float _1157 = _1149;
    if (_1099)
    {
        _1145 = _1121;
    }
    float _1159 = _1145;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1161);
    float _1165 = _1159;
    if (_1099)
    {
        _1155 = _1143;
    }
    float _1167 = _1155;
    float _1169 = 1.0 / _1163;
    float _1171 = _1167;
    if (!_1099)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _803 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _603 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = _1175 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _643 + _1185;
        float _1189 = fma(_1179, _1179, _1183);
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1193 = fma(_1187, _1187, _1189);
        float _1195 = sqrt(_1193);
        float _1197 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1199 = precise::min(_1195, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1201 = _1199 * _1191;
        float _1203 = -_603;
        float _1205 = _1203 + _1115;
        float _1207 = -_643;
        float _1209 = _1207 + _1143;
        float _1211 = _1197 * _1201;
        float _1213 = -_803;
        float _1215 = _1213 + _1121;
        float _1217 = fma(_1205, _1211, _603);
        float _1219 = fma(_1215, _1211, _803);
        float _1221 = fma(_1209, _1211, _643);
        _1165 = _1219;
        _1157 = _1217;
        _1171 = _1221;
    }
    float _1223 = _1165;
    float _1225 = _1157;
    float _1227 = _1171;
    if (_1113)
    {
        _847 = 1.0;
    }
    float _1229 = _847;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1233 = _1169 * _1231;
    float _1235 = _1229;
    if (!_1113)
    {
        float _1237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = _1239 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1279 = fma(_1233, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        _1133 = _1247;
        _849 = _1267;
        _1147 = _1283;
    }
    float _1285 = _1133;
    float _1287 = _849;
    float _1289 = _1147;
    float _1291 = _1285;
    float _1293 = _1287;
    if (!_1113)
    {
        float _1295 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1297 = _1295 * 0.15915493667125701904296875;
        float _1299 = _1297 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = _1297 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = 1.0 / _1301;
        float _1313 = _1305 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = _1305 * 6.283185482025146484375;
        float _1321 = sin(_1319);
        float _1323 = _1315 * _1317;
        float _1325 = 1.0 / _1323;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1327;
        float _1331 = 1.0 / _1329;
        float _1333 = _1321 * _1325;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = fma(_1233, _1333, _1335);
        float _1339 = _1337 * _1331;
        float _1341 = precise::clamp(_1339, 0.0, 1.0);
        float _1343 = -_1341;
        float _1345 = _1343 + 1.0;
        _1291 = _1311;
        _1293 = _1323;
        _1235 = _1345;
    }
    float _1347 = _1291;
    float _1349 = _1293;
    float _1351 = _1235;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1355 = _1223 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1359 = _1225 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1227 + _1361;
    float _1365 = _1355 * _1355;
    float _1367 = fma(_1359, _1359, _1365);
    float _1369 = fma(_1363, _1363, _1367);
    float _1371 = rsqrt(_1369);
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1375 = _1359 * _1373;
    float _1377 = _1363 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = _1377 * _1377;
    float _1383 = _1379 + _1381;
    float _1385 = sqrt(_1383);
    bool _1387 = _1385 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1385 + _1389;
    float _1393 = _1371;
    float _1395 = _1349;
    float _1397 = _1391;
    float _1399 = _1347;
    float _1401 = _1355;
    float _1403 = _1375;
    if (_1387)
    {
        float _1405 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1405;
    }
    float _1407 = _1393;
    if (_1387)
    {
        float _1409 = rsqrt(_1383);
        _1395 = _1409;
    }
    float _1411 = _1395;
    float _1413 = _1411;
    if (_1387)
    {
        float _1415 = _1391 * _1407;
        _1397 = _1415;
    }
    float _1417 = _1397;
    if (_1387)
    {
        float _1419 = _1417 * 0.15915493667125701904296875;
        _1399 = _1419;
    }
    float _1421 = _1399;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1425 = _1363;
    if (_1387)
    {
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1435 = precise::max(0.0, _1433);
    float _1437 = _1407;
    float _1439 = _1435;
    if (_1387)
    {
        float _1441 = _1421 * 6.283185482025146484375;
        float _1443 = cos(_1441);
        _1437 = _1443;
    }
    float _1445 = _1437;
    float _1447 = -_1373;
    float _1449 = -_1435;
    float _1451 = fma(_1355, _1447, _1449);
    if (_1387)
    {
        float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1453;
    }
    float _1455 = _1401;
    float _1457 = sqrt(_1369);
    float _1459 = _1455;
    float _1461 = _1431;
    if (_1387)
    {
        float _1463 = fma(_1431, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = _1465;
    if (!_1387)
    {
        _1461 = _1377;
    }
    float _1469 = _1461;
    float _1471 = _1469;
    if (_1387)
    {
        float _1473 = _1445 + (-1.0);
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1387)
    {
        float _1479 = _1411 * _1465;
        _1011 = _1479;
    }
    float _1481 = _1011;
    if (!_1387)
    {
        _1413 = _1451;
    }
    float _1483 = _1413;
    float _1485 = _1483;
    if (_1387)
    {
        float _1487 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1387)
    {
        float _1493 = _1375 * _1481;
        _1403 = _1493;
    }
    float _1495 = _1403;
    if (!_1387)
    {
        _1467 = _1379;
    }
    float _1497 = _1467;
    float _1499 = _1497;
    if (_1387)
    {
        float _1501 = _1377 * _1481;
        _1471 = _1501;
    }
    float _1503 = _1471;
    if (_1387)
    {
        float _1505 = fma(_1451, _1445, _1489);
        _1485 = _1505;
    }
    float _1507 = _1485;
    if (_1387)
    {
        float _1509 = _1495 * _1495;
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1387)
    {
        _1491 = _1381;
    }
    float _1513 = _1491;
    float _1515 = _1513;
    if (_1387)
    {
        float _1517 = _1503 * _1503;
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = fma(_1507, _1507, _1511);
    float _1523 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = _1521 + _1519;
    float _1527 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1531 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    float _1535 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1537 = rsqrt(_1525);
    float _1539 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1527);
    float _1541 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1543 = -_1533;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1539);
    float _1549 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1551 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1541);
    float _1553 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1555 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1549);
    float _1557 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1551);
    float _1559 = abs(_1545);
    float _1561 = log2(_1559);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1555);
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1537 * _1495;
    float _1571 = -_1563;
    float _1573 = fma(_1571, _1423, 1.0);
    float _1575 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1535);
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1537 * _1507;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1537 * _1503;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1581);
    float _1591 = -_1583;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1591);
    float _1595 = log2(_1573);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1599 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1589);
    float _1601 = -_1585;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1593);
    float _1605 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1607 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1599);
    float _1611 = fma(_1603, -0.5, 0.5);
    float _1613 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1605);
    float _1615 = exp2(_1597);
    float _1617 = fma(_1603, 0.5, 0.5);
    float _1619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1607);
    float _1621 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1613);
    float _1623 = _1579 + 1.0;
    float _1625 = fma(_1617, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1629 = 1.0 / _1609;
    float _1631 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1619);
    float _1633 = fma(_1617, _1625, -0.212114393711090087890625);
    float _1635 = _1595 * 0.693147182464599609375;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1639 = fma(_1617, _1633, 1.570728778839111328125);
    float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1643 = sqrt(_1611);
    float _1645 = -_1579;
    float _1647 = fma(_1615, _1623, _1645);
    float _1649 = fma(_1647, 0.5, 0.5);
    float _1651 = _1627 * _1629;
    float _1653 = _1637 * _1629;
    float _1655 = fma(_1651, 0.5, 0.5);
    float _1657 = fma(_1653, -0.5, 0.5);
    float _1659 = _1643 * 0.636619746685028076171875;
    float _1661 = -_1639;
    float _1663 = fma(_1659, _1661, 1.0);
    float3 _4300 = float3(_1655, _1657, _1641);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4300, float3(0.0), isnan(_4300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4300, float3(0.0), isnan(_4300)), level(0.0)).x;
    float3 _4311 = float3(_1655, _1657, _1641);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4311, float3(0.0), isnan(_4311)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4311, float3(0.0), isnan(_4311)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4328 = float2(_1663, _1649);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4328, float2(0.0), isnan(_4328)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4328, float2(0.0), isnan(_4328)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1690 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1692 = _1289 * _1351;
    bool _1694 = _1289 > 0.0;
    bool _1696 = isnan(_1289);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    out.m_70.x = _1225;
    out.m_70.y = _1223;
    out.m_70.z = _1227;
    float _1704 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1690);
    float _1706 = exp2(_1688);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1710 = _1351 <= 0.0;
    bool _1712 = !_1702;
    bool _1714 = _1710 || _1712;
    float _1716 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1704);
    float _1718 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1716);
    float _1720 = _253 * _1708;
    float _1722 = _1718 + _1609;
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1637;
    out.gl_Position.z = _1718;
    out.gl_Position.w = _1609;
    float _1726 = _1722 * 0.5;
    float _1728 = -_1706;
    float _1730 = _1728 + 1.0;
    out.m_47.x = _1724;
    float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1726;
    out.m_72.w = _1609;
    float _1734 = -_1732;
    float _1736 = _1734 + 1.0;
    float _1738 = _1732 * _1665;
    float _1740 = _1676 * _1738;
    float _1742 = _1686 * _1738;
    float _1744 = fma(_1682, _1740, _1670);
    float _1746 = fma(_1684, _1740, _1672);
    float _1748 = _1676 * _1736;
    float _1750 = fma(_1676, _1742, _1674);
    out.m_74.x = _1744;
    out.m_74.y = _1746;
    out.m_74.z = _1750;
    out.m_74.w = _1748;
    if (!_1714)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1752;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _511 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_97)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1808 = as_type<float>(_107);
        out.gl_Position.z = _1808;
    }
    if (!_97)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_93);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_145);
        out.gl_Position.z = _1877;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    bool _213 = !_177;
    int _215 = _213 ? 0 : 1;
    float _217 = -_211;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_205);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_199, 0.5, 0.5);
    int _227 = abs(_215);
    float _229 = abs(_219);
    float _231 = _221 * _229;
    float _233 = float(_207);
    bool _235 = _211 < 0.5;
    float _237 = float(_235);
    float _239 = -_225;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_233, _241, _231);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_223;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _281 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _281 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = 1.0 / _305;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _301;
    float _319 = _285 * _311;
    bool _321 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = isnan(_281);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _309;
    float _339 = _289 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _281 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _293 * _317;
    bool _353 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_281);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_281);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _363 * _335;
    bool _379 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_281);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _343 * _337;
    float _393 = -_363;
    float _395 = _393 + 1.0;
    bool _397 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_281);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = _375 * _395;
    float _419 = -_375;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_411, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _431 = _389 * _421;
    float _433 = -_389;
    float _435 = _433 + 1.0;
    float _437 = -_407;
    float _439 = _437 + 1.0;
    float _441 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _407 * _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _427 * _443;
    float _455 = _349 * _443;
    float _457 = fma(_447, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_451, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_429, _431, _461);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _481 = fma(_457, _417, _473);
    float _483 = fma(_459, _417, _475);
    float _485 = fma(_477, _377, _481);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].x, _485);
    float _491 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].y, _487);
    bool _493 = !_313;
    float _509;
    if (!_493)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _497 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_93);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = _153 > 0.5;
    float _529 = in.m_56.x;
    float _531 = in.m_56.y;
    float _533 = in.m_56.z;
    float _535 = in.m_56.w;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_54.z;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _553 = _551 != 0;
    float _555 = in.m_58.x;
    float _557 = in.m_58.y;
    float _559 = in.m_58.z;
    float _561 = in.m_58.w;
    float _563 = -_187;
    int _565 = _527 ? as_type<int>(_563) : as_type<int>(_187);
    float _567 = in.m_60.x;
    float _569 = in.m_60.y;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = in.m_54.y;
    float _581 = in.m_54.w;
    float _583 = _523 * _531;
    bool _585 = _545 > 0.5;
    float _587 = fma(_521, _529, _583);
    float _589 = _523 * _557;
    float _591 = fma(_525, _533, _587);
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _595 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _597 = _489 * _567;
    float _599 = _491 * _569;
    float _601 = fma(_521, _555, _589);
    float _603 = _591 + _535;
    float _605 = _523 * _573;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = fma(_525, _559, _601);
    bool _613 = _579 > 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _615;
    float _619 = fma(_521, _571, _605);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _623 = _607 * _593;
    bool _625 = _581 > 0.5;
    float _627 = fma(_525, _575, _619);
    float _629 = 1.0 / _617;
    float _631 = _609 * _621;
    float _633 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _641 = _519 + _639;
    float _643 = _611 + _561;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _633);
    float _647 = 1.0 / _637;
    float _649 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _653 = -_169;
    int _655 = _625 ? as_type<int>(_653) : as_type<int>(_169);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _657;
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _663 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _665 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = _641 * _629;
    float _669 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _661);
    bool _671 = !_539;
    float _673 = _671 ? _187 : as_type<float>(_565);
    float _675 = _603 + _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _679 = _519 + _677;
    float _681 = _669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _675 + _683;
    float _687 = _679 * _647;
    float _689 = _643 + _681;
    float _691 = -_187;
    int _693 = _585 ? as_type<int>(_691) : as_type<int>(_187);
    float _695 = _685 * _685;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _689 + _701;
    bool _705 = !_549;
    float _707 = _705 ? _187 : as_type<float>(_693);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -_169;
    int _715 = _613 ? as_type<int>(_713) : as_type<int>(_169);
    float _717 = _703 * _703;
    float _719 = fma(_699, _667, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _667, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _723 = !_543;
    float _725 = _723 ? _169 : as_type<float>(_715);
    float _727 = _695 + _717;
    bool _729 = !_553;
    float _731 = _729 ? _169 : as_type<float>(_655);
    float _733 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _735 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _737 = isnan(_519);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = sqrt(_727);
    bool _749 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _751 = isnan(_519);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _765 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _767 = isnan(_519);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _787 = -_745;
    float _789 = _787 + 1.0;
    float _791 = -_775;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _797 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _799 = _775 * _789;
    float _801 = _759 * _793;
    float _803 = _627 + _577;
    float _805 = -_759;
    float _807 = _805 + 1.0;
    float _809 = _797 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _811 = _747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _815 = _719 * _801;
    float _817 = _721 * _801;
    float _819 = _733 * _801;
    float _821 = fma(_763, _687, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _815);
    float _825 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _827 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _819);
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _831 = _803 + _809;
    float _833 = fma(_779, _687, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _835 = fma(_783, _687, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _837 = _809;
    float _839 = _797;
    float _841 = _695;
    float _843 = _717;
    float _845 = _675;
    float _847 = _803;
    float _849 = _643;
    if (!_811)
    {
        _837 = _689;
    }
    float _851 = _837;
    float _853 = _851;
    if (!_811)
    {
        _839 = _831;
    }
    float _855 = _839;
    bool _857 = !_811;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _747 + _863;
        float _867 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_727);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = cos(_879);
        float _883 = fma(_877, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _885 = _869 * _883;
        float _887 = _881 + (-1.0);
        float _889 = fma(_685, _885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _891 = fma(_703, _885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _893 = _887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _897 = _889 + _895;
        float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _901 = _891 + _899;
        float _903 = fma(_831, _881, _893);
        float _905 = _897 * _897;
        float _907 = _901 * _901;
        _859 = _903;
        _841 = _905;
        _843 = _907;
        _845 = _889;
        _853 = _891;
    }
    float _909 = _859;
    float _911 = _841;
    float _913 = _843;
    float _915 = _845;
    float _917 = _853;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _921 = _909 + _919;
    float _923 = fma(_821, _799, _823);
    float _925 = fma(_833, _799, _825);
    float _927 = fma(_835, _799, _827);
    float _929 = fma(_921, _921, _911);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].x, _923);
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _935 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].y, _925);
    float _937 = _929 + _913;
    float _939 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].z, _927);
    float _941 = _673 + 0.5;
    float _943 = -_725;
    float _945 = _943 + 0.5;
    float _947 = _707 + 0.5;
    float _949 = -_731;
    float _951 = _949 + 0.5;
    float _953 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = sqrt(_937);
    float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _959 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _939 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _975 = _953 * _795;
    float _977 = _957 * _813;
    float _979 = _961 * _829;
    float _981 = _963 * _933;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _975;
    out.m_64.y = _977;
    out.m_64.z = _979;
    out.m_64.w = _981;
    bool _999 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1001 = isnan(_955);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1007 = _1003 || _1005;
    out.m_66.x = _987;
    out.m_66.y = _989;
    out.m_66.z = _991;
    out.m_66.w = _985;
    out.m_68.x = _993;
    out.m_68.y = _995;
    out.m_68.z = _997;
    out.m_68.w = _983;
    float _1009 = _957;
    float _1011 = _987;
    if (!_1007)
    {
        _1009 = 1.0;
    }
    float _1013 = _1009;
    bool _1015 = !_1007;
    float _1017 = _1013;
    if (!_1015)
    {
        bool _1019 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1021 = isnan(_955);
        bool _1023 = _1019 || _1021;
        bool _1025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1027 = _1023 || _1025;
        if (!_1027)
        {
            float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1031 = _955 + _1029;
            float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1033;
            float _1037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1039 = _1037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1041 = 1.0 / _1035;
            float _1043 = _1031 * _1041;
            float _1045 = fma(_1043, _1039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1017 = _1045;
            _1047 = true;
        }
        else
        {
            bool _1049 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1051 = isnan(_955);
            bool _1053 = _1049 || _1051;
            bool _1055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1057 = _1053 || _1055;
            if (!_1057)
            {
                float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1061 = _955 + _1059;
                float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1065 = _1063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1069 = _1067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1071 = 1.0 / _1065;
                float _1073 = _1061 * _1071;
                float _1075 = fma(_1073, _1069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1017 = _1075;
                _1047 = true;
            }
            else
            {
                _1017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1047 = false;
    float _1077 = _1017;
    float _1079 = _803 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1083 = _915 + _1081;
    float _1085 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1079);
    float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1089 = _909 + _1087;
    bool _1091 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.5);
    bool _1099 = _1095 || _1097;
    float _1101 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1103 = _803 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1105 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    float _1115 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1119 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1121 = fma(_1089, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1123 = 1.0 / _1117;
    float _1125 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1119);
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1131 = _1077;
    float _1133 = _1121;
    if (_1113)
    {
        _1129 = 1.0;
    }
    float _1135 = _1129;
    float _1137 = _1127 + _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1141 = _917 + _1139;
    float _1143 = fma(_1141, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1145 = _1141;
    float _1147 = _1135;
    if (_1099)
    {
        _1131 = _1115;
    }
    float _1149 = _1131;
    float _1151 = _1137 * _1123;
    float _1153 = _1151 * 0.5;
    float _1155 = _1153;
    float _1157 = _1149;
    if (_1099)
    {
        _1145 = _1121;
    }
    float _1159 = _1145;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1161);
    float _1165 = _1159;
    if (_1099)
    {
        _1155 = _1143;
    }
    float _1167 = _1155;
    float _1169 = 1.0 / _1163;
    float _1171 = _1167;
    if (!_1099)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _803 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _603 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = _1175 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _643 + _1185;
        float _1189 = fma(_1179, _1179, _1183);
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1193 = fma(_1187, _1187, _1189);
        float _1195 = sqrt(_1193);
        float _1197 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1199 = precise::min(_1195, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1201 = _1199 * _1191;
        float _1203 = -_603;
        float _1205 = _1203 + _1115;
        float _1207 = -_643;
        float _1209 = _1207 + _1143;
        float _1211 = _1197 * _1201;
        float _1213 = -_803;
        float _1215 = _1213 + _1121;
        float _1217 = fma(_1205, _1211, _603);
        float _1219 = fma(_1215, _1211, _803);
        float _1221 = fma(_1209, _1211, _643);
        _1165 = _1219;
        _1157 = _1217;
        _1171 = _1221;
    }
    float _1223 = _1165;
    float _1225 = _1157;
    float _1227 = _1171;
    if (_1113)
    {
        _847 = 1.0;
    }
    float _1229 = _847;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1233 = _1169 * _1231;
    float _1235 = _1229;
    if (!_1113)
    {
        float _1237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = _1239 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1279 = fma(_1233, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        _1133 = _1247;
        _849 = _1267;
        _1147 = _1283;
    }
    float _1285 = _1133;
    float _1287 = _849;
    float _1289 = _1147;
    float _1291 = _1285;
    float _1293 = _1287;
    if (!_1113)
    {
        float _1295 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1297 = _1295 * 0.15915493667125701904296875;
        float _1299 = _1297 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = _1297 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = 1.0 / _1301;
        float _1313 = _1305 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = _1305 * 6.283185482025146484375;
        float _1321 = sin(_1319);
        float _1323 = _1315 * _1317;
        float _1325 = 1.0 / _1323;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1327;
        float _1331 = 1.0 / _1329;
        float _1333 = _1321 * _1325;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = fma(_1233, _1333, _1335);
        float _1339 = _1337 * _1331;
        float _1341 = precise::clamp(_1339, 0.0, 1.0);
        float _1343 = -_1341;
        float _1345 = _1343 + 1.0;
        _1291 = _1311;
        _1293 = _1323;
        _1235 = _1345;
    }
    float _1347 = _1291;
    float _1349 = _1293;
    float _1351 = _1235;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1355 = _1223 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1359 = _1225 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1227 + _1361;
    float _1365 = _1355 * _1355;
    float _1367 = fma(_1359, _1359, _1365);
    float _1369 = fma(_1363, _1363, _1367);
    float _1371 = rsqrt(_1369);
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1375 = _1359 * _1373;
    float _1377 = _1363 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = _1377 * _1377;
    float _1383 = _1379 + _1381;
    float _1385 = sqrt(_1383);
    bool _1387 = _1385 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1385 + _1389;
    float _1393 = _1371;
    float _1395 = _1349;
    float _1397 = _1391;
    float _1399 = _1347;
    float _1401 = _1355;
    float _1403 = _1375;
    if (_1387)
    {
        float _1405 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1405;
    }
    float _1407 = _1393;
    if (_1387)
    {
        float _1409 = rsqrt(_1383);
        _1395 = _1409;
    }
    float _1411 = _1395;
    float _1413 = _1411;
    if (_1387)
    {
        float _1415 = _1391 * _1407;
        _1397 = _1415;
    }
    float _1417 = _1397;
    if (_1387)
    {
        float _1419 = _1417 * 0.15915493667125701904296875;
        _1399 = _1419;
    }
    float _1421 = _1399;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1425 = _1363;
    if (_1387)
    {
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1435 = precise::max(0.0, _1433);
    float _1437 = _1407;
    float _1439 = _1435;
    if (_1387)
    {
        float _1441 = _1421 * 6.283185482025146484375;
        float _1443 = cos(_1441);
        _1437 = _1443;
    }
    float _1445 = _1437;
    float _1447 = -_1373;
    float _1449 = -_1435;
    float _1451 = fma(_1355, _1447, _1449);
    if (_1387)
    {
        float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1453;
    }
    float _1455 = _1401;
    float _1457 = sqrt(_1369);
    float _1459 = _1455;
    float _1461 = _1431;
    if (_1387)
    {
        float _1463 = fma(_1431, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = _1465;
    if (!_1387)
    {
        _1461 = _1377;
    }
    float _1469 = _1461;
    float _1471 = _1469;
    if (_1387)
    {
        float _1473 = _1445 + (-1.0);
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1387)
    {
        float _1479 = _1411 * _1465;
        _1011 = _1479;
    }
    float _1481 = _1011;
    if (!_1387)
    {
        _1413 = _1451;
    }
    float _1483 = _1413;
    float _1485 = _1483;
    if (_1387)
    {
        float _1487 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1387)
    {
        float _1493 = _1375 * _1481;
        _1403 = _1493;
    }
    float _1495 = _1403;
    if (!_1387)
    {
        _1467 = _1379;
    }
    float _1497 = _1467;
    float _1499 = _1497;
    if (_1387)
    {
        float _1501 = _1377 * _1481;
        _1471 = _1501;
    }
    float _1503 = _1471;
    if (_1387)
    {
        float _1505 = fma(_1451, _1445, _1489);
        _1485 = _1505;
    }
    float _1507 = _1485;
    if (_1387)
    {
        float _1509 = _1495 * _1495;
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1387)
    {
        _1491 = _1381;
    }
    float _1513 = _1491;
    float _1515 = _1513;
    if (_1387)
    {
        float _1517 = _1503 * _1503;
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = fma(_1507, _1507, _1511);
    float _1523 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = _1521 + _1519;
    float _1527 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1531 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    float _1535 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1537 = rsqrt(_1525);
    float _1539 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1527);
    float _1541 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1543 = -_1533;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1539);
    float _1549 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1551 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1541);
    float _1553 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1555 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1549);
    float _1557 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1551);
    float _1559 = abs(_1545);
    float _1561 = log2(_1559);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1555);
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1537 * _1495;
    float _1571 = -_1563;
    float _1573 = fma(_1571, _1423, 1.0);
    float _1575 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1535);
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1537 * _1507;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1537 * _1503;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1581);
    float _1591 = -_1583;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1591);
    float _1595 = log2(_1573);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1599 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1589);
    float _1601 = -_1585;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1593);
    float _1605 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1607 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1599);
    float _1611 = fma(_1603, -0.5, 0.5);
    float _1613 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1605);
    float _1615 = exp2(_1597);
    float _1617 = fma(_1603, 0.5, 0.5);
    float _1619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1607);
    float _1621 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1613);
    float _1623 = _1579 + 1.0;
    float _1625 = fma(_1617, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1629 = 1.0 / _1609;
    float _1631 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1619);
    float _1633 = fma(_1617, _1625, -0.212114393711090087890625);
    float _1635 = _1595 * 0.693147182464599609375;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1639 = fma(_1617, _1633, 1.570728778839111328125);
    float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1643 = sqrt(_1611);
    float _1645 = -_1579;
    float _1647 = fma(_1615, _1623, _1645);
    float _1649 = fma(_1647, 0.5, 0.5);
    float _1651 = _1627 * _1629;
    float _1653 = _1637 * _1629;
    float _1655 = fma(_1651, 0.5, 0.5);
    float _1657 = fma(_1653, -0.5, 0.5);
    float _1659 = _1643 * 0.636619746685028076171875;
    float _1661 = -_1639;
    float _1663 = fma(_1659, _1661, 1.0);
    float3 _4300 = float3(_1655, _1657, _1641);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4300, float3(0.0), isnan(_4300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4300, float3(0.0), isnan(_4300)), level(0.0)).x;
    float3 _4311 = float3(_1655, _1657, _1641);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4311, float3(0.0), isnan(_4311)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4311, float3(0.0), isnan(_4311)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4328 = float2(_1663, _1649);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4328, float2(0.0), isnan(_4328)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4328, float2(0.0), isnan(_4328)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1690 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1692 = _1289 * _1351;
    bool _1694 = _1289 > 0.0;
    bool _1696 = isnan(_1289);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    out.m_70.x = _1225;
    out.m_70.y = _1223;
    out.m_70.z = _1227;
    float _1704 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1690);
    float _1706 = exp2(_1688);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1710 = _1351 <= 0.0;
    bool _1712 = !_1702;
    bool _1714 = _1710 || _1712;
    float _1716 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1704);
    float _1718 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1716);
    float _1720 = _253 * _1708;
    float _1722 = _1718 + _1609;
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1637;
    out.gl_Position.z = _1718;
    out.gl_Position.w = _1609;
    float _1726 = _1722 * 0.5;
    float _1728 = -_1706;
    float _1730 = _1728 + 1.0;
    out.m_47.x = _1724;
    float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1726;
    out.m_72.w = _1609;
    float _1734 = -_1732;
    float _1736 = _1734 + 1.0;
    float _1738 = _1732 * _1665;
    float _1740 = _1676 * _1738;
    float _1742 = _1686 * _1738;
    float _1744 = fma(_1682, _1740, _1670);
    float _1746 = fma(_1684, _1740, _1672);
    float _1748 = _1676 * _1736;
    float _1750 = fma(_1676, _1742, _1674);
    out.m_74.x = _1744;
    out.m_74.y = _1746;
    out.m_74.z = _1750;
    out.m_74.w = _1748;
    if (!_1714)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1752;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1047 = false;
    bool _511 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_97)
    {
        float _105 = _101 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1808 = as_type<float>(_107);
        out.gl_Position.z = _1808;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_93);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_145);
        out.gl_Position.z = _1877;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_54.x;
    float _155 = _151 * _149;
    int _157 = as_type<int>(_147) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_147) & 2;
    bool _163 = _161 != 0;
    float _165 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    bool _167 = !_163;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    float _179 = _165 * 6.283185482025146484375;
    float _181 = floor(_165);
    float _183 = _179 * 0.15915493667125701904296875;
    bool _185 = !_159;
    float _187 = _185 ? (-0.5) : 0.5;
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    bool _193 = !_173;
    int _195 = _193 ? 0 : 1;
    float _197 = _183 * 6.283185482025146484375;
    float _199 = cos(_197);
    bool _201 = !_191;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_195);
    int _207 = abs(_203);
    float _209 = -_181;
    float _211 = _165 + _209;
    bool _213 = !_177;
    int _215 = _213 ? 0 : 1;
    float _217 = -_211;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_205);
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = fma(_199, 0.5, 0.5);
    int _227 = abs(_215);
    float _229 = abs(_219);
    float _231 = _221 * _229;
    float _233 = float(_207);
    bool _235 = _211 < 0.5;
    float _237 = float(_235);
    float _239 = -_225;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_227);
    float _249 = fma(_233, _241, _231);
    float _251 = abs(_245);
    float _253 = fma(_247, _251, _249);
    bool _255 = !_223;
    float _271;
    if (!_255)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _259 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _261 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _263 = _261 * _257;
        float _265 = floor(_263);
        float _267 = -_265;
        float _269 = _263 + _267;
        _271 = _269;
        _273 = true;
    }
    else
    {
        float _275 = float(_93);
        float _277 = 1.0 / _275;
        float _279 = _125 * _277;
        _271 = _279;
    }
    _273 = false;
    float _281 = _271;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = _281 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = _281 + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _281 + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _311 = 1.0 / _305;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _301;
    float _319 = _285 * _311;
    bool _321 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _323 = isnan(_281);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_331;
    float _335 = _333 + 1.0;
    float _337 = 1.0 / _309;
    float _339 = _289 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _281 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_347, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _351 = _293 * _317;
    bool _353 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_281);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _367 = isnan(_281);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _363 * _335;
    bool _379 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_281);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _343 * _337;
    float _393 = -_363;
    float _395 = _393 + 1.0;
    bool _397 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_281);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = _375 * _395;
    float _419 = -_375;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_411, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _429 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _431 = _389 * _421;
    float _433 = -_389;
    float _435 = _433 + 1.0;
    float _437 = -_407;
    float _439 = _437 + 1.0;
    float _441 = fma(_425, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _443 = _407 * _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _449;
    float _453 = _427 * _443;
    float _455 = _349 * _443;
    float _457 = fma(_447, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_451, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _455);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_429, _431, _461);
    float _475 = fma(_441, _431, _463);
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _481 = fma(_457, _417, _473);
    float _483 = fma(_459, _417, _475);
    float _485 = fma(_477, _377, _481);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].x, _485);
    float _491 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[147].y, _487);
    bool _493 = !_313;
    float _509;
    if (!_493)
    {
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _497 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_93);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = in.m_44.x;
    float _523 = in.m_44.y;
    float _525 = in.m_44.z;
    bool _527 = _153 > 0.5;
    float _529 = in.m_56.x;
    float _531 = in.m_56.y;
    float _533 = in.m_56.z;
    float _535 = in.m_56.w;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _543 = _541 != 0;
    float _545 = in.m_54.z;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _549 = _547 != 0;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _553 = _551 != 0;
    float _555 = in.m_58.x;
    float _557 = in.m_58.y;
    float _559 = in.m_58.z;
    float _561 = in.m_58.w;
    float _563 = -_187;
    int _565 = _527 ? as_type<int>(_563) : as_type<int>(_187);
    float _567 = in.m_60.x;
    float _569 = in.m_60.y;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = in.m_54.y;
    float _581 = in.m_54.w;
    float _583 = _523 * _531;
    bool _585 = _545 > 0.5;
    float _587 = fma(_521, _529, _583);
    float _589 = _523 * _557;
    float _591 = fma(_525, _533, _587);
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _595 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _597 = _489 * _567;
    float _599 = _491 * _569;
    float _601 = fma(_521, _555, _589);
    float _603 = _591 + _535;
    float _605 = _523 * _573;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _611 = fma(_525, _559, _601);
    bool _613 = _579 > 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _615;
    float _619 = fma(_521, _571, _605);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _623 = _607 * _593;
    bool _625 = _581 > 0.5;
    float _627 = fma(_525, _575, _619);
    float _629 = 1.0 / _617;
    float _631 = _609 * _621;
    float _633 = _623 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _641 = _519 + _639;
    float _643 = _611 + _561;
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _633);
    float _647 = 1.0 / _637;
    float _649 = _623 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[24].z, _645);
    float _653 = -_169;
    int _655 = _625 ? as_type<int>(_653) : as_type<int>(_169);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _657;
    float _661 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _649);
    float _663 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _665 = _623 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _667 = _641 * _629;
    float _669 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[26].z, _661);
    bool _671 = !_539;
    float _673 = _671 ? _187 : as_type<float>(_565);
    float _675 = _603 + _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _679 = _519 + _677;
    float _681 = _669 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _675 + _683;
    float _687 = _679 * _647;
    float _689 = _643 + _681;
    float _691 = -_187;
    int _693 = _585 ? as_type<int>(_691) : as_type<int>(_187);
    float _695 = _685 * _685;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _689 + _701;
    bool _705 = !_549;
    float _707 = _705 ? _187 : as_type<float>(_693);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -_169;
    int _715 = _613 ? as_type<int>(_713) : as_type<int>(_169);
    float _717 = _703 * _703;
    float _719 = fma(_699, _667, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _667, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _723 = !_543;
    float _725 = _723 ? _169 : as_type<float>(_715);
    float _727 = _695 + _717;
    bool _729 = !_553;
    float _731 = _729 ? _169 : as_type<float>(_655);
    float _733 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _735 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _737 = isnan(_519);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = sqrt(_727);
    bool _749 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _751 = isnan(_519);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _765 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _767 = isnan(_519);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _785 = fma(_631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _665);
    float _787 = -_745;
    float _789 = _787 + 1.0;
    float _791 = -_775;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _797 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[25].z, _785);
    float _799 = _775 * _789;
    float _801 = _759 * _793;
    float _803 = _627 + _577;
    float _805 = -_759;
    float _807 = _805 + 1.0;
    float _809 = _797 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _811 = _747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _815 = _719 * _801;
    float _817 = _721 * _801;
    float _819 = _733 * _801;
    float _821 = fma(_763, _687, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _823 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _815);
    float _825 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _827 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _819);
    float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _831 = _803 + _809;
    float _833 = fma(_779, _687, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _835 = fma(_783, _687, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _837 = _809;
    float _839 = _797;
    float _841 = _695;
    float _843 = _717;
    float _845 = _675;
    float _847 = _803;
    float _849 = _643;
    if (!_811)
    {
        _837 = _689;
    }
    float _851 = _837;
    float _853 = _851;
    if (!_811)
    {
        _839 = _831;
    }
    float _855 = _839;
    bool _857 = !_811;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _747 + _863;
        float _867 = _831 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_727);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = sin(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = cos(_879);
        float _883 = fma(_877, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _885 = _869 * _883;
        float _887 = _881 + (-1.0);
        float _889 = fma(_685, _885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _891 = fma(_703, _885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _893 = _887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _897 = _889 + _895;
        float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _901 = _891 + _899;
        float _903 = fma(_831, _881, _893);
        float _905 = _897 * _897;
        float _907 = _901 * _901;
        _859 = _903;
        _841 = _905;
        _843 = _907;
        _845 = _889;
        _853 = _891;
    }
    float _909 = _859;
    float _911 = _841;
    float _913 = _843;
    float _915 = _845;
    float _917 = _853;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _921 = _909 + _919;
    float _923 = fma(_821, _799, _823);
    float _925 = fma(_833, _799, _825);
    float _927 = fma(_835, _799, _827);
    float _929 = fma(_921, _921, _911);
    float _931 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].x, _923);
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _935 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].y, _925);
    float _937 = _929 + _913;
    float _939 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[109].z, _927);
    float _941 = _673 + 0.5;
    float _943 = -_725;
    float _945 = _943 + 0.5;
    float _947 = _707 + 0.5;
    float _949 = -_731;
    float _951 = _949 + 0.5;
    float _953 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = sqrt(_937);
    float _957 = _945 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _959 = _931 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _947 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _935 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _973 = _939 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _975 = _953 * _795;
    float _977 = _957 * _813;
    float _979 = _961 * _829;
    float _981 = _963 * _933;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _989 = _967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _997 = _973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _975;
    out.m_64.y = _977;
    out.m_64.z = _979;
    out.m_64.w = _981;
    bool _999 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1001 = isnan(_955);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1007 = _1003 || _1005;
    out.m_66.x = _987;
    out.m_66.y = _989;
    out.m_66.z = _991;
    out.m_66.w = _985;
    out.m_68.x = _993;
    out.m_68.y = _995;
    out.m_68.z = _997;
    out.m_68.w = _983;
    float _1009 = _957;
    float _1011 = _987;
    if (!_1007)
    {
        _1009 = 1.0;
    }
    float _1013 = _1009;
    bool _1015 = !_1007;
    float _1017 = _1013;
    if (!_1015)
    {
        bool _1019 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1021 = isnan(_955);
        bool _1023 = _1019 || _1021;
        bool _1025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1027 = _1023 || _1025;
        if (!_1027)
        {
            float _1029 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1031 = _955 + _1029;
            float _1033 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1035 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1033;
            float _1037 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1039 = _1037 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1041 = 1.0 / _1035;
            float _1043 = _1031 * _1041;
            float _1045 = fma(_1043, _1039, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1017 = _1045;
            _1047 = true;
        }
        else
        {
            bool _1049 = _955 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1051 = isnan(_955);
            bool _1053 = _1049 || _1051;
            bool _1055 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1057 = _1053 || _1055;
            if (!_1057)
            {
                float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1061 = _955 + _1059;
                float _1063 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1065 = _1063 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1067 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1069 = _1067 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1071 = 1.0 / _1065;
                float _1073 = _1061 * _1071;
                float _1075 = fma(_1073, _1069, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1017 = _1075;
                _1047 = true;
            }
            else
            {
                _1017 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1047 = false;
    float _1077 = _1017;
    float _1079 = _803 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1083 = _915 + _1081;
    float _1085 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1079);
    float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1089 = _909 + _1087;
    bool _1091 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan(0.5);
    bool _1099 = _1095 || _1097;
    float _1101 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1085);
    float _1103 = _803 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1105 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.5);
    bool _1113 = _1109 || _1111;
    float _1115 = fma(_1083, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1119 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    float _1121 = fma(_1089, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1123 = 1.0 / _1117;
    float _1125 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1119);
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1131 = _1077;
    float _1133 = _1121;
    if (_1113)
    {
        _1129 = 1.0;
    }
    float _1135 = _1129;
    float _1137 = _1127 + _1117;
    float _1139 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1141 = _917 + _1139;
    float _1143 = fma(_1141, _1077, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1145 = _1141;
    float _1147 = _1135;
    if (_1099)
    {
        _1131 = _1115;
    }
    float _1149 = _1131;
    float _1151 = _1137 * _1123;
    float _1153 = _1151 * 0.5;
    float _1155 = _1153;
    float _1157 = _1149;
    if (_1099)
    {
        _1145 = _1121;
    }
    float _1159 = _1145;
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1161);
    float _1165 = _1159;
    if (_1099)
    {
        _1155 = _1143;
    }
    float _1167 = _1155;
    float _1169 = 1.0 / _1163;
    float _1171 = _1167;
    if (!_1099)
    {
        float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1175 = _803 + _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1179 = _603 + _1177;
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1183 = _1175 * _1175;
        float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1187 = _643 + _1185;
        float _1189 = fma(_1179, _1179, _1183);
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1193 = fma(_1187, _1187, _1189);
        float _1195 = sqrt(_1193);
        float _1197 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1199 = precise::min(_1195, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1201 = _1199 * _1191;
        float _1203 = -_603;
        float _1205 = _1203 + _1115;
        float _1207 = -_643;
        float _1209 = _1207 + _1143;
        float _1211 = _1197 * _1201;
        float _1213 = -_803;
        float _1215 = _1213 + _1121;
        float _1217 = fma(_1205, _1211, _603);
        float _1219 = fma(_1215, _1211, _803);
        float _1221 = fma(_1209, _1211, _643);
        _1165 = _1219;
        _1157 = _1217;
        _1171 = _1221;
    }
    float _1223 = _1165;
    float _1225 = _1157;
    float _1227 = _1171;
    if (_1113)
    {
        _847 = 1.0;
    }
    float _1229 = _847;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1233 = _1169 * _1231;
    float _1235 = _1229;
    if (!_1113)
    {
        float _1237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1239 = _1237 * 0.15915493667125701904296875;
        float _1241 = _1239 * 6.283185482025146484375;
        float _1243 = cos(_1241);
        float _1245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = _1239 * 6.283185482025146484375;
        float _1251 = sin(_1249);
        float _1253 = 1.0 / _1243;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1251 * _1253;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = _1257 * _1259;
        float _1267 = 1.0 / _1265;
        float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1271 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1269;
        float _1273 = 1.0 / _1271;
        float _1275 = _1263 * _1267;
        float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1279 = fma(_1233, _1275, _1277);
        float _1281 = _1279 * _1273;
        float _1283 = precise::clamp(_1281, 0.0, 1.0);
        _1133 = _1247;
        _849 = _1267;
        _1147 = _1283;
    }
    float _1285 = _1133;
    float _1287 = _849;
    float _1289 = _1147;
    float _1291 = _1285;
    float _1293 = _1287;
    if (!_1113)
    {
        float _1295 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1297 = _1295 * 0.15915493667125701904296875;
        float _1299 = _1297 * 6.283185482025146484375;
        float _1301 = cos(_1299);
        float _1303 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = _1297 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = 1.0 / _1301;
        float _1313 = _1305 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1309 * _1311;
        float _1319 = _1305 * 6.283185482025146484375;
        float _1321 = sin(_1319);
        float _1323 = _1315 * _1317;
        float _1325 = 1.0 / _1323;
        float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1329 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1327;
        float _1331 = 1.0 / _1329;
        float _1333 = _1321 * _1325;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = fma(_1233, _1333, _1335);
        float _1339 = _1337 * _1331;
        float _1341 = precise::clamp(_1339, 0.0, 1.0);
        float _1343 = -_1341;
        float _1345 = _1343 + 1.0;
        _1291 = _1311;
        _1293 = _1323;
        _1235 = _1345;
    }
    float _1347 = _1291;
    float _1349 = _1293;
    float _1351 = _1235;
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1355 = _1223 + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1359 = _1225 + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1363 = _1227 + _1361;
    float _1365 = _1355 * _1355;
    float _1367 = fma(_1359, _1359, _1365);
    float _1369 = fma(_1363, _1363, _1367);
    float _1371 = rsqrt(_1369);
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1375 = _1359 * _1373;
    float _1377 = _1363 * _1373;
    float _1379 = _1375 * _1375;
    float _1381 = _1377 * _1377;
    float _1383 = _1379 + _1381;
    float _1385 = sqrt(_1383);
    bool _1387 = _1385 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1385 + _1389;
    float _1393 = _1371;
    float _1395 = _1349;
    float _1397 = _1391;
    float _1399 = _1347;
    float _1401 = _1355;
    float _1403 = _1375;
    if (_1387)
    {
        float _1405 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1393 = _1405;
    }
    float _1407 = _1393;
    if (_1387)
    {
        float _1409 = rsqrt(_1383);
        _1395 = _1409;
    }
    float _1411 = _1395;
    float _1413 = _1411;
    if (_1387)
    {
        float _1415 = _1391 * _1407;
        _1397 = _1415;
    }
    float _1417 = _1397;
    if (_1387)
    {
        float _1419 = _1417 * 0.15915493667125701904296875;
        _1399 = _1419;
    }
    float _1421 = _1399;
    float _1423 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1425 = _1363;
    if (_1387)
    {
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1435 = precise::max(0.0, _1433);
    float _1437 = _1407;
    float _1439 = _1435;
    if (_1387)
    {
        float _1441 = _1421 * 6.283185482025146484375;
        float _1443 = cos(_1441);
        _1437 = _1443;
    }
    float _1445 = _1437;
    float _1447 = -_1373;
    float _1449 = -_1435;
    float _1451 = fma(_1355, _1447, _1449);
    if (_1387)
    {
        float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1453;
    }
    float _1455 = _1401;
    float _1457 = sqrt(_1369);
    float _1459 = _1455;
    float _1461 = _1431;
    if (_1387)
    {
        float _1463 = fma(_1431, _1455, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = _1465;
    if (!_1387)
    {
        _1461 = _1377;
    }
    float _1469 = _1461;
    float _1471 = _1469;
    if (_1387)
    {
        float _1473 = _1445 + (-1.0);
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = _1475;
    if (_1387)
    {
        float _1479 = _1411 * _1465;
        _1011 = _1479;
    }
    float _1481 = _1011;
    if (!_1387)
    {
        _1413 = _1451;
    }
    float _1483 = _1413;
    float _1485 = _1483;
    if (_1387)
    {
        float _1487 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1487;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (_1387)
    {
        float _1493 = _1375 * _1481;
        _1403 = _1493;
    }
    float _1495 = _1403;
    if (!_1387)
    {
        _1467 = _1379;
    }
    float _1497 = _1467;
    float _1499 = _1497;
    if (_1387)
    {
        float _1501 = _1377 * _1481;
        _1471 = _1501;
    }
    float _1503 = _1471;
    if (_1387)
    {
        float _1505 = fma(_1451, _1445, _1489);
        _1485 = _1505;
    }
    float _1507 = _1485;
    if (_1387)
    {
        float _1509 = _1495 * _1495;
        _1499 = _1509;
    }
    float _1511 = _1499;
    if (!_1387)
    {
        _1491 = _1381;
    }
    float _1513 = _1491;
    float _1515 = _1513;
    if (_1387)
    {
        float _1517 = _1503 * _1503;
        _1515 = _1517;
    }
    float _1519 = _1515;
    float _1521 = fma(_1507, _1507, _1511);
    float _1523 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1525 = _1521 + _1519;
    float _1527 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1531 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    float _1535 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1523);
    float _1537 = rsqrt(_1525);
    float _1539 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1527);
    float _1541 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1543 = -_1533;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1539);
    float _1549 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1551 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1541);
    float _1553 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1555 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1549);
    float _1557 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1551);
    float _1559 = abs(_1545);
    float _1561 = log2(_1559);
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1565 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1555);
    float _1567 = _1557 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1537 * _1495;
    float _1571 = -_1563;
    float _1573 = fma(_1571, _1423, 1.0);
    float _1575 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1535);
    float _1577 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1537 * _1507;
    float _1581 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1583 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1585 = _1537 * _1503;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1581);
    float _1591 = -_1583;
    float _1593 = fma(_1579, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1591);
    float _1595 = log2(_1573);
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1599 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1589);
    float _1601 = -_1585;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1593);
    float _1605 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1607 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1599);
    float _1611 = fma(_1603, -0.5, 0.5);
    float _1613 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1605);
    float _1615 = exp2(_1597);
    float _1617 = fma(_1603, 0.5, 0.5);
    float _1619 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1607);
    float _1621 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1613);
    float _1623 = _1579 + 1.0;
    float _1625 = fma(_1617, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1627 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1621);
    float _1629 = 1.0 / _1609;
    float _1631 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1619);
    float _1633 = fma(_1617, _1625, -0.212114393711090087890625);
    float _1635 = _1595 * 0.693147182464599609375;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1639 = fma(_1617, _1633, 1.570728778839111328125);
    float _1641 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1643 = sqrt(_1611);
    float _1645 = -_1579;
    float _1647 = fma(_1615, _1623, _1645);
    float _1649 = fma(_1647, 0.5, 0.5);
    float _1651 = _1627 * _1629;
    float _1653 = _1637 * _1629;
    float _1655 = fma(_1651, 0.5, 0.5);
    float _1657 = fma(_1653, -0.5, 0.5);
    float _1659 = _1643 * 0.636619746685028076171875;
    float _1661 = -_1639;
    float _1663 = fma(_1659, _1661, 1.0);
    float3 _4300 = float3(_1655, _1657, _1641);
    float _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4300, float3(0.0), isnan(_4300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4300, float3(0.0), isnan(_4300)), level(0.0)).x;
    float3 _4311 = float3(_1655, _1657, _1641);
    float4 _1668 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4311, float3(0.0), isnan(_4311)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4311, float3(0.0), isnan(_4311)), level(0.0)).xyzw;
    float _1670 = _1668.x;
    float _1672 = _1668.y;
    float _1674 = _1668.z;
    float _1676 = _1668.w;
    float2 _4328 = float2(_1663, _1649);
    float3 _1680 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4328, float2(0.0), isnan(_4328)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4328, float2(0.0), isnan(_4328)), level(0.0)).xyz;
    float _1682 = _1680.x;
    float _1684 = _1680.y;
    float _1686 = _1680.z;
    float _1688 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1690 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1692 = _1289 * _1351;
    bool _1694 = _1289 > 0.0;
    bool _1696 = isnan(_1289);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    out.m_70.x = _1225;
    out.m_70.y = _1223;
    out.m_70.z = _1227;
    float _1704 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1690);
    float _1706 = exp2(_1688);
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1710 = _1351 <= 0.0;
    bool _1712 = !_1702;
    bool _1714 = _1710 || _1712;
    float _1716 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1704);
    float _1718 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1716);
    float _1720 = _253 * _1708;
    float _1722 = _1718 + _1609;
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1637;
    out.gl_Position.z = _1718;
    out.gl_Position.w = _1609;
    float _1726 = _1722 * 0.5;
    float _1728 = -_1706;
    float _1730 = _1728 + 1.0;
    out.m_47.x = _1724;
    float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1726;
    out.m_72.w = _1609;
    float _1734 = -_1732;
    float _1736 = _1734 + 1.0;
    float _1738 = _1732 * _1665;
    float _1740 = _1676 * _1738;
    float _1742 = _1686 * _1738;
    float _1744 = fma(_1682, _1740, _1670);
    float _1746 = fma(_1684, _1740, _1672);
    float _1748 = _1676 * _1736;
    float _1750 = fma(_1676, _1742, _1674);
    out.m_74.x = _1744;
    out.m_74.y = _1746;
    out.m_74.z = _1750;
    out.m_74.w = _1748;
    if (!_1714)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1752 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1752;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

