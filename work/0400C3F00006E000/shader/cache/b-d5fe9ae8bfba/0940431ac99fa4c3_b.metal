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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_80 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2441 = false;
    bool _315 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_139);
        out.gl_Position.z = _2758;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_165);
        out.gl_Position.z = _2813;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _173;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    bool _223 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_213);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -_233;
    float _253 = _251 + 1.0;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    float _259 = 1.0 / _237;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = _249 * _253;
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _217 * _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    float _291 = _287 * _219;
    float _293 = _289 * _221;
    bool _295 = !_261;
    float _313;
    if (!_295)
    {
        float _297 = in.m_58.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _173;
    }
    _315 = false;
    float _317 = _313;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _339 = _291 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = float(_327);
    float _367 = in.m_58.z;
    float _369 = 1.0 / _365;
    float _371 = _321 * _331;
    float _373 = _321 * _343;
    float _375 = fma(_319, _329, _371);
    float _377 = _321 * _355;
    float _379 = fma(_319, _341, _373);
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = fma(_323, _333, _375);
    float _387 = _361 * 2.0;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _391 = _363 * 2.0;
    float _393 = fma(_319, _353, _377);
    float _395 = fma(_323, _345, _379);
    float _397 = fma(_389, -2.0, _337);
    float _399 = floor(_387);
    float _401 = _367 * 2.0;
    float _403 = fma(_323, _357, _393);
    float _405 = _363 + _367;
    float _407 = -_349;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[77].x, _407);
    float _411 = _363 + _361;
    float _413 = _395 + _347;
    float _415 = _405 + (-1.0);
    float _417 = floor(_401);
    float _419 = _383 * _121;
    float _421 = _411 + (-1.0);
    float _423 = _385 + _335;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _427 = _413 + _425;
    float _429 = exp2(_419);
    bool _431 = _399 > 0.0;
    float _433 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _435 = _399 >= 0.0;
    bool _437 = isnan(_399);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _449 = _403 + _359;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _461 = _459 != 0;
    float _463 = floor(_391);
    int _465 = _443 ? 0 : 1;
    float _467 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].z, _445);
    bool _469 = _417 > 0.0;
    float _471 = _427 * _427;
    bool _473 = !_453;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _479 = _417 >= 0.0;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -_429;
    float _491 = _489 + 1.0;
    bool _493 = !_457;
    int _495 = _493 ? 0 : 1;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _499 = int(_497);
    bool _501 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _513 = _423 + _511;
    int _515 = _487 ? 0 : 1;
    float _517 = _369 * _121;
    float _519 = -_121;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _409);
    bool _523 = _463 > 0.0;
    float _525 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    bool _527 = _463 >= 0.0;
    bool _529 = isnan(_463);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = !_461;
    int _539 = _537 ? 0 : 1;
    int _541 = ~_515;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = _509 ? _491 : 0.0;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    int _563 = _545;
    if (!_469)
    {
        int _565 = ~_515;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].w, _549);
    bool _573 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _575 = isnan(1.0);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _585 = 1.0 + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = in.m_68.z;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _595 = _449 + _593;
    bool _597 = !_553;
    int _599 = _597 ? 0 : 1;
    float _601 = 1.0 / _585;
    bool _603 = !_557;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    int _609 = abs(_599);
    float _611 = float(_499);
    int _613 = abs(_605);
    float _615 = fma(_513, _513, _471);
    float _617 = _611 * _121;
    int _619 = ~_465;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_595, _595, _615);
    float _627 = float(_609);
    float _629 = float(_569);
    float _631 = sqrt(_625);
    int _633 = _623;
    if (_581)
    {
        float _635 = _547 * _601;
        _131 = _635;
    }
    float _637 = _131;
    if (!_431)
    {
        int _639 = ~_465;
        int _641 = _639 + 1;
        _633 = _641;
    }
    int _643 = _633;
    float _645 = _627 * _629;
    int _647 = _535 ? 0 : 1;
    float _649 = _339 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _651 = float(_643);
    float _653 = rsqrt(_625);
    float _655 = float(_613);
    float _657 = _645 * (-2.0);
    int _659 = ~_647;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _663;
    if (!_523)
    {
        int _667 = ~_647;
        int _669 = _667 + 1;
        _665 = _669;
    }
    int _671 = _665;
    float _673 = _655 * _651;
    float _675 = _361 + (-0.5);
    float _677 = fma(_657, _587, _587);
    float _679 = _631 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _681 = _673 * (-2.0);
    bool _683 = !_561;
    int _685 = _683 ? 0 : 1;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].x, _677);
    float _689 = fma(_447, _657, _447);
    float _691 = precise::min(_649, _679);
    float _693 = fma(_681, _589, _589);
    int _695 = abs(_685);
    float _697 = _363 + (-0.5);
    float _699 = fma(_433, _681, _433);
    float _701 = _653 * _691;
    float _703 = float(_671);
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _707 = float(_695);
    float _709 = _427 * _701;
    float _711 = _513 * _701;
    float _713 = fma(_689, _637, _687);
    float _715 = fma(_699, _637, _705);
    float _717 = -_709;
    float _719 = _427 + _717;
    float _721 = -_711;
    float _723 = _513 + _721;
    float _725 = _707 * _703;
    float _727 = _367 + _361;
    float _729 = _719 * _719;
    float _731 = _713 * 0.15915493667125701904296875;
    float _733 = _727 + (-1.0);
    float _735 = fma(_723, _723, _729);
    float _737 = _595 * _701;
    float _739 = _725 * (-2.0);
    float _741 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _743 = _367 + (-0.5);
    float _745 = -_737;
    float _747 = _595 + _745;
    float _749 = fma(_739, _591, _591);
    float _751 = fma(_741, _739, _741);
    float _753 = _715 * 0.15915493667125701904296875;
    float _755 = fma(_747, _747, _735);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _759 = _731 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_751, _637, _757);
    float _765 = _763 * 0.15915493667125701904296875;
    float _767 = sqrt(_755);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _771 = _753 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _777 = _753 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = _653 * _767;
    float _783 = _351 * _781;
    float _785 = _339 * _781;
    float _787 = _731 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _761 * _773;
    float _793 = _783 * _769;
    float _795 = _785 * _775;
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _761 * _779;
    float _803 = _765 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = _789 * _773;
    float _809 = _789 * _779;
    float _811 = _761 * _799;
    float _813 = _789 * _799;
    float _815 = _779 * _799;
    float _817 = _773 * _799;
    float _819 = _811 * _793;
    float _821 = _781 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = fma(_805, _801, _807);
    float _827 = -_809;
    float _829 = fma(_805, _791, _827);
    float _831 = -_793;
    float _833 = _805 * _831;
    float _835 = -_791;
    float _837 = fma(_805, _809, _835);
    float _839 = fma(_825, _795, _819);
    float _841 = _813 * _793;
    float _843 = fma(_815, _795, _833);
    float _845 = fma(_805, _807, _801);
    float _847 = fma(_829, _823, _839);
    float _849 = fma(_837, _795, _841);
    float _851 = fma(_817, _823, _843);
    float _853 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_845, _823, _849);
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _857);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _859);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _863);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _865);
    float _873 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _871 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _879 = _449 + _873;
    float _881 = _423 + _875;
    float _883 = _413 + _877;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _887 = _879 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = _887 * _887;
    float _895 = precise::min(_883, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _897 = fma(_891, _891, _893);
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = _893;
    float _905 = _855;
    float _907 = _881;
    float _909 = _879;
    float _911 = _897;
    if (!_901)
    {
        _903 = _881;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_901)
    {
        _905 = _879;
    }
    float _917 = _905;
    float _919 = _917;
    if (!_901)
    {
        _907 = _895;
    }
    float _921 = _907;
    bool _923 = !_901;
    float _925 = _921;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _899 + _929;
        float _933 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = _931 * _927;
        float _937 = rsqrt(_897);
        float _939 = _935 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _937 * _951;
        float _957 = fma(_895, _943, _953);
        float _959 = fma(_891, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_887, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _915 = _959;
        _919 = _961;
        _909 = _939;
    }
    float _963 = _925;
    float _965 = _915;
    float _967 = _919;
    float _969 = _909;
    float _971 = -_709;
    float _973 = _971 + _963;
    float _975 = -_711;
    float _977 = _975 + _965;
    float _979 = -_737;
    float _981 = _979 + _967;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _973 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _989 = _977 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _981 + _991;
    float _995 = _985 * _985;
    float _997 = -_737;
    float _999 = _449 + _997;
    float _1001 = _973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1003 = fma(_989, _989, _995);
    float _1005 = fma(_993, _993, _1003);
    float _1007 = rsqrt(_1005);
    float _1009 = sqrt(_1005);
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1013 = _989 * _1011;
    float _1015 = _993 * _1011;
    float _1017 = _1013 * _1013;
    float _1019 = _1015 * _1015;
    float _1021 = _1017 + _1019;
    float _1023 = sqrt(_1021);
    bool _1025 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023 + _1027;
    float _1031 = _969;
    float _1033 = _1029;
    float _1035 = _1011;
    float _1037 = _1013;
    float _1039 = _1015;
    float _1041 = _1017;
    float _1043 = _1019;
    if (_1025)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1045;
    }
    float _1047 = _1031;
    if (_1025)
    {
        float _1049 = _1029 * _1047;
        _1033 = _1049;
    }
    float _1051 = _1033;
    if (_1025)
    {
        float _1053 = _1051 * 0.15915493667125701904296875;
        _911 = _1053;
    }
    float _1055 = _911;
    float _1057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1059 = _895;
    if (_1025)
    {
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        _1059 = _1063;
    }
    float _1065 = _1059;
    float _1067 = precise::max(0.0, _1057);
    float _1069 = _1051;
    float _1071 = _1067;
    if (_1025)
    {
        float _1073 = _1055 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        _1069 = _1075;
    }
    float _1077 = _1069;
    float _1079 = -_1011;
    float _1081 = -_1067;
    float _1083 = fma(_985, _1079, _1081);
    float _1085 = -_711;
    float _1087 = _423 + _1085;
    if (_1025)
    {
        float _1089 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1089;
    }
    float _1091 = _1071;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1095 = _1057;
    float _1097 = _1091;
    if (_1025)
    {
        float _1099 = rsqrt(_1021);
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = _1065;
    if (_1025)
    {
        float _1105 = fma(_1065, _1091, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1097 = _1105;
    }
    float _1107 = _1097;
    if (_1025)
    {
        float _1109 = _1077 + (-1.0);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1115 = fma(_1009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1113);
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    float _1119 = _1111;
    if (_1025)
    {
        float _1121 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = _1101;
    if (_1025)
    {
        float _1127 = _1101 * _1107;
        _1035 = _1127;
    }
    float _1129 = _1035;
    if (!_1025)
    {
        _1125 = _1083;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1025)
    {
        float _1135 = fma(_1083, _1077, _1123);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = _973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1025)
    {
        float _1141 = _1013 * _1129;
        _1037 = _1141;
    }
    float _1143 = _1037;
    if (_1025)
    {
        float _1145 = _1015 * _1129;
        _1039 = _1145;
    }
    float _1147 = _1039;
    float _1149 = _973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1151 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1139);
    if (_1025)
    {
        float _1153 = _1143 * _1143;
        _1041 = _1153;
    }
    float _1155 = _1041;
    if (_1025)
    {
        float _1157 = _1147 * _1147;
        _1043 = _1157;
    }
    float _1159 = _1043;
    float _1161 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1149);
    float _1163 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1151);
    float _1165 = fma(_1137, _1137, _1155);
    float _1167 = -_1117;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1175 = _1165 + _1159;
    float _1177 = _973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1179 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1161);
    float _1181 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = abs(_1169);
    float _1185 = log2(_1183);
    float _1187 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1177);
    float _1189 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1191 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1001);
    float _1193 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1199 = rsqrt(_1175);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1203 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1207 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1203);
    float _1209 = -_1195;
    float _1211 = fma(_1209, _1173, 1.0);
    float _1213 = floor(_1093);
    float _1215 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1221 = _1199 * _1143;
    float _1223 = _1199 * _1137;
    float _1225 = floor(_1171);
    float _1227 = _1199 * _1147;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1233 = -_1229;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1233);
    float _1237 = log2(_1211);
    float _1239 = -_1227;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1235);
    float _1243 = fma(_1241, -0.5, 0.5);
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = exp2(_1215);
    float _1249 = -_1213;
    float _1251 = _1093 + _1249;
    float _1253 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = -_1225;
    float _1257 = _1171 + _1255;
    float _1259 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1231);
    float _1261 = fma(_1245, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1265 = _1223 + 1.0;
    float _1267 = 1.0 / _1219;
    float _1269 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1259);
    float _1271 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1263);
    float _1273 = fma(_1245, _1261, -0.212114393711090087890625);
    float _1275 = _1237 * 0.693147182464599609375;
    float _1277 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1279 = sqrt(_1243);
    float _1281 = -_1223;
    float _1283 = fma(_1247, _1265, _1281);
    float _1285 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1269);
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1289 = _1285 * _1267;
    float _1291 = fma(_1245, _1273, 1.570728778839111328125);
    float _1293 = _1277 * _1267;
    float _1295 = fma(_1283, 0.5, 0.5);
    float _1297 = fma(_1293, 0.5, 0.5);
    float _1299 = _1279 * 0.636619746685028076171875;
    float _1301 = fma(_1289, -0.5, 0.5);
    float _1303 = -_1291;
    float _1305 = fma(_1299, _1303, 1.0);
    float2 _4564 = float2(_1251, _1257);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4564, float2(0.0), isnan(_4564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4564, float2(0.0), isnan(_4564)), level(0.0)).x;
    float3 _4575 = float3(_1297, _1301, _1287);
    float _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4575, float3(0.0), isnan(_4575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4575, float3(0.0), isnan(_4575)), level(0.0)).x;
    float3 _4586 = float3(_1297, _1301, _1287);
    float4 _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4586, float3(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4586, float3(0.0), isnan(_4586)), level(0.0)).xyzw;
    float _1314 = _1312.x;
    float _1316 = _1312.y;
    float _1318 = _1312.z;
    float _1320 = _1312.w;
    float2 _4602 = float2(_1305, _1295);
    float3 _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).xyz;
    float _1326 = _1324.x;
    float _1328 = _1324.y;
    float _1330 = _1324.z;
    float _1332 = float(uint(_499));
    float _1334 = trunc(_517);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    float _1342 = -_607;
    float _1344 = _1342 + 1.0;
    bool _1346 = _361 > 0.5;
    float _1348 = -_477;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_499;
    int _1354 = _1352 + 1;
    out.m_70.w = _691;
    int _1356 = abs(_475);
    float _1358 = 1.0 / _1332;
    out.m_72.x = _785;
    float _1360 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = float(uint(_1336));
    bool _1372 = !_1364;
    float _1374 = _1372 ? 7.345489978790283203125 : 1.0;
    float _1376 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = float(_1336);
    int _1380 = as_type<int>(_1358) + (-2);
    float _1382 = _1374 * _361;
    float _1384 = as_type<float>(_1380) * _1370;
    float _1386 = floor(_1382);
    float _1388 = trunc(_1384);
    float _1390 = precise::max(_1388, 0.0);
    uint _1393 = uint(_1390);
    float _1395 = -_1386;
    float _1397 = _1382 + _1395;
    float _1399 = _1397 * _611;
    int _1401 = _1354 * int(_1393);
    int _1403 = _1401 + _1336;
    float _1405 = trunc(_1399);
    int _1407 = int(_1405);
    float _1409 = float(uint(_1403));
    float _1411 = as_type<float>(_1380) * _1409;
    float _1413 = trunc(_1411);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    int _1419 = int(_1393) + int(_1417);
    bool _1421 = _1378 >= _611;
    bool _1423 = isnan(_1378);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_611);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    int _1433 = _1354 * _1419;
    int _1435 = _1433 + _1336;
    float _1437 = trunc(_1431);
    int _1439 = int(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1443 = _1441 != 0;
    bool _1445 = uint(_1435) >= uint(_499);
    bool _1447 = !_1443;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = !_1445;
    int _1453 = _1451 ? 0 : (-1);
    bool _1455 = _499 == 0;
    int _1457 = ~_1419;
    int _1459 = _1457 + _1453;
    int _1461 = _1459 + 1;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1465 = _1463 != 0;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1469 = _1467 != 0;
    int _1471 = _499 * _1461;
    int _1473 = _1471 + _1336;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1477 = _1475 != 0;
    int _1479 = ~_1439;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    bool _1485 = !_1455;
    int _1487 = _1485 ? _1473 : (-1);
    int _1489 = abs(_1449);
    int _1491 = _1487 * _1483;
    int _1493 = abs(_495);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _617 * _169;
    bool _1501 = _363 > 0.5;
    int _1503 = _1407 * _1489;
    int _1505 = _1503 + _1336;
    int _1507 = _499 + (-1);
    float _1509 = trunc(_1499);
    int _1511 = int(_1509);
    int _1513 = _1439 * _1507;
    int _1515 = _1513 + _1491;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1521 = 1.0 / _1497;
    int _1523 = abs(_539);
    int _1525 = _1515 * _1493;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1529 = !_1340;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1535 = _1511 * _1356;
    int _1537 = _1535 + _1525;
    int _1539 = abs(_1531);
    float _1541 = 1.0 / _1519;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1545 = _1505 * _1523;
    int _1547 = _1545 + _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1565 = _1551 * _1521;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _317 + _1567;
    int _1571 = _1407 * _1539;
    int _1573 = _1571 + _1547;
    float _1575 = float(uint(_1505));
    out.m_74.x = _1555;
    out.m_74.y = _1557;
    out.m_74.z = _1559;
    out.m_74.w = _1553;
    float _1577 = _1563 * _1541;
    bool _1579 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1581 = isnan(_317);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    bool _1591 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1593 = isnan(_317);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1565, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1605 = float(uint(_1573));
    float _1607 = as_type<float>(_1380) * _1575;
    bool _1609 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1611 = isnan(_317);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1601;
    float _1623 = _1621 + 1.0;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1627 = _317 + _1625;
    float _1629 = as_type<float>(_1380) * _1605;
    float _1631 = -_1589;
    float _1633 = _1631 + 1.0;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = _1619 * _1623;
    float _1643 = fma(_1577, _1627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1645 = -_1619;
    float _1647 = _1645 + 1.0;
    int _1649 = ~_499;
    int _1651 = _1649 + 1;
    float _1653 = _1603 * _1641;
    float _1655 = -_189;
    int _1657 = _1501 ? as_type<int>(_1655) : as_type<int>(_189);
    float _1659 = _1601 * _1633;
    float _1661 = trunc(_1629);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1653);
    bool _1669 = !_1477;
    float _1671 = _1669 ? _189 : as_type<float>(_1657);
    float _1673 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1675 = -_185;
    int _1677 = _1346 ? as_type<int>(_1675) : as_type<int>(_185);
    float _1679 = fma(_1643, _1659, _1667);
    int _1681 = _1651 * int(_1639);
    int _1683 = _1681 + _1505;
    int _1685 = ~_499;
    int _1687 = _1685 + 1;
    float _1689 = -_709;
    float _1691 = _413 + _1689;
    float _1693 = _1671 + (-0.5);
    bool _1695 = !_1469;
    float _1697 = _1695 ? _185 : as_type<float>(_1677);
    float _1699 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1679);
    float _1701 = float(uint(_1683));
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1705 = _1687 * int(_1665);
    int _1707 = _1705 + _1573;
    float _1709 = -_1693;
    float _1711 = -_525;
    float _1713 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1711);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1703);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1721 = float(uint(_1707));
    float _1723 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[80].x, _521);
    float _1725 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1727 = fma(_1671, _1344, _1713);
    float _1729 = as_type<float>(_1380) * _1701;
    float _1731 = as_type<float>(_1380) * _1721;
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1737 = -_1350;
    float _1739 = fma(_1697, _1737, _1723);
    float _1741 = 1.0 / _1733;
    float _1743 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1735);
    float _1745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_76.x = _1739;
    out.m_76.y = _1727;
    float _1747 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1751 = trunc(_1731);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = ~_499;
    int _1759 = _1757 + 1;
    float _1761 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = _1761 + _1733;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _1087;
    out.m_78.y = _1691;
    out.m_78.z = _999;
    float _1773 = trunc(_1729);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1769 * _1741;
    float _1781 = _1779 * 0.5;
    out.m_80.x = _1771;
    out.m_80.y = _1765;
    out.m_80.z = _1767;
    out.m_80.w = _1719;
    int _1783 = int(_1665) + int(_1755);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1787 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
    int _1789 = _1759 * _1783;
    int _1791 = _1789 + _1573;
    float _1793 = 1.0 / _1787;
    int _1795 = int(_1639) + int(_1777);
    float _1797 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1799 = uint(_1791) >= uint(_499);
    float _1801 = -_805;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1805 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1807 = -_805;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1797);
    bool _1811 = !_1799;
    int _1813 = _1811 ? 0 : (-1);
    float _1815 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1803);
    float _1817 = -_805;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1805);
    float _1821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _1823 = ~_1783;
    int _1825 = _1823 + _1813;
    int _1827 = _1825 + 1;
    float _1829 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1831 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1819);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1793 * _1833;
    int _1837 = _499 * _1827;
    int _1839 = _1837 + _1573;
    float _1841 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1829);
    float _1843 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1845 = abs(_1835);
    float _1847 = log2(_1845);
    float _1849 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1851 = !_1455;
    int _1853 = _1851 ? _1839 : (-1);
    int _1855 = _1759 * _1795;
    int _1857 = _1855 + _1505;
    float _1859 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1843);
    float _1861 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1849);
    int _1863 = _1853 >> 31;
    float _1865 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1867 = uint(_1857) >= uint(_499);
    float _1869 = _1673 * _1815;
    int _1871 = _1863 & 3;
    float _1873 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1875 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1877 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1865);
    int _1879 = _1853 + _1871;
    float _1881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1873);
    float _1883 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1875);
    float _1885 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1887 = _1879 >> 2;
    float _1889 = _1673 * _1821;
    float _1891 = _1673 * _1831;
    float _1893 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    int _1895 = _1887 << 4;
    int _1897 = _1895 + 368;
    float _1899 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1885);
    float _1903 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1859);
    uint _1905 = uint(int(uint(_1897) >> uint(2)));
    uint _1907 = uint(int(uint(int(_1905)) >> uint(2)));
    int _1909 = int(_1905) & 3;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[int(_1907)][_1909];
    int _1913 = int(_1905) + 1;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    int _1917 = _1913 & 3;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[int(_1915)][_1917];
    float _1921 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1877);
    float _1923 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1881);
    float _1925 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1861);
    float _1927 = fma(_1899, _1893, _1889);
    bool _1929 = !_1867;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = fma(_1899, _1903, _1869);
    int _1935 = _1853 & 3;
    bool _1937 = _1935 != 0;
    int _1939 = _1897 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = ~_1795;
    int _1959 = _1957 + _1931;
    int _1961 = _1959 + 1;
    float _1963 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1883);
    bool _1965 = uint(_1935) > 1u;
    float _1967 = fma(_1899, _1925, _1891);
    int _1969 = _499 * _1961;
    int _1971 = _1969 + _1505;
    int _1973 = _1853 & 3;
    bool _1975 = _1973 != 0;
    bool _1977 = _1935 != 3;
    float _1979 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    int _1983 = _1975 ? 0 : 1;
    bool _1985 = uint(_1935) >= 2u;
    float _1987 = fma(_1981, -2.0, 3.0);
    float _1989 = _1981 * _1981;
    int _1991 = ~_1983;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = _1985 ? 0 : 1;
    float _1999 = _1989 * _1987;
    int _2001 = _1995;
    float _2003 = _1219;
    float _2005 = _1285;
    if (!_1965)
    {
        int _2007 = ~_1983;
        int _2009 = _2007 + 1;
        _2001 = _2009;
    }
    int _2011 = _2001;
    int _2013 = ~_1997;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_1937;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = _1935 != 3;
    float _2025 = -_1999;
    float _2027 = _2025 + 1.0;
    int _2029 = abs(_2011);
    int _2031 = _2017;
    if (_1977)
    {
        int _2033 = ~_1997;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    int _2041 = abs(_2021);
    bool _2043 = !_2023;
    int _2045 = _2043 ? 0 : (-1);
    int _2047 = abs(_2037);
    int _2049 = ~_2029;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_2041;
    int _2057 = _2055 + 1;
    int _2059 = _2057 + 1;
    int _2061 = abs(_2045);
    int _2063 = _2053 * as_type<int>(_1919);
    bool _2065 = !_1465;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2059 * as_type<int>(_1911);
    int _2071 = _2069 + _2063;
    int _2073 = ~_2047;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = abs(_2067);
    int _2081 = _2077 * as_type<int>(_1947);
    int _2083 = _2081 + _2071;
    float _2085 = in.m_82.x;
    int _2087 = ~_2061;
    int _2089 = _2087 + 1;
    int _2091 = _2089 + 1;
    float _2093 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2103 = _2099 || _2101;
    float _2105 = _1219 * 0.5;
    int _2107 = ~_2079;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _2091 * as_type<int>(_1955);
    int _2115 = _2113 + _2083;
    bool _2117 = !_1455;
    int _2119 = _2117 ? _1971 : (-1);
    float _2121 = exp2(_2093);
    bool _2123 = _1835 <= 8000.0;
    bool _2125 = isnan(_1835);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(8000.0);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2115 * _2111;
    float _2137 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _2139 = _1277 + _1219;
    int _2141 = _2119 * _2079;
    int _2143 = _2141 + _2135;
    float _2145 = _2137 + _1219;
    float _2147 = fma(_1285, -0.5, _2105);
    float _2149 = _2133 * _2039;
    float _2151 = as_type<float>(_2059);
    float _2153 = _2105;
    if (_2103)
    {
        _2151 = 1.0;
    }
    float _2155 = _2151;
    float _2157 = _2145 * 0.5;
    float _2159 = _2139 * 0.5;
    float _2161 = float(_2143);
    float _2163 = _2155;
    float _2165 = _2159;
    if (_2103)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = _2167;
    if (!_2103)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1835, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2169 = _2217;
    }
    float _2219 = _2169;
    if (!_2103)
    {
        float _2221 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2223 = _2221 * 0.15915493667125701904296875;
        float _2225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2227 = _2223 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2225 * 0.15915493667125701904296875;
        float _2233 = _2223 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        float _2237 = 1.0 / _2229;
        float _2239 = _2231 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = _2235 * _2237;
        float _2245 = _2231 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        float _2249 = _2241 * _2243;
        float _2251 = 1.0 / _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2253;
        float _2257 = 1.0 / _2255;
        float _2259 = _2247 * _2251;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = fma(_1835, _2259, _2261);
        float _2265 = _2263 * _2257;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = -_2267;
        float _2271 = _2269 + 1.0;
        _2163 = _2271;
    }
    float _2273 = _2163;
    float _2275 = -_2121;
    float _2277 = _2275 + 1.0;
    out.gl_Position.x = _1277;
    out.gl_Position.y = _1285;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _1219;
    float _2279 = _1921 + _1927;
    float _2281 = _1923 + _1933;
    float _2283 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2161;
    float _2285 = _1963 + _1967;
    float _2287 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2289 = _2283 * _1309;
    float _2291 = -_1307;
    float _2293 = _2291 + 1.0;
    out.m_86.x = _977;
    out.m_86.y = _973;
    out.m_86.z = _981;
    float _2295 = _1330 * _2289;
    float _2297 = _2293 * _2287;
    float _2299 = precise::clamp(_2297, 0.0, 1.0);
    out.m_88.x = _2279;
    out.m_88.y = _2281;
    out.m_88.z = _2285;
    float _2301 = _1320 * _2289;
    float _2303 = -_2283;
    float _2305 = _2303 + 1.0;
    float _2307 = fma(_1320, _2295, _1318);
    bool _2309 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2311 = isnan(_1009);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2317 = _2313 || _2315;
    float _2319 = fma(_1326, _2301, _1314);
    float _2321 = fma(_1328, _2301, _1316);
    float _2323 = _1320 * _2305;
    float _2325 = -_2299;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _2159;
    out.m_90.y = _2147;
    out.m_90.z = _2157;
    out.m_90.w = _1219;
    float _2329 = _2327 * _2085;
    out.m_92.x = _2319;
    out.m_92.y = _2321;
    out.m_92.z = _2307;
    out.m_92.w = _2323;
    float _2331 = _2329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2333 = _2219 * _2273;
    float _2335 = _2305;
    float _2337 = _2333;
    float _2339 = _2331;
    if (!_2317)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2341 = _2003;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2317)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2347 = _2335;
    out.m_94.x = _2331;
    float _2349 = _2347;
    float _2351 = _2347;
    if (!_2317)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2353 = _2005;
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2353;
    float _2359 = _2353;
    if (!_2317)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2361 = _2165;
    float _2363 = _2361;
    float _2365 = _2361;
    if (!_2317)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2367 = _2337;
    float _2369 = _2367;
    float _2371 = _2367;
    if (!_2317)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2339;
    bool _2375 = !_2317;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2375)
    {
        bool _2381 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2383 = isnan(_1009);
        bool _2385 = _2381 || _2383;
        bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2389 = _2385 || _2387;
        if (!_2389)
        {
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2393 = _1009 + _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2397 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2395;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2403 = 1.0 / _2397;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2421 = _2393 * _2403;
            float _2423 = precise::clamp(_2421, 0.0, 1.0);
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = fma(_2423, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2431 = fma(_2423, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2433 = fma(_2423, _2407, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2435 = fma(_2423, _2411, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2437 = fma(_2423, _2415, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2439 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2345 = _2433;
            _2379 = _2437;
            _2365 = _2429;
            _2359 = _2435;
            _2351 = _2431;
            _2371 = _2439;
            _2441 = true;
        }
        else
        {
            bool _2443 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2445 = isnan(_1009);
            bool _2447 = _2443 || _2445;
            bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2451 = _2447 || _2449;
            if (!_2451)
            {
                _2363 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2453 = _2363;
            _2365 = _2453;
            if (!_2451)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2455 = _2343;
            _2345 = _2455;
            if (!_2451)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2457 = _2349;
            _2351 = _2457;
            if (!_2451)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2459 = _2357;
            _2359 = _2459;
            if (!_2451)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2451)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2463 = _2369;
            bool _2465 = !_2451;
            _2371 = _2463;
            if (!_2465)
            {
                bool _2467 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2469 = isnan(_1009);
                bool _2471 = _2467 || _2469;
                bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2475 = _2471 || _2473;
                if (!_2475)
                {
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2479 = _1009 + _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2483 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2481;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2489 = 1.0 / _2483;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2507 = _2479 * _2489;
                    float _2509 = precise::clamp(_2507, 0.0, 1.0);
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = fma(_2509, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2517 = fma(_2509, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2519 = fma(_2509, _2493, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2521 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2523 = fma(_2509, _2501, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2525 = fma(_2509, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2345 = _2519;
                    _2379 = _2523;
                    _2365 = _2515;
                    _2359 = _2521;
                    _2351 = _2517;
                    _2371 = _2525;
                    _2441 = true;
                }
                else
                {
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2365 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2441 = false;
    float _2527 = _2345;
    float _2529 = _2379;
    float _2531 = _2365;
    float _2533 = _2359;
    float _2535 = _2351;
    float _2537 = _2371;
    float _2539 = fma(_2281, -0.5, 0.5);
    float _2541 = precise::clamp(_2539, 0.0, 1.0);
    float _2543 = -_2527;
    float _2545 = _2543 + _2529;
    float _2547 = _2355 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = -_2531;
    float _2551 = _2549 + _2533;
    float _2553 = fma(_2541, _2545, _2527);
    out.m_96.x = 0.0;
    float _2555 = -_2535;
    float _2557 = _2555 + _2537;
    float _2559 = fma(_2541, _2551, _2531);
    float _2561 = _2553 * 0.586610972881317138671875;
    out.m_53.x = _2547;
    bool _2563 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2565 = fma(_2541, _2557, _2535);
    float _2567 = fma(_2559, 0.298911988735198974609375, _2561);
    bool _2569 = _2219 > 0.0;
    bool _2571 = isnan(_2219);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.0);
    bool _2577 = _2573 || _2575;
    float _2579 = fma(_2565, 0.114477999508380889892578125, _2567);
    bool _2581 = _2273 <= 0.0;
    bool _2583 = !_2577;
    bool _2585 = _2581 || _2583;
    float _2587 = -_2579;
    float _2589 = _2559 + _2587;
    float _2591 = -_2579;
    float _2593 = _2553 + _2591;
    float _2595 = -_2579;
    float _2597 = _2565 + _2595;
    float _2599 = fma(_2589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2601 = fma(_2593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2603 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    bool _2605 = !_2563;
    if (!_2605)
    {
        float _2607 = -_973;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2611 = -_977;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2615 = -_981;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2619 = _2609 * _2609;
        float _2621 = fma(_2613, _2613, _2619);
        float _2623 = fma(_2617, _2617, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = rsqrt(_2623);
        float _2629 = -_2625;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = _2613 * _2627;
        float _2639 = _2609 * _2627;
        float _2641 = abs(_2635);
        float _2643 = log2(_2641);
        float _2645 = _2617 * _2627;
        float _2647 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2649 = _2281 * _2639;
        float _2651 = -_2639;
        float _2653 = -_2647;
        float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2653);
        float _2657 = fma(_2279, _2637, _2649);
        float _2659 = -_2645;
        float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2655);
        float _2663 = fma(_2285, _2645, _2657);
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2669 = _2661 + _2667;
        float _2671 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2673 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2675 = precise::clamp(_2673, 0.0, 1.0);
        float _2677 = exp2(_2671);
        float _2679 = _2677 * _2675;
        float _2681 = _2665 * _2679;
        float _2683 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2687 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2683;
        out.m_96.y = _2685;
        out.m_96.z = _2687;
    }
    out.m_70.x = _2599;
    out.m_70.y = _2601;
    out.m_70.z = _2603;
    if (!_2585)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2689 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2689;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2441 = false;
    bool _315 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_139);
        out.gl_Position.z = _2758;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_165);
        out.gl_Position.z = _2813;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _173;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    bool _223 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_213);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -_233;
    float _253 = _251 + 1.0;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    float _259 = 1.0 / _237;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = _249 * _253;
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _217 * _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    float _291 = _287 * _219;
    float _293 = _289 * _221;
    bool _295 = !_261;
    float _313;
    if (!_295)
    {
        float _297 = in.m_58.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _173;
    }
    _315 = false;
    float _317 = _313;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _339 = _291 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = float(_327);
    float _367 = in.m_58.z;
    float _369 = 1.0 / _365;
    float _371 = _321 * _331;
    float _373 = _321 * _343;
    float _375 = fma(_319, _329, _371);
    float _377 = _321 * _355;
    float _379 = fma(_319, _341, _373);
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = fma(_323, _333, _375);
    float _387 = _361 * 2.0;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _391 = _363 * 2.0;
    float _393 = fma(_319, _353, _377);
    float _395 = fma(_323, _345, _379);
    float _397 = fma(_389, -2.0, _337);
    float _399 = floor(_387);
    float _401 = _367 * 2.0;
    float _403 = fma(_323, _357, _393);
    float _405 = _363 + _367;
    float _407 = -_349;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[77].x, _407);
    float _411 = _363 + _361;
    float _413 = _395 + _347;
    float _415 = _405 + (-1.0);
    float _417 = floor(_401);
    float _419 = _383 * _121;
    float _421 = _411 + (-1.0);
    float _423 = _385 + _335;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _427 = _413 + _425;
    float _429 = exp2(_419);
    bool _431 = _399 > 0.0;
    float _433 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _435 = _399 >= 0.0;
    bool _437 = isnan(_399);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _449 = _403 + _359;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _461 = _459 != 0;
    float _463 = floor(_391);
    int _465 = _443 ? 0 : 1;
    float _467 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].z, _445);
    bool _469 = _417 > 0.0;
    float _471 = _427 * _427;
    bool _473 = !_453;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _479 = _417 >= 0.0;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -_429;
    float _491 = _489 + 1.0;
    bool _493 = !_457;
    int _495 = _493 ? 0 : 1;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _499 = int(_497);
    bool _501 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _513 = _423 + _511;
    int _515 = _487 ? 0 : 1;
    float _517 = _369 * _121;
    float _519 = -_121;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _409);
    bool _523 = _463 > 0.0;
    float _525 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    bool _527 = _463 >= 0.0;
    bool _529 = isnan(_463);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = !_461;
    int _539 = _537 ? 0 : 1;
    int _541 = ~_515;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = _509 ? _491 : 0.0;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    int _563 = _545;
    if (!_469)
    {
        int _565 = ~_515;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].w, _549);
    bool _573 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _575 = isnan(1.0);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _585 = 1.0 + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = in.m_68.z;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _595 = _449 + _593;
    bool _597 = !_553;
    int _599 = _597 ? 0 : 1;
    float _601 = 1.0 / _585;
    bool _603 = !_557;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    int _609 = abs(_599);
    float _611 = float(_499);
    int _613 = abs(_605);
    float _615 = fma(_513, _513, _471);
    float _617 = _611 * _121;
    int _619 = ~_465;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_595, _595, _615);
    float _627 = float(_609);
    float _629 = float(_569);
    float _631 = sqrt(_625);
    int _633 = _623;
    if (_581)
    {
        float _635 = _547 * _601;
        _131 = _635;
    }
    float _637 = _131;
    if (!_431)
    {
        int _639 = ~_465;
        int _641 = _639 + 1;
        _633 = _641;
    }
    int _643 = _633;
    float _645 = _627 * _629;
    int _647 = _535 ? 0 : 1;
    float _649 = _339 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _651 = float(_643);
    float _653 = rsqrt(_625);
    float _655 = float(_613);
    float _657 = _645 * (-2.0);
    int _659 = ~_647;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _663;
    if (!_523)
    {
        int _667 = ~_647;
        int _669 = _667 + 1;
        _665 = _669;
    }
    int _671 = _665;
    float _673 = _655 * _651;
    float _675 = _361 + (-0.5);
    float _677 = fma(_657, _587, _587);
    float _679 = _631 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _681 = _673 * (-2.0);
    bool _683 = !_561;
    int _685 = _683 ? 0 : 1;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].x, _677);
    float _689 = fma(_447, _657, _447);
    float _691 = precise::min(_649, _679);
    float _693 = fma(_681, _589, _589);
    int _695 = abs(_685);
    float _697 = _363 + (-0.5);
    float _699 = fma(_433, _681, _433);
    float _701 = _653 * _691;
    float _703 = float(_671);
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _707 = float(_695);
    float _709 = _427 * _701;
    float _711 = _513 * _701;
    float _713 = fma(_689, _637, _687);
    float _715 = fma(_699, _637, _705);
    float _717 = -_709;
    float _719 = _427 + _717;
    float _721 = -_711;
    float _723 = _513 + _721;
    float _725 = _707 * _703;
    float _727 = _367 + _361;
    float _729 = _719 * _719;
    float _731 = _713 * 0.15915493667125701904296875;
    float _733 = _727 + (-1.0);
    float _735 = fma(_723, _723, _729);
    float _737 = _595 * _701;
    float _739 = _725 * (-2.0);
    float _741 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _743 = _367 + (-0.5);
    float _745 = -_737;
    float _747 = _595 + _745;
    float _749 = fma(_739, _591, _591);
    float _751 = fma(_741, _739, _741);
    float _753 = _715 * 0.15915493667125701904296875;
    float _755 = fma(_747, _747, _735);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _759 = _731 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_751, _637, _757);
    float _765 = _763 * 0.15915493667125701904296875;
    float _767 = sqrt(_755);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _771 = _753 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _777 = _753 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = _653 * _767;
    float _783 = _351 * _781;
    float _785 = _339 * _781;
    float _787 = _731 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _761 * _773;
    float _793 = _783 * _769;
    float _795 = _785 * _775;
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _761 * _779;
    float _803 = _765 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = _789 * _773;
    float _809 = _789 * _779;
    float _811 = _761 * _799;
    float _813 = _789 * _799;
    float _815 = _779 * _799;
    float _817 = _773 * _799;
    float _819 = _811 * _793;
    float _821 = _781 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = fma(_805, _801, _807);
    float _827 = -_809;
    float _829 = fma(_805, _791, _827);
    float _831 = -_793;
    float _833 = _805 * _831;
    float _835 = -_791;
    float _837 = fma(_805, _809, _835);
    float _839 = fma(_825, _795, _819);
    float _841 = _813 * _793;
    float _843 = fma(_815, _795, _833);
    float _845 = fma(_805, _807, _801);
    float _847 = fma(_829, _823, _839);
    float _849 = fma(_837, _795, _841);
    float _851 = fma(_817, _823, _843);
    float _853 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_845, _823, _849);
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _857);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _859);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _863);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _865);
    float _873 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _871 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _879 = _449 + _873;
    float _881 = _423 + _875;
    float _883 = _413 + _877;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _887 = _879 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = _887 * _887;
    float _895 = precise::min(_883, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _897 = fma(_891, _891, _893);
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = _893;
    float _905 = _855;
    float _907 = _881;
    float _909 = _879;
    float _911 = _897;
    if (!_901)
    {
        _903 = _881;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_901)
    {
        _905 = _879;
    }
    float _917 = _905;
    float _919 = _917;
    if (!_901)
    {
        _907 = _895;
    }
    float _921 = _907;
    bool _923 = !_901;
    float _925 = _921;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _899 + _929;
        float _933 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = _931 * _927;
        float _937 = rsqrt(_897);
        float _939 = _935 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _937 * _951;
        float _957 = fma(_895, _943, _953);
        float _959 = fma(_891, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_887, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _915 = _959;
        _919 = _961;
        _909 = _939;
    }
    float _963 = _925;
    float _965 = _915;
    float _967 = _919;
    float _969 = _909;
    float _971 = -_709;
    float _973 = _971 + _963;
    float _975 = -_711;
    float _977 = _975 + _965;
    float _979 = -_737;
    float _981 = _979 + _967;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _973 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _989 = _977 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _981 + _991;
    float _995 = _985 * _985;
    float _997 = -_737;
    float _999 = _449 + _997;
    float _1001 = _973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1003 = fma(_989, _989, _995);
    float _1005 = fma(_993, _993, _1003);
    float _1007 = rsqrt(_1005);
    float _1009 = sqrt(_1005);
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1013 = _989 * _1011;
    float _1015 = _993 * _1011;
    float _1017 = _1013 * _1013;
    float _1019 = _1015 * _1015;
    float _1021 = _1017 + _1019;
    float _1023 = sqrt(_1021);
    bool _1025 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023 + _1027;
    float _1031 = _969;
    float _1033 = _1029;
    float _1035 = _1011;
    float _1037 = _1013;
    float _1039 = _1015;
    float _1041 = _1017;
    float _1043 = _1019;
    if (_1025)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1045;
    }
    float _1047 = _1031;
    if (_1025)
    {
        float _1049 = _1029 * _1047;
        _1033 = _1049;
    }
    float _1051 = _1033;
    if (_1025)
    {
        float _1053 = _1051 * 0.15915493667125701904296875;
        _911 = _1053;
    }
    float _1055 = _911;
    float _1057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1059 = _895;
    if (_1025)
    {
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        _1059 = _1063;
    }
    float _1065 = _1059;
    float _1067 = precise::max(0.0, _1057);
    float _1069 = _1051;
    float _1071 = _1067;
    if (_1025)
    {
        float _1073 = _1055 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        _1069 = _1075;
    }
    float _1077 = _1069;
    float _1079 = -_1011;
    float _1081 = -_1067;
    float _1083 = fma(_985, _1079, _1081);
    float _1085 = -_711;
    float _1087 = _423 + _1085;
    if (_1025)
    {
        float _1089 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1089;
    }
    float _1091 = _1071;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1095 = _1057;
    float _1097 = _1091;
    if (_1025)
    {
        float _1099 = rsqrt(_1021);
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = _1065;
    if (_1025)
    {
        float _1105 = fma(_1065, _1091, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1097 = _1105;
    }
    float _1107 = _1097;
    if (_1025)
    {
        float _1109 = _1077 + (-1.0);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1115 = fma(_1009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1113);
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    float _1119 = _1111;
    if (_1025)
    {
        float _1121 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = _1101;
    if (_1025)
    {
        float _1127 = _1101 * _1107;
        _1035 = _1127;
    }
    float _1129 = _1035;
    if (!_1025)
    {
        _1125 = _1083;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1025)
    {
        float _1135 = fma(_1083, _1077, _1123);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = _973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1025)
    {
        float _1141 = _1013 * _1129;
        _1037 = _1141;
    }
    float _1143 = _1037;
    if (_1025)
    {
        float _1145 = _1015 * _1129;
        _1039 = _1145;
    }
    float _1147 = _1039;
    float _1149 = _973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1151 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1139);
    if (_1025)
    {
        float _1153 = _1143 * _1143;
        _1041 = _1153;
    }
    float _1155 = _1041;
    if (_1025)
    {
        float _1157 = _1147 * _1147;
        _1043 = _1157;
    }
    float _1159 = _1043;
    float _1161 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1149);
    float _1163 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1151);
    float _1165 = fma(_1137, _1137, _1155);
    float _1167 = -_1117;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1175 = _1165 + _1159;
    float _1177 = _973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1179 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1161);
    float _1181 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = abs(_1169);
    float _1185 = log2(_1183);
    float _1187 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1177);
    float _1189 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1191 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1001);
    float _1193 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1199 = rsqrt(_1175);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1203 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1207 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1203);
    float _1209 = -_1195;
    float _1211 = fma(_1209, _1173, 1.0);
    float _1213 = floor(_1093);
    float _1215 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1221 = _1199 * _1143;
    float _1223 = _1199 * _1137;
    float _1225 = floor(_1171);
    float _1227 = _1199 * _1147;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1233 = -_1229;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1233);
    float _1237 = log2(_1211);
    float _1239 = -_1227;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1235);
    float _1243 = fma(_1241, -0.5, 0.5);
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = exp2(_1215);
    float _1249 = -_1213;
    float _1251 = _1093 + _1249;
    float _1253 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = -_1225;
    float _1257 = _1171 + _1255;
    float _1259 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1231);
    float _1261 = fma(_1245, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1265 = _1223 + 1.0;
    float _1267 = 1.0 / _1219;
    float _1269 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1259);
    float _1271 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1263);
    float _1273 = fma(_1245, _1261, -0.212114393711090087890625);
    float _1275 = _1237 * 0.693147182464599609375;
    float _1277 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1279 = sqrt(_1243);
    float _1281 = -_1223;
    float _1283 = fma(_1247, _1265, _1281);
    float _1285 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1269);
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1289 = _1285 * _1267;
    float _1291 = fma(_1245, _1273, 1.570728778839111328125);
    float _1293 = _1277 * _1267;
    float _1295 = fma(_1283, 0.5, 0.5);
    float _1297 = fma(_1293, 0.5, 0.5);
    float _1299 = _1279 * 0.636619746685028076171875;
    float _1301 = fma(_1289, -0.5, 0.5);
    float _1303 = -_1291;
    float _1305 = fma(_1299, _1303, 1.0);
    float2 _4564 = float2(_1251, _1257);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4564, float2(0.0), isnan(_4564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4564, float2(0.0), isnan(_4564)), level(0.0)).x;
    float3 _4575 = float3(_1297, _1301, _1287);
    float _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4575, float3(0.0), isnan(_4575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4575, float3(0.0), isnan(_4575)), level(0.0)).x;
    float3 _4586 = float3(_1297, _1301, _1287);
    float4 _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4586, float3(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4586, float3(0.0), isnan(_4586)), level(0.0)).xyzw;
    float _1314 = _1312.x;
    float _1316 = _1312.y;
    float _1318 = _1312.z;
    float _1320 = _1312.w;
    float2 _4602 = float2(_1305, _1295);
    float3 _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).xyz;
    float _1326 = _1324.x;
    float _1328 = _1324.y;
    float _1330 = _1324.z;
    float _1332 = float(uint(_499));
    float _1334 = trunc(_517);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    float _1342 = -_607;
    float _1344 = _1342 + 1.0;
    bool _1346 = _361 > 0.5;
    float _1348 = -_477;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_499;
    int _1354 = _1352 + 1;
    out.m_70.w = _691;
    int _1356 = abs(_475);
    float _1358 = 1.0 / _1332;
    out.m_72.x = _785;
    float _1360 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = float(uint(_1336));
    bool _1372 = !_1364;
    float _1374 = _1372 ? 7.345489978790283203125 : 1.0;
    float _1376 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = float(_1336);
    int _1380 = as_type<int>(_1358) + (-2);
    float _1382 = _1374 * _361;
    float _1384 = as_type<float>(_1380) * _1370;
    float _1386 = floor(_1382);
    float _1388 = trunc(_1384);
    float _1390 = precise::max(_1388, 0.0);
    uint _1393 = uint(_1390);
    float _1395 = -_1386;
    float _1397 = _1382 + _1395;
    float _1399 = _1397 * _611;
    int _1401 = _1354 * int(_1393);
    int _1403 = _1401 + _1336;
    float _1405 = trunc(_1399);
    int _1407 = int(_1405);
    float _1409 = float(uint(_1403));
    float _1411 = as_type<float>(_1380) * _1409;
    float _1413 = trunc(_1411);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    int _1419 = int(_1393) + int(_1417);
    bool _1421 = _1378 >= _611;
    bool _1423 = isnan(_1378);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_611);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    int _1433 = _1354 * _1419;
    int _1435 = _1433 + _1336;
    float _1437 = trunc(_1431);
    int _1439 = int(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1443 = _1441 != 0;
    bool _1445 = uint(_1435) >= uint(_499);
    bool _1447 = !_1443;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = !_1445;
    int _1453 = _1451 ? 0 : (-1);
    bool _1455 = _499 == 0;
    int _1457 = ~_1419;
    int _1459 = _1457 + _1453;
    int _1461 = _1459 + 1;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1465 = _1463 != 0;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1469 = _1467 != 0;
    int _1471 = _499 * _1461;
    int _1473 = _1471 + _1336;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1477 = _1475 != 0;
    int _1479 = ~_1439;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    bool _1485 = !_1455;
    int _1487 = _1485 ? _1473 : (-1);
    int _1489 = abs(_1449);
    int _1491 = _1487 * _1483;
    int _1493 = abs(_495);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _617 * _169;
    bool _1501 = _363 > 0.5;
    int _1503 = _1407 * _1489;
    int _1505 = _1503 + _1336;
    int _1507 = _499 + (-1);
    float _1509 = trunc(_1499);
    int _1511 = int(_1509);
    int _1513 = _1439 * _1507;
    int _1515 = _1513 + _1491;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1521 = 1.0 / _1497;
    int _1523 = abs(_539);
    int _1525 = _1515 * _1493;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1529 = !_1340;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1535 = _1511 * _1356;
    int _1537 = _1535 + _1525;
    int _1539 = abs(_1531);
    float _1541 = 1.0 / _1519;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1545 = _1505 * _1523;
    int _1547 = _1545 + _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1565 = _1551 * _1521;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _317 + _1567;
    int _1571 = _1407 * _1539;
    int _1573 = _1571 + _1547;
    float _1575 = float(uint(_1505));
    out.m_74.x = _1555;
    out.m_74.y = _1557;
    out.m_74.z = _1559;
    out.m_74.w = _1553;
    float _1577 = _1563 * _1541;
    bool _1579 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1581 = isnan(_317);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    bool _1591 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1593 = isnan(_317);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1565, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1605 = float(uint(_1573));
    float _1607 = as_type<float>(_1380) * _1575;
    bool _1609 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1611 = isnan(_317);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1601;
    float _1623 = _1621 + 1.0;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1627 = _317 + _1625;
    float _1629 = as_type<float>(_1380) * _1605;
    float _1631 = -_1589;
    float _1633 = _1631 + 1.0;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = _1619 * _1623;
    float _1643 = fma(_1577, _1627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1645 = -_1619;
    float _1647 = _1645 + 1.0;
    int _1649 = ~_499;
    int _1651 = _1649 + 1;
    float _1653 = _1603 * _1641;
    float _1655 = -_189;
    int _1657 = _1501 ? as_type<int>(_1655) : as_type<int>(_189);
    float _1659 = _1601 * _1633;
    float _1661 = trunc(_1629);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1653);
    bool _1669 = !_1477;
    float _1671 = _1669 ? _189 : as_type<float>(_1657);
    float _1673 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1675 = -_185;
    int _1677 = _1346 ? as_type<int>(_1675) : as_type<int>(_185);
    float _1679 = fma(_1643, _1659, _1667);
    int _1681 = _1651 * int(_1639);
    int _1683 = _1681 + _1505;
    int _1685 = ~_499;
    int _1687 = _1685 + 1;
    float _1689 = -_709;
    float _1691 = _413 + _1689;
    float _1693 = _1671 + (-0.5);
    bool _1695 = !_1469;
    float _1697 = _1695 ? _185 : as_type<float>(_1677);
    float _1699 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1679);
    float _1701 = float(uint(_1683));
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1705 = _1687 * int(_1665);
    int _1707 = _1705 + _1573;
    float _1709 = -_1693;
    float _1711 = -_525;
    float _1713 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1711);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1703);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1721 = float(uint(_1707));
    float _1723 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[80].x, _521);
    float _1725 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1727 = fma(_1671, _1344, _1713);
    float _1729 = as_type<float>(_1380) * _1701;
    float _1731 = as_type<float>(_1380) * _1721;
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1737 = -_1350;
    float _1739 = fma(_1697, _1737, _1723);
    float _1741 = 1.0 / _1733;
    float _1743 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1735);
    float _1745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_76.x = _1739;
    out.m_76.y = _1727;
    float _1747 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1751 = trunc(_1731);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = ~_499;
    int _1759 = _1757 + 1;
    float _1761 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = _1761 + _1733;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _1087;
    out.m_78.y = _1691;
    out.m_78.z = _999;
    float _1773 = trunc(_1729);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1769 * _1741;
    float _1781 = _1779 * 0.5;
    out.m_80.x = _1771;
    out.m_80.y = _1765;
    out.m_80.z = _1767;
    out.m_80.w = _1719;
    int _1783 = int(_1665) + int(_1755);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1787 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
    int _1789 = _1759 * _1783;
    int _1791 = _1789 + _1573;
    float _1793 = 1.0 / _1787;
    int _1795 = int(_1639) + int(_1777);
    float _1797 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1799 = uint(_1791) >= uint(_499);
    float _1801 = -_805;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1805 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1807 = -_805;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1797);
    bool _1811 = !_1799;
    int _1813 = _1811 ? 0 : (-1);
    float _1815 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1803);
    float _1817 = -_805;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1805);
    float _1821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _1823 = ~_1783;
    int _1825 = _1823 + _1813;
    int _1827 = _1825 + 1;
    float _1829 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1831 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1819);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1793 * _1833;
    int _1837 = _499 * _1827;
    int _1839 = _1837 + _1573;
    float _1841 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1829);
    float _1843 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1845 = abs(_1835);
    float _1847 = log2(_1845);
    float _1849 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1851 = !_1455;
    int _1853 = _1851 ? _1839 : (-1);
    int _1855 = _1759 * _1795;
    int _1857 = _1855 + _1505;
    float _1859 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1843);
    float _1861 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1849);
    int _1863 = _1853 >> 31;
    float _1865 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1867 = uint(_1857) >= uint(_499);
    float _1869 = _1673 * _1815;
    int _1871 = _1863 & 3;
    float _1873 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1875 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1877 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1865);
    int _1879 = _1853 + _1871;
    float _1881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1873);
    float _1883 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1875);
    float _1885 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1887 = _1879 >> 2;
    float _1889 = _1673 * _1821;
    float _1891 = _1673 * _1831;
    float _1893 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    int _1895 = _1887 << 4;
    int _1897 = _1895 + 368;
    float _1899 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1885);
    float _1903 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1859);
    uint _1905 = uint(int(uint(_1897) >> uint(2)));
    uint _1907 = uint(int(uint(int(_1905)) >> uint(2)));
    int _1909 = int(_1905) & 3;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[int(_1907)][_1909];
    int _1913 = int(_1905) + 1;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    int _1917 = _1913 & 3;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[int(_1915)][_1917];
    float _1921 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1877);
    float _1923 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1881);
    float _1925 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1861);
    float _1927 = fma(_1899, _1893, _1889);
    bool _1929 = !_1867;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = fma(_1899, _1903, _1869);
    int _1935 = _1853 & 3;
    bool _1937 = _1935 != 0;
    int _1939 = _1897 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = ~_1795;
    int _1959 = _1957 + _1931;
    int _1961 = _1959 + 1;
    float _1963 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1883);
    bool _1965 = uint(_1935) > 1u;
    float _1967 = fma(_1899, _1925, _1891);
    int _1969 = _499 * _1961;
    int _1971 = _1969 + _1505;
    int _1973 = _1853 & 3;
    bool _1975 = _1973 != 0;
    bool _1977 = _1935 != 3;
    float _1979 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    int _1983 = _1975 ? 0 : 1;
    bool _1985 = uint(_1935) >= 2u;
    float _1987 = fma(_1981, -2.0, 3.0);
    float _1989 = _1981 * _1981;
    int _1991 = ~_1983;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = _1985 ? 0 : 1;
    float _1999 = _1989 * _1987;
    int _2001 = _1995;
    float _2003 = _1219;
    float _2005 = _1285;
    if (!_1965)
    {
        int _2007 = ~_1983;
        int _2009 = _2007 + 1;
        _2001 = _2009;
    }
    int _2011 = _2001;
    int _2013 = ~_1997;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_1937;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = _1935 != 3;
    float _2025 = -_1999;
    float _2027 = _2025 + 1.0;
    int _2029 = abs(_2011);
    int _2031 = _2017;
    if (_1977)
    {
        int _2033 = ~_1997;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    int _2041 = abs(_2021);
    bool _2043 = !_2023;
    int _2045 = _2043 ? 0 : (-1);
    int _2047 = abs(_2037);
    int _2049 = ~_2029;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_2041;
    int _2057 = _2055 + 1;
    int _2059 = _2057 + 1;
    int _2061 = abs(_2045);
    int _2063 = _2053 * as_type<int>(_1919);
    bool _2065 = !_1465;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2059 * as_type<int>(_1911);
    int _2071 = _2069 + _2063;
    int _2073 = ~_2047;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = abs(_2067);
    int _2081 = _2077 * as_type<int>(_1947);
    int _2083 = _2081 + _2071;
    float _2085 = in.m_82.x;
    int _2087 = ~_2061;
    int _2089 = _2087 + 1;
    int _2091 = _2089 + 1;
    float _2093 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2103 = _2099 || _2101;
    float _2105 = _1219 * 0.5;
    int _2107 = ~_2079;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _2091 * as_type<int>(_1955);
    int _2115 = _2113 + _2083;
    bool _2117 = !_1455;
    int _2119 = _2117 ? _1971 : (-1);
    float _2121 = exp2(_2093);
    bool _2123 = _1835 <= 8000.0;
    bool _2125 = isnan(_1835);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(8000.0);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2115 * _2111;
    float _2137 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _2139 = _1277 + _1219;
    int _2141 = _2119 * _2079;
    int _2143 = _2141 + _2135;
    float _2145 = _2137 + _1219;
    float _2147 = fma(_1285, -0.5, _2105);
    float _2149 = _2133 * _2039;
    float _2151 = as_type<float>(_2059);
    float _2153 = _2105;
    if (_2103)
    {
        _2151 = 1.0;
    }
    float _2155 = _2151;
    float _2157 = _2145 * 0.5;
    float _2159 = _2139 * 0.5;
    float _2161 = float(_2143);
    float _2163 = _2155;
    float _2165 = _2159;
    if (_2103)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = _2167;
    if (!_2103)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1835, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2169 = _2217;
    }
    float _2219 = _2169;
    if (!_2103)
    {
        float _2221 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2223 = _2221 * 0.15915493667125701904296875;
        float _2225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2227 = _2223 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2225 * 0.15915493667125701904296875;
        float _2233 = _2223 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        float _2237 = 1.0 / _2229;
        float _2239 = _2231 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = _2235 * _2237;
        float _2245 = _2231 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        float _2249 = _2241 * _2243;
        float _2251 = 1.0 / _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2253;
        float _2257 = 1.0 / _2255;
        float _2259 = _2247 * _2251;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = fma(_1835, _2259, _2261);
        float _2265 = _2263 * _2257;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = -_2267;
        float _2271 = _2269 + 1.0;
        _2163 = _2271;
    }
    float _2273 = _2163;
    float _2275 = -_2121;
    float _2277 = _2275 + 1.0;
    out.gl_Position.x = _1277;
    out.gl_Position.y = _1285;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _1219;
    float _2279 = _1921 + _1927;
    float _2281 = _1923 + _1933;
    float _2283 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2161;
    float _2285 = _1963 + _1967;
    float _2287 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2289 = _2283 * _1309;
    float _2291 = -_1307;
    float _2293 = _2291 + 1.0;
    out.m_86.x = _977;
    out.m_86.y = _973;
    out.m_86.z = _981;
    float _2295 = _1330 * _2289;
    float _2297 = _2293 * _2287;
    float _2299 = precise::clamp(_2297, 0.0, 1.0);
    out.m_88.x = _2279;
    out.m_88.y = _2281;
    out.m_88.z = _2285;
    float _2301 = _1320 * _2289;
    float _2303 = -_2283;
    float _2305 = _2303 + 1.0;
    float _2307 = fma(_1320, _2295, _1318);
    bool _2309 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2311 = isnan(_1009);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2317 = _2313 || _2315;
    float _2319 = fma(_1326, _2301, _1314);
    float _2321 = fma(_1328, _2301, _1316);
    float _2323 = _1320 * _2305;
    float _2325 = -_2299;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _2159;
    out.m_90.y = _2147;
    out.m_90.z = _2157;
    out.m_90.w = _1219;
    float _2329 = _2327 * _2085;
    out.m_92.x = _2319;
    out.m_92.y = _2321;
    out.m_92.z = _2307;
    out.m_92.w = _2323;
    float _2331 = _2329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2333 = _2219 * _2273;
    float _2335 = _2305;
    float _2337 = _2333;
    float _2339 = _2331;
    if (!_2317)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2341 = _2003;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2317)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2347 = _2335;
    out.m_94.x = _2331;
    float _2349 = _2347;
    float _2351 = _2347;
    if (!_2317)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2353 = _2005;
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2353;
    float _2359 = _2353;
    if (!_2317)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2361 = _2165;
    float _2363 = _2361;
    float _2365 = _2361;
    if (!_2317)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2367 = _2337;
    float _2369 = _2367;
    float _2371 = _2367;
    if (!_2317)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2339;
    bool _2375 = !_2317;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2375)
    {
        bool _2381 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2383 = isnan(_1009);
        bool _2385 = _2381 || _2383;
        bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2389 = _2385 || _2387;
        if (!_2389)
        {
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2393 = _1009 + _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2397 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2395;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2403 = 1.0 / _2397;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2421 = _2393 * _2403;
            float _2423 = precise::clamp(_2421, 0.0, 1.0);
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = fma(_2423, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2431 = fma(_2423, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2433 = fma(_2423, _2407, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2435 = fma(_2423, _2411, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2437 = fma(_2423, _2415, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2439 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2345 = _2433;
            _2379 = _2437;
            _2365 = _2429;
            _2359 = _2435;
            _2351 = _2431;
            _2371 = _2439;
            _2441 = true;
        }
        else
        {
            bool _2443 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2445 = isnan(_1009);
            bool _2447 = _2443 || _2445;
            bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2451 = _2447 || _2449;
            if (!_2451)
            {
                _2363 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2453 = _2363;
            _2365 = _2453;
            if (!_2451)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2455 = _2343;
            _2345 = _2455;
            if (!_2451)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2457 = _2349;
            _2351 = _2457;
            if (!_2451)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2459 = _2357;
            _2359 = _2459;
            if (!_2451)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2451)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2463 = _2369;
            bool _2465 = !_2451;
            _2371 = _2463;
            if (!_2465)
            {
                bool _2467 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2469 = isnan(_1009);
                bool _2471 = _2467 || _2469;
                bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2475 = _2471 || _2473;
                if (!_2475)
                {
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2479 = _1009 + _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2483 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2481;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2489 = 1.0 / _2483;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2507 = _2479 * _2489;
                    float _2509 = precise::clamp(_2507, 0.0, 1.0);
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = fma(_2509, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2517 = fma(_2509, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2519 = fma(_2509, _2493, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2521 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2523 = fma(_2509, _2501, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2525 = fma(_2509, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2345 = _2519;
                    _2379 = _2523;
                    _2365 = _2515;
                    _2359 = _2521;
                    _2351 = _2517;
                    _2371 = _2525;
                    _2441 = true;
                }
                else
                {
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2365 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2441 = false;
    float _2527 = _2345;
    float _2529 = _2379;
    float _2531 = _2365;
    float _2533 = _2359;
    float _2535 = _2351;
    float _2537 = _2371;
    float _2539 = fma(_2281, -0.5, 0.5);
    float _2541 = precise::clamp(_2539, 0.0, 1.0);
    float _2543 = -_2527;
    float _2545 = _2543 + _2529;
    float _2547 = _2355 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = -_2531;
    float _2551 = _2549 + _2533;
    float _2553 = fma(_2541, _2545, _2527);
    out.m_96.x = 0.0;
    float _2555 = -_2535;
    float _2557 = _2555 + _2537;
    float _2559 = fma(_2541, _2551, _2531);
    float _2561 = _2553 * 0.586610972881317138671875;
    out.m_53.x = _2547;
    bool _2563 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2565 = fma(_2541, _2557, _2535);
    float _2567 = fma(_2559, 0.298911988735198974609375, _2561);
    bool _2569 = _2219 > 0.0;
    bool _2571 = isnan(_2219);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.0);
    bool _2577 = _2573 || _2575;
    float _2579 = fma(_2565, 0.114477999508380889892578125, _2567);
    bool _2581 = _2273 <= 0.0;
    bool _2583 = !_2577;
    bool _2585 = _2581 || _2583;
    float _2587 = -_2579;
    float _2589 = _2559 + _2587;
    float _2591 = -_2579;
    float _2593 = _2553 + _2591;
    float _2595 = -_2579;
    float _2597 = _2565 + _2595;
    float _2599 = fma(_2589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2601 = fma(_2593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2603 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    bool _2605 = !_2563;
    if (!_2605)
    {
        float _2607 = -_973;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2611 = -_977;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2615 = -_981;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2619 = _2609 * _2609;
        float _2621 = fma(_2613, _2613, _2619);
        float _2623 = fma(_2617, _2617, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = rsqrt(_2623);
        float _2629 = -_2625;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = _2613 * _2627;
        float _2639 = _2609 * _2627;
        float _2641 = abs(_2635);
        float _2643 = log2(_2641);
        float _2645 = _2617 * _2627;
        float _2647 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2649 = _2281 * _2639;
        float _2651 = -_2639;
        float _2653 = -_2647;
        float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2653);
        float _2657 = fma(_2279, _2637, _2649);
        float _2659 = -_2645;
        float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2655);
        float _2663 = fma(_2285, _2645, _2657);
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2669 = _2661 + _2667;
        float _2671 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2673 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2675 = precise::clamp(_2673, 0.0, 1.0);
        float _2677 = exp2(_2671);
        float _2679 = _2677 * _2675;
        float _2681 = _2665 * _2679;
        float _2683 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2687 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2683;
        out.m_96.y = _2685;
        out.m_96.z = _2687;
    }
    out.m_70.x = _2599;
    out.m_70.y = _2601;
    out.m_70.z = _2603;
    if (!_2585)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2689 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2689;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2441 = false;
    bool _315 = false;
    bool _211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_139);
        out.gl_Position.z = _2758;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_165);
        out.gl_Position.z = _2813;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _209;
    if (!_191)
    {
        float _193 = in.m_58.x;
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _201 = _199 * _195;
        float _203 = floor(_201);
        float _205 = -_203;
        float _207 = _201 + _205;
        _209 = _207;
        _211 = true;
    }
    else
    {
        _209 = _173;
    }
    _211 = false;
    float _213 = _209;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _213 + _215;
    float _219 = in.m_60.x;
    float _221 = in.m_60.y;
    bool _223 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_213);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    bool _239 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_213);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -_233;
    float _253 = _251 + 1.0;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _255;
    float _259 = 1.0 / _237;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = _249 * _253;
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _217 * _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _271;
    float _275 = fma(_257, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _277 = fma(_273, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _279 = _275 * _263;
    float _281 = _277 * _263;
    float _283 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _279);
    float _285 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _281);
    float _287 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _283);
    float _289 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _285);
    float _291 = _287 * _219;
    float _293 = _289 * _221;
    bool _295 = !_261;
    float _313;
    if (!_295)
    {
        float _297 = in.m_58.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _305 = _303 * _299;
        float _307 = floor(_305);
        float _309 = -_307;
        float _311 = _305 + _309;
        _313 = _311;
        _315 = true;
    }
    else
    {
        _313 = _173;
    }
    _315 = false;
    float _317 = _313;
    float _319 = in.m_46.x;
    float _321 = in.m_46.y;
    float _323 = in.m_46.z;
    float _325 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _327 = int(_325);
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _339 = _291 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _351 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _353 = in.m_66.x;
    float _355 = in.m_66.y;
    float _357 = in.m_66.z;
    float _359 = in.m_66.w;
    float _361 = in.m_58.x;
    float _363 = in.m_58.y;
    float _365 = float(_327);
    float _367 = in.m_58.z;
    float _369 = 1.0 / _365;
    float _371 = _321 * _331;
    float _373 = _321 * _343;
    float _375 = fma(_319, _329, _371);
    float _377 = _321 * _355;
    float _379 = fma(_319, _341, _373);
    float _381 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _383 = log2(_381);
    float _385 = fma(_323, _333, _375);
    float _387 = _361 * 2.0;
    float _389 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _391 = _363 * 2.0;
    float _393 = fma(_319, _353, _377);
    float _395 = fma(_323, _345, _379);
    float _397 = fma(_389, -2.0, _337);
    float _399 = floor(_387);
    float _401 = _367 * 2.0;
    float _403 = fma(_323, _357, _393);
    float _405 = _363 + _367;
    float _407 = -_349;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[77].x, _407);
    float _411 = _363 + _361;
    float _413 = _395 + _347;
    float _415 = _405 + (-1.0);
    float _417 = floor(_401);
    float _419 = _383 * _121;
    float _421 = _411 + (-1.0);
    float _423 = _385 + _335;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _427 = _413 + _425;
    float _429 = exp2(_419);
    bool _431 = _399 > 0.0;
    float _433 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _435 = _399 >= 0.0;
    bool _437 = isnan(_399);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _447 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _449 = _403 + _359;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _461 = _459 != 0;
    float _463 = floor(_391);
    int _465 = _443 ? 0 : 1;
    float _467 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[78].z, _445);
    bool _469 = _417 > 0.0;
    float _471 = _427 * _427;
    bool _473 = !_453;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _467);
    bool _479 = _417 >= 0.0;
    bool _481 = isnan(_417);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -_429;
    float _491 = _489 + 1.0;
    bool _493 = !_457;
    int _495 = _493 ? 0 : 1;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _499 = int(_497);
    bool _501 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _509 = _505 || _507;
    float _511 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _513 = _423 + _511;
    int _515 = _487 ? 0 : 1;
    float _517 = _369 * _121;
    float _519 = -_121;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _409);
    bool _523 = _463 > 0.0;
    float _525 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _397);
    bool _527 = _463 >= 0.0;
    bool _529 = isnan(_463);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = !_461;
    int _539 = _537 ? 0 : 1;
    int _541 = ~_515;
    int _543 = _541 + 1;
    int _545 = _543 + 1;
    float _547 = _509 ? _491 : 0.0;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _553 = _551 != 0;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _561 = _559 != 0;
    int _563 = _545;
    if (!_469)
    {
        int _565 = ~_515;
        int _567 = _565 + 1;
        _563 = _567;
    }
    int _569 = _563;
    float _571 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].w, _549);
    bool _573 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _575 = isnan(1.0);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _581 = _577 || _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _585 = 1.0 + _583;
    float _587 = in.m_68.x;
    float _589 = in.m_68.y;
    float _591 = in.m_68.z;
    float _593 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _595 = _449 + _593;
    bool _597 = !_553;
    int _599 = _597 ? 0 : 1;
    float _601 = 1.0 / _585;
    bool _603 = !_557;
    int _605 = _603 ? 0 : 1;
    float _607 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    int _609 = abs(_599);
    float _611 = float(_499);
    int _613 = abs(_605);
    float _615 = fma(_513, _513, _471);
    float _617 = _611 * _121;
    int _619 = ~_465;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = fma(_595, _595, _615);
    float _627 = float(_609);
    float _629 = float(_569);
    float _631 = sqrt(_625);
    int _633 = _623;
    if (_581)
    {
        float _635 = _547 * _601;
        _131 = _635;
    }
    float _637 = _131;
    if (!_431)
    {
        int _639 = ~_465;
        int _641 = _639 + 1;
        _633 = _641;
    }
    int _643 = _633;
    float _645 = _627 * _629;
    int _647 = _535 ? 0 : 1;
    float _649 = _339 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _651 = float(_643);
    float _653 = rsqrt(_625);
    float _655 = float(_613);
    float _657 = _645 * (-2.0);
    int _659 = ~_647;
    int _661 = _659 + 1;
    int _663 = _661 + 1;
    int _665 = _663;
    if (!_523)
    {
        int _667 = ~_647;
        int _669 = _667 + 1;
        _665 = _669;
    }
    int _671 = _665;
    float _673 = _655 * _651;
    float _675 = _361 + (-0.5);
    float _677 = fma(_657, _587, _587);
    float _679 = _631 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _681 = _673 * (-2.0);
    bool _683 = !_561;
    int _685 = _683 ? 0 : 1;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].x, _677);
    float _689 = fma(_447, _657, _447);
    float _691 = precise::min(_649, _679);
    float _693 = fma(_681, _589, _589);
    int _695 = abs(_685);
    float _697 = _363 + (-0.5);
    float _699 = fma(_433, _681, _433);
    float _701 = _653 * _691;
    float _703 = float(_671);
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[196].y, _693);
    float _707 = float(_695);
    float _709 = _427 * _701;
    float _711 = _513 * _701;
    float _713 = fma(_689, _637, _687);
    float _715 = fma(_699, _637, _705);
    float _717 = -_709;
    float _719 = _427 + _717;
    float _721 = -_711;
    float _723 = _513 + _721;
    float _725 = _707 * _703;
    float _727 = _367 + _361;
    float _729 = _719 * _719;
    float _731 = _713 * 0.15915493667125701904296875;
    float _733 = _727 + (-1.0);
    float _735 = fma(_723, _723, _729);
    float _737 = _595 * _701;
    float _739 = _725 * (-2.0);
    float _741 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _743 = _367 + (-0.5);
    float _745 = -_737;
    float _747 = _595 + _745;
    float _749 = fma(_739, _591, _591);
    float _751 = fma(_741, _739, _741);
    float _753 = _715 * 0.15915493667125701904296875;
    float _755 = fma(_747, _747, _735);
    float _757 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _749);
    float _759 = _731 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_751, _637, _757);
    float _765 = _763 * 0.15915493667125701904296875;
    float _767 = sqrt(_755);
    float _769 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _771 = _753 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _777 = _753 * 6.283185482025146484375;
    float _779 = cos(_777);
    float _781 = _653 * _767;
    float _783 = _351 * _781;
    float _785 = _339 * _781;
    float _787 = _731 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _761 * _773;
    float _793 = _783 * _769;
    float _795 = _785 * _775;
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _761 * _779;
    float _803 = _765 * 6.283185482025146484375;
    float _805 = sin(_803);
    float _807 = _789 * _773;
    float _809 = _789 * _779;
    float _811 = _761 * _799;
    float _813 = _789 * _799;
    float _815 = _779 * _799;
    float _817 = _773 * _799;
    float _819 = _811 * _793;
    float _821 = _781 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _823 = _821 * 0.5;
    float _825 = fma(_805, _801, _807);
    float _827 = -_809;
    float _829 = fma(_805, _791, _827);
    float _831 = -_793;
    float _833 = _805 * _831;
    float _835 = -_791;
    float _837 = fma(_805, _809, _835);
    float _839 = fma(_825, _795, _819);
    float _841 = _813 * _793;
    float _843 = fma(_815, _795, _833);
    float _845 = fma(_805, _807, _801);
    float _847 = fma(_829, _823, _839);
    float _849 = fma(_837, _795, _841);
    float _851 = fma(_817, _823, _843);
    float _853 = _847 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_845, _823, _849);
    float _857 = _847 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _857);
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _859);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _861);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _863);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _865);
    float _873 = _867 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _875 = _869 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _877 = _871 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _879 = _449 + _873;
    float _881 = _423 + _875;
    float _883 = _413 + _877;
    float _885 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _887 = _879 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _891 = _881 + _889;
    float _893 = _887 * _887;
    float _895 = precise::min(_883, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _897 = fma(_891, _891, _893);
    float _899 = sqrt(_897);
    bool _901 = _899 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _903 = _893;
    float _905 = _855;
    float _907 = _881;
    float _909 = _879;
    float _911 = _897;
    if (!_901)
    {
        _903 = _881;
    }
    float _913 = _903;
    float _915 = _913;
    if (!_901)
    {
        _905 = _879;
    }
    float _917 = _905;
    float _919 = _917;
    if (!_901)
    {
        _907 = _895;
    }
    float _921 = _907;
    bool _923 = !_901;
    float _925 = _921;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _899 + _929;
        float _933 = _895 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = _931 * _927;
        float _937 = rsqrt(_897);
        float _939 = _935 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _937 * _951;
        float _957 = fma(_895, _943, _953);
        float _959 = fma(_891, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_887, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _915 = _959;
        _919 = _961;
        _909 = _939;
    }
    float _963 = _925;
    float _965 = _915;
    float _967 = _919;
    float _969 = _909;
    float _971 = -_709;
    float _973 = _971 + _963;
    float _975 = -_711;
    float _977 = _975 + _965;
    float _979 = -_737;
    float _981 = _979 + _967;
    float _983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _985 = _973 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _989 = _977 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _993 = _981 + _991;
    float _995 = _985 * _985;
    float _997 = -_737;
    float _999 = _449 + _997;
    float _1001 = _973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1003 = fma(_989, _989, _995);
    float _1005 = fma(_993, _993, _1003);
    float _1007 = rsqrt(_1005);
    float _1009 = sqrt(_1005);
    float _1011 = _1007 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1013 = _989 * _1011;
    float _1015 = _993 * _1011;
    float _1017 = _1013 * _1013;
    float _1019 = _1015 * _1015;
    float _1021 = _1017 + _1019;
    float _1023 = sqrt(_1021);
    bool _1025 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1023 + _1027;
    float _1031 = _969;
    float _1033 = _1029;
    float _1035 = _1011;
    float _1037 = _1013;
    float _1039 = _1015;
    float _1041 = _1017;
    float _1043 = _1019;
    if (_1025)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1045;
    }
    float _1047 = _1031;
    if (_1025)
    {
        float _1049 = _1029 * _1047;
        _1033 = _1049;
    }
    float _1051 = _1033;
    if (_1025)
    {
        float _1053 = _1051 * 0.15915493667125701904296875;
        _911 = _1053;
    }
    float _1055 = _911;
    float _1057 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1059 = _895;
    if (_1025)
    {
        float _1061 = _1055 * 6.283185482025146484375;
        float _1063 = sin(_1061);
        _1059 = _1063;
    }
    float _1065 = _1059;
    float _1067 = precise::max(0.0, _1057);
    float _1069 = _1051;
    float _1071 = _1067;
    if (_1025)
    {
        float _1073 = _1055 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        _1069 = _1075;
    }
    float _1077 = _1069;
    float _1079 = -_1011;
    float _1081 = -_1067;
    float _1083 = fma(_985, _1079, _1081);
    float _1085 = -_711;
    float _1087 = _423 + _1085;
    if (_1025)
    {
        float _1089 = _1083 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1071 = _1089;
    }
    float _1091 = _1071;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1095 = _1057;
    float _1097 = _1091;
    if (_1025)
    {
        float _1099 = rsqrt(_1021);
        _1095 = _1099;
    }
    float _1101 = _1095;
    float _1103 = _1065;
    if (_1025)
    {
        float _1105 = fma(_1065, _1091, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1097 = _1105;
    }
    float _1107 = _1097;
    if (_1025)
    {
        float _1109 = _1077 + (-1.0);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1115 = fma(_1009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1113);
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    float _1119 = _1111;
    if (_1025)
    {
        float _1121 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1121;
    }
    float _1123 = _1119;
    float _1125 = _1101;
    if (_1025)
    {
        float _1127 = _1101 * _1107;
        _1035 = _1127;
    }
    float _1129 = _1035;
    if (!_1025)
    {
        _1125 = _1083;
    }
    float _1131 = _1125;
    float _1133 = _1131;
    if (_1025)
    {
        float _1135 = fma(_1083, _1077, _1123);
        _1133 = _1135;
    }
    float _1137 = _1133;
    float _1139 = _973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1025)
    {
        float _1141 = _1013 * _1129;
        _1037 = _1141;
    }
    float _1143 = _1037;
    if (_1025)
    {
        float _1145 = _1015 * _1129;
        _1039 = _1145;
    }
    float _1147 = _1039;
    float _1149 = _973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1151 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1139);
    if (_1025)
    {
        float _1153 = _1143 * _1143;
        _1041 = _1153;
    }
    float _1155 = _1041;
    if (_1025)
    {
        float _1157 = _1147 * _1147;
        _1043 = _1157;
    }
    float _1159 = _1043;
    float _1161 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1149);
    float _1163 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1151);
    float _1165 = fma(_1137, _1137, _1155);
    float _1167 = -_1117;
    float _1169 = _1167 + 1.0;
    float _1171 = fma(_999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1175 = _1165 + _1159;
    float _1177 = _973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1179 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1161);
    float _1181 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1183 = abs(_1169);
    float _1185 = log2(_1183);
    float _1187 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1177);
    float _1189 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1191 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1001);
    float _1193 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1195 = _1189 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1199 = rsqrt(_1175);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1203 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1205 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1207 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1203);
    float _1209 = -_1195;
    float _1211 = fma(_1209, _1173, 1.0);
    float _1213 = floor(_1093);
    float _1215 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1217);
    float _1221 = _1199 * _1143;
    float _1223 = _1199 * _1137;
    float _1225 = floor(_1171);
    float _1227 = _1199 * _1147;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1233 = -_1229;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1233);
    float _1237 = log2(_1211);
    float _1239 = -_1227;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1235);
    float _1243 = fma(_1241, -0.5, 0.5);
    float _1245 = fma(_1241, 0.5, 0.5);
    float _1247 = exp2(_1215);
    float _1249 = -_1213;
    float _1251 = _1093 + _1249;
    float _1253 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1255 = -_1225;
    float _1257 = _1171 + _1255;
    float _1259 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1231);
    float _1261 = fma(_1245, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1263 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1253);
    float _1265 = _1223 + 1.0;
    float _1267 = 1.0 / _1219;
    float _1269 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1259);
    float _1271 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1263);
    float _1273 = fma(_1245, _1261, -0.212114393711090087890625);
    float _1275 = _1237 * 0.693147182464599609375;
    float _1277 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1279 = sqrt(_1243);
    float _1281 = -_1223;
    float _1283 = fma(_1247, _1265, _1281);
    float _1285 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1269);
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1289 = _1285 * _1267;
    float _1291 = fma(_1245, _1273, 1.570728778839111328125);
    float _1293 = _1277 * _1267;
    float _1295 = fma(_1283, 0.5, 0.5);
    float _1297 = fma(_1293, 0.5, 0.5);
    float _1299 = _1279 * 0.636619746685028076171875;
    float _1301 = fma(_1289, -0.5, 0.5);
    float _1303 = -_1291;
    float _1305 = fma(_1299, _1303, 1.0);
    float2 _4564 = float2(_1251, _1257);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4564, float2(0.0), isnan(_4564)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4564, float2(0.0), isnan(_4564)), level(0.0)).x;
    float3 _4575 = float3(_1297, _1301, _1287);
    float _1309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4575, float3(0.0), isnan(_4575)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4575, float3(0.0), isnan(_4575)), level(0.0)).x;
    float3 _4586 = float3(_1297, _1301, _1287);
    float4 _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4586, float3(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4586, float3(0.0), isnan(_4586)), level(0.0)).xyzw;
    float _1314 = _1312.x;
    float _1316 = _1312.y;
    float _1318 = _1312.z;
    float _1320 = _1312.w;
    float2 _4602 = float2(_1305, _1295);
    float3 _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4602, float2(0.0), isnan(_4602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4602, float2(0.0), isnan(_4602)), level(0.0)).xyz;
    float _1326 = _1324.x;
    float _1328 = _1324.y;
    float _1330 = _1324.z;
    float _1332 = float(uint(_499));
    float _1334 = trunc(_517);
    int _1336 = int(_1334);
    int _1338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1340 = _1338 != 0;
    float _1342 = -_607;
    float _1344 = _1342 + 1.0;
    bool _1346 = _361 > 0.5;
    float _1348 = -_477;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_499;
    int _1354 = _1352 + 1;
    out.m_70.w = _691;
    int _1356 = abs(_475);
    float _1358 = 1.0 / _1332;
    out.m_72.x = _785;
    float _1360 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1364 = _1362 != 0;
    float _1366 = _811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = float(uint(_1336));
    bool _1372 = !_1364;
    float _1374 = _1372 ? 7.345489978790283203125 : 1.0;
    float _1376 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = float(_1336);
    int _1380 = as_type<int>(_1358) + (-2);
    float _1382 = _1374 * _361;
    float _1384 = as_type<float>(_1380) * _1370;
    float _1386 = floor(_1382);
    float _1388 = trunc(_1384);
    float _1390 = precise::max(_1388, 0.0);
    uint _1393 = uint(_1390);
    float _1395 = -_1386;
    float _1397 = _1382 + _1395;
    float _1399 = _1397 * _611;
    int _1401 = _1354 * int(_1393);
    int _1403 = _1401 + _1336;
    float _1405 = trunc(_1399);
    int _1407 = int(_1405);
    float _1409 = float(uint(_1403));
    float _1411 = as_type<float>(_1380) * _1409;
    float _1413 = trunc(_1411);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    int _1419 = int(_1393) + int(_1417);
    bool _1421 = _1378 >= _611;
    bool _1423 = isnan(_1378);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan(_611);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    int _1433 = _1354 * _1419;
    int _1435 = _1433 + _1336;
    float _1437 = trunc(_1431);
    int _1439 = int(_1437);
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1443 = _1441 != 0;
    bool _1445 = uint(_1435) >= uint(_499);
    bool _1447 = !_1443;
    int _1449 = _1447 ? 0 : 1;
    bool _1451 = !_1445;
    int _1453 = _1451 ? 0 : (-1);
    bool _1455 = _499 == 0;
    int _1457 = ~_1419;
    int _1459 = _1457 + _1453;
    int _1461 = _1459 + 1;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1465 = _1463 != 0;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1469 = _1467 != 0;
    int _1471 = _499 * _1461;
    int _1473 = _1471 + _1336;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1477 = _1475 != 0;
    int _1479 = ~_1439;
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    bool _1485 = !_1455;
    int _1487 = _1485 ? _1473 : (-1);
    int _1489 = abs(_1449);
    int _1491 = _1487 * _1483;
    int _1493 = abs(_495);
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _617 * _169;
    bool _1501 = _363 > 0.5;
    int _1503 = _1407 * _1489;
    int _1505 = _1503 + _1336;
    int _1507 = _499 + (-1);
    float _1509 = trunc(_1499);
    int _1511 = int(_1509);
    int _1513 = _1439 * _1507;
    int _1515 = _1513 + _1491;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1519 = _1517 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1521 = 1.0 / _1497;
    int _1523 = abs(_539);
    int _1525 = _1515 * _1493;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1529 = !_1340;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1535 = _1511 * _1356;
    int _1537 = _1535 + _1525;
    int _1539 = abs(_1531);
    float _1541 = 1.0 / _1519;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1545 = _1505 * _1523;
    int _1547 = _1545 + _1537;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1555 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1565 = _1551 * _1521;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _317 + _1567;
    int _1571 = _1407 * _1539;
    int _1573 = _1571 + _1547;
    float _1575 = float(uint(_1505));
    out.m_74.x = _1555;
    out.m_74.y = _1557;
    out.m_74.z = _1559;
    out.m_74.w = _1553;
    float _1577 = _1563 * _1541;
    bool _1579 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1581 = isnan(_317);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    bool _1591 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1593 = isnan(_317);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1565, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1605 = float(uint(_1573));
    float _1607 = as_type<float>(_1380) * _1575;
    bool _1609 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1611 = isnan(_317);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1601;
    float _1623 = _1621 + 1.0;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1627 = _317 + _1625;
    float _1629 = as_type<float>(_1380) * _1605;
    float _1631 = -_1589;
    float _1633 = _1631 + 1.0;
    float _1635 = trunc(_1607);
    float _1637 = precise::max(_1635, 0.0);
    uint _1639 = uint(_1637);
    float _1641 = _1619 * _1623;
    float _1643 = fma(_1577, _1627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1645 = -_1619;
    float _1647 = _1645 + 1.0;
    int _1649 = ~_499;
    int _1651 = _1649 + 1;
    float _1653 = _1603 * _1641;
    float _1655 = -_189;
    int _1657 = _1501 ? as_type<int>(_1655) : as_type<int>(_189);
    float _1659 = _1601 * _1633;
    float _1661 = trunc(_1629);
    float _1663 = precise::max(_1661, 0.0);
    uint _1665 = uint(_1663);
    float _1667 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1653);
    bool _1669 = !_1477;
    float _1671 = _1669 ? _189 : as_type<float>(_1657);
    float _1673 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1675 = -_185;
    int _1677 = _1346 ? as_type<int>(_1675) : as_type<int>(_185);
    float _1679 = fma(_1643, _1659, _1667);
    int _1681 = _1651 * int(_1639);
    int _1683 = _1681 + _1505;
    int _1685 = ~_499;
    int _1687 = _1685 + 1;
    float _1689 = -_709;
    float _1691 = _413 + _1689;
    float _1693 = _1671 + (-0.5);
    bool _1695 = !_1469;
    float _1697 = _1695 ? _185 : as_type<float>(_1677);
    float _1699 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1679);
    float _1701 = float(uint(_1683));
    float _1703 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1705 = _1687 * int(_1665);
    int _1707 = _1705 + _1573;
    float _1709 = -_1693;
    float _1711 = -_525;
    float _1713 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1711);
    float _1715 = _1697 + 0.5;
    float _1717 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1703);
    float _1719 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1721 = float(uint(_1707));
    float _1723 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[80].x, _521);
    float _1725 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1717);
    float _1727 = fma(_1671, _1344, _1713);
    float _1729 = as_type<float>(_1380) * _1701;
    float _1731 = as_type<float>(_1380) * _1721;
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1735 = _1691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1737 = -_1350;
    float _1739 = fma(_1697, _1737, _1723);
    float _1741 = 1.0 / _1733;
    float _1743 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1735);
    float _1745 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_76.x = _1739;
    out.m_76.y = _1727;
    float _1747 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1743);
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1751 = trunc(_1731);
    float _1753 = precise::max(_1751, 0.0);
    uint _1755 = uint(_1753);
    int _1757 = ~_499;
    int _1759 = _1757 + 1;
    float _1761 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1765 = _1745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1769 = _1761 + _1733;
    float _1771 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_78.x = _1087;
    out.m_78.y = _1691;
    out.m_78.z = _999;
    float _1773 = trunc(_1729);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = _1769 * _1741;
    float _1781 = _1779 * 0.5;
    out.m_80.x = _1771;
    out.m_80.y = _1765;
    out.m_80.z = _1767;
    out.m_80.w = _1719;
    int _1783 = int(_1665) + int(_1755);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1787 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1785);
    int _1789 = _1759 * _1783;
    int _1791 = _1789 + _1573;
    float _1793 = 1.0 / _1787;
    int _1795 = int(_1639) + int(_1777);
    float _1797 = _811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1799 = uint(_1791) >= uint(_499);
    float _1801 = -_805;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1805 = _811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1807 = -_805;
    float _1809 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1797);
    bool _1811 = !_1799;
    int _1813 = _1811 ? 0 : (-1);
    float _1815 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1803);
    float _1817 = -_805;
    float _1819 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1805);
    float _1821 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1809);
    int _1823 = ~_1783;
    int _1825 = _1823 + _1813;
    int _1827 = _1825 + 1;
    float _1829 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1831 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1819);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1793 * _1833;
    int _1837 = _499 * _1827;
    int _1839 = _1837 + _1573;
    float _1841 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1829);
    float _1843 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1845 = abs(_1835);
    float _1847 = log2(_1845);
    float _1849 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1851 = !_1455;
    int _1853 = _1851 ? _1839 : (-1);
    int _1855 = _1759 * _1795;
    int _1857 = _1855 + _1505;
    float _1859 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1843);
    float _1861 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1849);
    int _1863 = _1853 >> 31;
    float _1865 = _829 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1867 = uint(_1857) >= uint(_499);
    float _1869 = _1673 * _1815;
    int _1871 = _1863 & 3;
    float _1873 = _829 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1875 = _829 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1877 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1865);
    int _1879 = _1853 + _1871;
    float _1881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1873);
    float _1883 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1875);
    float _1885 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1887 = _1879 >> 2;
    float _1889 = _1673 * _1821;
    float _1891 = _1673 * _1831;
    float _1893 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    int _1895 = _1887 << 4;
    int _1897 = _1895 + 368;
    float _1899 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1901 = exp2(_1885);
    float _1903 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1859);
    uint _1905 = uint(int(uint(_1897) >> uint(2)));
    uint _1907 = uint(int(uint(int(_1905)) >> uint(2)));
    int _1909 = int(_1905) & 3;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[int(_1907)][_1909];
    int _1913 = int(_1905) + 1;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    int _1917 = _1913 & 3;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[int(_1915)][_1917];
    float _1921 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1877);
    float _1923 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1881);
    float _1925 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1861);
    float _1927 = fma(_1899, _1893, _1889);
    bool _1929 = !_1867;
    int _1931 = _1929 ? 0 : (-1);
    float _1933 = fma(_1899, _1903, _1869);
    int _1935 = _1853 & 3;
    bool _1937 = _1935 != 0;
    int _1939 = _1897 + 8;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
    int _1945 = int(_1941) & 3;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[int(_1943)][_1945];
    int _1949 = int(_1941) + 1;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    int _1953 = _1949 & 3;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[int(_1951)][_1953];
    int _1957 = ~_1795;
    int _1959 = _1957 + _1931;
    int _1961 = _1959 + 1;
    float _1963 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1883);
    bool _1965 = uint(_1935) > 1u;
    float _1967 = fma(_1899, _1925, _1891);
    int _1969 = _499 * _1961;
    int _1971 = _1969 + _1505;
    int _1973 = _1853 & 3;
    bool _1975 = _1973 != 0;
    bool _1977 = _1935 != 3;
    float _1979 = fma(_1901, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1981 = precise::clamp(_1979, 0.0, 1.0);
    int _1983 = _1975 ? 0 : 1;
    bool _1985 = uint(_1935) >= 2u;
    float _1987 = fma(_1981, -2.0, 3.0);
    float _1989 = _1981 * _1981;
    int _1991 = ~_1983;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = _1985 ? 0 : 1;
    float _1999 = _1989 * _1987;
    int _2001 = _1995;
    float _2003 = _1219;
    float _2005 = _1285;
    if (!_1965)
    {
        int _2007 = ~_1983;
        int _2009 = _2007 + 1;
        _2001 = _2009;
    }
    int _2011 = _2001;
    int _2013 = ~_1997;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    bool _2019 = !_1937;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = _1935 != 3;
    float _2025 = -_1999;
    float _2027 = _2025 + 1.0;
    int _2029 = abs(_2011);
    int _2031 = _2017;
    if (_1977)
    {
        int _2033 = ~_1997;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = fma(_2027, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1999);
    int _2041 = abs(_2021);
    bool _2043 = !_2023;
    int _2045 = _2043 ? 0 : (-1);
    int _2047 = abs(_2037);
    int _2049 = ~_2029;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_2041;
    int _2057 = _2055 + 1;
    int _2059 = _2057 + 1;
    int _2061 = abs(_2045);
    int _2063 = _2053 * as_type<int>(_1919);
    bool _2065 = !_1465;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = _2059 * as_type<int>(_1911);
    int _2071 = _2069 + _2063;
    int _2073 = ~_2047;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = abs(_2067);
    int _2081 = _2077 * as_type<int>(_1947);
    int _2083 = _2081 + _2071;
    float _2085 = in.m_82.x;
    int _2087 = ~_2061;
    int _2089 = _2087 + 1;
    int _2091 = _2089 + 1;
    float _2093 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2103 = _2099 || _2101;
    float _2105 = _1219 * 0.5;
    int _2107 = ~_2079;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _2091 * as_type<int>(_1955);
    int _2115 = _2113 + _2083;
    bool _2117 = !_1455;
    int _2119 = _2117 ? _1971 : (-1);
    float _2121 = exp2(_2093);
    bool _2123 = _1835 <= 8000.0;
    bool _2125 = isnan(_1835);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(8000.0);
    bool _2131 = _2127 || _2129;
    float _2133 = float(_2131);
    int _2135 = _2115 * _2111;
    float _2137 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _2139 = _1277 + _1219;
    int _2141 = _2119 * _2079;
    int _2143 = _2141 + _2135;
    float _2145 = _2137 + _1219;
    float _2147 = fma(_1285, -0.5, _2105);
    float _2149 = _2133 * _2039;
    float _2151 = as_type<float>(_2059);
    float _2153 = _2105;
    if (_2103)
    {
        _2151 = 1.0;
    }
    float _2155 = _2151;
    float _2157 = _2145 * 0.5;
    float _2159 = _2139 * 0.5;
    float _2161 = float(_2143);
    float _2163 = _2155;
    float _2165 = _2159;
    if (_2103)
    {
        _2153 = 1.0;
    }
    float _2167 = _2153;
    float _2169 = _2167;
    if (!_2103)
    {
        float _2171 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2173 = _2171 * 0.15915493667125701904296875;
        float _2175 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2177 = _2173 * 6.283185482025146484375;
        float _2179 = cos(_2177);
        float _2181 = _2175 * 0.15915493667125701904296875;
        float _2183 = _2173 * 6.283185482025146484375;
        float _2185 = sin(_2183);
        float _2187 = 1.0 / _2179;
        float _2189 = _2181 * 6.283185482025146484375;
        float _2191 = cos(_2189);
        float _2193 = _2185 * _2187;
        float _2195 = _2181 * 6.283185482025146484375;
        float _2197 = sin(_2195);
        float _2199 = _2191 * _2193;
        float _2201 = 1.0 / _2199;
        float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2205 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2203;
        float _2207 = 1.0 / _2205;
        float _2209 = _2197 * _2201;
        float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2213 = fma(_1835, _2209, _2211);
        float _2215 = _2213 * _2207;
        float _2217 = precise::clamp(_2215, 0.0, 1.0);
        _2169 = _2217;
    }
    float _2219 = _2169;
    if (!_2103)
    {
        float _2221 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2223 = _2221 * 0.15915493667125701904296875;
        float _2225 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2227 = _2223 * 6.283185482025146484375;
        float _2229 = cos(_2227);
        float _2231 = _2225 * 0.15915493667125701904296875;
        float _2233 = _2223 * 6.283185482025146484375;
        float _2235 = sin(_2233);
        float _2237 = 1.0 / _2229;
        float _2239 = _2231 * 6.283185482025146484375;
        float _2241 = cos(_2239);
        float _2243 = _2235 * _2237;
        float _2245 = _2231 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        float _2249 = _2241 * _2243;
        float _2251 = 1.0 / _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2255 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2253;
        float _2257 = 1.0 / _2255;
        float _2259 = _2247 * _2251;
        float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2263 = fma(_1835, _2259, _2261);
        float _2265 = _2263 * _2257;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = -_2267;
        float _2271 = _2269 + 1.0;
        _2163 = _2271;
    }
    float _2273 = _2163;
    float _2275 = -_2121;
    float _2277 = _2275 + 1.0;
    out.gl_Position.x = _1277;
    out.gl_Position.y = _1285;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _1219;
    float _2279 = _1921 + _1927;
    float _2281 = _1923 + _1933;
    float _2283 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2161;
    float _2285 = _1963 + _1967;
    float _2287 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2289 = _2283 * _1309;
    float _2291 = -_1307;
    float _2293 = _2291 + 1.0;
    out.m_86.x = _977;
    out.m_86.y = _973;
    out.m_86.z = _981;
    float _2295 = _1330 * _2289;
    float _2297 = _2293 * _2287;
    float _2299 = precise::clamp(_2297, 0.0, 1.0);
    out.m_88.x = _2279;
    out.m_88.y = _2281;
    out.m_88.z = _2285;
    float _2301 = _1320 * _2289;
    float _2303 = -_2283;
    float _2305 = _2303 + 1.0;
    float _2307 = fma(_1320, _2295, _1318);
    bool _2309 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2311 = isnan(_1009);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2317 = _2313 || _2315;
    float _2319 = fma(_1326, _2301, _1314);
    float _2321 = fma(_1328, _2301, _1316);
    float _2323 = _1320 * _2305;
    float _2325 = -_2299;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _2159;
    out.m_90.y = _2147;
    out.m_90.z = _2157;
    out.m_90.w = _1219;
    float _2329 = _2327 * _2085;
    out.m_92.x = _2319;
    out.m_92.y = _2321;
    out.m_92.z = _2307;
    out.m_92.w = _2323;
    float _2331 = _2329 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2333 = _2219 * _2273;
    float _2335 = _2305;
    float _2337 = _2333;
    float _2339 = _2331;
    if (!_2317)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2341 = _2003;
    float _2343 = _2341;
    float _2345 = _2341;
    if (!_2317)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2347 = _2335;
    out.m_94.x = _2331;
    float _2349 = _2347;
    float _2351 = _2347;
    if (!_2317)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2353 = _2005;
    float _2355 = _2333 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2353;
    float _2359 = _2353;
    if (!_2317)
    {
        _2165 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2361 = _2165;
    float _2363 = _2361;
    float _2365 = _2361;
    if (!_2317)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2367 = _2337;
    float _2369 = _2367;
    float _2371 = _2367;
    if (!_2317)
    {
        _2339 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2339;
    bool _2375 = !_2317;
    float _2377 = _2373;
    float _2379 = _2373;
    if (!_2375)
    {
        bool _2381 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2383 = isnan(_1009);
        bool _2385 = _2381 || _2383;
        bool _2387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2389 = _2385 || _2387;
        if (!_2389)
        {
            float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2393 = _1009 + _2391;
            float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2397 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2395;
            float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2403 = 1.0 / _2397;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2413 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2421 = _2393 * _2403;
            float _2423 = precise::clamp(_2421, 0.0, 1.0);
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2429 = fma(_2423, _2401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2431 = fma(_2423, _2427, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2433 = fma(_2423, _2407, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2435 = fma(_2423, _2411, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2437 = fma(_2423, _2415, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2439 = fma(_2423, _2419, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2345 = _2433;
            _2379 = _2437;
            _2365 = _2429;
            _2359 = _2435;
            _2351 = _2431;
            _2371 = _2439;
            _2441 = true;
        }
        else
        {
            bool _2443 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2445 = isnan(_1009);
            bool _2447 = _2443 || _2445;
            bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2451 = _2447 || _2449;
            if (!_2451)
            {
                _2363 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2453 = _2363;
            _2365 = _2453;
            if (!_2451)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2455 = _2343;
            _2345 = _2455;
            if (!_2451)
            {
                _2349 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2457 = _2349;
            _2351 = _2457;
            if (!_2451)
            {
                _2357 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2459 = _2357;
            _2359 = _2459;
            if (!_2451)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2461 = _2377;
            _2379 = _2461;
            if (!_2451)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2463 = _2369;
            bool _2465 = !_2451;
            _2371 = _2463;
            if (!_2465)
            {
                bool _2467 = _1009 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2469 = isnan(_1009);
                bool _2471 = _2467 || _2469;
                bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2475 = _2471 || _2473;
                if (!_2475)
                {
                    float _2477 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2479 = _1009 + _2477;
                    float _2481 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2483 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2481;
                    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2489 = 1.0 / _2483;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2507 = _2479 * _2489;
                    float _2509 = precise::clamp(_2507, 0.0, 1.0);
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2515 = fma(_2509, _2487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2517 = fma(_2509, _2513, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2519 = fma(_2509, _2493, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2521 = fma(_2509, _2497, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2523 = fma(_2509, _2501, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2525 = fma(_2509, _2505, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2345 = _2519;
                    _2379 = _2523;
                    _2365 = _2515;
                    _2359 = _2521;
                    _2351 = _2517;
                    _2371 = _2525;
                    _2441 = true;
                }
                else
                {
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2365 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2359 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2351 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2441 = false;
    float _2527 = _2345;
    float _2529 = _2379;
    float _2531 = _2365;
    float _2533 = _2359;
    float _2535 = _2351;
    float _2537 = _2371;
    float _2539 = fma(_2281, -0.5, 0.5);
    float _2541 = precise::clamp(_2539, 0.0, 1.0);
    float _2543 = -_2527;
    float _2545 = _2543 + _2529;
    float _2547 = _2355 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2549 = -_2531;
    float _2551 = _2549 + _2533;
    float _2553 = fma(_2541, _2545, _2527);
    out.m_96.x = 0.0;
    float _2555 = -_2535;
    float _2557 = _2555 + _2537;
    float _2559 = fma(_2541, _2551, _2531);
    float _2561 = _2553 * 0.586610972881317138671875;
    out.m_53.x = _2547;
    bool _2563 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2565 = fma(_2541, _2557, _2535);
    float _2567 = fma(_2559, 0.298911988735198974609375, _2561);
    bool _2569 = _2219 > 0.0;
    bool _2571 = isnan(_2219);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan(0.0);
    bool _2577 = _2573 || _2575;
    float _2579 = fma(_2565, 0.114477999508380889892578125, _2567);
    bool _2581 = _2273 <= 0.0;
    bool _2583 = !_2577;
    bool _2585 = _2581 || _2583;
    float _2587 = -_2579;
    float _2589 = _2559 + _2587;
    float _2591 = -_2579;
    float _2593 = _2553 + _2591;
    float _2595 = -_2579;
    float _2597 = _2565 + _2595;
    float _2599 = fma(_2589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2601 = fma(_2593, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    float _2603 = fma(_2597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2579);
    bool _2605 = !_2563;
    if (!_2605)
    {
        float _2607 = -_973;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2611 = -_977;
        float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2615 = -_981;
        float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2619 = _2609 * _2609;
        float _2621 = fma(_2613, _2613, _2619);
        float _2623 = fma(_2617, _2617, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = rsqrt(_2623);
        float _2629 = -_2625;
        float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = _2613 * _2627;
        float _2639 = _2609 * _2627;
        float _2641 = abs(_2635);
        float _2643 = log2(_2641);
        float _2645 = _2617 * _2627;
        float _2647 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2649 = _2281 * _2639;
        float _2651 = -_2639;
        float _2653 = -_2647;
        float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2653);
        float _2657 = fma(_2279, _2637, _2649);
        float _2659 = -_2645;
        float _2661 = fma(_2659, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2655);
        float _2663 = fma(_2285, _2645, _2657);
        float _2665 = precise::clamp(_2663, 0.0, 1.0);
        float _2667 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2669 = _2661 + _2667;
        float _2671 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2673 = _2669 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2675 = precise::clamp(_2673, 0.0, 1.0);
        float _2677 = exp2(_2671);
        float _2679 = _2677 * _2675;
        float _2681 = _2665 * _2679;
        float _2683 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2687 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2683;
        out.m_96.y = _2685;
        out.m_96.z = _2687;
    }
    out.m_70.x = _2599;
    out.m_70.y = _2601;
    out.m_70.z = _2603;
    if (!_2585)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2689 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2689;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

