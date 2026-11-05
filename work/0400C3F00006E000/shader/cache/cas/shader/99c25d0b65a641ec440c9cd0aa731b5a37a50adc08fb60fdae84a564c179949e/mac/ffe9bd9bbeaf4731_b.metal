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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_107);
        out.gl_Position.z = _2016;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2085 = as_type<float>(_145);
        out.gl_Position.z = _2085;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _219 * _227;
    int _231 = abs(_225);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _209 < 0.5;
    float _239 = float(_237);
    float _241 = float(_211);
    float _243 = float(_231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = fma(_241, _235, _229);
    float _251 = abs(_247);
    float _253 = fma(_243, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_49.y;
    float _525 = _147 * 2.0;
    float _527 = in.m_42.x;
    float _529 = in.m_42.y;
    float _531 = in.m_42.z;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = in.m_54.x;
    float _539 = in.m_54.y;
    float _541 = in.m_54.z;
    float _543 = in.m_54.w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _549 = 1.0 / _535;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = in.m_56.x;
    float _573 = in.m_56.y;
    float _575 = in.m_56.z;
    float _577 = in.m_56.w;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    float _583 = floor(_525);
    float _585 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _587 = in.m_58.x;
    float _589 = in.m_58.y;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _523 * 2.0;
    float _597 = _585 * _147;
    float _599 = 1.0 / _547;
    float _601 = in.m_49.z;
    float _603 = _529 * _539;
    float _605 = floor(_595);
    bool _607 = _583 >= 0.0;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_527, _537, _603);
    bool _619 = _583 > 0.0;
    float _621 = _529 * _573;
    int _623 = _615 ? 0 : 1;
    float _625 = fma(_531, _541, _617);
    float _627 = trunc(_597);
    int _629 = int(_627);
    float _631 = fma(_527, _571, _621);
    float _633 = _529 * _589;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _625 + _543;
    float _641 = fma(_527, _587, _633);
    float _643 = 1.0 / _565;
    bool _645 = _605 >= 0.0;
    bool _647 = isnan(_605);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = fma(_531, _591, _641);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = _147 + _523;
    float _667 = _655 + _593;
    float _669 = _659 * _599;
    int _671 = _629 << 4;
    int _673 = _671 + 1968;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = fma(_531, _575, _631);
    float _681 = _601 * 2.0;
    float _683 = _523 + _601;
    float _685 = _663 * _549;
    uint _688 = uint(int(uint(_673) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[int(_698)][_700];
    float _704 = _637 * _643;
    int _706 = _653 ? 0 : 1;
    float _708 = floor(_681);
    bool _710 = _605 > 0.0;
    float _712 = _665 + (-1.0);
    float _714 = _683 + (-1.0);
    int _716 = _673 + 8;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _728 = _677 * _125;
    float _730 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _521 + _732;
    int _736 = ~_623;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = exp2(_728);
    int _744 = ~_706;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _521 + _750;
    int _754 = _740;
    int _756 = _748;
    if (!_619)
    {
        int _758 = ~_623;
        int _760 = _758 + 1;
        _754 = _760;
    }
    int _762 = _754;
    if (!_710)
    {
        int _764 = ~_706;
        int _766 = _764 + 1;
        _756 = _766;
    }
    int _768 = _756;
    float _770 = fma(_669, _752, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _772 = _708 >= 0.0;
    bool _774 = isnan(_708);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _679 + _577;
    bool _784 = _708 > 0.0;
    float _786 = fma(_685, _734, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _788 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_521);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _802 = _780 ? 0 : 1;
    bool _804 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = -_742;
    float _816 = _814 + 1.0;
    bool _818 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = isnan(_521);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_798;
    float _832 = _830 + 1.0;
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _812 ? _816 : 0.0;
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _828 * _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _521 + _854;
    int _858 = ~_802;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = _844 * _850;
    bool _866 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _868 = isnan(_521);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_844;
    float _880 = _878 + 1.0;
    int _882 = _862;
    if (!_784)
    {
        int _884 = ~_802;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = fma(_704, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _892 = _147 > 0.5;
    float _894 = _876 * _880;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _902 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _904 = _786 * _894;
    bool _906 = !_557;
    int _908 = _906 ? 0 : 1;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    int _916 = abs(_908);
    float _918 = _724 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _920 = -_195;
    int _922 = _892 ? as_type<int>(_920) : as_type<int>(_195);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _926 = _523 > 0.5;
    float _928 = fma(_770, _864, _914);
    bool _930 = !_569;
    float _932 = _930 ? _195 : as_type<float>(_922);
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = -_175;
    int _938 = _926 ? as_type<int>(_936) : as_type<int>(_175);
    float _940 = fma(_890, _852, _928);
    float _942 = float(_916);
    float _944 = _932 + 0.5;
    bool _946 = !_581;
    float _948 = _946 ? _175 : as_type<float>(_938);
    out.m_60.x = _910;
    out.m_60.y = _912;
    out.m_60.z = _934;
    float _950 = float(_762);
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _954 = !_553;
    int _956 = _954 ? 0 : 1;
    float _958 = -_948;
    float _960 = _958 + 0.5;
    float _962 = float(_888);
    float _964 = _952 * _800;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _968 = _782 + _966;
    float _970 = _942 * _950;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _974 = abs(_956);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _639 + _976;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _982 = _972 * _924;
    float _984 = float(_974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _667 + _986;
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].x, _980);
    float _992 = _970 * (-2.0);
    float _994 = in.m_62.x;
    float _996 = in.m_62.y;
    float _998 = in.m_62.z;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1002 = _984 * _962;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _940);
    float _1010 = _968 * _968;
    bool _1012 = _1000 >= 0.0;
    out.m_64.x = _964;
    out.m_64.y = _982;
    float _1014 = fma(_978, _978, _1010);
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_730, _992, _730);
    bool _1020 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1022 = isnan(1.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1028 = _1024 || _1026;
    float _1030 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1032 = fma(_988, _988, _1014);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = _523 + (-0.5);
    float _1040 = _1002 * (-2.0);
    float _1042 = rsqrt(_1032);
    float _1044 = _1002;
    if (_1012)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1046 = _1044;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1054 = as_type<int>(_1046);
    if (_1028)
    {
        float _1056 = _846 * _1016;
        _129 = _1056;
    }
    float _1058 = _129;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1012)
    {
        float _1062 = _1046 * 5.0;
        _1054 = as_type<int>(_1062);
    }
    int _1064 = _1054;
    float _1066 = fma(_992, _996, _996);
    float _1068 = _147 + (-0.5);
    float _1070 = fma(_1040, _994, _994);
    out.m_66.x = _1060;
    out.m_66.y = _1050;
    out.m_66.z = _1052;
    out.m_66.w = _1030;
    float _1072 = fma(_726, _1040, _726);
    float _1074 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1066);
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1070);
    if (_1012)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3506 = as_type<float>(_1064);
        out.gl_Position.z = _3506;
    }
    bool _1078 = !_561;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = _968 * _1042;
    float _1084 = _978 * _1042;
    if (_1012)
    {
        out.m_45.x = 0.0;
    }
    if (_1012)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1086 = -_1082;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _1090 = _988 * _1042;
    float _1092 = -_1084;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1096 = fma(_1018, _1058, _1074);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _1088 + _1098;
    float _1102 = -_1090;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1108 = _1094 + _1106;
    float _1110 = _1096 * 0.15915493667125701904296875;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1114 = abs(_1080);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1104 + _1116;
    float _1120 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1112);
    float _1122 = float(_1114);
    float _1124 = fma(_1072, _1058, _1076);
    float _1126 = float(_768);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1120);
    float _1130 = _1110 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = -_1082;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1140 = _1122 * _1126;
    bool _1142 = _1128 >= 0.0;
    float _1144 = _147 + _601;
    float _1146 = in.m_68.x;
    float _1148 = in.m_68.y;
    float _1150 = _1140 * (-2.0);
    float _1152 = _1110 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1144 + (-1.0);
    float _1158 = -_1084;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1162 = _1138 * _1138;
    float _1164 = -_1090;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1170 = _601 + (-0.5);
    float _1172 = fma(_1160, _1160, _1162);
    float _1174 = _1134 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1150, _998, _998);
    float _1180 = fma(_1168, _1150, _1168);
    float _1182 = fma(_1166, _1166, _1172);
    float _1184 = _1160;
    int _1186 = as_type<int>(_1180);
    float _1188 = _1104;
    if (_1142)
    {
        _1184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1178);
    if (_1142)
    {
        out.m_45.x = 0.0;
    }
    float _1194 = _1134 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = fma(_1180, _1058, _1192);
    if (_1142)
    {
        float _1200 = _1190 * 5.0;
        _1186 = as_type<int>(_1200);
    }
    int _1202 = _1186;
    float _1204 = _1198 * 0.15915493667125701904296875;
    float _1206 = _493 * _1148;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3722 = as_type<float>(_1202);
        out.gl_Position.z = _3722;
    }
    float _1208 = sqrt(_1182);
    float _1210 = _1204 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1154;
    if (_1142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1216 = _253 * _1206;
    float _1218 = _1042 * _1208;
    float _1220 = _1204 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _491 * _1146;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1234 = _1232 * 0.5;
    float _1236 = _1218 * _1226;
    float _1238 = _253 * _1224;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = _1228 * _1236;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1254 = _1176 * _1132;
    float _1256 = _1196 * _1154;
    float _1258 = _1218 * _1252;
    float _1260 = _1222 * _1250;
    float _1262 = _1196 * _1132;
    float _1264 = _1132 * _1222;
    float _1266 = _1230 * _1258;
    float _1268 = _1154 * _1222;
    float _1270 = fma(_1212, _1256, _1254);
    float _1272 = _1196 * _1260;
    float _1274 = _1176 * _1154;
    float _1276 = -_1250;
    float _1278 = _1212 * _1276;
    float _1280 = _1176 * _1260;
    float _1282 = fma(_1270, _1266, _1272);
    float _1284 = -_1274;
    float _1286 = fma(_1212, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1212, _1274, _1288);
    float _1292 = fma(_1268, _1266, _1278);
    float _1294 = fma(_1212, _1254, _1256);
    float _1296 = fma(_1286, _1234, _1282);
    float _1298 = fma(_1290, _1266, _1280);
    float _1300 = fma(_1264, _1234, _1292);
    float _1302 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = fma(_1294, _1234, _1298);
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1308);
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1312);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1326 = _667 + _1322;
    float _1328 = _639 + _1324;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1326 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1328 + _1334;
    float _1338 = _1332 * _1332;
    float _1340 = fma(_1336, _1336, _1338);
    float _1342 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1344 = sqrt(_1340);
    float _1346 = _782 + _1342;
    bool _1348 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1304;
    float _1352 = _1342;
    float _1354 = _1266;
    if (!_1348)
    {
        _1350 = _1328;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    if (!_1348)
    {
        _1352 = _1326;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (!_1348)
    {
        _1354 = _1346;
    }
    float _1364 = _1354;
    bool _1366 = !_1348;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1344 + _1372;
        float _1376 = rsqrt(_1340);
        float _1378 = _1374 * _1370;
        float _1380 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1346, _1386, _1394);
        float _1400 = _1376 * _1396;
        float _1402 = fma(_1336, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1332, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1358 = _1402;
        _1368 = _1398;
        _1362 = _1404;
    }
    float _1406 = _1358;
    float _1408 = _1368;
    float _1410 = _1362;
    float _1412 = -_1084;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1416 = -_1082;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -_1090;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1424 = _1418;
    float _1426 = _1414;
    float _1428 = _1422;
    float _1430 = _1408;
    if (!_1248)
    {
        float _1432 = _1100 * _1100;
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = -_667;
        float _1438 = _1436 + _1410;
        float _1440 = -_639;
        float _1442 = _1440 + _1406;
        float _1444 = fma(_1108, _1108, _1432);
        float _1446 = fma(_1118, _1118, _1444);
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = sqrt(_1446);
        float _1452 = 1.0 / _1218;
        float _1454 = precise::min(_1450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1456 = _1454 * _1434;
        float _1458 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = -_782;
        float _1462 = _1460 + _1408;
        float _1464 = _1456 * _1452;
        float _1466 = _1458 * _1464;
        float _1468 = _1438 * _1464;
        float _1470 = fma(_1442, _1466, _1094);
        float _1472 = fma(_1462, _1466, _1088);
        float _1474 = fma(_1458, _1468, _1104);
        _1424 = _1472;
        _1426 = _1470;
        _1428 = _1474;
    }
    float _1476 = _1424;
    float _1478 = _1426;
    float _1480 = _1428;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1476 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1496 = _1484 * _1484;
    float _1498 = fma(_1488, _1488, _1496);
    float _1500 = fma(_1492, _1492, _1498);
    float _1502 = rsqrt(_1500);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1498;
    float _1528 = _1522;
    float _1530 = _1506;
    if (_1518)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1532;
    }
    float _1534 = _1524;
    if (_1518)
    {
        float _1536 = rsqrt(_1514);
        _1526 = _1536;
    }
    float _1538 = _1526;
    float _1540 = _1538;
    if (_1518)
    {
        float _1542 = _1522 * _1534;
        _1528 = _1542;
    }
    float _1544 = _1528;
    if (_1518)
    {
        float _1546 = _1544 * 0.15915493667125701904296875;
        _1430 = _1546;
    }
    float _1548 = _1430;
    float _1550 = _1502;
    float _1552 = _1548;
    if (_1518)
    {
        float _1554 = _1548 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1550 = _1556;
    }
    float _1558 = _1550;
    float _1560 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1562 = precise::max(0.0, _1560);
    float _1564 = _1308;
    float _1566 = _1562;
    float _1568 = _1560;
    if (_1518)
    {
        float _1570 = _1548 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1564 = _1572;
    }
    float _1574 = _1564;
    float _1576 = -_1504;
    float _1578 = -_1562;
    float _1580 = fma(_1484, _1576, _1578);
    if (!_1518)
    {
        _1566 = _1508;
    }
    float _1582 = _1566;
    float _1584 = _1582;
    if (_1518)
    {
        float _1586 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    float _1590 = sqrt(_1500);
    float _1592 = _1558;
    float _1594 = _1588;
    if (_1518)
    {
        float _1596 = fma(_1558, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1574 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1538 * _1598;
        _1214 = _1608;
    }
    float _1610 = _1214;
    if (!_1518)
    {
        _1540 = _1580;
    }
    float _1612 = _1540;
    float _1614 = _1612;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1616;
    }
    float _1618 = _1552;
    if (_1518)
    {
        float _1620 = _1506 * _1610;
        _1530 = _1620;
    }
    float _1622 = _1530;
    if (!_1518)
    {
        _1600 = _1510;
    }
    float _1624 = _1600;
    float _1626 = _1624;
    if (_1518)
    {
        float _1628 = _1508 * _1610;
        _1584 = _1628;
    }
    float _1630 = _1584;
    if (_1518)
    {
        float _1632 = fma(_1580, _1574, _1618);
        _1614 = _1632;
    }
    float _1634 = _1614;
    if (_1518)
    {
        float _1636 = _1622 * _1622;
        _1626 = _1636;
    }
    float _1638 = _1626;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1518)
    {
        float _1644 = _1630 * _1630;
        _1642 = _1644;
    }
    float _1646 = _1642;
    float _1648 = fma(_1634, _1634, _1638);
    float _1650 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1652 = _1648 + _1646;
    float _1654 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1656 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    float _1658 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = rsqrt(_1652);
    float _1662 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1654);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1672 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1682 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1698 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1700 = _1660 * _1622;
    float _1702 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1660 * _1634;
    float _1706 = _1660 * _1630;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1714 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = -_1708;
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1494, 1.0);
    float _1724 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1728 = -_1706;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1718);
    float _1732 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1734 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1736 = log2(_1722);
    float _1738 = fma(_1730, -0.5, 0.5);
    float _1740 = fma(_1730, 0.5, 0.5);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1744 = _1704 + 1.0;
    float _1746 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1742);
    float _1748 = exp2(_1732);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1752 = 1.0 / _1726;
    float _1754 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1734);
    float _1756 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1758 = _1736 * 0.693147182464599609375;
    float _1760 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1762 = fma(_1740, _1756, -0.212114393711090087890625);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1760);
    float _1770 = -_1704;
    float _1772 = fma(_1748, _1744, _1770);
    float _1774 = fma(_1740, _1762, 1.570728778839111328125);
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = _1750 * _1752;
    float _1780 = _1768 * _1752;
    float _1782 = fma(_1778, 0.5, 0.5);
    float _1784 = fma(_1780, -0.5, 0.5);
    float _1786 = _1766 * 0.636619746685028076171875;
    float3 _4674 = float3(_1782, _1784, _1764);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).x;
    float _1790 = -_1774;
    float _1792 = fma(_1786, _1790, 1.0);
    float3 _4690 = float3(_1782, _1784, _1764);
    float4 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4690, float3(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4690, float3(0.0), isnan(_4690)), level(0.0)).xyzw;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1795.w;
    float2 _4707 = float2(_1792, _1776);
    float3 _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4707, float2(0.0), isnan(_4707)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4707, float2(0.0), isnan(_4707)), level(0.0)).xyz;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1817 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1821 = isnan(0.5);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1827 = _1823 || _1825;
    float _1829 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1815);
    float _1831 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    float _1833 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1829);
    float _1835 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1831);
    float _1837 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1839 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1827)
    {
        _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1843 = _1188;
    float _1845 = 1.0 / _1837;
    float _1847 = _1839 + _1837;
    float _1849 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1851 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1849);
    float _1853 = exp2(_1841);
    float _1855 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1857 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1855);
    float _1859 = _1847 * _1845;
    float _1861 = _1859 * 0.5;
    float _1863 = _1845;
    float _1865 = _1861;
    float _1867 = _1843;
    if (!_1827)
    {
        _1863 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1869 = _1863;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1768;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1726;
    float _1871 = _1869;
    if (!_1827)
    {
        float _1873 = -_1843;
        float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1827)
    {
        _1867 = 1.0;
    }
    float _1879 = _1867;
    float _1881 = _1879;
    if (!_1827)
    {
        float _1883 = -_1869;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1885;
    }
    float _1887 = _257;
    float _1889 = _1877;
    if (!_1827)
    {
        float _1891 = 1.0 / _1877;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = _1887;
    if (!_1827)
    {
        float _1897 = 1.0 / _1887;
        _1895 = _1897;
    }
    float _1899 = _1895;
    if (!_1827)
    {
        float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1903 = -_1869;
        float _1905 = fma(_1893, _1901, _1903);
        _1871 = _1905;
    }
    float _1907 = _1871;
    if (!_1827)
    {
        float _1909 = _1907 * _1899;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1917 = _1913 > 0.0;
    bool _1919 = isnan(_1913);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan(0.0);
    bool _1925 = _1921 || _1923;
    float _1927 = _253 * _1915;
    float _1929 = -_1853;
    float _1931 = _1929 + 1.0;
    float _1933 = _1857 + _1726;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * 0.5;
    out.m_45.x = _1935;
    out.m_70.z = _1939;
    out.m_70.w = _1726;
    float _1941 = _1937 * _1788;
    float _1943 = -_1937;
    float _1945 = _1943 + 1.0;
    float _1947 = _1803 * _1941;
    float _1949 = _1813 * _1941;
    float _1951 = fma(_1809, _1947, _1797);
    float _1953 = fma(_1811, _1947, _1799);
    float _1955 = _1803 * _1945;
    float _1957 = fma(_1803, _1949, _1801);
    out.m_72.x = _1951;
    out.m_72.y = _1953;
    out.m_72.z = _1957;
    out.m_72.w = _1955;
    if (_1925)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1959;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_107);
        out.gl_Position.z = _2016;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2085 = as_type<float>(_145);
        out.gl_Position.z = _2085;
    }
    if (_139)
    {
        return out;
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _219 * _227;
    int _231 = abs(_225);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _209 < 0.5;
    float _239 = float(_237);
    float _241 = float(_211);
    float _243 = float(_231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = fma(_241, _235, _229);
    float _251 = abs(_247);
    float _253 = fma(_243, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_49.y;
    float _525 = _147 * 2.0;
    float _527 = in.m_42.x;
    float _529 = in.m_42.y;
    float _531 = in.m_42.z;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = in.m_54.x;
    float _539 = in.m_54.y;
    float _541 = in.m_54.z;
    float _543 = in.m_54.w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _549 = 1.0 / _535;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = in.m_56.x;
    float _573 = in.m_56.y;
    float _575 = in.m_56.z;
    float _577 = in.m_56.w;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    float _583 = floor(_525);
    float _585 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _587 = in.m_58.x;
    float _589 = in.m_58.y;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _523 * 2.0;
    float _597 = _585 * _147;
    float _599 = 1.0 / _547;
    float _601 = in.m_49.z;
    float _603 = _529 * _539;
    float _605 = floor(_595);
    bool _607 = _583 >= 0.0;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_527, _537, _603);
    bool _619 = _583 > 0.0;
    float _621 = _529 * _573;
    int _623 = _615 ? 0 : 1;
    float _625 = fma(_531, _541, _617);
    float _627 = trunc(_597);
    int _629 = int(_627);
    float _631 = fma(_527, _571, _621);
    float _633 = _529 * _589;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _625 + _543;
    float _641 = fma(_527, _587, _633);
    float _643 = 1.0 / _565;
    bool _645 = _605 >= 0.0;
    bool _647 = isnan(_605);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = fma(_531, _591, _641);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = _147 + _523;
    float _667 = _655 + _593;
    float _669 = _659 * _599;
    int _671 = _629 << 4;
    int _673 = _671 + 1968;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = fma(_531, _575, _631);
    float _681 = _601 * 2.0;
    float _683 = _523 + _601;
    float _685 = _663 * _549;
    uint _688 = uint(int(uint(_673) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[int(_698)][_700];
    float _704 = _637 * _643;
    int _706 = _653 ? 0 : 1;
    float _708 = floor(_681);
    bool _710 = _605 > 0.0;
    float _712 = _665 + (-1.0);
    float _714 = _683 + (-1.0);
    int _716 = _673 + 8;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _728 = _677 * _125;
    float _730 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _521 + _732;
    int _736 = ~_623;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = exp2(_728);
    int _744 = ~_706;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _521 + _750;
    int _754 = _740;
    int _756 = _748;
    if (!_619)
    {
        int _758 = ~_623;
        int _760 = _758 + 1;
        _754 = _760;
    }
    int _762 = _754;
    if (!_710)
    {
        int _764 = ~_706;
        int _766 = _764 + 1;
        _756 = _766;
    }
    int _768 = _756;
    float _770 = fma(_669, _752, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _772 = _708 >= 0.0;
    bool _774 = isnan(_708);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _679 + _577;
    bool _784 = _708 > 0.0;
    float _786 = fma(_685, _734, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _788 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_521);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _802 = _780 ? 0 : 1;
    bool _804 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = -_742;
    float _816 = _814 + 1.0;
    bool _818 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = isnan(_521);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_798;
    float _832 = _830 + 1.0;
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _812 ? _816 : 0.0;
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _828 * _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _521 + _854;
    int _858 = ~_802;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = _844 * _850;
    bool _866 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _868 = isnan(_521);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_844;
    float _880 = _878 + 1.0;
    int _882 = _862;
    if (!_784)
    {
        int _884 = ~_802;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = fma(_704, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _892 = _147 > 0.5;
    float _894 = _876 * _880;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _902 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _904 = _786 * _894;
    bool _906 = !_557;
    int _908 = _906 ? 0 : 1;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    int _916 = abs(_908);
    float _918 = _724 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _920 = -_195;
    int _922 = _892 ? as_type<int>(_920) : as_type<int>(_195);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _926 = _523 > 0.5;
    float _928 = fma(_770, _864, _914);
    bool _930 = !_569;
    float _932 = _930 ? _195 : as_type<float>(_922);
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = -_175;
    int _938 = _926 ? as_type<int>(_936) : as_type<int>(_175);
    float _940 = fma(_890, _852, _928);
    float _942 = float(_916);
    float _944 = _932 + 0.5;
    bool _946 = !_581;
    float _948 = _946 ? _175 : as_type<float>(_938);
    out.m_60.x = _910;
    out.m_60.y = _912;
    out.m_60.z = _934;
    float _950 = float(_762);
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _954 = !_553;
    int _956 = _954 ? 0 : 1;
    float _958 = -_948;
    float _960 = _958 + 0.5;
    float _962 = float(_888);
    float _964 = _952 * _800;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _968 = _782 + _966;
    float _970 = _942 * _950;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _974 = abs(_956);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _639 + _976;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _982 = _972 * _924;
    float _984 = float(_974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _667 + _986;
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].x, _980);
    float _992 = _970 * (-2.0);
    float _994 = in.m_62.x;
    float _996 = in.m_62.y;
    float _998 = in.m_62.z;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1002 = _984 * _962;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _940);
    float _1010 = _968 * _968;
    bool _1012 = _1000 >= 0.0;
    out.m_64.x = _964;
    out.m_64.y = _982;
    float _1014 = fma(_978, _978, _1010);
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_730, _992, _730);
    bool _1020 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1022 = isnan(1.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1028 = _1024 || _1026;
    float _1030 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1032 = fma(_988, _988, _1014);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = _523 + (-0.5);
    float _1040 = _1002 * (-2.0);
    float _1042 = rsqrt(_1032);
    float _1044 = _1002;
    if (_1012)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1046 = _1044;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1054 = as_type<int>(_1046);
    if (_1028)
    {
        float _1056 = _846 * _1016;
        _129 = _1056;
    }
    float _1058 = _129;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1012)
    {
        float _1062 = _1046 * 5.0;
        _1054 = as_type<int>(_1062);
    }
    int _1064 = _1054;
    float _1066 = fma(_992, _996, _996);
    float _1068 = _147 + (-0.5);
    float _1070 = fma(_1040, _994, _994);
    out.m_66.x = _1060;
    out.m_66.y = _1050;
    out.m_66.z = _1052;
    out.m_66.w = _1030;
    float _1072 = fma(_726, _1040, _726);
    float _1074 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1066);
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1070);
    if (_1012)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3506 = as_type<float>(_1064);
        out.gl_Position.z = _3506;
    }
    bool _1078 = !_561;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = _968 * _1042;
    float _1084 = _978 * _1042;
    if (_1012)
    {
        out.m_45.x = 0.0;
    }
    if (_1012)
    {
        return out;
    }
    float _1086 = -_1082;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _1090 = _988 * _1042;
    float _1092 = -_1084;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1096 = fma(_1018, _1058, _1074);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _1088 + _1098;
    float _1102 = -_1090;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1108 = _1094 + _1106;
    float _1110 = _1096 * 0.15915493667125701904296875;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1114 = abs(_1080);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1104 + _1116;
    float _1120 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1112);
    float _1122 = float(_1114);
    float _1124 = fma(_1072, _1058, _1076);
    float _1126 = float(_768);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1120);
    float _1130 = _1110 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = -_1082;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1140 = _1122 * _1126;
    bool _1142 = _1128 >= 0.0;
    float _1144 = _147 + _601;
    float _1146 = in.m_68.x;
    float _1148 = in.m_68.y;
    float _1150 = _1140 * (-2.0);
    float _1152 = _1110 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1144 + (-1.0);
    float _1158 = -_1084;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1162 = _1138 * _1138;
    float _1164 = -_1090;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1170 = _601 + (-0.5);
    float _1172 = fma(_1160, _1160, _1162);
    float _1174 = _1134 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1150, _998, _998);
    float _1180 = fma(_1168, _1150, _1168);
    float _1182 = fma(_1166, _1166, _1172);
    float _1184 = _1160;
    int _1186 = as_type<int>(_1180);
    float _1188 = _1104;
    if (_1142)
    {
        _1184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1178);
    if (_1142)
    {
        out.m_45.x = 0.0;
    }
    float _1194 = _1134 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = fma(_1180, _1058, _1192);
    if (_1142)
    {
        float _1200 = _1190 * 5.0;
        _1186 = as_type<int>(_1200);
    }
    int _1202 = _1186;
    float _1204 = _1198 * 0.15915493667125701904296875;
    float _1206 = _493 * _1148;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3722 = as_type<float>(_1202);
        out.gl_Position.z = _3722;
    }
    float _1208 = sqrt(_1182);
    float _1210 = _1204 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1154;
    if (_1142)
    {
        return out;
    }
    float _1216 = _253 * _1206;
    float _1218 = _1042 * _1208;
    float _1220 = _1204 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _491 * _1146;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1234 = _1232 * 0.5;
    float _1236 = _1218 * _1226;
    float _1238 = _253 * _1224;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = _1228 * _1236;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1254 = _1176 * _1132;
    float _1256 = _1196 * _1154;
    float _1258 = _1218 * _1252;
    float _1260 = _1222 * _1250;
    float _1262 = _1196 * _1132;
    float _1264 = _1132 * _1222;
    float _1266 = _1230 * _1258;
    float _1268 = _1154 * _1222;
    float _1270 = fma(_1212, _1256, _1254);
    float _1272 = _1196 * _1260;
    float _1274 = _1176 * _1154;
    float _1276 = -_1250;
    float _1278 = _1212 * _1276;
    float _1280 = _1176 * _1260;
    float _1282 = fma(_1270, _1266, _1272);
    float _1284 = -_1274;
    float _1286 = fma(_1212, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1212, _1274, _1288);
    float _1292 = fma(_1268, _1266, _1278);
    float _1294 = fma(_1212, _1254, _1256);
    float _1296 = fma(_1286, _1234, _1282);
    float _1298 = fma(_1290, _1266, _1280);
    float _1300 = fma(_1264, _1234, _1292);
    float _1302 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = fma(_1294, _1234, _1298);
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1308);
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1312);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1326 = _667 + _1322;
    float _1328 = _639 + _1324;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1326 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1328 + _1334;
    float _1338 = _1332 * _1332;
    float _1340 = fma(_1336, _1336, _1338);
    float _1342 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1344 = sqrt(_1340);
    float _1346 = _782 + _1342;
    bool _1348 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1304;
    float _1352 = _1342;
    float _1354 = _1266;
    if (!_1348)
    {
        _1350 = _1328;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    if (!_1348)
    {
        _1352 = _1326;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (!_1348)
    {
        _1354 = _1346;
    }
    float _1364 = _1354;
    bool _1366 = !_1348;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1344 + _1372;
        float _1376 = rsqrt(_1340);
        float _1378 = _1374 * _1370;
        float _1380 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1346, _1386, _1394);
        float _1400 = _1376 * _1396;
        float _1402 = fma(_1336, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1332, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1358 = _1402;
        _1368 = _1398;
        _1362 = _1404;
    }
    float _1406 = _1358;
    float _1408 = _1368;
    float _1410 = _1362;
    float _1412 = -_1084;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1416 = -_1082;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -_1090;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1424 = _1418;
    float _1426 = _1414;
    float _1428 = _1422;
    float _1430 = _1408;
    if (!_1248)
    {
        float _1432 = _1100 * _1100;
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = -_667;
        float _1438 = _1436 + _1410;
        float _1440 = -_639;
        float _1442 = _1440 + _1406;
        float _1444 = fma(_1108, _1108, _1432);
        float _1446 = fma(_1118, _1118, _1444);
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = sqrt(_1446);
        float _1452 = 1.0 / _1218;
        float _1454 = precise::min(_1450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1456 = _1454 * _1434;
        float _1458 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = -_782;
        float _1462 = _1460 + _1408;
        float _1464 = _1456 * _1452;
        float _1466 = _1458 * _1464;
        float _1468 = _1438 * _1464;
        float _1470 = fma(_1442, _1466, _1094);
        float _1472 = fma(_1462, _1466, _1088);
        float _1474 = fma(_1458, _1468, _1104);
        _1424 = _1472;
        _1426 = _1470;
        _1428 = _1474;
    }
    float _1476 = _1424;
    float _1478 = _1426;
    float _1480 = _1428;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1476 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1496 = _1484 * _1484;
    float _1498 = fma(_1488, _1488, _1496);
    float _1500 = fma(_1492, _1492, _1498);
    float _1502 = rsqrt(_1500);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1498;
    float _1528 = _1522;
    float _1530 = _1506;
    if (_1518)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1532;
    }
    float _1534 = _1524;
    if (_1518)
    {
        float _1536 = rsqrt(_1514);
        _1526 = _1536;
    }
    float _1538 = _1526;
    float _1540 = _1538;
    if (_1518)
    {
        float _1542 = _1522 * _1534;
        _1528 = _1542;
    }
    float _1544 = _1528;
    if (_1518)
    {
        float _1546 = _1544 * 0.15915493667125701904296875;
        _1430 = _1546;
    }
    float _1548 = _1430;
    float _1550 = _1502;
    float _1552 = _1548;
    if (_1518)
    {
        float _1554 = _1548 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1550 = _1556;
    }
    float _1558 = _1550;
    float _1560 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1562 = precise::max(0.0, _1560);
    float _1564 = _1308;
    float _1566 = _1562;
    float _1568 = _1560;
    if (_1518)
    {
        float _1570 = _1548 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1564 = _1572;
    }
    float _1574 = _1564;
    float _1576 = -_1504;
    float _1578 = -_1562;
    float _1580 = fma(_1484, _1576, _1578);
    if (!_1518)
    {
        _1566 = _1508;
    }
    float _1582 = _1566;
    float _1584 = _1582;
    if (_1518)
    {
        float _1586 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    float _1590 = sqrt(_1500);
    float _1592 = _1558;
    float _1594 = _1588;
    if (_1518)
    {
        float _1596 = fma(_1558, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1574 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1538 * _1598;
        _1214 = _1608;
    }
    float _1610 = _1214;
    if (!_1518)
    {
        _1540 = _1580;
    }
    float _1612 = _1540;
    float _1614 = _1612;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1616;
    }
    float _1618 = _1552;
    if (_1518)
    {
        float _1620 = _1506 * _1610;
        _1530 = _1620;
    }
    float _1622 = _1530;
    if (!_1518)
    {
        _1600 = _1510;
    }
    float _1624 = _1600;
    float _1626 = _1624;
    if (_1518)
    {
        float _1628 = _1508 * _1610;
        _1584 = _1628;
    }
    float _1630 = _1584;
    if (_1518)
    {
        float _1632 = fma(_1580, _1574, _1618);
        _1614 = _1632;
    }
    float _1634 = _1614;
    if (_1518)
    {
        float _1636 = _1622 * _1622;
        _1626 = _1636;
    }
    float _1638 = _1626;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1518)
    {
        float _1644 = _1630 * _1630;
        _1642 = _1644;
    }
    float _1646 = _1642;
    float _1648 = fma(_1634, _1634, _1638);
    float _1650 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1652 = _1648 + _1646;
    float _1654 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1656 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    float _1658 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = rsqrt(_1652);
    float _1662 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1654);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1672 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1682 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1698 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1700 = _1660 * _1622;
    float _1702 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1660 * _1634;
    float _1706 = _1660 * _1630;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1714 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = -_1708;
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1494, 1.0);
    float _1724 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1728 = -_1706;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1718);
    float _1732 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1734 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1736 = log2(_1722);
    float _1738 = fma(_1730, -0.5, 0.5);
    float _1740 = fma(_1730, 0.5, 0.5);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1744 = _1704 + 1.0;
    float _1746 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1742);
    float _1748 = exp2(_1732);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1752 = 1.0 / _1726;
    float _1754 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1734);
    float _1756 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1758 = _1736 * 0.693147182464599609375;
    float _1760 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1762 = fma(_1740, _1756, -0.212114393711090087890625);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1760);
    float _1770 = -_1704;
    float _1772 = fma(_1748, _1744, _1770);
    float _1774 = fma(_1740, _1762, 1.570728778839111328125);
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = _1750 * _1752;
    float _1780 = _1768 * _1752;
    float _1782 = fma(_1778, 0.5, 0.5);
    float _1784 = fma(_1780, -0.5, 0.5);
    float _1786 = _1766 * 0.636619746685028076171875;
    float3 _4674 = float3(_1782, _1784, _1764);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).x;
    float _1790 = -_1774;
    float _1792 = fma(_1786, _1790, 1.0);
    float3 _4690 = float3(_1782, _1784, _1764);
    float4 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4690, float3(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4690, float3(0.0), isnan(_4690)), level(0.0)).xyzw;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1795.w;
    float2 _4707 = float2(_1792, _1776);
    float3 _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4707, float2(0.0), isnan(_4707)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4707, float2(0.0), isnan(_4707)), level(0.0)).xyz;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1817 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1821 = isnan(0.5);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1827 = _1823 || _1825;
    float _1829 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1815);
    float _1831 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    float _1833 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1829);
    float _1835 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1831);
    float _1837 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1839 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1827)
    {
        _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1843 = _1188;
    float _1845 = 1.0 / _1837;
    float _1847 = _1839 + _1837;
    float _1849 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1851 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1849);
    float _1853 = exp2(_1841);
    float _1855 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1857 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1855);
    float _1859 = _1847 * _1845;
    float _1861 = _1859 * 0.5;
    float _1863 = _1845;
    float _1865 = _1861;
    float _1867 = _1843;
    if (!_1827)
    {
        _1863 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1869 = _1863;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1768;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1726;
    float _1871 = _1869;
    if (!_1827)
    {
        float _1873 = -_1843;
        float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1827)
    {
        _1867 = 1.0;
    }
    float _1879 = _1867;
    float _1881 = _1879;
    if (!_1827)
    {
        float _1883 = -_1869;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1885;
    }
    float _1887 = _257;
    float _1889 = _1877;
    if (!_1827)
    {
        float _1891 = 1.0 / _1877;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = _1887;
    if (!_1827)
    {
        float _1897 = 1.0 / _1887;
        _1895 = _1897;
    }
    float _1899 = _1895;
    if (!_1827)
    {
        float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1903 = -_1869;
        float _1905 = fma(_1893, _1901, _1903);
        _1871 = _1905;
    }
    float _1907 = _1871;
    if (!_1827)
    {
        float _1909 = _1907 * _1899;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1917 = _1913 > 0.0;
    bool _1919 = isnan(_1913);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan(0.0);
    bool _1925 = _1921 || _1923;
    float _1927 = _253 * _1915;
    float _1929 = -_1853;
    float _1931 = _1929 + 1.0;
    float _1933 = _1857 + _1726;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * 0.5;
    out.m_45.x = _1935;
    out.m_70.z = _1939;
    out.m_70.w = _1726;
    float _1941 = _1937 * _1788;
    float _1943 = -_1937;
    float _1945 = _1943 + 1.0;
    float _1947 = _1803 * _1941;
    float _1949 = _1813 * _1941;
    float _1951 = fma(_1809, _1947, _1797);
    float _1953 = fma(_1811, _1947, _1799);
    float _1955 = _1803 * _1945;
    float _1957 = fma(_1803, _1949, _1801);
    out.m_72.x = _1951;
    out.m_72.y = _1953;
    out.m_72.z = _1957;
    out.m_72.w = _1955;
    if (_1925)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1959;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2016 = as_type<float>(_107);
        out.gl_Position.z = _2016;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2085 = as_type<float>(_145);
        out.gl_Position.z = _2085;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_49.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _151 * _149;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    int _159 = as_type<int>(_153) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_153) & 2;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _167 * 0.15915493667125701904296875;
    bool _173 = !_165;
    float _175 = _173 ? (-0.5) : 0.5;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _183 = _181 != 0;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _171 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    int _199 = _197 ? 0 : 1;
    bool _201 = !_187;
    int _203 = _201 ? 0 : 1;
    int _205 = abs(_199);
    float _207 = -_169;
    float _209 = _157 + _207;
    int _211 = abs(_203);
    float _213 = -_209;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _219 = float(_205);
    float _221 = fma(_191, 0.5, 0.5);
    bool _223 = !_183;
    int _225 = _223 ? 0 : 1;
    float _227 = abs(_215);
    float _229 = _219 * _227;
    int _231 = abs(_225);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _237 = _209 < 0.5;
    float _239 = float(_237);
    float _241 = float(_211);
    float _243 = float(_231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = fma(_241, _235, _229);
    float _251 = abs(_247);
    float _253 = fma(_243, _251, _249);
    bool _255 = !_217;
    float _257 = 0.5;
    float _273;
    if (!_255)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_91);
        float _279 = 1.0 / _277;
        float _281 = _125 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _313 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _315 = isnan(_283);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = 1.0 / _299;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _329 = 1.0 / _303;
    float _331 = 1.0 / _307;
    float _333 = _291 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _283 + _335;
    float _339 = 1.0 / _311;
    float _341 = _287 * _329;
    bool _343 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_283);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    bool _355 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _357 = isnan(_283);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = _295 * _331;
    float _369 = -_323;
    float _371 = _369 + 1.0;
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _353 * _371;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _365 * _375;
    float _393 = _337 * _339;
    float _395 = -_365;
    float _397 = _395 + 1.0;
    bool _399 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_283);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _389 * _397;
    float _429 = -_389;
    float _431 = _429 + 1.0;
    float _433 = fma(_421, _333, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _435 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = _409 * _431;
    float _443 = fma(_425, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _445;
    float _449 = fma(_417, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = _433 * _441;
    float _453 = _435 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_447, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _461 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _463 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _469 = fma(_457, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = fma(_443, _427, _461);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = fma(_449, _427, _463);
    float _479 = fma(_467, _393, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_459, _391, _471);
    float _483 = fma(_475, _393, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _485 = fma(_469, _391, _477);
    float _487 = fma(_479, _377, _481);
    float _489 = fma(_483, _377, _485);
    float _491 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_327;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _499 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_91);
        float _517 = 1.0 / _515;
        float _519 = _125 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_49.y;
    float _525 = _147 * 2.0;
    float _527 = in.m_42.x;
    float _529 = in.m_42.y;
    float _531 = in.m_42.z;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = in.m_54.x;
    float _539 = in.m_54.y;
    float _541 = in.m_54.z;
    float _543 = in.m_54.w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _549 = 1.0 / _535;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = in.m_56.x;
    float _573 = in.m_56.y;
    float _575 = in.m_56.z;
    float _577 = in.m_56.w;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _581 = _579 != 0;
    float _583 = floor(_525);
    float _585 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _587 = in.m_58.x;
    float _589 = in.m_58.y;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _523 * 2.0;
    float _597 = _585 * _147;
    float _599 = 1.0 / _547;
    float _601 = in.m_49.z;
    float _603 = _529 * _539;
    float _605 = floor(_595);
    bool _607 = _583 >= 0.0;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_527, _537, _603);
    bool _619 = _583 > 0.0;
    float _621 = _529 * _573;
    int _623 = _615 ? 0 : 1;
    float _625 = fma(_531, _541, _617);
    float _627 = trunc(_597);
    int _629 = int(_627);
    float _631 = fma(_527, _571, _621);
    float _633 = _529 * _589;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _625 + _543;
    float _641 = fma(_527, _587, _633);
    float _643 = 1.0 / _565;
    bool _645 = _605 >= 0.0;
    bool _647 = isnan(_605);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = fma(_531, _591, _641);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = _147 + _523;
    float _667 = _655 + _593;
    float _669 = _659 * _599;
    int _671 = _629 << 4;
    int _673 = _671 + 1968;
    float _675 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _677 = log2(_675);
    float _679 = fma(_531, _575, _631);
    float _681 = _601 * 2.0;
    float _683 = _523 + _601;
    float _685 = _663 * _549;
    uint _688 = uint(int(uint(_673) >> uint(2)));
    uint _690 = uint(int(uint(int(_688)) >> uint(2)));
    int _692 = int(_688) & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    int _696 = int(_688) + 1;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    int _700 = _696 & 3;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[int(_698)][_700];
    float _704 = _637 * _643;
    int _706 = _653 ? 0 : 1;
    float _708 = floor(_681);
    bool _710 = _605 > 0.0;
    float _712 = _665 + (-1.0);
    float _714 = _683 + (-1.0);
    int _716 = _673 + 8;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    uint _720 = uint(int(uint(int(_718)) >> uint(2)));
    int _722 = int(_718) & 3;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[int(_720)][_722];
    float _726 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _728 = _677 * _125;
    float _730 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _734 = _521 + _732;
    int _736 = ~_623;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = exp2(_728);
    int _744 = ~_706;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _752 = _521 + _750;
    int _754 = _740;
    int _756 = _748;
    if (!_619)
    {
        int _758 = ~_623;
        int _760 = _758 + 1;
        _754 = _760;
    }
    int _762 = _754;
    if (!_710)
    {
        int _764 = ~_706;
        int _766 = _764 + 1;
        _756 = _766;
    }
    int _768 = _756;
    float _770 = fma(_669, _752, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _772 = _708 >= 0.0;
    bool _774 = isnan(_708);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _679 + _577;
    bool _784 = _708 > 0.0;
    float _786 = fma(_685, _734, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _788 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _790 = isnan(_521);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _802 = _780 ? 0 : 1;
    bool _804 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _812 = _808 || _810;
    float _814 = -_742;
    float _816 = _814 + 1.0;
    bool _818 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _820 = isnan(_521);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = -_798;
    float _832 = _830 + 1.0;
    bool _834 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _836 = isnan(_521);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = _812 ? _816 : 0.0;
    float _848 = -_828;
    float _850 = _848 + 1.0;
    float _852 = _828 * _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _521 + _854;
    int _858 = ~_802;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    float _864 = _844 * _850;
    bool _866 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _868 = isnan(_521);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_844;
    float _880 = _878 + 1.0;
    int _882 = _862;
    if (!_784)
    {
        int _884 = ~_802;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    float _890 = fma(_704, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _892 = _147 > 0.5;
    float _894 = _876 * _880;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _902 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _904 = _786 * _894;
    bool _906 = !_557;
    int _908 = _906 ? 0 : 1;
    float _910 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    int _916 = abs(_908);
    float _918 = _724 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _920 = -_195;
    int _922 = _892 ? as_type<int>(_920) : as_type<int>(_195);
    float _924 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _926 = _523 > 0.5;
    float _928 = fma(_770, _864, _914);
    bool _930 = !_569;
    float _932 = _930 ? _195 : as_type<float>(_922);
    float _934 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = -_175;
    int _938 = _926 ? as_type<int>(_936) : as_type<int>(_175);
    float _940 = fma(_890, _852, _928);
    float _942 = float(_916);
    float _944 = _932 + 0.5;
    bool _946 = !_581;
    float _948 = _946 ? _175 : as_type<float>(_938);
    out.m_60.x = _910;
    out.m_60.y = _912;
    out.m_60.z = _934;
    float _950 = float(_762);
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _954 = !_553;
    int _956 = _954 ? 0 : 1;
    float _958 = -_948;
    float _960 = _958 + 0.5;
    float _962 = float(_888);
    float _964 = _952 * _800;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _968 = _782 + _966;
    float _970 = _942 * _950;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _974 = abs(_956);
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _639 + _976;
    float _980 = _968 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _982 = _972 * _924;
    float _984 = float(_974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _667 + _986;
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[28].x, _980);
    float _992 = _970 * (-2.0);
    float _994 = in.m_62.x;
    float _996 = in.m_62.y;
    float _998 = in.m_62.z;
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1002 = _984 * _962;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[118].x, _940);
    float _1010 = _968 * _968;
    bool _1012 = _1000 >= 0.0;
    out.m_64.x = _964;
    out.m_64.y = _982;
    float _1014 = fma(_978, _978, _1010);
    float _1016 = 1.0 / _1006;
    float _1018 = fma(_730, _992, _730);
    bool _1020 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1022 = isnan(1.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1028 = _1024 || _1026;
    float _1030 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1032 = fma(_988, _988, _1014);
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = _523 + (-0.5);
    float _1040 = _1002 * (-2.0);
    float _1042 = rsqrt(_1032);
    float _1044 = _1002;
    if (_1012)
    {
        _1044 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1046 = _1044;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1054 = as_type<int>(_1046);
    if (_1028)
    {
        float _1056 = _846 * _1016;
        _129 = _1056;
    }
    float _1058 = _129;
    float _1060 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1012)
    {
        float _1062 = _1046 * 5.0;
        _1054 = as_type<int>(_1062);
    }
    int _1064 = _1054;
    float _1066 = fma(_992, _996, _996);
    float _1068 = _147 + (-0.5);
    float _1070 = fma(_1040, _994, _994);
    out.m_66.x = _1060;
    out.m_66.y = _1050;
    out.m_66.z = _1052;
    out.m_66.w = _1030;
    float _1072 = fma(_726, _1040, _726);
    float _1074 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1066);
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1070);
    if (_1012)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3506 = as_type<float>(_1064);
        out.gl_Position.z = _3506;
    }
    bool _1078 = !_561;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = _968 * _1042;
    float _1084 = _978 * _1042;
    if (_1012)
    {
        out.m_45.x = 0.0;
    }
    if (_1012)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1086 = -_1082;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _1090 = _988 * _1042;
    float _1092 = -_1084;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1096 = fma(_1018, _1058, _1074);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _1088 + _1098;
    float _1102 = -_1090;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1108 = _1094 + _1106;
    float _1110 = _1096 * 0.15915493667125701904296875;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1114 = abs(_1080);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1104 + _1116;
    float _1120 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1112);
    float _1122 = float(_1114);
    float _1124 = fma(_1072, _1058, _1076);
    float _1126 = float(_768);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1120);
    float _1130 = _1110 * 6.283185482025146484375;
    float _1132 = sin(_1130);
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = -_1082;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1140 = _1122 * _1126;
    bool _1142 = _1128 >= 0.0;
    float _1144 = _147 + _601;
    float _1146 = in.m_68.x;
    float _1148 = in.m_68.y;
    float _1150 = _1140 * (-2.0);
    float _1152 = _1110 * 6.283185482025146484375;
    float _1154 = cos(_1152);
    float _1156 = _1144 + (-1.0);
    float _1158 = -_1084;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _978);
    float _1162 = _1138 * _1138;
    float _1164 = -_1090;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1170 = _601 + (-0.5);
    float _1172 = fma(_1160, _1160, _1162);
    float _1174 = _1134 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1150, _998, _998);
    float _1180 = fma(_1168, _1150, _1168);
    float _1182 = fma(_1166, _1166, _1172);
    float _1184 = _1160;
    int _1186 = as_type<int>(_1180);
    float _1188 = _1104;
    if (_1142)
    {
        _1184 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1178);
    if (_1142)
    {
        out.m_45.x = 0.0;
    }
    float _1194 = _1134 * 6.283185482025146484375;
    float _1196 = cos(_1194);
    float _1198 = fma(_1180, _1058, _1192);
    if (_1142)
    {
        float _1200 = _1190 * 5.0;
        _1186 = as_type<int>(_1200);
    }
    int _1202 = _1186;
    float _1204 = _1198 * 0.15915493667125701904296875;
    float _1206 = _493 * _1148;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3722 = as_type<float>(_1202);
        out.gl_Position.z = _3722;
    }
    float _1208 = sqrt(_1182);
    float _1210 = _1204 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1154;
    if (_1142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1216 = _253 * _1206;
    float _1218 = _1042 * _1208;
    float _1220 = _1204 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = _491 * _1146;
    float _1226 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _175);
    float _1230 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1234 = _1232 * 0.5;
    float _1236 = _1218 * _1226;
    float _1238 = _253 * _1224;
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = _1228 * _1236;
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1254 = _1176 * _1132;
    float _1256 = _1196 * _1154;
    float _1258 = _1218 * _1252;
    float _1260 = _1222 * _1250;
    float _1262 = _1196 * _1132;
    float _1264 = _1132 * _1222;
    float _1266 = _1230 * _1258;
    float _1268 = _1154 * _1222;
    float _1270 = fma(_1212, _1256, _1254);
    float _1272 = _1196 * _1260;
    float _1274 = _1176 * _1154;
    float _1276 = -_1250;
    float _1278 = _1212 * _1276;
    float _1280 = _1176 * _1260;
    float _1282 = fma(_1270, _1266, _1272);
    float _1284 = -_1274;
    float _1286 = fma(_1212, _1262, _1284);
    float _1288 = -_1262;
    float _1290 = fma(_1212, _1274, _1288);
    float _1292 = fma(_1268, _1266, _1278);
    float _1294 = fma(_1212, _1254, _1256);
    float _1296 = fma(_1286, _1234, _1282);
    float _1298 = fma(_1290, _1266, _1280);
    float _1300 = fma(_1264, _1234, _1292);
    float _1302 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1304 = fma(_1294, _1234, _1298);
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1308 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1302);
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1306);
    float _1314 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1308);
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1310);
    float _1318 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1312);
    float _1320 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1314);
    float _1322 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1326 = _667 + _1322;
    float _1328 = _639 + _1324;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1326 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1328 + _1334;
    float _1338 = _1332 * _1332;
    float _1340 = fma(_1336, _1336, _1338);
    float _1342 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1344 = sqrt(_1340);
    float _1346 = _782 + _1342;
    bool _1348 = _1344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1304;
    float _1352 = _1342;
    float _1354 = _1266;
    if (!_1348)
    {
        _1350 = _1328;
    }
    float _1356 = _1350;
    float _1358 = _1356;
    if (!_1348)
    {
        _1352 = _1326;
    }
    float _1360 = _1352;
    float _1362 = _1360;
    if (!_1348)
    {
        _1354 = _1346;
    }
    float _1364 = _1354;
    bool _1366 = !_1348;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1344 + _1372;
        float _1376 = rsqrt(_1340);
        float _1378 = _1374 * _1370;
        float _1380 = _1346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 + (-1.0);
        float _1394 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = fma(_1346, _1386, _1394);
        float _1400 = _1376 * _1396;
        float _1402 = fma(_1336, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1404 = fma(_1332, _1400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1358 = _1402;
        _1368 = _1398;
        _1362 = _1404;
    }
    float _1406 = _1358;
    float _1408 = _1368;
    float _1410 = _1362;
    float _1412 = -_1084;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1416 = -_1082;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1420 = -_1090;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1424 = _1418;
    float _1426 = _1414;
    float _1428 = _1422;
    float _1430 = _1408;
    if (!_1248)
    {
        float _1432 = _1100 * _1100;
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1436 = -_667;
        float _1438 = _1436 + _1410;
        float _1440 = -_639;
        float _1442 = _1440 + _1406;
        float _1444 = fma(_1108, _1108, _1432);
        float _1446 = fma(_1118, _1118, _1444);
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = sqrt(_1446);
        float _1452 = 1.0 / _1218;
        float _1454 = precise::min(_1450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1456 = _1454 * _1434;
        float _1458 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1460 = -_782;
        float _1462 = _1460 + _1408;
        float _1464 = _1456 * _1452;
        float _1466 = _1458 * _1464;
        float _1468 = _1438 * _1464;
        float _1470 = fma(_1442, _1466, _1094);
        float _1472 = fma(_1462, _1466, _1088);
        float _1474 = fma(_1458, _1468, _1104);
        _1424 = _1472;
        _1426 = _1470;
        _1428 = _1474;
    }
    float _1476 = _1424;
    float _1478 = _1426;
    float _1480 = _1428;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1476 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1496 = _1484 * _1484;
    float _1498 = fma(_1488, _1488, _1496);
    float _1500 = fma(_1492, _1492, _1498);
    float _1502 = rsqrt(_1500);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1492;
    float _1526 = _1498;
    float _1528 = _1522;
    float _1530 = _1506;
    if (_1518)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1532;
    }
    float _1534 = _1524;
    if (_1518)
    {
        float _1536 = rsqrt(_1514);
        _1526 = _1536;
    }
    float _1538 = _1526;
    float _1540 = _1538;
    if (_1518)
    {
        float _1542 = _1522 * _1534;
        _1528 = _1542;
    }
    float _1544 = _1528;
    if (_1518)
    {
        float _1546 = _1544 * 0.15915493667125701904296875;
        _1430 = _1546;
    }
    float _1548 = _1430;
    float _1550 = _1502;
    float _1552 = _1548;
    if (_1518)
    {
        float _1554 = _1548 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1550 = _1556;
    }
    float _1558 = _1550;
    float _1560 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1562 = precise::max(0.0, _1560);
    float _1564 = _1308;
    float _1566 = _1562;
    float _1568 = _1560;
    if (_1518)
    {
        float _1570 = _1548 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1564 = _1572;
    }
    float _1574 = _1564;
    float _1576 = -_1504;
    float _1578 = -_1562;
    float _1580 = fma(_1484, _1576, _1578);
    if (!_1518)
    {
        _1566 = _1508;
    }
    float _1582 = _1566;
    float _1584 = _1582;
    if (_1518)
    {
        float _1586 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1586;
    }
    float _1588 = _1568;
    float _1590 = sqrt(_1500);
    float _1592 = _1558;
    float _1594 = _1588;
    if (_1518)
    {
        float _1596 = fma(_1558, _1588, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1574 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1538 * _1598;
        _1214 = _1608;
    }
    float _1610 = _1214;
    if (!_1518)
    {
        _1540 = _1580;
    }
    float _1612 = _1540;
    float _1614 = _1612;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1616;
    }
    float _1618 = _1552;
    if (_1518)
    {
        float _1620 = _1506 * _1610;
        _1530 = _1620;
    }
    float _1622 = _1530;
    if (!_1518)
    {
        _1600 = _1510;
    }
    float _1624 = _1600;
    float _1626 = _1624;
    if (_1518)
    {
        float _1628 = _1508 * _1610;
        _1584 = _1628;
    }
    float _1630 = _1584;
    if (_1518)
    {
        float _1632 = fma(_1580, _1574, _1618);
        _1614 = _1632;
    }
    float _1634 = _1614;
    if (_1518)
    {
        float _1636 = _1622 * _1622;
        _1626 = _1636;
    }
    float _1638 = _1626;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1518)
    {
        float _1644 = _1630 * _1630;
        _1642 = _1644;
    }
    float _1646 = _1642;
    float _1648 = fma(_1634, _1634, _1638);
    float _1650 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1652 = _1648 + _1646;
    float _1654 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1656 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1650);
    float _1658 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1660 = rsqrt(_1652);
    float _1662 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1654);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1666 = fma(_1590, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1664);
    float _1668 = precise::clamp(_1666, 0.0, 1.0);
    float _1670 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1658);
    float _1672 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1674 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1676 = -_1668;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1682 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1672);
    float _1684 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1686 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = abs(_1678);
    float _1692 = log2(_1690);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1698 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1700 = _1660 * _1622;
    float _1702 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1694);
    float _1704 = _1660 * _1634;
    float _1706 = _1660 * _1630;
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1712 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1714 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = -_1708;
    float _1718 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1716);
    float _1720 = -_1710;
    float _1722 = fma(_1720, _1494, 1.0);
    float _1724 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1728 = -_1706;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1718);
    float _1732 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1734 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1736 = log2(_1722);
    float _1738 = fma(_1730, -0.5, 0.5);
    float _1740 = fma(_1730, 0.5, 0.5);
    float _1742 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1744 = _1704 + 1.0;
    float _1746 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1742);
    float _1748 = exp2(_1732);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1752 = 1.0 / _1726;
    float _1754 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1734);
    float _1756 = fma(_1740, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1758 = _1736 * 0.693147182464599609375;
    float _1760 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1754);
    float _1762 = fma(_1740, _1756, -0.212114393711090087890625);
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1766 = sqrt(_1738);
    float _1768 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1760);
    float _1770 = -_1704;
    float _1772 = fma(_1748, _1744, _1770);
    float _1774 = fma(_1740, _1762, 1.570728778839111328125);
    float _1776 = fma(_1772, 0.5, 0.5);
    float _1778 = _1750 * _1752;
    float _1780 = _1768 * _1752;
    float _1782 = fma(_1778, 0.5, 0.5);
    float _1784 = fma(_1780, -0.5, 0.5);
    float _1786 = _1766 * 0.636619746685028076171875;
    float3 _4674 = float3(_1782, _1784, _1764);
    float _1788 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4674, float3(0.0), isnan(_4674)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4674, float3(0.0), isnan(_4674)), level(0.0)).x;
    float _1790 = -_1774;
    float _1792 = fma(_1786, _1790, 1.0);
    float3 _4690 = float3(_1782, _1784, _1764);
    float4 _1795 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4690, float3(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4690, float3(0.0), isnan(_4690)), level(0.0)).xyzw;
    float _1797 = _1795.x;
    float _1799 = _1795.y;
    float _1801 = _1795.z;
    float _1803 = _1795.w;
    float2 _4707 = float2(_1792, _1776);
    float3 _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4707, float2(0.0), isnan(_4707)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4707, float2(0.0), isnan(_4707)), level(0.0)).xyz;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1817 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1821 = isnan(0.5);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1827 = _1823 || _1825;
    float _1829 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1815);
    float _1831 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1817);
    float _1833 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1829);
    float _1835 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1831);
    float _1837 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1839 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1841 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1827)
    {
        _1188 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1843 = _1188;
    float _1845 = 1.0 / _1837;
    float _1847 = _1839 + _1837;
    float _1849 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1851 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1849);
    float _1853 = exp2(_1841);
    float _1855 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1857 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1855);
    float _1859 = _1847 * _1845;
    float _1861 = _1859 * 0.5;
    float _1863 = _1845;
    float _1865 = _1861;
    float _1867 = _1843;
    if (!_1827)
    {
        _1863 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1869 = _1863;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1768;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1726;
    float _1871 = _1869;
    if (!_1827)
    {
        float _1873 = -_1843;
        float _1875 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1873);
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1827)
    {
        _1867 = 1.0;
    }
    float _1879 = _1867;
    float _1881 = _1879;
    if (!_1827)
    {
        float _1883 = -_1869;
        float _1885 = _1883 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _257 = _1885;
    }
    float _1887 = _257;
    float _1889 = _1877;
    if (!_1827)
    {
        float _1891 = 1.0 / _1877;
        _1889 = _1891;
    }
    float _1893 = _1889;
    float _1895 = _1887;
    if (!_1827)
    {
        float _1897 = 1.0 / _1887;
        _1895 = _1897;
    }
    float _1899 = _1895;
    if (!_1827)
    {
        float _1901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1903 = -_1869;
        float _1905 = fma(_1893, _1901, _1903);
        _1871 = _1905;
    }
    float _1907 = _1871;
    if (!_1827)
    {
        float _1909 = _1907 * _1899;
        float _1911 = precise::clamp(_1909, 0.0, 1.0);
        _1881 = _1911;
    }
    float _1913 = _1881;
    float _1915 = _1913 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1917 = _1913 > 0.0;
    bool _1919 = isnan(_1913);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan(0.0);
    bool _1925 = _1921 || _1923;
    float _1927 = _253 * _1915;
    float _1929 = -_1853;
    float _1931 = _1929 + 1.0;
    float _1933 = _1857 + _1726;
    float _1935 = _1927 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1937 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = _1933 * 0.5;
    out.m_45.x = _1935;
    out.m_70.z = _1939;
    out.m_70.w = _1726;
    float _1941 = _1937 * _1788;
    float _1943 = -_1937;
    float _1945 = _1943 + 1.0;
    float _1947 = _1803 * _1941;
    float _1949 = _1813 * _1941;
    float _1951 = fma(_1809, _1947, _1797);
    float _1953 = fma(_1811, _1947, _1799);
    float _1955 = _1803 * _1945;
    float _1957 = fma(_1803, _1949, _1801);
    out.m_72.x = _1951;
    out.m_72.y = _1953;
    out.m_72.z = _1957;
    out.m_72.w = _1955;
    if (_1925)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1959 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1959;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

