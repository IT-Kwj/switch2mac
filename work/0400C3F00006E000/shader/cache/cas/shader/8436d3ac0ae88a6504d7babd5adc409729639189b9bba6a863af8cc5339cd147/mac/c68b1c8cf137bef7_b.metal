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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2517 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2833 = as_type<float>(_127);
        out.gl_Position.z = _2833;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_153);
        out.gl_Position.z = _2888;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = 1.0 / _141;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _109 * _155;
    bool _161 = !_157;
    float _163 = _159;
    float _181;
    if (!_161)
    {
        float _165 = in.m_55.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _159;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _213 = isnan(_185);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _229 = 1.0 / _205;
    float _231 = _221 * _209;
    float _233 = -_221;
    float _235 = _233 + 1.0;
    float _237 = _189 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _239;
    float _243 = fma(_225, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _245 = fma(_241, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _247 = _243 * _231;
    float _249 = _245 * _231;
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_227;
    if (!_259)
    {
        float _261 = in.m_55.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = in.m_55.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_55.x;
    float _287 = in.m_55.y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _299 = _297 != 0;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _303 = int(_301);
    bool _305 = !_295;
    int _307 = _305 ? 0 : 1;
    bool _309 = !_291;
    int _311 = _309 ? 0 : 1;
    float _313 = _283 * _109;
    bool _315 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = exp2(_313);
    bool _327 = !_299;
    int _329 = _327 ? 0 : 1;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _333 = _279 * 2.0;
    float _335 = float(_303);
    float _337 = _287 * 2.0;
    float _339 = _285 * 2.0;
    float _341 = floor(_333);
    float _343 = _285 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _345 = _287 + _285;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = _335 * _109;
    float _351 = -_331;
    float _353 = fma(_343, 2.0, _351);
    float _355 = _345 + (-1.0);
    float _357 = -_325;
    float _359 = _357 + 1.0;
    float _361 = floor(_339);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _365 = _323 ? _359 : 0.0;
    float _367 = floor(_337);
    bool _369 = _341 > 0.0;
    float _371 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _373 = _341 >= 0.0;
    bool _375 = isnan(_341);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = fma(_371, -2.0, _347);
    int _385 = _381 ? 0 : 1;
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _389 = int(_387);
    bool _391 = _361 > 0.0;
    bool _393 = _361 >= 0.0;
    bool _395 = isnan(_361);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    int _403 = ~_385;
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    int _409 = _407;
    if (!_369)
    {
        int _411 = ~_385;
        int _413 = _411 + 1;
        _409 = _413;
    }
    int _415 = _409;
    bool _417 = _367 > 0.0;
    bool _419 = _367 >= 0.0;
    bool _421 = isnan(_367);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = in.m_57.x;
    float _431 = in.m_57.y;
    float _433 = in.m_57.z;
    int _435 = _401 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = float(_389);
    bool _451 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _453 = isnan(1.0);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _463 = 1.0 + _461;
    bool _465 = !_439;
    int _467 = _465 ? 0 : 1;
    float _469 = 1.0 / _449;
    float _471 = float(_415);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _475 = 1.0 / _463;
    int _477 = abs(_467);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _481 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[78].z, _473);
    float _483 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _383);
    float _485 = float(_477);
    float _487 = -_109;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[76].x, _353);
    bool _491 = !_443;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _479);
    int _497 = ~_435;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _485 * _471;
    int _505 = _501;
    if (!_391)
    {
        int _507 = ~_435;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _469 * _109;
    int _515 = abs(_493);
    float _517 = _503 * (-2.0);
    float _519 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _481);
    float _521 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _495);
    if (_459)
    {
        float _523 = _365 * _475;
        _119 = _523;
    }
    float _525 = _119;
    float _527 = _285 + (-0.5);
    float _529 = fma(_517, _429, _429);
    float _531 = float(_511);
    float _533 = fma(_363, _517, _363);
    float _535 = float(_515);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _529);
    int _539 = _427 ? 0 : 1;
    float _541 = _287 + _279;
    bool _543 = !_447;
    int _545 = _543 ? 0 : 1;
    float _547 = _535 * _531;
    int _549 = ~_539;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_533, _525, _537);
    int _557 = _553;
    if (!_417)
    {
        int _559 = ~_539;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = _541 + (-1.0);
    int _567 = abs(_545);
    float _569 = _547 * (-2.0);
    float _571 = _555 * 0.15915493667125701904296875;
    float _573 = float(_563);
    float _575 = fma(_569, _431, _431);
    float _577 = float(_567);
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = _287 + (-0.5);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _279 + _285;
    float _587 = _577 * _573;
    float _589 = fma(_579, _569, _579);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    float _593 = in.m_62.x;
    float _595 = in.m_62.y;
    float _597 = _585 + (-1.0);
    float _599 = _587 * (-2.0);
    float _601 = fma(_589, _525, _591);
    float _603 = _279 + (-0.5);
    float _605 = in.m_46.x;
    float _607 = in.m_46.y;
    float _609 = in.m_46.z;
    float _611 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _613 = fma(_599, _433, _433);
    float _615 = _601 * 0.15915493667125701904296875;
    float _617 = _571 * 6.283185482025146484375;
    float _619 = sin(_617);
    float _621 = fma(_611, _599, _611);
    float _623 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _625 = fma(_621, _525, _623);
    float _627 = _571 * 6.283185482025146484375;
    float _629 = cos(_627);
    int _631 = as_type<int>(_583) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_583) & 2;
    bool _637 = _635 != 0;
    float _639 = _625 * 0.15915493667125701904296875;
    float _641 = _255 * _593;
    float _643 = _615 * 6.283185482025146484375;
    float _645 = sin(_643);
    bool _647 = !_637;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _257 * _595;
    bool _653 = !_633;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _661 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _615 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _675 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _657);
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _659);
    bool _679 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _681 = isnan(0.5);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _687 = _683 || _685;
    float _689 = _639 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _695 = _619 * _645;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _705 = _701 || _703;
    float _707 = _663 * _693;
    float _709 = _669 * _671;
    float _711 = _629 * _645;
    float _713 = _639 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _629 * _667;
    float _719 = _619 * _667;
    float _721 = _629 * _691;
    float _723 = _619 * _691;
    float _725 = _667 * _691;
    float _727 = _645 * _691;
    float _729 = _723 * _707;
    float _731 = fma(_715, _717, _695);
    float _733 = fma(_715, _695, _717);
    float _735 = _721 * _707;
    float _737 = -_711;
    float _739 = fma(_715, _719, _737);
    float _741 = -_719;
    float _743 = fma(_715, _711, _741);
    float _745 = -_707;
    float _747 = _715 * _745;
    float _749 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _751 = fma(_731, _709, _735);
    float _753 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    float _755 = fma(_725, _709, _747);
    float _757 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _677);
    float _759 = fma(_743, _749, _751);
    float _761 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _763 = fma(_739, _709, _729);
    float _765 = fma(_727, _749, _755);
    float _767 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _769 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _771 = fma(_733, _749, _763);
    float _773 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _767);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _769);
    float _779 = _753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _775);
    float _785 = _761 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _777);
    float _789 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].x, _781);
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _789);
    float _799 = _785 + _791;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _803 = _779 + _795;
    float _805 = _797 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _799 + _807;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _815 = _803 + _813;
    float _817 = 1.0 / _805;
    float _819 = _809 * _809;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_815, _815, _819);
    float _827 = _821 + _805;
    float _829 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = sqrt(_825);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _837 = _827 * _817;
    float _839 = _837 * 0.5;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _843 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[30].w, _841);
    float _845 = _773 + _835;
    float _847 = 1.0 / _843;
    bool _849 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _817;
    float _853 = _799;
    float _855 = _831;
    float _857 = _825;
    float _859 = _805;
    float _861 = _843;
    if (!_849)
    {
        _851 = _803;
    }
    float _863 = _851;
    float _865 = 0.0;
    float _867 = _863;
    if (!_849)
    {
        _865 = _845;
    }
    float _869 = _865;
    bool _871 = !_849;
    float _873 = _869;
    if (!_871)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _879 = _831 + _877;
        float _881 = rsqrt(_825);
        float _883 = _879 * _875;
        float _885 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = _887 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 + (-1.0);
        float _899 = _897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = fma(_895, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = fma(_845, _891, _899);
        float _905 = _881 * _901;
        float _907 = fma(_815, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _909 = fma(_809, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _907;
        _853 = _909;
        _873 = _903;
        _855 = _887;
        _857 = _881;
    }
    float _911 = _867;
    float _913 = _853;
    float _915 = _873;
    float _917 = _855;
    float _919 = _857;
    float _921 = _915;
    float _923 = _911;
    float _925 = _913;
    float _927 = _917;
    if (_705)
    {
        _859 = 1.0;
    }
    float _929 = _859;
    float _931 = _929;
    if (!_687)
    {
        float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _935 = _773 + _933;
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _939 = _779 + _937;
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _943 = -_779;
        float _945 = _943 + _911;
        float _947 = _935 * _935;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _951 = _785 + _949;
        float _953 = -_785;
        float _955 = _953 + _913;
        float _957 = fma(_939, _939, _947);
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _961 = fma(_951, _951, _957);
        float _963 = sqrt(_961);
        float _965 = _941 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _967 = precise::min(_963, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _969 = _967 * _959;
        float _971 = -_773;
        float _973 = _971 + _915;
        float _975 = _965 * _969;
        float _977 = fma(_973, _975, _773);
        float _979 = fma(_945, _975, _779);
        float _981 = fma(_955, _975, _785);
        _921 = _977;
        _923 = _979;
        _925 = _981;
    }
    float _983 = _921;
    float _985 = _923;
    float _987 = _925;
    float _989 = 0.0;
    if (_705)
    {
        _989 = 1.0;
    }
    float _991 = _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _995 = _847 * _993;
    float _997 = _991;
    if (!_705)
    {
        float _999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1005 = _1001 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1003 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1007;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1041 = fma(_995, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        _931 = _1045;
    }
    float _1047 = _931;
    if (!_705)
    {
        float _1049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = _1051 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        float _1059 = _1053 * 0.15915493667125701904296875;
        float _1061 = _1051 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        float _1065 = 1.0 / _1057;
        float _1067 = _1059 * 6.283185482025146484375;
        float _1069 = cos(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = _1059 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = _1069 * _1071;
        float _1079 = 1.0 / _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1083 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1081;
        float _1085 = 1.0 / _1083;
        float _1087 = _1075 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1091 = fma(_995, _1087, _1089);
        float _1093 = _1091 * _1085;
        float _1095 = precise::clamp(_1093, 0.0, 1.0);
        float _1097 = -_1095;
        float _1099 = _1097 + 1.0;
        _927 = _1079;
        _997 = _1099;
    }
    float _1101 = _927;
    float _1103 = _997;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _983 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _985 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1115 = _987 + _1113;
    float _1117 = _1107 * _1107;
    float _1119 = _983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = _983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1127 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1129 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1121);
    float _1131 = fma(_1115, _1115, _1123);
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1127);
    float _1135 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1137 = rsqrt(_1131);
    float _1139 = sqrt(_1131);
    float _1141 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1143 = _1111 * _1141;
    float _1145 = _1115 * _1141;
    float _1147 = _1143 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 + _1149;
    float _1153 = sqrt(_1151);
    bool _1155 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1153 + _1157;
    float _1161 = _919;
    float _1163 = _1151;
    float _1165 = _1159;
    float _1167 = _1107;
    float _1169 = _1143;
    float _1171 = _1145;
    float _1173 = _1147;
    if (_1155)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1161 = _1175;
    }
    float _1177 = _1161;
    if (_1155)
    {
        float _1179 = rsqrt(_1151);
        _1163 = _1179;
    }
    float _1181 = _1163;
    if (_1155)
    {
        float _1183 = _1159 * _1177;
        _1165 = _1183;
    }
    float _1185 = _1165;
    if (_1155)
    {
        float _1187 = _1185 * 0.15915493667125701904296875;
        _861 = _1187;
    }
    float _1189 = _861;
    float _1191 = _1101;
    float _1193 = _1189;
    if (_1155)
    {
        float _1195 = _1189 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        _1191 = _1197;
    }
    float _1199 = _1191;
    float _1201 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1203 = precise::max(0.0, _1201);
    float _1205 = _1177;
    float _1207 = _1203;
    if (_1155)
    {
        float _1209 = _1189 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = -_1141;
    float _1217 = -_1203;
    float _1219 = fma(_1107, _1215, _1217);
    if (_1155)
    {
        float _1221 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1167 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1199;
    if (_1155)
    {
        float _1227 = fma(_1199, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1207 = _1227;
    }
    float _1229 = _1207;
    float _1231 = floor(_1125);
    float _1233 = _1229;
    float _1235 = _1213;
    if (_1155)
    {
        float _1237 = _1213 + (-1.0);
        _1225 = _1237;
    }
    float _1239 = _1225;
    float _1241 = _1239;
    if (_1155)
    {
        float _1243 = _1181 * _1229;
        _1193 = _1243;
    }
    float _1245 = _1193;
    if (!_1155)
    {
        _1233 = _1219;
    }
    float _1247 = _1233;
    float _1249 = _1247;
    if (_1155)
    {
        float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1251;
    }
    float _1253 = _1241;
    if (_1155)
    {
        float _1255 = _1143 * _1245;
        _1169 = _1255;
    }
    float _1257 = _1169;
    if (_1155)
    {
        float _1259 = _1145 * _1245;
        _1171 = _1259;
    }
    float _1261 = _1171;
    if (_1155)
    {
        float _1263 = fma(_1219, _1213, _1253);
        _1249 = _1263;
    }
    float _1265 = _1249;
    if (_1155)
    {
        float _1267 = _1257 * _1257;
        _1173 = _1267;
    }
    float _1269 = _1173;
    float _1271 = _983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1155)
    {
        _1235 = _1149;
    }
    float _1273 = _1235;
    float _1275 = _1273;
    if (_1155)
    {
        float _1277 = _1261 * _1261;
        _1275 = _1277;
    }
    float _1279 = _1275;
    float _1281 = fma(_1265, _1265, _1269);
    float _1283 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1287 = _983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1291 = _1281 + _1279;
    float _1293 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1295 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1297 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1301 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1299);
    float _1303 = precise::clamp(_1301, 0.0, 1.0);
    float _1305 = rsqrt(_1291);
    float _1307 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1295);
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1311 = -_1303;
    float _1313 = _1311 + 1.0;
    float _1315 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1321 = -_1231;
    float _1323 = _1125 + _1321;
    float _1325 = floor(_1283);
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1319);
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1285, 1.0);
    float _1335 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1343 = abs(_1313);
    float _1345 = log2(_1343);
    float _1347 = _1305 * _1257;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1339);
    float _1351 = _1305 * _1265;
    float _1353 = _1305 * _1261;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1357 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1341);
    float _1359 = _1351 + 1.0;
    float _1361 = 1.0 / _1349;
    float _1363 = -_1355;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1363);
    float _1367 = -_1325;
    float _1369 = _1283 + _1367;
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1337);
    float _1373 = -_1353;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1365);
    float _1377 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1371);
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1375, -0.5, 0.5);
    float _1383 = log2(_1333);
    float _1385 = fma(_1375, 0.5, 0.5);
    float _1387 = fma(_1385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1385, _1387, -0.212114393711090087890625);
    float _1393 = fma(_1385, _1391, 1.570728778839111328125);
    float _1395 = sqrt(_1381);
    float _1397 = _1383 * 0.693147182464599609375;
    float2 _4800 = float2(_1323, _1369);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4800, float2(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4800, float2(0.0), isnan(_4800)), level(0.0)).x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = -_1351;
    float _1405 = fma(_1389, _1359, _1403);
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1411 = fma(_1405, 0.5, 0.5);
    float _1413 = _1407 * _1361;
    float _1415 = _1409 * _1361;
    float _1417 = _1395 * 0.636619746685028076171875;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = -_1393;
    float _1425 = fma(_1417, _1423, 1.0);
    float3 _4851 = float3(_1419, _1421, _1401);
    float _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4851, float3(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4851, float3(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1419, _1421, _1401);
    float4 _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).xyzw;
    float _1432 = _1430.x;
    float _1434 = _1430.y;
    float _1436 = _1430.z;
    float _1438 = _1430.w;
    float2 _4878 = float2(_1425, _1411);
    float3 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).xyz;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = float(uint(_303));
    float _1452 = trunc(_513);
    int _1454 = int(_1452);
    float _1456 = _349 * _155;
    int _1458 = ~_303;
    int _1460 = _1458 + 1;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _277 + _1462;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1468 = _1466 != 0;
    float _1470 = -_521;
    float _1472 = _1470 + 1.0;
    float _1474 = -_519;
    float _1476 = _1474 + 1.0;
    float _1478 = 1.0 / _1450;
    float _1480 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = abs(_311);
    int _1488 = abs(_329);
    float _1490 = trunc(_1456);
    int _1492 = int(_1490);
    float _1494 = float(uint(_1454));
    int _1496 = ~_303;
    int _1498 = _1496 + 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1480);
    int _1506 = as_type<int>(_1478) + (-2);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = _287 > 0.5;
    float _1518 = as_type<float>(_1506) * _1494;
    bool _1520 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1522 = isnan(_277);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    bool _1532 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1534 = isnan(_277);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1518);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    float _1551 = -_1504;
    float _1553 = _1551 + 1.0;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1557 = _1460 * int(_1549);
    int _1559 = _1557 + _1454;
    float _1561 = float(uint(_1559));
    float _1563 = as_type<float>(_1506) * _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1567 = _1565 != 0;
    float _1569 = trunc(_1563);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    float _1575 = float(_1454);
    bool _1577 = !_1567;
    float _1579 = _1577 ? 7.345489978790283203125 : 1.0;
    bool _1581 = _1575 >= _335;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_335);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1579 * _285;
    float _1595 = trunc(_1591);
    int _1597 = int(_1595);
    int _1599 = int(_1549) + int(_1573);
    float _1601 = floor(_1593);
    int _1603 = _1498 * _1599;
    int _1605 = _1603 + _1454;
    bool _1607 = !_1484;
    int _1609 = _1607 ? 0 : 1;
    bool _1611 = _285 > 0.5;
    bool _1613 = uint(_1605) >= uint(_303);
    bool _1615 = !_1613;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _303 == 0;
    int _1621 = ~_1599;
    int _1623 = _1621 + _1617;
    int _1625 = _1623 + 1;
    float _1627 = -_1601;
    float _1629 = _1593 + _1627;
    int _1631 = _303 * _1625;
    int _1633 = _1631 + _1454;
    float _1635 = _1629 * _335;
    int _1637 = ~_1597;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1647 = abs(_307);
    bool _1649 = !_1619;
    int _1651 = _1649 ? _1633 : (-1);
    float _1653 = trunc(_1635);
    int _1655 = int(_1653);
    int _1657 = abs(_1609);
    int _1659 = _1651 * _1641;
    int _1661 = _303 + (-1);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1667 = 1.0 / _1645;
    int _1669 = _1597 * _1661;
    int _1671 = _1669 + _1659;
    int _1673 = _1671 * _1647;
    float _1675 = -_1530;
    float _1677 = _1675 + 1.0;
    int _1679 = _1655 * _1657;
    int _1681 = _1679 + _1454;
    float _1683 = 1.0 / _1510;
    int _1685 = _1492 * _1486;
    int _1687 = _1685 + _1673;
    bool _1689 = !_1468;
    int _1691 = _1689 ? 0 : 1;
    int _1693 = abs(_1691);
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1697 = _1695 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1699 = 1.0 / _1665;
    int _1701 = _1681 * _1488;
    int _1703 = _1701 + _1687;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1707 = _1705 != 0;
    int _1709 = _1655 * _1693;
    int _1711 = _1709 + _1703;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1717 = 1.0 / _1697;
    int _1719 = ~_303;
    int _1721 = _1719 + 1;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1723;
    float _1727 = float(uint(_1711));
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = _1725 * _1667;
    float _1739 = as_type<float>(_1506) * _1727;
    float _1741 = 1.0 / _1715;
    float _1743 = _1735 * _1699;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1749 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1751 = isnan(_277);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1731 * _1683;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1763;
    bool _1767 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1769 = isnan(_277);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1747 * _1717;
    float _1781 = trunc(_1739);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = -_1759;
    float _1789 = _1787 + 1.0;
    float _1791 = fma(_1761, _1464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1793 = _1777 * _1677;
    float _1795 = -_1777;
    float _1797 = _1795 + 1.0;
    float _1799 = _1765 * _1741;
    float _1801 = _1530 * _1789;
    bool _1803 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1805 = isnan(_277);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1817 = _277 + _1815;
    float _1819 = _1813 * _1797;
    int _1821 = _1721 * int(_1785);
    int _1823 = _1821 + _1711;
    float _1825 = -_1813;
    float _1827 = _1825 + 1.0;
    float _1829 = fma(_1737, _1817, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1831 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1833 = isnan(_277);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = float(uint(_1823));
    float _1845 = _1542 * _1827;
    float _1847 = -_1542;
    float _1849 = _1847 + 1.0;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1853 = _277 + _1851;
    float _1855 = as_type<float>(_1506) * _1843;
    float _1857 = _1841 * _1849;
    float _1859 = fma(_1743, _1853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1863 = _277 + _1861;
    float _1865 = float(uint(_1681));
    float _1867 = _1829 * _1857;
    float _1869 = trunc(_1855);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = -_1841;
    float _1877 = _1875 + 1.0;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1881 = _277 + _1879;
    float _1883 = fma(_1779, _1863, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1885 = as_type<float>(_1506) * _1865;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1867);
    float _1889 = fma(_1799, _1881, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1891 = ~_303;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1791, _1845, _1887);
    float _1897 = trunc(_1885);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = -_649;
    int _1905 = _1516 ? as_type<int>(_1903) : as_type<int>(_649);
    float _1907 = fma(_1859, _1819, _1895);
    int _1909 = ~_303;
    int _1911 = _1909 + 1;
    int _1913 = int(_1785) + int(_1873);
    float _1915 = fma(_1883, _1793, _1907);
    float _1917 = -_655;
    int _1919 = _1611 ? as_type<int>(_1917) : as_type<int>(_655);
    bool _1921 = !_1514;
    float _1923 = _1921 ? _649 : as_type<float>(_1905);
    int _1925 = _1893 * _1913;
    int _1927 = _1925 + _1711;
    bool _1929 = !_1502;
    float _1931 = _1929 ? _655 : as_type<float>(_1919);
    int _1933 = _1911 * int(_1901);
    int _1935 = _1933 + _1681;
    float _1937 = _1931 + 0.5;
    bool _1939 = uint(_1927) >= uint(_303);
    float _1941 = _1923 + (-0.5);
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].x, _489);
    float _1945 = fma(_1889, _1801, _1915);
    float _1947 = float(uint(_1935));
    float _1949 = -_1941;
    float _1951 = -_483;
    float _1953 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1951);
    bool _1955 = !_1939;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1945);
    float _1961 = -_1476;
    float _1963 = fma(_1931, _1961, _1943);
    float _1965 = as_type<float>(_1506) * _1947;
    float _1967 = fma(_1923, _1472, _1953);
    int _1969 = ~_1913;
    int _1971 = _1969 + _1957;
    int _1973 = _1971 + 1;
    float _1975 = abs(_995);
    float _1977 = log2(_1975);
    float _1979 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1981 = _303 * _1973;
    int _1983 = _1981 + _1711;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1987 = trunc(_1965);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1997 = !_1619;
    int _1999 = _1997 ? _1983 : (-1);
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2003 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2005 = _1999 >> 31;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2013 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2019 = int(_1901) + int(_1991);
    float _2021 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2023 = _2005 & 3;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2013;
    out.m_64.y = _2015;
    out.m_64.z = _2017;
    out.m_64.w = _2011;
    int _2029 = ~_303;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2003);
    float _2035 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2021;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _1979;
    float _2037 = -_1399;
    float _2039 = _2037 + 1.0;
    int _2041 = _1999 & 3;
    bool _2043 = _2041 != 0;
    out.m_68.x = _1963;
    out.m_68.y = _1967;
    bool _2045 = _995 <= 8000.0;
    bool _2047 = isnan(_995);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    int _2057 = _1999 + _2023;
    float _2059 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2061 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2063 = _2057 >> 2;
    float _2065 = -_715;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2059);
    float _2069 = -_715;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2035);
    float _2073 = -_715;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    int _2077 = _2063 << 4;
    int _2079 = _2077 + 368;
    int _2081 = _2031 * _2019;
    int _2083 = _2081 + _1681;
    float _2085 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2075);
    uint _2091 = uint(int(uint(_2079) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2067);
    bool _2109 = uint(_2083) >= uint(_303);
    float _2111 = _731 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2113 = _1999 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = _731 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2119 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2121 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2123 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2125 = uint(_2113) > 1u;
    float _2127 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2129 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2071);
    float _2131 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2123);
    float _2133 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2135 = _2079 + 8;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _731 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2119);
    int _2157 = _2043 ? 0 : 1;
    float _2159 = _2133 * _2107;
    float _2161 = _2133 * _2129;
    float _2163 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2133 * _2089;
    float _2167 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2169 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    int _2171 = ~_2157;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    float _2177 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2179 = _2175;
    float _2181 = _1349;
    if (!_2125)
    {
        int _2183 = ~_2157;
        int _2185 = _2183 + 1;
        _2179 = _2185;
    }
    int _2187 = _2179;
    float _2189 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2127);
    float _2191 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2193 = fma(_2087, -2.0, 3.0);
    float _2195 = _2087 * _2087;
    bool _2197 = _2113 != 3;
    float _2199 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2131);
    int _2201 = abs(_2187);
    float _2203 = _2195 * _2193;
    bool _2205 = uint(_2113) >= 2u;
    float _2207 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2155);
    float _2209 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2169);
    bool _2211 = !_2109;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _1555 * _1427;
    bool _2217 = !_2115;
    int _2219 = _2217 ? 0 : 1;
    int _2221 = _2205 ? 0 : 1;
    int _2223 = ~_2201;
    int _2225 = _2223 + 1;
    int _2227 = _2225 + 1;
    int _2229 = ~_2019;
    int _2231 = _2229 + _2213;
    int _2233 = _2231 + 1;
    bool _2235 = _2113 != 3;
    int _2237 = abs(_2219);
    int _2239 = _303 * _2233;
    int _2241 = _2239 + _1681;
    int _2243 = ~_2221;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2247;
    if (_2197)
    {
        int _2251 = ~_2221;
        int _2253 = _2251 + 1;
        _2249 = _2253;
    }
    int _2255 = _2249;
    int _2257 = _2227 * as_type<int>(_2105);
    bool _2259 = !_2235;
    int _2261 = _2259 ? 0 : (-1);
    bool _2263 = !_1707;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2261);
    int _2269 = abs(_2255);
    int _2271 = ~_2237;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    float _2277 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2279 = abs(_2265);
    int _2281 = _2275 * as_type<int>(_2097);
    int _2283 = _2281 + _2257;
    int _2285 = ~_2269;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = fma(_2277, _2177, _2159);
    int _2293 = ~_2267;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    int _2299 = _2289 * as_type<int>(_2143);
    int _2301 = _2299 + _2283;
    int _2303 = ~_2279;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    float _2309 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2311 = fma(_2277, _2191, _2165);
    int _2313 = _2297 * as_type<int>(_2151);
    int _2315 = _2313 + _2301;
    bool _2317 = !_1619;
    int _2319 = _2317 ? _2241 : (-1);
    float _2321 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2309);
    float _2323 = -_2203;
    float _2325 = _2323 + 1.0;
    int _2327 = _2315 * _2307;
    float _2329 = fma(_2277, _2189, _2161);
    float _2331 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2203);
    int _2335 = _2319 * _2279;
    int _2337 = _2335 + _2327;
    float _2339 = _2199 + _2291;
    float _2341 = in.m_70.x;
    float _2343 = _2055 * _2333;
    float _2345 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2347 = _1349 * 0.5;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2351 = _1407 + _1349;
    float _2353 = _1448 * _2215;
    float _2355 = fma(_1409, -0.5, _2347);
    float _2357 = _2039 * _2349;
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _1349;
    float _2361 = _2207 + _2329;
    float _2363 = float(_2337);
    float _2365 = -_2359;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2369 = _2209 + _2311;
    float _2371 = fma(_1438, _2353, _1436);
    bool _2373 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2375 = isnan(_1139);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2381 = _2377 || _2379;
    out.m_72.x = _2363;
    float _2383 = _2345 + _1349;
    float _2385 = _2351 * 0.5;
    out.m_74.x = _2339;
    out.m_74.y = _2361;
    out.m_74.z = _2369;
    float _2387 = _2383 * 0.5;
    float _2389 = _1438 * _2215;
    float _2391 = _2367 * _2341;
    float _2393 = -_1555;
    float _2395 = _2393 + 1.0;
    out.m_76.x = _2385;
    out.m_76.y = _2355;
    out.m_76.z = _2387;
    out.m_76.w = _1349;
    float _2397 = fma(_1444, _2389, _1432);
    float _2399 = fma(_1446, _2389, _1434);
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2403 = _1438 * _2395;
    float _2405 = _1047 * _1103;
    float _2407 = _2345;
    float _2409 = _2389;
    float _2411 = _2355;
    float _2413 = _2385;
    float _2415 = _2405;
    if (!_2381)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2417 = _2181;
    out.m_78.x = _2401;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2381)
    {
        _2407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2423 = _2407;
    float _2425 = _2423;
    float _2427 = _2423;
    if (!_2381)
    {
        _2409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2429 = _2409;
    out.m_80.x = _2397;
    out.m_80.y = _2399;
    out.m_80.z = _2371;
    out.m_80.w = _2403;
    float _2431 = _2405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2429;
    if (!_2381)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2437 = _2411;
    float _2439 = _2437;
    float _2441 = _2437;
    if (!_2381)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2443 = _2413;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2381)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2449 = _2415;
    bool _2451 = !_2381;
    float _2453 = _2449;
    float _2455 = _2449;
    if (!_2451)
    {
        bool _2457 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2459 = isnan(_1139);
        bool _2461 = _2457 || _2459;
        bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2465 = _2461 || _2463;
        if (!_2465)
        {
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = _1139 + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2473 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2471;
            float _2475 = 1.0 / _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2497 = _2469 * _2475;
            float _2499 = precise::clamp(_2497, 0.0, 1.0);
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2505 = fma(_2499, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2507 = fma(_2499, _2503, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2509 = fma(_2499, _2483, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2499, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2513 = fma(_2499, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2515 = fma(_2499, _2495, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2447 = _2507;
            _2435 = _2513;
            _2441 = _2505;
            _2427 = _2511;
            _2421 = _2509;
            _2455 = _2515;
            _2517 = true;
        }
        else
        {
            bool _2519 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2521 = isnan(_1139);
            bool _2523 = _2519 || _2521;
            bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2527 = _2523 || _2525;
            if (!_2527)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2529 = _2439;
            _2441 = _2529;
            if (!_2527)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2531 = _2445;
            _2447 = _2531;
            if (!_2527)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2533 = _2419;
            _2421 = _2533;
            if (!_2527)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2535 = _2425;
            _2427 = _2535;
            if (!_2527)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2537 = _2433;
            _2435 = _2537;
            if (!_2527)
            {
                _2453 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2539 = _2453;
            bool _2541 = !_2527;
            _2455 = _2539;
            if (!_2541)
            {
                bool _2543 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2545 = isnan(_1139);
                bool _2547 = _2543 || _2545;
                bool _2549 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2551 = _2547 || _2549;
                if (!_2551)
                {
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = _1139 + _2553;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2557;
                    float _2561 = 1.0 / _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2583 = _2555 * _2561;
                    float _2585 = precise::clamp(_2583, 0.0, 1.0);
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2591 = fma(_2585, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2593 = fma(_2585, _2589, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2595 = fma(_2585, _2569, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2585, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2599 = fma(_2585, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2601 = fma(_2585, _2581, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2447 = _2593;
                    _2435 = _2599;
                    _2441 = _2591;
                    _2427 = _2597;
                    _2421 = _2595;
                    _2455 = _2601;
                    _2517 = true;
                }
                else
                {
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2455 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2517 = false;
    float _2603 = _2447;
    float _2605 = _2435;
    float _2607 = _2441;
    float _2609 = _2427;
    float _2611 = _2421;
    float _2613 = _2455;
    float _2615 = fma(_2361, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2603;
    float _2621 = _2619 + _2605;
    float _2623 = -_2607;
    float _2625 = _2623 + _2609;
    out.m_82.x = 0.0;
    float _2627 = fma(_2617, _2621, _2603);
    float _2629 = -_2611;
    float _2631 = _2629 + _2613;
    float _2633 = fma(_2617, _2625, _2607);
    float _2635 = _2627 * 0.586610972881317138671875;
    bool _2637 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2639 = fma(_2617, _2631, _2611);
    float _2641 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = fma(_2633, 0.298911988735198974609375, _2635);
    bool _2645 = _1047 > 0.0;
    bool _2647 = isnan(_1047);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(0.0);
    bool _2653 = _2649 || _2651;
    float _2655 = fma(_2639, 0.114477999508380889892578125, _2643);
    out.m_53.x = _2641;
    bool _2657 = _1103 <= 0.0;
    bool _2659 = !_2653;
    bool _2661 = _2657 || _2659;
    float _2663 = -_2655;
    float _2665 = _2633 + _2663;
    float _2667 = -_2655;
    float _2669 = _2627 + _2667;
    float _2671 = -_2655;
    float _2673 = _2639 + _2671;
    float _2675 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2677 = fma(_2669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2679 = fma(_2673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    bool _2681 = !_2637;
    if (!_2681)
    {
        float _2683 = -_983;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2687 = -_985;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2691 = -_987;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2695 = _2685 * _2685;
        float _2697 = fma(_2689, _2689, _2695);
        float _2699 = fma(_2693, _2693, _2697);
        float _2701 = sqrt(_2699);
        float _2703 = rsqrt(_2699);
        float _2705 = -_2701;
        float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2711 = precise::clamp(_2709, 0.0, 1.0);
        float _2713 = _2689 * _2703;
        float _2715 = _2685 * _2703;
        float _2717 = abs(_2711);
        float _2719 = log2(_2717);
        float _2721 = _2693 * _2703;
        float _2723 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2725 = _2361 * _2715;
        float _2727 = -_2715;
        float _2729 = -_2723;
        float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2729);
        float _2733 = fma(_2339, _2713, _2725);
        float _2735 = -_2721;
        float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2731);
        float _2739 = fma(_2369, _2721, _2733);
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2745 = _2737 + _2743;
        float _2747 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2749 = _2745 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2751 = precise::clamp(_2749, 0.0, 1.0);
        float _2753 = exp2(_2747);
        float _2755 = _2753 * _2751;
        float _2757 = _2741 * _2755;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2763 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2759;
        out.m_82.y = _2761;
        out.m_82.z = _2763;
    }
    out.m_84.x = _2675;
    out.m_84.y = _2677;
    out.m_84.z = _2679;
    if (!_2661)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2765 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2765;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2517 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2833 = as_type<float>(_127);
        out.gl_Position.z = _2833;
    }
    if (!_113)
    {
        return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_153);
        out.gl_Position.z = _2888;
    }
    if (_147)
    {
        return out;
    }
    float _155 = 1.0 / _141;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _109 * _155;
    bool _161 = !_157;
    float _163 = _159;
    float _181;
    if (!_161)
    {
        float _165 = in.m_55.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _159;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _213 = isnan(_185);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _229 = 1.0 / _205;
    float _231 = _221 * _209;
    float _233 = -_221;
    float _235 = _233 + 1.0;
    float _237 = _189 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _239;
    float _243 = fma(_225, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _245 = fma(_241, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _247 = _243 * _231;
    float _249 = _245 * _231;
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_227;
    if (!_259)
    {
        float _261 = in.m_55.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = in.m_55.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_55.x;
    float _287 = in.m_55.y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _299 = _297 != 0;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _303 = int(_301);
    bool _305 = !_295;
    int _307 = _305 ? 0 : 1;
    bool _309 = !_291;
    int _311 = _309 ? 0 : 1;
    float _313 = _283 * _109;
    bool _315 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = exp2(_313);
    bool _327 = !_299;
    int _329 = _327 ? 0 : 1;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _333 = _279 * 2.0;
    float _335 = float(_303);
    float _337 = _287 * 2.0;
    float _339 = _285 * 2.0;
    float _341 = floor(_333);
    float _343 = _285 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _345 = _287 + _285;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = _335 * _109;
    float _351 = -_331;
    float _353 = fma(_343, 2.0, _351);
    float _355 = _345 + (-1.0);
    float _357 = -_325;
    float _359 = _357 + 1.0;
    float _361 = floor(_339);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _365 = _323 ? _359 : 0.0;
    float _367 = floor(_337);
    bool _369 = _341 > 0.0;
    float _371 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _373 = _341 >= 0.0;
    bool _375 = isnan(_341);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = fma(_371, -2.0, _347);
    int _385 = _381 ? 0 : 1;
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _389 = int(_387);
    bool _391 = _361 > 0.0;
    bool _393 = _361 >= 0.0;
    bool _395 = isnan(_361);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    int _403 = ~_385;
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    int _409 = _407;
    if (!_369)
    {
        int _411 = ~_385;
        int _413 = _411 + 1;
        _409 = _413;
    }
    int _415 = _409;
    bool _417 = _367 > 0.0;
    bool _419 = _367 >= 0.0;
    bool _421 = isnan(_367);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = in.m_57.x;
    float _431 = in.m_57.y;
    float _433 = in.m_57.z;
    int _435 = _401 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = float(_389);
    bool _451 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _453 = isnan(1.0);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _463 = 1.0 + _461;
    bool _465 = !_439;
    int _467 = _465 ? 0 : 1;
    float _469 = 1.0 / _449;
    float _471 = float(_415);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _475 = 1.0 / _463;
    int _477 = abs(_467);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _481 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[78].z, _473);
    float _483 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _383);
    float _485 = float(_477);
    float _487 = -_109;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[76].x, _353);
    bool _491 = !_443;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _479);
    int _497 = ~_435;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _485 * _471;
    int _505 = _501;
    if (!_391)
    {
        int _507 = ~_435;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _469 * _109;
    int _515 = abs(_493);
    float _517 = _503 * (-2.0);
    float _519 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _481);
    float _521 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _495);
    if (_459)
    {
        float _523 = _365 * _475;
        _119 = _523;
    }
    float _525 = _119;
    float _527 = _285 + (-0.5);
    float _529 = fma(_517, _429, _429);
    float _531 = float(_511);
    float _533 = fma(_363, _517, _363);
    float _535 = float(_515);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _529);
    int _539 = _427 ? 0 : 1;
    float _541 = _287 + _279;
    bool _543 = !_447;
    int _545 = _543 ? 0 : 1;
    float _547 = _535 * _531;
    int _549 = ~_539;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_533, _525, _537);
    int _557 = _553;
    if (!_417)
    {
        int _559 = ~_539;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = _541 + (-1.0);
    int _567 = abs(_545);
    float _569 = _547 * (-2.0);
    float _571 = _555 * 0.15915493667125701904296875;
    float _573 = float(_563);
    float _575 = fma(_569, _431, _431);
    float _577 = float(_567);
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = _287 + (-0.5);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _279 + _285;
    float _587 = _577 * _573;
    float _589 = fma(_579, _569, _579);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    float _593 = in.m_62.x;
    float _595 = in.m_62.y;
    float _597 = _585 + (-1.0);
    float _599 = _587 * (-2.0);
    float _601 = fma(_589, _525, _591);
    float _603 = _279 + (-0.5);
    float _605 = in.m_46.x;
    float _607 = in.m_46.y;
    float _609 = in.m_46.z;
    float _611 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _613 = fma(_599, _433, _433);
    float _615 = _601 * 0.15915493667125701904296875;
    float _617 = _571 * 6.283185482025146484375;
    float _619 = sin(_617);
    float _621 = fma(_611, _599, _611);
    float _623 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _625 = fma(_621, _525, _623);
    float _627 = _571 * 6.283185482025146484375;
    float _629 = cos(_627);
    int _631 = as_type<int>(_583) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_583) & 2;
    bool _637 = _635 != 0;
    float _639 = _625 * 0.15915493667125701904296875;
    float _641 = _255 * _593;
    float _643 = _615 * 6.283185482025146484375;
    float _645 = sin(_643);
    bool _647 = !_637;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _257 * _595;
    bool _653 = !_633;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _661 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _615 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _675 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _657);
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _659);
    bool _679 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _681 = isnan(0.5);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _687 = _683 || _685;
    float _689 = _639 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _695 = _619 * _645;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _705 = _701 || _703;
    float _707 = _663 * _693;
    float _709 = _669 * _671;
    float _711 = _629 * _645;
    float _713 = _639 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _629 * _667;
    float _719 = _619 * _667;
    float _721 = _629 * _691;
    float _723 = _619 * _691;
    float _725 = _667 * _691;
    float _727 = _645 * _691;
    float _729 = _723 * _707;
    float _731 = fma(_715, _717, _695);
    float _733 = fma(_715, _695, _717);
    float _735 = _721 * _707;
    float _737 = -_711;
    float _739 = fma(_715, _719, _737);
    float _741 = -_719;
    float _743 = fma(_715, _711, _741);
    float _745 = -_707;
    float _747 = _715 * _745;
    float _749 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _751 = fma(_731, _709, _735);
    float _753 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    float _755 = fma(_725, _709, _747);
    float _757 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _677);
    float _759 = fma(_743, _749, _751);
    float _761 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _763 = fma(_739, _709, _729);
    float _765 = fma(_727, _749, _755);
    float _767 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _769 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _771 = fma(_733, _749, _763);
    float _773 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _767);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _769);
    float _779 = _753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _775);
    float _785 = _761 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _777);
    float _789 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].x, _781);
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _789);
    float _799 = _785 + _791;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _803 = _779 + _795;
    float _805 = _797 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _799 + _807;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _815 = _803 + _813;
    float _817 = 1.0 / _805;
    float _819 = _809 * _809;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_815, _815, _819);
    float _827 = _821 + _805;
    float _829 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = sqrt(_825);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _837 = _827 * _817;
    float _839 = _837 * 0.5;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _843 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[30].w, _841);
    float _845 = _773 + _835;
    float _847 = 1.0 / _843;
    bool _849 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _817;
    float _853 = _799;
    float _855 = _831;
    float _857 = _825;
    float _859 = _805;
    float _861 = _843;
    if (!_849)
    {
        _851 = _803;
    }
    float _863 = _851;
    float _865 = 0.0;
    float _867 = _863;
    if (!_849)
    {
        _865 = _845;
    }
    float _869 = _865;
    bool _871 = !_849;
    float _873 = _869;
    if (!_871)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _879 = _831 + _877;
        float _881 = rsqrt(_825);
        float _883 = _879 * _875;
        float _885 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = _887 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 + (-1.0);
        float _899 = _897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = fma(_895, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = fma(_845, _891, _899);
        float _905 = _881 * _901;
        float _907 = fma(_815, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _909 = fma(_809, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _907;
        _853 = _909;
        _873 = _903;
        _855 = _887;
        _857 = _881;
    }
    float _911 = _867;
    float _913 = _853;
    float _915 = _873;
    float _917 = _855;
    float _919 = _857;
    float _921 = _915;
    float _923 = _911;
    float _925 = _913;
    float _927 = _917;
    if (_705)
    {
        _859 = 1.0;
    }
    float _929 = _859;
    float _931 = _929;
    if (!_687)
    {
        float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _935 = _773 + _933;
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _939 = _779 + _937;
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _943 = -_779;
        float _945 = _943 + _911;
        float _947 = _935 * _935;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _951 = _785 + _949;
        float _953 = -_785;
        float _955 = _953 + _913;
        float _957 = fma(_939, _939, _947);
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _961 = fma(_951, _951, _957);
        float _963 = sqrt(_961);
        float _965 = _941 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _967 = precise::min(_963, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _969 = _967 * _959;
        float _971 = -_773;
        float _973 = _971 + _915;
        float _975 = _965 * _969;
        float _977 = fma(_973, _975, _773);
        float _979 = fma(_945, _975, _779);
        float _981 = fma(_955, _975, _785);
        _921 = _977;
        _923 = _979;
        _925 = _981;
    }
    float _983 = _921;
    float _985 = _923;
    float _987 = _925;
    float _989 = 0.0;
    if (_705)
    {
        _989 = 1.0;
    }
    float _991 = _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _995 = _847 * _993;
    float _997 = _991;
    if (!_705)
    {
        float _999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1005 = _1001 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1003 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1007;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1041 = fma(_995, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        _931 = _1045;
    }
    float _1047 = _931;
    if (!_705)
    {
        float _1049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = _1051 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        float _1059 = _1053 * 0.15915493667125701904296875;
        float _1061 = _1051 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        float _1065 = 1.0 / _1057;
        float _1067 = _1059 * 6.283185482025146484375;
        float _1069 = cos(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = _1059 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = _1069 * _1071;
        float _1079 = 1.0 / _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1083 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1081;
        float _1085 = 1.0 / _1083;
        float _1087 = _1075 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1091 = fma(_995, _1087, _1089);
        float _1093 = _1091 * _1085;
        float _1095 = precise::clamp(_1093, 0.0, 1.0);
        float _1097 = -_1095;
        float _1099 = _1097 + 1.0;
        _927 = _1079;
        _997 = _1099;
    }
    float _1101 = _927;
    float _1103 = _997;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _983 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _985 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1115 = _987 + _1113;
    float _1117 = _1107 * _1107;
    float _1119 = _983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = _983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1127 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1129 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1121);
    float _1131 = fma(_1115, _1115, _1123);
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1127);
    float _1135 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1137 = rsqrt(_1131);
    float _1139 = sqrt(_1131);
    float _1141 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1143 = _1111 * _1141;
    float _1145 = _1115 * _1141;
    float _1147 = _1143 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 + _1149;
    float _1153 = sqrt(_1151);
    bool _1155 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1153 + _1157;
    float _1161 = _919;
    float _1163 = _1151;
    float _1165 = _1159;
    float _1167 = _1107;
    float _1169 = _1143;
    float _1171 = _1145;
    float _1173 = _1147;
    if (_1155)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1161 = _1175;
    }
    float _1177 = _1161;
    if (_1155)
    {
        float _1179 = rsqrt(_1151);
        _1163 = _1179;
    }
    float _1181 = _1163;
    if (_1155)
    {
        float _1183 = _1159 * _1177;
        _1165 = _1183;
    }
    float _1185 = _1165;
    if (_1155)
    {
        float _1187 = _1185 * 0.15915493667125701904296875;
        _861 = _1187;
    }
    float _1189 = _861;
    float _1191 = _1101;
    float _1193 = _1189;
    if (_1155)
    {
        float _1195 = _1189 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        _1191 = _1197;
    }
    float _1199 = _1191;
    float _1201 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1203 = precise::max(0.0, _1201);
    float _1205 = _1177;
    float _1207 = _1203;
    if (_1155)
    {
        float _1209 = _1189 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = -_1141;
    float _1217 = -_1203;
    float _1219 = fma(_1107, _1215, _1217);
    if (_1155)
    {
        float _1221 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1167 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1199;
    if (_1155)
    {
        float _1227 = fma(_1199, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1207 = _1227;
    }
    float _1229 = _1207;
    float _1231 = floor(_1125);
    float _1233 = _1229;
    float _1235 = _1213;
    if (_1155)
    {
        float _1237 = _1213 + (-1.0);
        _1225 = _1237;
    }
    float _1239 = _1225;
    float _1241 = _1239;
    if (_1155)
    {
        float _1243 = _1181 * _1229;
        _1193 = _1243;
    }
    float _1245 = _1193;
    if (!_1155)
    {
        _1233 = _1219;
    }
    float _1247 = _1233;
    float _1249 = _1247;
    if (_1155)
    {
        float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1251;
    }
    float _1253 = _1241;
    if (_1155)
    {
        float _1255 = _1143 * _1245;
        _1169 = _1255;
    }
    float _1257 = _1169;
    if (_1155)
    {
        float _1259 = _1145 * _1245;
        _1171 = _1259;
    }
    float _1261 = _1171;
    if (_1155)
    {
        float _1263 = fma(_1219, _1213, _1253);
        _1249 = _1263;
    }
    float _1265 = _1249;
    if (_1155)
    {
        float _1267 = _1257 * _1257;
        _1173 = _1267;
    }
    float _1269 = _1173;
    float _1271 = _983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1155)
    {
        _1235 = _1149;
    }
    float _1273 = _1235;
    float _1275 = _1273;
    if (_1155)
    {
        float _1277 = _1261 * _1261;
        _1275 = _1277;
    }
    float _1279 = _1275;
    float _1281 = fma(_1265, _1265, _1269);
    float _1283 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1287 = _983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1291 = _1281 + _1279;
    float _1293 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1295 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1297 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1301 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1299);
    float _1303 = precise::clamp(_1301, 0.0, 1.0);
    float _1305 = rsqrt(_1291);
    float _1307 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1295);
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1311 = -_1303;
    float _1313 = _1311 + 1.0;
    float _1315 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1321 = -_1231;
    float _1323 = _1125 + _1321;
    float _1325 = floor(_1283);
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1319);
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1285, 1.0);
    float _1335 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1343 = abs(_1313);
    float _1345 = log2(_1343);
    float _1347 = _1305 * _1257;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1339);
    float _1351 = _1305 * _1265;
    float _1353 = _1305 * _1261;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1357 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1341);
    float _1359 = _1351 + 1.0;
    float _1361 = 1.0 / _1349;
    float _1363 = -_1355;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1363);
    float _1367 = -_1325;
    float _1369 = _1283 + _1367;
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1337);
    float _1373 = -_1353;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1365);
    float _1377 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1371);
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1375, -0.5, 0.5);
    float _1383 = log2(_1333);
    float _1385 = fma(_1375, 0.5, 0.5);
    float _1387 = fma(_1385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1385, _1387, -0.212114393711090087890625);
    float _1393 = fma(_1385, _1391, 1.570728778839111328125);
    float _1395 = sqrt(_1381);
    float _1397 = _1383 * 0.693147182464599609375;
    float2 _4800 = float2(_1323, _1369);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4800, float2(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4800, float2(0.0), isnan(_4800)), level(0.0)).x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = -_1351;
    float _1405 = fma(_1389, _1359, _1403);
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1411 = fma(_1405, 0.5, 0.5);
    float _1413 = _1407 * _1361;
    float _1415 = _1409 * _1361;
    float _1417 = _1395 * 0.636619746685028076171875;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = -_1393;
    float _1425 = fma(_1417, _1423, 1.0);
    float3 _4851 = float3(_1419, _1421, _1401);
    float _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4851, float3(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4851, float3(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1419, _1421, _1401);
    float4 _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).xyzw;
    float _1432 = _1430.x;
    float _1434 = _1430.y;
    float _1436 = _1430.z;
    float _1438 = _1430.w;
    float2 _4878 = float2(_1425, _1411);
    float3 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).xyz;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = float(uint(_303));
    float _1452 = trunc(_513);
    int _1454 = int(_1452);
    float _1456 = _349 * _155;
    int _1458 = ~_303;
    int _1460 = _1458 + 1;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _277 + _1462;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1468 = _1466 != 0;
    float _1470 = -_521;
    float _1472 = _1470 + 1.0;
    float _1474 = -_519;
    float _1476 = _1474 + 1.0;
    float _1478 = 1.0 / _1450;
    float _1480 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = abs(_311);
    int _1488 = abs(_329);
    float _1490 = trunc(_1456);
    int _1492 = int(_1490);
    float _1494 = float(uint(_1454));
    int _1496 = ~_303;
    int _1498 = _1496 + 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1480);
    int _1506 = as_type<int>(_1478) + (-2);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = _287 > 0.5;
    float _1518 = as_type<float>(_1506) * _1494;
    bool _1520 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1522 = isnan(_277);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    bool _1532 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1534 = isnan(_277);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1518);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    float _1551 = -_1504;
    float _1553 = _1551 + 1.0;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1557 = _1460 * int(_1549);
    int _1559 = _1557 + _1454;
    float _1561 = float(uint(_1559));
    float _1563 = as_type<float>(_1506) * _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1567 = _1565 != 0;
    float _1569 = trunc(_1563);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    float _1575 = float(_1454);
    bool _1577 = !_1567;
    float _1579 = _1577 ? 7.345489978790283203125 : 1.0;
    bool _1581 = _1575 >= _335;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_335);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1579 * _285;
    float _1595 = trunc(_1591);
    int _1597 = int(_1595);
    int _1599 = int(_1549) + int(_1573);
    float _1601 = floor(_1593);
    int _1603 = _1498 * _1599;
    int _1605 = _1603 + _1454;
    bool _1607 = !_1484;
    int _1609 = _1607 ? 0 : 1;
    bool _1611 = _285 > 0.5;
    bool _1613 = uint(_1605) >= uint(_303);
    bool _1615 = !_1613;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _303 == 0;
    int _1621 = ~_1599;
    int _1623 = _1621 + _1617;
    int _1625 = _1623 + 1;
    float _1627 = -_1601;
    float _1629 = _1593 + _1627;
    int _1631 = _303 * _1625;
    int _1633 = _1631 + _1454;
    float _1635 = _1629 * _335;
    int _1637 = ~_1597;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1647 = abs(_307);
    bool _1649 = !_1619;
    int _1651 = _1649 ? _1633 : (-1);
    float _1653 = trunc(_1635);
    int _1655 = int(_1653);
    int _1657 = abs(_1609);
    int _1659 = _1651 * _1641;
    int _1661 = _303 + (-1);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1667 = 1.0 / _1645;
    int _1669 = _1597 * _1661;
    int _1671 = _1669 + _1659;
    int _1673 = _1671 * _1647;
    float _1675 = -_1530;
    float _1677 = _1675 + 1.0;
    int _1679 = _1655 * _1657;
    int _1681 = _1679 + _1454;
    float _1683 = 1.0 / _1510;
    int _1685 = _1492 * _1486;
    int _1687 = _1685 + _1673;
    bool _1689 = !_1468;
    int _1691 = _1689 ? 0 : 1;
    int _1693 = abs(_1691);
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1697 = _1695 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1699 = 1.0 / _1665;
    int _1701 = _1681 * _1488;
    int _1703 = _1701 + _1687;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1707 = _1705 != 0;
    int _1709 = _1655 * _1693;
    int _1711 = _1709 + _1703;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1717 = 1.0 / _1697;
    int _1719 = ~_303;
    int _1721 = _1719 + 1;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1723;
    float _1727 = float(uint(_1711));
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = _1725 * _1667;
    float _1739 = as_type<float>(_1506) * _1727;
    float _1741 = 1.0 / _1715;
    float _1743 = _1735 * _1699;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1749 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1751 = isnan(_277);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1731 * _1683;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1763;
    bool _1767 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1769 = isnan(_277);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1747 * _1717;
    float _1781 = trunc(_1739);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = -_1759;
    float _1789 = _1787 + 1.0;
    float _1791 = fma(_1761, _1464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1793 = _1777 * _1677;
    float _1795 = -_1777;
    float _1797 = _1795 + 1.0;
    float _1799 = _1765 * _1741;
    float _1801 = _1530 * _1789;
    bool _1803 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1805 = isnan(_277);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1817 = _277 + _1815;
    float _1819 = _1813 * _1797;
    int _1821 = _1721 * int(_1785);
    int _1823 = _1821 + _1711;
    float _1825 = -_1813;
    float _1827 = _1825 + 1.0;
    float _1829 = fma(_1737, _1817, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1831 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1833 = isnan(_277);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = float(uint(_1823));
    float _1845 = _1542 * _1827;
    float _1847 = -_1542;
    float _1849 = _1847 + 1.0;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1853 = _277 + _1851;
    float _1855 = as_type<float>(_1506) * _1843;
    float _1857 = _1841 * _1849;
    float _1859 = fma(_1743, _1853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1863 = _277 + _1861;
    float _1865 = float(uint(_1681));
    float _1867 = _1829 * _1857;
    float _1869 = trunc(_1855);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = -_1841;
    float _1877 = _1875 + 1.0;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1881 = _277 + _1879;
    float _1883 = fma(_1779, _1863, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1885 = as_type<float>(_1506) * _1865;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1867);
    float _1889 = fma(_1799, _1881, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1891 = ~_303;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1791, _1845, _1887);
    float _1897 = trunc(_1885);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = -_649;
    int _1905 = _1516 ? as_type<int>(_1903) : as_type<int>(_649);
    float _1907 = fma(_1859, _1819, _1895);
    int _1909 = ~_303;
    int _1911 = _1909 + 1;
    int _1913 = int(_1785) + int(_1873);
    float _1915 = fma(_1883, _1793, _1907);
    float _1917 = -_655;
    int _1919 = _1611 ? as_type<int>(_1917) : as_type<int>(_655);
    bool _1921 = !_1514;
    float _1923 = _1921 ? _649 : as_type<float>(_1905);
    int _1925 = _1893 * _1913;
    int _1927 = _1925 + _1711;
    bool _1929 = !_1502;
    float _1931 = _1929 ? _655 : as_type<float>(_1919);
    int _1933 = _1911 * int(_1901);
    int _1935 = _1933 + _1681;
    float _1937 = _1931 + 0.5;
    bool _1939 = uint(_1927) >= uint(_303);
    float _1941 = _1923 + (-0.5);
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].x, _489);
    float _1945 = fma(_1889, _1801, _1915);
    float _1947 = float(uint(_1935));
    float _1949 = -_1941;
    float _1951 = -_483;
    float _1953 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1951);
    bool _1955 = !_1939;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1945);
    float _1961 = -_1476;
    float _1963 = fma(_1931, _1961, _1943);
    float _1965 = as_type<float>(_1506) * _1947;
    float _1967 = fma(_1923, _1472, _1953);
    int _1969 = ~_1913;
    int _1971 = _1969 + _1957;
    int _1973 = _1971 + 1;
    float _1975 = abs(_995);
    float _1977 = log2(_1975);
    float _1979 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1981 = _303 * _1973;
    int _1983 = _1981 + _1711;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1987 = trunc(_1965);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1997 = !_1619;
    int _1999 = _1997 ? _1983 : (-1);
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2003 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2005 = _1999 >> 31;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2013 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2019 = int(_1901) + int(_1991);
    float _2021 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2023 = _2005 & 3;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2013;
    out.m_64.y = _2015;
    out.m_64.z = _2017;
    out.m_64.w = _2011;
    int _2029 = ~_303;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2003);
    float _2035 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2021;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _1979;
    float _2037 = -_1399;
    float _2039 = _2037 + 1.0;
    int _2041 = _1999 & 3;
    bool _2043 = _2041 != 0;
    out.m_68.x = _1963;
    out.m_68.y = _1967;
    bool _2045 = _995 <= 8000.0;
    bool _2047 = isnan(_995);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    int _2057 = _1999 + _2023;
    float _2059 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2061 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2063 = _2057 >> 2;
    float _2065 = -_715;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2059);
    float _2069 = -_715;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2035);
    float _2073 = -_715;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    int _2077 = _2063 << 4;
    int _2079 = _2077 + 368;
    int _2081 = _2031 * _2019;
    int _2083 = _2081 + _1681;
    float _2085 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2075);
    uint _2091 = uint(int(uint(_2079) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2067);
    bool _2109 = uint(_2083) >= uint(_303);
    float _2111 = _731 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2113 = _1999 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = _731 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2119 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2121 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2123 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2125 = uint(_2113) > 1u;
    float _2127 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2129 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2071);
    float _2131 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2123);
    float _2133 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2135 = _2079 + 8;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _731 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2119);
    int _2157 = _2043 ? 0 : 1;
    float _2159 = _2133 * _2107;
    float _2161 = _2133 * _2129;
    float _2163 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2133 * _2089;
    float _2167 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2169 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    int _2171 = ~_2157;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    float _2177 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2179 = _2175;
    float _2181 = _1349;
    if (!_2125)
    {
        int _2183 = ~_2157;
        int _2185 = _2183 + 1;
        _2179 = _2185;
    }
    int _2187 = _2179;
    float _2189 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2127);
    float _2191 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2193 = fma(_2087, -2.0, 3.0);
    float _2195 = _2087 * _2087;
    bool _2197 = _2113 != 3;
    float _2199 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2131);
    int _2201 = abs(_2187);
    float _2203 = _2195 * _2193;
    bool _2205 = uint(_2113) >= 2u;
    float _2207 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2155);
    float _2209 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2169);
    bool _2211 = !_2109;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _1555 * _1427;
    bool _2217 = !_2115;
    int _2219 = _2217 ? 0 : 1;
    int _2221 = _2205 ? 0 : 1;
    int _2223 = ~_2201;
    int _2225 = _2223 + 1;
    int _2227 = _2225 + 1;
    int _2229 = ~_2019;
    int _2231 = _2229 + _2213;
    int _2233 = _2231 + 1;
    bool _2235 = _2113 != 3;
    int _2237 = abs(_2219);
    int _2239 = _303 * _2233;
    int _2241 = _2239 + _1681;
    int _2243 = ~_2221;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2247;
    if (_2197)
    {
        int _2251 = ~_2221;
        int _2253 = _2251 + 1;
        _2249 = _2253;
    }
    int _2255 = _2249;
    int _2257 = _2227 * as_type<int>(_2105);
    bool _2259 = !_2235;
    int _2261 = _2259 ? 0 : (-1);
    bool _2263 = !_1707;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2261);
    int _2269 = abs(_2255);
    int _2271 = ~_2237;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    float _2277 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2279 = abs(_2265);
    int _2281 = _2275 * as_type<int>(_2097);
    int _2283 = _2281 + _2257;
    int _2285 = ~_2269;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = fma(_2277, _2177, _2159);
    int _2293 = ~_2267;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    int _2299 = _2289 * as_type<int>(_2143);
    int _2301 = _2299 + _2283;
    int _2303 = ~_2279;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    float _2309 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2311 = fma(_2277, _2191, _2165);
    int _2313 = _2297 * as_type<int>(_2151);
    int _2315 = _2313 + _2301;
    bool _2317 = !_1619;
    int _2319 = _2317 ? _2241 : (-1);
    float _2321 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2309);
    float _2323 = -_2203;
    float _2325 = _2323 + 1.0;
    int _2327 = _2315 * _2307;
    float _2329 = fma(_2277, _2189, _2161);
    float _2331 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2203);
    int _2335 = _2319 * _2279;
    int _2337 = _2335 + _2327;
    float _2339 = _2199 + _2291;
    float _2341 = in.m_70.x;
    float _2343 = _2055 * _2333;
    float _2345 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2347 = _1349 * 0.5;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2351 = _1407 + _1349;
    float _2353 = _1448 * _2215;
    float _2355 = fma(_1409, -0.5, _2347);
    float _2357 = _2039 * _2349;
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _1349;
    float _2361 = _2207 + _2329;
    float _2363 = float(_2337);
    float _2365 = -_2359;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2369 = _2209 + _2311;
    float _2371 = fma(_1438, _2353, _1436);
    bool _2373 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2375 = isnan(_1139);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2381 = _2377 || _2379;
    out.m_72.x = _2363;
    float _2383 = _2345 + _1349;
    float _2385 = _2351 * 0.5;
    out.m_74.x = _2339;
    out.m_74.y = _2361;
    out.m_74.z = _2369;
    float _2387 = _2383 * 0.5;
    float _2389 = _1438 * _2215;
    float _2391 = _2367 * _2341;
    float _2393 = -_1555;
    float _2395 = _2393 + 1.0;
    out.m_76.x = _2385;
    out.m_76.y = _2355;
    out.m_76.z = _2387;
    out.m_76.w = _1349;
    float _2397 = fma(_1444, _2389, _1432);
    float _2399 = fma(_1446, _2389, _1434);
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2403 = _1438 * _2395;
    float _2405 = _1047 * _1103;
    float _2407 = _2345;
    float _2409 = _2389;
    float _2411 = _2355;
    float _2413 = _2385;
    float _2415 = _2405;
    if (!_2381)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2417 = _2181;
    out.m_78.x = _2401;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2381)
    {
        _2407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2423 = _2407;
    float _2425 = _2423;
    float _2427 = _2423;
    if (!_2381)
    {
        _2409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2429 = _2409;
    out.m_80.x = _2397;
    out.m_80.y = _2399;
    out.m_80.z = _2371;
    out.m_80.w = _2403;
    float _2431 = _2405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2429;
    if (!_2381)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2437 = _2411;
    float _2439 = _2437;
    float _2441 = _2437;
    if (!_2381)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2443 = _2413;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2381)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2449 = _2415;
    bool _2451 = !_2381;
    float _2453 = _2449;
    float _2455 = _2449;
    if (!_2451)
    {
        bool _2457 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2459 = isnan(_1139);
        bool _2461 = _2457 || _2459;
        bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2465 = _2461 || _2463;
        if (!_2465)
        {
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = _1139 + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2473 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2471;
            float _2475 = 1.0 / _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2497 = _2469 * _2475;
            float _2499 = precise::clamp(_2497, 0.0, 1.0);
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2505 = fma(_2499, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2507 = fma(_2499, _2503, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2509 = fma(_2499, _2483, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2499, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2513 = fma(_2499, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2515 = fma(_2499, _2495, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2447 = _2507;
            _2435 = _2513;
            _2441 = _2505;
            _2427 = _2511;
            _2421 = _2509;
            _2455 = _2515;
            _2517 = true;
        }
        else
        {
            bool _2519 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2521 = isnan(_1139);
            bool _2523 = _2519 || _2521;
            bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2527 = _2523 || _2525;
            if (!_2527)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2529 = _2439;
            _2441 = _2529;
            if (!_2527)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2531 = _2445;
            _2447 = _2531;
            if (!_2527)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2533 = _2419;
            _2421 = _2533;
            if (!_2527)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2535 = _2425;
            _2427 = _2535;
            if (!_2527)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2537 = _2433;
            _2435 = _2537;
            if (!_2527)
            {
                _2453 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2539 = _2453;
            bool _2541 = !_2527;
            _2455 = _2539;
            if (!_2541)
            {
                bool _2543 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2545 = isnan(_1139);
                bool _2547 = _2543 || _2545;
                bool _2549 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2551 = _2547 || _2549;
                if (!_2551)
                {
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = _1139 + _2553;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2557;
                    float _2561 = 1.0 / _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2583 = _2555 * _2561;
                    float _2585 = precise::clamp(_2583, 0.0, 1.0);
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2591 = fma(_2585, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2593 = fma(_2585, _2589, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2595 = fma(_2585, _2569, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2585, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2599 = fma(_2585, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2601 = fma(_2585, _2581, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2447 = _2593;
                    _2435 = _2599;
                    _2441 = _2591;
                    _2427 = _2597;
                    _2421 = _2595;
                    _2455 = _2601;
                    _2517 = true;
                }
                else
                {
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2455 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2517 = false;
    float _2603 = _2447;
    float _2605 = _2435;
    float _2607 = _2441;
    float _2609 = _2427;
    float _2611 = _2421;
    float _2613 = _2455;
    float _2615 = fma(_2361, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2603;
    float _2621 = _2619 + _2605;
    float _2623 = -_2607;
    float _2625 = _2623 + _2609;
    out.m_82.x = 0.0;
    float _2627 = fma(_2617, _2621, _2603);
    float _2629 = -_2611;
    float _2631 = _2629 + _2613;
    float _2633 = fma(_2617, _2625, _2607);
    float _2635 = _2627 * 0.586610972881317138671875;
    bool _2637 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2639 = fma(_2617, _2631, _2611);
    float _2641 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = fma(_2633, 0.298911988735198974609375, _2635);
    bool _2645 = _1047 > 0.0;
    bool _2647 = isnan(_1047);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(0.0);
    bool _2653 = _2649 || _2651;
    float _2655 = fma(_2639, 0.114477999508380889892578125, _2643);
    out.m_53.x = _2641;
    bool _2657 = _1103 <= 0.0;
    bool _2659 = !_2653;
    bool _2661 = _2657 || _2659;
    float _2663 = -_2655;
    float _2665 = _2633 + _2663;
    float _2667 = -_2655;
    float _2669 = _2627 + _2667;
    float _2671 = -_2655;
    float _2673 = _2639 + _2671;
    float _2675 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2677 = fma(_2669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2679 = fma(_2673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    bool _2681 = !_2637;
    if (!_2681)
    {
        float _2683 = -_983;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2687 = -_985;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2691 = -_987;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2695 = _2685 * _2685;
        float _2697 = fma(_2689, _2689, _2695);
        float _2699 = fma(_2693, _2693, _2697);
        float _2701 = sqrt(_2699);
        float _2703 = rsqrt(_2699);
        float _2705 = -_2701;
        float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2711 = precise::clamp(_2709, 0.0, 1.0);
        float _2713 = _2689 * _2703;
        float _2715 = _2685 * _2703;
        float _2717 = abs(_2711);
        float _2719 = log2(_2717);
        float _2721 = _2693 * _2703;
        float _2723 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2725 = _2361 * _2715;
        float _2727 = -_2715;
        float _2729 = -_2723;
        float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2729);
        float _2733 = fma(_2339, _2713, _2725);
        float _2735 = -_2721;
        float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2731);
        float _2739 = fma(_2369, _2721, _2733);
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2745 = _2737 + _2743;
        float _2747 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2749 = _2745 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2751 = precise::clamp(_2749, 0.0, 1.0);
        float _2753 = exp2(_2747);
        float _2755 = _2753 * _2751;
        float _2757 = _2741 * _2755;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2763 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2759;
        out.m_82.y = _2761;
        out.m_82.z = _2763;
    }
    out.m_84.x = _2675;
    out.m_84.y = _2677;
    out.m_84.z = _2679;
    if (!_2661)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2765 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2765;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2517 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = _100;
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2833 = as_type<float>(_127);
        out.gl_Position.z = _2833;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_153);
        out.gl_Position.z = _2888;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = 1.0 / _141;
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _159 = _109 * _155;
    bool _161 = !_157;
    float _163 = _159;
    float _181;
    if (!_161)
    {
        float _165 = in.m_55.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _159;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = _185 + _187;
    bool _191 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _193 = isnan(_185);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _199 = _195 || _197;
    float _201 = float(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    float _207 = -_201;
    float _209 = _207 + 1.0;
    bool _211 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _213 = isnan(_185);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _223;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _229 = 1.0 / _205;
    float _231 = _221 * _209;
    float _233 = -_221;
    float _235 = _233 + 1.0;
    float _237 = _189 * _229;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _239;
    float _243 = fma(_225, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _245 = fma(_241, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _247 = _243 * _231;
    float _249 = _245 * _231;
    float _251 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].x, _247);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[143].y, _249);
    float _255 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].x, _251);
    float _257 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[144].y, _253);
    bool _259 = !_227;
    if (!_259)
    {
        float _261 = in.m_55.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _163 = _275;
    }
    float _277 = _163;
    float _279 = in.m_55.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_55.x;
    float _287 = in.m_55.y;
    int _289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _291 = _289 != 0;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _299 = _297 != 0;
    float _301 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _303 = int(_301);
    bool _305 = !_295;
    int _307 = _305 ? 0 : 1;
    bool _309 = !_291;
    int _311 = _309 ? 0 : 1;
    float _313 = _283 * _109;
    bool _315 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _323 = _319 || _321;
    float _325 = exp2(_313);
    bool _327 = !_299;
    int _329 = _327 ? 0 : 1;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _333 = _279 * 2.0;
    float _335 = float(_303);
    float _337 = _287 * 2.0;
    float _339 = _285 * 2.0;
    float _341 = floor(_333);
    float _343 = _285 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _345 = _287 + _285;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _349 = _335 * _109;
    float _351 = -_331;
    float _353 = fma(_343, 2.0, _351);
    float _355 = _345 + (-1.0);
    float _357 = -_325;
    float _359 = _357 + 1.0;
    float _361 = floor(_339);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _365 = _323 ? _359 : 0.0;
    float _367 = floor(_337);
    bool _369 = _341 > 0.0;
    float _371 = _287 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _373 = _341 >= 0.0;
    bool _375 = isnan(_341);
    bool _377 = _373 || _375;
    bool _379 = isnan(0.0);
    bool _381 = _377 || _379;
    float _383 = fma(_371, -2.0, _347);
    int _385 = _381 ? 0 : 1;
    float _387 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _389 = int(_387);
    bool _391 = _361 > 0.0;
    bool _393 = _361 >= 0.0;
    bool _395 = isnan(_361);
    bool _397 = _393 || _395;
    bool _399 = isnan(0.0);
    bool _401 = _397 || _399;
    int _403 = ~_385;
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    int _409 = _407;
    if (!_369)
    {
        int _411 = ~_385;
        int _413 = _411 + 1;
        _409 = _413;
    }
    int _415 = _409;
    bool _417 = _367 > 0.0;
    bool _419 = _367 >= 0.0;
    bool _421 = isnan(_367);
    bool _423 = _419 || _421;
    bool _425 = isnan(0.0);
    bool _427 = _423 || _425;
    float _429 = in.m_57.x;
    float _431 = in.m_57.y;
    float _433 = in.m_57.z;
    int _435 = _401 ? 0 : 1;
    int _437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _439 = _437 != 0;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _447 = _445 != 0;
    float _449 = float(_389);
    bool _451 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _453 = isnan(1.0);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _459 = _455 || _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _463 = 1.0 + _461;
    bool _465 = !_439;
    int _467 = _465 ? 0 : 1;
    float _469 = 1.0 / _449;
    float _471 = float(_415);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _475 = 1.0 / _463;
    int _477 = abs(_467);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _481 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[78].z, _473);
    float _483 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _383);
    float _485 = float(_477);
    float _487 = -_109;
    float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[76].x, _353);
    bool _491 = !_443;
    int _493 = _491 ? 0 : 1;
    float _495 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[78].w, _479);
    int _497 = ~_435;
    int _499 = _497 + 1;
    int _501 = _499 + 1;
    float _503 = _485 * _471;
    int _505 = _501;
    if (!_391)
    {
        int _507 = ~_435;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _469 * _109;
    int _515 = abs(_493);
    float _517 = _503 * (-2.0);
    float _519 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _481);
    float _521 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _495);
    if (_459)
    {
        float _523 = _365 * _475;
        _119 = _523;
    }
    float _525 = _119;
    float _527 = _285 + (-0.5);
    float _529 = fma(_517, _429, _429);
    float _531 = float(_511);
    float _533 = fma(_363, _517, _363);
    float _535 = float(_515);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[196].x, _529);
    int _539 = _427 ? 0 : 1;
    float _541 = _287 + _279;
    bool _543 = !_447;
    int _545 = _543 ? 0 : 1;
    float _547 = _535 * _531;
    int _549 = ~_539;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_533, _525, _537);
    int _557 = _553;
    if (!_417)
    {
        int _559 = ~_539;
        int _561 = _559 + 1;
        _557 = _561;
    }
    int _563 = _557;
    float _565 = _541 + (-1.0);
    int _567 = abs(_545);
    float _569 = _547 * (-2.0);
    float _571 = _555 * 0.15915493667125701904296875;
    float _573 = float(_563);
    float _575 = fma(_569, _431, _431);
    float _577 = float(_567);
    float _579 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _581 = _287 + (-0.5);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _279 + _285;
    float _587 = _577 * _573;
    float _589 = fma(_579, _569, _579);
    float _591 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _575);
    float _593 = in.m_62.x;
    float _595 = in.m_62.y;
    float _597 = _585 + (-1.0);
    float _599 = _587 * (-2.0);
    float _601 = fma(_589, _525, _591);
    float _603 = _279 + (-0.5);
    float _605 = in.m_46.x;
    float _607 = in.m_46.y;
    float _609 = in.m_46.z;
    float _611 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _613 = fma(_599, _433, _433);
    float _615 = _601 * 0.15915493667125701904296875;
    float _617 = _571 * 6.283185482025146484375;
    float _619 = sin(_617);
    float _621 = fma(_611, _599, _611);
    float _623 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[196].z, _613);
    float _625 = fma(_621, _525, _623);
    float _627 = _571 * 6.283185482025146484375;
    float _629 = cos(_627);
    int _631 = as_type<int>(_583) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_583) & 2;
    bool _637 = _635 != 0;
    float _639 = _625 * 0.15915493667125701904296875;
    float _641 = _255 * _593;
    float _643 = _615 * 6.283185482025146484375;
    float _645 = sin(_643);
    bool _647 = !_637;
    float _649 = _647 ? (-0.5) : 0.5;
    float _651 = _257 * _595;
    bool _653 = !_633;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _607 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _659 = _607 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _661 = _607 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _663 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _665 = _615 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].x, _661);
    float _675 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].x, _657);
    float _677 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].x, _659);
    bool _679 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _681 = isnan(0.5);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _687 = _683 || _685;
    float _689 = _639 * 6.283185482025146484375;
    float _691 = cos(_689);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _649);
    float _695 = _619 * _645;
    bool _697 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _699 = isnan(0.5);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _705 = _701 || _703;
    float _707 = _663 * _693;
    float _709 = _669 * _671;
    float _711 = _629 * _645;
    float _713 = _639 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = _629 * _667;
    float _719 = _619 * _667;
    float _721 = _629 * _691;
    float _723 = _619 * _691;
    float _725 = _667 * _691;
    float _727 = _645 * _691;
    float _729 = _723 * _707;
    float _731 = fma(_715, _717, _695);
    float _733 = fma(_715, _695, _717);
    float _735 = _721 * _707;
    float _737 = -_711;
    float _739 = fma(_715, _719, _737);
    float _741 = -_719;
    float _743 = fma(_715, _711, _741);
    float _745 = -_707;
    float _747 = _715 * _745;
    float _749 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _751 = fma(_731, _709, _735);
    float _753 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[4].z, _675);
    float _755 = fma(_725, _709, _747);
    float _757 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[5].z, _677);
    float _759 = fma(_743, _749, _751);
    float _761 = fma(_609, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _763 = fma(_739, _709, _729);
    float _765 = fma(_727, _749, _755);
    float _767 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _769 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _771 = fma(_733, _749, _763);
    float _773 = _757 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _767);
    float _777 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _769);
    float _779 = _753 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _781 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _783 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].z, _775);
    float _785 = _761 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _787 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].z, _777);
    float _789 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[11].x, _781);
    float _791 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _793 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _797 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _789);
    float _799 = _785 + _791;
    float _801 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _803 = _779 + _795;
    float _805 = _797 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _799 + _807;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _801);
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _815 = _803 + _813;
    float _817 = 1.0 / _805;
    float _819 = _809 * _809;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_815, _815, _819);
    float _827 = _821 + _805;
    float _829 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = sqrt(_825);
    float _833 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _837 = _827 * _817;
    float _839 = _837 * 0.5;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _843 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[30].w, _841);
    float _845 = _773 + _835;
    float _847 = 1.0 / _843;
    bool _849 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _817;
    float _853 = _799;
    float _855 = _831;
    float _857 = _825;
    float _859 = _805;
    float _861 = _843;
    if (!_849)
    {
        _851 = _803;
    }
    float _863 = _851;
    float _865 = 0.0;
    float _867 = _863;
    if (!_849)
    {
        _865 = _845;
    }
    float _869 = _865;
    bool _871 = !_849;
    float _873 = _869;
    if (!_871)
    {
        float _875 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _879 = _831 + _877;
        float _881 = rsqrt(_825);
        float _883 = _879 * _875;
        float _885 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _887 = _883 * 0.15915493667125701904296875;
        float _889 = _887 * 6.283185482025146484375;
        float _891 = cos(_889);
        float _893 = _887 * 6.283185482025146484375;
        float _895 = sin(_893);
        float _897 = _891 + (-1.0);
        float _899 = _897 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _901 = fma(_895, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = fma(_845, _891, _899);
        float _905 = _881 * _901;
        float _907 = fma(_815, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _909 = fma(_809, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _907;
        _853 = _909;
        _873 = _903;
        _855 = _887;
        _857 = _881;
    }
    float _911 = _867;
    float _913 = _853;
    float _915 = _873;
    float _917 = _855;
    float _919 = _857;
    float _921 = _915;
    float _923 = _911;
    float _925 = _913;
    float _927 = _917;
    if (_705)
    {
        _859 = 1.0;
    }
    float _929 = _859;
    float _931 = _929;
    if (!_687)
    {
        float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _935 = _773 + _933;
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _939 = _779 + _937;
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _943 = -_779;
        float _945 = _943 + _911;
        float _947 = _935 * _935;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _951 = _785 + _949;
        float _953 = -_785;
        float _955 = _953 + _913;
        float _957 = fma(_939, _939, _947);
        float _959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _961 = fma(_951, _951, _957);
        float _963 = sqrt(_961);
        float _965 = _941 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _967 = precise::min(_963, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _969 = _967 * _959;
        float _971 = -_773;
        float _973 = _971 + _915;
        float _975 = _965 * _969;
        float _977 = fma(_973, _975, _773);
        float _979 = fma(_945, _975, _779);
        float _981 = fma(_955, _975, _785);
        _921 = _977;
        _923 = _979;
        _925 = _981;
    }
    float _983 = _921;
    float _985 = _923;
    float _987 = _925;
    float _989 = 0.0;
    if (_705)
    {
        _989 = 1.0;
    }
    float _991 = _989;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _995 = _847 * _993;
    float _997 = _991;
    if (!_705)
    {
        float _999 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1001 = _999 * 0.15915493667125701904296875;
        float _1003 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1005 = _1001 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1003 * 0.15915493667125701904296875;
        float _1011 = _1001 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = 1.0 / _1007;
        float _1017 = _1009 * 6.283185482025146484375;
        float _1019 = cos(_1017);
        float _1021 = _1013 * _1015;
        float _1023 = _1009 * 6.283185482025146484375;
        float _1025 = sin(_1023);
        float _1027 = _1019 * _1021;
        float _1029 = 1.0 / _1027;
        float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1031;
        float _1035 = 1.0 / _1033;
        float _1037 = _1025 * _1029;
        float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1041 = fma(_995, _1037, _1039);
        float _1043 = _1041 * _1035;
        float _1045 = precise::clamp(_1043, 0.0, 1.0);
        _931 = _1045;
    }
    float _1047 = _931;
    if (!_705)
    {
        float _1049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1051 = _1049 * 0.15915493667125701904296875;
        float _1053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1055 = _1051 * 6.283185482025146484375;
        float _1057 = cos(_1055);
        float _1059 = _1053 * 0.15915493667125701904296875;
        float _1061 = _1051 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        float _1065 = 1.0 / _1057;
        float _1067 = _1059 * 6.283185482025146484375;
        float _1069 = cos(_1067);
        float _1071 = _1063 * _1065;
        float _1073 = _1059 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        float _1077 = _1069 * _1071;
        float _1079 = 1.0 / _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1083 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1081;
        float _1085 = 1.0 / _1083;
        float _1087 = _1075 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1091 = fma(_995, _1087, _1089);
        float _1093 = _1091 * _1085;
        float _1095 = precise::clamp(_1093, 0.0, 1.0);
        float _1097 = -_1095;
        float _1099 = _1097 + 1.0;
        _927 = _1079;
        _997 = _1099;
    }
    float _1101 = _927;
    float _1103 = _997;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1107 = _983 + _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _985 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1115 = _987 + _1113;
    float _1117 = _1107 * _1107;
    float _1119 = _983 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = _983 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1123 = fma(_1111, _1111, _1117);
    float _1125 = fma(_779, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1127 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1129 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1121);
    float _1131 = fma(_1115, _1115, _1123);
    float _1133 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1127);
    float _1135 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1129);
    float _1137 = rsqrt(_1131);
    float _1139 = sqrt(_1131);
    float _1141 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1143 = _1111 * _1141;
    float _1145 = _1115 * _1141;
    float _1147 = _1143 * _1143;
    float _1149 = _1145 * _1145;
    float _1151 = _1147 + _1149;
    float _1153 = sqrt(_1151);
    bool _1155 = _1153 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1159 = _1153 + _1157;
    float _1161 = _919;
    float _1163 = _1151;
    float _1165 = _1159;
    float _1167 = _1107;
    float _1169 = _1143;
    float _1171 = _1145;
    float _1173 = _1147;
    if (_1155)
    {
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1161 = _1175;
    }
    float _1177 = _1161;
    if (_1155)
    {
        float _1179 = rsqrt(_1151);
        _1163 = _1179;
    }
    float _1181 = _1163;
    if (_1155)
    {
        float _1183 = _1159 * _1177;
        _1165 = _1183;
    }
    float _1185 = _1165;
    if (_1155)
    {
        float _1187 = _1185 * 0.15915493667125701904296875;
        _861 = _1187;
    }
    float _1189 = _861;
    float _1191 = _1101;
    float _1193 = _1189;
    if (_1155)
    {
        float _1195 = _1189 * 6.283185482025146484375;
        float _1197 = sin(_1195);
        _1191 = _1197;
    }
    float _1199 = _1191;
    float _1201 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1203 = precise::max(0.0, _1201);
    float _1205 = _1177;
    float _1207 = _1203;
    if (_1155)
    {
        float _1209 = _1189 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        _1205 = _1211;
    }
    float _1213 = _1205;
    float _1215 = -_1141;
    float _1217 = -_1203;
    float _1219 = fma(_1107, _1215, _1217);
    if (_1155)
    {
        float _1221 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1167 = _1221;
    }
    float _1223 = _1167;
    float _1225 = _1199;
    if (_1155)
    {
        float _1227 = fma(_1199, _1223, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1207 = _1227;
    }
    float _1229 = _1207;
    float _1231 = floor(_1125);
    float _1233 = _1229;
    float _1235 = _1213;
    if (_1155)
    {
        float _1237 = _1213 + (-1.0);
        _1225 = _1237;
    }
    float _1239 = _1225;
    float _1241 = _1239;
    if (_1155)
    {
        float _1243 = _1181 * _1229;
        _1193 = _1243;
    }
    float _1245 = _1193;
    if (!_1155)
    {
        _1233 = _1219;
    }
    float _1247 = _1233;
    float _1249 = _1247;
    if (_1155)
    {
        float _1251 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1251;
    }
    float _1253 = _1241;
    if (_1155)
    {
        float _1255 = _1143 * _1245;
        _1169 = _1255;
    }
    float _1257 = _1169;
    if (_1155)
    {
        float _1259 = _1145 * _1245;
        _1171 = _1259;
    }
    float _1261 = _1171;
    if (_1155)
    {
        float _1263 = fma(_1219, _1213, _1253);
        _1249 = _1263;
    }
    float _1265 = _1249;
    if (_1155)
    {
        float _1267 = _1257 * _1257;
        _1173 = _1267;
    }
    float _1269 = _1173;
    float _1271 = _983 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1155)
    {
        _1235 = _1149;
    }
    float _1273 = _1235;
    float _1275 = _1273;
    if (_1155)
    {
        float _1277 = _1261 * _1261;
        _1275 = _1277;
    }
    float _1279 = _1275;
    float _1281 = fma(_1265, _1265, _1269);
    float _1283 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1285 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1287 = _983 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1291 = _1281 + _1279;
    float _1293 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1295 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1297 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1289);
    float _1299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1301 = fma(_1139, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1299);
    float _1303 = precise::clamp(_1301, 0.0, 1.0);
    float _1305 = rsqrt(_1291);
    float _1307 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1295);
    float _1309 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1311 = -_1303;
    float _1313 = _1311 + 1.0;
    float _1315 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1317 = _1307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1319 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1321 = -_1231;
    float _1323 = _1125 + _1321;
    float _1325 = floor(_1283);
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1329 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1319);
    float _1331 = -_1315;
    float _1333 = fma(_1331, _1285, 1.0);
    float _1335 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1337 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1339 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1327);
    float _1343 = abs(_1313);
    float _1345 = log2(_1343);
    float _1347 = _1305 * _1257;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1339);
    float _1351 = _1305 * _1265;
    float _1353 = _1305 * _1261;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1357 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1341);
    float _1359 = _1351 + 1.0;
    float _1361 = 1.0 / _1349;
    float _1363 = -_1355;
    float _1365 = fma(_1351, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1363);
    float _1367 = -_1325;
    float _1369 = _1283 + _1367;
    float _1371 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1337);
    float _1373 = -_1353;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1365);
    float _1377 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1371);
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1375, -0.5, 0.5);
    float _1383 = log2(_1333);
    float _1385 = fma(_1375, 0.5, 0.5);
    float _1387 = fma(_1385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1385, _1387, -0.212114393711090087890625);
    float _1393 = fma(_1385, _1391, 1.570728778839111328125);
    float _1395 = sqrt(_1381);
    float _1397 = _1383 * 0.693147182464599609375;
    float2 _4800 = float2(_1323, _1369);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4800, float2(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4800, float2(0.0), isnan(_4800)), level(0.0)).x;
    float _1401 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1403 = -_1351;
    float _1405 = fma(_1389, _1359, _1403);
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1357);
    float _1409 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1377);
    float _1411 = fma(_1405, 0.5, 0.5);
    float _1413 = _1407 * _1361;
    float _1415 = _1409 * _1361;
    float _1417 = _1395 * 0.636619746685028076171875;
    float _1419 = fma(_1413, 0.5, 0.5);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = -_1393;
    float _1425 = fma(_1417, _1423, 1.0);
    float3 _4851 = float3(_1419, _1421, _1401);
    float _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4851, float3(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4851, float3(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1419, _1421, _1401);
    float4 _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).xyzw;
    float _1432 = _1430.x;
    float _1434 = _1430.y;
    float _1436 = _1430.z;
    float _1438 = _1430.w;
    float2 _4878 = float2(_1425, _1411);
    float3 _1442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4878, float2(0.0), isnan(_4878)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4878, float2(0.0), isnan(_4878)), level(0.0)).xyz;
    float _1444 = _1442.x;
    float _1446 = _1442.y;
    float _1448 = _1442.z;
    float _1450 = float(uint(_303));
    float _1452 = trunc(_513);
    int _1454 = int(_1452);
    float _1456 = _349 * _155;
    int _1458 = ~_303;
    int _1460 = _1458 + 1;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _277 + _1462;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1468 = _1466 != 0;
    float _1470 = -_521;
    float _1472 = _1470 + 1.0;
    float _1474 = -_519;
    float _1476 = _1474 + 1.0;
    float _1478 = 1.0 / _1450;
    float _1480 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = abs(_311);
    int _1488 = abs(_329);
    float _1490 = trunc(_1456);
    int _1492 = int(_1490);
    float _1494 = float(uint(_1454));
    int _1496 = ~_303;
    int _1498 = _1496 + 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1502 = _1500 != 0;
    float _1504 = exp2(_1480);
    int _1506 = as_type<int>(_1478) + (-2);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1514 = _1512 != 0;
    bool _1516 = _287 > 0.5;
    float _1518 = as_type<float>(_1506) * _1494;
    bool _1520 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1522 = isnan(_277);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    bool _1532 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1534 = isnan(_277);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1518);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    float _1551 = -_1504;
    float _1553 = _1551 + 1.0;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1557 = _1460 * int(_1549);
    int _1559 = _1557 + _1454;
    float _1561 = float(uint(_1559));
    float _1563 = as_type<float>(_1506) * _1561;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1567 = _1565 != 0;
    float _1569 = trunc(_1563);
    float _1571 = precise::max(_1569, 0.0);
    uint _1573 = uint(_1571);
    float _1575 = float(_1454);
    bool _1577 = !_1567;
    float _1579 = _1577 ? 7.345489978790283203125 : 1.0;
    bool _1581 = _1575 >= _335;
    bool _1583 = isnan(_1575);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_335);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    float _1593 = _1579 * _285;
    float _1595 = trunc(_1591);
    int _1597 = int(_1595);
    int _1599 = int(_1549) + int(_1573);
    float _1601 = floor(_1593);
    int _1603 = _1498 * _1599;
    int _1605 = _1603 + _1454;
    bool _1607 = !_1484;
    int _1609 = _1607 ? 0 : 1;
    bool _1611 = _285 > 0.5;
    bool _1613 = uint(_1605) >= uint(_303);
    bool _1615 = !_1613;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _303 == 0;
    int _1621 = ~_1599;
    int _1623 = _1621 + _1617;
    int _1625 = _1623 + 1;
    float _1627 = -_1601;
    float _1629 = _1593 + _1627;
    int _1631 = _303 * _1625;
    int _1633 = _1631 + _1454;
    float _1635 = _1629 * _335;
    int _1637 = ~_1597;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1647 = abs(_307);
    bool _1649 = !_1619;
    int _1651 = _1649 ? _1633 : (-1);
    float _1653 = trunc(_1635);
    int _1655 = int(_1653);
    int _1657 = abs(_1609);
    int _1659 = _1651 * _1641;
    int _1661 = _303 + (-1);
    float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1665 = _1663 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1667 = 1.0 / _1645;
    int _1669 = _1597 * _1661;
    int _1671 = _1669 + _1659;
    int _1673 = _1671 * _1647;
    float _1675 = -_1530;
    float _1677 = _1675 + 1.0;
    int _1679 = _1655 * _1657;
    int _1681 = _1679 + _1454;
    float _1683 = 1.0 / _1510;
    int _1685 = _1492 * _1486;
    int _1687 = _1685 + _1673;
    bool _1689 = !_1468;
    int _1691 = _1689 ? 0 : 1;
    int _1693 = abs(_1691);
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1697 = _1695 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1699 = 1.0 / _1665;
    int _1701 = _1681 * _1488;
    int _1703 = _1701 + _1687;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1707 = _1705 != 0;
    int _1709 = _1655 * _1693;
    int _1711 = _1709 + _1703;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1717 = 1.0 / _1697;
    int _1719 = ~_303;
    int _1721 = _1719 + 1;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1723;
    float _1727 = float(uint(_1711));
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = _1725 * _1667;
    float _1739 = as_type<float>(_1506) * _1727;
    float _1741 = 1.0 / _1715;
    float _1743 = _1735 * _1699;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1749 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1751 = isnan(_277);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1731 * _1683;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1763;
    bool _1767 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1769 = isnan(_277);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = _1747 * _1717;
    float _1781 = trunc(_1739);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    float _1787 = -_1759;
    float _1789 = _1787 + 1.0;
    float _1791 = fma(_1761, _1464, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1793 = _1777 * _1677;
    float _1795 = -_1777;
    float _1797 = _1795 + 1.0;
    float _1799 = _1765 * _1741;
    float _1801 = _1530 * _1789;
    bool _1803 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1805 = isnan(_277);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1817 = _277 + _1815;
    float _1819 = _1813 * _1797;
    int _1821 = _1721 * int(_1785);
    int _1823 = _1821 + _1711;
    float _1825 = -_1813;
    float _1827 = _1825 + 1.0;
    float _1829 = fma(_1737, _1817, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1831 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1833 = isnan(_277);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    float _1843 = float(uint(_1823));
    float _1845 = _1542 * _1827;
    float _1847 = -_1542;
    float _1849 = _1847 + 1.0;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1853 = _277 + _1851;
    float _1855 = as_type<float>(_1506) * _1843;
    float _1857 = _1841 * _1849;
    float _1859 = fma(_1743, _1853, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1863 = _277 + _1861;
    float _1865 = float(uint(_1681));
    float _1867 = _1829 * _1857;
    float _1869 = trunc(_1855);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    float _1875 = -_1841;
    float _1877 = _1875 + 1.0;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1881 = _277 + _1879;
    float _1883 = fma(_1779, _1863, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1885 = as_type<float>(_1506) * _1865;
    float _1887 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1867);
    float _1889 = fma(_1799, _1881, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    int _1891 = ~_303;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1791, _1845, _1887);
    float _1897 = trunc(_1885);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = -_649;
    int _1905 = _1516 ? as_type<int>(_1903) : as_type<int>(_649);
    float _1907 = fma(_1859, _1819, _1895);
    int _1909 = ~_303;
    int _1911 = _1909 + 1;
    int _1913 = int(_1785) + int(_1873);
    float _1915 = fma(_1883, _1793, _1907);
    float _1917 = -_655;
    int _1919 = _1611 ? as_type<int>(_1917) : as_type<int>(_655);
    bool _1921 = !_1514;
    float _1923 = _1921 ? _649 : as_type<float>(_1905);
    int _1925 = _1893 * _1913;
    int _1927 = _1925 + _1711;
    bool _1929 = !_1502;
    float _1931 = _1929 ? _655 : as_type<float>(_1919);
    int _1933 = _1911 * int(_1901);
    int _1935 = _1933 + _1681;
    float _1937 = _1931 + 0.5;
    bool _1939 = uint(_1927) >= uint(_303);
    float _1941 = _1923 + (-0.5);
    float _1943 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[80].x, _489);
    float _1945 = fma(_1889, _1801, _1915);
    float _1947 = float(uint(_1935));
    float _1949 = -_1941;
    float _1951 = -_483;
    float _1953 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1951);
    bool _1955 = !_1939;
    int _1957 = _1955 ? 0 : (-1);
    float _1959 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1945);
    float _1961 = -_1476;
    float _1963 = fma(_1931, _1961, _1943);
    float _1965 = as_type<float>(_1506) * _1947;
    float _1967 = fma(_1923, _1472, _1953);
    int _1969 = ~_1913;
    int _1971 = _1969 + _1957;
    int _1973 = _1971 + 1;
    float _1975 = abs(_995);
    float _1977 = log2(_1975);
    float _1979 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1981 = _303 * _1973;
    int _1983 = _1981 + _1711;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1987 = trunc(_1965);
    float _1989 = precise::max(_1987, 0.0);
    uint _1991 = uint(_1989);
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1997 = !_1619;
    int _1999 = _1997 ? _1983 : (-1);
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2003 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2005 = _1999 >> 31;
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2013 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2015 = _1993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2017 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2019 = int(_1901) + int(_1991);
    float _2021 = _2001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2023 = _2005 & 3;
    float _2025 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _2013;
    out.m_64.y = _2015;
    out.m_64.z = _2017;
    out.m_64.w = _2011;
    int _2029 = ~_303;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2003);
    float _2035 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_66.x = _2021;
    out.m_66.y = _2025;
    out.m_66.z = _2027;
    out.m_66.w = _1979;
    float _2037 = -_1399;
    float _2039 = _2037 + 1.0;
    int _2041 = _1999 & 3;
    bool _2043 = _2041 != 0;
    out.m_68.x = _1963;
    out.m_68.y = _1967;
    bool _2045 = _995 <= 8000.0;
    bool _2047 = isnan(_995);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(8000.0);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    int _2057 = _1999 + _2023;
    float _2059 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2061 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2063 = _2057 >> 2;
    float _2065 = -_715;
    float _2067 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2059);
    float _2069 = -_715;
    float _2071 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2035);
    float _2073 = -_715;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2061);
    int _2077 = _2063 << 4;
    int _2079 = _2077 + 368;
    int _2081 = _2031 * _2019;
    int _2083 = _2081 + _1681;
    float _2085 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2075);
    uint _2091 = uint(int(uint(_2079) >> uint(2)));
    uint _2093 = uint(int(uint(int(_2091)) >> uint(2)));
    int _2095 = int(_2091) & 3;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[int(_2093)][_2095];
    int _2099 = int(_2091) + 1;
    uint _2101 = uint(int(uint(_2099) >> uint(2)));
    int _2103 = _2099 & 3;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[int(_2101)][_2103];
    float _2107 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2067);
    bool _2109 = uint(_2083) >= uint(_303);
    float _2111 = _731 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2113 = _1999 & 3;
    bool _2115 = _2113 != 0;
    float _2117 = _731 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2119 = _743 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2121 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2123 = _743 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2125 = uint(_2113) > 1u;
    float _2127 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2129 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2071);
    float _2131 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2123);
    float _2133 = _649 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2135 = _2079 + 8;
    uint _2137 = uint(int(uint(_2135) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    float _2153 = _731 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2119);
    int _2157 = _2043 ? 0 : 1;
    float _2159 = _2133 * _2107;
    float _2161 = _2133 * _2129;
    float _2163 = _743 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2165 = _2133 * _2089;
    float _2167 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2153);
    float _2169 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2163);
    int _2171 = ~_2157;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    float _2177 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2121);
    int _2179 = _2175;
    float _2181 = _1349;
    if (!_2125)
    {
        int _2183 = ~_2157;
        int _2185 = _2183 + 1;
        _2179 = _2185;
    }
    int _2187 = _2179;
    float _2189 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2127);
    float _2191 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2193 = fma(_2087, -2.0, 3.0);
    float _2195 = _2087 * _2087;
    bool _2197 = _2113 != 3;
    float _2199 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2131);
    int _2201 = abs(_2187);
    float _2203 = _2195 * _2193;
    bool _2205 = uint(_2113) >= 2u;
    float _2207 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2155);
    float _2209 = fma(_733, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2169);
    bool _2211 = !_2109;
    int _2213 = _2211 ? 0 : (-1);
    float _2215 = _1555 * _1427;
    bool _2217 = !_2115;
    int _2219 = _2217 ? 0 : 1;
    int _2221 = _2205 ? 0 : 1;
    int _2223 = ~_2201;
    int _2225 = _2223 + 1;
    int _2227 = _2225 + 1;
    int _2229 = ~_2019;
    int _2231 = _2229 + _2213;
    int _2233 = _2231 + 1;
    bool _2235 = _2113 != 3;
    int _2237 = abs(_2219);
    int _2239 = _303 * _2233;
    int _2241 = _2239 + _1681;
    int _2243 = ~_2221;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    int _2249 = _2247;
    if (_2197)
    {
        int _2251 = ~_2221;
        int _2253 = _2251 + 1;
        _2249 = _2253;
    }
    int _2255 = _2249;
    int _2257 = _2227 * as_type<int>(_2105);
    bool _2259 = !_2235;
    int _2261 = _2259 ? 0 : (-1);
    bool _2263 = !_1707;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = abs(_2261);
    int _2269 = abs(_2255);
    int _2271 = ~_2237;
    int _2273 = _2271 + 1;
    int _2275 = _2273 + 1;
    float _2277 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2279 = abs(_2265);
    int _2281 = _2275 * as_type<int>(_2097);
    int _2283 = _2281 + _2257;
    int _2285 = ~_2269;
    int _2287 = _2285 + 1;
    int _2289 = _2287 + 1;
    float _2291 = fma(_2277, _2177, _2159);
    int _2293 = ~_2267;
    int _2295 = _2293 + 1;
    int _2297 = _2295 + 1;
    int _2299 = _2289 * as_type<int>(_2143);
    int _2301 = _2299 + _2283;
    int _2303 = ~_2279;
    int _2305 = _2303 + 1;
    int _2307 = _2305 + 1;
    float _2309 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2311 = fma(_2277, _2191, _2165);
    int _2313 = _2297 * as_type<int>(_2151);
    int _2315 = _2313 + _2301;
    bool _2317 = !_1619;
    int _2319 = _2317 ? _2241 : (-1);
    float _2321 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2309);
    float _2323 = -_2203;
    float _2325 = _2323 + 1.0;
    int _2327 = _2315 * _2307;
    float _2329 = fma(_2277, _2189, _2161);
    float _2331 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2203);
    int _2335 = _2319 * _2279;
    int _2337 = _2335 + _2327;
    float _2339 = _2199 + _2291;
    float _2341 = in.m_70.x;
    float _2343 = _2055 * _2333;
    float _2345 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2347 = _1349 * 0.5;
    float _2349 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2351 = _1407 + _1349;
    float _2353 = _1448 * _2215;
    float _2355 = fma(_1409, -0.5, _2347);
    float _2357 = _2039 * _2349;
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    out.gl_Position.x = _1407;
    out.gl_Position.y = _1409;
    out.gl_Position.z = _2345;
    out.gl_Position.w = _1349;
    float _2361 = _2207 + _2329;
    float _2363 = float(_2337);
    float _2365 = -_2359;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2369 = _2209 + _2311;
    float _2371 = fma(_1438, _2353, _1436);
    bool _2373 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2375 = isnan(_1139);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2381 = _2377 || _2379;
    out.m_72.x = _2363;
    float _2383 = _2345 + _1349;
    float _2385 = _2351 * 0.5;
    out.m_74.x = _2339;
    out.m_74.y = _2361;
    out.m_74.z = _2369;
    float _2387 = _2383 * 0.5;
    float _2389 = _1438 * _2215;
    float _2391 = _2367 * _2341;
    float _2393 = -_1555;
    float _2395 = _2393 + 1.0;
    out.m_76.x = _2385;
    out.m_76.y = _2355;
    out.m_76.z = _2387;
    out.m_76.w = _1349;
    float _2397 = fma(_1444, _2389, _1432);
    float _2399 = fma(_1446, _2389, _1434);
    float _2401 = _2391 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2403 = _1438 * _2395;
    float _2405 = _1047 * _1103;
    float _2407 = _2345;
    float _2409 = _2389;
    float _2411 = _2355;
    float _2413 = _2385;
    float _2415 = _2405;
    if (!_2381)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2417 = _2181;
    out.m_78.x = _2401;
    float _2419 = _2417;
    float _2421 = _2417;
    if (!_2381)
    {
        _2407 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2423 = _2407;
    float _2425 = _2423;
    float _2427 = _2423;
    if (!_2381)
    {
        _2409 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2429 = _2409;
    out.m_80.x = _2397;
    out.m_80.y = _2399;
    out.m_80.z = _2371;
    out.m_80.w = _2403;
    float _2431 = _2405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2433 = _2429;
    float _2435 = _2429;
    if (!_2381)
    {
        _2411 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2437 = _2411;
    float _2439 = _2437;
    float _2441 = _2437;
    if (!_2381)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2443 = _2413;
    float _2445 = _2443;
    float _2447 = _2443;
    if (!_2381)
    {
        _2415 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2449 = _2415;
    bool _2451 = !_2381;
    float _2453 = _2449;
    float _2455 = _2449;
    if (!_2451)
    {
        bool _2457 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2459 = isnan(_1139);
        bool _2461 = _2457 || _2459;
        bool _2463 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2465 = _2461 || _2463;
        if (!_2465)
        {
            float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2469 = _1139 + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2473 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2471;
            float _2475 = 1.0 / _2473;
            float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2497 = _2469 * _2475;
            float _2499 = precise::clamp(_2497, 0.0, 1.0);
            float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2505 = fma(_2499, _2479, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2507 = fma(_2499, _2503, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2509 = fma(_2499, _2483, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2511 = fma(_2499, _2487, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2513 = fma(_2499, _2491, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2515 = fma(_2499, _2495, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2447 = _2507;
            _2435 = _2513;
            _2441 = _2505;
            _2427 = _2511;
            _2421 = _2509;
            _2455 = _2515;
            _2517 = true;
        }
        else
        {
            bool _2519 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2521 = isnan(_1139);
            bool _2523 = _2519 || _2521;
            bool _2525 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2527 = _2523 || _2525;
            if (!_2527)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2529 = _2439;
            _2441 = _2529;
            if (!_2527)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2531 = _2445;
            _2447 = _2531;
            if (!_2527)
            {
                _2419 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2533 = _2419;
            _2421 = _2533;
            if (!_2527)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2535 = _2425;
            _2427 = _2535;
            if (!_2527)
            {
                _2433 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2537 = _2433;
            _2435 = _2537;
            if (!_2527)
            {
                _2453 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2539 = _2453;
            bool _2541 = !_2527;
            _2455 = _2539;
            if (!_2541)
            {
                bool _2543 = _1139 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2545 = isnan(_1139);
                bool _2547 = _2543 || _2545;
                bool _2549 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2551 = _2547 || _2549;
                if (!_2551)
                {
                    float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2555 = _1139 + _2553;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2557;
                    float _2561 = 1.0 / _2559;
                    float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2583 = _2555 * _2561;
                    float _2585 = precise::clamp(_2583, 0.0, 1.0);
                    float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2589 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2591 = fma(_2585, _2565, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2593 = fma(_2585, _2589, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2595 = fma(_2585, _2569, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2597 = fma(_2585, _2573, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2599 = fma(_2585, _2577, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2601 = fma(_2585, _2581, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2447 = _2593;
                    _2435 = _2599;
                    _2441 = _2591;
                    _2427 = _2597;
                    _2421 = _2595;
                    _2455 = _2601;
                    _2517 = true;
                }
                else
                {
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2435 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2421 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2455 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2517 = false;
    float _2603 = _2447;
    float _2605 = _2435;
    float _2607 = _2441;
    float _2609 = _2427;
    float _2611 = _2421;
    float _2613 = _2455;
    float _2615 = fma(_2361, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2603;
    float _2621 = _2619 + _2605;
    float _2623 = -_2607;
    float _2625 = _2623 + _2609;
    out.m_82.x = 0.0;
    float _2627 = fma(_2617, _2621, _2603);
    float _2629 = -_2611;
    float _2631 = _2629 + _2613;
    float _2633 = fma(_2617, _2625, _2607);
    float _2635 = _2627 * 0.586610972881317138671875;
    bool _2637 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2639 = fma(_2617, _2631, _2611);
    float _2641 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2643 = fma(_2633, 0.298911988735198974609375, _2635);
    bool _2645 = _1047 > 0.0;
    bool _2647 = isnan(_1047);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan(0.0);
    bool _2653 = _2649 || _2651;
    float _2655 = fma(_2639, 0.114477999508380889892578125, _2643);
    out.m_53.x = _2641;
    bool _2657 = _1103 <= 0.0;
    bool _2659 = !_2653;
    bool _2661 = _2657 || _2659;
    float _2663 = -_2655;
    float _2665 = _2633 + _2663;
    float _2667 = -_2655;
    float _2669 = _2627 + _2667;
    float _2671 = -_2655;
    float _2673 = _2639 + _2671;
    float _2675 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2677 = fma(_2669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    float _2679 = fma(_2673, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2655);
    bool _2681 = !_2637;
    if (!_2681)
    {
        float _2683 = -_983;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2687 = -_985;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2691 = -_987;
        float _2693 = _2691 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2695 = _2685 * _2685;
        float _2697 = fma(_2689, _2689, _2695);
        float _2699 = fma(_2693, _2693, _2697);
        float _2701 = sqrt(_2699);
        float _2703 = rsqrt(_2699);
        float _2705 = -_2701;
        float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2709 = _2707 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2711 = precise::clamp(_2709, 0.0, 1.0);
        float _2713 = _2689 * _2703;
        float _2715 = _2685 * _2703;
        float _2717 = abs(_2711);
        float _2719 = log2(_2717);
        float _2721 = _2693 * _2703;
        float _2723 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2725 = _2361 * _2715;
        float _2727 = -_2715;
        float _2729 = -_2723;
        float _2731 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2729);
        float _2733 = fma(_2339, _2713, _2725);
        float _2735 = -_2721;
        float _2737 = fma(_2735, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2731);
        float _2739 = fma(_2369, _2721, _2733);
        float _2741 = precise::clamp(_2739, 0.0, 1.0);
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2745 = _2737 + _2743;
        float _2747 = _2719 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2749 = _2745 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2751 = precise::clamp(_2749, 0.0, 1.0);
        float _2753 = exp2(_2747);
        float _2755 = _2753 * _2751;
        float _2757 = _2741 * _2755;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2761 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2763 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2759;
        out.m_82.y = _2761;
        out.m_82.z = _2763;
    }
    out.m_84.x = _2675;
    out.m_84.y = _2677;
    out.m_84.z = _2679;
    if (!_2661)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2765 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2765;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

