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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _583 = false;
    bool _473 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3491 = as_type<float>(_143);
        out.gl_Position.z = _3491;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    int _197 = int(_191);
    int _199 = _195 ? 2 : 0;
    int _201 = _197 | _199;
    int _203 = _159 ? 4 : 0;
    int _205 = _201 | _203;
    int _207 = false ? 8 : 0;
    int _209 = _205 | _207;
    int _211 = false ? 16 : 0;
    int _213 = _209 | _211;
    int _215 = false ? 32 : 0;
    int _217 = _213 | _215;
    int _219 = false ? 64 : 0;
    int _221 = _217 | _219;
    int _223 = _221 & 4;
    bool _225 = !_191;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_195;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_159;
    float _235 = _187;
    float _237 = 0.0;
    float _239 = as_type<float>(_223);
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
        _237 = _257;
        _239 = _259;
    }
    float _271 = _235;
    float _273 = _237;
    float _275 = _239;
    bool _277 = !_159;
    float _279 = _275;
    float _281 = _273;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _147 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _289;
        _175 = _301;
    }
    float _303 = _279;
    float _305 = _175;
    float _307 = _303;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _281 = _311;
    }
    float _313 = _281;
    float _315 = _313;
    if (!_159)
    {
        _307 = _123;
    }
    float _317 = _307;
    float _319 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _317;
    if (!_159)
    {
        float _325 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_159;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_159;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = fma(_305, _161, _319);
    float _391 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _397 = fma(_305, _163, _321);
    float _399 = fma(_387, _163, _391);
    float _401 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _161, _393);
    float _405 = fma(_387, _165, _395);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _409 = fma(_397, _149, _169);
    float _411 = -_399;
    float _413 = _397 + _411;
    float _415 = fma(_305, _165, _401);
    float _417 = fma(_389, _149, _167);
    float _419 = -_403;
    float _421 = _389 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = -_405;
    float _431 = _415 + _429;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = fma(_415, _149, _171);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    bool _447 = !_407;
    float _449 = _443;
    float _451 = _441;
    float _453 = _445;
    float _471;
    if (!_447)
    {
        float _455 = in.m_54.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_89);
        float _477 = 1.0 / _475;
        float _479 = _123 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _485 = _481 + _483;
    float _487 = in.m_52.x;
    float _489 = in.m_52.y;
    bool _491 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_481);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _503;
    bool _507 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _509 = isnan(_481);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    float _527 = 1.0 / _505;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _531 = _517 * _521;
    float _533 = -_517;
    float _535 = _533 + 1.0;
    float _537 = _485 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _545 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _547 = _543 * _531;
    float _549 = _545 * _531;
    float _551 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].x, _547);
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].y, _549);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].x, _551);
    float _557 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].y, _553);
    float _559 = _555 * _487;
    float _561 = _557 * _489;
    bool _563 = !_529;
    float _581;
    if (!_563)
    {
        float _565 = in.m_54.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_89);
        float _587 = 1.0 / _585;
        float _589 = _123 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = _627 * _649;
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = 1.0 / _615;
    float _661 = _631 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _667 = fma(_661, _595, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _665 * _659;
    float _671 = _667 * _653;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _591 + _677;
    float _681 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _671);
    float _683 = _611 * _675;
    float _685 = fma(_669, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = fma(_685, _683, _681);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _697;
    out.m_56.y = _699;
    out.m_56.z = _701;
    out.m_56.w = _703;
    bool _705 = !_651;
    float _729;
    float _731;
    float _733;
    if (!_705)
    {
        float _707 = in.m_54.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _711 = float(_89);
        float _713 = 1.0 / _711;
        float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _717 = _123 * _713;
        float _719 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _721 = _719 * _709;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _717;
        _731 = _711;
        _733 = _727;
        _735 = true;
    }
    else
    {
        float _737 = float(_89);
        float _739 = 1.0 / _737;
        float _741 = _123 * _739;
        _729 = _741;
        _731 = _737;
        _733 = _741;
    }
    _735 = false;
    float _743 = _729;
    float _745 = _731;
    float _747 = _733;
    float _749 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _751 = int(_749);
    float _753 = in.m_54.x;
    float _755 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _763 = _743 + _761;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _767 = int(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _769;
    float _773 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _785 = float(_751);
    float _787 = 1.0 / _745;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _797 = 1.0 / _785;
    float _799 = float(uint(_767));
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _805 = ~_767;
    int _807 = _805 + 1;
    float _809 = float(_767);
    bool _811 = _767 == 0;
    float _813 = 1.0 / _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    bool _819 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _821 = isnan(_743);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = _123 * _797;
    float _833 = 1.0 / _771;
    float _835 = _797;
    float _837 = _785;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_759)
    {
        float _841 = in.m_54.y;
        _835 = _841;
    }
    float _843 = _835;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    bool _849 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_747);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_829;
    float _863 = _861 + 1.0;
    bool _865 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _867 = isnan(_743);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    int _877 = as_type<int>(_813) + (-2);
    float _879 = trunc(_831);
    int _881 = int(_879);
    int _883 = ~_767;
    int _885 = _883 + 1;
    bool _887 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _889 = isnan(_743);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _777;
    float _901 = float(uint(_881));
    float _903 = 1.0 / _783;
    if (!_759)
    {
        _837 = _843;
    }
    float _905 = _837;
    float _907 = as_type<float>(_877) * _901;
    float _909 = _905;
    int _911 = as_type<int>(_843);
    if (_759)
    {
        float _913 = in.m_54.x;
        float _915 = in.m_54.y;
        _909 = _913;
        _911 = as_type<int>(_915);
    }
    float _917 = _909;
    int _919 = _911;
    float _921 = trunc(_907);
    float _923 = precise::max(_921, 0.0);
    uint _926 = uint(_923);
    float _928 = 1.0 / _791;
    float _930 = float(_881);
    bool _932 = _930 >= _809;
    bool _934 = isnan(_930);
    bool _936 = _932 || _934;
    bool _938 = isnan(_809);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    int _944 = _885 * int(_926);
    int _946 = _944 + _881;
    float _948 = trunc(_942);
    int _950 = int(_948);
    float _952 = float(uint(_946));
    bool _954 = !_759;
    float _956 = _954 ? as_type<float>(_919) : _753;
    float _958 = 1.0 / _795;
    float _960 = as_type<float>(_877) * _952;
    bool _962 = !_759;
    float _964 = _962 ? 1.2345600128173828125 : 1.0;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    float _972 = _964 * _956;
    float _974 = floor(_972);
    int _976 = int(_926) + int(_970);
    float _978 = 1.0 / _803;
    int _980 = _807 * _976;
    int _982 = _980 + _881;
    bool _984 = uint(_982) >= uint(_767);
    bool _986 = !_984;
    int _988 = _986 ? 0 : (-1);
    int _990 = ~_976;
    int _992 = _990 + _988;
    int _994 = _992 + 1;
    float _996 = -_974;
    float _998 = _972 + _996;
    int _1000 = ~_950;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _767 * _994;
    int _1008 = _1006 + _881;
    float _1010 = _809 * _998;
    float _1012 = _123 * _809;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1016 = _1014 != 0;
    bool _1018 = !_811;
    int _1020 = _1018 ? _1008 : (-1);
    float _1022 = _1012 * _787;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1030 = _1028 != 0;
    float _1032 = trunc(_1010);
    int _1034 = int(_1032);
    int _1036 = _767 + (-1);
    int _1038 = _1004 * _1020;
    bool _1040 = !_1016;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1050 = _1048 != 0;
    int _1052 = _950 * _1036;
    int _1054 = _1052 + _1038;
    bool _1056 = !_1030;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = trunc(_1022);
    int _1062 = int(_1060);
    bool _1064 = !_1026;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = abs(_1042);
    bool _1070 = !_1046;
    int _1072 = _1070 ? 0 : 1;
    int _1074 = abs(_1058);
    int _1076 = _1034 * _1068;
    int _1078 = _1076 + _881;
    int _1080 = abs(_1066);
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = _1054 * _1074;
    int _1088 = abs(_1072);
    int _1090 = abs(_1084);
    float _1092 = in.m_54.z;
    int _1094 = _1062 * _1080;
    int _1096 = _1094 + _1086;
    int _1098 = ~_767;
    int _1100 = _1098 + 1;
    int _1102 = _1078 * _1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1034 * _1090;
    int _1108 = _1106 + _1104;
    int _1110 = ~_767;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1108));
    float _1116 = as_type<float>(_877) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1112 * int(_1122);
    int _1126 = _1124 + _1108;
    float _1128 = float(uint(_1126));
    float _1130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1132 = log2(_1130);
    float _1134 = as_type<float>(_877) * _1128;
    float _1136 = trunc(_1134);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = int(_1122) + int(_1140);
    int _1144 = _1100 * _1142;
    int _1146 = _1144 + _1108;
    bool _1148 = uint(_1146) >= uint(_767);
    float _1150 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1152 = !_1148;
    int _1154 = _1152 ? 0 : (-1);
    float _1156 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    int _1158 = ~_1142;
    int _1160 = _1158 + _1154;
    int _1162 = _1160 + 1;
    float _1164 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1156);
    float _1166 = in.m_54.w;
    int _1168 = _767 * _1162;
    int _1170 = _1168 + _1108;
    float _1172 = _753 * 2.0;
    bool _1174 = !_811;
    int _1176 = _1174 ? _1170 : (-1);
    float _1178 = floor(_1172);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1184 = _1176 & 3;
    bool _1186 = _1184 != 0;
    bool _1188 = uint(_1184) > 1u;
    float _1190 = 1.0 / _1182;
    bool _1192 = _1166 > 0.5;
    int _1194 = _1186 ? 0 : 1;
    bool _1196 = _1092 > 0.5;
    bool _1198 = _1178 >= 0.0;
    bool _1200 = isnan(_1178);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    float _1208 = -_227;
    int _1210 = _1196 ? as_type<int>(_1208) : as_type<int>(_227);
    bool _1212 = _1178 > 0.0;
    int _1214 = ~_1194;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    if (!_1188)
    {
        int _1222 = ~_1194;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -_231;
    int _1230 = _1192 ? as_type<int>(_1228) : as_type<int>(_231);
    int _1232 = _1206 ? 0 : 1;
    bool _1234 = _753 > 0.5;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    int _1244 = ~_1232;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    float _1252 = _1250 ? _227 : as_type<float>(_1210);
    bool _1254 = !_1242;
    float _1256 = _1254 ? _231 : as_type<float>(_1230);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1268 = _1266 != 0;
    int _1270 = _1248;
    if (!_1212)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1292 = _1092 * 2.0;
    float _1294 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1290);
    float _1296 = -_227;
    int _1298 = _1234 ? as_type<int>(_1296) : as_type<int>(_227);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1302 = _747 + _1300;
    float _1304 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1294);
    float _1306 = _123 * _1132;
    float _1308 = floor(_1292);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1312 = _1310 != 0;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1318 = _1302 * _833;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1328;
    float _1332 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _1334 = exp2(_1306);
    float _1336 = _1322 * _899;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1342;
    float _1346 = _1326 * _1190;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1350 = _743 + _1348;
    float _1352 = 0.0;
    if (!_1312)
    {
        _1352 = _1092;
    }
    float _1354 = _1352;
    float _1356 = _1340 * _903;
    float _1358 = 1.0 / _1316;
    float _1360 = _1354;
    if (!_1312)
    {
        _839 = _1092;
    }
    float _1362 = _839;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1368 = _1362;
    if (_1312)
    {
        _1360 = as_type<float>(_919);
    }
    float _1370 = _1360;
    float _1372 = fma(_817, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    if (_1312)
    {
        _1368 = as_type<float>(_919);
    }
    float _1374 = _1368;
    float _1376 = _1366 * _928;
    bool _1378 = _1308 >= 0.0;
    bool _1380 = isnan(_1308);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = -_1334;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_847, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1394 = _1386 ? 0 : 1;
    float _1396 = _1330 * _958;
    bool _1398 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1412;
    float _1416 = _1344 * _1358;
    float _1418 = _1406 ? _1390 : 0.0;
    float _1420 = fma(_1410, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1422 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1424 = isnan(_743);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1436 = _743 + _1434;
    float _1438 = fma(_1336, _1350, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1440 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1442 = isnan(_743);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1414 * _978;
    float _1454 = -_1432;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1346, _1436, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1462 = _743 + _1460;
    bool _1464 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1466 = isnan(_743);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1456;
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1356, _1462, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1484 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1486 = isnan(_743);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1492 = _1488 || _1490;
    float _1494 = float(_1492);
    float _1496 = fma(_1376, _763, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1498 = _1474 * _1480;
    float _1500 = -_1474;
    float _1502 = _1500 + 1.0;
    bool _1504 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1506 = isnan(_743);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1494;
    float _1518 = _1516 + 1.0;
    bool _1520 = _1308 > 0.0;
    float _1522 = _1494 * _1502;
    bool _1524 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_747);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1538 = _743 + _1536;
    float _1540 = _1514 * _1518;
    float _1542 = -_1514;
    float _1544 = _1542 + 1.0;
    bool _1546 = !_1264;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = -_1534;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1396, _1538, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = _743 + _1556;
    float _1560 = _829 * _1544;
    float _1562 = _859 * _1552;
    float _1564 = _875 * _863;
    float _1566 = -_875;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1416, _1558, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1572 = _1372 * _1562;
    float _1574 = _1420 * _1562;
    float _1576 = -_859;
    float _1578 = _1576 + 1.0;
    float _1580 = _897 * _1568;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _743 + _1582;
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1590 = _1438 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1594 = 1.0 + _1592;
    float _1596 = -_897;
    float _1598 = _1596 + 1.0;
    float _1600 = fma(_1452, _1584, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1602 = _1392 * _1562;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1590);
    float _1606 = 1.0 / _1594;
    float _1608 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1610 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1602);
    float _1612 = fma(_1458, _1564, _1604);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = _917 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1618 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1610);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1622 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1588);
    float _1624 = -_1614;
    float _1626 = fma(_1616, 2.0, _1624);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1630 = as_type<float>(_919) * 2.0;
    bool _1632 = !_1284;
    float _1634 = _1632 ? _227 : as_type<float>(_1298);
    float _1636 = _753 + as_type<float>(_919);
    int _1638 = ~_1394;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1092 + as_type<float>(_919);
    int _1646 = _1642;
    if (!_1520)
    {
        int _1648 = ~_1394;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    float _1654 = _1636 + (-1.0);
    float _1656 = _1644 + (-1.0);
    float _1658 = floor(_1630);
    float _1660 = _1418 * _1606;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1664 = as_type<float>(_919) > 0.5;
    float _1666 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1668 = abs(_1548);
    float _1670 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1620);
    float _1672 = float(uint(_1078));
    float _1674 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1608);
    float _1676 = -_231;
    int _1678 = _1664 ? as_type<int>(_1676) : as_type<int>(_231);
    float _1680 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1682 = uint(_1184) >= 2u;
    float _1684 = as_type<float>(_877) * _1672;
    bool _1686 = !_1260;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1586);
    int _1692 = _1682 ? 0 : 1;
    float _1694 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1696 = _1658 > 0.0;
    float _1698 = trunc(_1684);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    bool _1704 = _1658 >= 0.0;
    bool _1706 = isnan(_1658);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = fma(_1554, _1560, _1612);
    int _1716 = abs(_1688);
    float _1718 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1720 = ~_767;
    int _1722 = _1720 + 1;
    float _1724 = _1252 + 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1718 + _1726;
    float _1730 = float(_1668);
    float _1732 = -_123;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1626);
    float _1736 = float(_1276);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1740 = _1680 + _1738;
    float _1742 = float(_1716);
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = float(_1652);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1734);
    float _1750 = _1730 * _1736;
    int _1752 = _1176 >> 31;
    float _1754 = _1742 * _1746;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    int _1758 = _1722 * int(_1702);
    int _1760 = _1758 + _1078;
    int _1762 = _1752 & 3;
    float _1764 = fma(_1694, -2.0, _1628);
    bool _1766 = !_1288;
    float _1768 = _1766 ? _231 : as_type<float>(_1678);
    float _1770 = fma(_1482, _1540, _1714);
    float _1772 = float(uint(_1760));
    float _1774 = _1256 + (-0.5);
    float _1776 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1764);
    int _1778 = _1176 + _1762;
    float _1780 = as_type<float>(_877) * _1772;
    float _1782 = fma(_1570, _1522, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1786 = _1778 >> 2;
    float _1788 = -_1774;
    float _1790 = -_1776;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1790);
    float _1794 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1796 = trunc(_1780);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1786 << 4;
    int _1804 = _1802 + 512;
    float _1806 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1808 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1810 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1812 = uint(int(uint(_1804) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1794 + _1828;
    float _1832 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1834 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1756);
    float _1840 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1670);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1804 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_58.x = _1832;
    out.m_58.y = _1834;
    out.m_58.z = _1836;
    out.m_58.w = _1784;
    bool _1862 = _1838 >= 0.0;
    float _1864 = _1754 * (-2.0);
    int _1866 = _1712 ? 0 : 1;
    float _1868 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1870 = int(_1702) + int(_1800);
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1874 = ~_1866;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = -_1768;
    float _1882 = _1880 + 0.5;
    bool _1884 = _1184 != 3;
    float _1886 = in.m_60.x;
    float _1888 = in.m_60.y;
    float _1890 = in.m_60.z;
    int _1892 = _1878;
    if (!_1696)
    {
        int _1894 = ~_1866;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1634 + 0.5;
    int _1902 = _1176 & 3;
    bool _1904 = _1902 != 0;
    float _1906 = -_1840;
    float _1908 = _1906 + 1.0;
    int _1910 = ~_767;
    int _1912 = _1910 + 1;
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1916 = -_1868;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1256, _1908, _1792);
    float _1922 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1924 = !_1904;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1914 * _1842;
    int _1930 = abs(_1226);
    int _1932 = _1912 * _1870;
    int _1934 = _1932 + _1078;
    float _1936 = -_1918;
    float _1938 = fma(_1252, _1936, _1748);
    float _1940 = _1922 * _1872;
    float _1942 = fma(_1496, _1498, _1782);
    int _1944 = ~_1692;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = fma(_1662, _1864, _1662);
    bool _1952 = uint(_1934) >= uint(_767);
    out.m_62.x = _1928;
    out.m_62.y = _1940;
    out.m_62.z = _1938;
    out.m_62.w = _1920;
    int _1954 = _1948;
    if (_1884)
    {
        int _1956 = ~_1692;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = fma(_1600, _1476, _1942);
    bool _1964 = !_1952;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = fma(_1864, _1886, _1886);
    bool _1970 = _1184 != 3;
    float _1972 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1962);
    int _1974 = abs(_1926);
    float _1976 = _1750 * (-2.0);
    int _1978 = ~_1930;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    if (_1862)
    {
        out.m_45.x = 0.0;
    }
    int _1984 = abs(_1960);
    float _1986 = fma(_1666, _1976, _1666);
    int _1988 = ~_1870;
    int _1990 = _1988 + _1966;
    int _1992 = _1990 + 1;
    int _1994 = _1982 * as_type<int>(_1826);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    out.m_64.x = _1972;
    int _2000 = ~_1974;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = fma(_1976, _1888, _1888);
    bool _2008 = !_1280;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = as_type<float>(_919) + (-0.5);
    int _2014 = abs(_1998);
    int _2016 = _2004 * as_type<int>(_1818);
    int _2018 = _2016 + _1994;
    float _2020 = _1728 * _1728;
    int _2022 = abs(_2010);
    float _2024 = _753 + (-0.5);
    int _2026 = ~_1984;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = fma(_1740, _1740, _2020);
    int _2034 = ~_2014;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    int _2042 = _767 * _1992;
    int _2044 = _2042 + _1078;
    float _2046 = fma(_1830, _1830, _2032);
    int _2048 = _2030 * as_type<int>(_1852);
    int _2050 = _2048 + _2018;
    int _2052 = ~_2022;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = _779 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2060 = _767 == 0;
    int _2062 = _2038 * as_type<int>(_1860);
    int _2064 = _2062 + _2050;
    float _2066 = rsqrt(_2046);
    float _2068 = as_type<float>(_2018);
    if (_1862)
    {
        _2068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2070 = _2068;
    bool _2072 = !_2060;
    int _2074 = _2072 ? _2044 : (-1);
    int _2076 = _2056 * _2064;
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    int _2088 = as_type<int>(_2070);
    if (_1862)
    {
        float _2090 = _2070 * 5.0;
        _2088 = as_type<int>(_2090);
    }
    int _2092 = _2088;
    int _2094 = _2074 * _2022;
    int _2096 = _2094 + _2076;
    bool _2098 = !_2086;
    float _2100 = _2098 ? _123 : _1660;
    bool _2102 = !_1268;
    int _2104 = _2102 ? 0 : 1;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6425 = as_type<float>(_2092);
        out.gl_Position.z = _6425;
    }
    float _2106 = float(_2096);
    float _2108 = fma(_2100, _1950, _2040);
    float _2110 = _2058 * _2066;
    out.m_66.y = _2106;
    float _2112 = _1740 * _2110;
    float _2114 = _1728 * _2110;
    int _2116 = abs(_2104);
    if (_1862)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2118 = -_2114;
    float _2120 = _1718 + _2118;
    float _2122 = _1830 * _2110;
    float _2124 = -_2112;
    float _2126 = _1680 + _2124;
    float _2128 = _2108 * 0.15915493667125701904296875;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2120 + _2130;
    float _2134 = -_2122;
    float _2136 = _1794 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2126 + _2138;
    float _2142 = float(_2116);
    float _2144 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2148 = _2136 + _2146;
    float _2150 = float(_1898);
    float _2152 = -_2114;
    float _2154 = _1728 + _2152;
    float _2156 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2144);
    float _2158 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2006);
    float _2160 = -_2112;
    float _2162 = _1740 + _2160;
    float _2164 = _2142 * _2150;
    float _2166 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    float _2168 = _2154 * _2154;
    float _2170 = _753 + _1092;
    float _2172 = _2164 * (-2.0);
    float _2174 = fma(_2100, _1986, _2158);
    bool _2176 = _2166 >= 0.0;
    float _2178 = fma(_2162, _2162, _2168);
    float _2180 = -_2122;
    float _2182 = _1830 + _2180;
    float _2184 = _1092 + (-0.5);
    float _2186 = _2170 + (-1.0);
    float _2188 = fma(_2172, _1890, _1890);
    float _2190 = _2174 * 0.15915493667125701904296875;
    float _2192 = fma(_2182, _2182, _2178);
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2188);
    float _2198 = _2128 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2144;
    int _2204 = as_type<int>(_2188);
    float _2206 = _2140;
    float _2208 = _2136;
    if (_2176)
    {
        _2202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2210 = _2202;
    float _2212 = fma(_2194, _2172, _2194);
    if (_2176)
    {
        out.m_45.x = 0.0;
    }
    if (_2176)
    {
        float _2214 = _2210 * 5.0;
        _2204 = as_type<int>(_2214);
    }
    int _2216 = _2204;
    float _2218 = _2128 * 6.283185482025146484375;
    float _2220 = cos(_2218);
    float _2222 = fma(_2100, _2212, _2196);
    if (_2176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6618 = as_type<float>(_2216);
        out.gl_Position.z = _6618;
    }
    float _2224 = _2222 * 0.15915493667125701904296875;
    float _2226 = _2190 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = sqrt(_2192);
    float _2232 = _2190 * 6.283185482025146484375;
    float _2234 = cos(_2232);
    if (_2176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2236 = _2224 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = _2066 * _2230;
    float _2242 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _2248 = _779 * _2240;
    float _2250 = _2240 * _2242;
    float _2252 = _2220 * _2234;
    float _2254 = _2224 * 6.283185482025146484375;
    float _2256 = sin(_2254);
    float _2258 = _2246 * _2248;
    float _2260 = _2244 * _2250;
    float _2262 = _2200 * _2228;
    float _2264 = _2220 * _2228;
    float _2266 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2268 = _2266 * 0.5;
    float _2270 = _2238 * _2260;
    float _2272 = _2228 * _2238;
    float _2274 = _2234 * _2238;
    float _2276 = _2200 * _2234;
    float _2278 = _2220 * _2270;
    float _2280 = fma(_2256, _2252, _2262);
    float _2282 = -_2260;
    float _2284 = _2256 * _2282;
    float _2286 = -_2276;
    float _2288 = fma(_2256, _2264, _2286);
    float _2290 = -_2264;
    float _2292 = fma(_2256, _2276, _2290);
    float _2294 = fma(_2280, _2258, _2278);
    float _2296 = _2200 * _2270;
    float _2298 = fma(_2274, _2258, _2284);
    float _2300 = fma(_2256, _2262, _2252);
    float _2302 = fma(_2288, _2268, _2294);
    float _2304 = fma(_2292, _2258, _2296);
    float _2306 = fma(_2272, _2268, _2298);
    float _2308 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2310 = fma(_2300, _2268, _2304);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2314 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2308);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2314);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2324 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2326 = _1794 + _2322;
    float _2328 = _1680 + _2324;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2326 + _2330;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2328 + _2334;
    float _2338 = _2332 * _2332;
    float _2340 = fma(_2336, _2336, _2338);
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = sqrt(_2340);
    float _2346 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2348 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2352 = _1718 + _2350;
    bool _2354 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2324;
    float _2358 = _2350;
    float _2360 = _2328;
    float _2362 = _2336;
    float _2364 = _2332;
    float _2366 = _2340;
    float _2368 = _2352;
    if (!_2354)
    {
        _2356 = _2326;
    }
    float _2370 = _2356;
    float _2372 = _2370;
    if (!_2354)
    {
        _2358 = _2352;
    }
    float _2374 = _2358;
    bool _2376 = !_2354;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2344 + _2382;
        float _2386 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2388 = rsqrt(_2340);
        float _2390 = _2384 * _2380;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2396 + (-1.0);
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = fma(_2400, _2386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2408 = fma(_2352, _2396, _2404);
        float _2410 = _2388 * _2406;
        float _2412 = fma(_2336, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2332, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2408;
        _2360 = _2412;
        _2372 = _2414;
    }
    float _2416 = _2378;
    float _2418 = _2360;
    float _2420 = _2372;
    float _2422 = -_1718;
    float _2424 = _2422 + _2416;
    float _2426 = -_1680;
    float _2428 = _2426 + _2418;
    float _2430 = -_1794;
    float _2432 = _2430 + _2420;
    float _2434 = _2424 * _2424;
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = fma(_2432, _2432, _2436);
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > 0.0;
    float _2444 = _2440;
    float _2446 = _2418;
    if (!_2442)
    {
        _2444 = _2416;
    }
    float _2448 = _2444;
    float _2450 = _2448;
    float _2452 = _2448;
    float _2454 = _2448;
    if (!_2442)
    {
        _2362 = _2420;
    }
    float _2456 = _2362;
    bool _2458 = !_2442;
    float _2460 = _2456;
    if (!_2458)
    {
        bool _2462 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2464 = _2456;
        if (_2462)
        {
            float _2466 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2464 = _2466;
        }
        float _2468 = _2464;
        float _2470 = _2468;
        float _2472 = _2468;
        if (_2462)
        {
            float _2474 = _441 * _2468;
            _2364 = _2474;
        }
        float _2476 = _2364;
        float _2478 = _2476;
        if (_2462)
        {
            float _2480 = _443 * _2468;
            _2366 = _2480;
        }
        float _2482 = _2366;
        float _2484 = _2482;
        if (_2462)
        {
            float _2486 = _445 * _2468;
            _2368 = _2486;
        }
        float _2488 = _2368;
        float _2490 = _2488;
        if (!_2462)
        {
            bool _2492 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2496 = _2492 || _2494;
            bool _2498 = isnan(1.0);
            bool _2500 = _2496 || _2498;
            float _2502 = _123 + 1.0;
            float _2504 = _2502;
            if (!_2500)
            {
                float _2506 = _2502 * _2502;
                float _2508 = _2506 * 0.5;
                _127 = _2508;
            }
            float _2510 = _127;
            float _2512 = _2510;
            if (!_2500)
            {
                float _2514 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2512 = _2514;
            }
            float _2516 = _2512;
            bool _2518 = !_2500;
            float _2520 = _2516;
            if (!_2518)
            {
                float _2522 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2524 = log2(_2522);
                float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2528 = 1.0 + _2526;
                float _2530 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2532 = _2524 * _2502;
                float _2534 = 1.0 / _2528;
                float _2536 = _2530 * 0.693147182464599609375;
                float _2538 = exp2(_2532);
                float _2540 = 1.0 / _2536;
                float _2542 = _2538 + (-1.0);
                float _2544 = -_2542;
                float _2546 = fma(_2544, _2540, _2502);
                float _2548 = _2546 * _2534;
                float _2550 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2520 = _2550;
                _2450 = _2540;
            }
            float _2552 = _2520;
            float _2554 = _2450;
            float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2558 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2560 = !_2500;
            float _2562 = _2554;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = 1.0 / _2570;
                float _2574 = _2566 * _2502;
                float _2576 = exp2(_2574);
                float _2578 = -_2576;
                float _2580 = _2578 + 1.0;
                float _2582 = _2580 * _2572;
                _2504 = _2582;
                _2562 = _2570;
                _2470 = _2574;
            }
            float _2584 = _2504;
            float _2586 = _2562;
            float _2588 = _2470;
            float _2590 = fma(_2584, _163, _2558);
            float _2592 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2594 = fma(_2584, _161, _2556);
            float _2596 = -_399;
            float _2598 = _2596 + _2590;
            float _2600 = fma(_2584, _165, _2592);
            float _2602 = -_403;
            float _2604 = _2602 + _2594;
            float _2606 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2608 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2612 = -_405;
            float _2614 = _2612 + _2600;
            float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2606);
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2610);
            float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2616);
            float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2618);
            float _2626 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2620);
            _449 = _2624;
            _451 = _2622;
            _453 = _2626;
            _2478 = _2622;
            _2484 = _2624;
            _2490 = _2626;
            _2452 = _2586;
            _2472 = _2588;
        }
        float _2628 = _449;
        float _2630 = _451;
        float _2632 = _453;
        float _2634 = _2478;
        float _2636 = _2484;
        float _2638 = _2490;
        float _2640 = _2452;
        float _2642 = _2472;
        float _2644 = _2628 * _2628;
        float _2646 = rsqrt(_2438);
        float _2648 = fma(_2630, _2630, _2644);
        float _2650 = fma(_2632, _2632, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = _2428 * _2646;
        float _2656 = _2424 * _2646;
        float _2658 = _2432 * _2646;
        bool _2660 = _2652 > 0.0;
        float _2662 = _2640;
        float _2664 = _2642;
        if (!_2660)
        {
            _2662 = _2416;
        }
        float _2666 = _2662;
        _2454 = _2666;
        if (!_2660)
        {
            _2664 = _2420;
        }
        float _2668 = _2664;
        bool _2670 = !_2660;
        _2460 = _2668;
        if (!_2670)
        {
            float _2672 = rsqrt(_2650);
            float _2674 = _2672 * _2628;
            float _2676 = _2672 * _2630;
            float _2678 = _2672 * _2632;
            float _2680 = _2656 * _2674;
            float _2682 = fma(_2654, _2676, _2680);
            float _2684 = fma(_2658, _2678, _2682);
            float _2686 = _2684 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2688 = fma(_2634, _2686, _2418);
            float _2690 = fma(_2636, _2686, _2416);
            float _2692 = fma(_2638, _2686, _2420);
            _2454 = _2690;
            _2460 = _2692;
            _2446 = _2688;
        }
    }
    float _2694 = _2454;
    float _2696 = _2460;
    float _2698 = _2446;
    float _2700 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2704 = isnan(0.5);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2710 = _2706 || _2708;
    float _2712 = -_2114;
    float _2714 = _2712 + _2694;
    bool _2716 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2718 = isnan(0.5);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2700);
    float _2728 = -_2122;
    float _2730 = _2728 + _2696;
    float _2732 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2726);
    float _2734 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2736 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2738 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2734);
    float _2740 = 1.0 / _2736;
    float _2742 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2738);
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2746 = _2744 + _2736;
    float _2748 = _2746 * _2740;
    float _2750 = _2748 * 0.5;
    float _2752 = -_2112;
    float _2754 = _2752 + _2698;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2758 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2756);
    float _2760 = _2750;
    float _2762 = _2714;
    float _2764 = _2754;
    float _2766 = _2730;
    float _2768 = _2736;
    if (_2724)
    {
        _2760 = 1.0;
    }
    float _2770 = _2760;
    float _2772 = 1.0 / _2758;
    float _2774 = _2770;
    if (!_2710)
    {
        float _2776 = _2132 * _2132;
        float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2780 = -_1794;
        float _2782 = _2780 + _2696;
        float _2784 = -_1680;
        float _2786 = _2784 + _2698;
        float _2788 = fma(_2140, _2140, _2776);
        float _2790 = -_1718;
        float _2792 = _2790 + _2694;
        float _2794 = fma(_2148, _2148, _2788);
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2798 = sqrt(_2794);
        float _2800 = 1.0 / _2240;
        float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2804 = precise::min(_2798, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2806 = _2804 * _2778;
        float _2808 = _2806 * _2800;
        float _2810 = _2802 * _2808;
        float _2812 = _2782 * _2808;
        float _2814 = fma(_2786, _2810, _2126);
        float _2816 = fma(_2792, _2810, _2120);
        float _2818 = fma(_2802, _2812, _2136);
        _2762 = _2816;
        _2764 = _2814;
        _2766 = _2818;
        _2206 = _2798;
        _2768 = _2808;
    }
    float _2820 = _2762;
    float _2822 = _2764;
    float _2824 = _2766;
    float _2826 = _2206;
    float _2828 = _2768;
    float _2830 = _2828;
    float _2832 = _2826;
    if (_2724)
    {
        _2830 = 1.0;
    }
    float _2834 = _2830;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = _2772 * _2836;
    float _2840 = _2834;
    if (!_2724)
    {
        float _2842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2844 = _2842 * 0.15915493667125701904296875;
        float _2846 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = _2844 * 6.283185482025146484375;
        float _2850 = cos(_2848);
        float _2852 = _2846 * 0.15915493667125701904296875;
        float _2854 = _2844 * 6.283185482025146484375;
        float _2856 = sin(_2854);
        float _2858 = 1.0 / _2850;
        float _2860 = _2852 * 6.283185482025146484375;
        float _2862 = cos(_2860);
        float _2864 = _2856 * _2858;
        float _2866 = _2852 * 6.283185482025146484375;
        float _2868 = sin(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = 1.0 / _2870;
        float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2876 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2874;
        float _2878 = 1.0 / _2876;
        float _2880 = _2868 * _2872;
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2884 = fma(_2838, _2880, _2882);
        float _2886 = _2884 * _2878;
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        _2208 = _2878;
        _2774 = _2888;
    }
    float _2890 = _2208;
    float _2892 = _2774;
    float _2894 = _2890;
    if (!_2724)
    {
        float _2896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2898 = _2896 * 0.15915493667125701904296875;
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2902 = _2898 * 6.283185482025146484375;
        float _2904 = cos(_2902);
        float _2906 = _2900 * 0.15915493667125701904296875;
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        float _2912 = 1.0 / _2904;
        float _2914 = _2906 * 6.283185482025146484375;
        float _2916 = cos(_2914);
        float _2918 = _2910 * _2912;
        float _2920 = _2906 * 6.283185482025146484375;
        float _2922 = sin(_2920);
        float _2924 = _2916 * _2918;
        float _2926 = 1.0 / _2924;
        float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2930 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2928;
        float _2932 = 1.0 / _2930;
        float _2934 = _2922 * _2926;
        float _2936 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2938 = fma(_2838, _2934, _2936);
        float _2940 = _2938 * _2932;
        float _2942 = precise::clamp(_2940, 0.0, 1.0);
        float _2944 = -_2942;
        float _2946 = _2944 + 1.0;
        _2832 = _2934;
        _2894 = _2912;
        _2840 = _2946;
    }
    float _2948 = _2832;
    float _2950 = _2894;
    float _2952 = _2840;
    float _2954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2956 = _2820 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2960 = _2822 + _2958;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2964 = _2824 + _2962;
    float _2966 = _2956 * _2956;
    float _2968 = fma(_2960, _2960, _2966);
    float _2970 = fma(_2964, _2964, _2968);
    float _2972 = rsqrt(_2970);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2978 = _2960 * _2976;
    float _2980 = _2964 * _2976;
    float _2982 = _2978 * _2978;
    float _2984 = _2980 * _2980;
    float _2986 = _2982 + _2984;
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = _2988 + _2992;
    float _2996 = _2972;
    float _2998 = _2994;
    float _3000 = _2948;
    float _3002 = _2956;
    float _3004 = _2976;
    if (_2990)
    {
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2996 = _3006;
    }
    float _3008 = _2996;
    float _3010 = _3008;
    if (_2990)
    {
        float _3012 = _2994 * _3008;
        _2998 = _3012;
    }
    float _3014 = _2998;
    if (_2990)
    {
        float _3016 = rsqrt(_2986);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = _3018;
    if (_2990)
    {
        float _3022 = _3014 * 0.15915493667125701904296875;
        _3000 = _3022;
    }
    float _3024 = _3000;
    float _3026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3028 = _2964;
    float _3030 = _3024;
    if (_2990)
    {
        float _3032 = _3024 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = precise::max(0.0, _3026);
    float _3040 = _2950;
    float _3042 = _3038;
    if (_2990)
    {
        float _3044 = _3024 * 6.283185482025146484375;
        float _3046 = cos(_3044);
        _3040 = _3046;
    }
    float _3048 = _3040;
    float _3050 = -_2976;
    float _3052 = -_3038;
    float _3054 = fma(_2956, _3050, _3052);
    if (_2990)
    {
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3056;
    }
    float _3058 = _3002;
    float _3060 = _3036;
    float _3062 = _3058;
    if (_2990)
    {
        float _3064 = fma(_3036, _3058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = _3066;
    if (!_2990)
    {
        _3062 = _3054;
    }
    float _3070 = _3062;
    float _3072 = _3070;
    if (_2990)
    {
        float _3074 = _3018 * _3066;
        _3004 = _3074;
    }
    float _3076 = _3004;
    if (!_2990)
    {
        _3020 = _2978;
    }
    float _3078 = _3020;
    float _3080 = _3078;
    float _3082 = _3048;
    if (_2990)
    {
        float _3084 = _3048 + (-1.0);
        _3042 = _3084;
    }
    float _3086 = _3042;
    float _3088 = _3086;
    if (_2990)
    {
        float _3090 = _2978 * _3076;
        _3080 = _3090;
    }
    float _3092 = _3080;
    if (!_2990)
    {
        _3068 = _2982;
    }
    float _3094 = _3068;
    float _3096 = _3094;
    if (_2990)
    {
        float _3098 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3030 = _3098;
    }
    float _3100 = _3030;
    if (!_2990)
    {
        _3088 = _2980;
    }
    float _3102 = _3088;
    float _3104 = _3102;
    if (_2990)
    {
        float _3106 = _2980 * _3076;
        _3104 = _3106;
    }
    float _3108 = _3104;
    if (_2990)
    {
        float _3110 = _3092 * _3092;
        _3096 = _3110;
    }
    float _3112 = _3096;
    if (_2990)
    {
        float _3114 = fma(_3054, _3048, _3100);
        _3072 = _3114;
    }
    float _3116 = _3072;
    if (!_2990)
    {
        _3082 = _2984;
    }
    float _3118 = _3082;
    float _3120 = _3118;
    if (_2990)
    {
        float _3122 = _3108 * _3108;
        _3120 = _3122;
    }
    float _3124 = _3120;
    float _3126 = fma(_3116, _3116, _3112);
    float _3128 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3132 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3134 = _3126 + _3124;
    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3138 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3136);
    float _3140 = precise::clamp(_3138, 0.0, 1.0);
    float _3142 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3144 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3146 = rsqrt(_3134);
    float _3148 = -_3140;
    float _3150 = _3148 + 1.0;
    float _3152 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3132);
    float _3154 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3142);
    float _3156 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3144);
    float _3160 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3152);
    float _3162 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3166 = abs(_3150);
    float _3168 = log2(_3166);
    float _3170 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3158);
    float _3172 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3176 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3164);
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = _3146 * _3092;
    float _3184 = -_3174;
    float _3186 = fma(_3184, _3130, 1.0);
    float _3188 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3192 = _3146 * _3116;
    float _3194 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3196 = _3146 * _3108;
    float _3198 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = log2(_3186);
    float _3202 = -_3194;
    float _3204 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3208 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3218 = exp2(_3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3214, 0.5, 0.5);
    float _3224 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3216);
    float _3226 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3210);
    float _3228 = _3192 + 1.0;
    float _3230 = fma(_3222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3232 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3224);
    float _3234 = 1.0 / _3208;
    float _3236 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3226);
    float _3238 = fma(_3222, _3230, -0.212114393711090087890625);
    float _3240 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3232);
    float _3242 = _3200 * 0.693147182464599609375;
    float _3244 = fma(_3222, _3238, 1.570728778839111328125);
    float _3246 = sqrt(_3220);
    float _3248 = -_3192;
    float _3250 = fma(_3218, _3228, _3248);
    float _3252 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3236);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_3250, 0.5, 0.5);
    float _3258 = _3240 * _3234;
    float _3260 = _3252 * _3234;
    float _3262 = fma(_3258, 0.5, 0.5);
    float _3264 = fma(_3260, -0.5, 0.5);
    float _3266 = _3246 * 0.636619746685028076171875;
    float _3268 = -_3244;
    float _3270 = fma(_3266, _3268, 1.0);
    float3 _8222 = float3(_3262, _3264, _3254);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8222, float3(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8222, float3(0.0), isnan(_8222)), level(0.0)).x;
    float3 _8233 = float3(_3262, _3264, _3254);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8233, float3(0.0), isnan(_8233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8233, float3(0.0), isnan(_8233)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8250 = float2(_3270, _3256);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8250, float2(0.0), isnan(_8250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8250, float2(0.0), isnan(_8250)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3297 = _2892 > 0.0;
    bool _3299 = isnan(_2892);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3309 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3311 = _2952 <= 0.0;
    bool _3313 = !_3305;
    bool _3315 = _3311 || _3313;
    float _3317 = _3240 + _3208;
    float _3319 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3307);
    float _3321 = _2892 * _2952;
    float _3323 = exp2(_3309);
    float _3325 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3319);
    float _3327 = _3321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3208 * 0.5;
    float _3331 = _3325 + _3208;
    float _3333 = _3317 * 0.5;
    out.gl_Position.x = _3240;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3331 * 0.5;
    float _3337 = -_3323;
    float _3339 = _3337 + 1.0;
    float _3341 = fma(_3252, -0.5, _3329);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3333;
    out.m_68.y = _3341;
    out.m_68.z = _3335;
    out.m_68.w = _3208;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    out.m_45.x = _3343;
    float _3351 = _3345 * _3272;
    float _3353 = _3283 * _3349;
    float _3355 = _3283 * _3351;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3355, _3277);
    float _3361 = fma(_3291, _3355, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3353;
    if (!_3315)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _583 = false;
    bool _473 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3491 = as_type<float>(_143);
        out.gl_Position.z = _3491;
    }
    if (_137)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    int _197 = int(_191);
    int _199 = _195 ? 2 : 0;
    int _201 = _197 | _199;
    int _203 = _159 ? 4 : 0;
    int _205 = _201 | _203;
    int _207 = false ? 8 : 0;
    int _209 = _205 | _207;
    int _211 = false ? 16 : 0;
    int _213 = _209 | _211;
    int _215 = false ? 32 : 0;
    int _217 = _213 | _215;
    int _219 = false ? 64 : 0;
    int _221 = _217 | _219;
    int _223 = _221 & 4;
    bool _225 = !_191;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_195;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_159;
    float _235 = _187;
    float _237 = 0.0;
    float _239 = as_type<float>(_223);
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
        _237 = _257;
        _239 = _259;
    }
    float _271 = _235;
    float _273 = _237;
    float _275 = _239;
    bool _277 = !_159;
    float _279 = _275;
    float _281 = _273;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _147 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _289;
        _175 = _301;
    }
    float _303 = _279;
    float _305 = _175;
    float _307 = _303;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _281 = _311;
    }
    float _313 = _281;
    float _315 = _313;
    if (!_159)
    {
        _307 = _123;
    }
    float _317 = _307;
    float _319 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _317;
    if (!_159)
    {
        float _325 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_159;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_159;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = fma(_305, _161, _319);
    float _391 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _397 = fma(_305, _163, _321);
    float _399 = fma(_387, _163, _391);
    float _401 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _161, _393);
    float _405 = fma(_387, _165, _395);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _409 = fma(_397, _149, _169);
    float _411 = -_399;
    float _413 = _397 + _411;
    float _415 = fma(_305, _165, _401);
    float _417 = fma(_389, _149, _167);
    float _419 = -_403;
    float _421 = _389 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = -_405;
    float _431 = _415 + _429;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = fma(_415, _149, _171);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    bool _447 = !_407;
    float _449 = _443;
    float _451 = _441;
    float _453 = _445;
    float _471;
    if (!_447)
    {
        float _455 = in.m_54.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_89);
        float _477 = 1.0 / _475;
        float _479 = _123 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _485 = _481 + _483;
    float _487 = in.m_52.x;
    float _489 = in.m_52.y;
    bool _491 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_481);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _503;
    bool _507 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _509 = isnan(_481);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    float _527 = 1.0 / _505;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _531 = _517 * _521;
    float _533 = -_517;
    float _535 = _533 + 1.0;
    float _537 = _485 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _545 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _547 = _543 * _531;
    float _549 = _545 * _531;
    float _551 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].x, _547);
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].y, _549);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].x, _551);
    float _557 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].y, _553);
    float _559 = _555 * _487;
    float _561 = _557 * _489;
    bool _563 = !_529;
    float _581;
    if (!_563)
    {
        float _565 = in.m_54.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_89);
        float _587 = 1.0 / _585;
        float _589 = _123 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = _627 * _649;
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = 1.0 / _615;
    float _661 = _631 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _667 = fma(_661, _595, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _665 * _659;
    float _671 = _667 * _653;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _591 + _677;
    float _681 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _671);
    float _683 = _611 * _675;
    float _685 = fma(_669, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = fma(_685, _683, _681);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _697;
    out.m_56.y = _699;
    out.m_56.z = _701;
    out.m_56.w = _703;
    bool _705 = !_651;
    float _729;
    float _731;
    float _733;
    if (!_705)
    {
        float _707 = in.m_54.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _711 = float(_89);
        float _713 = 1.0 / _711;
        float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _717 = _123 * _713;
        float _719 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _721 = _719 * _709;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _717;
        _731 = _711;
        _733 = _727;
        _735 = true;
    }
    else
    {
        float _737 = float(_89);
        float _739 = 1.0 / _737;
        float _741 = _123 * _739;
        _729 = _741;
        _731 = _737;
        _733 = _741;
    }
    _735 = false;
    float _743 = _729;
    float _745 = _731;
    float _747 = _733;
    float _749 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _751 = int(_749);
    float _753 = in.m_54.x;
    float _755 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _763 = _743 + _761;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _767 = int(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _769;
    float _773 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _785 = float(_751);
    float _787 = 1.0 / _745;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _797 = 1.0 / _785;
    float _799 = float(uint(_767));
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _805 = ~_767;
    int _807 = _805 + 1;
    float _809 = float(_767);
    bool _811 = _767 == 0;
    float _813 = 1.0 / _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    bool _819 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _821 = isnan(_743);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = _123 * _797;
    float _833 = 1.0 / _771;
    float _835 = _797;
    float _837 = _785;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_759)
    {
        float _841 = in.m_54.y;
        _835 = _841;
    }
    float _843 = _835;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    bool _849 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_747);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_829;
    float _863 = _861 + 1.0;
    bool _865 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _867 = isnan(_743);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    int _877 = as_type<int>(_813) + (-2);
    float _879 = trunc(_831);
    int _881 = int(_879);
    int _883 = ~_767;
    int _885 = _883 + 1;
    bool _887 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _889 = isnan(_743);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _777;
    float _901 = float(uint(_881));
    float _903 = 1.0 / _783;
    if (!_759)
    {
        _837 = _843;
    }
    float _905 = _837;
    float _907 = as_type<float>(_877) * _901;
    float _909 = _905;
    int _911 = as_type<int>(_843);
    if (_759)
    {
        float _913 = in.m_54.x;
        float _915 = in.m_54.y;
        _909 = _913;
        _911 = as_type<int>(_915);
    }
    float _917 = _909;
    int _919 = _911;
    float _921 = trunc(_907);
    float _923 = precise::max(_921, 0.0);
    uint _926 = uint(_923);
    float _928 = 1.0 / _791;
    float _930 = float(_881);
    bool _932 = _930 >= _809;
    bool _934 = isnan(_930);
    bool _936 = _932 || _934;
    bool _938 = isnan(_809);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    int _944 = _885 * int(_926);
    int _946 = _944 + _881;
    float _948 = trunc(_942);
    int _950 = int(_948);
    float _952 = float(uint(_946));
    bool _954 = !_759;
    float _956 = _954 ? as_type<float>(_919) : _753;
    float _958 = 1.0 / _795;
    float _960 = as_type<float>(_877) * _952;
    bool _962 = !_759;
    float _964 = _962 ? 1.2345600128173828125 : 1.0;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    float _972 = _964 * _956;
    float _974 = floor(_972);
    int _976 = int(_926) + int(_970);
    float _978 = 1.0 / _803;
    int _980 = _807 * _976;
    int _982 = _980 + _881;
    bool _984 = uint(_982) >= uint(_767);
    bool _986 = !_984;
    int _988 = _986 ? 0 : (-1);
    int _990 = ~_976;
    int _992 = _990 + _988;
    int _994 = _992 + 1;
    float _996 = -_974;
    float _998 = _972 + _996;
    int _1000 = ~_950;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _767 * _994;
    int _1008 = _1006 + _881;
    float _1010 = _809 * _998;
    float _1012 = _123 * _809;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1016 = _1014 != 0;
    bool _1018 = !_811;
    int _1020 = _1018 ? _1008 : (-1);
    float _1022 = _1012 * _787;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1030 = _1028 != 0;
    float _1032 = trunc(_1010);
    int _1034 = int(_1032);
    int _1036 = _767 + (-1);
    int _1038 = _1004 * _1020;
    bool _1040 = !_1016;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1050 = _1048 != 0;
    int _1052 = _950 * _1036;
    int _1054 = _1052 + _1038;
    bool _1056 = !_1030;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = trunc(_1022);
    int _1062 = int(_1060);
    bool _1064 = !_1026;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = abs(_1042);
    bool _1070 = !_1046;
    int _1072 = _1070 ? 0 : 1;
    int _1074 = abs(_1058);
    int _1076 = _1034 * _1068;
    int _1078 = _1076 + _881;
    int _1080 = abs(_1066);
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = _1054 * _1074;
    int _1088 = abs(_1072);
    int _1090 = abs(_1084);
    float _1092 = in.m_54.z;
    int _1094 = _1062 * _1080;
    int _1096 = _1094 + _1086;
    int _1098 = ~_767;
    int _1100 = _1098 + 1;
    int _1102 = _1078 * _1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1034 * _1090;
    int _1108 = _1106 + _1104;
    int _1110 = ~_767;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1108));
    float _1116 = as_type<float>(_877) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1112 * int(_1122);
    int _1126 = _1124 + _1108;
    float _1128 = float(uint(_1126));
    float _1130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1132 = log2(_1130);
    float _1134 = as_type<float>(_877) * _1128;
    float _1136 = trunc(_1134);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = int(_1122) + int(_1140);
    int _1144 = _1100 * _1142;
    int _1146 = _1144 + _1108;
    bool _1148 = uint(_1146) >= uint(_767);
    float _1150 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1152 = !_1148;
    int _1154 = _1152 ? 0 : (-1);
    float _1156 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    int _1158 = ~_1142;
    int _1160 = _1158 + _1154;
    int _1162 = _1160 + 1;
    float _1164 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1156);
    float _1166 = in.m_54.w;
    int _1168 = _767 * _1162;
    int _1170 = _1168 + _1108;
    float _1172 = _753 * 2.0;
    bool _1174 = !_811;
    int _1176 = _1174 ? _1170 : (-1);
    float _1178 = floor(_1172);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1184 = _1176 & 3;
    bool _1186 = _1184 != 0;
    bool _1188 = uint(_1184) > 1u;
    float _1190 = 1.0 / _1182;
    bool _1192 = _1166 > 0.5;
    int _1194 = _1186 ? 0 : 1;
    bool _1196 = _1092 > 0.5;
    bool _1198 = _1178 >= 0.0;
    bool _1200 = isnan(_1178);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    float _1208 = -_227;
    int _1210 = _1196 ? as_type<int>(_1208) : as_type<int>(_227);
    bool _1212 = _1178 > 0.0;
    int _1214 = ~_1194;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    if (!_1188)
    {
        int _1222 = ~_1194;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -_231;
    int _1230 = _1192 ? as_type<int>(_1228) : as_type<int>(_231);
    int _1232 = _1206 ? 0 : 1;
    bool _1234 = _753 > 0.5;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    int _1244 = ~_1232;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    float _1252 = _1250 ? _227 : as_type<float>(_1210);
    bool _1254 = !_1242;
    float _1256 = _1254 ? _231 : as_type<float>(_1230);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1268 = _1266 != 0;
    int _1270 = _1248;
    if (!_1212)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1292 = _1092 * 2.0;
    float _1294 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1290);
    float _1296 = -_227;
    int _1298 = _1234 ? as_type<int>(_1296) : as_type<int>(_227);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1302 = _747 + _1300;
    float _1304 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1294);
    float _1306 = _123 * _1132;
    float _1308 = floor(_1292);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1312 = _1310 != 0;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1318 = _1302 * _833;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1328;
    float _1332 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _1334 = exp2(_1306);
    float _1336 = _1322 * _899;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1342;
    float _1346 = _1326 * _1190;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1350 = _743 + _1348;
    float _1352 = 0.0;
    if (!_1312)
    {
        _1352 = _1092;
    }
    float _1354 = _1352;
    float _1356 = _1340 * _903;
    float _1358 = 1.0 / _1316;
    float _1360 = _1354;
    if (!_1312)
    {
        _839 = _1092;
    }
    float _1362 = _839;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1368 = _1362;
    if (_1312)
    {
        _1360 = as_type<float>(_919);
    }
    float _1370 = _1360;
    float _1372 = fma(_817, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    if (_1312)
    {
        _1368 = as_type<float>(_919);
    }
    float _1374 = _1368;
    float _1376 = _1366 * _928;
    bool _1378 = _1308 >= 0.0;
    bool _1380 = isnan(_1308);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = -_1334;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_847, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1394 = _1386 ? 0 : 1;
    float _1396 = _1330 * _958;
    bool _1398 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1412;
    float _1416 = _1344 * _1358;
    float _1418 = _1406 ? _1390 : 0.0;
    float _1420 = fma(_1410, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1422 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1424 = isnan(_743);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1436 = _743 + _1434;
    float _1438 = fma(_1336, _1350, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1440 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1442 = isnan(_743);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1414 * _978;
    float _1454 = -_1432;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1346, _1436, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1462 = _743 + _1460;
    bool _1464 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1466 = isnan(_743);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1456;
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1356, _1462, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1484 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1486 = isnan(_743);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1492 = _1488 || _1490;
    float _1494 = float(_1492);
    float _1496 = fma(_1376, _763, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1498 = _1474 * _1480;
    float _1500 = -_1474;
    float _1502 = _1500 + 1.0;
    bool _1504 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1506 = isnan(_743);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1494;
    float _1518 = _1516 + 1.0;
    bool _1520 = _1308 > 0.0;
    float _1522 = _1494 * _1502;
    bool _1524 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_747);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1538 = _743 + _1536;
    float _1540 = _1514 * _1518;
    float _1542 = -_1514;
    float _1544 = _1542 + 1.0;
    bool _1546 = !_1264;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = -_1534;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1396, _1538, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = _743 + _1556;
    float _1560 = _829 * _1544;
    float _1562 = _859 * _1552;
    float _1564 = _875 * _863;
    float _1566 = -_875;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1416, _1558, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1572 = _1372 * _1562;
    float _1574 = _1420 * _1562;
    float _1576 = -_859;
    float _1578 = _1576 + 1.0;
    float _1580 = _897 * _1568;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _743 + _1582;
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1590 = _1438 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1594 = 1.0 + _1592;
    float _1596 = -_897;
    float _1598 = _1596 + 1.0;
    float _1600 = fma(_1452, _1584, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1602 = _1392 * _1562;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1590);
    float _1606 = 1.0 / _1594;
    float _1608 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1610 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1602);
    float _1612 = fma(_1458, _1564, _1604);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = _917 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1618 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1610);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1622 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1588);
    float _1624 = -_1614;
    float _1626 = fma(_1616, 2.0, _1624);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1630 = as_type<float>(_919) * 2.0;
    bool _1632 = !_1284;
    float _1634 = _1632 ? _227 : as_type<float>(_1298);
    float _1636 = _753 + as_type<float>(_919);
    int _1638 = ~_1394;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1092 + as_type<float>(_919);
    int _1646 = _1642;
    if (!_1520)
    {
        int _1648 = ~_1394;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    float _1654 = _1636 + (-1.0);
    float _1656 = _1644 + (-1.0);
    float _1658 = floor(_1630);
    float _1660 = _1418 * _1606;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1664 = as_type<float>(_919) > 0.5;
    float _1666 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1668 = abs(_1548);
    float _1670 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1620);
    float _1672 = float(uint(_1078));
    float _1674 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1608);
    float _1676 = -_231;
    int _1678 = _1664 ? as_type<int>(_1676) : as_type<int>(_231);
    float _1680 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1682 = uint(_1184) >= 2u;
    float _1684 = as_type<float>(_877) * _1672;
    bool _1686 = !_1260;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1586);
    int _1692 = _1682 ? 0 : 1;
    float _1694 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1696 = _1658 > 0.0;
    float _1698 = trunc(_1684);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    bool _1704 = _1658 >= 0.0;
    bool _1706 = isnan(_1658);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = fma(_1554, _1560, _1612);
    int _1716 = abs(_1688);
    float _1718 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1720 = ~_767;
    int _1722 = _1720 + 1;
    float _1724 = _1252 + 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1718 + _1726;
    float _1730 = float(_1668);
    float _1732 = -_123;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1626);
    float _1736 = float(_1276);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1740 = _1680 + _1738;
    float _1742 = float(_1716);
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = float(_1652);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1734);
    float _1750 = _1730 * _1736;
    int _1752 = _1176 >> 31;
    float _1754 = _1742 * _1746;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    int _1758 = _1722 * int(_1702);
    int _1760 = _1758 + _1078;
    int _1762 = _1752 & 3;
    float _1764 = fma(_1694, -2.0, _1628);
    bool _1766 = !_1288;
    float _1768 = _1766 ? _231 : as_type<float>(_1678);
    float _1770 = fma(_1482, _1540, _1714);
    float _1772 = float(uint(_1760));
    float _1774 = _1256 + (-0.5);
    float _1776 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1764);
    int _1778 = _1176 + _1762;
    float _1780 = as_type<float>(_877) * _1772;
    float _1782 = fma(_1570, _1522, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1786 = _1778 >> 2;
    float _1788 = -_1774;
    float _1790 = -_1776;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1790);
    float _1794 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1796 = trunc(_1780);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1786 << 4;
    int _1804 = _1802 + 512;
    float _1806 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1808 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1810 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1812 = uint(int(uint(_1804) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1794 + _1828;
    float _1832 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1834 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1756);
    float _1840 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1670);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1804 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_58.x = _1832;
    out.m_58.y = _1834;
    out.m_58.z = _1836;
    out.m_58.w = _1784;
    bool _1862 = _1838 >= 0.0;
    float _1864 = _1754 * (-2.0);
    int _1866 = _1712 ? 0 : 1;
    float _1868 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1870 = int(_1702) + int(_1800);
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1874 = ~_1866;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = -_1768;
    float _1882 = _1880 + 0.5;
    bool _1884 = _1184 != 3;
    float _1886 = in.m_60.x;
    float _1888 = in.m_60.y;
    float _1890 = in.m_60.z;
    int _1892 = _1878;
    if (!_1696)
    {
        int _1894 = ~_1866;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1634 + 0.5;
    int _1902 = _1176 & 3;
    bool _1904 = _1902 != 0;
    float _1906 = -_1840;
    float _1908 = _1906 + 1.0;
    int _1910 = ~_767;
    int _1912 = _1910 + 1;
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1916 = -_1868;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1256, _1908, _1792);
    float _1922 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1924 = !_1904;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1914 * _1842;
    int _1930 = abs(_1226);
    int _1932 = _1912 * _1870;
    int _1934 = _1932 + _1078;
    float _1936 = -_1918;
    float _1938 = fma(_1252, _1936, _1748);
    float _1940 = _1922 * _1872;
    float _1942 = fma(_1496, _1498, _1782);
    int _1944 = ~_1692;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = fma(_1662, _1864, _1662);
    bool _1952 = uint(_1934) >= uint(_767);
    out.m_62.x = _1928;
    out.m_62.y = _1940;
    out.m_62.z = _1938;
    out.m_62.w = _1920;
    int _1954 = _1948;
    if (_1884)
    {
        int _1956 = ~_1692;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = fma(_1600, _1476, _1942);
    bool _1964 = !_1952;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = fma(_1864, _1886, _1886);
    bool _1970 = _1184 != 3;
    float _1972 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1962);
    int _1974 = abs(_1926);
    float _1976 = _1750 * (-2.0);
    int _1978 = ~_1930;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    if (_1862)
    {
        out.m_45.x = 0.0;
    }
    int _1984 = abs(_1960);
    float _1986 = fma(_1666, _1976, _1666);
    int _1988 = ~_1870;
    int _1990 = _1988 + _1966;
    int _1992 = _1990 + 1;
    int _1994 = _1982 * as_type<int>(_1826);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    out.m_64.x = _1972;
    int _2000 = ~_1974;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = fma(_1976, _1888, _1888);
    bool _2008 = !_1280;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = as_type<float>(_919) + (-0.5);
    int _2014 = abs(_1998);
    int _2016 = _2004 * as_type<int>(_1818);
    int _2018 = _2016 + _1994;
    float _2020 = _1728 * _1728;
    int _2022 = abs(_2010);
    float _2024 = _753 + (-0.5);
    int _2026 = ~_1984;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = fma(_1740, _1740, _2020);
    int _2034 = ~_2014;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    int _2042 = _767 * _1992;
    int _2044 = _2042 + _1078;
    float _2046 = fma(_1830, _1830, _2032);
    int _2048 = _2030 * as_type<int>(_1852);
    int _2050 = _2048 + _2018;
    int _2052 = ~_2022;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = _779 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2060 = _767 == 0;
    int _2062 = _2038 * as_type<int>(_1860);
    int _2064 = _2062 + _2050;
    float _2066 = rsqrt(_2046);
    float _2068 = as_type<float>(_2018);
    if (_1862)
    {
        _2068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2070 = _2068;
    bool _2072 = !_2060;
    int _2074 = _2072 ? _2044 : (-1);
    int _2076 = _2056 * _2064;
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    int _2088 = as_type<int>(_2070);
    if (_1862)
    {
        float _2090 = _2070 * 5.0;
        _2088 = as_type<int>(_2090);
    }
    int _2092 = _2088;
    int _2094 = _2074 * _2022;
    int _2096 = _2094 + _2076;
    bool _2098 = !_2086;
    float _2100 = _2098 ? _123 : _1660;
    bool _2102 = !_1268;
    int _2104 = _2102 ? 0 : 1;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6425 = as_type<float>(_2092);
        out.gl_Position.z = _6425;
    }
    float _2106 = float(_2096);
    float _2108 = fma(_2100, _1950, _2040);
    float _2110 = _2058 * _2066;
    out.m_66.y = _2106;
    float _2112 = _1740 * _2110;
    float _2114 = _1728 * _2110;
    int _2116 = abs(_2104);
    if (_1862)
    {
        return out;
    }
    float _2118 = -_2114;
    float _2120 = _1718 + _2118;
    float _2122 = _1830 * _2110;
    float _2124 = -_2112;
    float _2126 = _1680 + _2124;
    float _2128 = _2108 * 0.15915493667125701904296875;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2120 + _2130;
    float _2134 = -_2122;
    float _2136 = _1794 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2126 + _2138;
    float _2142 = float(_2116);
    float _2144 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2148 = _2136 + _2146;
    float _2150 = float(_1898);
    float _2152 = -_2114;
    float _2154 = _1728 + _2152;
    float _2156 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2144);
    float _2158 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2006);
    float _2160 = -_2112;
    float _2162 = _1740 + _2160;
    float _2164 = _2142 * _2150;
    float _2166 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    float _2168 = _2154 * _2154;
    float _2170 = _753 + _1092;
    float _2172 = _2164 * (-2.0);
    float _2174 = fma(_2100, _1986, _2158);
    bool _2176 = _2166 >= 0.0;
    float _2178 = fma(_2162, _2162, _2168);
    float _2180 = -_2122;
    float _2182 = _1830 + _2180;
    float _2184 = _1092 + (-0.5);
    float _2186 = _2170 + (-1.0);
    float _2188 = fma(_2172, _1890, _1890);
    float _2190 = _2174 * 0.15915493667125701904296875;
    float _2192 = fma(_2182, _2182, _2178);
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2188);
    float _2198 = _2128 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2144;
    int _2204 = as_type<int>(_2188);
    float _2206 = _2140;
    float _2208 = _2136;
    if (_2176)
    {
        _2202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2210 = _2202;
    float _2212 = fma(_2194, _2172, _2194);
    if (_2176)
    {
        out.m_45.x = 0.0;
    }
    if (_2176)
    {
        float _2214 = _2210 * 5.0;
        _2204 = as_type<int>(_2214);
    }
    int _2216 = _2204;
    float _2218 = _2128 * 6.283185482025146484375;
    float _2220 = cos(_2218);
    float _2222 = fma(_2100, _2212, _2196);
    if (_2176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6618 = as_type<float>(_2216);
        out.gl_Position.z = _6618;
    }
    float _2224 = _2222 * 0.15915493667125701904296875;
    float _2226 = _2190 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = sqrt(_2192);
    float _2232 = _2190 * 6.283185482025146484375;
    float _2234 = cos(_2232);
    if (_2176)
    {
        return out;
    }
    float _2236 = _2224 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = _2066 * _2230;
    float _2242 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _2248 = _779 * _2240;
    float _2250 = _2240 * _2242;
    float _2252 = _2220 * _2234;
    float _2254 = _2224 * 6.283185482025146484375;
    float _2256 = sin(_2254);
    float _2258 = _2246 * _2248;
    float _2260 = _2244 * _2250;
    float _2262 = _2200 * _2228;
    float _2264 = _2220 * _2228;
    float _2266 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2268 = _2266 * 0.5;
    float _2270 = _2238 * _2260;
    float _2272 = _2228 * _2238;
    float _2274 = _2234 * _2238;
    float _2276 = _2200 * _2234;
    float _2278 = _2220 * _2270;
    float _2280 = fma(_2256, _2252, _2262);
    float _2282 = -_2260;
    float _2284 = _2256 * _2282;
    float _2286 = -_2276;
    float _2288 = fma(_2256, _2264, _2286);
    float _2290 = -_2264;
    float _2292 = fma(_2256, _2276, _2290);
    float _2294 = fma(_2280, _2258, _2278);
    float _2296 = _2200 * _2270;
    float _2298 = fma(_2274, _2258, _2284);
    float _2300 = fma(_2256, _2262, _2252);
    float _2302 = fma(_2288, _2268, _2294);
    float _2304 = fma(_2292, _2258, _2296);
    float _2306 = fma(_2272, _2268, _2298);
    float _2308 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2310 = fma(_2300, _2268, _2304);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2314 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2308);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2314);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2324 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2326 = _1794 + _2322;
    float _2328 = _1680 + _2324;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2326 + _2330;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2328 + _2334;
    float _2338 = _2332 * _2332;
    float _2340 = fma(_2336, _2336, _2338);
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = sqrt(_2340);
    float _2346 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2348 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2352 = _1718 + _2350;
    bool _2354 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2324;
    float _2358 = _2350;
    float _2360 = _2328;
    float _2362 = _2336;
    float _2364 = _2332;
    float _2366 = _2340;
    float _2368 = _2352;
    if (!_2354)
    {
        _2356 = _2326;
    }
    float _2370 = _2356;
    float _2372 = _2370;
    if (!_2354)
    {
        _2358 = _2352;
    }
    float _2374 = _2358;
    bool _2376 = !_2354;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2344 + _2382;
        float _2386 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2388 = rsqrt(_2340);
        float _2390 = _2384 * _2380;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2396 + (-1.0);
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = fma(_2400, _2386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2408 = fma(_2352, _2396, _2404);
        float _2410 = _2388 * _2406;
        float _2412 = fma(_2336, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2332, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2408;
        _2360 = _2412;
        _2372 = _2414;
    }
    float _2416 = _2378;
    float _2418 = _2360;
    float _2420 = _2372;
    float _2422 = -_1718;
    float _2424 = _2422 + _2416;
    float _2426 = -_1680;
    float _2428 = _2426 + _2418;
    float _2430 = -_1794;
    float _2432 = _2430 + _2420;
    float _2434 = _2424 * _2424;
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = fma(_2432, _2432, _2436);
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > 0.0;
    float _2444 = _2440;
    float _2446 = _2418;
    if (!_2442)
    {
        _2444 = _2416;
    }
    float _2448 = _2444;
    float _2450 = _2448;
    float _2452 = _2448;
    float _2454 = _2448;
    if (!_2442)
    {
        _2362 = _2420;
    }
    float _2456 = _2362;
    bool _2458 = !_2442;
    float _2460 = _2456;
    if (!_2458)
    {
        bool _2462 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2464 = _2456;
        if (_2462)
        {
            float _2466 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2464 = _2466;
        }
        float _2468 = _2464;
        float _2470 = _2468;
        float _2472 = _2468;
        if (_2462)
        {
            float _2474 = _441 * _2468;
            _2364 = _2474;
        }
        float _2476 = _2364;
        float _2478 = _2476;
        if (_2462)
        {
            float _2480 = _443 * _2468;
            _2366 = _2480;
        }
        float _2482 = _2366;
        float _2484 = _2482;
        if (_2462)
        {
            float _2486 = _445 * _2468;
            _2368 = _2486;
        }
        float _2488 = _2368;
        float _2490 = _2488;
        if (!_2462)
        {
            bool _2492 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2496 = _2492 || _2494;
            bool _2498 = isnan(1.0);
            bool _2500 = _2496 || _2498;
            float _2502 = _123 + 1.0;
            float _2504 = _2502;
            if (!_2500)
            {
                float _2506 = _2502 * _2502;
                float _2508 = _2506 * 0.5;
                _127 = _2508;
            }
            float _2510 = _127;
            float _2512 = _2510;
            if (!_2500)
            {
                float _2514 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2512 = _2514;
            }
            float _2516 = _2512;
            bool _2518 = !_2500;
            float _2520 = _2516;
            if (!_2518)
            {
                float _2522 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2524 = log2(_2522);
                float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2528 = 1.0 + _2526;
                float _2530 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2532 = _2524 * _2502;
                float _2534 = 1.0 / _2528;
                float _2536 = _2530 * 0.693147182464599609375;
                float _2538 = exp2(_2532);
                float _2540 = 1.0 / _2536;
                float _2542 = _2538 + (-1.0);
                float _2544 = -_2542;
                float _2546 = fma(_2544, _2540, _2502);
                float _2548 = _2546 * _2534;
                float _2550 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2520 = _2550;
                _2450 = _2540;
            }
            float _2552 = _2520;
            float _2554 = _2450;
            float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2558 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2560 = !_2500;
            float _2562 = _2554;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = 1.0 / _2570;
                float _2574 = _2566 * _2502;
                float _2576 = exp2(_2574);
                float _2578 = -_2576;
                float _2580 = _2578 + 1.0;
                float _2582 = _2580 * _2572;
                _2504 = _2582;
                _2562 = _2570;
                _2470 = _2574;
            }
            float _2584 = _2504;
            float _2586 = _2562;
            float _2588 = _2470;
            float _2590 = fma(_2584, _163, _2558);
            float _2592 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2594 = fma(_2584, _161, _2556);
            float _2596 = -_399;
            float _2598 = _2596 + _2590;
            float _2600 = fma(_2584, _165, _2592);
            float _2602 = -_403;
            float _2604 = _2602 + _2594;
            float _2606 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2608 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2612 = -_405;
            float _2614 = _2612 + _2600;
            float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2606);
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2610);
            float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2616);
            float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2618);
            float _2626 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2620);
            _449 = _2624;
            _451 = _2622;
            _453 = _2626;
            _2478 = _2622;
            _2484 = _2624;
            _2490 = _2626;
            _2452 = _2586;
            _2472 = _2588;
        }
        float _2628 = _449;
        float _2630 = _451;
        float _2632 = _453;
        float _2634 = _2478;
        float _2636 = _2484;
        float _2638 = _2490;
        float _2640 = _2452;
        float _2642 = _2472;
        float _2644 = _2628 * _2628;
        float _2646 = rsqrt(_2438);
        float _2648 = fma(_2630, _2630, _2644);
        float _2650 = fma(_2632, _2632, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = _2428 * _2646;
        float _2656 = _2424 * _2646;
        float _2658 = _2432 * _2646;
        bool _2660 = _2652 > 0.0;
        float _2662 = _2640;
        float _2664 = _2642;
        if (!_2660)
        {
            _2662 = _2416;
        }
        float _2666 = _2662;
        _2454 = _2666;
        if (!_2660)
        {
            _2664 = _2420;
        }
        float _2668 = _2664;
        bool _2670 = !_2660;
        _2460 = _2668;
        if (!_2670)
        {
            float _2672 = rsqrt(_2650);
            float _2674 = _2672 * _2628;
            float _2676 = _2672 * _2630;
            float _2678 = _2672 * _2632;
            float _2680 = _2656 * _2674;
            float _2682 = fma(_2654, _2676, _2680);
            float _2684 = fma(_2658, _2678, _2682);
            float _2686 = _2684 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2688 = fma(_2634, _2686, _2418);
            float _2690 = fma(_2636, _2686, _2416);
            float _2692 = fma(_2638, _2686, _2420);
            _2454 = _2690;
            _2460 = _2692;
            _2446 = _2688;
        }
    }
    float _2694 = _2454;
    float _2696 = _2460;
    float _2698 = _2446;
    float _2700 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2704 = isnan(0.5);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2710 = _2706 || _2708;
    float _2712 = -_2114;
    float _2714 = _2712 + _2694;
    bool _2716 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2718 = isnan(0.5);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2700);
    float _2728 = -_2122;
    float _2730 = _2728 + _2696;
    float _2732 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2726);
    float _2734 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2736 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2738 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2734);
    float _2740 = 1.0 / _2736;
    float _2742 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2738);
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2746 = _2744 + _2736;
    float _2748 = _2746 * _2740;
    float _2750 = _2748 * 0.5;
    float _2752 = -_2112;
    float _2754 = _2752 + _2698;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2758 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2756);
    float _2760 = _2750;
    float _2762 = _2714;
    float _2764 = _2754;
    float _2766 = _2730;
    float _2768 = _2736;
    if (_2724)
    {
        _2760 = 1.0;
    }
    float _2770 = _2760;
    float _2772 = 1.0 / _2758;
    float _2774 = _2770;
    if (!_2710)
    {
        float _2776 = _2132 * _2132;
        float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2780 = -_1794;
        float _2782 = _2780 + _2696;
        float _2784 = -_1680;
        float _2786 = _2784 + _2698;
        float _2788 = fma(_2140, _2140, _2776);
        float _2790 = -_1718;
        float _2792 = _2790 + _2694;
        float _2794 = fma(_2148, _2148, _2788);
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2798 = sqrt(_2794);
        float _2800 = 1.0 / _2240;
        float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2804 = precise::min(_2798, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2806 = _2804 * _2778;
        float _2808 = _2806 * _2800;
        float _2810 = _2802 * _2808;
        float _2812 = _2782 * _2808;
        float _2814 = fma(_2786, _2810, _2126);
        float _2816 = fma(_2792, _2810, _2120);
        float _2818 = fma(_2802, _2812, _2136);
        _2762 = _2816;
        _2764 = _2814;
        _2766 = _2818;
        _2206 = _2798;
        _2768 = _2808;
    }
    float _2820 = _2762;
    float _2822 = _2764;
    float _2824 = _2766;
    float _2826 = _2206;
    float _2828 = _2768;
    float _2830 = _2828;
    float _2832 = _2826;
    if (_2724)
    {
        _2830 = 1.0;
    }
    float _2834 = _2830;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = _2772 * _2836;
    float _2840 = _2834;
    if (!_2724)
    {
        float _2842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2844 = _2842 * 0.15915493667125701904296875;
        float _2846 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = _2844 * 6.283185482025146484375;
        float _2850 = cos(_2848);
        float _2852 = _2846 * 0.15915493667125701904296875;
        float _2854 = _2844 * 6.283185482025146484375;
        float _2856 = sin(_2854);
        float _2858 = 1.0 / _2850;
        float _2860 = _2852 * 6.283185482025146484375;
        float _2862 = cos(_2860);
        float _2864 = _2856 * _2858;
        float _2866 = _2852 * 6.283185482025146484375;
        float _2868 = sin(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = 1.0 / _2870;
        float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2876 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2874;
        float _2878 = 1.0 / _2876;
        float _2880 = _2868 * _2872;
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2884 = fma(_2838, _2880, _2882);
        float _2886 = _2884 * _2878;
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        _2208 = _2878;
        _2774 = _2888;
    }
    float _2890 = _2208;
    float _2892 = _2774;
    float _2894 = _2890;
    if (!_2724)
    {
        float _2896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2898 = _2896 * 0.15915493667125701904296875;
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2902 = _2898 * 6.283185482025146484375;
        float _2904 = cos(_2902);
        float _2906 = _2900 * 0.15915493667125701904296875;
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        float _2912 = 1.0 / _2904;
        float _2914 = _2906 * 6.283185482025146484375;
        float _2916 = cos(_2914);
        float _2918 = _2910 * _2912;
        float _2920 = _2906 * 6.283185482025146484375;
        float _2922 = sin(_2920);
        float _2924 = _2916 * _2918;
        float _2926 = 1.0 / _2924;
        float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2930 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2928;
        float _2932 = 1.0 / _2930;
        float _2934 = _2922 * _2926;
        float _2936 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2938 = fma(_2838, _2934, _2936);
        float _2940 = _2938 * _2932;
        float _2942 = precise::clamp(_2940, 0.0, 1.0);
        float _2944 = -_2942;
        float _2946 = _2944 + 1.0;
        _2832 = _2934;
        _2894 = _2912;
        _2840 = _2946;
    }
    float _2948 = _2832;
    float _2950 = _2894;
    float _2952 = _2840;
    float _2954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2956 = _2820 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2960 = _2822 + _2958;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2964 = _2824 + _2962;
    float _2966 = _2956 * _2956;
    float _2968 = fma(_2960, _2960, _2966);
    float _2970 = fma(_2964, _2964, _2968);
    float _2972 = rsqrt(_2970);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2978 = _2960 * _2976;
    float _2980 = _2964 * _2976;
    float _2982 = _2978 * _2978;
    float _2984 = _2980 * _2980;
    float _2986 = _2982 + _2984;
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = _2988 + _2992;
    float _2996 = _2972;
    float _2998 = _2994;
    float _3000 = _2948;
    float _3002 = _2956;
    float _3004 = _2976;
    if (_2990)
    {
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2996 = _3006;
    }
    float _3008 = _2996;
    float _3010 = _3008;
    if (_2990)
    {
        float _3012 = _2994 * _3008;
        _2998 = _3012;
    }
    float _3014 = _2998;
    if (_2990)
    {
        float _3016 = rsqrt(_2986);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = _3018;
    if (_2990)
    {
        float _3022 = _3014 * 0.15915493667125701904296875;
        _3000 = _3022;
    }
    float _3024 = _3000;
    float _3026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3028 = _2964;
    float _3030 = _3024;
    if (_2990)
    {
        float _3032 = _3024 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = precise::max(0.0, _3026);
    float _3040 = _2950;
    float _3042 = _3038;
    if (_2990)
    {
        float _3044 = _3024 * 6.283185482025146484375;
        float _3046 = cos(_3044);
        _3040 = _3046;
    }
    float _3048 = _3040;
    float _3050 = -_2976;
    float _3052 = -_3038;
    float _3054 = fma(_2956, _3050, _3052);
    if (_2990)
    {
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3056;
    }
    float _3058 = _3002;
    float _3060 = _3036;
    float _3062 = _3058;
    if (_2990)
    {
        float _3064 = fma(_3036, _3058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = _3066;
    if (!_2990)
    {
        _3062 = _3054;
    }
    float _3070 = _3062;
    float _3072 = _3070;
    if (_2990)
    {
        float _3074 = _3018 * _3066;
        _3004 = _3074;
    }
    float _3076 = _3004;
    if (!_2990)
    {
        _3020 = _2978;
    }
    float _3078 = _3020;
    float _3080 = _3078;
    float _3082 = _3048;
    if (_2990)
    {
        float _3084 = _3048 + (-1.0);
        _3042 = _3084;
    }
    float _3086 = _3042;
    float _3088 = _3086;
    if (_2990)
    {
        float _3090 = _2978 * _3076;
        _3080 = _3090;
    }
    float _3092 = _3080;
    if (!_2990)
    {
        _3068 = _2982;
    }
    float _3094 = _3068;
    float _3096 = _3094;
    if (_2990)
    {
        float _3098 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3030 = _3098;
    }
    float _3100 = _3030;
    if (!_2990)
    {
        _3088 = _2980;
    }
    float _3102 = _3088;
    float _3104 = _3102;
    if (_2990)
    {
        float _3106 = _2980 * _3076;
        _3104 = _3106;
    }
    float _3108 = _3104;
    if (_2990)
    {
        float _3110 = _3092 * _3092;
        _3096 = _3110;
    }
    float _3112 = _3096;
    if (_2990)
    {
        float _3114 = fma(_3054, _3048, _3100);
        _3072 = _3114;
    }
    float _3116 = _3072;
    if (!_2990)
    {
        _3082 = _2984;
    }
    float _3118 = _3082;
    float _3120 = _3118;
    if (_2990)
    {
        float _3122 = _3108 * _3108;
        _3120 = _3122;
    }
    float _3124 = _3120;
    float _3126 = fma(_3116, _3116, _3112);
    float _3128 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3132 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3134 = _3126 + _3124;
    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3138 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3136);
    float _3140 = precise::clamp(_3138, 0.0, 1.0);
    float _3142 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3144 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3146 = rsqrt(_3134);
    float _3148 = -_3140;
    float _3150 = _3148 + 1.0;
    float _3152 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3132);
    float _3154 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3142);
    float _3156 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3144);
    float _3160 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3152);
    float _3162 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3166 = abs(_3150);
    float _3168 = log2(_3166);
    float _3170 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3158);
    float _3172 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3176 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3164);
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = _3146 * _3092;
    float _3184 = -_3174;
    float _3186 = fma(_3184, _3130, 1.0);
    float _3188 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3192 = _3146 * _3116;
    float _3194 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3196 = _3146 * _3108;
    float _3198 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = log2(_3186);
    float _3202 = -_3194;
    float _3204 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3208 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3218 = exp2(_3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3214, 0.5, 0.5);
    float _3224 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3216);
    float _3226 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3210);
    float _3228 = _3192 + 1.0;
    float _3230 = fma(_3222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3232 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3224);
    float _3234 = 1.0 / _3208;
    float _3236 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3226);
    float _3238 = fma(_3222, _3230, -0.212114393711090087890625);
    float _3240 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3232);
    float _3242 = _3200 * 0.693147182464599609375;
    float _3244 = fma(_3222, _3238, 1.570728778839111328125);
    float _3246 = sqrt(_3220);
    float _3248 = -_3192;
    float _3250 = fma(_3218, _3228, _3248);
    float _3252 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3236);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_3250, 0.5, 0.5);
    float _3258 = _3240 * _3234;
    float _3260 = _3252 * _3234;
    float _3262 = fma(_3258, 0.5, 0.5);
    float _3264 = fma(_3260, -0.5, 0.5);
    float _3266 = _3246 * 0.636619746685028076171875;
    float _3268 = -_3244;
    float _3270 = fma(_3266, _3268, 1.0);
    float3 _8222 = float3(_3262, _3264, _3254);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8222, float3(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8222, float3(0.0), isnan(_8222)), level(0.0)).x;
    float3 _8233 = float3(_3262, _3264, _3254);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8233, float3(0.0), isnan(_8233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8233, float3(0.0), isnan(_8233)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8250 = float2(_3270, _3256);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8250, float2(0.0), isnan(_8250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8250, float2(0.0), isnan(_8250)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3297 = _2892 > 0.0;
    bool _3299 = isnan(_2892);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3309 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3311 = _2952 <= 0.0;
    bool _3313 = !_3305;
    bool _3315 = _3311 || _3313;
    float _3317 = _3240 + _3208;
    float _3319 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3307);
    float _3321 = _2892 * _2952;
    float _3323 = exp2(_3309);
    float _3325 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3319);
    float _3327 = _3321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3208 * 0.5;
    float _3331 = _3325 + _3208;
    float _3333 = _3317 * 0.5;
    out.gl_Position.x = _3240;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3331 * 0.5;
    float _3337 = -_3323;
    float _3339 = _3337 + 1.0;
    float _3341 = fma(_3252, -0.5, _3329);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3333;
    out.m_68.y = _3341;
    out.m_68.z = _3335;
    out.m_68.w = _3208;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    out.m_45.x = _3343;
    float _3351 = _3345 * _3272;
    float _3353 = _3283 * _3349;
    float _3355 = _3283 * _3351;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3355, _3277);
    float _3361 = fma(_3291, _3355, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3353;
    if (!_3315)
    {
        return out;
    }
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _735 = false;
    bool _583 = false;
    bool _473 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3422 = as_type<float>(_105);
        out.gl_Position.z = _3422;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3491 = as_type<float>(_143);
        out.gl_Position.z = _3491;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    int _197 = int(_191);
    int _199 = _195 ? 2 : 0;
    int _201 = _197 | _199;
    int _203 = _159 ? 4 : 0;
    int _205 = _201 | _203;
    int _207 = false ? 8 : 0;
    int _209 = _205 | _207;
    int _211 = false ? 16 : 0;
    int _213 = _209 | _211;
    int _215 = false ? 32 : 0;
    int _217 = _213 | _215;
    int _219 = false ? 64 : 0;
    int _221 = _217 | _219;
    int _223 = _221 & 4;
    bool _225 = !_191;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_195;
    float _231 = _229 ? (-0.5) : 0.5;
    bool _233 = !_159;
    float _235 = _187;
    float _237 = 0.0;
    float _239 = as_type<float>(_223);
    if (!_233)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _269;
        _237 = _257;
        _239 = _259;
    }
    float _271 = _235;
    float _273 = _237;
    float _275 = _239;
    bool _277 = !_159;
    float _279 = _275;
    float _281 = _273;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _147 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _289;
        _175 = _301;
    }
    float _303 = _279;
    float _305 = _175;
    float _307 = _303;
    if (!_159)
    {
        float _309 = _123 * _123;
        float _311 = _309 * 0.5;
        _281 = _311;
    }
    float _313 = _281;
    float _315 = _313;
    if (!_159)
    {
        _307 = _123;
    }
    float _317 = _307;
    float _319 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _321 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _323 = _317;
    if (!_159)
    {
        float _325 = _313 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_159;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _123 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _123);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    bool _365 = !_159;
    if (!_365)
    {
        float _367 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _369 = log2(_367);
        float _371 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _373 = _371 + 1.0;
        float _375 = 1.0 / _373;
        float _377 = _123 * _369;
        float _379 = exp2(_377);
        float _381 = -_379;
        float _383 = _381 + 1.0;
        float _385 = _383 * _375;
        _323 = _385;
    }
    float _387 = _323;
    float _389 = fma(_305, _161, _319);
    float _391 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _395 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _397 = fma(_305, _163, _321);
    float _399 = fma(_387, _163, _391);
    float _401 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _403 = fma(_387, _161, _393);
    float _405 = fma(_387, _165, _395);
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _409 = fma(_397, _149, _169);
    float _411 = -_399;
    float _413 = _397 + _411;
    float _415 = fma(_305, _165, _401);
    float _417 = fma(_389, _149, _167);
    float _419 = -_403;
    float _421 = _389 + _419;
    float _423 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _425 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _427 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _429 = -_405;
    float _431 = _415 + _429;
    float _433 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].x, _423);
    float _435 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
    float _437 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
    float _439 = fma(_415, _149, _171);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _443 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _435);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
    bool _447 = !_407;
    float _449 = _443;
    float _451 = _441;
    float _453 = _445;
    float _471;
    if (!_447)
    {
        float _455 = in.m_54.x;
        float _457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _461 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _463 = _461 * _457;
        float _465 = floor(_463);
        float _467 = -_465;
        float _469 = _463 + _467;
        _471 = _469;
        _473 = true;
    }
    else
    {
        float _475 = float(_89);
        float _477 = 1.0 / _475;
        float _479 = _123 * _477;
        _471 = _479;
    }
    _473 = false;
    float _481 = _471;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _485 = _481 + _483;
    float _487 = in.m_52.x;
    float _489 = in.m_52.y;
    bool _491 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_481);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _503;
    bool _507 = _481 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _509 = isnan(_481);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _523;
    float _527 = 1.0 / _505;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _531 = _517 * _521;
    float _533 = -_517;
    float _535 = _533 + 1.0;
    float _537 = _485 * _527;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = fma(_525, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _545 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _547 = _543 * _531;
    float _549 = _545 * _531;
    float _551 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].x, _547);
    float _553 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[143].y, _549);
    float _555 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].x, _551);
    float _557 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[144].y, _553);
    float _559 = _555 * _487;
    float _561 = _557 * _489;
    bool _563 = !_529;
    float _581;
    if (!_563)
    {
        float _565 = in.m_54.x;
        float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _569 = _565 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _573 = _571 * _567;
        float _575 = floor(_573);
        float _577 = -_575;
        float _579 = _573 + _577;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = float(_89);
        float _587 = 1.0 / _585;
        float _589 = _123 * _587;
        _581 = _589;
    }
    _583 = false;
    float _591 = _581;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _595 = _591 + _593;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _601 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_591);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_591);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _629;
    bool _633 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = isnan(_591);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = 1.0 / _599;
    float _647 = -_611;
    float _649 = _647 + 1.0;
    bool _651 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _653 = _627 * _649;
    float _655 = -_627;
    float _657 = _655 + 1.0;
    float _659 = 1.0 / _615;
    float _661 = _631 * _645;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _667 = fma(_661, _595, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _669 = _665 * _659;
    float _671 = _667 * _653;
    float _673 = -_643;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _679 = _591 + _677;
    float _681 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[115].x, _671);
    float _683 = _611 * _675;
    float _685 = fma(_669, _679, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = fma(_685, _683, _681);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _695 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[117].x, _689);
    float _697 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _695 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _697;
    out.m_56.y = _699;
    out.m_56.z = _701;
    out.m_56.w = _703;
    bool _705 = !_651;
    float _729;
    float _731;
    float _733;
    if (!_705)
    {
        float _707 = in.m_54.x;
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _711 = float(_89);
        float _713 = 1.0 / _711;
        float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _717 = _123 * _713;
        float _719 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _721 = _719 * _709;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _717;
        _731 = _711;
        _733 = _727;
        _735 = true;
    }
    else
    {
        float _737 = float(_89);
        float _739 = 1.0 / _737;
        float _741 = _123 * _739;
        _729 = _741;
        _731 = _737;
        _733 = _741;
    }
    _735 = false;
    float _743 = _729;
    float _745 = _731;
    float _747 = _733;
    float _749 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _751 = int(_749);
    float _753 = in.m_54.x;
    float _755 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _759 = _757 != 0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _763 = _743 + _761;
    float _765 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _767 = int(_765);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _769;
    float _773 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _785 = float(_751);
    float _787 = 1.0 / _745;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _797 = 1.0 / _785;
    float _799 = float(uint(_767));
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _805 = ~_767;
    int _807 = _805 + 1;
    float _809 = float(_767);
    bool _811 = _767 == 0;
    float _813 = 1.0 / _799;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    bool _819 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _821 = isnan(_743);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = _123 * _797;
    float _833 = 1.0 / _771;
    float _835 = _797;
    float _837 = _785;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_759)
    {
        float _841 = in.m_54.y;
        _835 = _841;
    }
    float _843 = _835;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    bool _849 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _851 = isnan(_747);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_829;
    float _863 = _861 + 1.0;
    bool _865 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _867 = isnan(_743);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    int _877 = as_type<int>(_813) + (-2);
    float _879 = trunc(_831);
    int _881 = int(_879);
    int _883 = ~_767;
    int _885 = _883 + 1;
    bool _887 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _889 = isnan(_743);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _777;
    float _901 = float(uint(_881));
    float _903 = 1.0 / _783;
    if (!_759)
    {
        _837 = _843;
    }
    float _905 = _837;
    float _907 = as_type<float>(_877) * _901;
    float _909 = _905;
    int _911 = as_type<int>(_843);
    if (_759)
    {
        float _913 = in.m_54.x;
        float _915 = in.m_54.y;
        _909 = _913;
        _911 = as_type<int>(_915);
    }
    float _917 = _909;
    int _919 = _911;
    float _921 = trunc(_907);
    float _923 = precise::max(_921, 0.0);
    uint _926 = uint(_923);
    float _928 = 1.0 / _791;
    float _930 = float(_881);
    bool _932 = _930 >= _809;
    bool _934 = isnan(_930);
    bool _936 = _932 || _934;
    bool _938 = isnan(_809);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    int _944 = _885 * int(_926);
    int _946 = _944 + _881;
    float _948 = trunc(_942);
    int _950 = int(_948);
    float _952 = float(uint(_946));
    bool _954 = !_759;
    float _956 = _954 ? as_type<float>(_919) : _753;
    float _958 = 1.0 / _795;
    float _960 = as_type<float>(_877) * _952;
    bool _962 = !_759;
    float _964 = _962 ? 1.2345600128173828125 : 1.0;
    float _966 = trunc(_960);
    float _968 = precise::max(_966, 0.0);
    uint _970 = uint(_968);
    float _972 = _964 * _956;
    float _974 = floor(_972);
    int _976 = int(_926) + int(_970);
    float _978 = 1.0 / _803;
    int _980 = _807 * _976;
    int _982 = _980 + _881;
    bool _984 = uint(_982) >= uint(_767);
    bool _986 = !_984;
    int _988 = _986 ? 0 : (-1);
    int _990 = ~_976;
    int _992 = _990 + _988;
    int _994 = _992 + 1;
    float _996 = -_974;
    float _998 = _972 + _996;
    int _1000 = ~_950;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _767 * _994;
    int _1008 = _1006 + _881;
    float _1010 = _809 * _998;
    float _1012 = _123 * _809;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1016 = _1014 != 0;
    bool _1018 = !_811;
    int _1020 = _1018 ? _1008 : (-1);
    float _1022 = _1012 * _787;
    int _1024 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1026 = _1024 != 0;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1030 = _1028 != 0;
    float _1032 = trunc(_1010);
    int _1034 = int(_1032);
    int _1036 = _767 + (-1);
    int _1038 = _1004 * _1020;
    bool _1040 = !_1016;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1050 = _1048 != 0;
    int _1052 = _950 * _1036;
    int _1054 = _1052 + _1038;
    bool _1056 = !_1030;
    int _1058 = _1056 ? 0 : 1;
    float _1060 = trunc(_1022);
    int _1062 = int(_1060);
    bool _1064 = !_1026;
    int _1066 = _1064 ? 0 : 1;
    int _1068 = abs(_1042);
    bool _1070 = !_1046;
    int _1072 = _1070 ? 0 : 1;
    int _1074 = abs(_1058);
    int _1076 = _1034 * _1068;
    int _1078 = _1076 + _881;
    int _1080 = abs(_1066);
    bool _1082 = !_1050;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = _1054 * _1074;
    int _1088 = abs(_1072);
    int _1090 = abs(_1084);
    float _1092 = in.m_54.z;
    int _1094 = _1062 * _1080;
    int _1096 = _1094 + _1086;
    int _1098 = ~_767;
    int _1100 = _1098 + 1;
    int _1102 = _1078 * _1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1034 * _1090;
    int _1108 = _1106 + _1104;
    int _1110 = ~_767;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1108));
    float _1116 = as_type<float>(_877) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1112 * int(_1122);
    int _1126 = _1124 + _1108;
    float _1128 = float(uint(_1126));
    float _1130 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1132 = log2(_1130);
    float _1134 = as_type<float>(_877) * _1128;
    float _1136 = trunc(_1134);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    int _1142 = int(_1122) + int(_1140);
    int _1144 = _1100 * _1142;
    int _1146 = _1144 + _1108;
    bool _1148 = uint(_1146) >= uint(_767);
    float _1150 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1152 = !_1148;
    int _1154 = _1152 ? 0 : (-1);
    float _1156 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    int _1158 = ~_1142;
    int _1160 = _1158 + _1154;
    int _1162 = _1160 + 1;
    float _1164 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1156);
    float _1166 = in.m_54.w;
    int _1168 = _767 * _1162;
    int _1170 = _1168 + _1108;
    float _1172 = _753 * 2.0;
    bool _1174 = !_811;
    int _1176 = _1174 ? _1170 : (-1);
    float _1178 = floor(_1172);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1184 = _1176 & 3;
    bool _1186 = _1184 != 0;
    bool _1188 = uint(_1184) > 1u;
    float _1190 = 1.0 / _1182;
    bool _1192 = _1166 > 0.5;
    int _1194 = _1186 ? 0 : 1;
    bool _1196 = _1092 > 0.5;
    bool _1198 = _1178 >= 0.0;
    bool _1200 = isnan(_1178);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan(0.0);
    bool _1206 = _1202 || _1204;
    float _1208 = -_227;
    int _1210 = _1196 ? as_type<int>(_1208) : as_type<int>(_227);
    bool _1212 = _1178 > 0.0;
    int _1214 = ~_1194;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    int _1220 = _1218;
    if (!_1188)
    {
        int _1222 = ~_1194;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = -_231;
    int _1230 = _1192 ? as_type<int>(_1228) : as_type<int>(_231);
    int _1232 = _1206 ? 0 : 1;
    bool _1234 = _753 > 0.5;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    int _1244 = ~_1232;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    bool _1250 = !_1238;
    float _1252 = _1250 ? _227 : as_type<float>(_1210);
    bool _1254 = !_1242;
    float _1256 = _1254 ? _231 : as_type<float>(_1230);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1268 = _1266 != 0;
    int _1270 = _1248;
    if (!_1212)
    {
        int _1272 = ~_1232;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1280 = _1278 != 0;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1292 = _1092 * 2.0;
    float _1294 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1290);
    float _1296 = -_227;
    int _1298 = _1234 ? as_type<int>(_1296) : as_type<int>(_227);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1302 = _747 + _1300;
    float _1304 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1294);
    float _1306 = _123 * _1132;
    float _1308 = floor(_1292);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1312 = _1310 != 0;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1316 = _1314 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1318 = _1302 * _833;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1328;
    float _1332 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _1334 = exp2(_1306);
    float _1336 = _1322 * _899;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1342;
    float _1346 = _1326 * _1190;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1350 = _743 + _1348;
    float _1352 = 0.0;
    if (!_1312)
    {
        _1352 = _1092;
    }
    float _1354 = _1352;
    float _1356 = _1340 * _903;
    float _1358 = 1.0 / _1316;
    float _1360 = _1354;
    if (!_1312)
    {
        _839 = _1092;
    }
    float _1362 = _839;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1368 = _1362;
    if (_1312)
    {
        _1360 = as_type<float>(_919);
    }
    float _1370 = _1360;
    float _1372 = fma(_817, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    if (_1312)
    {
        _1368 = as_type<float>(_919);
    }
    float _1374 = _1368;
    float _1376 = _1366 * _928;
    bool _1378 = _1308 >= 0.0;
    bool _1380 = isnan(_1308);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan(0.0);
    bool _1386 = _1382 || _1384;
    float _1388 = -_1334;
    float _1390 = _1388 + 1.0;
    float _1392 = fma(_847, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1394 = _1386 ? 0 : 1;
    float _1396 = _1330 * _958;
    bool _1398 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1412;
    float _1416 = _1344 * _1358;
    float _1418 = _1406 ? _1390 : 0.0;
    float _1420 = fma(_1410, _1318, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1422 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1424 = isnan(_743);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1436 = _743 + _1434;
    float _1438 = fma(_1336, _1350, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1440 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1442 = isnan(_743);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1414 * _978;
    float _1454 = -_1432;
    float _1456 = _1454 + 1.0;
    float _1458 = fma(_1346, _1436, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1462 = _743 + _1460;
    bool _1464 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1466 = isnan(_743);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1456;
    float _1478 = -_1450;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1356, _1462, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1484 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1486 = isnan(_743);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1492 = _1488 || _1490;
    float _1494 = float(_1492);
    float _1496 = fma(_1376, _763, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1498 = _1474 * _1480;
    float _1500 = -_1474;
    float _1502 = _1500 + 1.0;
    bool _1504 = _743 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1506 = isnan(_743);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1494;
    float _1518 = _1516 + 1.0;
    bool _1520 = _1308 > 0.0;
    float _1522 = _1494 * _1502;
    bool _1524 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1526 = isnan(_747);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1538 = _743 + _1536;
    float _1540 = _1514 * _1518;
    float _1542 = -_1514;
    float _1544 = _1542 + 1.0;
    bool _1546 = !_1264;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = -_1534;
    float _1552 = _1550 + 1.0;
    float _1554 = fma(_1396, _1538, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1558 = _743 + _1556;
    float _1560 = _829 * _1544;
    float _1562 = _859 * _1552;
    float _1564 = _875 * _863;
    float _1566 = -_875;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1416, _1558, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1572 = _1372 * _1562;
    float _1574 = _1420 * _1562;
    float _1576 = -_859;
    float _1578 = _1576 + 1.0;
    float _1580 = _897 * _1568;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _743 + _1582;
    float _1586 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1590 = _1438 * _1580;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1594 = 1.0 + _1592;
    float _1596 = -_897;
    float _1598 = _1596 + 1.0;
    float _1600 = fma(_1452, _1584, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1602 = _1392 * _1562;
    float _1604 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1590);
    float _1606 = 1.0 / _1594;
    float _1608 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1610 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1602);
    float _1612 = fma(_1458, _1564, _1604);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1616 = _917 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1618 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1610);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1622 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1588);
    float _1624 = -_1614;
    float _1626 = fma(_1616, 2.0, _1624);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1630 = as_type<float>(_919) * 2.0;
    bool _1632 = !_1284;
    float _1634 = _1632 ? _227 : as_type<float>(_1298);
    float _1636 = _753 + as_type<float>(_919);
    int _1638 = ~_1394;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1092 + as_type<float>(_919);
    int _1646 = _1642;
    if (!_1520)
    {
        int _1648 = ~_1394;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    float _1654 = _1636 + (-1.0);
    float _1656 = _1644 + (-1.0);
    float _1658 = floor(_1630);
    float _1660 = _1418 * _1606;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1664 = as_type<float>(_919) > 0.5;
    float _1666 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1668 = abs(_1548);
    float _1670 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1620);
    float _1672 = float(uint(_1078));
    float _1674 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1608);
    float _1676 = -_231;
    int _1678 = _1664 ? as_type<int>(_1676) : as_type<int>(_231);
    float _1680 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1682 = uint(_1184) >= 2u;
    float _1684 = as_type<float>(_877) * _1672;
    bool _1686 = !_1260;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1586);
    int _1692 = _1682 ? 0 : 1;
    float _1694 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1696 = _1658 > 0.0;
    float _1698 = trunc(_1684);
    float _1700 = precise::max(_1698, 0.0);
    uint _1702 = uint(_1700);
    bool _1704 = _1658 >= 0.0;
    bool _1706 = isnan(_1658);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = fma(_1554, _1560, _1612);
    int _1716 = abs(_1688);
    float _1718 = _1164 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1720 = ~_767;
    int _1722 = _1720 + 1;
    float _1724 = _1252 + 0.5;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = _1718 + _1726;
    float _1730 = float(_1668);
    float _1732 = -_123;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1626);
    float _1736 = float(_1276);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1740 = _1680 + _1738;
    float _1742 = float(_1716);
    float _1744 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1746 = float(_1652);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1734);
    float _1750 = _1730 * _1736;
    int _1752 = _1176 >> 31;
    float _1754 = _1742 * _1746;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1744);
    int _1758 = _1722 * int(_1702);
    int _1760 = _1758 + _1078;
    int _1762 = _1752 & 3;
    float _1764 = fma(_1694, -2.0, _1628);
    bool _1766 = !_1288;
    float _1768 = _1766 ? _231 : as_type<float>(_1678);
    float _1770 = fma(_1482, _1540, _1714);
    float _1772 = float(uint(_1760));
    float _1774 = _1256 + (-0.5);
    float _1776 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1764);
    int _1778 = _1176 + _1762;
    float _1780 = as_type<float>(_877) * _1772;
    float _1782 = fma(_1570, _1522, _1770);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1786 = _1778 >> 2;
    float _1788 = -_1774;
    float _1790 = -_1776;
    float _1792 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1790);
    float _1794 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1796 = trunc(_1780);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1786 << 4;
    int _1804 = _1802 + 512;
    float _1806 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1808 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1810 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1812 = uint(int(uint(_1804) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1794 + _1828;
    float _1832 = _1806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1834 = _1808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1756);
    float _1840 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1670);
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1844 = _1804 + 8;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    uint _1848 = uint(int(uint(int(_1846)) >> uint(2)));
    int _1850 = int(_1846) & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = int(_1846) + 1;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    int _1858 = _1854 & 3;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[int(_1856)][_1858];
    out.m_58.x = _1832;
    out.m_58.y = _1834;
    out.m_58.z = _1836;
    out.m_58.w = _1784;
    bool _1862 = _1838 >= 0.0;
    float _1864 = _1754 * (-2.0);
    int _1866 = _1712 ? 0 : 1;
    float _1868 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1622);
    int _1870 = int(_1702) + int(_1800);
    float _1872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1874 = ~_1866;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = -_1768;
    float _1882 = _1880 + 0.5;
    bool _1884 = _1184 != 3;
    float _1886 = in.m_60.x;
    float _1888 = in.m_60.y;
    float _1890 = in.m_60.z;
    int _1892 = _1878;
    if (!_1696)
    {
        int _1894 = ~_1866;
        int _1896 = _1894 + 1;
        _1892 = _1896;
    }
    int _1898 = _1892;
    float _1900 = _1634 + 0.5;
    int _1902 = _1176 & 3;
    bool _1904 = _1902 != 0;
    float _1906 = -_1840;
    float _1908 = _1906 + 1.0;
    int _1910 = ~_767;
    int _1912 = _1910 + 1;
    float _1914 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1916 = -_1868;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1256, _1908, _1792);
    float _1922 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1924 = !_1904;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1914 * _1842;
    int _1930 = abs(_1226);
    int _1932 = _1912 * _1870;
    int _1934 = _1932 + _1078;
    float _1936 = -_1918;
    float _1938 = fma(_1252, _1936, _1748);
    float _1940 = _1922 * _1872;
    float _1942 = fma(_1496, _1498, _1782);
    int _1944 = ~_1692;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = fma(_1662, _1864, _1662);
    bool _1952 = uint(_1934) >= uint(_767);
    out.m_62.x = _1928;
    out.m_62.y = _1940;
    out.m_62.z = _1938;
    out.m_62.w = _1920;
    int _1954 = _1948;
    if (_1884)
    {
        int _1956 = ~_1692;
        int _1958 = _1956 + 1;
        _1954 = _1958;
    }
    int _1960 = _1954;
    float _1962 = fma(_1600, _1476, _1942);
    bool _1964 = !_1952;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = fma(_1864, _1886, _1886);
    bool _1970 = _1184 != 3;
    float _1972 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1962);
    int _1974 = abs(_1926);
    float _1976 = _1750 * (-2.0);
    int _1978 = ~_1930;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    if (_1862)
    {
        out.m_45.x = 0.0;
    }
    int _1984 = abs(_1960);
    float _1986 = fma(_1666, _1976, _1666);
    int _1988 = ~_1870;
    int _1990 = _1988 + _1966;
    int _1992 = _1990 + 1;
    int _1994 = _1982 * as_type<int>(_1826);
    bool _1996 = !_1970;
    int _1998 = _1996 ? 0 : (-1);
    out.m_64.x = _1972;
    int _2000 = ~_1974;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = fma(_1976, _1888, _1888);
    bool _2008 = !_1280;
    int _2010 = _2008 ? 0 : 1;
    float _2012 = as_type<float>(_919) + (-0.5);
    int _2014 = abs(_1998);
    int _2016 = _2004 * as_type<int>(_1818);
    int _2018 = _2016 + _1994;
    float _2020 = _1728 * _1728;
    int _2022 = abs(_2010);
    float _2024 = _753 + (-0.5);
    int _2026 = ~_1984;
    int _2028 = _2026 + 1;
    int _2030 = _2028 + 1;
    float _2032 = fma(_1740, _1740, _2020);
    int _2034 = ~_2014;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    int _2042 = _767 * _1992;
    int _2044 = _2042 + _1078;
    float _2046 = fma(_1830, _1830, _2032);
    int _2048 = _2030 * as_type<int>(_1852);
    int _2050 = _2048 + _2018;
    int _2052 = ~_2022;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    float _2058 = _779 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2060 = _767 == 0;
    int _2062 = _2038 * as_type<int>(_1860);
    int _2064 = _2062 + _2050;
    float _2066 = rsqrt(_2046);
    float _2068 = as_type<float>(_2018);
    if (_1862)
    {
        _2068 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2070 = _2068;
    bool _2072 = !_2060;
    int _2074 = _2072 ? _2044 : (-1);
    int _2076 = _2056 * _2064;
    bool _2078 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2080 = isnan(1.0);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2086 = _2082 || _2084;
    int _2088 = as_type<int>(_2070);
    if (_1862)
    {
        float _2090 = _2070 * 5.0;
        _2088 = as_type<int>(_2090);
    }
    int _2092 = _2088;
    int _2094 = _2074 * _2022;
    int _2096 = _2094 + _2076;
    bool _2098 = !_2086;
    float _2100 = _2098 ? _123 : _1660;
    bool _2102 = !_1268;
    int _2104 = _2102 ? 0 : 1;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6425 = as_type<float>(_2092);
        out.gl_Position.z = _6425;
    }
    float _2106 = float(_2096);
    float _2108 = fma(_2100, _1950, _2040);
    float _2110 = _2058 * _2066;
    out.m_66.y = _2106;
    float _2112 = _1740 * _2110;
    float _2114 = _1728 * _2110;
    int _2116 = abs(_2104);
    if (_1862)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2118 = -_2114;
    float _2120 = _1718 + _2118;
    float _2122 = _1830 * _2110;
    float _2124 = -_2112;
    float _2126 = _1680 + _2124;
    float _2128 = _2108 * 0.15915493667125701904296875;
    float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2132 = _2120 + _2130;
    float _2134 = -_2122;
    float _2136 = _1794 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2140 = _2126 + _2138;
    float _2142 = float(_2116);
    float _2144 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2148 = _2136 + _2146;
    float _2150 = float(_1898);
    float _2152 = -_2114;
    float _2154 = _1728 + _2152;
    float _2156 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2144);
    float _2158 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2006);
    float _2160 = -_2112;
    float _2162 = _1740 + _2160;
    float _2164 = _2142 * _2150;
    float _2166 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2156);
    float _2168 = _2154 * _2154;
    float _2170 = _753 + _1092;
    float _2172 = _2164 * (-2.0);
    float _2174 = fma(_2100, _1986, _2158);
    bool _2176 = _2166 >= 0.0;
    float _2178 = fma(_2162, _2162, _2168);
    float _2180 = -_2122;
    float _2182 = _1830 + _2180;
    float _2184 = _1092 + (-0.5);
    float _2186 = _2170 + (-1.0);
    float _2188 = fma(_2172, _1890, _1890);
    float _2190 = _2174 * 0.15915493667125701904296875;
    float _2192 = fma(_2182, _2182, _2178);
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2188);
    float _2198 = _2128 * 6.283185482025146484375;
    float _2200 = sin(_2198);
    float _2202 = _2144;
    int _2204 = as_type<int>(_2188);
    float _2206 = _2140;
    float _2208 = _2136;
    if (_2176)
    {
        _2202 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2210 = _2202;
    float _2212 = fma(_2194, _2172, _2194);
    if (_2176)
    {
        out.m_45.x = 0.0;
    }
    if (_2176)
    {
        float _2214 = _2210 * 5.0;
        _2204 = as_type<int>(_2214);
    }
    int _2216 = _2204;
    float _2218 = _2128 * 6.283185482025146484375;
    float _2220 = cos(_2218);
    float _2222 = fma(_2100, _2212, _2196);
    if (_2176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6618 = as_type<float>(_2216);
        out.gl_Position.z = _6618;
    }
    float _2224 = _2222 * 0.15915493667125701904296875;
    float _2226 = _2190 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = sqrt(_2192);
    float _2232 = _2190 * 6.283185482025146484375;
    float _2234 = cos(_2232);
    if (_2176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2236 = _2224 * 6.283185482025146484375;
    float _2238 = cos(_2236);
    float _2240 = _2066 * _2230;
    float _2242 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _2246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _2248 = _779 * _2240;
    float _2250 = _2240 * _2242;
    float _2252 = _2220 * _2234;
    float _2254 = _2224 * 6.283185482025146484375;
    float _2256 = sin(_2254);
    float _2258 = _2246 * _2248;
    float _2260 = _2244 * _2250;
    float _2262 = _2200 * _2228;
    float _2264 = _2220 * _2228;
    float _2266 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2268 = _2266 * 0.5;
    float _2270 = _2238 * _2260;
    float _2272 = _2228 * _2238;
    float _2274 = _2234 * _2238;
    float _2276 = _2200 * _2234;
    float _2278 = _2220 * _2270;
    float _2280 = fma(_2256, _2252, _2262);
    float _2282 = -_2260;
    float _2284 = _2256 * _2282;
    float _2286 = -_2276;
    float _2288 = fma(_2256, _2264, _2286);
    float _2290 = -_2264;
    float _2292 = fma(_2256, _2276, _2290);
    float _2294 = fma(_2280, _2258, _2278);
    float _2296 = _2200 * _2270;
    float _2298 = fma(_2274, _2258, _2284);
    float _2300 = fma(_2256, _2262, _2252);
    float _2302 = fma(_2288, _2268, _2294);
    float _2304 = fma(_2292, _2258, _2296);
    float _2306 = fma(_2272, _2268, _2298);
    float _2308 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2310 = fma(_2300, _2268, _2304);
    float _2312 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2314 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2308);
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2312);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2314);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2316);
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2324 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2326 = _1794 + _2322;
    float _2328 = _1680 + _2324;
    float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2332 = _2326 + _2330;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2336 = _2328 + _2334;
    float _2338 = _2332 * _2332;
    float _2340 = fma(_2336, _2336, _2338);
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2344 = sqrt(_2340);
    float _2346 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2342);
    float _2348 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2350 = _2348 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2352 = _1718 + _2350;
    bool _2354 = _2344 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2324;
    float _2358 = _2350;
    float _2360 = _2328;
    float _2362 = _2336;
    float _2364 = _2332;
    float _2366 = _2340;
    float _2368 = _2352;
    if (!_2354)
    {
        _2356 = _2326;
    }
    float _2370 = _2356;
    float _2372 = _2370;
    if (!_2354)
    {
        _2358 = _2352;
    }
    float _2374 = _2358;
    bool _2376 = !_2354;
    float _2378 = _2374;
    if (!_2376)
    {
        float _2380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2384 = _2344 + _2382;
        float _2386 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2388 = rsqrt(_2340);
        float _2390 = _2384 * _2380;
        float _2392 = _2390 * 0.15915493667125701904296875;
        float _2394 = _2392 * 6.283185482025146484375;
        float _2396 = cos(_2394);
        float _2398 = _2392 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        float _2402 = _2396 + (-1.0);
        float _2404 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2406 = fma(_2400, _2386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2408 = fma(_2352, _2396, _2404);
        float _2410 = _2388 * _2406;
        float _2412 = fma(_2336, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2414 = fma(_2332, _2410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2378 = _2408;
        _2360 = _2412;
        _2372 = _2414;
    }
    float _2416 = _2378;
    float _2418 = _2360;
    float _2420 = _2372;
    float _2422 = -_1718;
    float _2424 = _2422 + _2416;
    float _2426 = -_1680;
    float _2428 = _2426 + _2418;
    float _2430 = -_1794;
    float _2432 = _2430 + _2420;
    float _2434 = _2424 * _2424;
    float _2436 = fma(_2428, _2428, _2434);
    float _2438 = fma(_2432, _2432, _2436);
    float _2440 = sqrt(_2438);
    bool _2442 = _2440 > 0.0;
    float _2444 = _2440;
    float _2446 = _2418;
    if (!_2442)
    {
        _2444 = _2416;
    }
    float _2448 = _2444;
    float _2450 = _2448;
    float _2452 = _2448;
    float _2454 = _2448;
    if (!_2442)
    {
        _2362 = _2420;
    }
    float _2456 = _2362;
    bool _2458 = !_2442;
    float _2460 = _2456;
    if (!_2458)
    {
        bool _2462 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2464 = _2456;
        if (_2462)
        {
            float _2466 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2464 = _2466;
        }
        float _2468 = _2464;
        float _2470 = _2468;
        float _2472 = _2468;
        if (_2462)
        {
            float _2474 = _441 * _2468;
            _2364 = _2474;
        }
        float _2476 = _2364;
        float _2478 = _2476;
        if (_2462)
        {
            float _2480 = _443 * _2468;
            _2366 = _2480;
        }
        float _2482 = _2366;
        float _2484 = _2482;
        if (_2462)
        {
            float _2486 = _445 * _2468;
            _2368 = _2486;
        }
        float _2488 = _2368;
        float _2490 = _2488;
        if (!_2462)
        {
            bool _2492 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2494 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2496 = _2492 || _2494;
            bool _2498 = isnan(1.0);
            bool _2500 = _2496 || _2498;
            float _2502 = _123 + 1.0;
            float _2504 = _2502;
            if (!_2500)
            {
                float _2506 = _2502 * _2502;
                float _2508 = _2506 * 0.5;
                _127 = _2508;
            }
            float _2510 = _127;
            float _2512 = _2510;
            if (!_2500)
            {
                float _2514 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2512 = _2514;
            }
            float _2516 = _2512;
            bool _2518 = !_2500;
            float _2520 = _2516;
            if (!_2518)
            {
                float _2522 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2524 = log2(_2522);
                float _2526 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2528 = 1.0 + _2526;
                float _2530 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2532 = _2524 * _2502;
                float _2534 = 1.0 / _2528;
                float _2536 = _2530 * 0.693147182464599609375;
                float _2538 = exp2(_2532);
                float _2540 = 1.0 / _2536;
                float _2542 = _2538 + (-1.0);
                float _2544 = -_2542;
                float _2546 = fma(_2544, _2540, _2502);
                float _2548 = _2546 * _2534;
                float _2550 = _2548 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2520 = _2550;
                _2450 = _2540;
            }
            float _2552 = _2520;
            float _2554 = _2450;
            float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2558 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2560 = !_2500;
            float _2562 = _2554;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = 1.0 / _2570;
                float _2574 = _2566 * _2502;
                float _2576 = exp2(_2574);
                float _2578 = -_2576;
                float _2580 = _2578 + 1.0;
                float _2582 = _2580 * _2572;
                _2504 = _2582;
                _2562 = _2570;
                _2470 = _2574;
            }
            float _2584 = _2504;
            float _2586 = _2562;
            float _2588 = _2470;
            float _2590 = fma(_2584, _163, _2558);
            float _2592 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2594 = fma(_2584, _161, _2556);
            float _2596 = -_399;
            float _2598 = _2596 + _2590;
            float _2600 = fma(_2584, _165, _2592);
            float _2602 = -_403;
            float _2604 = _2602 + _2594;
            float _2606 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2608 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2610 = _2598 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2612 = -_405;
            float _2614 = _2612 + _2600;
            float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2606);
            float _2618 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2608);
            float _2620 = fma(_2604, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2610);
            float _2622 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2616);
            float _2624 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2618);
            float _2626 = fma(_2614, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2620);
            _449 = _2624;
            _451 = _2622;
            _453 = _2626;
            _2478 = _2622;
            _2484 = _2624;
            _2490 = _2626;
            _2452 = _2586;
            _2472 = _2588;
        }
        float _2628 = _449;
        float _2630 = _451;
        float _2632 = _453;
        float _2634 = _2478;
        float _2636 = _2484;
        float _2638 = _2490;
        float _2640 = _2452;
        float _2642 = _2472;
        float _2644 = _2628 * _2628;
        float _2646 = rsqrt(_2438);
        float _2648 = fma(_2630, _2630, _2644);
        float _2650 = fma(_2632, _2632, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = _2428 * _2646;
        float _2656 = _2424 * _2646;
        float _2658 = _2432 * _2646;
        bool _2660 = _2652 > 0.0;
        float _2662 = _2640;
        float _2664 = _2642;
        if (!_2660)
        {
            _2662 = _2416;
        }
        float _2666 = _2662;
        _2454 = _2666;
        if (!_2660)
        {
            _2664 = _2420;
        }
        float _2668 = _2664;
        bool _2670 = !_2660;
        _2460 = _2668;
        if (!_2670)
        {
            float _2672 = rsqrt(_2650);
            float _2674 = _2672 * _2628;
            float _2676 = _2672 * _2630;
            float _2678 = _2672 * _2632;
            float _2680 = _2656 * _2674;
            float _2682 = fma(_2654, _2676, _2680);
            float _2684 = fma(_2658, _2678, _2682);
            float _2686 = _2684 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2688 = fma(_2634, _2686, _2418);
            float _2690 = fma(_2636, _2686, _2416);
            float _2692 = fma(_2638, _2686, _2420);
            _2454 = _2690;
            _2460 = _2692;
            _2446 = _2688;
        }
    }
    float _2694 = _2454;
    float _2696 = _2460;
    float _2698 = _2446;
    float _2700 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2704 = isnan(0.5);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2710 = _2706 || _2708;
    float _2712 = -_2114;
    float _2714 = _2712 + _2694;
    bool _2716 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2718 = isnan(0.5);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2724 = _2720 || _2722;
    float _2726 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2700);
    float _2728 = -_2122;
    float _2730 = _2728 + _2696;
    float _2732 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2726);
    float _2734 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2736 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2738 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2734);
    float _2740 = 1.0 / _2736;
    float _2742 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2738);
    float _2744 = _2742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2746 = _2744 + _2736;
    float _2748 = _2746 * _2740;
    float _2750 = _2748 * 0.5;
    float _2752 = -_2112;
    float _2754 = _2752 + _2698;
    float _2756 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2758 = fma(_2750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2756);
    float _2760 = _2750;
    float _2762 = _2714;
    float _2764 = _2754;
    float _2766 = _2730;
    float _2768 = _2736;
    if (_2724)
    {
        _2760 = 1.0;
    }
    float _2770 = _2760;
    float _2772 = 1.0 / _2758;
    float _2774 = _2770;
    if (!_2710)
    {
        float _2776 = _2132 * _2132;
        float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2780 = -_1794;
        float _2782 = _2780 + _2696;
        float _2784 = -_1680;
        float _2786 = _2784 + _2698;
        float _2788 = fma(_2140, _2140, _2776);
        float _2790 = -_1718;
        float _2792 = _2790 + _2694;
        float _2794 = fma(_2148, _2148, _2788);
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2798 = sqrt(_2794);
        float _2800 = 1.0 / _2240;
        float _2802 = _2796 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2804 = precise::min(_2798, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2806 = _2804 * _2778;
        float _2808 = _2806 * _2800;
        float _2810 = _2802 * _2808;
        float _2812 = _2782 * _2808;
        float _2814 = fma(_2786, _2810, _2126);
        float _2816 = fma(_2792, _2810, _2120);
        float _2818 = fma(_2802, _2812, _2136);
        _2762 = _2816;
        _2764 = _2814;
        _2766 = _2818;
        _2206 = _2798;
        _2768 = _2808;
    }
    float _2820 = _2762;
    float _2822 = _2764;
    float _2824 = _2766;
    float _2826 = _2206;
    float _2828 = _2768;
    float _2830 = _2828;
    float _2832 = _2826;
    if (_2724)
    {
        _2830 = 1.0;
    }
    float _2834 = _2830;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = _2772 * _2836;
    float _2840 = _2834;
    if (!_2724)
    {
        float _2842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2844 = _2842 * 0.15915493667125701904296875;
        float _2846 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = _2844 * 6.283185482025146484375;
        float _2850 = cos(_2848);
        float _2852 = _2846 * 0.15915493667125701904296875;
        float _2854 = _2844 * 6.283185482025146484375;
        float _2856 = sin(_2854);
        float _2858 = 1.0 / _2850;
        float _2860 = _2852 * 6.283185482025146484375;
        float _2862 = cos(_2860);
        float _2864 = _2856 * _2858;
        float _2866 = _2852 * 6.283185482025146484375;
        float _2868 = sin(_2866);
        float _2870 = _2862 * _2864;
        float _2872 = 1.0 / _2870;
        float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2876 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2874;
        float _2878 = 1.0 / _2876;
        float _2880 = _2868 * _2872;
        float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2884 = fma(_2838, _2880, _2882);
        float _2886 = _2884 * _2878;
        float _2888 = precise::clamp(_2886, 0.0, 1.0);
        _2208 = _2878;
        _2774 = _2888;
    }
    float _2890 = _2208;
    float _2892 = _2774;
    float _2894 = _2890;
    if (!_2724)
    {
        float _2896 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2898 = _2896 * 0.15915493667125701904296875;
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2902 = _2898 * 6.283185482025146484375;
        float _2904 = cos(_2902);
        float _2906 = _2900 * 0.15915493667125701904296875;
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        float _2912 = 1.0 / _2904;
        float _2914 = _2906 * 6.283185482025146484375;
        float _2916 = cos(_2914);
        float _2918 = _2910 * _2912;
        float _2920 = _2906 * 6.283185482025146484375;
        float _2922 = sin(_2920);
        float _2924 = _2916 * _2918;
        float _2926 = 1.0 / _2924;
        float _2928 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2930 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2928;
        float _2932 = 1.0 / _2930;
        float _2934 = _2922 * _2926;
        float _2936 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2938 = fma(_2838, _2934, _2936);
        float _2940 = _2938 * _2932;
        float _2942 = precise::clamp(_2940, 0.0, 1.0);
        float _2944 = -_2942;
        float _2946 = _2944 + 1.0;
        _2832 = _2934;
        _2894 = _2912;
        _2840 = _2946;
    }
    float _2948 = _2832;
    float _2950 = _2894;
    float _2952 = _2840;
    float _2954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2956 = _2820 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2960 = _2822 + _2958;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2964 = _2824 + _2962;
    float _2966 = _2956 * _2956;
    float _2968 = fma(_2960, _2960, _2966);
    float _2970 = fma(_2964, _2964, _2968);
    float _2972 = rsqrt(_2970);
    float _2974 = sqrt(_2970);
    float _2976 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2978 = _2960 * _2976;
    float _2980 = _2964 * _2976;
    float _2982 = _2978 * _2978;
    float _2984 = _2980 * _2980;
    float _2986 = _2982 + _2984;
    float _2988 = sqrt(_2986);
    bool _2990 = _2988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = _2988 + _2992;
    float _2996 = _2972;
    float _2998 = _2994;
    float _3000 = _2948;
    float _3002 = _2956;
    float _3004 = _2976;
    if (_2990)
    {
        float _3006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2996 = _3006;
    }
    float _3008 = _2996;
    float _3010 = _3008;
    if (_2990)
    {
        float _3012 = _2994 * _3008;
        _2998 = _3012;
    }
    float _3014 = _2998;
    if (_2990)
    {
        float _3016 = rsqrt(_2986);
        _3010 = _3016;
    }
    float _3018 = _3010;
    float _3020 = _3018;
    if (_2990)
    {
        float _3022 = _3014 * 0.15915493667125701904296875;
        _3000 = _3022;
    }
    float _3024 = _3000;
    float _3026 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3028 = _2964;
    float _3030 = _3024;
    if (_2990)
    {
        float _3032 = _3024 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        _3028 = _3034;
    }
    float _3036 = _3028;
    float _3038 = precise::max(0.0, _3026);
    float _3040 = _2950;
    float _3042 = _3038;
    if (_2990)
    {
        float _3044 = _3024 * 6.283185482025146484375;
        float _3046 = cos(_3044);
        _3040 = _3046;
    }
    float _3048 = _3040;
    float _3050 = -_2976;
    float _3052 = -_3038;
    float _3054 = fma(_2956, _3050, _3052);
    if (_2990)
    {
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3002 = _3056;
    }
    float _3058 = _3002;
    float _3060 = _3036;
    float _3062 = _3058;
    if (_2990)
    {
        float _3064 = fma(_3036, _3058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3060 = _3064;
    }
    float _3066 = _3060;
    float _3068 = _3066;
    if (!_2990)
    {
        _3062 = _3054;
    }
    float _3070 = _3062;
    float _3072 = _3070;
    if (_2990)
    {
        float _3074 = _3018 * _3066;
        _3004 = _3074;
    }
    float _3076 = _3004;
    if (!_2990)
    {
        _3020 = _2978;
    }
    float _3078 = _3020;
    float _3080 = _3078;
    float _3082 = _3048;
    if (_2990)
    {
        float _3084 = _3048 + (-1.0);
        _3042 = _3084;
    }
    float _3086 = _3042;
    float _3088 = _3086;
    if (_2990)
    {
        float _3090 = _2978 * _3076;
        _3080 = _3090;
    }
    float _3092 = _3080;
    if (!_2990)
    {
        _3068 = _2982;
    }
    float _3094 = _3068;
    float _3096 = _3094;
    if (_2990)
    {
        float _3098 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3030 = _3098;
    }
    float _3100 = _3030;
    if (!_2990)
    {
        _3088 = _2980;
    }
    float _3102 = _3088;
    float _3104 = _3102;
    if (_2990)
    {
        float _3106 = _2980 * _3076;
        _3104 = _3106;
    }
    float _3108 = _3104;
    if (_2990)
    {
        float _3110 = _3092 * _3092;
        _3096 = _3110;
    }
    float _3112 = _3096;
    if (_2990)
    {
        float _3114 = fma(_3054, _3048, _3100);
        _3072 = _3114;
    }
    float _3116 = _3072;
    if (!_2990)
    {
        _3082 = _2984;
    }
    float _3118 = _3082;
    float _3120 = _3118;
    if (_2990)
    {
        float _3122 = _3108 * _3108;
        _3120 = _3122;
    }
    float _3124 = _3120;
    float _3126 = fma(_3116, _3116, _3112);
    float _3128 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3130 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3132 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3134 = _3126 + _3124;
    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3138 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3136);
    float _3140 = precise::clamp(_3138, 0.0, 1.0);
    float _3142 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3128);
    float _3144 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3146 = rsqrt(_3134);
    float _3148 = -_3140;
    float _3150 = _3148 + 1.0;
    float _3152 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3132);
    float _3154 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3142);
    float _3156 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3158 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3144);
    float _3160 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3152);
    float _3162 = _3154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3164 = fma(_2822, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3156);
    float _3166 = abs(_3150);
    float _3168 = log2(_3166);
    float _3170 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3158);
    float _3172 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3174 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3176 = fma(_2824, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3164);
    float _3178 = _3170 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3180 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3182 = _3146 * _3092;
    float _3184 = -_3174;
    float _3186 = fma(_3184, _3130, 1.0);
    float _3188 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3190 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3180);
    float _3192 = _3146 * _3116;
    float _3194 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3196 = _3146 * _3108;
    float _3198 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3190);
    float _3200 = log2(_3186);
    float _3202 = -_3194;
    float _3204 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3202);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3208 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3198);
    float _3210 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3212 = -_3196;
    float _3214 = fma(_3212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3204);
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3218 = exp2(_3206);
    float _3220 = fma(_3214, -0.5, 0.5);
    float _3222 = fma(_3214, 0.5, 0.5);
    float _3224 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3216);
    float _3226 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3210);
    float _3228 = _3192 + 1.0;
    float _3230 = fma(_3222, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3232 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3224);
    float _3234 = 1.0 / _3208;
    float _3236 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3226);
    float _3238 = fma(_3222, _3230, -0.212114393711090087890625);
    float _3240 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3232);
    float _3242 = _3200 * 0.693147182464599609375;
    float _3244 = fma(_3222, _3238, 1.570728778839111328125);
    float _3246 = sqrt(_3220);
    float _3248 = -_3192;
    float _3250 = fma(_3218, _3228, _3248);
    float _3252 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3236);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_3250, 0.5, 0.5);
    float _3258 = _3240 * _3234;
    float _3260 = _3252 * _3234;
    float _3262 = fma(_3258, 0.5, 0.5);
    float _3264 = fma(_3260, -0.5, 0.5);
    float _3266 = _3246 * 0.636619746685028076171875;
    float _3268 = -_3244;
    float _3270 = fma(_3266, _3268, 1.0);
    float3 _8222 = float3(_3262, _3264, _3254);
    float _3272 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8222, float3(0.0), isnan(_8222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8222, float3(0.0), isnan(_8222)), level(0.0)).x;
    float3 _8233 = float3(_3262, _3264, _3254);
    float4 _3275 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8233, float3(0.0), isnan(_8233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8233, float3(0.0), isnan(_8233)), level(0.0)).xyzw;
    float _3277 = _3275.x;
    float _3279 = _3275.y;
    float _3281 = _3275.z;
    float _3283 = _3275.w;
    float2 _8250 = float2(_3270, _3256);
    float3 _3287 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8250, float2(0.0), isnan(_8250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8250, float2(0.0), isnan(_8250)), level(0.0)).xyz;
    float _3289 = _3287.x;
    float _3291 = _3287.y;
    float _3293 = _3287.z;
    float _3295 = _3172 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3297 = _2892 > 0.0;
    bool _3299 = isnan(_2892);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(0.0);
    bool _3305 = _3301 || _3303;
    float _3307 = fma(_3178, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3295);
    float _3309 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3311 = _2952 <= 0.0;
    bool _3313 = !_3305;
    bool _3315 = _3311 || _3313;
    float _3317 = _3240 + _3208;
    float _3319 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3307);
    float _3321 = _2892 * _2952;
    float _3323 = exp2(_3309);
    float _3325 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3319);
    float _3327 = _3321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3329 = _3208 * 0.5;
    float _3331 = _3325 + _3208;
    float _3333 = _3317 * 0.5;
    out.gl_Position.x = _3240;
    out.gl_Position.y = _3252;
    out.gl_Position.z = _3325;
    out.gl_Position.w = _3208;
    float _3335 = _3331 * 0.5;
    float _3337 = -_3323;
    float _3339 = _3337 + 1.0;
    float _3341 = fma(_3252, -0.5, _3329);
    float _3343 = _3327 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3345 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3333;
    out.m_68.y = _3341;
    out.m_68.z = _3335;
    out.m_68.w = _3208;
    float _3347 = -_3345;
    float _3349 = _3347 + 1.0;
    out.m_45.x = _3343;
    float _3351 = _3345 * _3272;
    float _3353 = _3283 * _3349;
    float _3355 = _3283 * _3351;
    float _3357 = _3293 * _3351;
    float _3359 = fma(_3289, _3355, _3277);
    float _3361 = fma(_3291, _3355, _3279);
    float _3363 = fma(_3283, _3357, _3281);
    out.m_70.x = _3359;
    out.m_70.y = _3361;
    out.m_70.z = _3363;
    out.m_70.w = _3353;
    if (!_3315)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3365 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3365;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

