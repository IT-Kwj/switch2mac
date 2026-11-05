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
    float4 m_70 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn9)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    bool _889 = false;
    bool _747 = false;
    bool _499 = false;
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
        float _3882 = as_type<float>(_107);
        out.gl_Position.z = _3882;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
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
        out.m_45.x = 0.0;
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
        float _3952 = as_type<float>(_145);
        out.gl_Position.z = _3952;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _149 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _149);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _273 = !_161;
    float _275 = _271;
    float _277 = _269;
    if (!_273)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _149 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _213 = _297;
    }
    float _299 = _213;
    float _301 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _299;
    if (!_161)
    {
        float _311 = _125 * _125;
        float _313 = _311 * 0.5;
        _275 = _313;
    }
    float _315 = _275;
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _305);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_161;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _125 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _125);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _317);
    float _369 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _377 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _379 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].y, _375);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _377);
    float _387 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _163, _367);
    float _391 = fma(_299, _165, _369);
    float _393 = fma(_299, _167, _379);
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].x, _381);
    float _397 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].y, _383);
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_161)
    {
        _309 = _125;
    }
    float _401 = _309;
    bool _403 = !_161;
    float _405 = _401;
    if (!_403)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _125 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _405 = _425;
    }
    float _427 = _405;
    float _429 = fma(_427, _165, _397);
    float _431 = fma(_427, _163, _395);
    float _433 = fma(_427, _167, _399);
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = fma(_391, _151, _171);
    float _439 = -_429;
    float _441 = _391 + _439;
    float _443 = fma(_389, _151, _169);
    float _445 = -_431;
    float _447 = _389 + _445;
    float _449 = -_433;
    float _451 = _393 + _449;
    float _453 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _455 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = fma(_393, _151, _173);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    bool _473 = !_435;
    float _475 = _469;
    float _477 = _467;
    float _479 = _471;
    float _497;
    if (!_473)
    {
        float _481 = in.m_54.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        float _501 = float(_91);
        float _503 = 1.0 / _501;
        float _505 = _125 * _503;
        _497 = _505;
    }
    _499 = false;
    float _507 = _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _507 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _533 = 1.0 / _519;
    bool _535 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _537 = isnan(_507);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _523;
    float _551 = 1.0 / _527;
    float _553 = _511 * _533;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _507 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _507 + _559;
    float _563 = 1.0 / _531;
    float _565 = _515 * _549;
    bool _567 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_507);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _557 * _551;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    bool _585 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_507);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_545;
    float _599 = _597 + 1.0;
    float _601 = fma(_583, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _577 * _599;
    float _609 = _561 * _563;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _623 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_507);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_613, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _637 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _639 = isnan(_507);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _595 * _617;
    float _651 = -_595;
    float _653 = _651 + 1.0;
    float _655 = fma(_605, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _657 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _659 = _647 * _653;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = -_633;
    float _667 = _665 + 1.0;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _673;
    float _677 = _633 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = fma(_675, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _601 * _677;
    float _687 = _635 * _677;
    float _689 = fma(_681, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _695 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _697 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].y, _687);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _703 = fma(_693, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_655, _659, _695);
    float _707 = fma(_657, _659, _697);
    float _709 = fma(_701, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _711 = fma(_689, _649, _705);
    float _713 = fma(_683, _649, _707);
    float _715 = fma(_703, _607, _711);
    float _717 = fma(_709, _607, _713);
    float _719 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].x, _715);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].y, _717);
    float _723 = _719 * _669;
    float _725 = _721 * _671;
    bool _727 = !_547;
    float _745;
    if (!_727)
    {
        float _729 = in.m_54.x;
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_91);
        float _751 = 1.0 / _749;
        float _753 = _125 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _759 = _755 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _765 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _781 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _783 = isnan(_755);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _793;
    bool _797 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _799 = isnan(_755);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = 1.0 / _763;
    float _811 = -_775;
    float _813 = _811 + 1.0;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _817 = 1.0 / _779;
    float _819 = _795 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _825 = fma(_819, _759, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _827 = _791 * _813;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = -_791;
    float _835 = _833 + 1.0;
    float _837 = _823 * _817;
    float _839 = _825 * _827;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _755 + _841;
    float _845 = _775 * _831;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _849 = fma(_837, _843, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_849, _845, _847);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _859 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[117].x, _851);
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _861;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _867;
    bool _869 = !_815;
    float _887;
    if (!_869)
    {
        float _871 = in.m_54.x;
        float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _879 = _877 * _873;
        float _881 = floor(_879);
        float _883 = -_881;
        float _885 = _879 + _883;
        _887 = _885;
        _889 = true;
    }
    else
    {
        float _891 = float(_91);
        float _893 = 1.0 / _891;
        float _895 = _125 * _893;
        _887 = _895;
    }
    _889 = false;
    float _897 = _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _901 = _897 + _899;
    bool _903 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_897);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _915;
    bool _919 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _921 = isnan(_897);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_913;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _935;
    float _939 = 1.0 / _917;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = _929 * _933;
    float _945 = -_929;
    float _947 = _945 + 1.0;
    float _949 = _901 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = fma(_937, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_953, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _963 = fma(_959, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _965 = _955 * _943;
    float _967 = _963 * _943;
    float _969 = _961 * _943;
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _973 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].y, _967);
    float _975 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].z, _969);
    float _977 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].x, _971);
    float _979 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].y, _973);
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].z, _975);
    bool _983 = !_941;
    float _1007;
    float _1009;
    float _1011;
    if (!_983)
    {
        float _985 = in.m_54.x;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _989 = float(_91);
        float _991 = 1.0 / _989;
        float _993 = _985 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _995 = _125 * _991;
        float _997 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _999 = _997 * _987;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _995;
        _1009 = _1005;
        _1011 = _989;
        _1013 = true;
    }
    else
    {
        float _1015 = float(_91);
        float _1017 = 1.0 / _1015;
        float _1019 = _125 * _1017;
        _1007 = _1019;
        _1009 = _1019;
        _1011 = _1015;
    }
    _1013 = false;
    float _1021 = _1007;
    float _1023 = _1009;
    float _1025 = _1011;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1029 = int(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1033 = _1021 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1037 = _1021 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1045 = int(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1057 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1059 = isnan(_1023);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1071 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1073 = isnan(_1023);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = 1.0 / _1025;
    float _1085 = float(_1029);
    bool _1087 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1089 = isnan(_1021);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    bool _1099 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1101 = isnan(_1021);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1113 = isnan(_1021);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = 1.0 / _1085;
    float _1125 = float(uint(_1045));
    int _1127 = ~_1045;
    int _1129 = _1127 + 1;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    bool _1135 = _1045 == 0;
    float _1137 = 1.0 / _1125;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1141 = _125 * _1123;
    float _1143 = 1.0 / _1041;
    int _1145 = as_type<int>(_1137) + (-2);
    float _1147 = trunc(_1141);
    int _1149 = int(_1147);
    float _1151 = 1.0 / _1049;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1155 = _1153 != 0;
    float _1157 = 1.0 / _1053;
    float _1159 = float(uint(_1149));
    bool _1161 = !_1155;
    float _1163 = _1161 ? 1.2345600128173828125 : 1.0;
    float _1165 = as_type<float>(_1145) * _1159;
    float _1167 = in.m_54.x;
    float _1169 = in.m_54.y;
    float _1171 = in.m_54.z;
    float _1173 = in.m_54.w;
    float _1175 = trunc(_1165);
    float _1177 = precise::max(_1175, 0.0);
    uint _1180 = uint(_1177);
    int _1182 = ~_1045;
    int _1184 = _1182 + 1;
    int _1186 = _1129 * int(_1180);
    int _1188 = _1186 + _1149;
    float _1190 = float(uint(_1188));
    float _1192 = _1167 * 2.0;
    bool _1194 = !_1155;
    float _1196 = _1194 ? _1169 : _1167;
    float _1198 = 0.0;
    if (!_1155)
    {
        _1198 = _1169;
    }
    float _1200 = _1198;
    float _1202 = as_type<float>(_1145) * _1190;
    float _1204 = floor(_1192);
    float _1206 = _1163 * _1196;
    float _1208 = 0.0;
    float _1210 = _1200;
    if (!_1155)
    {
        _1208 = _1171;
    }
    float _1212 = _1208;
    float _1214 = 0.0;
    float _1216 = _1212;
    if (_1155)
    {
        _1214 = _1167;
    }
    float _1218 = _1214;
    float _1220 = 0.0;
    float _1222 = _1218;
    if (_1155)
    {
        _1220 = _1169;
    }
    float _1224 = _1220;
    float _1226 = trunc(_1202);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1224;
    if (_1155)
    {
        _1216 = _1169;
    }
    float _1236 = _1216;
    if (!_1155)
    {
        _1222 = _1171;
    }
    float _1238 = _1222;
    if (_1155)
    {
        _1210 = _1167;
    }
    float _1240 = _1210;
    float _1242 = floor(_1206);
    if (!_1155)
    {
        _1234 = _1167;
    }
    float _1244 = _1234;
    int _1246 = int(_1180) + int(_1230);
    float _1248 = float(_1045);
    float _1250 = float(_1149);
    int _1252 = _1184 * _1246;
    int _1254 = _1252 + _1149;
    bool _1256 = _1250 >= _1248;
    bool _1258 = isnan(_1250);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1248);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1242;
    float _1270 = _1206 + _1268;
    bool _1272 = uint(_1254) >= uint(_1045);
    float _1274 = trunc(_1266);
    int _1276 = int(_1274);
    bool _1278 = !_1272;
    int _1280 = _1278 ? 0 : (-1);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1284 = _1282 != 0;
    int _1286 = ~_1246;
    int _1288 = _1286 + _1280;
    int _1290 = _1288 + 1;
    float _1292 = _1270 * _1248;
    float _1294 = _125 * _1248;
    bool _1296 = !_1284;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _1045 * _1290;
    int _1302 = _1300 + _1149;
    float _1304 = _1294 * _1083;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1312 = !_1135;
    int _1314 = _1312 ? _1302 : (-1);
    int _1316 = ~_1276;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1338 = _1336 != 0;
    int _1340 = _1045 + (-1);
    int _1342 = _1314 * _1320;
    float _1344 = trunc(_1304);
    int _1346 = int(_1344);
    bool _1348 = !_1330;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1322);
    int _1354 = _1276 * _1340;
    int _1356 = _1354 + _1342;
    bool _1358 = !_1326;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = abs(_1350);
    float _1364 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1366 = abs(_1298);
    bool _1368 = !_1334;
    int _1370 = _1368 ? 0 : 1;
    int _1372 = abs(_1360);
    int _1374 = _1308 * _1366;
    int _1376 = _1374 + _1149;
    bool _1378 = !_1338;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1370);
    int _1384 = _1356 * _1362;
    int _1386 = abs(_1380);
    int _1388 = _1346 * _1372;
    int _1390 = _1388 + _1384;
    float _1392 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1394 = ~_1045;
    int _1396 = _1394 + 1;
    int _1398 = _1376 * _1382;
    int _1400 = _1398 + _1390;
    int _1402 = ~_1045;
    int _1404 = _1402 + 1;
    float _1406 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    bool _1408 = _1171 > 0.5;
    int _1410 = _1308 * _1386;
    int _1412 = _1410 + _1400;
    bool _1414 = _1169 > 0.5;
    float _1416 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1406);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1412));
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = as_type<float>(_1145) * _1422;
    float _1428 = trunc(_1426);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1436 = _1404 * int(_1432);
    int _1438 = _1436 + _1412;
    float _1440 = float(uint(_1438));
    float _1442 = as_type<float>(_1145) * _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1448 = trunc(_1442);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = 1.0 / _1446;
    int _1456 = int(_1432) + int(_1452);
    float _1458 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1460 = -_227;
    int _1462 = _1414 ? as_type<int>(_1460) : as_type<int>(_227);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1468 = _1396 * _1456;
    int _1470 = _1468 + _1412;
    bool _1472 = !_1420;
    float _1474 = _1472 ? _227 : as_type<float>(_1462);
    float _1476 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1458);
    float _1478 = 1.0 / _1466;
    bool _1480 = uint(_1470) >= uint(_1045);
    float _1482 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    float _1484 = -_223;
    int _1486 = _1414 ? as_type<int>(_1484) : as_type<int>(_223);
    bool _1488 = !_1480;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1494 = _1173 > 0.5;
    int _1496 = ~_1456;
    int _1498 = _1496 + _1490;
    int _1500 = _1498 + 1;
    float _1502 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1504 = -_223;
    int _1506 = _1408 ? as_type<int>(_1504) : as_type<int>(_223);
    int _1508 = _1045 * _1500;
    int _1510 = _1508 + _1412;
    float _1512 = -_227;
    int _1514 = _1494 ? as_type<int>(_1512) : as_type<int>(_227);
    float _1516 = -_1434;
    float _1518 = fma(_1502, 2.0, _1516);
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1522 = _1520 != 0;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1528 = -_125;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1518);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1534 = _1532 != 0;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1538 = _1536 != 0;
    float _1540 = 1.0 / _1526;
    bool _1542 = _1045 == 0;
    bool _1544 = !_1522;
    float _1546 = _1544 ? _223 : as_type<float>(_1506);
    float _1548 = -_227;
    int _1550 = _1408 ? as_type<int>(_1548) : as_type<int>(_227);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1554 = _1552 != 0;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1542;
    int _1566 = _1564 ? _1510 : (-1);
    bool _1568 = !_1538;
    float _1570 = _1568 ? _227 : as_type<float>(_1550);
    bool _1572 = !_1554;
    float _1574 = _1572 ? _227 : as_type<float>(_1514);
    int _1576 = _1566 & 3;
    bool _1578 = _1576 != 0;
    int _1580 = _1566 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1578 ? 0 : 1;
    bool _1586 = uint(_1580) > 1u;
    int _1588 = ~_1584;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    bool _1594 = !_1534;
    float _1596 = _1594 ? _223 : as_type<float>(_1486);
    int _1598 = _1592;
    if (!_1586)
    {
        int _1600 = ~_1584;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1610 = _1167 > 0.5;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1614 = 1.0 / _1608;
    float _1616 = -_223;
    int _1618 = _1610 ? as_type<int>(_1616) : as_type<int>(_223);
    float _1620 = fma(_1232, -2.0, _1612);
    bool _1622 = _1204 >= 0.0;
    bool _1624 = isnan(_1204);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan(0.0);
    bool _1630 = _1626 || _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1640 = !_1562;
    float _1642 = _1640 ? _223 : as_type<float>(_1618);
    int _1644 = _1630 ? 0 : 1;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1650 = _1204 > 0.0;
    float _1652 = _1169 * 2.0;
    int _1654 = ~_1644;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = _1638 * _1143;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1666 = 1.0 / _1648;
    float _1668 = _1634 * _1151;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1678 = _1672 * _1157;
    float _1680 = _1676 * _1454;
    float _1682 = floor(_1652);
    int _1684 = _1658;
    if (!_1650)
    {
        int _1686 = ~_1644;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _1171 * 2.0;
    float _1694 = 1.0 / _1664;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = _1698 * _1478;
    float _1714 = _1702 * _1540;
    float _1716 = _1706 * _1614;
    bool _1718 = _1682 >= 0.0;
    bool _1720 = isnan(_1682);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan(0.0);
    bool _1726 = _1722 || _1724;
    float _1728 = floor(_1692);
    float _1730 = _1710 * _1666;
    int _1732 = _1726 ? 0 : 1;
    bool _1734 = _1682 > 0.0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1736;
    int _1740 = ~_1732;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    float _1746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1748 = log2(_1746);
    float _1750 = _1169 + _1167;
    float _1752 = _1738 * _1694;
    float _1754 = fma(_1730, _1033, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1756 = _1694;
    int _1758 = _1744;
    if (!_1155)
    {
        _1756 = _1171;
    }
    float _1760 = _1756;
    float _1762 = _1750 + (-1.0);
    float _1764 = _1760;
    if (_1155)
    {
        _1764 = _1169;
    }
    float _1766 = _1764;
    float _1768 = fma(_1752, _1037, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1780 = _1778 != 0;
    if (!_1734)
    {
        int _1782 = ~_1732;
        int _1784 = _1782 + 1;
        _1758 = _1784;
    }
    int _1786 = _1758;
    bool _1788 = _1728 >= 0.0;
    bool _1790 = isnan(_1728);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.0);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1800 = isnan(_1021);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _125 * _1748;
    int _1812 = _1796 ? 0 : 1;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = exp2(_1810);
    float _1826 = -_1808;
    float _1828 = _1826 + 1.0;
    bool _1830 = !_1776;
    int _1832 = _1830 ? 0 : 1;
    bool _1834 = _1045 == 0;
    float _1836 = _1169 + _1171;
    float _1838 = _1836 + (-1.0);
    float _1840 = -_1824;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1848 = _1023 + _1846;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1854 = _1021 + _1852;
    float _1856 = _1822 ? _1842 : 0.0;
    float _1858 = fma(_1668, _1848, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1862 = _1021 + _1860;
    bool _1864 = _1728 > 0.0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1868 = _1023 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1872 = _1021 + _1870;
    float _1874 = fma(_1680, _1862, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1876 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1878 = isnan(_1021);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1660, _1868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1890 = fma(_1716, _1854, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1892 = fma(_1678, _1872, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1896 = _1021 + _1894;
    bool _1898 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1900 = isnan(_1021);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1912 = _1021 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1714, _1896, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1920 = fma(_1712, _1912, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1922 = _1908 * _1916;
    bool _1924 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1926 = isnan(_1023);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = -_1908;
    float _1938 = _1936 + 1.0;
    bool _1940 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1942 = isnan(_1021);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = _1808 * _1938;
    bool _1954 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1956 = isnan(_1021);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 * _1828;
    float _1968 = -_1950;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1974 = -_1934;
    float _1976 = _1974 + 1.0;
    float _1978 = _1964 * _1970;
    float _1980 = -_1964;
    float _1982 = _1980 + 1.0;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    float _1988 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1972);
    float _1990 = _1081 * _1976;
    float _1992 = _1121 * _1982;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1988);
    float _1998 = -_1081;
    float _2000 = _1998 + 1.0;
    float _2002 = _1109 * _1133;
    float _2004 = _1996 * (-0.15915493667125701904296875);
    float _2006 = _1067 * _2000;
    float _2008 = -_1109;
    float _2010 = _2008 + 1.0;
    float _2012 = -_1067;
    float _2014 = _2012 + 1.0;
    float _2016 = _2004 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1858 * _2006;
    float _2022 = _1097 * _2010;
    float _2024 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2026 = -_1097;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2020);
    float _2032 = _1892 * _2022;
    float _2034 = _1856 * _1994;
    float _2036 = _2004 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    float _2040 = -_1139;
    float _2042 = fma(_2024, 2.0, _2040);
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2032);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2048 = fma(_1888, _1990, _2030);
    float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2054 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2046);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2058 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2060 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2052);
    float _2062 = _1474 * _2018;
    float _2064 = fma(_1874, _2002, _2044);
    float _2066 = _1474 * _2038;
    float _2068 = -_2056;
    float _2070 = fma(_2058, 2.0, _2068);
    float _2072 = -_2062;
    float _2074 = fma(_1642, _2038, _2072);
    float _2076 = _1596 + 0.5;
    float _2078 = -_125;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2042);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2084 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2086 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2090 = fma(_1642, _2018, _2066);
    float _2092 = fma(_2084, -2.0, _2082);
    float _2094 = fma(_2086, _2076, _2080);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1364 + _2096;
    float _2100 = fma(_1920, _1992, _2064);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2070);
    float _2106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2112 = _1424 + _2110;
    float _2114 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2116 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2120 = _1492 + _2118;
    float _2122 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2048);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2114);
    float _2126 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2128 = _1546 + 0.5;
    int _2130 = ~_1812;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2124);
    float _2138 = _2074 + 0.5;
    float _2140 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2104);
    float _2142 = fma(_2116, -2.0, _2108);
    int _2144 = _2134;
    if (!_1864)
    {
        int _2146 = ~_1812;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = fma(_2126, _2138, _1530);
    bool _2154 = !_1772;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2160 = fma(_1918, _1978, _2100);
    bool _2162 = _2136 >= 0.0;
    float _2164 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2166 = abs(_1832);
    float _2168 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _2170 = float(_1690);
    float _2172 = _2090 + (-0.5);
    float _2174 = _1574 + (-0.5);
    float _2176 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2092);
    int _2178 = abs(_2156);
    float _2180 = -_2164;
    float _2182 = -_2168;
    float _2184 = fma(_2180, _2172, _2182);
    float _2186 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2188 = -_2174;
    float _2190 = -_2176;
    float _2192 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2190);
    float _2194 = float(_2150);
    float _2196 = _981 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2198 = float(_2178);
    float _2200 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2202 = float(_2166);
    float _2204 = _2122 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2206 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2198 * _2194;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _2202 * _2170;
    float _2214 = float(uint(_1376));
    float _2216 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2218 = _1570 + (-0.5);
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2142);
    float _2222 = fma(_1890, _1966, _2160);
    int _2224 = _1566 >> 31;
    float _2226 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2054);
    float _2228 = -_2216;
    float _2230 = -_2220;
    float _2232 = fma(_2228, _2218, _2230);
    float _2234 = as_type<float>(_1145) * _2214;
    int _2236 = _2224 & 3;
    float _2238 = -_2226;
    float _2240 = _2238 + 1.0;
    out.m_58.x = _2206;
    out.m_58.y = _2200;
    out.m_58.z = _2210;
    out.m_58.w = _2204;
    float _2242 = trunc(_2234);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = -_2240;
    float _2250 = fma(_1546, _2248, _2140);
    float _2252 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2060);
    float _2254 = fma(_1754, _1952, _2222);
    float _2256 = _2208 * (-2.0);
    float _2258 = _2212 * (-2.0);
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    float _2264 = fma(_1768, _1922, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_2162)
    {
        out.m_45.x = 0.0;
    }
    float _2268 = fma(_1844, _2256, _1844);
    float _2270 = fma(_1574, _2262, _2192);
    bool _2272 = !_1582;
    int _2274 = _2272 ? 0 : 1;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2278 = _1566 + _2236;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2282 = ~_1045;
    int _2284 = _2282 + 1;
    float _2286 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2276);
    int _2288 = _2278 >> 2;
    float _2290 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2280);
    bool _2292 = uint(_1580) >= 2u;
    float _2294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2286);
    int _2296 = _2288 << 4;
    int _2298 = _2296 + 512;
    float _2300 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2290);
    int _2302 = _2284 * int(_2246);
    int _2304 = _2302 + _1376;
    float _2306 = -_2294;
    float _2308 = _2306 + 1.0;
    uint _2310 = uint(int(uint(_2298) >> uint(2)));
    uint _2312 = uint(int(uint(int(_2310)) >> uint(2)));
    int _2314 = int(_2310) & 3;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[int(_2312)][_2314];
    int _2318 = int(_2310) + 1;
    uint _2320 = uint(int(uint(_2318) >> uint(2)));
    int _2322 = _2318 & 3;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[int(_2320)][_2322];
    float _2326 = -_2300;
    float _2328 = _2326 + 1.0;
    float _2330 = in.m_60.x;
    float _2332 = in.m_60.y;
    float _2334 = in.m_60.z;
    float _2336 = -_2308;
    float _2338 = fma(_2074, _2336, _2152);
    float _2340 = float(uint(_2304));
    float _2342 = fma(_2090, _2328, _2184);
    int _2344 = _2292 ? 0 : 1;
    float _2346 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2264);
    int _2348 = _2298 + 8;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    uint _2352 = uint(int(uint(int(_2350)) >> uint(2)));
    int _2354 = int(_2350) & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    int _2358 = int(_2350) + 1;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    int _2362 = _2358 & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    float _2366 = as_type<float>(_1145) * _2340;
    bool _2368 = _1580 != 3;
    out.m_62.x = _2338;
    out.m_62.y = _2342;
    out.m_62.z = _2250;
    out.m_62.w = _2270;
    if (_2162)
    {
        _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2370 = _2266;
    float _2372 = fma(_1850, _2258, _1850);
    float _2374 = trunc(_2366);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    out.m_64.x = _2346;
    int _2380 = as_type<int>(_2370);
    if (_2162)
    {
        float _2382 = _2370 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    if (_2162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7424 = as_type<float>(_2384);
        out.gl_Position.z = _7424;
    }
    int _2386 = ~_1045;
    int _2388 = _2386 + 1;
    float _2390 = fma(_2256, _2330, _2330);
    int _2392 = ~_2344;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2258, _2332, _2332);
    int _2400 = _2396;
    if (_2368)
    {
        int _2402 = ~_2344;
        int _2404 = _2402 + 1;
        _2400 = _2404;
    }
    int _2406 = _2400;
    int _2408 = int(_2246) + int(_2378);
    int _2410 = abs(_1604);
    float _2412 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2414 = _1580 != 3;
    int _2416 = _2388 * _2408;
    int _2418 = _2416 + _1376;
    int _2420 = abs(_2274);
    int _2422 = abs(_2406);
    int _2424 = ~_2410;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2414;
    int _2432 = _2430 ? 0 : (-1);
    bool _2434 = uint(_2418) >= uint(_1045);
    int _2436 = ~_2420;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    int _2442 = _2428 * as_type<int>(_2324);
    float _2444 = _2098 * _2098;
    int _2446 = abs(_2432);
    int _2448 = _2440 * as_type<int>(_2316);
    int _2450 = _2448 + _2442;
    int _2452 = ~_2422;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    float _2458 = fma(_2112, _2112, _2444);
    bool _2460 = !_1558;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2446;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2356);
    int _2472 = _2470 + _2450;
    float _2474 = fma(_2120, _2120, _2458);
    bool _2476 = !_2434;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2468 * as_type<int>(_2364);
    int _2482 = _2480 + _2472;
    int _2484 = abs(_2462);
    float _2486 = rsqrt(_2474);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2490 = ~_2408;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    bool _2496 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2498 = isnan(1.0);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2504 = _2500 || _2502;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2508 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2488);
    int _2510 = _1045 * _2494;
    int _2512 = _2510 + _1376;
    int _2514 = ~_2484;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2506);
    float _2522 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2508);
    bool _2524 = !_1834;
    int _2526 = _2524 ? _2512 : (-1);
    int _2528 = _2482 * _2518;
    float _2530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2520);
    float _2532 = _2412 * _2486;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    int _2538 = _2526 * _2484;
    int _2540 = _2538 + _2528;
    float _2542 = -_2530;
    float _2544 = _2542 + 1.0;
    float _2546 = _2098 * _2532;
    float _2548 = -_2536;
    float _2550 = fma(_1596, _2548, _2094);
    float _2552 = _2112 * _2532;
    float _2554 = fma(_1570, _2544, _2232);
    float _2556 = -_2546;
    float _2558 = _2098 + _2556;
    float _2560 = float(_2540);
    float _2562 = _1167 + (-0.5);
    float _2564 = -_2552;
    float _2566 = _2112 + _2564;
    float _2568 = _2558 * _2558;
    out.m_66.x = _2550;
    out.m_66.y = _2554;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2390);
    bool _2572 = !_1780;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = fma(_2566, _2566, _2568);
    out.m_68.y = _2560;
    if (_2162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2578 = -_2546;
    float _2580 = _1364 + _2578;
    float _2582 = _2120 * _2532;
    float _2584 = -_2552;
    float _2586 = _1424 + _2584;
    int _2588 = abs(_2574);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2592 = _2580 + _2590;
    float _2594 = -_2582;
    float _2596 = _1492 + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2600 = _2586 + _2598;
    bool _2602 = !_2504;
    float _2604 = _2602 ? _125 : _2034;
    float _2606 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2610 = _2596 + _2608;
    float _2612 = _1169 + (-0.5);
    float _2614 = float(_1786);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2606);
    float _2618 = float(_2588);
    float _2620 = fma(_2604, _2268, _2570);
    float _2622 = _1171 + _1167;
    float _2624 = fma(_2610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2616);
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2398);
    float _2628 = _2618 * _2614;
    float _2630 = _2620 * 0.15915493667125701904296875;
    float _2632 = _2622 + (-1.0);
    bool _2634 = _2624 >= 0.0;
    float _2636 = _2628 * (-2.0);
    float _2638 = -_2582;
    float _2640 = _2120 + _2638;
    float _2642 = fma(_2604, _2372, _2626);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2646 = fma(_2636, _2334, _2334);
    float _2648 = fma(_2640, _2640, _2576);
    float _2650 = _2642 * 0.15915493667125701904296875;
    float _2652 = _2630 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = _1171 + (-0.5);
    float _2658 = fma(_2644, _2636, _2644);
    float _2660 = as_type<float>(_2588);
    int _2662 = as_type<int>(_2656);
    float _2664 = _2580;
    float _2666 = _2610;
    if (_2634)
    {
        _2660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2668 = _2660;
    float _2670 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2646);
    if (_2634)
    {
        out.m_45.x = 0.0;
    }
    float _2672 = _2630 * 6.283185482025146484375;
    float _2674 = cos(_2672);
    if (_2634)
    {
        float _2676 = _2668 * 5.0;
        _2662 = as_type<int>(_2676);
    }
    int _2678 = _2662;
    float _2680 = fma(_2604, _2658, _2670);
    if (_2634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7871 = as_type<float>(_2678);
        out.gl_Position.z = _7871;
    }
    float _2682 = sqrt(_2648);
    float _2684 = _2680 * 0.15915493667125701904296875;
    float _2686 = _2650 * 6.283185482025146484375;
    float _2688 = sin(_2686);
    float _2690 = _2650 * 6.283185482025146484375;
    float _2692 = cos(_2690);
    if (_2634)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2694 = _2684 * 6.283185482025146484375;
    float _2696 = cos(_2694);
    float _2698 = _2486 * _2682;
    float _2700 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2704 = _2674 * _2692;
    float _2706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2708 = _2698 * _2700;
    float _2710 = _1069 * _2698;
    float _2712 = _2684 * 6.283185482025146484375;
    float _2714 = sin(_2712);
    float _2716 = _2674 * _2688;
    float _2718 = _2702 * _2708;
    float _2720 = _2654 * _2688;
    float _2722 = _2706 * _2710;
    float _2724 = _2654 * _2692;
    float _2726 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2728 = _2726 * 0.5;
    float _2730 = _2696 * _2718;
    float _2732 = _2674 * _2730;
    float _2734 = _2688 * _2696;
    float _2736 = _2692 * _2696;
    float _2738 = fma(_2714, _2704, _2720);
    float _2740 = -_2718;
    float _2742 = _2714 * _2740;
    float _2744 = fma(_2714, _2720, _2704);
    float _2746 = fma(_2738, _2722, _2732);
    float _2748 = -_2724;
    float _2750 = fma(_2714, _2716, _2748);
    float _2752 = -_2716;
    float _2754 = fma(_2714, _2724, _2752);
    float _2756 = _2654 * _2730;
    float _2758 = fma(_2736, _2722, _2742);
    float _2760 = fma(_2750, _2728, _2746);
    float _2762 = fma(_2754, _2722, _2756);
    float _2764 = fma(_2734, _2728, _2758);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2768 = fma(_2744, _2728, _2762);
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2766);
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2770);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2772);
    float _2778 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2780 = _2776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2784 = _1492 + _2780;
    float _2786 = _1424 + _2782;
    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2790 = _2784 + _2788;
    float _2792 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2796 = _2786 + _2794;
    float _2798 = _2790 * _2790;
    float _2800 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2792);
    float _2802 = fma(_2796, _2796, _2798);
    float _2804 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2800);
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2810 = _1364 + _2808;
    bool _2812 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = _2808;
    float _2816 = _2798;
    float _2818 = _2786;
    float _2820 = _2710;
    float _2822 = _2784;
    if (!_2812)
    {
        _2814 = _2786;
    }
    float _2824 = _2814;
    float _2826 = _2824;
    if (!_2812)
    {
        _2816 = _2784;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (!_2812)
    {
        _2818 = _2810;
    }
    float _2832 = _2818;
    bool _2834 = !_2812;
    float _2836 = _2832;
    if (!_2834)
    {
        float _2838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2842 = _2806 + _2840;
        float _2844 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = rsqrt(_2802);
        float _2848 = _2842 * _2838;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = _2850 * 6.283185482025146484375;
        float _2854 = cos(_2852);
        float _2856 = _2850 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2854 + (-1.0);
        float _2862 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2864 = fma(_2858, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2866 = fma(_2810, _2854, _2862);
        float _2868 = _2846 * _2864;
        float _2870 = fma(_2796, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2872 = fma(_2790, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2836 = _2866;
        _2826 = _2870;
        _2830 = _2872;
    }
    float _2874 = _2836;
    float _2876 = _2826;
    float _2878 = _2830;
    float _2880 = -_1364;
    float _2882 = _2880 + _2874;
    float _2884 = -_1424;
    float _2886 = _2884 + _2876;
    float _2888 = -_1492;
    float _2890 = _2888 + _2878;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = sqrt(_2896);
    bool _2900 = _2898 > 0.0;
    float _2902 = _2894;
    float _2904 = _2898;
    float _2906 = _2874;
    if (!_2900)
    {
        _2902 = _2876;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    float _2912 = _2908;
    if (!_2900)
    {
        _2904 = _2878;
    }
    float _2914 = _2904;
    bool _2916 = !_2900;
    float _2918 = _2914;
    float _2920 = _2914;
    if (!_2916)
    {
        bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2924 = _2796;
        if (_2922)
        {
            float _2926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2924 = _2926;
        }
        float _2928 = _2924;
        float _2930 = _2928;
        if (_2922)
        {
            float _2932 = _467 * _2928;
            _2820 = _2932;
        }
        float _2934 = _2820;
        float _2936 = _2934;
        if (_2922)
        {
            float _2938 = _469 * _2928;
            _2822 = _2938;
        }
        float _2940 = _2822;
        float _2942 = _2940;
        if (_2922)
        {
            float _2944 = _471 * _2928;
            _2930 = _2944;
        }
        float _2946 = _2930;
        float _2948 = _2946;
        if (!_2922)
        {
            bool _2950 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan(1.0);
            bool _2958 = _2954 || _2956;
            float _2960 = _125 + 1.0;
            if (!_2958)
            {
                float _2962 = _2960 * _2960;
                float _2964 = _2962 * 0.5;
                _127 = _2964;
            }
            float _2966 = _127;
            float _2968 = _2966;
            if (!_2958)
            {
                float _2970 = _2966 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2968 = _2970;
            }
            float _2972 = _2968;
            bool _2974 = !_2958;
            float _2976 = _2972;
            if (!_2974)
            {
                float _2978 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2980 = log2(_2978);
                float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2984 = 1.0 + _2982;
                float _2986 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2988 = _2980 * _2960;
                float _2990 = 1.0 / _2984;
                float _2992 = _2986 * 0.693147182464599609375;
                float _2994 = exp2(_2988);
                float _2996 = 1.0 / _2992;
                float _2998 = _2994 + (-1.0);
                float _3000 = -_2998;
                float _3002 = fma(_3000, _2996, _2960);
                float _3004 = _3002 * _2990;
                float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2976 = _3006;
            }
            float _3008 = _2976;
            float _3010 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3012 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3014 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3016 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _3018 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _3020 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _3022 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3016);
            float _3024 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3018);
            float _3026 = _3018;
            if (!_2958)
            {
                _3026 = _2960;
            }
            float _3028 = _3026;
            float _3030 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3022);
            bool _3032 = !_2958;
            float _3034 = _3028;
            if (!_3032)
            {
                float _3036 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3038 = log2(_3036);
                float _3040 = _3038 * _2960;
                float _3042 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3044 = 1.0 + _3042;
                float _3046 = exp2(_3040);
                float _3048 = 1.0 / _3044;
                float _3050 = -_3046;
                float _3052 = _3050 + 1.0;
                float _3054 = _3052 * _3048;
                _3034 = _3054;
            }
            float _3056 = _3034;
            float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3020);
            float _3060 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3024);
            float _3062 = fma(_3056, _165, _3030);
            float _3064 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3058);
            float _3066 = fma(_3056, _163, _3060);
            float _3068 = -_429;
            float _3070 = _3068 + _3062;
            float _3072 = fma(_3056, _167, _3064);
            float _3074 = -_431;
            float _3076 = _3074 + _3066;
            float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3080 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3082 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3084 = -_433;
            float _3086 = _3084 + _3072;
            float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3078);
            float _3090 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3080);
            float _3092 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3082);
            float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3088);
            float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3090);
            float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3092);
            _475 = _3096;
            _477 = _3094;
            _479 = _3098;
            _2936 = _3094;
            _2942 = _3096;
            _2948 = _3098;
            _2918 = _3080;
            _2910 = _3090;
        }
        float _3100 = _475;
        float _3102 = _477;
        float _3104 = _479;
        float _3106 = _2936;
        float _3108 = _2942;
        float _3110 = _2948;
        float _3112 = _2918;
        float _3114 = _2910;
        float _3116 = _3100 * _3100;
        float _3118 = fma(_3102, _3102, _3116);
        float _3120 = fma(_3104, _3104, _3118);
        float _3122 = rsqrt(_2896);
        float _3124 = sqrt(_3120);
        float _3126 = _2886 * _3122;
        float _3128 = _2882 * _3122;
        float _3130 = _2890 * _3122;
        bool _3132 = _3124 > 0.0;
        float _3134 = _3114;
        float _3136 = _3112;
        if (!_3132)
        {
            _3134 = _2876;
        }
        float _3138 = _3134;
        _2912 = _3138;
        if (!_3132)
        {
            _3136 = _2878;
        }
        float _3140 = _3136;
        bool _3142 = !_3132;
        _2920 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3120);
            float _3146 = _3144 * _3100;
            float _3148 = _3144 * _3102;
            float _3150 = _3144 * _3104;
            float _3152 = _3128 * _3146;
            float _3154 = fma(_3126, _3148, _3152);
            float _3156 = fma(_3130, _3150, _3154);
            float _3158 = _3156 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3106, _3158, _2876);
            float _3162 = fma(_3108, _3158, _2874);
            float _3164 = fma(_3110, _3158, _2878);
            _2906 = _3162;
            _2920 = _3164;
            _2912 = _3160;
        }
    }
    float _3166 = _2906;
    float _3168 = _2920;
    float _3170 = _2912;
    float _3172 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3174 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3176 = isnan(0.5);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3182 = _3178 || _3180;
    float _3184 = -_2546;
    float _3186 = _3184 + _3166;
    bool _3188 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3190 = isnan(0.5);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3196 = _3192 || _3194;
    float _3198 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3172);
    float _3200 = -_2582;
    float _3202 = _3200 + _3168;
    float _3204 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3198);
    float _3206 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3208 = _3204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3210 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3206);
    float _3212 = 1.0 / _3208;
    float _3214 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3210);
    float _3216 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3218 = _3216 + _3208;
    float _3220 = _3208;
    float _3222 = _3186;
    float _3224 = _3202;
    if (_3196)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    float _3228 = _3218 * _3212;
    float _3230 = _3228 * 0.5;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3234 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3232);
    float _3236 = -_2552;
    float _3238 = _3236 + _3170;
    float _3240 = 1.0 / _3234;
    float _3242 = _3238;
    float _3244 = _3234;
    float _3246 = _3226;
    if (!_3182)
    {
        float _3248 = _2592 * _2592;
        float _3250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3252 = -_1492;
        float _3254 = _3252 + _3168;
        float _3256 = -_1424;
        float _3258 = _3256 + _3170;
        float _3260 = fma(_2600, _2600, _3248);
        float _3262 = fma(_2610, _2610, _3260);
        float _3264 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3266 = sqrt(_3262);
        float _3268 = 1.0 / _2698;
        float _3270 = precise::min(_3266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3272 = _3270 * _3250;
        float _3274 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3276 = -_1364;
        float _3278 = _3276 + _3166;
        float _3280 = _3272 * _3268;
        float _3282 = _3274 * _3280;
        float _3284 = _3254 * _3280;
        float _3286 = fma(_3258, _3282, _2586);
        float _3288 = fma(_3278, _3282, _2580);
        float _3290 = fma(_3274, _3284, _2596);
        _3222 = _3288;
        _3242 = _3286;
        _3224 = _3290;
        _3244 = _3274;
    }
    float _3292 = _3222;
    float _3294 = _3242;
    float _3296 = _3224;
    float _3298 = _3244;
    float _3300 = _3298;
    if (_3196)
    {
        _3300 = 1.0;
    }
    float _3302 = _3300;
    float _3304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3306 = _3240 * _3304;
    float _3308 = _3302;
    float _3310 = _3306;
    if (!_3196)
    {
        float _3312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = _3312 * 0.15915493667125701904296875;
        float _3316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3318 = _3314 * 6.283185482025146484375;
        float _3320 = cos(_3318);
        float _3322 = _3316 * 0.15915493667125701904296875;
        float _3324 = _3314 * 6.283185482025146484375;
        float _3326 = sin(_3324);
        float _3328 = 1.0 / _3320;
        float _3330 = _3322 * 6.283185482025146484375;
        float _3332 = cos(_3330);
        float _3334 = _3326 * _3328;
        float _3336 = _3322 * 6.283185482025146484375;
        float _3338 = sin(_3336);
        float _3340 = _3332 * _3334;
        float _3342 = 1.0 / _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3344;
        float _3348 = 1.0 / _3346;
        float _3350 = _3338 * _3342;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_3306, _3350, _3352);
        float _3356 = _3354 * _3348;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3246 = _3358;
    }
    float _3360 = _3246;
    if (!_3196)
    {
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3364 = _3362 * 0.15915493667125701904296875;
        float _3366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3368 = _3364 * 6.283185482025146484375;
        float _3370 = cos(_3368);
        float _3372 = _3366 * 0.15915493667125701904296875;
        float _3374 = _3364 * 6.283185482025146484375;
        float _3376 = sin(_3374);
        float _3378 = 1.0 / _3370;
        float _3380 = _3372 * 6.283185482025146484375;
        float _3382 = cos(_3380);
        float _3384 = _3376 * _3378;
        float _3386 = _3372 * 6.283185482025146484375;
        float _3388 = sin(_3386);
        float _3390 = _3382 * _3384;
        float _3392 = 1.0 / _3390;
        float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3396 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3394;
        float _3398 = 1.0 / _3396;
        float _3400 = _3388 * _3392;
        float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3404 = fma(_3306, _3400, _3402);
        float _3406 = _3404 * _3398;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -_3408;
        float _3412 = _3410 + 1.0;
        _2664 = _3400;
        _3308 = _3412;
    }
    float _3414 = _2664;
    float _3416 = _3308;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3424 = _3294 + _3422;
    float _3426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3428 = _3296 + _3426;
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3420 * _3420;
    float _3434 = fma(_3424, _3424, _3432);
    float _3436 = fma(_3428, _3428, _3434);
    float _3438 = rsqrt(_3436);
    float _3440 = sqrt(_3436);
    float _3442 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3444 = _3424 * _3442;
    float _3446 = _3428 * _3442;
    float _3448 = _3444 * _3444;
    float _3450 = _3446 * _3446;
    float _3452 = _3448 + _3450;
    float _3454 = sqrt(_3452);
    bool _3456 = _3454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3460 = _3454 + _3458;
    float _3462 = _3438;
    float _3464 = _3452;
    float _3466 = _3460;
    float _3468 = _3414;
    float _3470 = _3420;
    if (_3456)
    {
        float _3472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3462 = _3472;
    }
    float _3474 = _3462;
    if (_3456)
    {
        float _3476 = rsqrt(_3452);
        _3464 = _3476;
    }
    float _3478 = _3464;
    float _3480 = _3478;
    if (_3456)
    {
        float _3482 = _3460 * _3474;
        _3466 = _3482;
    }
    float _3484 = _3466;
    if (_3456)
    {
        float _3486 = _3484 * 0.15915493667125701904296875;
        _3468 = _3486;
    }
    float _3488 = _3468;
    float _3490 = _3428;
    if (_3456)
    {
        float _3492 = _3488 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3500 = precise::max(0.0, _3498);
    float _3502 = _3474;
    float _3504 = _3500;
    if (_3456)
    {
        float _3506 = _3488 * 6.283185482025146484375;
        float _3508 = cos(_3506);
        _3502 = _3508;
    }
    float _3510 = _3502;
    float _3512 = -_3442;
    float _3514 = -_3500;
    float _3516 = fma(_3420, _3512, _3514);
    if (_3456)
    {
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3518;
    }
    float _3520 = _3470;
    float _3522 = _3520;
    float _3524 = _3496;
    if (_3456)
    {
        float _3526 = fma(_3496, _3520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = _3528;
    if (!_3456)
    {
        _3524 = _3444;
    }
    float _3532 = _3524;
    float _3534 = _3532;
    float _3536 = _3510;
    if (_3456)
    {
        float _3538 = _3510 + (-1.0);
        _3504 = _3538;
    }
    float _3540 = _3504;
    float _3542 = _3540;
    if (_3456)
    {
        float _3544 = _3478 * _3528;
        _2666 = _3544;
    }
    float _3546 = _2666;
    if (!_3456)
    {
        _3530 = _3516;
    }
    float _3548 = _3530;
    float _3550 = _3548;
    if (_3456)
    {
        float _3552 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3552;
    }
    float _3554 = _3310;
    if (_3456)
    {
        float _3556 = _3444 * _3546;
        _3534 = _3556;
    }
    float _3558 = _3534;
    if (!_3456)
    {
        _3542 = _3446;
    }
    float _3560 = _3542;
    float _3562 = _3560;
    if (_3456)
    {
        float _3564 = _3446 * _3546;
        _3562 = _3564;
    }
    float _3566 = _3562;
    if (!_3456)
    {
        _3480 = _3448;
    }
    float _3568 = _3480;
    float _3570 = _3568;
    if (_3456)
    {
        float _3572 = fma(_3516, _3510, _3554);
        _3550 = _3572;
    }
    float _3574 = _3550;
    if (_3456)
    {
        float _3576 = _3558 * _3558;
        _3570 = _3576;
    }
    float _3578 = _3570;
    if (!_3456)
    {
        _3536 = _3450;
    }
    float _3580 = _3536;
    float _3582 = _3580;
    if (_3456)
    {
        float _3584 = _3566 * _3566;
        _3582 = _3584;
    }
    float _3586 = _3582;
    float _3588 = fma(_3574, _3574, _3578);
    float _3590 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = _3588 + _3586;
    float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3596 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3594);
    float _3598 = precise::clamp(_3596, 0.0, 1.0);
    float _3600 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3602 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3604 = -_3598;
    float _3606 = _3604 + 1.0;
    float _3608 = rsqrt(_3592);
    float _3610 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3600);
    float _3612 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3614 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3602);
    float _3616 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3618 = _3610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3612);
    float _3622 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3614);
    float _3624 = abs(_3606);
    float _3626 = log2(_3624);
    float _3628 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3616);
    float _3630 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3620);
    float _3632 = _3622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3634 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3636 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3628);
    float _3638 = _3630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3642 = _3608 * _3558;
    float _3644 = _3608 * _3574;
    float _3646 = _3608 * _3566;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3640);
    float _3650 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3652 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3654 = -_3634;
    float _3656 = fma(_3654, _3430, 1.0);
    float _3658 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3648);
    float _3660 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3662 = -_3650;
    float _3664 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3662);
    float _3666 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3668 = log2(_3656);
    float _3670 = -_3646;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3664);
    float _3674 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3676 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3678 = fma(_3672, -0.5, 0.5);
    float _3680 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3674);
    float _3682 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3676);
    float _3684 = exp2(_3660);
    float _3686 = fma(_3672, 0.5, 0.5);
    float _3688 = _3644 + 1.0;
    float _3690 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3692 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3694 = fma(_3686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3696 = 1.0 / _3666;
    float _3698 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3692);
    float _3700 = fma(_3686, _3694, -0.212114393711090087890625);
    float _3702 = _3668 * 0.693147182464599609375;
    float _3704 = fma(_3686, _3700, 1.570728778839111328125);
    float _3706 = _3702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3708 = sqrt(_3678);
    float _3710 = -_3644;
    float _3712 = fma(_3684, _3688, _3710);
    float _3714 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3690);
    float _3716 = fma(_3712, 0.5, 0.5);
    float _3718 = _3698 * _3696;
    float _3720 = _3714 * _3696;
    float _3722 = fma(_3718, -0.5, 0.5);
    float _3724 = fma(_3720, 0.5, 0.5);
    float _3726 = _3708 * 0.636619746685028076171875;
    float3 _9507 = float3(_3724, _3722, _3706);
    float _3728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9507, float3(0.0), isnan(_9507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9507, float3(0.0), isnan(_9507)), level(0.0)).x;
    float3 _9518 = float3(_3724, _3722, _3706);
    float4 _3731 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9518, float3(0.0), isnan(_9518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9518, float3(0.0), isnan(_9518)), level(0.0)).xyzw;
    float _3733 = _3731.x;
    float _3735 = _3731.y;
    float _3737 = _3731.z;
    float _3739 = _3731.w;
    float _3741 = -_3704;
    float _3743 = fma(_3726, _3741, 1.0);
    float2 _9540 = float2(_3743, _3716);
    float3 _3747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9540, float2(0.0), isnan(_9540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9540, float2(0.0), isnan(_9540)), level(0.0)).xyz;
    float _3749 = _3747.x;
    float _3751 = _3747.y;
    float _3753 = _3747.z;
    float _3755 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3759 = _3360 * _3416;
    bool _3761 = _3360 > 0.0;
    bool _3763 = isnan(_3360);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan(0.0);
    bool _3769 = _3765 || _3767;
    float _3771 = _3666 * 0.5;
    float _3773 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3757);
    float _3775 = exp2(_3755);
    float _3777 = _3759 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3779 = _3416 <= 0.0;
    bool _3781 = !_3769;
    bool _3783 = _3779 || _3781;
    float _3785 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3787 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3785);
    float _3789 = _3714 + _3666;
    float _3791 = fma(_3698, -0.5, _3771);
    float _3793 = _3777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3795 = _3787 + _3666;
    float _3797 = _3789 * 0.5;
    out.gl_Position.x = _3714;
    out.gl_Position.y = _3698;
    out.gl_Position.z = _3787;
    out.gl_Position.w = _3666;
    float _3799 = _3795 * 0.5;
    float _3801 = -_3775;
    float _3803 = _3801 + 1.0;
    out.m_45.x = _3793;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3797;
    out.m_70.y = _3791;
    out.m_70.z = _3799;
    out.m_70.w = _3666;
    float _3807 = -_3805;
    float _3809 = _3807 + 1.0;
    float _3811 = _3805 * _3728;
    float _3813 = _3739 * _3809;
    float _3815 = _3739 * _3811;
    float _3817 = _3753 * _3811;
    float _3819 = fma(_3749, _3815, _3733);
    float _3821 = fma(_3751, _3815, _3735);
    float _3823 = fma(_3739, _3817, _3737);
    out.m_72.x = _3819;
    out.m_72.y = _3821;
    out.m_72.z = _3823;
    out.m_72.w = _3813;
    if (!_3783)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3825;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    bool _889 = false;
    bool _747 = false;
    bool _499 = false;
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
        float _3882 = as_type<float>(_107);
        out.gl_Position.z = _3882;
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
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
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
        out.m_45.x = 0.0;
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
        float _3952 = as_type<float>(_145);
        out.gl_Position.z = _3952;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _149 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _149);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _273 = !_161;
    float _275 = _271;
    float _277 = _269;
    if (!_273)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _149 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _213 = _297;
    }
    float _299 = _213;
    float _301 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _299;
    if (!_161)
    {
        float _311 = _125 * _125;
        float _313 = _311 * 0.5;
        _275 = _313;
    }
    float _315 = _275;
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _305);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_161;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _125 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _125);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _317);
    float _369 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _377 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _379 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].y, _375);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _377);
    float _387 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _163, _367);
    float _391 = fma(_299, _165, _369);
    float _393 = fma(_299, _167, _379);
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].x, _381);
    float _397 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].y, _383);
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_161)
    {
        _309 = _125;
    }
    float _401 = _309;
    bool _403 = !_161;
    float _405 = _401;
    if (!_403)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _125 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _405 = _425;
    }
    float _427 = _405;
    float _429 = fma(_427, _165, _397);
    float _431 = fma(_427, _163, _395);
    float _433 = fma(_427, _167, _399);
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = fma(_391, _151, _171);
    float _439 = -_429;
    float _441 = _391 + _439;
    float _443 = fma(_389, _151, _169);
    float _445 = -_431;
    float _447 = _389 + _445;
    float _449 = -_433;
    float _451 = _393 + _449;
    float _453 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _455 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = fma(_393, _151, _173);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    bool _473 = !_435;
    float _475 = _469;
    float _477 = _467;
    float _479 = _471;
    float _497;
    if (!_473)
    {
        float _481 = in.m_54.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        float _501 = float(_91);
        float _503 = 1.0 / _501;
        float _505 = _125 * _503;
        _497 = _505;
    }
    _499 = false;
    float _507 = _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _507 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _533 = 1.0 / _519;
    bool _535 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _537 = isnan(_507);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _523;
    float _551 = 1.0 / _527;
    float _553 = _511 * _533;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _507 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _507 + _559;
    float _563 = 1.0 / _531;
    float _565 = _515 * _549;
    bool _567 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_507);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _557 * _551;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    bool _585 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_507);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_545;
    float _599 = _597 + 1.0;
    float _601 = fma(_583, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _577 * _599;
    float _609 = _561 * _563;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _623 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_507);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_613, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _637 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _639 = isnan(_507);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _595 * _617;
    float _651 = -_595;
    float _653 = _651 + 1.0;
    float _655 = fma(_605, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _657 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _659 = _647 * _653;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = -_633;
    float _667 = _665 + 1.0;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _673;
    float _677 = _633 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = fma(_675, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _601 * _677;
    float _687 = _635 * _677;
    float _689 = fma(_681, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _695 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _697 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].y, _687);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _703 = fma(_693, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_655, _659, _695);
    float _707 = fma(_657, _659, _697);
    float _709 = fma(_701, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _711 = fma(_689, _649, _705);
    float _713 = fma(_683, _649, _707);
    float _715 = fma(_703, _607, _711);
    float _717 = fma(_709, _607, _713);
    float _719 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].x, _715);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].y, _717);
    float _723 = _719 * _669;
    float _725 = _721 * _671;
    bool _727 = !_547;
    float _745;
    if (!_727)
    {
        float _729 = in.m_54.x;
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_91);
        float _751 = 1.0 / _749;
        float _753 = _125 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _759 = _755 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _765 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _781 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _783 = isnan(_755);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _793;
    bool _797 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _799 = isnan(_755);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = 1.0 / _763;
    float _811 = -_775;
    float _813 = _811 + 1.0;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _817 = 1.0 / _779;
    float _819 = _795 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _825 = fma(_819, _759, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _827 = _791 * _813;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = -_791;
    float _835 = _833 + 1.0;
    float _837 = _823 * _817;
    float _839 = _825 * _827;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _755 + _841;
    float _845 = _775 * _831;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _849 = fma(_837, _843, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_849, _845, _847);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _859 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[117].x, _851);
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _861;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _867;
    bool _869 = !_815;
    float _887;
    if (!_869)
    {
        float _871 = in.m_54.x;
        float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _879 = _877 * _873;
        float _881 = floor(_879);
        float _883 = -_881;
        float _885 = _879 + _883;
        _887 = _885;
        _889 = true;
    }
    else
    {
        float _891 = float(_91);
        float _893 = 1.0 / _891;
        float _895 = _125 * _893;
        _887 = _895;
    }
    _889 = false;
    float _897 = _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _901 = _897 + _899;
    bool _903 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_897);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _915;
    bool _919 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _921 = isnan(_897);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_913;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _935;
    float _939 = 1.0 / _917;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = _929 * _933;
    float _945 = -_929;
    float _947 = _945 + 1.0;
    float _949 = _901 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = fma(_937, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_953, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _963 = fma(_959, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _965 = _955 * _943;
    float _967 = _963 * _943;
    float _969 = _961 * _943;
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _973 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].y, _967);
    float _975 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].z, _969);
    float _977 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].x, _971);
    float _979 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].y, _973);
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].z, _975);
    bool _983 = !_941;
    float _1007;
    float _1009;
    float _1011;
    if (!_983)
    {
        float _985 = in.m_54.x;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _989 = float(_91);
        float _991 = 1.0 / _989;
        float _993 = _985 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _995 = _125 * _991;
        float _997 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _999 = _997 * _987;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _995;
        _1009 = _1005;
        _1011 = _989;
        _1013 = true;
    }
    else
    {
        float _1015 = float(_91);
        float _1017 = 1.0 / _1015;
        float _1019 = _125 * _1017;
        _1007 = _1019;
        _1009 = _1019;
        _1011 = _1015;
    }
    _1013 = false;
    float _1021 = _1007;
    float _1023 = _1009;
    float _1025 = _1011;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1029 = int(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1033 = _1021 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1037 = _1021 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1045 = int(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1057 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1059 = isnan(_1023);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1071 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1073 = isnan(_1023);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = 1.0 / _1025;
    float _1085 = float(_1029);
    bool _1087 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1089 = isnan(_1021);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    bool _1099 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1101 = isnan(_1021);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1113 = isnan(_1021);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = 1.0 / _1085;
    float _1125 = float(uint(_1045));
    int _1127 = ~_1045;
    int _1129 = _1127 + 1;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    bool _1135 = _1045 == 0;
    float _1137 = 1.0 / _1125;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1141 = _125 * _1123;
    float _1143 = 1.0 / _1041;
    int _1145 = as_type<int>(_1137) + (-2);
    float _1147 = trunc(_1141);
    int _1149 = int(_1147);
    float _1151 = 1.0 / _1049;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1155 = _1153 != 0;
    float _1157 = 1.0 / _1053;
    float _1159 = float(uint(_1149));
    bool _1161 = !_1155;
    float _1163 = _1161 ? 1.2345600128173828125 : 1.0;
    float _1165 = as_type<float>(_1145) * _1159;
    float _1167 = in.m_54.x;
    float _1169 = in.m_54.y;
    float _1171 = in.m_54.z;
    float _1173 = in.m_54.w;
    float _1175 = trunc(_1165);
    float _1177 = precise::max(_1175, 0.0);
    uint _1180 = uint(_1177);
    int _1182 = ~_1045;
    int _1184 = _1182 + 1;
    int _1186 = _1129 * int(_1180);
    int _1188 = _1186 + _1149;
    float _1190 = float(uint(_1188));
    float _1192 = _1167 * 2.0;
    bool _1194 = !_1155;
    float _1196 = _1194 ? _1169 : _1167;
    float _1198 = 0.0;
    if (!_1155)
    {
        _1198 = _1169;
    }
    float _1200 = _1198;
    float _1202 = as_type<float>(_1145) * _1190;
    float _1204 = floor(_1192);
    float _1206 = _1163 * _1196;
    float _1208 = 0.0;
    float _1210 = _1200;
    if (!_1155)
    {
        _1208 = _1171;
    }
    float _1212 = _1208;
    float _1214 = 0.0;
    float _1216 = _1212;
    if (_1155)
    {
        _1214 = _1167;
    }
    float _1218 = _1214;
    float _1220 = 0.0;
    float _1222 = _1218;
    if (_1155)
    {
        _1220 = _1169;
    }
    float _1224 = _1220;
    float _1226 = trunc(_1202);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1224;
    if (_1155)
    {
        _1216 = _1169;
    }
    float _1236 = _1216;
    if (!_1155)
    {
        _1222 = _1171;
    }
    float _1238 = _1222;
    if (_1155)
    {
        _1210 = _1167;
    }
    float _1240 = _1210;
    float _1242 = floor(_1206);
    if (!_1155)
    {
        _1234 = _1167;
    }
    float _1244 = _1234;
    int _1246 = int(_1180) + int(_1230);
    float _1248 = float(_1045);
    float _1250 = float(_1149);
    int _1252 = _1184 * _1246;
    int _1254 = _1252 + _1149;
    bool _1256 = _1250 >= _1248;
    bool _1258 = isnan(_1250);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1248);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1242;
    float _1270 = _1206 + _1268;
    bool _1272 = uint(_1254) >= uint(_1045);
    float _1274 = trunc(_1266);
    int _1276 = int(_1274);
    bool _1278 = !_1272;
    int _1280 = _1278 ? 0 : (-1);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1284 = _1282 != 0;
    int _1286 = ~_1246;
    int _1288 = _1286 + _1280;
    int _1290 = _1288 + 1;
    float _1292 = _1270 * _1248;
    float _1294 = _125 * _1248;
    bool _1296 = !_1284;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _1045 * _1290;
    int _1302 = _1300 + _1149;
    float _1304 = _1294 * _1083;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1312 = !_1135;
    int _1314 = _1312 ? _1302 : (-1);
    int _1316 = ~_1276;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1338 = _1336 != 0;
    int _1340 = _1045 + (-1);
    int _1342 = _1314 * _1320;
    float _1344 = trunc(_1304);
    int _1346 = int(_1344);
    bool _1348 = !_1330;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1322);
    int _1354 = _1276 * _1340;
    int _1356 = _1354 + _1342;
    bool _1358 = !_1326;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = abs(_1350);
    float _1364 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1366 = abs(_1298);
    bool _1368 = !_1334;
    int _1370 = _1368 ? 0 : 1;
    int _1372 = abs(_1360);
    int _1374 = _1308 * _1366;
    int _1376 = _1374 + _1149;
    bool _1378 = !_1338;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1370);
    int _1384 = _1356 * _1362;
    int _1386 = abs(_1380);
    int _1388 = _1346 * _1372;
    int _1390 = _1388 + _1384;
    float _1392 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1394 = ~_1045;
    int _1396 = _1394 + 1;
    int _1398 = _1376 * _1382;
    int _1400 = _1398 + _1390;
    int _1402 = ~_1045;
    int _1404 = _1402 + 1;
    float _1406 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    bool _1408 = _1171 > 0.5;
    int _1410 = _1308 * _1386;
    int _1412 = _1410 + _1400;
    bool _1414 = _1169 > 0.5;
    float _1416 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1406);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1412));
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = as_type<float>(_1145) * _1422;
    float _1428 = trunc(_1426);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1436 = _1404 * int(_1432);
    int _1438 = _1436 + _1412;
    float _1440 = float(uint(_1438));
    float _1442 = as_type<float>(_1145) * _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1448 = trunc(_1442);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = 1.0 / _1446;
    int _1456 = int(_1432) + int(_1452);
    float _1458 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1460 = -_227;
    int _1462 = _1414 ? as_type<int>(_1460) : as_type<int>(_227);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1468 = _1396 * _1456;
    int _1470 = _1468 + _1412;
    bool _1472 = !_1420;
    float _1474 = _1472 ? _227 : as_type<float>(_1462);
    float _1476 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1458);
    float _1478 = 1.0 / _1466;
    bool _1480 = uint(_1470) >= uint(_1045);
    float _1482 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    float _1484 = -_223;
    int _1486 = _1414 ? as_type<int>(_1484) : as_type<int>(_223);
    bool _1488 = !_1480;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1494 = _1173 > 0.5;
    int _1496 = ~_1456;
    int _1498 = _1496 + _1490;
    int _1500 = _1498 + 1;
    float _1502 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1504 = -_223;
    int _1506 = _1408 ? as_type<int>(_1504) : as_type<int>(_223);
    int _1508 = _1045 * _1500;
    int _1510 = _1508 + _1412;
    float _1512 = -_227;
    int _1514 = _1494 ? as_type<int>(_1512) : as_type<int>(_227);
    float _1516 = -_1434;
    float _1518 = fma(_1502, 2.0, _1516);
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1522 = _1520 != 0;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1528 = -_125;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1518);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1534 = _1532 != 0;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1538 = _1536 != 0;
    float _1540 = 1.0 / _1526;
    bool _1542 = _1045 == 0;
    bool _1544 = !_1522;
    float _1546 = _1544 ? _223 : as_type<float>(_1506);
    float _1548 = -_227;
    int _1550 = _1408 ? as_type<int>(_1548) : as_type<int>(_227);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1554 = _1552 != 0;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1542;
    int _1566 = _1564 ? _1510 : (-1);
    bool _1568 = !_1538;
    float _1570 = _1568 ? _227 : as_type<float>(_1550);
    bool _1572 = !_1554;
    float _1574 = _1572 ? _227 : as_type<float>(_1514);
    int _1576 = _1566 & 3;
    bool _1578 = _1576 != 0;
    int _1580 = _1566 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1578 ? 0 : 1;
    bool _1586 = uint(_1580) > 1u;
    int _1588 = ~_1584;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    bool _1594 = !_1534;
    float _1596 = _1594 ? _223 : as_type<float>(_1486);
    int _1598 = _1592;
    if (!_1586)
    {
        int _1600 = ~_1584;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1610 = _1167 > 0.5;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1614 = 1.0 / _1608;
    float _1616 = -_223;
    int _1618 = _1610 ? as_type<int>(_1616) : as_type<int>(_223);
    float _1620 = fma(_1232, -2.0, _1612);
    bool _1622 = _1204 >= 0.0;
    bool _1624 = isnan(_1204);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan(0.0);
    bool _1630 = _1626 || _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1640 = !_1562;
    float _1642 = _1640 ? _223 : as_type<float>(_1618);
    int _1644 = _1630 ? 0 : 1;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1650 = _1204 > 0.0;
    float _1652 = _1169 * 2.0;
    int _1654 = ~_1644;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = _1638 * _1143;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1666 = 1.0 / _1648;
    float _1668 = _1634 * _1151;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1678 = _1672 * _1157;
    float _1680 = _1676 * _1454;
    float _1682 = floor(_1652);
    int _1684 = _1658;
    if (!_1650)
    {
        int _1686 = ~_1644;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _1171 * 2.0;
    float _1694 = 1.0 / _1664;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = _1698 * _1478;
    float _1714 = _1702 * _1540;
    float _1716 = _1706 * _1614;
    bool _1718 = _1682 >= 0.0;
    bool _1720 = isnan(_1682);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan(0.0);
    bool _1726 = _1722 || _1724;
    float _1728 = floor(_1692);
    float _1730 = _1710 * _1666;
    int _1732 = _1726 ? 0 : 1;
    bool _1734 = _1682 > 0.0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1736;
    int _1740 = ~_1732;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    float _1746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1748 = log2(_1746);
    float _1750 = _1169 + _1167;
    float _1752 = _1738 * _1694;
    float _1754 = fma(_1730, _1033, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1756 = _1694;
    int _1758 = _1744;
    if (!_1155)
    {
        _1756 = _1171;
    }
    float _1760 = _1756;
    float _1762 = _1750 + (-1.0);
    float _1764 = _1760;
    if (_1155)
    {
        _1764 = _1169;
    }
    float _1766 = _1764;
    float _1768 = fma(_1752, _1037, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1780 = _1778 != 0;
    if (!_1734)
    {
        int _1782 = ~_1732;
        int _1784 = _1782 + 1;
        _1758 = _1784;
    }
    int _1786 = _1758;
    bool _1788 = _1728 >= 0.0;
    bool _1790 = isnan(_1728);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.0);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1800 = isnan(_1021);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _125 * _1748;
    int _1812 = _1796 ? 0 : 1;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = exp2(_1810);
    float _1826 = -_1808;
    float _1828 = _1826 + 1.0;
    bool _1830 = !_1776;
    int _1832 = _1830 ? 0 : 1;
    bool _1834 = _1045 == 0;
    float _1836 = _1169 + _1171;
    float _1838 = _1836 + (-1.0);
    float _1840 = -_1824;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1848 = _1023 + _1846;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1854 = _1021 + _1852;
    float _1856 = _1822 ? _1842 : 0.0;
    float _1858 = fma(_1668, _1848, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1862 = _1021 + _1860;
    bool _1864 = _1728 > 0.0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1868 = _1023 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1872 = _1021 + _1870;
    float _1874 = fma(_1680, _1862, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1876 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1878 = isnan(_1021);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1660, _1868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1890 = fma(_1716, _1854, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1892 = fma(_1678, _1872, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1896 = _1021 + _1894;
    bool _1898 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1900 = isnan(_1021);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1912 = _1021 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1714, _1896, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1920 = fma(_1712, _1912, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1922 = _1908 * _1916;
    bool _1924 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1926 = isnan(_1023);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = -_1908;
    float _1938 = _1936 + 1.0;
    bool _1940 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1942 = isnan(_1021);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = _1808 * _1938;
    bool _1954 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1956 = isnan(_1021);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 * _1828;
    float _1968 = -_1950;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1974 = -_1934;
    float _1976 = _1974 + 1.0;
    float _1978 = _1964 * _1970;
    float _1980 = -_1964;
    float _1982 = _1980 + 1.0;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    float _1988 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1972);
    float _1990 = _1081 * _1976;
    float _1992 = _1121 * _1982;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1988);
    float _1998 = -_1081;
    float _2000 = _1998 + 1.0;
    float _2002 = _1109 * _1133;
    float _2004 = _1996 * (-0.15915493667125701904296875);
    float _2006 = _1067 * _2000;
    float _2008 = -_1109;
    float _2010 = _2008 + 1.0;
    float _2012 = -_1067;
    float _2014 = _2012 + 1.0;
    float _2016 = _2004 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1858 * _2006;
    float _2022 = _1097 * _2010;
    float _2024 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2026 = -_1097;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2020);
    float _2032 = _1892 * _2022;
    float _2034 = _1856 * _1994;
    float _2036 = _2004 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    float _2040 = -_1139;
    float _2042 = fma(_2024, 2.0, _2040);
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2032);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2048 = fma(_1888, _1990, _2030);
    float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2054 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2046);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2058 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2060 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2052);
    float _2062 = _1474 * _2018;
    float _2064 = fma(_1874, _2002, _2044);
    float _2066 = _1474 * _2038;
    float _2068 = -_2056;
    float _2070 = fma(_2058, 2.0, _2068);
    float _2072 = -_2062;
    float _2074 = fma(_1642, _2038, _2072);
    float _2076 = _1596 + 0.5;
    float _2078 = -_125;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2042);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2084 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2086 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2090 = fma(_1642, _2018, _2066);
    float _2092 = fma(_2084, -2.0, _2082);
    float _2094 = fma(_2086, _2076, _2080);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1364 + _2096;
    float _2100 = fma(_1920, _1992, _2064);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2070);
    float _2106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2112 = _1424 + _2110;
    float _2114 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2116 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2120 = _1492 + _2118;
    float _2122 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2048);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2114);
    float _2126 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2128 = _1546 + 0.5;
    int _2130 = ~_1812;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2124);
    float _2138 = _2074 + 0.5;
    float _2140 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2104);
    float _2142 = fma(_2116, -2.0, _2108);
    int _2144 = _2134;
    if (!_1864)
    {
        int _2146 = ~_1812;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = fma(_2126, _2138, _1530);
    bool _2154 = !_1772;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2160 = fma(_1918, _1978, _2100);
    bool _2162 = _2136 >= 0.0;
    float _2164 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2166 = abs(_1832);
    float _2168 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _2170 = float(_1690);
    float _2172 = _2090 + (-0.5);
    float _2174 = _1574 + (-0.5);
    float _2176 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2092);
    int _2178 = abs(_2156);
    float _2180 = -_2164;
    float _2182 = -_2168;
    float _2184 = fma(_2180, _2172, _2182);
    float _2186 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2188 = -_2174;
    float _2190 = -_2176;
    float _2192 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2190);
    float _2194 = float(_2150);
    float _2196 = _981 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2198 = float(_2178);
    float _2200 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2202 = float(_2166);
    float _2204 = _2122 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2206 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2198 * _2194;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _2202 * _2170;
    float _2214 = float(uint(_1376));
    float _2216 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2218 = _1570 + (-0.5);
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2142);
    float _2222 = fma(_1890, _1966, _2160);
    int _2224 = _1566 >> 31;
    float _2226 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2054);
    float _2228 = -_2216;
    float _2230 = -_2220;
    float _2232 = fma(_2228, _2218, _2230);
    float _2234 = as_type<float>(_1145) * _2214;
    int _2236 = _2224 & 3;
    float _2238 = -_2226;
    float _2240 = _2238 + 1.0;
    out.m_58.x = _2206;
    out.m_58.y = _2200;
    out.m_58.z = _2210;
    out.m_58.w = _2204;
    float _2242 = trunc(_2234);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = -_2240;
    float _2250 = fma(_1546, _2248, _2140);
    float _2252 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2060);
    float _2254 = fma(_1754, _1952, _2222);
    float _2256 = _2208 * (-2.0);
    float _2258 = _2212 * (-2.0);
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    float _2264 = fma(_1768, _1922, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_2162)
    {
        out.m_45.x = 0.0;
    }
    float _2268 = fma(_1844, _2256, _1844);
    float _2270 = fma(_1574, _2262, _2192);
    bool _2272 = !_1582;
    int _2274 = _2272 ? 0 : 1;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2278 = _1566 + _2236;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2282 = ~_1045;
    int _2284 = _2282 + 1;
    float _2286 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2276);
    int _2288 = _2278 >> 2;
    float _2290 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2280);
    bool _2292 = uint(_1580) >= 2u;
    float _2294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2286);
    int _2296 = _2288 << 4;
    int _2298 = _2296 + 512;
    float _2300 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2290);
    int _2302 = _2284 * int(_2246);
    int _2304 = _2302 + _1376;
    float _2306 = -_2294;
    float _2308 = _2306 + 1.0;
    uint _2310 = uint(int(uint(_2298) >> uint(2)));
    uint _2312 = uint(int(uint(int(_2310)) >> uint(2)));
    int _2314 = int(_2310) & 3;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[int(_2312)][_2314];
    int _2318 = int(_2310) + 1;
    uint _2320 = uint(int(uint(_2318) >> uint(2)));
    int _2322 = _2318 & 3;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[int(_2320)][_2322];
    float _2326 = -_2300;
    float _2328 = _2326 + 1.0;
    float _2330 = in.m_60.x;
    float _2332 = in.m_60.y;
    float _2334 = in.m_60.z;
    float _2336 = -_2308;
    float _2338 = fma(_2074, _2336, _2152);
    float _2340 = float(uint(_2304));
    float _2342 = fma(_2090, _2328, _2184);
    int _2344 = _2292 ? 0 : 1;
    float _2346 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2264);
    int _2348 = _2298 + 8;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    uint _2352 = uint(int(uint(int(_2350)) >> uint(2)));
    int _2354 = int(_2350) & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    int _2358 = int(_2350) + 1;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    int _2362 = _2358 & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    float _2366 = as_type<float>(_1145) * _2340;
    bool _2368 = _1580 != 3;
    out.m_62.x = _2338;
    out.m_62.y = _2342;
    out.m_62.z = _2250;
    out.m_62.w = _2270;
    if (_2162)
    {
        _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2370 = _2266;
    float _2372 = fma(_1850, _2258, _1850);
    float _2374 = trunc(_2366);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    out.m_64.x = _2346;
    int _2380 = as_type<int>(_2370);
    if (_2162)
    {
        float _2382 = _2370 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    if (_2162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7424 = as_type<float>(_2384);
        out.gl_Position.z = _7424;
    }
    int _2386 = ~_1045;
    int _2388 = _2386 + 1;
    float _2390 = fma(_2256, _2330, _2330);
    int _2392 = ~_2344;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2258, _2332, _2332);
    int _2400 = _2396;
    if (_2368)
    {
        int _2402 = ~_2344;
        int _2404 = _2402 + 1;
        _2400 = _2404;
    }
    int _2406 = _2400;
    int _2408 = int(_2246) + int(_2378);
    int _2410 = abs(_1604);
    float _2412 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2414 = _1580 != 3;
    int _2416 = _2388 * _2408;
    int _2418 = _2416 + _1376;
    int _2420 = abs(_2274);
    int _2422 = abs(_2406);
    int _2424 = ~_2410;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2414;
    int _2432 = _2430 ? 0 : (-1);
    bool _2434 = uint(_2418) >= uint(_1045);
    int _2436 = ~_2420;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    int _2442 = _2428 * as_type<int>(_2324);
    float _2444 = _2098 * _2098;
    int _2446 = abs(_2432);
    int _2448 = _2440 * as_type<int>(_2316);
    int _2450 = _2448 + _2442;
    int _2452 = ~_2422;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    float _2458 = fma(_2112, _2112, _2444);
    bool _2460 = !_1558;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2446;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2356);
    int _2472 = _2470 + _2450;
    float _2474 = fma(_2120, _2120, _2458);
    bool _2476 = !_2434;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2468 * as_type<int>(_2364);
    int _2482 = _2480 + _2472;
    int _2484 = abs(_2462);
    float _2486 = rsqrt(_2474);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2490 = ~_2408;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    bool _2496 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2498 = isnan(1.0);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2504 = _2500 || _2502;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2508 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2488);
    int _2510 = _1045 * _2494;
    int _2512 = _2510 + _1376;
    int _2514 = ~_2484;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2506);
    float _2522 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2508);
    bool _2524 = !_1834;
    int _2526 = _2524 ? _2512 : (-1);
    int _2528 = _2482 * _2518;
    float _2530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2520);
    float _2532 = _2412 * _2486;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    int _2538 = _2526 * _2484;
    int _2540 = _2538 + _2528;
    float _2542 = -_2530;
    float _2544 = _2542 + 1.0;
    float _2546 = _2098 * _2532;
    float _2548 = -_2536;
    float _2550 = fma(_1596, _2548, _2094);
    float _2552 = _2112 * _2532;
    float _2554 = fma(_1570, _2544, _2232);
    float _2556 = -_2546;
    float _2558 = _2098 + _2556;
    float _2560 = float(_2540);
    float _2562 = _1167 + (-0.5);
    float _2564 = -_2552;
    float _2566 = _2112 + _2564;
    float _2568 = _2558 * _2558;
    out.m_66.x = _2550;
    out.m_66.y = _2554;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2390);
    bool _2572 = !_1780;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = fma(_2566, _2566, _2568);
    out.m_68.y = _2560;
    if (_2162)
    {
        return out;
    }
    float _2578 = -_2546;
    float _2580 = _1364 + _2578;
    float _2582 = _2120 * _2532;
    float _2584 = -_2552;
    float _2586 = _1424 + _2584;
    int _2588 = abs(_2574);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2592 = _2580 + _2590;
    float _2594 = -_2582;
    float _2596 = _1492 + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2600 = _2586 + _2598;
    bool _2602 = !_2504;
    float _2604 = _2602 ? _125 : _2034;
    float _2606 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2610 = _2596 + _2608;
    float _2612 = _1169 + (-0.5);
    float _2614 = float(_1786);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2606);
    float _2618 = float(_2588);
    float _2620 = fma(_2604, _2268, _2570);
    float _2622 = _1171 + _1167;
    float _2624 = fma(_2610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2616);
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2398);
    float _2628 = _2618 * _2614;
    float _2630 = _2620 * 0.15915493667125701904296875;
    float _2632 = _2622 + (-1.0);
    bool _2634 = _2624 >= 0.0;
    float _2636 = _2628 * (-2.0);
    float _2638 = -_2582;
    float _2640 = _2120 + _2638;
    float _2642 = fma(_2604, _2372, _2626);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2646 = fma(_2636, _2334, _2334);
    float _2648 = fma(_2640, _2640, _2576);
    float _2650 = _2642 * 0.15915493667125701904296875;
    float _2652 = _2630 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = _1171 + (-0.5);
    float _2658 = fma(_2644, _2636, _2644);
    float _2660 = as_type<float>(_2588);
    int _2662 = as_type<int>(_2656);
    float _2664 = _2580;
    float _2666 = _2610;
    if (_2634)
    {
        _2660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2668 = _2660;
    float _2670 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2646);
    if (_2634)
    {
        out.m_45.x = 0.0;
    }
    float _2672 = _2630 * 6.283185482025146484375;
    float _2674 = cos(_2672);
    if (_2634)
    {
        float _2676 = _2668 * 5.0;
        _2662 = as_type<int>(_2676);
    }
    int _2678 = _2662;
    float _2680 = fma(_2604, _2658, _2670);
    if (_2634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7871 = as_type<float>(_2678);
        out.gl_Position.z = _7871;
    }
    float _2682 = sqrt(_2648);
    float _2684 = _2680 * 0.15915493667125701904296875;
    float _2686 = _2650 * 6.283185482025146484375;
    float _2688 = sin(_2686);
    float _2690 = _2650 * 6.283185482025146484375;
    float _2692 = cos(_2690);
    if (_2634)
    {
        return out;
    }
    float _2694 = _2684 * 6.283185482025146484375;
    float _2696 = cos(_2694);
    float _2698 = _2486 * _2682;
    float _2700 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2704 = _2674 * _2692;
    float _2706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2708 = _2698 * _2700;
    float _2710 = _1069 * _2698;
    float _2712 = _2684 * 6.283185482025146484375;
    float _2714 = sin(_2712);
    float _2716 = _2674 * _2688;
    float _2718 = _2702 * _2708;
    float _2720 = _2654 * _2688;
    float _2722 = _2706 * _2710;
    float _2724 = _2654 * _2692;
    float _2726 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2728 = _2726 * 0.5;
    float _2730 = _2696 * _2718;
    float _2732 = _2674 * _2730;
    float _2734 = _2688 * _2696;
    float _2736 = _2692 * _2696;
    float _2738 = fma(_2714, _2704, _2720);
    float _2740 = -_2718;
    float _2742 = _2714 * _2740;
    float _2744 = fma(_2714, _2720, _2704);
    float _2746 = fma(_2738, _2722, _2732);
    float _2748 = -_2724;
    float _2750 = fma(_2714, _2716, _2748);
    float _2752 = -_2716;
    float _2754 = fma(_2714, _2724, _2752);
    float _2756 = _2654 * _2730;
    float _2758 = fma(_2736, _2722, _2742);
    float _2760 = fma(_2750, _2728, _2746);
    float _2762 = fma(_2754, _2722, _2756);
    float _2764 = fma(_2734, _2728, _2758);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2768 = fma(_2744, _2728, _2762);
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2766);
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2770);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2772);
    float _2778 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2780 = _2776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2784 = _1492 + _2780;
    float _2786 = _1424 + _2782;
    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2790 = _2784 + _2788;
    float _2792 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2796 = _2786 + _2794;
    float _2798 = _2790 * _2790;
    float _2800 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2792);
    float _2802 = fma(_2796, _2796, _2798);
    float _2804 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2800);
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2810 = _1364 + _2808;
    bool _2812 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = _2808;
    float _2816 = _2798;
    float _2818 = _2786;
    float _2820 = _2710;
    float _2822 = _2784;
    if (!_2812)
    {
        _2814 = _2786;
    }
    float _2824 = _2814;
    float _2826 = _2824;
    if (!_2812)
    {
        _2816 = _2784;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (!_2812)
    {
        _2818 = _2810;
    }
    float _2832 = _2818;
    bool _2834 = !_2812;
    float _2836 = _2832;
    if (!_2834)
    {
        float _2838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2842 = _2806 + _2840;
        float _2844 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = rsqrt(_2802);
        float _2848 = _2842 * _2838;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = _2850 * 6.283185482025146484375;
        float _2854 = cos(_2852);
        float _2856 = _2850 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2854 + (-1.0);
        float _2862 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2864 = fma(_2858, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2866 = fma(_2810, _2854, _2862);
        float _2868 = _2846 * _2864;
        float _2870 = fma(_2796, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2872 = fma(_2790, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2836 = _2866;
        _2826 = _2870;
        _2830 = _2872;
    }
    float _2874 = _2836;
    float _2876 = _2826;
    float _2878 = _2830;
    float _2880 = -_1364;
    float _2882 = _2880 + _2874;
    float _2884 = -_1424;
    float _2886 = _2884 + _2876;
    float _2888 = -_1492;
    float _2890 = _2888 + _2878;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = sqrt(_2896);
    bool _2900 = _2898 > 0.0;
    float _2902 = _2894;
    float _2904 = _2898;
    float _2906 = _2874;
    if (!_2900)
    {
        _2902 = _2876;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    float _2912 = _2908;
    if (!_2900)
    {
        _2904 = _2878;
    }
    float _2914 = _2904;
    bool _2916 = !_2900;
    float _2918 = _2914;
    float _2920 = _2914;
    if (!_2916)
    {
        bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2924 = _2796;
        if (_2922)
        {
            float _2926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2924 = _2926;
        }
        float _2928 = _2924;
        float _2930 = _2928;
        if (_2922)
        {
            float _2932 = _467 * _2928;
            _2820 = _2932;
        }
        float _2934 = _2820;
        float _2936 = _2934;
        if (_2922)
        {
            float _2938 = _469 * _2928;
            _2822 = _2938;
        }
        float _2940 = _2822;
        float _2942 = _2940;
        if (_2922)
        {
            float _2944 = _471 * _2928;
            _2930 = _2944;
        }
        float _2946 = _2930;
        float _2948 = _2946;
        if (!_2922)
        {
            bool _2950 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan(1.0);
            bool _2958 = _2954 || _2956;
            float _2960 = _125 + 1.0;
            if (!_2958)
            {
                float _2962 = _2960 * _2960;
                float _2964 = _2962 * 0.5;
                _127 = _2964;
            }
            float _2966 = _127;
            float _2968 = _2966;
            if (!_2958)
            {
                float _2970 = _2966 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2968 = _2970;
            }
            float _2972 = _2968;
            bool _2974 = !_2958;
            float _2976 = _2972;
            if (!_2974)
            {
                float _2978 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2980 = log2(_2978);
                float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2984 = 1.0 + _2982;
                float _2986 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2988 = _2980 * _2960;
                float _2990 = 1.0 / _2984;
                float _2992 = _2986 * 0.693147182464599609375;
                float _2994 = exp2(_2988);
                float _2996 = 1.0 / _2992;
                float _2998 = _2994 + (-1.0);
                float _3000 = -_2998;
                float _3002 = fma(_3000, _2996, _2960);
                float _3004 = _3002 * _2990;
                float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2976 = _3006;
            }
            float _3008 = _2976;
            float _3010 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3012 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3014 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3016 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _3018 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _3020 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _3022 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3016);
            float _3024 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3018);
            float _3026 = _3018;
            if (!_2958)
            {
                _3026 = _2960;
            }
            float _3028 = _3026;
            float _3030 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3022);
            bool _3032 = !_2958;
            float _3034 = _3028;
            if (!_3032)
            {
                float _3036 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3038 = log2(_3036);
                float _3040 = _3038 * _2960;
                float _3042 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3044 = 1.0 + _3042;
                float _3046 = exp2(_3040);
                float _3048 = 1.0 / _3044;
                float _3050 = -_3046;
                float _3052 = _3050 + 1.0;
                float _3054 = _3052 * _3048;
                _3034 = _3054;
            }
            float _3056 = _3034;
            float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3020);
            float _3060 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3024);
            float _3062 = fma(_3056, _165, _3030);
            float _3064 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3058);
            float _3066 = fma(_3056, _163, _3060);
            float _3068 = -_429;
            float _3070 = _3068 + _3062;
            float _3072 = fma(_3056, _167, _3064);
            float _3074 = -_431;
            float _3076 = _3074 + _3066;
            float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3080 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3082 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3084 = -_433;
            float _3086 = _3084 + _3072;
            float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3078);
            float _3090 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3080);
            float _3092 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3082);
            float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3088);
            float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3090);
            float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3092);
            _475 = _3096;
            _477 = _3094;
            _479 = _3098;
            _2936 = _3094;
            _2942 = _3096;
            _2948 = _3098;
            _2918 = _3080;
            _2910 = _3090;
        }
        float _3100 = _475;
        float _3102 = _477;
        float _3104 = _479;
        float _3106 = _2936;
        float _3108 = _2942;
        float _3110 = _2948;
        float _3112 = _2918;
        float _3114 = _2910;
        float _3116 = _3100 * _3100;
        float _3118 = fma(_3102, _3102, _3116);
        float _3120 = fma(_3104, _3104, _3118);
        float _3122 = rsqrt(_2896);
        float _3124 = sqrt(_3120);
        float _3126 = _2886 * _3122;
        float _3128 = _2882 * _3122;
        float _3130 = _2890 * _3122;
        bool _3132 = _3124 > 0.0;
        float _3134 = _3114;
        float _3136 = _3112;
        if (!_3132)
        {
            _3134 = _2876;
        }
        float _3138 = _3134;
        _2912 = _3138;
        if (!_3132)
        {
            _3136 = _2878;
        }
        float _3140 = _3136;
        bool _3142 = !_3132;
        _2920 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3120);
            float _3146 = _3144 * _3100;
            float _3148 = _3144 * _3102;
            float _3150 = _3144 * _3104;
            float _3152 = _3128 * _3146;
            float _3154 = fma(_3126, _3148, _3152);
            float _3156 = fma(_3130, _3150, _3154);
            float _3158 = _3156 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3106, _3158, _2876);
            float _3162 = fma(_3108, _3158, _2874);
            float _3164 = fma(_3110, _3158, _2878);
            _2906 = _3162;
            _2920 = _3164;
            _2912 = _3160;
        }
    }
    float _3166 = _2906;
    float _3168 = _2920;
    float _3170 = _2912;
    float _3172 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3174 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3176 = isnan(0.5);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3182 = _3178 || _3180;
    float _3184 = -_2546;
    float _3186 = _3184 + _3166;
    bool _3188 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3190 = isnan(0.5);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3196 = _3192 || _3194;
    float _3198 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3172);
    float _3200 = -_2582;
    float _3202 = _3200 + _3168;
    float _3204 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3198);
    float _3206 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3208 = _3204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3210 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3206);
    float _3212 = 1.0 / _3208;
    float _3214 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3210);
    float _3216 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3218 = _3216 + _3208;
    float _3220 = _3208;
    float _3222 = _3186;
    float _3224 = _3202;
    if (_3196)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    float _3228 = _3218 * _3212;
    float _3230 = _3228 * 0.5;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3234 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3232);
    float _3236 = -_2552;
    float _3238 = _3236 + _3170;
    float _3240 = 1.0 / _3234;
    float _3242 = _3238;
    float _3244 = _3234;
    float _3246 = _3226;
    if (!_3182)
    {
        float _3248 = _2592 * _2592;
        float _3250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3252 = -_1492;
        float _3254 = _3252 + _3168;
        float _3256 = -_1424;
        float _3258 = _3256 + _3170;
        float _3260 = fma(_2600, _2600, _3248);
        float _3262 = fma(_2610, _2610, _3260);
        float _3264 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3266 = sqrt(_3262);
        float _3268 = 1.0 / _2698;
        float _3270 = precise::min(_3266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3272 = _3270 * _3250;
        float _3274 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3276 = -_1364;
        float _3278 = _3276 + _3166;
        float _3280 = _3272 * _3268;
        float _3282 = _3274 * _3280;
        float _3284 = _3254 * _3280;
        float _3286 = fma(_3258, _3282, _2586);
        float _3288 = fma(_3278, _3282, _2580);
        float _3290 = fma(_3274, _3284, _2596);
        _3222 = _3288;
        _3242 = _3286;
        _3224 = _3290;
        _3244 = _3274;
    }
    float _3292 = _3222;
    float _3294 = _3242;
    float _3296 = _3224;
    float _3298 = _3244;
    float _3300 = _3298;
    if (_3196)
    {
        _3300 = 1.0;
    }
    float _3302 = _3300;
    float _3304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3306 = _3240 * _3304;
    float _3308 = _3302;
    float _3310 = _3306;
    if (!_3196)
    {
        float _3312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = _3312 * 0.15915493667125701904296875;
        float _3316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3318 = _3314 * 6.283185482025146484375;
        float _3320 = cos(_3318);
        float _3322 = _3316 * 0.15915493667125701904296875;
        float _3324 = _3314 * 6.283185482025146484375;
        float _3326 = sin(_3324);
        float _3328 = 1.0 / _3320;
        float _3330 = _3322 * 6.283185482025146484375;
        float _3332 = cos(_3330);
        float _3334 = _3326 * _3328;
        float _3336 = _3322 * 6.283185482025146484375;
        float _3338 = sin(_3336);
        float _3340 = _3332 * _3334;
        float _3342 = 1.0 / _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3344;
        float _3348 = 1.0 / _3346;
        float _3350 = _3338 * _3342;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_3306, _3350, _3352);
        float _3356 = _3354 * _3348;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3246 = _3358;
    }
    float _3360 = _3246;
    if (!_3196)
    {
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3364 = _3362 * 0.15915493667125701904296875;
        float _3366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3368 = _3364 * 6.283185482025146484375;
        float _3370 = cos(_3368);
        float _3372 = _3366 * 0.15915493667125701904296875;
        float _3374 = _3364 * 6.283185482025146484375;
        float _3376 = sin(_3374);
        float _3378 = 1.0 / _3370;
        float _3380 = _3372 * 6.283185482025146484375;
        float _3382 = cos(_3380);
        float _3384 = _3376 * _3378;
        float _3386 = _3372 * 6.283185482025146484375;
        float _3388 = sin(_3386);
        float _3390 = _3382 * _3384;
        float _3392 = 1.0 / _3390;
        float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3396 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3394;
        float _3398 = 1.0 / _3396;
        float _3400 = _3388 * _3392;
        float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3404 = fma(_3306, _3400, _3402);
        float _3406 = _3404 * _3398;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -_3408;
        float _3412 = _3410 + 1.0;
        _2664 = _3400;
        _3308 = _3412;
    }
    float _3414 = _2664;
    float _3416 = _3308;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3424 = _3294 + _3422;
    float _3426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3428 = _3296 + _3426;
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3420 * _3420;
    float _3434 = fma(_3424, _3424, _3432);
    float _3436 = fma(_3428, _3428, _3434);
    float _3438 = rsqrt(_3436);
    float _3440 = sqrt(_3436);
    float _3442 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3444 = _3424 * _3442;
    float _3446 = _3428 * _3442;
    float _3448 = _3444 * _3444;
    float _3450 = _3446 * _3446;
    float _3452 = _3448 + _3450;
    float _3454 = sqrt(_3452);
    bool _3456 = _3454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3460 = _3454 + _3458;
    float _3462 = _3438;
    float _3464 = _3452;
    float _3466 = _3460;
    float _3468 = _3414;
    float _3470 = _3420;
    if (_3456)
    {
        float _3472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3462 = _3472;
    }
    float _3474 = _3462;
    if (_3456)
    {
        float _3476 = rsqrt(_3452);
        _3464 = _3476;
    }
    float _3478 = _3464;
    float _3480 = _3478;
    if (_3456)
    {
        float _3482 = _3460 * _3474;
        _3466 = _3482;
    }
    float _3484 = _3466;
    if (_3456)
    {
        float _3486 = _3484 * 0.15915493667125701904296875;
        _3468 = _3486;
    }
    float _3488 = _3468;
    float _3490 = _3428;
    if (_3456)
    {
        float _3492 = _3488 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3500 = precise::max(0.0, _3498);
    float _3502 = _3474;
    float _3504 = _3500;
    if (_3456)
    {
        float _3506 = _3488 * 6.283185482025146484375;
        float _3508 = cos(_3506);
        _3502 = _3508;
    }
    float _3510 = _3502;
    float _3512 = -_3442;
    float _3514 = -_3500;
    float _3516 = fma(_3420, _3512, _3514);
    if (_3456)
    {
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3518;
    }
    float _3520 = _3470;
    float _3522 = _3520;
    float _3524 = _3496;
    if (_3456)
    {
        float _3526 = fma(_3496, _3520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = _3528;
    if (!_3456)
    {
        _3524 = _3444;
    }
    float _3532 = _3524;
    float _3534 = _3532;
    float _3536 = _3510;
    if (_3456)
    {
        float _3538 = _3510 + (-1.0);
        _3504 = _3538;
    }
    float _3540 = _3504;
    float _3542 = _3540;
    if (_3456)
    {
        float _3544 = _3478 * _3528;
        _2666 = _3544;
    }
    float _3546 = _2666;
    if (!_3456)
    {
        _3530 = _3516;
    }
    float _3548 = _3530;
    float _3550 = _3548;
    if (_3456)
    {
        float _3552 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3552;
    }
    float _3554 = _3310;
    if (_3456)
    {
        float _3556 = _3444 * _3546;
        _3534 = _3556;
    }
    float _3558 = _3534;
    if (!_3456)
    {
        _3542 = _3446;
    }
    float _3560 = _3542;
    float _3562 = _3560;
    if (_3456)
    {
        float _3564 = _3446 * _3546;
        _3562 = _3564;
    }
    float _3566 = _3562;
    if (!_3456)
    {
        _3480 = _3448;
    }
    float _3568 = _3480;
    float _3570 = _3568;
    if (_3456)
    {
        float _3572 = fma(_3516, _3510, _3554);
        _3550 = _3572;
    }
    float _3574 = _3550;
    if (_3456)
    {
        float _3576 = _3558 * _3558;
        _3570 = _3576;
    }
    float _3578 = _3570;
    if (!_3456)
    {
        _3536 = _3450;
    }
    float _3580 = _3536;
    float _3582 = _3580;
    if (_3456)
    {
        float _3584 = _3566 * _3566;
        _3582 = _3584;
    }
    float _3586 = _3582;
    float _3588 = fma(_3574, _3574, _3578);
    float _3590 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = _3588 + _3586;
    float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3596 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3594);
    float _3598 = precise::clamp(_3596, 0.0, 1.0);
    float _3600 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3602 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3604 = -_3598;
    float _3606 = _3604 + 1.0;
    float _3608 = rsqrt(_3592);
    float _3610 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3600);
    float _3612 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3614 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3602);
    float _3616 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3618 = _3610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3612);
    float _3622 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3614);
    float _3624 = abs(_3606);
    float _3626 = log2(_3624);
    float _3628 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3616);
    float _3630 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3620);
    float _3632 = _3622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3634 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3636 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3628);
    float _3638 = _3630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3642 = _3608 * _3558;
    float _3644 = _3608 * _3574;
    float _3646 = _3608 * _3566;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3640);
    float _3650 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3652 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3654 = -_3634;
    float _3656 = fma(_3654, _3430, 1.0);
    float _3658 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3648);
    float _3660 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3662 = -_3650;
    float _3664 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3662);
    float _3666 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3668 = log2(_3656);
    float _3670 = -_3646;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3664);
    float _3674 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3676 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3678 = fma(_3672, -0.5, 0.5);
    float _3680 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3674);
    float _3682 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3676);
    float _3684 = exp2(_3660);
    float _3686 = fma(_3672, 0.5, 0.5);
    float _3688 = _3644 + 1.0;
    float _3690 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3692 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3694 = fma(_3686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3696 = 1.0 / _3666;
    float _3698 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3692);
    float _3700 = fma(_3686, _3694, -0.212114393711090087890625);
    float _3702 = _3668 * 0.693147182464599609375;
    float _3704 = fma(_3686, _3700, 1.570728778839111328125);
    float _3706 = _3702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3708 = sqrt(_3678);
    float _3710 = -_3644;
    float _3712 = fma(_3684, _3688, _3710);
    float _3714 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3690);
    float _3716 = fma(_3712, 0.5, 0.5);
    float _3718 = _3698 * _3696;
    float _3720 = _3714 * _3696;
    float _3722 = fma(_3718, -0.5, 0.5);
    float _3724 = fma(_3720, 0.5, 0.5);
    float _3726 = _3708 * 0.636619746685028076171875;
    float3 _9507 = float3(_3724, _3722, _3706);
    float _3728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9507, float3(0.0), isnan(_9507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9507, float3(0.0), isnan(_9507)), level(0.0)).x;
    float3 _9518 = float3(_3724, _3722, _3706);
    float4 _3731 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9518, float3(0.0), isnan(_9518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9518, float3(0.0), isnan(_9518)), level(0.0)).xyzw;
    float _3733 = _3731.x;
    float _3735 = _3731.y;
    float _3737 = _3731.z;
    float _3739 = _3731.w;
    float _3741 = -_3704;
    float _3743 = fma(_3726, _3741, 1.0);
    float2 _9540 = float2(_3743, _3716);
    float3 _3747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9540, float2(0.0), isnan(_9540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9540, float2(0.0), isnan(_9540)), level(0.0)).xyz;
    float _3749 = _3747.x;
    float _3751 = _3747.y;
    float _3753 = _3747.z;
    float _3755 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3759 = _3360 * _3416;
    bool _3761 = _3360 > 0.0;
    bool _3763 = isnan(_3360);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan(0.0);
    bool _3769 = _3765 || _3767;
    float _3771 = _3666 * 0.5;
    float _3773 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3757);
    float _3775 = exp2(_3755);
    float _3777 = _3759 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3779 = _3416 <= 0.0;
    bool _3781 = !_3769;
    bool _3783 = _3779 || _3781;
    float _3785 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3787 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3785);
    float _3789 = _3714 + _3666;
    float _3791 = fma(_3698, -0.5, _3771);
    float _3793 = _3777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3795 = _3787 + _3666;
    float _3797 = _3789 * 0.5;
    out.gl_Position.x = _3714;
    out.gl_Position.y = _3698;
    out.gl_Position.z = _3787;
    out.gl_Position.w = _3666;
    float _3799 = _3795 * 0.5;
    float _3801 = -_3775;
    float _3803 = _3801 + 1.0;
    out.m_45.x = _3793;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3797;
    out.m_70.y = _3791;
    out.m_70.z = _3799;
    out.m_70.w = _3666;
    float _3807 = -_3805;
    float _3809 = _3807 + 1.0;
    float _3811 = _3805 * _3728;
    float _3813 = _3739 * _3809;
    float _3815 = _3739 * _3811;
    float _3817 = _3753 * _3811;
    float _3819 = fma(_3749, _3815, _3733);
    float _3821 = fma(_3751, _3815, _3735);
    float _3823 = fma(_3739, _3817, _3737);
    out.m_72.x = _3819;
    out.m_72.y = _3821;
    out.m_72.z = _3823;
    out.m_72.w = _3813;
    if (!_3783)
    {
        return out;
    }
    float _3825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3825;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1013 = false;
    bool _889 = false;
    bool _747 = false;
    bool _499 = false;
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
        float _3882 = as_type<float>(_107);
        out.gl_Position.z = _3882;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
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
        out.m_45.x = 0.0;
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
        float _3952 = as_type<float>(_145);
        out.gl_Position.z = _3952;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _149 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _149);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _267;
    }
    float _269 = _237;
    float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _273 = !_161;
    float _275 = _271;
    float _277 = _269;
    if (!_273)
    {
        float _279 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _281 = log2(_279);
        float _283 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _285 = _283 + 1.0;
        float _287 = 1.0 / _285;
        float _289 = _149 * _281;
        float _291 = exp2(_289);
        float _293 = -_291;
        float _295 = _293 + 1.0;
        float _297 = _295 * _287;
        _213 = _297;
    }
    float _299 = _213;
    float _301 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _307 = _271 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _309 = _299;
    if (!_161)
    {
        float _311 = _125 * _125;
        float _313 = _311 * 0.5;
        _275 = _313;
    }
    float _315 = _275;
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _303);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _305);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _307);
    float _323 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _325;
    }
    float _327 = _277;
    bool _329 = !_161;
    float _331 = _327;
    if (!_329)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = _125 * _335;
        float _345 = 1.0 / _339;
        float _347 = _341 * 0.693147182464599609375;
        float _349 = exp2(_343);
        float _351 = 1.0 / _347;
        float _353 = _349 + (-1.0);
        float _355 = -_353;
        float _357 = fma(_355, _351, _125);
        float _359 = _357 * _345;
        float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _361;
    }
    float _363 = _331;
    float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].x, _317);
    float _369 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].y, _319);
    float _371 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _373 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _375 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _377 = _365 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _379 = fma(_323, (*spvDescriptorSet0.vp_c10)._m0[10].z, _321);
    float _381 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].x, _373);
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].y, _375);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _377);
    float _387 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _389 = fma(_299, _163, _367);
    float _391 = fma(_299, _165, _369);
    float _393 = fma(_299, _167, _379);
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].x, _381);
    float _397 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].y, _383);
    float _399 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _385);
    if (!_161)
    {
        _309 = _125;
    }
    float _401 = _309;
    bool _403 = !_161;
    float _405 = _401;
    if (!_403)
    {
        float _407 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _409 = log2(_407);
        float _411 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _413 = _411 + 1.0;
        float _415 = 1.0 / _413;
        float _417 = _125 * _409;
        float _419 = exp2(_417);
        float _421 = -_419;
        float _423 = _421 + 1.0;
        float _425 = _423 * _415;
        _405 = _425;
    }
    float _427 = _405;
    float _429 = fma(_427, _165, _397);
    float _431 = fma(_427, _163, _395);
    float _433 = fma(_427, _167, _399);
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _437 = fma(_391, _151, _171);
    float _439 = -_429;
    float _441 = _391 + _439;
    float _443 = fma(_389, _151, _169);
    float _445 = -_431;
    float _447 = _389 + _445;
    float _449 = -_433;
    float _451 = _393 + _449;
    float _453 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _455 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _457 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = fma(_393, _151, _173);
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
    float _463 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _455);
    float _465 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _469 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    bool _473 = !_435;
    float _475 = _469;
    float _477 = _467;
    float _479 = _471;
    float _497;
    if (!_473)
    {
        float _481 = in.m_54.x;
        float _483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _487 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _489 = _487 * _483;
        float _491 = floor(_489);
        float _493 = -_491;
        float _495 = _489 + _493;
        _497 = _495;
        _499 = true;
    }
    else
    {
        float _501 = float(_91);
        float _503 = 1.0 / _501;
        float _505 = _125 * _503;
        _497 = _505;
    }
    _499 = false;
    float _507 = _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _507 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _507 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _533 = 1.0 / _519;
    bool _535 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _537 = isnan(_507);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _523;
    float _551 = 1.0 / _527;
    float _553 = _511 * _533;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _507 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _561 = _507 + _559;
    float _563 = 1.0 / _531;
    float _565 = _515 * _549;
    bool _567 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_507);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _557 * _551;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    bool _585 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _587 = isnan(_507);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = -_545;
    float _599 = _597 + 1.0;
    float _601 = fma(_583, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _607 = _577 * _599;
    float _609 = _561 * _563;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _611;
    float _615 = -_577;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _623 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _625 = isnan(_507);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_613, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _637 = _507 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _639 = isnan(_507);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _595 * _617;
    float _651 = -_595;
    float _653 = _651 + 1.0;
    float _655 = fma(_605, _565, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _657 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _659 = _647 * _653;
    float _661 = -_647;
    float _663 = _661 + 1.0;
    float _665 = -_633;
    float _667 = _665 + 1.0;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _673;
    float _677 = _633 * _663;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = fma(_675, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _601 * _677;
    float _687 = _635 * _677;
    float _689 = fma(_681, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _695 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _697 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[143].y, _687);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _703 = fma(_693, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_655, _659, _695);
    float _707 = fma(_657, _659, _697);
    float _709 = fma(_701, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _711 = fma(_689, _649, _705);
    float _713 = fma(_683, _649, _707);
    float _715 = fma(_703, _607, _711);
    float _717 = fma(_709, _607, _713);
    float _719 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].x, _715);
    float _721 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[147].y, _717);
    float _723 = _719 * _669;
    float _725 = _721 * _671;
    bool _727 = !_547;
    float _745;
    if (!_727)
    {
        float _729 = in.m_54.x;
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _733 = _729 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_91);
        float _751 = 1.0 / _749;
        float _753 = _125 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _759 = _755 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _765 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _767 = isnan(_755);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _781 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _783 = isnan(_755);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _793;
    bool _797 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _799 = isnan(_755);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = 1.0 / _763;
    float _811 = -_775;
    float _813 = _811 + 1.0;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _817 = 1.0 / _779;
    float _819 = _795 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _825 = fma(_819, _759, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _827 = _791 * _813;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = -_791;
    float _835 = _833 + 1.0;
    float _837 = _823 * _817;
    float _839 = _825 * _827;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _755 + _841;
    float _845 = _775 * _831;
    float _847 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[115].x, _839);
    float _849 = fma(_837, _843, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _851 = fma(_849, _845, _847);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _859 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[117].x, _851);
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _865 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _867 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _861;
    out.m_56.y = _863;
    out.m_56.z = _865;
    out.m_56.w = _867;
    bool _869 = !_815;
    float _887;
    if (!_869)
    {
        float _871 = in.m_54.x;
        float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _875 = _871 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _879 = _877 * _873;
        float _881 = floor(_879);
        float _883 = -_881;
        float _885 = _879 + _883;
        _887 = _885;
        _889 = true;
    }
    else
    {
        float _891 = float(_91);
        float _893 = 1.0 / _891;
        float _895 = _125 * _893;
        _887 = _895;
    }
    _889 = false;
    float _897 = _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _901 = _897 + _899;
    bool _903 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _905 = isnan(_897);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _915;
    bool _919 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _921 = isnan(_897);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = -_913;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _935;
    float _939 = 1.0 / _917;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = _929 * _933;
    float _945 = -_929;
    float _947 = _945 + 1.0;
    float _949 = _901 * _939;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _951;
    float _955 = fma(_937, _949, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _957;
    float _961 = fma(_953, _949, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _963 = fma(_959, _949, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _965 = _955 * _943;
    float _967 = _963 * _943;
    float _969 = _961 * _943;
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _973 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].y, _967);
    float _975 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[123].z, _969);
    float _977 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].x, _971);
    float _979 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].y, _973);
    float _981 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[124].z, _975);
    bool _983 = !_941;
    float _1007;
    float _1009;
    float _1011;
    if (!_983)
    {
        float _985 = in.m_54.x;
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _989 = float(_91);
        float _991 = 1.0 / _989;
        float _993 = _985 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _995 = _125 * _991;
        float _997 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _999 = _997 * _987;
        float _1001 = floor(_999);
        float _1003 = -_1001;
        float _1005 = _999 + _1003;
        _1007 = _995;
        _1009 = _1005;
        _1011 = _989;
        _1013 = true;
    }
    else
    {
        float _1015 = float(_91);
        float _1017 = 1.0 / _1015;
        float _1019 = _125 * _1017;
        _1007 = _1019;
        _1009 = _1019;
        _1011 = _1015;
    }
    _1013 = false;
    float _1021 = _1007;
    float _1023 = _1009;
    float _1025 = _1011;
    float _1027 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1029 = int(_1027);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1033 = _1021 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1037 = _1021 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1043 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1045 = int(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1055 = _977 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1057 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1059 = isnan(_1023);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1065 = _1061 || _1063;
    float _1067 = float(_1065);
    float _1069 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1071 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1073 = isnan(_1023);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = 1.0 / _1025;
    float _1085 = float(_1029);
    bool _1087 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1089 = isnan(_1021);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    bool _1099 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1101 = isnan(_1021);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    bool _1111 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1113 = isnan(_1021);
    bool _1115 = _1111 || _1113;
    bool _1117 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1119 = _1115 || _1117;
    float _1121 = float(_1119);
    float _1123 = 1.0 / _1085;
    float _1125 = float(uint(_1045));
    int _1127 = ~_1045;
    int _1129 = _1127 + 1;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    bool _1135 = _1045 == 0;
    float _1137 = 1.0 / _1125;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1141 = _125 * _1123;
    float _1143 = 1.0 / _1041;
    int _1145 = as_type<int>(_1137) + (-2);
    float _1147 = trunc(_1141);
    int _1149 = int(_1147);
    float _1151 = 1.0 / _1049;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1155 = _1153 != 0;
    float _1157 = 1.0 / _1053;
    float _1159 = float(uint(_1149));
    bool _1161 = !_1155;
    float _1163 = _1161 ? 1.2345600128173828125 : 1.0;
    float _1165 = as_type<float>(_1145) * _1159;
    float _1167 = in.m_54.x;
    float _1169 = in.m_54.y;
    float _1171 = in.m_54.z;
    float _1173 = in.m_54.w;
    float _1175 = trunc(_1165);
    float _1177 = precise::max(_1175, 0.0);
    uint _1180 = uint(_1177);
    int _1182 = ~_1045;
    int _1184 = _1182 + 1;
    int _1186 = _1129 * int(_1180);
    int _1188 = _1186 + _1149;
    float _1190 = float(uint(_1188));
    float _1192 = _1167 * 2.0;
    bool _1194 = !_1155;
    float _1196 = _1194 ? _1169 : _1167;
    float _1198 = 0.0;
    if (!_1155)
    {
        _1198 = _1169;
    }
    float _1200 = _1198;
    float _1202 = as_type<float>(_1145) * _1190;
    float _1204 = floor(_1192);
    float _1206 = _1163 * _1196;
    float _1208 = 0.0;
    float _1210 = _1200;
    if (!_1155)
    {
        _1208 = _1171;
    }
    float _1212 = _1208;
    float _1214 = 0.0;
    float _1216 = _1212;
    if (_1155)
    {
        _1214 = _1167;
    }
    float _1218 = _1214;
    float _1220 = 0.0;
    float _1222 = _1218;
    if (_1155)
    {
        _1220 = _1169;
    }
    float _1224 = _1220;
    float _1226 = trunc(_1202);
    float _1228 = precise::max(_1226, 0.0);
    uint _1230 = uint(_1228);
    float _1232 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1224;
    if (_1155)
    {
        _1216 = _1169;
    }
    float _1236 = _1216;
    if (!_1155)
    {
        _1222 = _1171;
    }
    float _1238 = _1222;
    if (_1155)
    {
        _1210 = _1167;
    }
    float _1240 = _1210;
    float _1242 = floor(_1206);
    if (!_1155)
    {
        _1234 = _1167;
    }
    float _1244 = _1234;
    int _1246 = int(_1180) + int(_1230);
    float _1248 = float(_1045);
    float _1250 = float(_1149);
    int _1252 = _1184 * _1246;
    int _1254 = _1252 + _1149;
    bool _1256 = _1250 >= _1248;
    bool _1258 = isnan(_1250);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(_1248);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1242;
    float _1270 = _1206 + _1268;
    bool _1272 = uint(_1254) >= uint(_1045);
    float _1274 = trunc(_1266);
    int _1276 = int(_1274);
    bool _1278 = !_1272;
    int _1280 = _1278 ? 0 : (-1);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1284 = _1282 != 0;
    int _1286 = ~_1246;
    int _1288 = _1286 + _1280;
    int _1290 = _1288 + 1;
    float _1292 = _1270 * _1248;
    float _1294 = _125 * _1248;
    bool _1296 = !_1284;
    int _1298 = _1296 ? 0 : 1;
    int _1300 = _1045 * _1290;
    int _1302 = _1300 + _1149;
    float _1304 = _1294 * _1083;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1312 = !_1135;
    int _1314 = _1312 ? _1302 : (-1);
    int _1316 = ~_1276;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1326 = _1324 != 0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1330 = _1328 != 0;
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1334 = _1332 != 0;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1338 = _1336 != 0;
    int _1340 = _1045 + (-1);
    int _1342 = _1314 * _1320;
    float _1344 = trunc(_1304);
    int _1346 = int(_1344);
    bool _1348 = !_1330;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1322);
    int _1354 = _1276 * _1340;
    int _1356 = _1354 + _1342;
    bool _1358 = !_1326;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = abs(_1350);
    float _1364 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1366 = abs(_1298);
    bool _1368 = !_1334;
    int _1370 = _1368 ? 0 : 1;
    int _1372 = abs(_1360);
    int _1374 = _1308 * _1366;
    int _1376 = _1374 + _1149;
    bool _1378 = !_1338;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1370);
    int _1384 = _1356 * _1362;
    int _1386 = abs(_1380);
    int _1388 = _1346 * _1372;
    int _1390 = _1388 + _1384;
    float _1392 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1394 = ~_1045;
    int _1396 = _1394 + 1;
    int _1398 = _1376 * _1382;
    int _1400 = _1398 + _1390;
    int _1402 = ~_1045;
    int _1404 = _1402 + 1;
    float _1406 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    bool _1408 = _1171 > 0.5;
    int _1410 = _1308 * _1386;
    int _1412 = _1410 + _1400;
    bool _1414 = _1169 > 0.5;
    float _1416 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1406);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1412));
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1426 = as_type<float>(_1145) * _1422;
    float _1428 = trunc(_1426);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1436 = _1404 * int(_1432);
    int _1438 = _1436 + _1412;
    float _1440 = float(uint(_1438));
    float _1442 = as_type<float>(_1145) * _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1448 = trunc(_1442);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    float _1454 = 1.0 / _1446;
    int _1456 = int(_1432) + int(_1452);
    float _1458 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1460 = -_227;
    int _1462 = _1414 ? as_type<int>(_1460) : as_type<int>(_227);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1468 = _1396 * _1456;
    int _1470 = _1468 + _1412;
    bool _1472 = !_1420;
    float _1474 = _1472 ? _227 : as_type<float>(_1462);
    float _1476 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1458);
    float _1478 = 1.0 / _1466;
    bool _1480 = uint(_1470) >= uint(_1045);
    float _1482 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    float _1484 = -_223;
    int _1486 = _1414 ? as_type<int>(_1484) : as_type<int>(_223);
    bool _1488 = !_1480;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1494 = _1173 > 0.5;
    int _1496 = ~_1456;
    int _1498 = _1496 + _1490;
    int _1500 = _1498 + 1;
    float _1502 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1504 = -_223;
    int _1506 = _1408 ? as_type<int>(_1504) : as_type<int>(_223);
    int _1508 = _1045 * _1500;
    int _1510 = _1508 + _1412;
    float _1512 = -_227;
    int _1514 = _1494 ? as_type<int>(_1512) : as_type<int>(_227);
    float _1516 = -_1434;
    float _1518 = fma(_1502, 2.0, _1516);
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1522 = _1520 != 0;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1528 = -_125;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1518);
    int _1532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1534 = _1532 != 0;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1538 = _1536 != 0;
    float _1540 = 1.0 / _1526;
    bool _1542 = _1045 == 0;
    bool _1544 = !_1522;
    float _1546 = _1544 ? _223 : as_type<float>(_1506);
    float _1548 = -_227;
    int _1550 = _1408 ? as_type<int>(_1548) : as_type<int>(_227);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1554 = _1552 != 0;
    int _1556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1558 = _1556 != 0;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1542;
    int _1566 = _1564 ? _1510 : (-1);
    bool _1568 = !_1538;
    float _1570 = _1568 ? _227 : as_type<float>(_1550);
    bool _1572 = !_1554;
    float _1574 = _1572 ? _227 : as_type<float>(_1514);
    int _1576 = _1566 & 3;
    bool _1578 = _1576 != 0;
    int _1580 = _1566 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1578 ? 0 : 1;
    bool _1586 = uint(_1580) > 1u;
    int _1588 = ~_1584;
    int _1590 = _1588 + 1;
    int _1592 = _1590 + 1;
    bool _1594 = !_1534;
    float _1596 = _1594 ? _223 : as_type<float>(_1486);
    int _1598 = _1592;
    if (!_1586)
    {
        int _1600 = ~_1584;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1610 = _1167 > 0.5;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1614 = 1.0 / _1608;
    float _1616 = -_223;
    int _1618 = _1610 ? as_type<int>(_1616) : as_type<int>(_223);
    float _1620 = fma(_1232, -2.0, _1612);
    bool _1622 = _1204 >= 0.0;
    bool _1624 = isnan(_1204);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan(0.0);
    bool _1630 = _1626 || _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1640 = !_1562;
    float _1642 = _1640 ? _223 : as_type<float>(_1618);
    int _1644 = _1630 ? 0 : 1;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1650 = _1204 > 0.0;
    float _1652 = _1169 * 2.0;
    int _1654 = ~_1644;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = _1638 * _1143;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1666 = 1.0 / _1648;
    float _1668 = _1634 * _1151;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1678 = _1672 * _1157;
    float _1680 = _1676 * _1454;
    float _1682 = floor(_1652);
    int _1684 = _1658;
    if (!_1650)
    {
        int _1686 = ~_1644;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _1171 * 2.0;
    float _1694 = 1.0 / _1664;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1704;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1712 = _1698 * _1478;
    float _1714 = _1702 * _1540;
    float _1716 = _1706 * _1614;
    bool _1718 = _1682 >= 0.0;
    bool _1720 = isnan(_1682);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan(0.0);
    bool _1726 = _1722 || _1724;
    float _1728 = floor(_1692);
    float _1730 = _1710 * _1666;
    int _1732 = _1726 ? 0 : 1;
    bool _1734 = _1682 > 0.0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1736;
    int _1740 = ~_1732;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    float _1746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1748 = log2(_1746);
    float _1750 = _1169 + _1167;
    float _1752 = _1738 * _1694;
    float _1754 = fma(_1730, _1033, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1756 = _1694;
    int _1758 = _1744;
    if (!_1155)
    {
        _1756 = _1171;
    }
    float _1760 = _1756;
    float _1762 = _1750 + (-1.0);
    float _1764 = _1760;
    if (_1155)
    {
        _1764 = _1169;
    }
    float _1766 = _1764;
    float _1768 = fma(_1752, _1037, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1772 = _1770 != 0;
    int _1774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1776 = _1774 != 0;
    int _1778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1780 = _1778 != 0;
    if (!_1734)
    {
        int _1782 = ~_1732;
        int _1784 = _1782 + 1;
        _1758 = _1784;
    }
    int _1786 = _1758;
    bool _1788 = _1728 >= 0.0;
    bool _1790 = isnan(_1728);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.0);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1800 = isnan(_1021);
    bool _1802 = _1798 || _1800;
    bool _1804 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1806 = _1802 || _1804;
    float _1808 = float(_1806);
    float _1810 = _125 * _1748;
    int _1812 = _1796 ? 0 : 1;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = exp2(_1810);
    float _1826 = -_1808;
    float _1828 = _1826 + 1.0;
    bool _1830 = !_1776;
    int _1832 = _1830 ? 0 : 1;
    bool _1834 = _1045 == 0;
    float _1836 = _1169 + _1171;
    float _1838 = _1836 + (-1.0);
    float _1840 = -_1824;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1848 = _1023 + _1846;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1854 = _1021 + _1852;
    float _1856 = _1822 ? _1842 : 0.0;
    float _1858 = fma(_1668, _1848, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1862 = _1021 + _1860;
    bool _1864 = _1728 > 0.0;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1868 = _1023 + _1866;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1872 = _1021 + _1870;
    float _1874 = fma(_1680, _1862, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1876 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1878 = isnan(_1021);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1884 = _1880 || _1882;
    float _1886 = float(_1884);
    float _1888 = fma(_1660, _1868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1890 = fma(_1716, _1854, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1892 = fma(_1678, _1872, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1896 = _1021 + _1894;
    bool _1898 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1900 = isnan(_1021);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1912 = _1021 + _1910;
    float _1914 = -_1886;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1714, _1896, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1920 = fma(_1712, _1912, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1922 = _1908 * _1916;
    bool _1924 = _1023 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1926 = isnan(_1023);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1932 = _1928 || _1930;
    float _1934 = float(_1932);
    float _1936 = -_1908;
    float _1938 = _1936 + 1.0;
    bool _1940 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1942 = isnan(_1021);
    bool _1944 = _1940 || _1942;
    bool _1946 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1948 = _1944 || _1946;
    float _1950 = float(_1948);
    float _1952 = _1808 * _1938;
    bool _1954 = _1021 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1956 = isnan(_1021);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 * _1828;
    float _1968 = -_1950;
    float _1970 = _1968 + 1.0;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1974 = -_1934;
    float _1976 = _1974 + 1.0;
    float _1978 = _1964 * _1970;
    float _1980 = -_1964;
    float _1982 = _1980 + 1.0;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1986 = 1.0 + _1984;
    float _1988 = fma(_1171, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1972);
    float _1990 = _1081 * _1976;
    float _1992 = _1121 * _1982;
    float _1994 = 1.0 / _1986;
    float _1996 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1988);
    float _1998 = -_1081;
    float _2000 = _1998 + 1.0;
    float _2002 = _1109 * _1133;
    float _2004 = _1996 * (-0.15915493667125701904296875);
    float _2006 = _1067 * _2000;
    float _2008 = -_1109;
    float _2010 = _2008 + 1.0;
    float _2012 = -_1067;
    float _2014 = _2012 + 1.0;
    float _2016 = _2004 * 6.283185482025146484375;
    float _2018 = sin(_2016);
    float _2020 = _1858 * _2006;
    float _2022 = _1097 * _2010;
    float _2024 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2026 = -_1097;
    float _2028 = _2026 + 1.0;
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2020);
    float _2032 = _1892 * _2022;
    float _2034 = _1856 * _1994;
    float _2036 = _2004 * 6.283185482025146484375;
    float _2038 = cos(_2036);
    float _2040 = -_1139;
    float _2042 = fma(_2024, 2.0, _2040);
    float _2044 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2032);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2048 = fma(_1888, _1990, _2030);
    float _2050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2054 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2046);
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2058 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2060 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2052);
    float _2062 = _1474 * _2018;
    float _2064 = fma(_1874, _2002, _2044);
    float _2066 = _1474 * _2038;
    float _2068 = -_2056;
    float _2070 = fma(_2058, 2.0, _2068);
    float _2072 = -_2062;
    float _2074 = fma(_1642, _2038, _2072);
    float _2076 = _1596 + 0.5;
    float _2078 = -_125;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2042);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2084 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2086 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2090 = fma(_1642, _2018, _2066);
    float _2092 = fma(_2084, -2.0, _2082);
    float _2094 = fma(_2086, _2076, _2080);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1364 + _2096;
    float _2100 = fma(_1920, _1992, _2064);
    float _2102 = -_125;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2070);
    float _2106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2112 = _1424 + _2110;
    float _2114 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2116 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2120 = _1492 + _2118;
    float _2122 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2048);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2114);
    float _2126 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2128 = _1546 + 0.5;
    int _2130 = ~_1812;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    float _2136 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2124);
    float _2138 = _2074 + 0.5;
    float _2140 = fma(_2128, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2104);
    float _2142 = fma(_2116, -2.0, _2108);
    int _2144 = _2134;
    if (!_1864)
    {
        int _2146 = ~_1812;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    float _2152 = fma(_2126, _2138, _1530);
    bool _2154 = !_1772;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2160 = fma(_1918, _1978, _2100);
    bool _2162 = _2136 >= 0.0;
    float _2164 = _2106 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2166 = abs(_1832);
    float _2168 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _2170 = float(_1690);
    float _2172 = _2090 + (-0.5);
    float _2174 = _1574 + (-0.5);
    float _2176 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2092);
    int _2178 = abs(_2156);
    float _2180 = -_2164;
    float _2182 = -_2168;
    float _2184 = fma(_2180, _2172, _2182);
    float _2186 = _979 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2188 = -_2174;
    float _2190 = -_2176;
    float _2192 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2190);
    float _2194 = float(_2150);
    float _2196 = _981 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2198 = float(_2178);
    float _2200 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2202 = float(_2166);
    float _2204 = _2122 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2206 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2208 = _2198 * _2194;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2212 = _2202 * _2170;
    float _2214 = float(uint(_1376));
    float _2216 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2218 = _1570 + (-0.5);
    float _2220 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2142);
    float _2222 = fma(_1890, _1966, _2160);
    int _2224 = _1566 >> 31;
    float _2226 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2054);
    float _2228 = -_2216;
    float _2230 = -_2220;
    float _2232 = fma(_2228, _2218, _2230);
    float _2234 = as_type<float>(_1145) * _2214;
    int _2236 = _2224 & 3;
    float _2238 = -_2226;
    float _2240 = _2238 + 1.0;
    out.m_58.x = _2206;
    out.m_58.y = _2200;
    out.m_58.z = _2210;
    out.m_58.w = _2204;
    float _2242 = trunc(_2234);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = -_2240;
    float _2250 = fma(_1546, _2248, _2140);
    float _2252 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2060);
    float _2254 = fma(_1754, _1952, _2222);
    float _2256 = _2208 * (-2.0);
    float _2258 = _2212 * (-2.0);
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    float _2264 = fma(_1768, _1922, _2254);
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (_2162)
    {
        out.m_45.x = 0.0;
    }
    float _2268 = fma(_1844, _2256, _1844);
    float _2270 = fma(_1574, _2262, _2192);
    bool _2272 = !_1582;
    int _2274 = _2272 ? 0 : 1;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2278 = _1566 + _2236;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2282 = ~_1045;
    int _2284 = _2282 + 1;
    float _2286 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2276);
    int _2288 = _2278 >> 2;
    float _2290 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2280);
    bool _2292 = uint(_1580) >= 2u;
    float _2294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2286);
    int _2296 = _2288 << 4;
    int _2298 = _2296 + 512;
    float _2300 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2290);
    int _2302 = _2284 * int(_2246);
    int _2304 = _2302 + _1376;
    float _2306 = -_2294;
    float _2308 = _2306 + 1.0;
    uint _2310 = uint(int(uint(_2298) >> uint(2)));
    uint _2312 = uint(int(uint(int(_2310)) >> uint(2)));
    int _2314 = int(_2310) & 3;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[int(_2312)][_2314];
    int _2318 = int(_2310) + 1;
    uint _2320 = uint(int(uint(_2318) >> uint(2)));
    int _2322 = _2318 & 3;
    float _2324 = (*spvDescriptorSet0.vp_c9)._m0[int(_2320)][_2322];
    float _2326 = -_2300;
    float _2328 = _2326 + 1.0;
    float _2330 = in.m_60.x;
    float _2332 = in.m_60.y;
    float _2334 = in.m_60.z;
    float _2336 = -_2308;
    float _2338 = fma(_2074, _2336, _2152);
    float _2340 = float(uint(_2304));
    float _2342 = fma(_2090, _2328, _2184);
    int _2344 = _2292 ? 0 : 1;
    float _2346 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2264);
    int _2348 = _2298 + 8;
    uint _2350 = uint(int(uint(_2348) >> uint(2)));
    uint _2352 = uint(int(uint(int(_2350)) >> uint(2)));
    int _2354 = int(_2350) & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    int _2358 = int(_2350) + 1;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    int _2362 = _2358 & 3;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[int(_2360)][_2362];
    float _2366 = as_type<float>(_1145) * _2340;
    bool _2368 = _1580 != 3;
    out.m_62.x = _2338;
    out.m_62.y = _2342;
    out.m_62.z = _2250;
    out.m_62.w = _2270;
    if (_2162)
    {
        _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2370 = _2266;
    float _2372 = fma(_1850, _2258, _1850);
    float _2374 = trunc(_2366);
    float _2376 = precise::max(_2374, 0.0);
    uint _2378 = uint(_2376);
    out.m_64.x = _2346;
    int _2380 = as_type<int>(_2370);
    if (_2162)
    {
        float _2382 = _2370 * 5.0;
        _2380 = as_type<int>(_2382);
    }
    int _2384 = _2380;
    if (_2162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7424 = as_type<float>(_2384);
        out.gl_Position.z = _7424;
    }
    int _2386 = ~_1045;
    int _2388 = _2386 + 1;
    float _2390 = fma(_2256, _2330, _2330);
    int _2392 = ~_2344;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2258, _2332, _2332);
    int _2400 = _2396;
    if (_2368)
    {
        int _2402 = ~_2344;
        int _2404 = _2402 + 1;
        _2400 = _2404;
    }
    int _2406 = _2400;
    int _2408 = int(_2246) + int(_2378);
    int _2410 = abs(_1604);
    float _2412 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2414 = _1580 != 3;
    int _2416 = _2388 * _2408;
    int _2418 = _2416 + _1376;
    int _2420 = abs(_2274);
    int _2422 = abs(_2406);
    int _2424 = ~_2410;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2414;
    int _2432 = _2430 ? 0 : (-1);
    bool _2434 = uint(_2418) >= uint(_1045);
    int _2436 = ~_2420;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    int _2442 = _2428 * as_type<int>(_2324);
    float _2444 = _2098 * _2098;
    int _2446 = abs(_2432);
    int _2448 = _2440 * as_type<int>(_2316);
    int _2450 = _2448 + _2442;
    int _2452 = ~_2422;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    float _2458 = fma(_2112, _2112, _2444);
    bool _2460 = !_1558;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = ~_2446;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _2456 * as_type<int>(_2356);
    int _2472 = _2470 + _2450;
    float _2474 = fma(_2120, _2120, _2458);
    bool _2476 = !_2434;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2468 * as_type<int>(_2364);
    int _2482 = _2480 + _2472;
    int _2484 = abs(_2462);
    float _2486 = rsqrt(_2474);
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2490 = ~_2408;
    int _2492 = _2490 + _2478;
    int _2494 = _2492 + 1;
    bool _2496 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2498 = isnan(1.0);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2504 = _2500 || _2502;
    float _2506 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2508 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2488);
    int _2510 = _1045 * _2494;
    int _2512 = _2510 + _1376;
    int _2514 = ~_2484;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    float _2520 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2506);
    float _2522 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2508);
    bool _2524 = !_1834;
    int _2526 = _2524 ? _2512 : (-1);
    int _2528 = _2482 * _2518;
    float _2530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2520);
    float _2532 = _2412 * _2486;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    int _2538 = _2526 * _2484;
    int _2540 = _2538 + _2528;
    float _2542 = -_2530;
    float _2544 = _2542 + 1.0;
    float _2546 = _2098 * _2532;
    float _2548 = -_2536;
    float _2550 = fma(_1596, _2548, _2094);
    float _2552 = _2112 * _2532;
    float _2554 = fma(_1570, _2544, _2232);
    float _2556 = -_2546;
    float _2558 = _2098 + _2556;
    float _2560 = float(_2540);
    float _2562 = _1167 + (-0.5);
    float _2564 = -_2552;
    float _2566 = _2112 + _2564;
    float _2568 = _2558 * _2558;
    out.m_66.x = _2550;
    out.m_66.y = _2554;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2390);
    bool _2572 = !_1780;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = fma(_2566, _2566, _2568);
    out.m_68.y = _2560;
    if (_2162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2578 = -_2546;
    float _2580 = _1364 + _2578;
    float _2582 = _2120 * _2532;
    float _2584 = -_2552;
    float _2586 = _1424 + _2584;
    int _2588 = abs(_2574);
    float _2590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2592 = _2580 + _2590;
    float _2594 = -_2582;
    float _2596 = _1492 + _2594;
    float _2598 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2600 = _2586 + _2598;
    bool _2602 = !_2504;
    float _2604 = _2602 ? _125 : _2034;
    float _2606 = _2592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2610 = _2596 + _2608;
    float _2612 = _1169 + (-0.5);
    float _2614 = float(_1786);
    float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2606);
    float _2618 = float(_2588);
    float _2620 = fma(_2604, _2268, _2570);
    float _2622 = _1171 + _1167;
    float _2624 = fma(_2610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2616);
    float _2626 = fma(_2612, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2398);
    float _2628 = _2618 * _2614;
    float _2630 = _2620 * 0.15915493667125701904296875;
    float _2632 = _2622 + (-1.0);
    bool _2634 = _2624 >= 0.0;
    float _2636 = _2628 * (-2.0);
    float _2638 = -_2582;
    float _2640 = _2120 + _2638;
    float _2642 = fma(_2604, _2372, _2626);
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2646 = fma(_2636, _2334, _2334);
    float _2648 = fma(_2640, _2640, _2576);
    float _2650 = _2642 * 0.15915493667125701904296875;
    float _2652 = _2630 * 6.283185482025146484375;
    float _2654 = sin(_2652);
    float _2656 = _1171 + (-0.5);
    float _2658 = fma(_2644, _2636, _2644);
    float _2660 = as_type<float>(_2588);
    int _2662 = as_type<int>(_2656);
    float _2664 = _2580;
    float _2666 = _2610;
    if (_2634)
    {
        _2660 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2668 = _2660;
    float _2670 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2646);
    if (_2634)
    {
        out.m_45.x = 0.0;
    }
    float _2672 = _2630 * 6.283185482025146484375;
    float _2674 = cos(_2672);
    if (_2634)
    {
        float _2676 = _2668 * 5.0;
        _2662 = as_type<int>(_2676);
    }
    int _2678 = _2662;
    float _2680 = fma(_2604, _2658, _2670);
    if (_2634)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7871 = as_type<float>(_2678);
        out.gl_Position.z = _7871;
    }
    float _2682 = sqrt(_2648);
    float _2684 = _2680 * 0.15915493667125701904296875;
    float _2686 = _2650 * 6.283185482025146484375;
    float _2688 = sin(_2686);
    float _2690 = _2650 * 6.283185482025146484375;
    float _2692 = cos(_2690);
    if (_2634)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2694 = _2684 * 6.283185482025146484375;
    float _2696 = cos(_2694);
    float _2698 = _2486 * _2682;
    float _2700 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2704 = _2674 * _2692;
    float _2706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2708 = _2698 * _2700;
    float _2710 = _1069 * _2698;
    float _2712 = _2684 * 6.283185482025146484375;
    float _2714 = sin(_2712);
    float _2716 = _2674 * _2688;
    float _2718 = _2702 * _2708;
    float _2720 = _2654 * _2688;
    float _2722 = _2706 * _2710;
    float _2724 = _2654 * _2692;
    float _2726 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2728 = _2726 * 0.5;
    float _2730 = _2696 * _2718;
    float _2732 = _2674 * _2730;
    float _2734 = _2688 * _2696;
    float _2736 = _2692 * _2696;
    float _2738 = fma(_2714, _2704, _2720);
    float _2740 = -_2718;
    float _2742 = _2714 * _2740;
    float _2744 = fma(_2714, _2720, _2704);
    float _2746 = fma(_2738, _2722, _2732);
    float _2748 = -_2724;
    float _2750 = fma(_2714, _2716, _2748);
    float _2752 = -_2716;
    float _2754 = fma(_2714, _2724, _2752);
    float _2756 = _2654 * _2730;
    float _2758 = fma(_2736, _2722, _2742);
    float _2760 = fma(_2750, _2728, _2746);
    float _2762 = fma(_2754, _2722, _2756);
    float _2764 = fma(_2734, _2728, _2758);
    float _2766 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2768 = fma(_2744, _2728, _2762);
    float _2770 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2766);
    float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2770);
    float _2776 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2772);
    float _2778 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2780 = _2776 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2784 = _1492 + _2780;
    float _2786 = _1424 + _2782;
    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2790 = _2784 + _2788;
    float _2792 = _2760 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2796 = _2786 + _2794;
    float _2798 = _2790 * _2790;
    float _2800 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2792);
    float _2802 = fma(_2796, _2796, _2798);
    float _2804 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2800);
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2810 = _1364 + _2808;
    bool _2812 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2814 = _2808;
    float _2816 = _2798;
    float _2818 = _2786;
    float _2820 = _2710;
    float _2822 = _2784;
    if (!_2812)
    {
        _2814 = _2786;
    }
    float _2824 = _2814;
    float _2826 = _2824;
    if (!_2812)
    {
        _2816 = _2784;
    }
    float _2828 = _2816;
    float _2830 = _2828;
    if (!_2812)
    {
        _2818 = _2810;
    }
    float _2832 = _2818;
    bool _2834 = !_2812;
    float _2836 = _2832;
    if (!_2834)
    {
        float _2838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2842 = _2806 + _2840;
        float _2844 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = rsqrt(_2802);
        float _2848 = _2842 * _2838;
        float _2850 = _2848 * 0.15915493667125701904296875;
        float _2852 = _2850 * 6.283185482025146484375;
        float _2854 = cos(_2852);
        float _2856 = _2850 * 6.283185482025146484375;
        float _2858 = sin(_2856);
        float _2860 = _2854 + (-1.0);
        float _2862 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2864 = fma(_2858, _2844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2866 = fma(_2810, _2854, _2862);
        float _2868 = _2846 * _2864;
        float _2870 = fma(_2796, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2872 = fma(_2790, _2868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2836 = _2866;
        _2826 = _2870;
        _2830 = _2872;
    }
    float _2874 = _2836;
    float _2876 = _2826;
    float _2878 = _2830;
    float _2880 = -_1364;
    float _2882 = _2880 + _2874;
    float _2884 = -_1424;
    float _2886 = _2884 + _2876;
    float _2888 = -_1492;
    float _2890 = _2888 + _2878;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = sqrt(_2896);
    bool _2900 = _2898 > 0.0;
    float _2902 = _2894;
    float _2904 = _2898;
    float _2906 = _2874;
    if (!_2900)
    {
        _2902 = _2876;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    float _2912 = _2908;
    if (!_2900)
    {
        _2904 = _2878;
    }
    float _2914 = _2904;
    bool _2916 = !_2900;
    float _2918 = _2914;
    float _2920 = _2914;
    if (!_2916)
    {
        bool _2922 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2924 = _2796;
        if (_2922)
        {
            float _2926 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2924 = _2926;
        }
        float _2928 = _2924;
        float _2930 = _2928;
        if (_2922)
        {
            float _2932 = _467 * _2928;
            _2820 = _2932;
        }
        float _2934 = _2820;
        float _2936 = _2934;
        if (_2922)
        {
            float _2938 = _469 * _2928;
            _2822 = _2938;
        }
        float _2940 = _2822;
        float _2942 = _2940;
        if (_2922)
        {
            float _2944 = _471 * _2928;
            _2930 = _2944;
        }
        float _2946 = _2930;
        float _2948 = _2946;
        if (!_2922)
        {
            bool _2950 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2954 = _2950 || _2952;
            bool _2956 = isnan(1.0);
            bool _2958 = _2954 || _2956;
            float _2960 = _125 + 1.0;
            if (!_2958)
            {
                float _2962 = _2960 * _2960;
                float _2964 = _2962 * 0.5;
                _127 = _2964;
            }
            float _2966 = _127;
            float _2968 = _2966;
            if (!_2958)
            {
                float _2970 = _2966 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2968 = _2970;
            }
            float _2972 = _2968;
            bool _2974 = !_2958;
            float _2976 = _2972;
            if (!_2974)
            {
                float _2978 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2980 = log2(_2978);
                float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2984 = 1.0 + _2982;
                float _2986 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2988 = _2980 * _2960;
                float _2990 = 1.0 / _2984;
                float _2992 = _2986 * 0.693147182464599609375;
                float _2994 = exp2(_2988);
                float _2996 = 1.0 / _2992;
                float _2998 = _2994 + (-1.0);
                float _3000 = -_2998;
                float _3002 = fma(_3000, _2996, _2960);
                float _3004 = _3002 * _2990;
                float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2976 = _3006;
            }
            float _3008 = _2976;
            float _3010 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3012 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3014 = _3008 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3016 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _3018 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _3020 = _3010 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _3022 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].y, _3016);
            float _3024 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3018);
            float _3026 = _3018;
            if (!_2958)
            {
                _3026 = _2960;
            }
            float _3028 = _3026;
            float _3030 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].y, _3022);
            bool _3032 = !_2958;
            float _3034 = _3028;
            if (!_3032)
            {
                float _3036 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3038 = log2(_3036);
                float _3040 = _3038 * _2960;
                float _3042 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3044 = 1.0 + _3042;
                float _3046 = exp2(_3040);
                float _3048 = 1.0 / _3044;
                float _3050 = -_3046;
                float _3052 = _3050 + 1.0;
                float _3054 = _3052 * _3048;
                _3034 = _3054;
            }
            float _3056 = _3034;
            float _3058 = fma(_3012, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3020);
            float _3060 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3024);
            float _3062 = fma(_3056, _165, _3030);
            float _3064 = fma(_3014, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3058);
            float _3066 = fma(_3056, _163, _3060);
            float _3068 = -_429;
            float _3070 = _3068 + _3062;
            float _3072 = fma(_3056, _167, _3064);
            float _3074 = -_431;
            float _3076 = _3074 + _3066;
            float _3078 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3080 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3082 = _3070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3084 = -_433;
            float _3086 = _3084 + _3072;
            float _3088 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3078);
            float _3090 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3080);
            float _3092 = fma(_3076, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3082);
            float _3094 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3088);
            float _3096 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3090);
            float _3098 = fma(_3086, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3092);
            _475 = _3096;
            _477 = _3094;
            _479 = _3098;
            _2936 = _3094;
            _2942 = _3096;
            _2948 = _3098;
            _2918 = _3080;
            _2910 = _3090;
        }
        float _3100 = _475;
        float _3102 = _477;
        float _3104 = _479;
        float _3106 = _2936;
        float _3108 = _2942;
        float _3110 = _2948;
        float _3112 = _2918;
        float _3114 = _2910;
        float _3116 = _3100 * _3100;
        float _3118 = fma(_3102, _3102, _3116);
        float _3120 = fma(_3104, _3104, _3118);
        float _3122 = rsqrt(_2896);
        float _3124 = sqrt(_3120);
        float _3126 = _2886 * _3122;
        float _3128 = _2882 * _3122;
        float _3130 = _2890 * _3122;
        bool _3132 = _3124 > 0.0;
        float _3134 = _3114;
        float _3136 = _3112;
        if (!_3132)
        {
            _3134 = _2876;
        }
        float _3138 = _3134;
        _2912 = _3138;
        if (!_3132)
        {
            _3136 = _2878;
        }
        float _3140 = _3136;
        bool _3142 = !_3132;
        _2920 = _3140;
        if (!_3142)
        {
            float _3144 = rsqrt(_3120);
            float _3146 = _3144 * _3100;
            float _3148 = _3144 * _3102;
            float _3150 = _3144 * _3104;
            float _3152 = _3128 * _3146;
            float _3154 = fma(_3126, _3148, _3152);
            float _3156 = fma(_3130, _3150, _3154);
            float _3158 = _3156 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3160 = fma(_3106, _3158, _2876);
            float _3162 = fma(_3108, _3158, _2874);
            float _3164 = fma(_3110, _3158, _2878);
            _2906 = _3162;
            _2920 = _3164;
            _2912 = _3160;
        }
    }
    float _3166 = _2906;
    float _3168 = _2920;
    float _3170 = _2912;
    float _3172 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3174 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3176 = isnan(0.5);
    bool _3178 = _3174 || _3176;
    bool _3180 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3182 = _3178 || _3180;
    float _3184 = -_2546;
    float _3186 = _3184 + _3166;
    bool _3188 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3190 = isnan(0.5);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3196 = _3192 || _3194;
    float _3198 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3172);
    float _3200 = -_2582;
    float _3202 = _3200 + _3168;
    float _3204 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3198);
    float _3206 = _2580 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3208 = _3204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3210 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3206);
    float _3212 = 1.0 / _3208;
    float _3214 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3210);
    float _3216 = _3214 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3218 = _3216 + _3208;
    float _3220 = _3208;
    float _3222 = _3186;
    float _3224 = _3202;
    if (_3196)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    float _3228 = _3218 * _3212;
    float _3230 = _3228 * 0.5;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3234 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3232);
    float _3236 = -_2552;
    float _3238 = _3236 + _3170;
    float _3240 = 1.0 / _3234;
    float _3242 = _3238;
    float _3244 = _3234;
    float _3246 = _3226;
    if (!_3182)
    {
        float _3248 = _2592 * _2592;
        float _3250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3252 = -_1492;
        float _3254 = _3252 + _3168;
        float _3256 = -_1424;
        float _3258 = _3256 + _3170;
        float _3260 = fma(_2600, _2600, _3248);
        float _3262 = fma(_2610, _2610, _3260);
        float _3264 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3266 = sqrt(_3262);
        float _3268 = 1.0 / _2698;
        float _3270 = precise::min(_3266, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3272 = _3270 * _3250;
        float _3274 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3276 = -_1364;
        float _3278 = _3276 + _3166;
        float _3280 = _3272 * _3268;
        float _3282 = _3274 * _3280;
        float _3284 = _3254 * _3280;
        float _3286 = fma(_3258, _3282, _2586);
        float _3288 = fma(_3278, _3282, _2580);
        float _3290 = fma(_3274, _3284, _2596);
        _3222 = _3288;
        _3242 = _3286;
        _3224 = _3290;
        _3244 = _3274;
    }
    float _3292 = _3222;
    float _3294 = _3242;
    float _3296 = _3224;
    float _3298 = _3244;
    float _3300 = _3298;
    if (_3196)
    {
        _3300 = 1.0;
    }
    float _3302 = _3300;
    float _3304 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3306 = _3240 * _3304;
    float _3308 = _3302;
    float _3310 = _3306;
    if (!_3196)
    {
        float _3312 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = _3312 * 0.15915493667125701904296875;
        float _3316 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3318 = _3314 * 6.283185482025146484375;
        float _3320 = cos(_3318);
        float _3322 = _3316 * 0.15915493667125701904296875;
        float _3324 = _3314 * 6.283185482025146484375;
        float _3326 = sin(_3324);
        float _3328 = 1.0 / _3320;
        float _3330 = _3322 * 6.283185482025146484375;
        float _3332 = cos(_3330);
        float _3334 = _3326 * _3328;
        float _3336 = _3322 * 6.283185482025146484375;
        float _3338 = sin(_3336);
        float _3340 = _3332 * _3334;
        float _3342 = 1.0 / _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3344;
        float _3348 = 1.0 / _3346;
        float _3350 = _3338 * _3342;
        float _3352 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3354 = fma(_3306, _3350, _3352);
        float _3356 = _3354 * _3348;
        float _3358 = precise::clamp(_3356, 0.0, 1.0);
        _3246 = _3358;
    }
    float _3360 = _3246;
    if (!_3196)
    {
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3364 = _3362 * 0.15915493667125701904296875;
        float _3366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3368 = _3364 * 6.283185482025146484375;
        float _3370 = cos(_3368);
        float _3372 = _3366 * 0.15915493667125701904296875;
        float _3374 = _3364 * 6.283185482025146484375;
        float _3376 = sin(_3374);
        float _3378 = 1.0 / _3370;
        float _3380 = _3372 * 6.283185482025146484375;
        float _3382 = cos(_3380);
        float _3384 = _3376 * _3378;
        float _3386 = _3372 * 6.283185482025146484375;
        float _3388 = sin(_3386);
        float _3390 = _3382 * _3384;
        float _3392 = 1.0 / _3390;
        float _3394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3396 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3394;
        float _3398 = 1.0 / _3396;
        float _3400 = _3388 * _3392;
        float _3402 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3404 = fma(_3306, _3400, _3402);
        float _3406 = _3404 * _3398;
        float _3408 = precise::clamp(_3406, 0.0, 1.0);
        float _3410 = -_3408;
        float _3412 = _3410 + 1.0;
        _2664 = _3400;
        _3308 = _3412;
    }
    float _3414 = _2664;
    float _3416 = _3308;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3424 = _3294 + _3422;
    float _3426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3428 = _3296 + _3426;
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3420 * _3420;
    float _3434 = fma(_3424, _3424, _3432);
    float _3436 = fma(_3428, _3428, _3434);
    float _3438 = rsqrt(_3436);
    float _3440 = sqrt(_3436);
    float _3442 = _3438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3444 = _3424 * _3442;
    float _3446 = _3428 * _3442;
    float _3448 = _3444 * _3444;
    float _3450 = _3446 * _3446;
    float _3452 = _3448 + _3450;
    float _3454 = sqrt(_3452);
    bool _3456 = _3454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3460 = _3454 + _3458;
    float _3462 = _3438;
    float _3464 = _3452;
    float _3466 = _3460;
    float _3468 = _3414;
    float _3470 = _3420;
    if (_3456)
    {
        float _3472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3462 = _3472;
    }
    float _3474 = _3462;
    if (_3456)
    {
        float _3476 = rsqrt(_3452);
        _3464 = _3476;
    }
    float _3478 = _3464;
    float _3480 = _3478;
    if (_3456)
    {
        float _3482 = _3460 * _3474;
        _3466 = _3482;
    }
    float _3484 = _3466;
    if (_3456)
    {
        float _3486 = _3484 * 0.15915493667125701904296875;
        _3468 = _3486;
    }
    float _3488 = _3468;
    float _3490 = _3428;
    if (_3456)
    {
        float _3492 = _3488 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3500 = precise::max(0.0, _3498);
    float _3502 = _3474;
    float _3504 = _3500;
    if (_3456)
    {
        float _3506 = _3488 * 6.283185482025146484375;
        float _3508 = cos(_3506);
        _3502 = _3508;
    }
    float _3510 = _3502;
    float _3512 = -_3442;
    float _3514 = -_3500;
    float _3516 = fma(_3420, _3512, _3514);
    if (_3456)
    {
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3518;
    }
    float _3520 = _3470;
    float _3522 = _3520;
    float _3524 = _3496;
    if (_3456)
    {
        float _3526 = fma(_3496, _3520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = _3528;
    if (!_3456)
    {
        _3524 = _3444;
    }
    float _3532 = _3524;
    float _3534 = _3532;
    float _3536 = _3510;
    if (_3456)
    {
        float _3538 = _3510 + (-1.0);
        _3504 = _3538;
    }
    float _3540 = _3504;
    float _3542 = _3540;
    if (_3456)
    {
        float _3544 = _3478 * _3528;
        _2666 = _3544;
    }
    float _3546 = _2666;
    if (!_3456)
    {
        _3530 = _3516;
    }
    float _3548 = _3530;
    float _3550 = _3548;
    if (_3456)
    {
        float _3552 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3310 = _3552;
    }
    float _3554 = _3310;
    if (_3456)
    {
        float _3556 = _3444 * _3546;
        _3534 = _3556;
    }
    float _3558 = _3534;
    if (!_3456)
    {
        _3542 = _3446;
    }
    float _3560 = _3542;
    float _3562 = _3560;
    if (_3456)
    {
        float _3564 = _3446 * _3546;
        _3562 = _3564;
    }
    float _3566 = _3562;
    if (!_3456)
    {
        _3480 = _3448;
    }
    float _3568 = _3480;
    float _3570 = _3568;
    if (_3456)
    {
        float _3572 = fma(_3516, _3510, _3554);
        _3550 = _3572;
    }
    float _3574 = _3550;
    if (_3456)
    {
        float _3576 = _3558 * _3558;
        _3570 = _3576;
    }
    float _3578 = _3570;
    if (!_3456)
    {
        _3536 = _3450;
    }
    float _3580 = _3536;
    float _3582 = _3580;
    if (_3456)
    {
        float _3584 = _3566 * _3566;
        _3582 = _3584;
    }
    float _3586 = _3582;
    float _3588 = fma(_3574, _3574, _3578);
    float _3590 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3592 = _3588 + _3586;
    float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3596 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3594);
    float _3598 = precise::clamp(_3596, 0.0, 1.0);
    float _3600 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3590);
    float _3602 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3604 = -_3598;
    float _3606 = _3604 + 1.0;
    float _3608 = rsqrt(_3592);
    float _3610 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3600);
    float _3612 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3614 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3602);
    float _3616 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3618 = _3610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3612);
    float _3622 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3614);
    float _3624 = abs(_3606);
    float _3626 = log2(_3624);
    float _3628 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3616);
    float _3630 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3620);
    float _3632 = _3622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3634 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3636 = fma(_3296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3628);
    float _3638 = _3630 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3640 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3642 = _3608 * _3558;
    float _3644 = _3608 * _3574;
    float _3646 = _3608 * _3566;
    float _3648 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3640);
    float _3650 = _3642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3652 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3654 = -_3634;
    float _3656 = fma(_3654, _3430, 1.0);
    float _3658 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3648);
    float _3660 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3662 = -_3650;
    float _3664 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3662);
    float _3666 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3668 = log2(_3656);
    float _3670 = -_3646;
    float _3672 = fma(_3670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3664);
    float _3674 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3676 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3678 = fma(_3672, -0.5, 0.5);
    float _3680 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3674);
    float _3682 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3676);
    float _3684 = exp2(_3660);
    float _3686 = fma(_3672, 0.5, 0.5);
    float _3688 = _3644 + 1.0;
    float _3690 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3680);
    float _3692 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3682);
    float _3694 = fma(_3686, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3696 = 1.0 / _3666;
    float _3698 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3692);
    float _3700 = fma(_3686, _3694, -0.212114393711090087890625);
    float _3702 = _3668 * 0.693147182464599609375;
    float _3704 = fma(_3686, _3700, 1.570728778839111328125);
    float _3706 = _3702 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3708 = sqrt(_3678);
    float _3710 = -_3644;
    float _3712 = fma(_3684, _3688, _3710);
    float _3714 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3690);
    float _3716 = fma(_3712, 0.5, 0.5);
    float _3718 = _3698 * _3696;
    float _3720 = _3714 * _3696;
    float _3722 = fma(_3718, -0.5, 0.5);
    float _3724 = fma(_3720, 0.5, 0.5);
    float _3726 = _3708 * 0.636619746685028076171875;
    float3 _9507 = float3(_3724, _3722, _3706);
    float _3728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9507, float3(0.0), isnan(_9507)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9507, float3(0.0), isnan(_9507)), level(0.0)).x;
    float3 _9518 = float3(_3724, _3722, _3706);
    float4 _3731 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9518, float3(0.0), isnan(_9518)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9518, float3(0.0), isnan(_9518)), level(0.0)).xyzw;
    float _3733 = _3731.x;
    float _3735 = _3731.y;
    float _3737 = _3731.z;
    float _3739 = _3731.w;
    float _3741 = -_3704;
    float _3743 = fma(_3726, _3741, 1.0);
    float2 _9540 = float2(_3743, _3716);
    float3 _3747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9540, float2(0.0), isnan(_9540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9540, float2(0.0), isnan(_9540)), level(0.0)).xyz;
    float _3749 = _3747.x;
    float _3751 = _3747.y;
    float _3753 = _3747.z;
    float _3755 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = _3632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3759 = _3360 * _3416;
    bool _3761 = _3360 > 0.0;
    bool _3763 = isnan(_3360);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan(0.0);
    bool _3769 = _3765 || _3767;
    float _3771 = _3666 * 0.5;
    float _3773 = fma(_3638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3757);
    float _3775 = exp2(_3755);
    float _3777 = _3759 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3779 = _3416 <= 0.0;
    bool _3781 = !_3769;
    bool _3783 = _3779 || _3781;
    float _3785 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3773);
    float _3787 = fma(_3652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3785);
    float _3789 = _3714 + _3666;
    float _3791 = fma(_3698, -0.5, _3771);
    float _3793 = _3777 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3795 = _3787 + _3666;
    float _3797 = _3789 * 0.5;
    out.gl_Position.x = _3714;
    out.gl_Position.y = _3698;
    out.gl_Position.z = _3787;
    out.gl_Position.w = _3666;
    float _3799 = _3795 * 0.5;
    float _3801 = -_3775;
    float _3803 = _3801 + 1.0;
    out.m_45.x = _3793;
    float _3805 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3797;
    out.m_70.y = _3791;
    out.m_70.z = _3799;
    out.m_70.w = _3666;
    float _3807 = -_3805;
    float _3809 = _3807 + 1.0;
    float _3811 = _3805 * _3728;
    float _3813 = _3739 * _3809;
    float _3815 = _3739 * _3811;
    float _3817 = _3753 * _3811;
    float _3819 = fma(_3749, _3815, _3733);
    float _3821 = fma(_3751, _3815, _3735);
    float _3823 = fma(_3739, _3817, _3737);
    out.m_72.x = _3819;
    out.m_72.y = _3821;
    out.m_72.z = _3823;
    out.m_72.w = _3813;
    if (!_3783)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3825;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

