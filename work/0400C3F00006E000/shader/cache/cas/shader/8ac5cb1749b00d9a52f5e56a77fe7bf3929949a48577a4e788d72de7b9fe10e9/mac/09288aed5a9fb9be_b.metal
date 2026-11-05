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
    float4 m_68 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = in.m_46.w;
    float _96 = trunc(_92);
    int _99 = int(_96);
    float _101 = -_94;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _103;
    bool _107 = _99 >= 1;
    float _109 = 0.0;
    float _111 = _94;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3220 = as_type<float>(_119);
        out.gl_Position.z = _3220;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _123 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_94);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = float(_99);
    bool _135 = _103 >= _133;
    bool _137 = !_131;
    bool _139 = _135 || _137;
    if (_139)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _111;
    if (_139)
    {
        out.m_51.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _121 = as_type<int>(_143);
    }
    int _145 = _121;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3275 = as_type<float>(_145);
        out.gl_Position.z = _3275;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_56.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    float _211 = 0.0;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _149 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _149);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
        _211 = _225;
    }
    float _243 = _209;
    float _245 = _211;
    float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _249 = !_161;
    float _251 = _245;
    float _253 = _243;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _149 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _185 = _273;
    }
    float _275 = _185;
    float _277 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _285 = _275;
    if (!_161)
    {
        float _287 = _103 * _103;
        float _289 = _287 * 0.5;
        _251 = _289;
    }
    float _291 = _251;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _283);
    float _299 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _301 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_161;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _103 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _103);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _293);
    float _345 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].y, _295);
    float _347 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _351 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].z, _297);
    float _357 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _349);
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].y, _351);
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].z, _353);
    float _363 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_275, _163, _343);
    float _367 = fma(_275, _165, _345);
    float _369 = fma(_275, _167, _355);
    float _371 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _357);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].y, _359);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].z, _361);
    if (!_161)
    {
        _285 = _103;
    }
    float _377 = _285;
    bool _379 = !_161;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _103 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
    }
    float _403 = _381;
    float _405 = fma(_403, _165, _373);
    float _407 = 1.0 / _133;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _411 = fma(_403, _163, _371);
    float _413 = -_405;
    float _415 = _367 + _413;
    float _417 = fma(_403, _167, _375);
    float _419 = fma(_367, _151, _171);
    float _421 = -_411;
    float _423 = _365 + _421;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _427 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _429 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = -_417;
    float _433 = _369 + _431;
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _441 = fma(_365, _151, _169);
    float _443 = fma(_369, _151, _173);
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _451 = _103 * _407;
    bool _453 = !_409;
    float _455 = _449;
    float _457 = _447;
    float _459 = _445;
    float _461 = _449;
    float _463 = _417;
    float _465 = _445;
    float _483;
    if (!_453)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _451;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _491 * _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _523 * _527;
    float _545 = -_523;
    float _547 = _545 + 1.0;
    float _549 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _543;
    float _555 = _551 * _543;
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _451;
    }
    _589 = false;
    float _591 = _587;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _603 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _605 = int(_603);
    float _607 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_591);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _631 = float(_595);
    float _633 = 1.0 / _613;
    bool _635 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_591);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = float(uint(_605));
    float _653 = 1.0 / _631;
    int _655 = ~_605;
    int _657 = _655 + 1;
    bool _659 = _605 == 0;
    int _661 = ~_605;
    int _663 = _661 + 1;
    float _665 = 1.0 / _651;
    float _667 = _103 * _653;
    float _669 = 1.0 / _629;
    int _671 = as_type<int>(_665) + (-2);
    float _673 = trunc(_667);
    int _675 = int(_673);
    float _677 = float(uint(_675));
    float _679 = as_type<float>(_671) * _677;
    int _681 = ~_605;
    int _683 = _681 + 1;
    float _685 = trunc(_679);
    float _687 = precise::max(_685, 0.0);
    uint _690 = uint(_687);
    float _692 = float(_605);
    int _694 = _683 * int(_690);
    int _696 = _694 + _675;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = float(uint(_696));
    float _704 = as_type<float>(_671) * _702;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = trunc(_704);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    bool _716 = !_708;
    float _718 = _716 ? 7.345489978790283203125 : 1.0;
    float _720 = _718 * _698;
    float _722 = floor(_720);
    int _724 = int(_690) + int(_714);
    float _726 = float(_675);
    int _728 = _657 * _724;
    int _730 = _728 + _675;
    bool _732 = _726 >= _692;
    bool _734 = isnan(_726);
    bool _736 = _732 || _734;
    bool _738 = isnan(_692);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = uint(_730) >= uint(_605);
    float _746 = trunc(_742);
    int _748 = int(_746);
    bool _750 = !_744;
    int _752 = _750 ? 0 : (-1);
    float _754 = -_722;
    float _756 = _720 + _754;
    int _758 = ~_724;
    int _760 = _758 + _752;
    int _762 = _760 + 1;
    float _764 = _756 * _692;
    int _766 = _605 + (-1);
    int _768 = _605 * _762;
    int _770 = _768 + _675;
    float _772 = trunc(_764);
    int _774 = int(_772);
    int _776 = ~_748;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    bool _782 = !_659;
    int _784 = _782 ? _770 : (-1);
    int _786 = _784 * _780;
    float _788 = _103 * _692;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _804 = _802 != 0;
    float _806 = _788 * _407;
    int _808 = _748 * _766;
    int _810 = _808 + _786;
    bool _812 = !_796;
    int _814 = _812 ? 0 : 1;
    bool _816 = !_792;
    int _818 = _816 ? 0 : 1;
    float _820 = trunc(_806);
    int _822 = int(_820);
    bool _824 = !_804;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_814);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _832 = _830 != 0;
    bool _834 = !_800;
    int _836 = _834 ? 0 : 1;
    int _838 = _810 * _828;
    int _840 = abs(_818);
    int _842 = abs(_826);
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_836);
    int _850 = _774 * _842;
    int _852 = _850 + _675;
    float _854 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    int _856 = abs(_846);
    int _858 = _822 * _840;
    int _860 = _858 + _838;
    float _862 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _864 = ~_605;
    int _866 = _864 + 1;
    int _868 = _852 * _848;
    int _870 = _868 + _860;
    bool _872 = _700 > 0.5;
    int _874 = _774 * _856;
    int _876 = _874 + _870;
    float _878 = -_205;
    int _880 = _872 ? as_type<int>(_878) : as_type<int>(_205);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _890 = float(uint(_876));
    float _892 = 1.0 / _888;
    float _894 = as_type<float>(_671) * _890;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _900 = trunc(_894);
    float _902 = precise::max(_900, 0.0);
    uint _904 = uint(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _910 = 1.0 / _898;
    int _912 = _866 * int(_904);
    int _914 = _912 + _876;
    float _916 = float(uint(_914));
    float _918 = as_type<float>(_671) * _916;
    int _920 = ~_605;
    int _922 = _920 + 1;
    float _924 = trunc(_918);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = int(_904) + int(_928);
    float _932 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _934 = log2(_932);
    int _936 = _922 * _930;
    int _938 = _936 + _876;
    bool _940 = uint(_938) >= uint(_605);
    float _942 = _698 * 2.0;
    bool _944 = !_940;
    int _946 = _944 ? 0 : (-1);
    float _948 = floor(_942);
    int _950 = ~_930;
    int _952 = _950 + _946;
    int _954 = _952 + 1;
    float _956 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _958 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _960 = _605 * _954;
    int _962 = _960 + _876;
    float _964 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _956);
    float _966 = _700 * 2.0;
    float _968 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _970 = -_609;
    float _972 = fma(_958, 2.0, _970);
    bool _974 = !_659;
    int _976 = _974 ? _962 : (-1);
    float _978 = floor(_966);
    float _980 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _982 = -_103;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _972);
    int _986 = _976 & 3;
    bool _988 = _986 != 0;
    float _990 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _992 = _948 >= 0.0;
    bool _994 = isnan(_948);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    bool _1002 = uint(_986) > 1u;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1006 = _976 & 3;
    bool _1008 = _1006 != 0;
    int _1010 = _1000 ? 0 : 1;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1014 = _1008 ? 0 : 1;
    bool _1016 = _948 > 0.0;
    bool _1018 = _698 > 0.5;
    float _1020 = in.m_58.z;
    int _1022 = ~_1014;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_1002)
    {
        int _1030 = ~_1014;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = -_195;
    int _1038 = _1018 ? as_type<int>(_1036) : as_type<int>(_195);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    int _1048 = ~_1010;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    int _1054 = _1052;
    if (!_1016)
    {
        int _1056 = ~_1010;
        int _1058 = _1056 + 1;
        _1054 = _1058;
    }
    int _1060 = _1054;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1064 = _978 >= 0.0;
    bool _1066 = isnan(_978);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = fma(_968, -2.0, _1062);
    float _1076 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1078;
    int _1082 = _1072 ? 0 : 1;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1086 = _978 > 0.0;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1020 * 2.0;
    float _1092 = _103 * _934;
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1102 = ~_1082;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = floor(_1090);
    float _1110 = _1080 * _633;
    out.m_60.x = _1012;
    out.m_60.y = _1094;
    out.m_60.z = _1096;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1112;
    float _1116 = _1100 * _910;
    int _1118 = _1106;
    if (!_1086)
    {
        int _1120 = ~_1082;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1074);
    float _1128 = exp2(_1092);
    float _1130 = _1114 * _669;
    float _1132 = _908 * _892;
    bool _1134 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_591);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1148 = !_1046;
    float _1150 = _1148 ? _195 : as_type<float>(_1038);
    float _1152 = _700 + _698;
    bool _1154 = !_884;
    float _1156 = _1154 ? _205 : as_type<float>(_880);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1168 = _1166 != 0;
    float _1170 = _700 + _1020;
    float _1172 = _1152 + (-1.0);
    bool _1174 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = isnan(_591);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = _1170 + (-1.0);
    bool _1188 = !_1164;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1194 = _1108 >= 0.0;
    bool _1196 = isnan(_1108);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1206 = float(uint(_852));
    float _1208 = -_1128;
    float _1210 = _1208 + 1.0;
    int _1212 = _1202 ? 0 : 1;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _591 + _1214;
    bool _1218 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1226 = _1222 || _1224;
    float _1228 = as_type<float>(_671) * _1206;
    float _1230 = fma(_1110, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1232 = _1226 ? _1210 : 0.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1236 = _591 + _1234;
    bool _1238 = _1108 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1242 = _591 + _1240;
    float _1244 = trunc(_1228);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1130, _1236, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1252 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1254 = isnan(_591);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = fma(_1116, _1242, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1266 = -_1184;
    float _1268 = _1266 + 1.0;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    int _1274 = abs(_1190);
    float _1276 = _1262 * _1268;
    float _1278 = -_1262;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    float _1284 = _625 * _1280;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1288 = _591 + _1286;
    float _1290 = _645 * _649;
    float _1292 = -_645;
    float _1294 = _1292 + 1.0;
    int _1296 = _663 * int(_1248);
    int _1298 = _1296 + _852;
    float _1300 = fma(_1132, _1288, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1302 = _1144 * _1294;
    float _1304 = _1150 + 0.5;
    float _1306 = float(uint(_1298));
    float _1308 = _1156 + (-0.5);
    float _1310 = _1230 * _1302;
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[80].x, _984);
    float _1314 = -_1144;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1308;
    float _1320 = -_1126;
    float _1322 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1320);
    float _1324 = _1232 * _1282;
    int _1326 = _976 >> 31;
    float _1328 = as_type<float>(_671) * _1306;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1310);
    int _1332 = _1326 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1336 = _976 + _1332;
    float _1338 = trunc(_1328);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = fma(_1264, _1290, _1330);
    float _1346 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    int _1348 = _1336 >> 2;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1352 = float(_1060);
    float _1354 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    int _1356 = _1348 << 4;
    int _1358 = _1356 + 368;
    float _1360 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1350);
    float _1362 = float(_1274);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    uint _1368 = uint(int(uint(_1358) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    float _1384 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1360);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1146 + _1386;
    float _1390 = -_1366;
    float _1392 = fma(_1150, _1390, _1312);
    float _1394 = fma(_1250, _1284, _1344);
    float _1396 = -_1384;
    float _1398 = _1396 + 1.0;
    float _1400 = _1362 * _1352;
    int _1402 = int(_1248) + int(_1342);
    int _1404 = _1358 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = fma(_1156, _1398, _1322);
    int _1424 = ~_605;
    int _1426 = _1424 + 1;
    float _1428 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1430 = !_1160;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = fma(_1300, _1276, _1394);
    int _1436 = ~_1212;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    int _1442 = _1426 * _1402;
    int _1444 = _1442 + _852;
    int _1446 = _1440;
    if (!_1238)
    {
        int _1448 = ~_1212;
        int _1450 = _1448 + 1;
        _1446 = _1450;
    }
    int _1452 = _1446;
    out.m_62.x = _1392;
    out.m_62.y = _1422;
    int _1454 = abs(_1432);
    float _1456 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1434);
    bool _1458 = uint(_1444) >= uint(_605);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1462 = _990 + _1460;
    float _1464 = in.m_64.x;
    float _1466 = in.m_64.y;
    float _1468 = in.m_64.z;
    int _1470 = abs(_1034);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = _862 + _1472;
    bool _1476 = !_1458;
    int _1478 = _1476 ? 0 : (-1);
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1428);
    bool _1482 = _986 != 3;
    float _1484 = _1400 * (-2.0);
    float _1486 = float(_1452);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1480);
    bool _1490 = !_988;
    int _1492 = _1490 ? 0 : 1;
    bool _1494 = uint(_986) >= 2u;
    int _1496 = ~_1470;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1494 ? 0 : 1;
    float _1504 = float(_1454);
    int _1506 = ~_1502;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1492);
    float _1514 = _1504 * _1486;
    int _1516 = _1510;
    if (_1482)
    {
        int _1518 = ~_1502;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = fma(_1484, _1466, _1466);
    bool _1526 = _986 != 3;
    int _1528 = _1500 * as_type<int>(_1382);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : (-1);
    int _1540 = ~_1402;
    int _1542 = _1540 + _1478;
    int _1544 = _1542 + 1;
    int _1546 = _1534 * as_type<int>(_1374);
    int _1548 = _1546 + _1528;
    int _1550 = abs(_1522);
    float _1552 = _1514 * (-2.0);
    int _1554 = abs(_1538);
    int _1556 = _605 * _1544;
    int _1558 = _1556 + _852;
    bool _1560 = !_1042;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = fma(_1192, _1552, _1192);
    float _1566 = fma(_1552, _1464, _1464);
    int _1568 = ~_1550;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = abs(_1562);
    int _1576 = _1572 * as_type<int>(_1412);
    int _1578 = _1576 + _1548;
    int _1580 = ~_1554;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    bool _1586 = _1488 >= 0.0;
    int _1588 = _1584 * as_type<int>(_1420);
    int _1590 = _1588 + _1578;
    int _1592 = ~_1574;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1204, _1484, _1204);
    float _1600 = _1388 * _1388;
    int _1602 = _1590 * _1596;
    bool _1604 = !_659;
    int _1606 = _1604 ? _1558 : (-1);
    float _1608 = fma(_1462, _1462, _1600);
    float _1610 = _1412;
    float _1612 = _1468;
    if (_1586)
    {
        out.m_51.x = 0.0;
    }
    if (_1586)
    {
        _1610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1610;
    int _1616 = _1606 * _1574;
    int _1618 = _1616 + _1602;
    float _1620 = fma(_1474, _1474, _1608);
    bool _1622 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1624 = isnan(1.0);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1630 = _1626 || _1628;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1634 = as_type<int>(_1614);
    if (_1586)
    {
        float _1636 = _1614 * 5.0;
        _1634 = as_type<int>(_1636);
    }
    int _1638 = _1634;
    float _1640 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _103 : _1324;
    float _1646 = rsqrt(_1620);
    bool _1648 = !_1168;
    int _1650 = _1648 ? 0 : 1;
    if (_1586)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5516 = as_type<float>(_1638);
        out.gl_Position.z = _5516;
    }
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1654 = _698 + (-0.5);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1658 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1566);
    float _1664 = float(_1618);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1670 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1672 = fma(_1644, _1564, _1662);
    out.m_66.x = _1664;
    float _1674 = _700 + (-0.5);
    float _1676 = _1670 * _1646;
    out.m_68.x = _1658;
    out.m_68.y = _1660;
    out.m_68.z = _1666;
    out.m_68.w = _1668;
    float _1678 = _1462 * _1676;
    float _1680 = _1388 * _1676;
    int _1682 = abs(_1650);
    if (_1586)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1684 = -_1680;
    float _1686 = _1146 + _1684;
    float _1688 = _1474 * _1676;
    float _1690 = -_1678;
    float _1692 = _990 + _1690;
    float _1694 = float(_1124);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -_1688;
    float _1702 = _862 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1692 + _1704;
    float _1708 = _1672 * 0.15915493667125701904296875;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = -_1680;
    float _1718 = _1388 + _1716;
    float _1720 = float(_1682);
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1710);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1524);
    float _1726 = -_1678;
    float _1728 = _1462 + _1726;
    float _1730 = _1718 * _1718;
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    float _1734 = fma(_1644, _1598, _1724);
    float _1736 = _1020 + _698;
    float _1738 = _1720 * _1694;
    float _1740 = fma(_1728, _1728, _1730);
    bool _1742 = _1732 >= 0.0;
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = _1736 + (-1.0);
    float _1748 = _1738 * (-2.0);
    float _1750 = -_1688;
    float _1752 = _1474 + _1750;
    float _1754 = _1708 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1760 = fma(_1748, _1468, _1468);
    float _1762 = _1020 + (-0.5);
    float _1764 = _1688;
    if (_1742)
    {
        _1612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1766 = _1612;
    float _1768 = _1708 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    int _1774 = as_type<int>(_1766);
    if (_1742)
    {
        out.m_51.x = 0.0;
    }
    if (_1742)
    {
        float _1776 = _1766 * 5.0;
        _1774 = as_type<int>(_1776);
    }
    int _1778 = _1774;
    float _1780 = _1744 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = fma(_1752, _1752, _1740);
    float _1786 = fma(_1758, _1748, _1758);
    float _1788 = fma(_1644, _1786, _1772);
    float _1790 = sqrt(_1784);
    if (_1742)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5762 = as_type<float>(_1778);
        out.gl_Position.z = _5762;
    }
    float _1792 = _1788 * 0.15915493667125701904296875;
    float _1794 = _1744 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    if (_1742)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1798 = _1792 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = _1646 * _1790;
    float _1804 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1808 = _1770 * _1796;
    float _1810 = _1770 * _1782;
    float _1812 = _1802 * _1804;
    float _1814 = _1756 * _1782;
    float _1816 = _1792 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = _1640 * _1802;
    float _1822 = _1806 * _1812;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1826 = _1756 * _1796;
    float _1828 = _1824 * _1820;
    float _1830 = _1770 * _1800;
    float _1832 = _1796 * _1800;
    float _1834 = _1756 * _1800;
    float _1836 = _1782 * _1800;
    float _1838 = _1830 * _1822;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = _1834 * _1822;
    float _1846 = fma(_1818, _1808, _1814);
    float _1848 = -_1826;
    float _1850 = fma(_1818, _1810, _1848);
    float _1852 = -_1822;
    float _1854 = _1818 * _1852;
    float _1856 = -_1810;
    float _1858 = fma(_1818, _1826, _1856);
    float _1860 = fma(_1846, _1828, _1838);
    float _1862 = fma(_1818, _1814, _1808);
    float _1864 = fma(_1832, _1828, _1854);
    float _1866 = fma(_1858, _1828, _1844);
    float _1868 = fma(_1850, _1842, _1860);
    float _1870 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1872 = fma(_1836, _1842, _1864);
    float _1874 = fma(_1862, _1842, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    float _1888 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1892 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1870);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1906 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1890);
    float _1908 = _862 + _1900;
    float _1910 = _990 + _1902;
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1922 = _1910 + _1920;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1882);
    float _1928 = _1918 * _1918;
    float _1930 = _1146 + _1904;
    float _1932 = -_1818;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1936 = -_1818;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1940 = fma(_1922, _1922, _1928);
    float _1942 = -_1818;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1946 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1948 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1950 = sqrt(_1940);
    float _1952 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1954 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1958 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1960 = _1830;
    float _1962 = _1858;
    float _1964 = _1908;
    if (!_1958)
    {
        _1960 = _1908;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1958)
    {
        _1962 = _1910;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (!_1958)
    {
        _1964 = _1930;
    }
    float _1974 = _1964;
    bool _1976 = !_1958;
    float _1978 = _1974;
    if (!_1976)
    {
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1984 = _1950 + _1982;
        float _1986 = rsqrt(_1940);
        float _1988 = _1984 * _1980;
        float _1990 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1992 = _1988 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = _1992 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = _1996 + (-1.0);
        float _2004 = fma(_2000, _1990, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = _1986 * _2004;
        float _2010 = fma(_1930, _1996, _2006);
        float _2012 = fma(_1922, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2014 = fma(_1918, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1978 = _2010;
        _1972 = _2012;
        _1968 = _2014;
    }
    float _2016 = _1978;
    float _2018 = _1972;
    float _2020 = _1968;
    float _2022 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = -_1146;
    float _2026 = _2024 + _2016;
    float _2028 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _2030 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2036 = -_990;
    float _2038 = _2036 + _2018;
    float _2040 = _2026 * _2026;
    float _2042 = -_862;
    float _2044 = _2042 + _2020;
    float _2046 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _2048 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _2050 = fma(_2038, _2038, _2040);
    float _2052 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _2054 = _2034 * _2046;
    float _2056 = _2034 * _2048;
    float _2058 = fma(_2044, _2044, _2050);
    float _2060 = _2034 * _2052;
    float _2062 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2064 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2066 = sqrt(_2058);
    float _2068 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2030);
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2072 = fma(_2062, _1946, _2054);
    float _2074 = fma(_2062, _1948, _2056);
    float _2076 = fma(_2062, _1952, _2060);
    float _2078 = _2064 + _2072;
    float _2080 = _2068 + _2074;
    float _2082 = _2070 + _2076;
    out.m_70.x = _2078;
    out.m_70.y = _2080;
    out.m_70.z = _2082;
    bool _2084 = _2066 > 0.0;
    bool _2086 = !_2084;
    float _2088 = _2066;
    float _2090 = _2032;
    float _2092 = _2016;
    float _2094 = _2018;
    float _2096 = _2020;
    if (!_2086)
    {
        bool _2098 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2100 = _2072;
        if (_2098)
        {
            float _2102 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2100 = _2102;
        }
        float _2104 = _2100;
        float _2106 = _2104;
        if (_2098)
        {
            float _2108 = _445 * _2104;
            _2088 = _2108;
        }
        float _2110 = _2088;
        float _2112 = _2110;
        if (_2098)
        {
            float _2114 = _447 * _2104;
            _2090 = _2114;
        }
        float _2116 = _2090;
        float _2118 = _2116;
        if (_2098)
        {
            float _2120 = _449 * _2104;
            _2106 = _2120;
        }
        float _2122 = _2106;
        float _2124 = _2122;
        if (!_2098)
        {
            float _2126 = _103 + 1.0;
            if (!_161)
            {
                float _2128 = _2126 * _2126;
                float _2130 = _2128 * 0.5;
                _455 = _2130;
            }
            float _2132 = _455;
            float _2134 = _2132;
            if (!_161)
            {
                float _2136 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2134 = _2136;
            }
            float _2138 = _2134;
            bool _2140 = !_161;
            float _2142 = _2138;
            if (!_2140)
            {
                float _2144 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2146 = log2(_2144);
                float _2148 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2150 = _2146 * _2126;
                float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2154 = 1.0 + _2152;
                float _2156 = exp2(_2150);
                float _2158 = _2148 * 0.693147182464599609375;
                float _2160 = 1.0 / _2158;
                float _2162 = 1.0 / _2154;
                float _2164 = _2156 + (-1.0);
                float _2166 = -_2164;
                float _2168 = fma(_2166, _2160, _2126);
                float _2170 = _2168 * _2162;
                float _2172 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2142 = _2172;
            }
            float _2174 = _2142;
            float _2176 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2180 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2182 = _2174;
            if (!_161)
            {
                _2182 = _2126;
            }
            float _2184 = _2182;
            float _2186 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2188 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2190 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2192 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2186);
            float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2188);
            float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2192);
            bool _2198 = !_161;
            float _2200 = _2184;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = _2204 * _2126;
                float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2210 = 1.0 + _2208;
                float _2212 = exp2(_2206);
                float _2214 = 1.0 / _2210;
                float _2216 = -_2212;
                float _2218 = _2216 + 1.0;
                float _2220 = _2218 * _2214;
                _2200 = _2220;
            }
            float _2222 = _2200;
            float _2224 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2190);
            float _2226 = fma(_2222, _165, _2196);
            float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2194);
            float _2230 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2224);
            float _2232 = -_405;
            float _2234 = _2232 + _2226;
            float _2236 = fma(_2222, _163, _2228);
            float _2238 = fma(_2222, _167, _2230);
            float _2240 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2242 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2244 = -_411;
            float _2246 = _2244 + _2236;
            float _2248 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2250 = -_417;
            float _2252 = _2250 + _2238;
            float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2240);
            float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2242);
            float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
            float _2260 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2254);
            float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2256);
            float _2264 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2258);
            _457 = _2262;
            _459 = _2260;
            _461 = _2264;
            _2112 = _2260;
            _2118 = _2262;
            _2124 = _2264;
        }
        float _2266 = _457;
        float _2268 = _459;
        float _2270 = _461;
        float _2272 = _2112;
        float _2274 = _2118;
        float _2276 = _2124;
        float _2278 = _2266 * _2266;
        float _2280 = rsqrt(_2058);
        float _2282 = fma(_2268, _2268, _2278);
        float _2284 = fma(_2270, _2270, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = _2038 * _2280;
        float _2290 = _2026 * _2280;
        float _2292 = _2044 * _2280;
        bool _2294 = _2286 > 0.0;
        bool _2296 = !_2294;
        _463 = _2290;
        _465 = _2268;
        if (!_2296)
        {
            float _2298 = rsqrt(_2284);
            float _2300 = _2298 * _2266;
            float _2302 = _2298 * _2268;
            float _2304 = _2298 * _2270;
            float _2306 = _2290 * _2300;
            float _2308 = fma(_2288, _2302, _2306);
            float _2310 = fma(_2292, _2304, _2308);
            float _2312 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2314 = fma(_2272, _2312, _2018);
            float _2316 = fma(_2274, _2312, _2016);
            float _2318 = fma(_2276, _2312, _2020);
            _2092 = _2316;
            _2094 = _2314;
            _2096 = _2318;
        }
    }
    float _2320 = _2092;
    float _2322 = _2094;
    float _2324 = _2096;
    float _2326 = _463;
    float _2328 = _465;
    bool _2330 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2338 = _2334 || _2336;
    float _2340 = -_1680;
    float _2342 = _2340 + _2320;
    float _2344 = -_1678;
    float _2346 = _2344 + _2322;
    float _2348 = -_1688;
    float _2350 = _2348 + _2324;
    float _2352 = _2346;
    float _2354 = _2350;
    float _2356 = _2326;
    if (_2338)
    {
        _1764 = _2342;
    }
    float _2358 = _1764;
    float _2360 = _2358;
    if (!_2338)
    {
        float _2362 = _1698 * _1698;
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2366 = -_990;
        float _2368 = _2366 + _2322;
        float _2370 = -_1146;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_1706, _1706, _2362);
        float _2376 = -_862;
        float _2378 = _2376 + _2324;
        float _2380 = fma(_1714, _1714, _2374);
        float _2382 = 1.0 / _1802;
        float _2384 = sqrt(_2380);
        float _2386 = precise::min(_2384, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2388 = _2386 * _2364;
        float _2390 = _2388 * _2382;
        float _2392 = fma(_2368, _2390, _1692);
        float _2394 = fma(_2372, _2390, _1686);
        float _2396 = fma(_2378, _2390, _1702);
        _2360 = _2394;
        _2352 = _2392;
        _2354 = _2396;
    }
    float _2398 = _2360;
    float _2400 = _2352;
    float _2402 = _2354;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2406 = _2398 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = _2400 + _2408;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 + _2412;
    float _2416 = _2406 * _2406;
    float _2418 = fma(_2410, _2410, _2416);
    float _2420 = fma(_2414, _2414, _2418);
    float _2422 = rsqrt(_2420);
    float _2424 = sqrt(_2420);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2428 = _2410 * _2426;
    float _2430 = _2414 * _2426;
    float _2432 = _2428 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 + _2434;
    float _2438 = sqrt(_2436);
    bool _2440 = _2438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = _2438 + _2442;
    float _2446 = _2422;
    float _2448 = _2444;
    float _2450 = _2406;
    float _2452 = _2426;
    if (_2440)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2454;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    if (_2440)
    {
        float _2460 = _2444 * _2456;
        _2448 = _2460;
    }
    float _2462 = _2448;
    if (_2440)
    {
        float _2464 = rsqrt(_2436);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = _2466;
    if (_2440)
    {
        float _2470 = _2462 * 0.15915493667125701904296875;
        _2356 = _2470;
    }
    float _2472 = _2356;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2476 = _2414;
    float _2478 = _2472;
    if (_2440)
    {
        float _2480 = _2472 * 6.283185482025146484375;
        float _2482 = sin(_2480);
        _2476 = _2482;
    }
    float _2484 = _2476;
    float _2486 = precise::max(0.0, _2474);
    float _2488 = _2328;
    float _2490 = _2486;
    if (_2440)
    {
        float _2492 = _2472 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        _2488 = _2494;
    }
    float _2496 = _2488;
    float _2498 = -_2426;
    float _2500 = -_2486;
    float _2502 = fma(_2406, _2498, _2500);
    if (_2440)
    {
        float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2504;
    }
    float _2506 = _2450;
    float _2508 = _2484;
    float _2510 = _2506;
    if (_2440)
    {
        float _2512 = fma(_2484, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2508 = _2512;
    }
    float _2514 = _2508;
    float _2516 = _2514;
    if (!_2440)
    {
        _2510 = _2502;
    }
    float _2518 = _2510;
    float _2520 = _2518;
    if (_2440)
    {
        float _2522 = _2466 * _2514;
        _2452 = _2522;
    }
    float _2524 = _2452;
    if (!_2440)
    {
        _2468 = _2428;
    }
    float _2526 = _2468;
    float _2528 = _2526;
    float _2530 = _2496;
    if (_2440)
    {
        float _2532 = _2496 + (-1.0);
        _2490 = _2532;
    }
    float _2534 = _2490;
    float _2536 = _2534;
    if (_2440)
    {
        float _2538 = _2428 * _2524;
        _2528 = _2538;
    }
    float _2540 = _2528;
    if (!_2440)
    {
        _2516 = _2432;
    }
    float _2542 = _2516;
    float _2544 = _2542;
    if (_2440)
    {
        float _2546 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2546;
    }
    float _2548 = _2478;
    if (!_2440)
    {
        _2536 = _2430;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (_2440)
    {
        float _2554 = _2430 * _2524;
        _2552 = _2554;
    }
    float _2556 = _2552;
    if (_2440)
    {
        float _2558 = _2540 * _2540;
        _2544 = _2558;
    }
    float _2560 = _2544;
    if (_2440)
    {
        float _2562 = fma(_2502, _2496, _2548);
        _2520 = _2562;
    }
    float _2564 = _2520;
    if (!_2440)
    {
        _2530 = _2434;
    }
    float _2566 = _2530;
    float _2568 = _2566;
    if (_2440)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2564, _2564, _2560);
    float _2576 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2580 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = _2574 + _2572;
    float _2584 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2586 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = rsqrt(_2582);
    float _2596 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2586);
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2600);
    float _2614 = abs(_2604);
    float _2616 = log2(_2614);
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2620 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2608);
    float _2622 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2624 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2626 = -_2618;
    float _2628 = fma(_2626, _2578, 1.0);
    float _2630 = _2594 * _2540;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2594 * _2564;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2640 = _2594 * _2556;
    float _2642 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2646 = -_2638;
    float _2648 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2646);
    float _2650 = log2(_2628);
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2654 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2656 = -_2640;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2648);
    float _2660 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2662 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2652);
    float _2664 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2658, -0.5, 0.5);
    float _2668 = exp2(_2654);
    float _2670 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2660);
    float _2672 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2658, 0.5, 0.5);
    float _2676 = _2636 + 1.0;
    float _2678 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2670);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = 1.0 / _2662;
    float _2684 = fma(_2674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2686 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2678);
    float _2688 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2690 = _2650 * 0.693147182464599609375;
    float _2692 = fma(_2674, _2684, -0.212114393711090087890625);
    float _2694 = sqrt(_2666);
    float _2696 = -_2636;
    float _2698 = fma(_2668, _2676, _2696);
    float _2700 = fma(_2674, _2692, 1.570728778839111328125);
    float _2702 = fma(_2698, 0.5, 0.5);
    float _2704 = _2686 * _2682;
    float _2706 = _2688 * _2682;
    float _2708 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2710 = fma(_2704, 0.5, 0.5);
    float _2712 = fma(_2706, -0.5, 0.5);
    float _2714 = _2694 * 0.636619746685028076171875;
    float3 _7289 = float3(_2710, _2712, _2708);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7289, float3(0.0), isnan(_7289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7289, float3(0.0), isnan(_7289)), level(0.0)).x;
    float3 _7300 = float3(_2710, _2712, _2708);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7300, float3(0.0), isnan(_7300)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7300, float3(0.0), isnan(_7300)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float _2729 = -_2700;
    float _2731 = fma(_2714, _2729, 1.0);
    float2 _7322 = float2(_2731, _2702);
    float3 _2735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7322, float2(0.0), isnan(_7322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7322, float2(0.0), isnan(_7322)), level(0.0)).xyz;
    float _2737 = _2735.x;
    float _2739 = _2735.y;
    float _2741 = _2735.z;
    float _2743 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2745 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2747 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2749 = isnan(0.5);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2755 = _2751 || _2753;
    float _2757 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2759 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2743);
    float _2761 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2745);
    float _2763 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2757);
    float _2765 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2759);
    float _2767 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2761);
    float _2769 = _2662 * 0.5;
    float _2771 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2775 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2777 = fma(_2688, -0.5, _2769);
    float _2779 = _2765;
    float _2781 = _2632;
    float _2783 = _2688;
    float _2785 = _2686;
    if (!_2755)
    {
        _2779 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2787 = _2779;
    float _2789 = 1.0 / _2773;
    float _2791 = _2775 + _2773;
    float _2793 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2771);
    float _2795 = _2793 + _2662;
    out.gl_Position.x = _2686;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2793;
    out.gl_Position.w = _2662;
    float _2797 = _2795 * 0.5;
    float _2799 = _2791 * _2789;
    float _2801 = _2799 * 0.5;
    float _2803 = _2791;
    float _2805 = _2801;
    float _2807 = _2793;
    if (!_2755)
    {
        _2803 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2803;
    float _2811 = _2809;
    if (!_2755)
    {
        float _2813 = -_2787;
        float _2815 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2813);
        _2805 = _2815;
    }
    float _2817 = _2805;
    float _2819 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2755)
    {
        float _2821 = -_2809;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2781 = _2823;
    }
    float _2825 = _2781;
    float _2827 = _2686 + _2662;
    float _2829 = _2817;
    if (!_2755)
    {
        float _2831 = 1.0 / _2817;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = _2827 * 0.5;
    out.m_72.x = _2835;
    out.m_72.y = _2777;
    out.m_72.z = _2797;
    out.m_72.w = _2662;
    float _2837 = exp2(_2819);
    float _2839 = _2825;
    if (!_2755)
    {
        float _2841 = 1.0 / _2825;
        _2839 = _2841;
    }
    float _2843 = _2839;
    float _2845 = _2833;
    if (!_2755)
    {
        float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2849 = -_2809;
        float _2851 = fma(_2833, _2847, _2849);
        _2811 = _2851;
    }
    float _2853 = _2811;
    if (_2755)
    {
        _2845 = 1.0;
    }
    float _2855 = _2845;
    float _2857 = -_2837;
    float _2859 = _2857 + 1.0;
    float _2861 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2855;
    if (!_2755)
    {
        float _2865 = _2853 * _2843;
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        _2863 = _2867;
    }
    float _2869 = _2863;
    bool _2871 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2873 = isnan(_2424);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2879 = _2875 || _2877;
    if (!_2879)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2881 = _2807;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2879)
    {
        _2783 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2783;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2879)
    {
        _2785 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2785;
    float _2895 = _2861 * _2716;
    float _2897 = -_2861;
    float _2899 = _2897 + 1.0;
    float _2901 = _2727 * _2895;
    float _2903 = _2741 * _2895;
    float _2905 = fma(_2737, _2901, _2721);
    float _2907 = fma(_2739, _2901, _2723);
    float _2909 = _2727 * _2899;
    float _2911 = fma(_2727, _2903, _2725);
    float _2913 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_74.x = _2905;
    out.m_74.y = _2907;
    out.m_74.z = _2911;
    out.m_74.w = _2909;
    bool _2915 = !_2879;
    float _2917 = _2893;
    float _2919 = _2893;
    if (!_2915)
    {
        bool _2921 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_2424);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _2424 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = _2933 * _2939;
            float _2951 = precise::clamp(_2949, 0.0, 1.0);
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2957 = fma(_2951, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2959 = fma(_2951, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2961 = fma(_2951, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2891 = _2961;
            _2885 = _2959;
            _2919 = _2957;
            _2963 = true;
        }
        else
        {
            bool _2965 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_2424);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2883;
            _2885 = _2975;
            if (!_2973)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2889;
            _2891 = _2977;
            if (!_2973)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2917;
            bool _2981 = !_2973;
            _2919 = _2979;
            if (!_2981)
            {
                bool _2983 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2985 = isnan(_2424);
                bool _2987 = _2983 || _2985;
                bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2991 = _2987 || _2989;
                if (!_2991)
                {
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2995 = _2424 + _2993;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2997;
                    float _3001 = 1.0 / _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3011 = _2995 * _3001;
                    float _3013 = precise::clamp(_3011, 0.0, 1.0);
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3019 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3023 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2891 = _3023;
                    _2885 = _3021;
                    _2919 = _3019;
                    _2963 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2963 = false;
    float _3025 = _2891;
    float _3027 = _2885;
    float _3029 = _2919;
    float _3031 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.x = 0.0;
    float _3033 = _3025 * 0.586610972881317138671875;
    bool _3035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3031;
    float _3037 = fma(_3027, 0.298911988735198974609375, _3033);
    bool _3039 = _2869 > 0.0;
    bool _3041 = isnan(_2869);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.0);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3029, 0.114477999508380889892578125, _3037);
    float _3051 = -_3049;
    float _3053 = _3051 + _3027;
    float _3055 = -_3049;
    float _3057 = _3055 + _3025;
    float _3059 = -_3049;
    float _3061 = _3059 + _3029;
    float _3063 = fma(_3053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3065 = fma(_3057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3067 = fma(_3061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    bool _3069 = !_3035;
    if (!_3069)
    {
        float _3071 = -_2398;
        float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3075 = -_2400;
        float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3079 = -_2402;
        float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3083 = _3073 * _3073;
        float _3085 = fma(_3077, _3077, _3083);
        float _3087 = fma(_3081, _3081, _3085);
        float _3089 = sqrt(_3087);
        float _3091 = rsqrt(_3087);
        float _3093 = -_3089;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3077 * _3091;
        float _3103 = _3073 * _3091;
        float _3105 = abs(_3099);
        float _3107 = log2(_3105);
        float _3109 = _3081 * _3091;
        float _3111 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3113 = _2080 * _3103;
        float _3115 = -_3103;
        float _3117 = -_3111;
        float _3119 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3117);
        float _3121 = fma(_2078, _3101, _3113);
        float _3123 = -_3109;
        float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3119);
        float _3127 = fma(_2082, _3109, _3121);
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3133 = _3125 + _3131;
        float _3135 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3139 = precise::clamp(_3137, 0.0, 1.0);
        float _3141 = exp2(_3135);
        float _3143 = _3141 * _3139;
        float _3145 = _3129 * _3143;
        float _3147 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3149 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3151 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3147;
        out.m_76.y = _3149;
        out.m_76.z = _3151;
    }
    out.m_78.x = _3063;
    out.m_78.y = _3065;
    out.m_78.z = _3067;
    if (_3047)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = in.m_46.w;
    float _96 = trunc(_92);
    int _99 = int(_96);
    float _101 = -_94;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _103;
    bool _107 = _99 >= 1;
    float _109 = 0.0;
    float _111 = _94;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3220 = as_type<float>(_119);
        out.gl_Position.z = _3220;
    }
    if (!_107)
    {
        return out;
    }
    bool _123 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_94);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = float(_99);
    bool _135 = _103 >= _133;
    bool _137 = !_131;
    bool _139 = _135 || _137;
    if (_139)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _111;
    if (_139)
    {
        out.m_51.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _121 = as_type<int>(_143);
    }
    int _145 = _121;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3275 = as_type<float>(_145);
        out.gl_Position.z = _3275;
    }
    if (_139)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_56.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    float _211 = 0.0;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _149 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _149);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
        _211 = _225;
    }
    float _243 = _209;
    float _245 = _211;
    float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _249 = !_161;
    float _251 = _245;
    float _253 = _243;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _149 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _185 = _273;
    }
    float _275 = _185;
    float _277 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _285 = _275;
    if (!_161)
    {
        float _287 = _103 * _103;
        float _289 = _287 * 0.5;
        _251 = _289;
    }
    float _291 = _251;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _283);
    float _299 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _301 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_161;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _103 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _103);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _293);
    float _345 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].y, _295);
    float _347 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _351 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].z, _297);
    float _357 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _349);
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].y, _351);
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].z, _353);
    float _363 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_275, _163, _343);
    float _367 = fma(_275, _165, _345);
    float _369 = fma(_275, _167, _355);
    float _371 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _357);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].y, _359);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].z, _361);
    if (!_161)
    {
        _285 = _103;
    }
    float _377 = _285;
    bool _379 = !_161;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _103 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
    }
    float _403 = _381;
    float _405 = fma(_403, _165, _373);
    float _407 = 1.0 / _133;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _411 = fma(_403, _163, _371);
    float _413 = -_405;
    float _415 = _367 + _413;
    float _417 = fma(_403, _167, _375);
    float _419 = fma(_367, _151, _171);
    float _421 = -_411;
    float _423 = _365 + _421;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _427 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _429 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = -_417;
    float _433 = _369 + _431;
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _441 = fma(_365, _151, _169);
    float _443 = fma(_369, _151, _173);
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _451 = _103 * _407;
    bool _453 = !_409;
    float _455 = _449;
    float _457 = _447;
    float _459 = _445;
    float _461 = _449;
    float _463 = _417;
    float _465 = _445;
    float _483;
    if (!_453)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _451;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _491 * _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _523 * _527;
    float _545 = -_523;
    float _547 = _545 + 1.0;
    float _549 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _543;
    float _555 = _551 * _543;
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _451;
    }
    _589 = false;
    float _591 = _587;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _603 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _605 = int(_603);
    float _607 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_591);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _631 = float(_595);
    float _633 = 1.0 / _613;
    bool _635 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_591);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = float(uint(_605));
    float _653 = 1.0 / _631;
    int _655 = ~_605;
    int _657 = _655 + 1;
    bool _659 = _605 == 0;
    int _661 = ~_605;
    int _663 = _661 + 1;
    float _665 = 1.0 / _651;
    float _667 = _103 * _653;
    float _669 = 1.0 / _629;
    int _671 = as_type<int>(_665) + (-2);
    float _673 = trunc(_667);
    int _675 = int(_673);
    float _677 = float(uint(_675));
    float _679 = as_type<float>(_671) * _677;
    int _681 = ~_605;
    int _683 = _681 + 1;
    float _685 = trunc(_679);
    float _687 = precise::max(_685, 0.0);
    uint _690 = uint(_687);
    float _692 = float(_605);
    int _694 = _683 * int(_690);
    int _696 = _694 + _675;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = float(uint(_696));
    float _704 = as_type<float>(_671) * _702;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = trunc(_704);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    bool _716 = !_708;
    float _718 = _716 ? 7.345489978790283203125 : 1.0;
    float _720 = _718 * _698;
    float _722 = floor(_720);
    int _724 = int(_690) + int(_714);
    float _726 = float(_675);
    int _728 = _657 * _724;
    int _730 = _728 + _675;
    bool _732 = _726 >= _692;
    bool _734 = isnan(_726);
    bool _736 = _732 || _734;
    bool _738 = isnan(_692);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = uint(_730) >= uint(_605);
    float _746 = trunc(_742);
    int _748 = int(_746);
    bool _750 = !_744;
    int _752 = _750 ? 0 : (-1);
    float _754 = -_722;
    float _756 = _720 + _754;
    int _758 = ~_724;
    int _760 = _758 + _752;
    int _762 = _760 + 1;
    float _764 = _756 * _692;
    int _766 = _605 + (-1);
    int _768 = _605 * _762;
    int _770 = _768 + _675;
    float _772 = trunc(_764);
    int _774 = int(_772);
    int _776 = ~_748;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    bool _782 = !_659;
    int _784 = _782 ? _770 : (-1);
    int _786 = _784 * _780;
    float _788 = _103 * _692;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _804 = _802 != 0;
    float _806 = _788 * _407;
    int _808 = _748 * _766;
    int _810 = _808 + _786;
    bool _812 = !_796;
    int _814 = _812 ? 0 : 1;
    bool _816 = !_792;
    int _818 = _816 ? 0 : 1;
    float _820 = trunc(_806);
    int _822 = int(_820);
    bool _824 = !_804;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_814);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _832 = _830 != 0;
    bool _834 = !_800;
    int _836 = _834 ? 0 : 1;
    int _838 = _810 * _828;
    int _840 = abs(_818);
    int _842 = abs(_826);
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_836);
    int _850 = _774 * _842;
    int _852 = _850 + _675;
    float _854 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    int _856 = abs(_846);
    int _858 = _822 * _840;
    int _860 = _858 + _838;
    float _862 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _864 = ~_605;
    int _866 = _864 + 1;
    int _868 = _852 * _848;
    int _870 = _868 + _860;
    bool _872 = _700 > 0.5;
    int _874 = _774 * _856;
    int _876 = _874 + _870;
    float _878 = -_205;
    int _880 = _872 ? as_type<int>(_878) : as_type<int>(_205);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _890 = float(uint(_876));
    float _892 = 1.0 / _888;
    float _894 = as_type<float>(_671) * _890;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _900 = trunc(_894);
    float _902 = precise::max(_900, 0.0);
    uint _904 = uint(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _910 = 1.0 / _898;
    int _912 = _866 * int(_904);
    int _914 = _912 + _876;
    float _916 = float(uint(_914));
    float _918 = as_type<float>(_671) * _916;
    int _920 = ~_605;
    int _922 = _920 + 1;
    float _924 = trunc(_918);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = int(_904) + int(_928);
    float _932 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _934 = log2(_932);
    int _936 = _922 * _930;
    int _938 = _936 + _876;
    bool _940 = uint(_938) >= uint(_605);
    float _942 = _698 * 2.0;
    bool _944 = !_940;
    int _946 = _944 ? 0 : (-1);
    float _948 = floor(_942);
    int _950 = ~_930;
    int _952 = _950 + _946;
    int _954 = _952 + 1;
    float _956 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _958 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _960 = _605 * _954;
    int _962 = _960 + _876;
    float _964 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _956);
    float _966 = _700 * 2.0;
    float _968 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _970 = -_609;
    float _972 = fma(_958, 2.0, _970);
    bool _974 = !_659;
    int _976 = _974 ? _962 : (-1);
    float _978 = floor(_966);
    float _980 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _982 = -_103;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _972);
    int _986 = _976 & 3;
    bool _988 = _986 != 0;
    float _990 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _992 = _948 >= 0.0;
    bool _994 = isnan(_948);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    bool _1002 = uint(_986) > 1u;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1006 = _976 & 3;
    bool _1008 = _1006 != 0;
    int _1010 = _1000 ? 0 : 1;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1014 = _1008 ? 0 : 1;
    bool _1016 = _948 > 0.0;
    bool _1018 = _698 > 0.5;
    float _1020 = in.m_58.z;
    int _1022 = ~_1014;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_1002)
    {
        int _1030 = ~_1014;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = -_195;
    int _1038 = _1018 ? as_type<int>(_1036) : as_type<int>(_195);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    int _1048 = ~_1010;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    int _1054 = _1052;
    if (!_1016)
    {
        int _1056 = ~_1010;
        int _1058 = _1056 + 1;
        _1054 = _1058;
    }
    int _1060 = _1054;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1064 = _978 >= 0.0;
    bool _1066 = isnan(_978);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = fma(_968, -2.0, _1062);
    float _1076 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1078;
    int _1082 = _1072 ? 0 : 1;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1086 = _978 > 0.0;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1020 * 2.0;
    float _1092 = _103 * _934;
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1102 = ~_1082;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = floor(_1090);
    float _1110 = _1080 * _633;
    out.m_60.x = _1012;
    out.m_60.y = _1094;
    out.m_60.z = _1096;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1112;
    float _1116 = _1100 * _910;
    int _1118 = _1106;
    if (!_1086)
    {
        int _1120 = ~_1082;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1074);
    float _1128 = exp2(_1092);
    float _1130 = _1114 * _669;
    float _1132 = _908 * _892;
    bool _1134 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_591);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1148 = !_1046;
    float _1150 = _1148 ? _195 : as_type<float>(_1038);
    float _1152 = _700 + _698;
    bool _1154 = !_884;
    float _1156 = _1154 ? _205 : as_type<float>(_880);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1168 = _1166 != 0;
    float _1170 = _700 + _1020;
    float _1172 = _1152 + (-1.0);
    bool _1174 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = isnan(_591);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = _1170 + (-1.0);
    bool _1188 = !_1164;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1194 = _1108 >= 0.0;
    bool _1196 = isnan(_1108);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1206 = float(uint(_852));
    float _1208 = -_1128;
    float _1210 = _1208 + 1.0;
    int _1212 = _1202 ? 0 : 1;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _591 + _1214;
    bool _1218 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1226 = _1222 || _1224;
    float _1228 = as_type<float>(_671) * _1206;
    float _1230 = fma(_1110, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1232 = _1226 ? _1210 : 0.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1236 = _591 + _1234;
    bool _1238 = _1108 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1242 = _591 + _1240;
    float _1244 = trunc(_1228);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1130, _1236, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1252 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1254 = isnan(_591);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = fma(_1116, _1242, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1266 = -_1184;
    float _1268 = _1266 + 1.0;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    int _1274 = abs(_1190);
    float _1276 = _1262 * _1268;
    float _1278 = -_1262;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    float _1284 = _625 * _1280;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1288 = _591 + _1286;
    float _1290 = _645 * _649;
    float _1292 = -_645;
    float _1294 = _1292 + 1.0;
    int _1296 = _663 * int(_1248);
    int _1298 = _1296 + _852;
    float _1300 = fma(_1132, _1288, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1302 = _1144 * _1294;
    float _1304 = _1150 + 0.5;
    float _1306 = float(uint(_1298));
    float _1308 = _1156 + (-0.5);
    float _1310 = _1230 * _1302;
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[80].x, _984);
    float _1314 = -_1144;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1308;
    float _1320 = -_1126;
    float _1322 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1320);
    float _1324 = _1232 * _1282;
    int _1326 = _976 >> 31;
    float _1328 = as_type<float>(_671) * _1306;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1310);
    int _1332 = _1326 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1336 = _976 + _1332;
    float _1338 = trunc(_1328);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = fma(_1264, _1290, _1330);
    float _1346 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    int _1348 = _1336 >> 2;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1352 = float(_1060);
    float _1354 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    int _1356 = _1348 << 4;
    int _1358 = _1356 + 368;
    float _1360 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1350);
    float _1362 = float(_1274);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    uint _1368 = uint(int(uint(_1358) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    float _1384 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1360);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1146 + _1386;
    float _1390 = -_1366;
    float _1392 = fma(_1150, _1390, _1312);
    float _1394 = fma(_1250, _1284, _1344);
    float _1396 = -_1384;
    float _1398 = _1396 + 1.0;
    float _1400 = _1362 * _1352;
    int _1402 = int(_1248) + int(_1342);
    int _1404 = _1358 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = fma(_1156, _1398, _1322);
    int _1424 = ~_605;
    int _1426 = _1424 + 1;
    float _1428 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1430 = !_1160;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = fma(_1300, _1276, _1394);
    int _1436 = ~_1212;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    int _1442 = _1426 * _1402;
    int _1444 = _1442 + _852;
    int _1446 = _1440;
    if (!_1238)
    {
        int _1448 = ~_1212;
        int _1450 = _1448 + 1;
        _1446 = _1450;
    }
    int _1452 = _1446;
    out.m_62.x = _1392;
    out.m_62.y = _1422;
    int _1454 = abs(_1432);
    float _1456 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1434);
    bool _1458 = uint(_1444) >= uint(_605);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1462 = _990 + _1460;
    float _1464 = in.m_64.x;
    float _1466 = in.m_64.y;
    float _1468 = in.m_64.z;
    int _1470 = abs(_1034);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = _862 + _1472;
    bool _1476 = !_1458;
    int _1478 = _1476 ? 0 : (-1);
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1428);
    bool _1482 = _986 != 3;
    float _1484 = _1400 * (-2.0);
    float _1486 = float(_1452);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1480);
    bool _1490 = !_988;
    int _1492 = _1490 ? 0 : 1;
    bool _1494 = uint(_986) >= 2u;
    int _1496 = ~_1470;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1494 ? 0 : 1;
    float _1504 = float(_1454);
    int _1506 = ~_1502;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1492);
    float _1514 = _1504 * _1486;
    int _1516 = _1510;
    if (_1482)
    {
        int _1518 = ~_1502;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = fma(_1484, _1466, _1466);
    bool _1526 = _986 != 3;
    int _1528 = _1500 * as_type<int>(_1382);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : (-1);
    int _1540 = ~_1402;
    int _1542 = _1540 + _1478;
    int _1544 = _1542 + 1;
    int _1546 = _1534 * as_type<int>(_1374);
    int _1548 = _1546 + _1528;
    int _1550 = abs(_1522);
    float _1552 = _1514 * (-2.0);
    int _1554 = abs(_1538);
    int _1556 = _605 * _1544;
    int _1558 = _1556 + _852;
    bool _1560 = !_1042;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = fma(_1192, _1552, _1192);
    float _1566 = fma(_1552, _1464, _1464);
    int _1568 = ~_1550;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = abs(_1562);
    int _1576 = _1572 * as_type<int>(_1412);
    int _1578 = _1576 + _1548;
    int _1580 = ~_1554;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    bool _1586 = _1488 >= 0.0;
    int _1588 = _1584 * as_type<int>(_1420);
    int _1590 = _1588 + _1578;
    int _1592 = ~_1574;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1204, _1484, _1204);
    float _1600 = _1388 * _1388;
    int _1602 = _1590 * _1596;
    bool _1604 = !_659;
    int _1606 = _1604 ? _1558 : (-1);
    float _1608 = fma(_1462, _1462, _1600);
    float _1610 = _1412;
    float _1612 = _1468;
    if (_1586)
    {
        out.m_51.x = 0.0;
    }
    if (_1586)
    {
        _1610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1610;
    int _1616 = _1606 * _1574;
    int _1618 = _1616 + _1602;
    float _1620 = fma(_1474, _1474, _1608);
    bool _1622 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1624 = isnan(1.0);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1630 = _1626 || _1628;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1634 = as_type<int>(_1614);
    if (_1586)
    {
        float _1636 = _1614 * 5.0;
        _1634 = as_type<int>(_1636);
    }
    int _1638 = _1634;
    float _1640 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _103 : _1324;
    float _1646 = rsqrt(_1620);
    bool _1648 = !_1168;
    int _1650 = _1648 ? 0 : 1;
    if (_1586)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5516 = as_type<float>(_1638);
        out.gl_Position.z = _5516;
    }
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1654 = _698 + (-0.5);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1658 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1566);
    float _1664 = float(_1618);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1670 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1672 = fma(_1644, _1564, _1662);
    out.m_66.x = _1664;
    float _1674 = _700 + (-0.5);
    float _1676 = _1670 * _1646;
    out.m_68.x = _1658;
    out.m_68.y = _1660;
    out.m_68.z = _1666;
    out.m_68.w = _1668;
    float _1678 = _1462 * _1676;
    float _1680 = _1388 * _1676;
    int _1682 = abs(_1650);
    if (_1586)
    {
        return out;
    }
    float _1684 = -_1680;
    float _1686 = _1146 + _1684;
    float _1688 = _1474 * _1676;
    float _1690 = -_1678;
    float _1692 = _990 + _1690;
    float _1694 = float(_1124);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -_1688;
    float _1702 = _862 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1692 + _1704;
    float _1708 = _1672 * 0.15915493667125701904296875;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = -_1680;
    float _1718 = _1388 + _1716;
    float _1720 = float(_1682);
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1710);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1524);
    float _1726 = -_1678;
    float _1728 = _1462 + _1726;
    float _1730 = _1718 * _1718;
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    float _1734 = fma(_1644, _1598, _1724);
    float _1736 = _1020 + _698;
    float _1738 = _1720 * _1694;
    float _1740 = fma(_1728, _1728, _1730);
    bool _1742 = _1732 >= 0.0;
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = _1736 + (-1.0);
    float _1748 = _1738 * (-2.0);
    float _1750 = -_1688;
    float _1752 = _1474 + _1750;
    float _1754 = _1708 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1760 = fma(_1748, _1468, _1468);
    float _1762 = _1020 + (-0.5);
    float _1764 = _1688;
    if (_1742)
    {
        _1612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1766 = _1612;
    float _1768 = _1708 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    int _1774 = as_type<int>(_1766);
    if (_1742)
    {
        out.m_51.x = 0.0;
    }
    if (_1742)
    {
        float _1776 = _1766 * 5.0;
        _1774 = as_type<int>(_1776);
    }
    int _1778 = _1774;
    float _1780 = _1744 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = fma(_1752, _1752, _1740);
    float _1786 = fma(_1758, _1748, _1758);
    float _1788 = fma(_1644, _1786, _1772);
    float _1790 = sqrt(_1784);
    if (_1742)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5762 = as_type<float>(_1778);
        out.gl_Position.z = _5762;
    }
    float _1792 = _1788 * 0.15915493667125701904296875;
    float _1794 = _1744 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    if (_1742)
    {
        return out;
    }
    float _1798 = _1792 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = _1646 * _1790;
    float _1804 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1808 = _1770 * _1796;
    float _1810 = _1770 * _1782;
    float _1812 = _1802 * _1804;
    float _1814 = _1756 * _1782;
    float _1816 = _1792 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = _1640 * _1802;
    float _1822 = _1806 * _1812;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1826 = _1756 * _1796;
    float _1828 = _1824 * _1820;
    float _1830 = _1770 * _1800;
    float _1832 = _1796 * _1800;
    float _1834 = _1756 * _1800;
    float _1836 = _1782 * _1800;
    float _1838 = _1830 * _1822;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = _1834 * _1822;
    float _1846 = fma(_1818, _1808, _1814);
    float _1848 = -_1826;
    float _1850 = fma(_1818, _1810, _1848);
    float _1852 = -_1822;
    float _1854 = _1818 * _1852;
    float _1856 = -_1810;
    float _1858 = fma(_1818, _1826, _1856);
    float _1860 = fma(_1846, _1828, _1838);
    float _1862 = fma(_1818, _1814, _1808);
    float _1864 = fma(_1832, _1828, _1854);
    float _1866 = fma(_1858, _1828, _1844);
    float _1868 = fma(_1850, _1842, _1860);
    float _1870 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1872 = fma(_1836, _1842, _1864);
    float _1874 = fma(_1862, _1842, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    float _1888 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1892 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1870);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1906 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1890);
    float _1908 = _862 + _1900;
    float _1910 = _990 + _1902;
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1922 = _1910 + _1920;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1882);
    float _1928 = _1918 * _1918;
    float _1930 = _1146 + _1904;
    float _1932 = -_1818;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1936 = -_1818;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1940 = fma(_1922, _1922, _1928);
    float _1942 = -_1818;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1946 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1948 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1950 = sqrt(_1940);
    float _1952 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1954 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1958 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1960 = _1830;
    float _1962 = _1858;
    float _1964 = _1908;
    if (!_1958)
    {
        _1960 = _1908;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1958)
    {
        _1962 = _1910;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (!_1958)
    {
        _1964 = _1930;
    }
    float _1974 = _1964;
    bool _1976 = !_1958;
    float _1978 = _1974;
    if (!_1976)
    {
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1984 = _1950 + _1982;
        float _1986 = rsqrt(_1940);
        float _1988 = _1984 * _1980;
        float _1990 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1992 = _1988 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = _1992 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = _1996 + (-1.0);
        float _2004 = fma(_2000, _1990, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = _1986 * _2004;
        float _2010 = fma(_1930, _1996, _2006);
        float _2012 = fma(_1922, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2014 = fma(_1918, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1978 = _2010;
        _1972 = _2012;
        _1968 = _2014;
    }
    float _2016 = _1978;
    float _2018 = _1972;
    float _2020 = _1968;
    float _2022 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = -_1146;
    float _2026 = _2024 + _2016;
    float _2028 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _2030 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2036 = -_990;
    float _2038 = _2036 + _2018;
    float _2040 = _2026 * _2026;
    float _2042 = -_862;
    float _2044 = _2042 + _2020;
    float _2046 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _2048 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _2050 = fma(_2038, _2038, _2040);
    float _2052 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _2054 = _2034 * _2046;
    float _2056 = _2034 * _2048;
    float _2058 = fma(_2044, _2044, _2050);
    float _2060 = _2034 * _2052;
    float _2062 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2064 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2066 = sqrt(_2058);
    float _2068 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2030);
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2072 = fma(_2062, _1946, _2054);
    float _2074 = fma(_2062, _1948, _2056);
    float _2076 = fma(_2062, _1952, _2060);
    float _2078 = _2064 + _2072;
    float _2080 = _2068 + _2074;
    float _2082 = _2070 + _2076;
    out.m_70.x = _2078;
    out.m_70.y = _2080;
    out.m_70.z = _2082;
    bool _2084 = _2066 > 0.0;
    bool _2086 = !_2084;
    float _2088 = _2066;
    float _2090 = _2032;
    float _2092 = _2016;
    float _2094 = _2018;
    float _2096 = _2020;
    if (!_2086)
    {
        bool _2098 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2100 = _2072;
        if (_2098)
        {
            float _2102 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2100 = _2102;
        }
        float _2104 = _2100;
        float _2106 = _2104;
        if (_2098)
        {
            float _2108 = _445 * _2104;
            _2088 = _2108;
        }
        float _2110 = _2088;
        float _2112 = _2110;
        if (_2098)
        {
            float _2114 = _447 * _2104;
            _2090 = _2114;
        }
        float _2116 = _2090;
        float _2118 = _2116;
        if (_2098)
        {
            float _2120 = _449 * _2104;
            _2106 = _2120;
        }
        float _2122 = _2106;
        float _2124 = _2122;
        if (!_2098)
        {
            float _2126 = _103 + 1.0;
            if (!_161)
            {
                float _2128 = _2126 * _2126;
                float _2130 = _2128 * 0.5;
                _455 = _2130;
            }
            float _2132 = _455;
            float _2134 = _2132;
            if (!_161)
            {
                float _2136 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2134 = _2136;
            }
            float _2138 = _2134;
            bool _2140 = !_161;
            float _2142 = _2138;
            if (!_2140)
            {
                float _2144 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2146 = log2(_2144);
                float _2148 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2150 = _2146 * _2126;
                float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2154 = 1.0 + _2152;
                float _2156 = exp2(_2150);
                float _2158 = _2148 * 0.693147182464599609375;
                float _2160 = 1.0 / _2158;
                float _2162 = 1.0 / _2154;
                float _2164 = _2156 + (-1.0);
                float _2166 = -_2164;
                float _2168 = fma(_2166, _2160, _2126);
                float _2170 = _2168 * _2162;
                float _2172 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2142 = _2172;
            }
            float _2174 = _2142;
            float _2176 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2180 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2182 = _2174;
            if (!_161)
            {
                _2182 = _2126;
            }
            float _2184 = _2182;
            float _2186 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2188 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2190 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2192 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2186);
            float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2188);
            float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2192);
            bool _2198 = !_161;
            float _2200 = _2184;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = _2204 * _2126;
                float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2210 = 1.0 + _2208;
                float _2212 = exp2(_2206);
                float _2214 = 1.0 / _2210;
                float _2216 = -_2212;
                float _2218 = _2216 + 1.0;
                float _2220 = _2218 * _2214;
                _2200 = _2220;
            }
            float _2222 = _2200;
            float _2224 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2190);
            float _2226 = fma(_2222, _165, _2196);
            float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2194);
            float _2230 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2224);
            float _2232 = -_405;
            float _2234 = _2232 + _2226;
            float _2236 = fma(_2222, _163, _2228);
            float _2238 = fma(_2222, _167, _2230);
            float _2240 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2242 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2244 = -_411;
            float _2246 = _2244 + _2236;
            float _2248 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2250 = -_417;
            float _2252 = _2250 + _2238;
            float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2240);
            float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2242);
            float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
            float _2260 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2254);
            float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2256);
            float _2264 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2258);
            _457 = _2262;
            _459 = _2260;
            _461 = _2264;
            _2112 = _2260;
            _2118 = _2262;
            _2124 = _2264;
        }
        float _2266 = _457;
        float _2268 = _459;
        float _2270 = _461;
        float _2272 = _2112;
        float _2274 = _2118;
        float _2276 = _2124;
        float _2278 = _2266 * _2266;
        float _2280 = rsqrt(_2058);
        float _2282 = fma(_2268, _2268, _2278);
        float _2284 = fma(_2270, _2270, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = _2038 * _2280;
        float _2290 = _2026 * _2280;
        float _2292 = _2044 * _2280;
        bool _2294 = _2286 > 0.0;
        bool _2296 = !_2294;
        _463 = _2290;
        _465 = _2268;
        if (!_2296)
        {
            float _2298 = rsqrt(_2284);
            float _2300 = _2298 * _2266;
            float _2302 = _2298 * _2268;
            float _2304 = _2298 * _2270;
            float _2306 = _2290 * _2300;
            float _2308 = fma(_2288, _2302, _2306);
            float _2310 = fma(_2292, _2304, _2308);
            float _2312 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2314 = fma(_2272, _2312, _2018);
            float _2316 = fma(_2274, _2312, _2016);
            float _2318 = fma(_2276, _2312, _2020);
            _2092 = _2316;
            _2094 = _2314;
            _2096 = _2318;
        }
    }
    float _2320 = _2092;
    float _2322 = _2094;
    float _2324 = _2096;
    float _2326 = _463;
    float _2328 = _465;
    bool _2330 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2338 = _2334 || _2336;
    float _2340 = -_1680;
    float _2342 = _2340 + _2320;
    float _2344 = -_1678;
    float _2346 = _2344 + _2322;
    float _2348 = -_1688;
    float _2350 = _2348 + _2324;
    float _2352 = _2346;
    float _2354 = _2350;
    float _2356 = _2326;
    if (_2338)
    {
        _1764 = _2342;
    }
    float _2358 = _1764;
    float _2360 = _2358;
    if (!_2338)
    {
        float _2362 = _1698 * _1698;
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2366 = -_990;
        float _2368 = _2366 + _2322;
        float _2370 = -_1146;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_1706, _1706, _2362);
        float _2376 = -_862;
        float _2378 = _2376 + _2324;
        float _2380 = fma(_1714, _1714, _2374);
        float _2382 = 1.0 / _1802;
        float _2384 = sqrt(_2380);
        float _2386 = precise::min(_2384, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2388 = _2386 * _2364;
        float _2390 = _2388 * _2382;
        float _2392 = fma(_2368, _2390, _1692);
        float _2394 = fma(_2372, _2390, _1686);
        float _2396 = fma(_2378, _2390, _1702);
        _2360 = _2394;
        _2352 = _2392;
        _2354 = _2396;
    }
    float _2398 = _2360;
    float _2400 = _2352;
    float _2402 = _2354;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2406 = _2398 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = _2400 + _2408;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 + _2412;
    float _2416 = _2406 * _2406;
    float _2418 = fma(_2410, _2410, _2416);
    float _2420 = fma(_2414, _2414, _2418);
    float _2422 = rsqrt(_2420);
    float _2424 = sqrt(_2420);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2428 = _2410 * _2426;
    float _2430 = _2414 * _2426;
    float _2432 = _2428 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 + _2434;
    float _2438 = sqrt(_2436);
    bool _2440 = _2438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = _2438 + _2442;
    float _2446 = _2422;
    float _2448 = _2444;
    float _2450 = _2406;
    float _2452 = _2426;
    if (_2440)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2454;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    if (_2440)
    {
        float _2460 = _2444 * _2456;
        _2448 = _2460;
    }
    float _2462 = _2448;
    if (_2440)
    {
        float _2464 = rsqrt(_2436);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = _2466;
    if (_2440)
    {
        float _2470 = _2462 * 0.15915493667125701904296875;
        _2356 = _2470;
    }
    float _2472 = _2356;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2476 = _2414;
    float _2478 = _2472;
    if (_2440)
    {
        float _2480 = _2472 * 6.283185482025146484375;
        float _2482 = sin(_2480);
        _2476 = _2482;
    }
    float _2484 = _2476;
    float _2486 = precise::max(0.0, _2474);
    float _2488 = _2328;
    float _2490 = _2486;
    if (_2440)
    {
        float _2492 = _2472 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        _2488 = _2494;
    }
    float _2496 = _2488;
    float _2498 = -_2426;
    float _2500 = -_2486;
    float _2502 = fma(_2406, _2498, _2500);
    if (_2440)
    {
        float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2504;
    }
    float _2506 = _2450;
    float _2508 = _2484;
    float _2510 = _2506;
    if (_2440)
    {
        float _2512 = fma(_2484, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2508 = _2512;
    }
    float _2514 = _2508;
    float _2516 = _2514;
    if (!_2440)
    {
        _2510 = _2502;
    }
    float _2518 = _2510;
    float _2520 = _2518;
    if (_2440)
    {
        float _2522 = _2466 * _2514;
        _2452 = _2522;
    }
    float _2524 = _2452;
    if (!_2440)
    {
        _2468 = _2428;
    }
    float _2526 = _2468;
    float _2528 = _2526;
    float _2530 = _2496;
    if (_2440)
    {
        float _2532 = _2496 + (-1.0);
        _2490 = _2532;
    }
    float _2534 = _2490;
    float _2536 = _2534;
    if (_2440)
    {
        float _2538 = _2428 * _2524;
        _2528 = _2538;
    }
    float _2540 = _2528;
    if (!_2440)
    {
        _2516 = _2432;
    }
    float _2542 = _2516;
    float _2544 = _2542;
    if (_2440)
    {
        float _2546 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2546;
    }
    float _2548 = _2478;
    if (!_2440)
    {
        _2536 = _2430;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (_2440)
    {
        float _2554 = _2430 * _2524;
        _2552 = _2554;
    }
    float _2556 = _2552;
    if (_2440)
    {
        float _2558 = _2540 * _2540;
        _2544 = _2558;
    }
    float _2560 = _2544;
    if (_2440)
    {
        float _2562 = fma(_2502, _2496, _2548);
        _2520 = _2562;
    }
    float _2564 = _2520;
    if (!_2440)
    {
        _2530 = _2434;
    }
    float _2566 = _2530;
    float _2568 = _2566;
    if (_2440)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2564, _2564, _2560);
    float _2576 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2580 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = _2574 + _2572;
    float _2584 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2586 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = rsqrt(_2582);
    float _2596 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2586);
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2600);
    float _2614 = abs(_2604);
    float _2616 = log2(_2614);
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2620 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2608);
    float _2622 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2624 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2626 = -_2618;
    float _2628 = fma(_2626, _2578, 1.0);
    float _2630 = _2594 * _2540;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2594 * _2564;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2640 = _2594 * _2556;
    float _2642 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2646 = -_2638;
    float _2648 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2646);
    float _2650 = log2(_2628);
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2654 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2656 = -_2640;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2648);
    float _2660 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2662 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2652);
    float _2664 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2658, -0.5, 0.5);
    float _2668 = exp2(_2654);
    float _2670 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2660);
    float _2672 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2658, 0.5, 0.5);
    float _2676 = _2636 + 1.0;
    float _2678 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2670);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = 1.0 / _2662;
    float _2684 = fma(_2674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2686 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2678);
    float _2688 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2690 = _2650 * 0.693147182464599609375;
    float _2692 = fma(_2674, _2684, -0.212114393711090087890625);
    float _2694 = sqrt(_2666);
    float _2696 = -_2636;
    float _2698 = fma(_2668, _2676, _2696);
    float _2700 = fma(_2674, _2692, 1.570728778839111328125);
    float _2702 = fma(_2698, 0.5, 0.5);
    float _2704 = _2686 * _2682;
    float _2706 = _2688 * _2682;
    float _2708 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2710 = fma(_2704, 0.5, 0.5);
    float _2712 = fma(_2706, -0.5, 0.5);
    float _2714 = _2694 * 0.636619746685028076171875;
    float3 _7289 = float3(_2710, _2712, _2708);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7289, float3(0.0), isnan(_7289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7289, float3(0.0), isnan(_7289)), level(0.0)).x;
    float3 _7300 = float3(_2710, _2712, _2708);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7300, float3(0.0), isnan(_7300)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7300, float3(0.0), isnan(_7300)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float _2729 = -_2700;
    float _2731 = fma(_2714, _2729, 1.0);
    float2 _7322 = float2(_2731, _2702);
    float3 _2735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7322, float2(0.0), isnan(_7322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7322, float2(0.0), isnan(_7322)), level(0.0)).xyz;
    float _2737 = _2735.x;
    float _2739 = _2735.y;
    float _2741 = _2735.z;
    float _2743 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2745 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2747 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2749 = isnan(0.5);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2755 = _2751 || _2753;
    float _2757 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2759 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2743);
    float _2761 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2745);
    float _2763 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2757);
    float _2765 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2759);
    float _2767 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2761);
    float _2769 = _2662 * 0.5;
    float _2771 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2775 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2777 = fma(_2688, -0.5, _2769);
    float _2779 = _2765;
    float _2781 = _2632;
    float _2783 = _2688;
    float _2785 = _2686;
    if (!_2755)
    {
        _2779 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2787 = _2779;
    float _2789 = 1.0 / _2773;
    float _2791 = _2775 + _2773;
    float _2793 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2771);
    float _2795 = _2793 + _2662;
    out.gl_Position.x = _2686;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2793;
    out.gl_Position.w = _2662;
    float _2797 = _2795 * 0.5;
    float _2799 = _2791 * _2789;
    float _2801 = _2799 * 0.5;
    float _2803 = _2791;
    float _2805 = _2801;
    float _2807 = _2793;
    if (!_2755)
    {
        _2803 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2803;
    float _2811 = _2809;
    if (!_2755)
    {
        float _2813 = -_2787;
        float _2815 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2813);
        _2805 = _2815;
    }
    float _2817 = _2805;
    float _2819 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2755)
    {
        float _2821 = -_2809;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2781 = _2823;
    }
    float _2825 = _2781;
    float _2827 = _2686 + _2662;
    float _2829 = _2817;
    if (!_2755)
    {
        float _2831 = 1.0 / _2817;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = _2827 * 0.5;
    out.m_72.x = _2835;
    out.m_72.y = _2777;
    out.m_72.z = _2797;
    out.m_72.w = _2662;
    float _2837 = exp2(_2819);
    float _2839 = _2825;
    if (!_2755)
    {
        float _2841 = 1.0 / _2825;
        _2839 = _2841;
    }
    float _2843 = _2839;
    float _2845 = _2833;
    if (!_2755)
    {
        float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2849 = -_2809;
        float _2851 = fma(_2833, _2847, _2849);
        _2811 = _2851;
    }
    float _2853 = _2811;
    if (_2755)
    {
        _2845 = 1.0;
    }
    float _2855 = _2845;
    float _2857 = -_2837;
    float _2859 = _2857 + 1.0;
    float _2861 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2855;
    if (!_2755)
    {
        float _2865 = _2853 * _2843;
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        _2863 = _2867;
    }
    float _2869 = _2863;
    bool _2871 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2873 = isnan(_2424);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2879 = _2875 || _2877;
    if (!_2879)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2881 = _2807;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2879)
    {
        _2783 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2783;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2879)
    {
        _2785 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2785;
    float _2895 = _2861 * _2716;
    float _2897 = -_2861;
    float _2899 = _2897 + 1.0;
    float _2901 = _2727 * _2895;
    float _2903 = _2741 * _2895;
    float _2905 = fma(_2737, _2901, _2721);
    float _2907 = fma(_2739, _2901, _2723);
    float _2909 = _2727 * _2899;
    float _2911 = fma(_2727, _2903, _2725);
    float _2913 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_74.x = _2905;
    out.m_74.y = _2907;
    out.m_74.z = _2911;
    out.m_74.w = _2909;
    bool _2915 = !_2879;
    float _2917 = _2893;
    float _2919 = _2893;
    if (!_2915)
    {
        bool _2921 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_2424);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _2424 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = _2933 * _2939;
            float _2951 = precise::clamp(_2949, 0.0, 1.0);
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2957 = fma(_2951, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2959 = fma(_2951, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2961 = fma(_2951, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2891 = _2961;
            _2885 = _2959;
            _2919 = _2957;
            _2963 = true;
        }
        else
        {
            bool _2965 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_2424);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2883;
            _2885 = _2975;
            if (!_2973)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2889;
            _2891 = _2977;
            if (!_2973)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2917;
            bool _2981 = !_2973;
            _2919 = _2979;
            if (!_2981)
            {
                bool _2983 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2985 = isnan(_2424);
                bool _2987 = _2983 || _2985;
                bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2991 = _2987 || _2989;
                if (!_2991)
                {
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2995 = _2424 + _2993;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2997;
                    float _3001 = 1.0 / _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3011 = _2995 * _3001;
                    float _3013 = precise::clamp(_3011, 0.0, 1.0);
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3019 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3023 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2891 = _3023;
                    _2885 = _3021;
                    _2919 = _3019;
                    _2963 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2963 = false;
    float _3025 = _2891;
    float _3027 = _2885;
    float _3029 = _2919;
    float _3031 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.x = 0.0;
    float _3033 = _3025 * 0.586610972881317138671875;
    bool _3035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3031;
    float _3037 = fma(_3027, 0.298911988735198974609375, _3033);
    bool _3039 = _2869 > 0.0;
    bool _3041 = isnan(_2869);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.0);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3029, 0.114477999508380889892578125, _3037);
    float _3051 = -_3049;
    float _3053 = _3051 + _3027;
    float _3055 = -_3049;
    float _3057 = _3055 + _3025;
    float _3059 = -_3049;
    float _3061 = _3059 + _3029;
    float _3063 = fma(_3053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3065 = fma(_3057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3067 = fma(_3061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    bool _3069 = !_3035;
    if (!_3069)
    {
        float _3071 = -_2398;
        float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3075 = -_2400;
        float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3079 = -_2402;
        float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3083 = _3073 * _3073;
        float _3085 = fma(_3077, _3077, _3083);
        float _3087 = fma(_3081, _3081, _3085);
        float _3089 = sqrt(_3087);
        float _3091 = rsqrt(_3087);
        float _3093 = -_3089;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3077 * _3091;
        float _3103 = _3073 * _3091;
        float _3105 = abs(_3099);
        float _3107 = log2(_3105);
        float _3109 = _3081 * _3091;
        float _3111 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3113 = _2080 * _3103;
        float _3115 = -_3103;
        float _3117 = -_3111;
        float _3119 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3117);
        float _3121 = fma(_2078, _3101, _3113);
        float _3123 = -_3109;
        float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3119);
        float _3127 = fma(_2082, _3109, _3121);
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3133 = _3125 + _3131;
        float _3135 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3139 = precise::clamp(_3137, 0.0, 1.0);
        float _3141 = exp2(_3135);
        float _3143 = _3141 * _3139;
        float _3145 = _3129 * _3143;
        float _3147 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3149 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3151 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3147;
        out.m_76.y = _3149;
        out.m_76.z = _3151;
    }
    out.m_78.x = _3063;
    out.m_78.y = _3065;
    out.m_78.z = _3067;
    if (_3047)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2963 = false;
    bool _589 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
    float _94 = in.m_46.w;
    float _96 = trunc(_92);
    int _99 = int(_96);
    float _101 = -_94;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _103;
    bool _107 = _99 >= 1;
    float _109 = 0.0;
    float _111 = _94;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3220 = as_type<float>(_119);
        out.gl_Position.z = _3220;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _123 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_94);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = float(_99);
    bool _135 = _103 >= _133;
    bool _137 = !_131;
    bool _139 = _135 || _137;
    if (_139)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _111;
    if (_139)
    {
        out.m_51.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _121 = as_type<int>(_143);
    }
    int _145 = _121;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3275 = as_type<float>(_145);
        out.gl_Position.z = _3275;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_56.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_44.x;
    float _171 = in.m_44.y;
    float _173 = in.m_44.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    float _183 = _147;
    float _185 = _149;
    if (!_161)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_161)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_181;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_161;
    float _209 = _201;
    float _211 = 0.0;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _149 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _149);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
        _211 = _225;
    }
    float _243 = _209;
    float _245 = _211;
    float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _249 = !_161;
    float _251 = _245;
    float _253 = _243;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _149 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _185 = _273;
    }
    float _275 = _185;
    float _277 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _285 = _275;
    if (!_161)
    {
        float _287 = _103 * _103;
        float _289 = _287 * 0.5;
        _251 = _289;
    }
    float _291 = _251;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _297 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _283);
    float _299 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _301 = _291 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_161;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _103 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _103);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    float _341 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _343 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].x, _293);
    float _345 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].y, _295);
    float _347 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _351 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _355 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[10].z, _297);
    float _357 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].x, _349);
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].y, _351);
    float _361 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[8].z, _353);
    float _363 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = fma(_275, _163, _343);
    float _367 = fma(_275, _165, _345);
    float _369 = fma(_275, _167, _355);
    float _371 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].x, _357);
    float _373 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].y, _359);
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[10].z, _361);
    if (!_161)
    {
        _285 = _103;
    }
    float _377 = _285;
    bool _379 = !_161;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _103 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
    }
    float _403 = _381;
    float _405 = fma(_403, _165, _373);
    float _407 = 1.0 / _133;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _411 = fma(_403, _163, _371);
    float _413 = -_405;
    float _415 = _367 + _413;
    float _417 = fma(_403, _167, _375);
    float _419 = fma(_367, _151, _171);
    float _421 = -_411;
    float _423 = _365 + _421;
    float _425 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _427 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _429 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _431 = -_417;
    float _433 = _369 + _431;
    float _435 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
    float _441 = fma(_365, _151, _169);
    float _443 = fma(_369, _151, _173);
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
    float _447 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].z, _437);
    float _449 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].z, _439);
    float _451 = _103 * _407;
    bool _453 = !_409;
    float _455 = _449;
    float _457 = _447;
    float _459 = _445;
    float _461 = _449;
    float _463 = _417;
    float _465 = _445;
    float _483;
    if (!_453)
    {
        float _467 = in.m_58.x;
        float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _471 = _467 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _475 = _473 * _469;
        float _477 = floor(_475);
        float _479 = -_477;
        float _481 = _475 + _479;
        _483 = _481;
        _485 = true;
    }
    else
    {
        _483 = _451;
    }
    _485 = false;
    float _487 = _483;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _491 = _487 + _489;
    float _493 = in.m_56.x;
    float _495 = in.m_56.y;
    bool _497 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _499 = isnan(_487);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _509;
    bool _513 = _487 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _515 = isnan(_487);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = -_507;
    float _527 = _525 + 1.0;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = 1.0 / _511;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _537 = _491 * _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = _523 * _527;
    float _545 = -_523;
    float _547 = _545 + 1.0;
    float _549 = fma(_531, _537, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _551 = fma(_541, _537, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _553 = _549 * _543;
    float _555 = _551 * _543;
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].x, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].x, _557);
    float _563 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[144].y, _559);
    float _565 = _561 * _493;
    float _567 = _563 * _495;
    bool _569 = !_535;
    float _587;
    if (!_569)
    {
        float _571 = in.m_58.x;
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _571 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        _587 = _451;
    }
    _589 = false;
    float _591 = _587;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _595 = int(_593);
    float _597 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _599 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _597);
    float _603 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _605 = int(_603);
    float _607 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _615 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_591);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _631 = float(_595);
    float _633 = 1.0 / _613;
    bool _635 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_591);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_625;
    float _649 = _647 + 1.0;
    float _651 = float(uint(_605));
    float _653 = 1.0 / _631;
    int _655 = ~_605;
    int _657 = _655 + 1;
    bool _659 = _605 == 0;
    int _661 = ~_605;
    int _663 = _661 + 1;
    float _665 = 1.0 / _651;
    float _667 = _103 * _653;
    float _669 = 1.0 / _629;
    int _671 = as_type<int>(_665) + (-2);
    float _673 = trunc(_667);
    int _675 = int(_673);
    float _677 = float(uint(_675));
    float _679 = as_type<float>(_671) * _677;
    int _681 = ~_605;
    int _683 = _681 + 1;
    float _685 = trunc(_679);
    float _687 = precise::max(_685, 0.0);
    uint _690 = uint(_687);
    float _692 = float(_605);
    int _694 = _683 * int(_690);
    int _696 = _694 + _675;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = float(uint(_696));
    float _704 = as_type<float>(_671) * _702;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = trunc(_704);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    bool _716 = !_708;
    float _718 = _716 ? 7.345489978790283203125 : 1.0;
    float _720 = _718 * _698;
    float _722 = floor(_720);
    int _724 = int(_690) + int(_714);
    float _726 = float(_675);
    int _728 = _657 * _724;
    int _730 = _728 + _675;
    bool _732 = _726 >= _692;
    bool _734 = isnan(_726);
    bool _736 = _732 || _734;
    bool _738 = isnan(_692);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = uint(_730) >= uint(_605);
    float _746 = trunc(_742);
    int _748 = int(_746);
    bool _750 = !_744;
    int _752 = _750 ? 0 : (-1);
    float _754 = -_722;
    float _756 = _720 + _754;
    int _758 = ~_724;
    int _760 = _758 + _752;
    int _762 = _760 + 1;
    float _764 = _756 * _692;
    int _766 = _605 + (-1);
    int _768 = _605 * _762;
    int _770 = _768 + _675;
    float _772 = trunc(_764);
    int _774 = int(_772);
    int _776 = ~_748;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    bool _782 = !_659;
    int _784 = _782 ? _770 : (-1);
    int _786 = _784 * _780;
    float _788 = _103 * _692;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _796 = _794 != 0;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _804 = _802 != 0;
    float _806 = _788 * _407;
    int _808 = _748 * _766;
    int _810 = _808 + _786;
    bool _812 = !_796;
    int _814 = _812 ? 0 : 1;
    bool _816 = !_792;
    int _818 = _816 ? 0 : 1;
    float _820 = trunc(_806);
    int _822 = int(_820);
    bool _824 = !_804;
    int _826 = _824 ? 0 : 1;
    int _828 = abs(_814);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _832 = _830 != 0;
    bool _834 = !_800;
    int _836 = _834 ? 0 : 1;
    int _838 = _810 * _828;
    int _840 = abs(_818);
    int _842 = abs(_826);
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_836);
    int _850 = _774 * _842;
    int _852 = _850 + _675;
    float _854 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _607);
    int _856 = abs(_846);
    int _858 = _822 * _840;
    int _860 = _858 + _838;
    float _862 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _864 = ~_605;
    int _866 = _864 + 1;
    int _868 = _852 * _848;
    int _870 = _868 + _860;
    bool _872 = _700 > 0.5;
    int _874 = _774 * _856;
    int _876 = _874 + _870;
    float _878 = -_205;
    int _880 = _872 ? as_type<int>(_878) : as_type<int>(_205);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _884 = _882 != 0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _890 = float(uint(_876));
    float _892 = 1.0 / _888;
    float _894 = as_type<float>(_671) * _890;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _900 = trunc(_894);
    float _902 = precise::max(_900, 0.0);
    uint _904 = uint(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _910 = 1.0 / _898;
    int _912 = _866 * int(_904);
    int _914 = _912 + _876;
    float _916 = float(uint(_914));
    float _918 = as_type<float>(_671) * _916;
    int _920 = ~_605;
    int _922 = _920 + 1;
    float _924 = trunc(_918);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = int(_904) + int(_928);
    float _932 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _934 = log2(_932);
    int _936 = _922 * _930;
    int _938 = _936 + _876;
    bool _940 = uint(_938) >= uint(_605);
    float _942 = _698 * 2.0;
    bool _944 = !_940;
    int _946 = _944 ? 0 : (-1);
    float _948 = floor(_942);
    int _950 = ~_930;
    int _952 = _950 + _946;
    int _954 = _952 + 1;
    float _956 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _958 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _960 = _605 * _954;
    int _962 = _960 + _876;
    float _964 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _956);
    float _966 = _700 * 2.0;
    float _968 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _970 = -_609;
    float _972 = fma(_958, 2.0, _970);
    bool _974 = !_659;
    int _976 = _974 ? _962 : (-1);
    float _978 = floor(_966);
    float _980 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _982 = -_103;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[76].x, _972);
    int _986 = _976 & 3;
    bool _988 = _986 != 0;
    float _990 = _980 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _992 = _948 >= 0.0;
    bool _994 = isnan(_948);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    bool _1002 = uint(_986) > 1u;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1006 = _976 & 3;
    bool _1008 = _1006 != 0;
    int _1010 = _1000 ? 0 : 1;
    float _1012 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1014 = _1008 ? 0 : 1;
    bool _1016 = _948 > 0.0;
    bool _1018 = _698 > 0.5;
    float _1020 = in.m_58.z;
    int _1022 = ~_1014;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_1002)
    {
        int _1030 = ~_1014;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = -_195;
    int _1038 = _1018 ? as_type<int>(_1036) : as_type<int>(_195);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    int _1048 = ~_1010;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    int _1054 = _1052;
    if (!_1016)
    {
        int _1056 = ~_1010;
        int _1058 = _1056 + 1;
        _1054 = _1058;
    }
    int _1060 = _1054;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1064 = _978 >= 0.0;
    bool _1066 = isnan(_978);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = fma(_968, -2.0, _1062);
    float _1076 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1078;
    int _1082 = _1072 ? 0 : 1;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1086 = _978 > 0.0;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1020 * 2.0;
    float _1092 = _103 * _934;
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1102 = ~_1082;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = floor(_1090);
    float _1110 = _1080 * _633;
    out.m_60.x = _1012;
    out.m_60.y = _1094;
    out.m_60.z = _1096;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1112;
    float _1116 = _1100 * _910;
    int _1118 = _1106;
    if (!_1086)
    {
        int _1120 = ~_1082;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1074);
    float _1128 = exp2(_1092);
    float _1130 = _1114 * _669;
    float _1132 = _908 * _892;
    bool _1134 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1136 = isnan(_591);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1148 = !_1046;
    float _1150 = _1148 ? _195 : as_type<float>(_1038);
    float _1152 = _700 + _698;
    bool _1154 = !_884;
    float _1156 = _1154 ? _205 : as_type<float>(_880);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1168 = _1166 != 0;
    float _1170 = _700 + _1020;
    float _1172 = _1152 + (-1.0);
    bool _1174 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1176 = isnan(_591);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = _1170 + (-1.0);
    bool _1188 = !_1164;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1194 = _1108 >= 0.0;
    bool _1196 = isnan(_1108);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1206 = float(uint(_852));
    float _1208 = -_1128;
    float _1210 = _1208 + 1.0;
    int _1212 = _1202 ? 0 : 1;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1216 = _591 + _1214;
    bool _1218 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1226 = _1222 || _1224;
    float _1228 = as_type<float>(_671) * _1206;
    float _1230 = fma(_1110, _1216, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1232 = _1226 ? _1210 : 0.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1236 = _591 + _1234;
    bool _1238 = _1108 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1242 = _591 + _1240;
    float _1244 = trunc(_1228);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = fma(_1130, _1236, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1252 = _591 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1254 = isnan(_591);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = fma(_1116, _1242, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1266 = -_1184;
    float _1268 = _1266 + 1.0;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    int _1274 = abs(_1190);
    float _1276 = _1262 * _1268;
    float _1278 = -_1262;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    float _1284 = _625 * _1280;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1288 = _591 + _1286;
    float _1290 = _645 * _649;
    float _1292 = -_645;
    float _1294 = _1292 + 1.0;
    int _1296 = _663 * int(_1248);
    int _1298 = _1296 + _852;
    float _1300 = fma(_1132, _1288, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1302 = _1144 * _1294;
    float _1304 = _1150 + 0.5;
    float _1306 = float(uint(_1298));
    float _1308 = _1156 + (-0.5);
    float _1310 = _1230 * _1302;
    float _1312 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[80].x, _984);
    float _1314 = -_1144;
    float _1316 = _1314 + 1.0;
    float _1318 = -_1308;
    float _1320 = -_1126;
    float _1322 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1320);
    float _1324 = _1232 * _1282;
    int _1326 = _976 >> 31;
    float _1328 = as_type<float>(_671) * _1306;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1310);
    int _1332 = _1326 & 3;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1336 = _976 + _1332;
    float _1338 = trunc(_1328);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = fma(_1264, _1290, _1330);
    float _1346 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    int _1348 = _1336 >> 2;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1352 = float(_1060);
    float _1354 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    int _1356 = _1348 << 4;
    int _1358 = _1356 + 368;
    float _1360 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1350);
    float _1362 = float(_1274);
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    uint _1368 = uint(int(uint(_1358) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[int(_1378)][_1380];
    float _1384 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1360);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1146 + _1386;
    float _1390 = -_1366;
    float _1392 = fma(_1150, _1390, _1312);
    float _1394 = fma(_1250, _1284, _1344);
    float _1396 = -_1384;
    float _1398 = _1396 + 1.0;
    float _1400 = _1362 * _1352;
    int _1402 = int(_1248) + int(_1342);
    int _1404 = _1358 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = fma(_1156, _1398, _1322);
    int _1424 = ~_605;
    int _1426 = _1424 + 1;
    float _1428 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1430 = !_1160;
    int _1432 = _1430 ? 0 : 1;
    float _1434 = fma(_1300, _1276, _1394);
    int _1436 = ~_1212;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    int _1442 = _1426 * _1402;
    int _1444 = _1442 + _852;
    int _1446 = _1440;
    if (!_1238)
    {
        int _1448 = ~_1212;
        int _1450 = _1448 + 1;
        _1446 = _1450;
    }
    int _1452 = _1446;
    out.m_62.x = _1392;
    out.m_62.y = _1422;
    int _1454 = abs(_1432);
    float _1456 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1434);
    bool _1458 = uint(_1444) >= uint(_605);
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1462 = _990 + _1460;
    float _1464 = in.m_64.x;
    float _1466 = in.m_64.y;
    float _1468 = in.m_64.z;
    int _1470 = abs(_1034);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = _862 + _1472;
    bool _1476 = !_1458;
    int _1478 = _1476 ? 0 : (-1);
    float _1480 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1428);
    bool _1482 = _986 != 3;
    float _1484 = _1400 * (-2.0);
    float _1486 = float(_1452);
    float _1488 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1480);
    bool _1490 = !_988;
    int _1492 = _1490 ? 0 : 1;
    bool _1494 = uint(_986) >= 2u;
    int _1496 = ~_1470;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    int _1502 = _1494 ? 0 : 1;
    float _1504 = float(_1454);
    int _1506 = ~_1502;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = abs(_1492);
    float _1514 = _1504 * _1486;
    int _1516 = _1510;
    if (_1482)
    {
        int _1518 = ~_1502;
        int _1520 = _1518 + 1;
        _1516 = _1520;
    }
    int _1522 = _1516;
    float _1524 = fma(_1484, _1466, _1466);
    bool _1526 = _986 != 3;
    int _1528 = _1500 * as_type<int>(_1382);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    bool _1536 = !_1526;
    int _1538 = _1536 ? 0 : (-1);
    int _1540 = ~_1402;
    int _1542 = _1540 + _1478;
    int _1544 = _1542 + 1;
    int _1546 = _1534 * as_type<int>(_1374);
    int _1548 = _1546 + _1528;
    int _1550 = abs(_1522);
    float _1552 = _1514 * (-2.0);
    int _1554 = abs(_1538);
    int _1556 = _605 * _1544;
    int _1558 = _1556 + _852;
    bool _1560 = !_1042;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = fma(_1192, _1552, _1192);
    float _1566 = fma(_1552, _1464, _1464);
    int _1568 = ~_1550;
    int _1570 = _1568 + 1;
    int _1572 = _1570 + 1;
    int _1574 = abs(_1562);
    int _1576 = _1572 * as_type<int>(_1412);
    int _1578 = _1576 + _1548;
    int _1580 = ~_1554;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    bool _1586 = _1488 >= 0.0;
    int _1588 = _1584 * as_type<int>(_1420);
    int _1590 = _1588 + _1578;
    int _1592 = ~_1574;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    float _1598 = fma(_1204, _1484, _1204);
    float _1600 = _1388 * _1388;
    int _1602 = _1590 * _1596;
    bool _1604 = !_659;
    int _1606 = _1604 ? _1558 : (-1);
    float _1608 = fma(_1462, _1462, _1600);
    float _1610 = _1412;
    float _1612 = _1468;
    if (_1586)
    {
        out.m_51.x = 0.0;
    }
    if (_1586)
    {
        _1610 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1610;
    int _1616 = _1606 * _1574;
    int _1618 = _1616 + _1602;
    float _1620 = fma(_1474, _1474, _1608);
    bool _1622 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1624 = isnan(1.0);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1630 = _1626 || _1628;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1634 = as_type<int>(_1614);
    if (_1586)
    {
        float _1636 = _1614 * 5.0;
        _1634 = as_type<int>(_1636);
    }
    int _1638 = _1634;
    float _1640 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1642 = !_1630;
    float _1644 = _1642 ? _103 : _1324;
    float _1646 = rsqrt(_1620);
    bool _1648 = !_1168;
    int _1650 = _1648 ? 0 : 1;
    if (_1586)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5516 = as_type<float>(_1638);
        out.gl_Position.z = _5516;
    }
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1654 = _698 + (-0.5);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1658 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1566);
    float _1664 = float(_1618);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1670 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1672 = fma(_1644, _1564, _1662);
    out.m_66.x = _1664;
    float _1674 = _700 + (-0.5);
    float _1676 = _1670 * _1646;
    out.m_68.x = _1658;
    out.m_68.y = _1660;
    out.m_68.z = _1666;
    out.m_68.w = _1668;
    float _1678 = _1462 * _1676;
    float _1680 = _1388 * _1676;
    int _1682 = abs(_1650);
    if (_1586)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1684 = -_1680;
    float _1686 = _1146 + _1684;
    float _1688 = _1474 * _1676;
    float _1690 = -_1678;
    float _1692 = _990 + _1690;
    float _1694 = float(_1124);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -_1688;
    float _1702 = _862 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1706 = _1692 + _1704;
    float _1708 = _1672 * 0.15915493667125701904296875;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1714 = _1702 + _1712;
    float _1716 = -_1680;
    float _1718 = _1388 + _1716;
    float _1720 = float(_1682);
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1710);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1524);
    float _1726 = -_1678;
    float _1728 = _1462 + _1726;
    float _1730 = _1718 * _1718;
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1722);
    float _1734 = fma(_1644, _1598, _1724);
    float _1736 = _1020 + _698;
    float _1738 = _1720 * _1694;
    float _1740 = fma(_1728, _1728, _1730);
    bool _1742 = _1732 >= 0.0;
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = _1736 + (-1.0);
    float _1748 = _1738 * (-2.0);
    float _1750 = -_1688;
    float _1752 = _1474 + _1750;
    float _1754 = _1708 * 6.283185482025146484375;
    float _1756 = sin(_1754);
    float _1758 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1760 = fma(_1748, _1468, _1468);
    float _1762 = _1020 + (-0.5);
    float _1764 = _1688;
    if (_1742)
    {
        _1612 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1766 = _1612;
    float _1768 = _1708 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    int _1774 = as_type<int>(_1766);
    if (_1742)
    {
        out.m_51.x = 0.0;
    }
    if (_1742)
    {
        float _1776 = _1766 * 5.0;
        _1774 = as_type<int>(_1776);
    }
    int _1778 = _1774;
    float _1780 = _1744 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = fma(_1752, _1752, _1740);
    float _1786 = fma(_1758, _1748, _1758);
    float _1788 = fma(_1644, _1786, _1772);
    float _1790 = sqrt(_1784);
    if (_1742)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5762 = as_type<float>(_1778);
        out.gl_Position.z = _5762;
    }
    float _1792 = _1788 * 0.15915493667125701904296875;
    float _1794 = _1744 * 6.283185482025146484375;
    float _1796 = cos(_1794);
    if (_1742)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1798 = _1792 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = _1646 * _1790;
    float _1804 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1808 = _1770 * _1796;
    float _1810 = _1770 * _1782;
    float _1812 = _1802 * _1804;
    float _1814 = _1756 * _1782;
    float _1816 = _1792 * 6.283185482025146484375;
    float _1818 = sin(_1816);
    float _1820 = _1640 * _1802;
    float _1822 = _1806 * _1812;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1826 = _1756 * _1796;
    float _1828 = _1824 * _1820;
    float _1830 = _1770 * _1800;
    float _1832 = _1796 * _1800;
    float _1834 = _1756 * _1800;
    float _1836 = _1782 * _1800;
    float _1838 = _1830 * _1822;
    float _1840 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1842 = _1840 * 0.5;
    float _1844 = _1834 * _1822;
    float _1846 = fma(_1818, _1808, _1814);
    float _1848 = -_1826;
    float _1850 = fma(_1818, _1810, _1848);
    float _1852 = -_1822;
    float _1854 = _1818 * _1852;
    float _1856 = -_1810;
    float _1858 = fma(_1818, _1826, _1856);
    float _1860 = fma(_1846, _1828, _1838);
    float _1862 = fma(_1818, _1814, _1808);
    float _1864 = fma(_1832, _1828, _1854);
    float _1866 = fma(_1858, _1828, _1844);
    float _1868 = fma(_1850, _1842, _1860);
    float _1870 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1872 = fma(_1836, _1842, _1864);
    float _1874 = fma(_1862, _1842, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1878 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1880 = _1868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1882 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1876);
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1878);
    float _1888 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1880);
    float _1890 = _1846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1892 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1884);
    float _1894 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1886);
    float _1896 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1888);
    float _1898 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1870);
    float _1900 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1902 = _1894 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1906 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1890);
    float _1908 = _862 + _1900;
    float _1910 = _990 + _1902;
    float _1912 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1908 + _1916;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1922 = _1910 + _1920;
    float _1924 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1926 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1882);
    float _1928 = _1918 * _1918;
    float _1930 = _1146 + _1904;
    float _1932 = -_1818;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    float _1936 = -_1818;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1940 = fma(_1922, _1922, _1928);
    float _1942 = -_1818;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1946 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1948 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1926);
    float _1950 = sqrt(_1940);
    float _1952 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1906);
    float _1954 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1958 = _1950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1960 = _1830;
    float _1962 = _1858;
    float _1964 = _1908;
    if (!_1958)
    {
        _1960 = _1908;
    }
    float _1966 = _1960;
    float _1968 = _1966;
    if (!_1958)
    {
        _1962 = _1910;
    }
    float _1970 = _1962;
    float _1972 = _1970;
    if (!_1958)
    {
        _1964 = _1930;
    }
    float _1974 = _1964;
    bool _1976 = !_1958;
    float _1978 = _1974;
    if (!_1976)
    {
        float _1980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1984 = _1950 + _1982;
        float _1986 = rsqrt(_1940);
        float _1988 = _1984 * _1980;
        float _1990 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1992 = _1988 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = _1992 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = _1996 + (-1.0);
        float _2004 = fma(_2000, _1990, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2006 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2008 = _1986 * _2004;
        float _2010 = fma(_1930, _1996, _2006);
        float _2012 = fma(_1922, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2014 = fma(_1918, _2008, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1978 = _2010;
        _1972 = _2012;
        _1968 = _2014;
    }
    float _2016 = _1978;
    float _2018 = _1972;
    float _2020 = _1968;
    float _2022 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = -_1146;
    float _2026 = _2024 + _2016;
    float _2028 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _2030 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1956);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2036 = -_990;
    float _2038 = _2036 + _2018;
    float _2040 = _2026 * _2026;
    float _2042 = -_862;
    float _2044 = _2042 + _2020;
    float _2046 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1934);
    float _2048 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1938);
    float _2050 = fma(_2038, _2038, _2040);
    float _2052 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _2054 = _2034 * _2046;
    float _2056 = _2034 * _2048;
    float _2058 = fma(_2044, _2044, _2050);
    float _2060 = _2034 * _2052;
    float _2062 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2064 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2028);
    float _2066 = sqrt(_2058);
    float _2068 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2030);
    float _2070 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2072 = fma(_2062, _1946, _2054);
    float _2074 = fma(_2062, _1948, _2056);
    float _2076 = fma(_2062, _1952, _2060);
    float _2078 = _2064 + _2072;
    float _2080 = _2068 + _2074;
    float _2082 = _2070 + _2076;
    out.m_70.x = _2078;
    out.m_70.y = _2080;
    out.m_70.z = _2082;
    bool _2084 = _2066 > 0.0;
    bool _2086 = !_2084;
    float _2088 = _2066;
    float _2090 = _2032;
    float _2092 = _2016;
    float _2094 = _2018;
    float _2096 = _2020;
    if (!_2086)
    {
        bool _2098 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2100 = _2072;
        if (_2098)
        {
            float _2102 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2100 = _2102;
        }
        float _2104 = _2100;
        float _2106 = _2104;
        if (_2098)
        {
            float _2108 = _445 * _2104;
            _2088 = _2108;
        }
        float _2110 = _2088;
        float _2112 = _2110;
        if (_2098)
        {
            float _2114 = _447 * _2104;
            _2090 = _2114;
        }
        float _2116 = _2090;
        float _2118 = _2116;
        if (_2098)
        {
            float _2120 = _449 * _2104;
            _2106 = _2120;
        }
        float _2122 = _2106;
        float _2124 = _2122;
        if (!_2098)
        {
            float _2126 = _103 + 1.0;
            if (!_161)
            {
                float _2128 = _2126 * _2126;
                float _2130 = _2128 * 0.5;
                _455 = _2130;
            }
            float _2132 = _455;
            float _2134 = _2132;
            if (!_161)
            {
                float _2136 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2134 = _2136;
            }
            float _2138 = _2134;
            bool _2140 = !_161;
            float _2142 = _2138;
            if (!_2140)
            {
                float _2144 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2146 = log2(_2144);
                float _2148 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2150 = _2146 * _2126;
                float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2154 = 1.0 + _2152;
                float _2156 = exp2(_2150);
                float _2158 = _2148 * 0.693147182464599609375;
                float _2160 = 1.0 / _2158;
                float _2162 = 1.0 / _2154;
                float _2164 = _2156 + (-1.0);
                float _2166 = -_2164;
                float _2168 = fma(_2166, _2160, _2126);
                float _2170 = _2168 * _2162;
                float _2172 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2142 = _2172;
            }
            float _2174 = _2142;
            float _2176 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2178 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2180 = _2174 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2182 = _2174;
            if (!_161)
            {
                _2182 = _2126;
            }
            float _2184 = _2182;
            float _2186 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2188 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2190 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2192 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2186);
            float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2188);
            float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2192);
            bool _2198 = !_161;
            float _2200 = _2184;
            if (!_2198)
            {
                float _2202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2204 = log2(_2202);
                float _2206 = _2204 * _2126;
                float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2210 = 1.0 + _2208;
                float _2212 = exp2(_2206);
                float _2214 = 1.0 / _2210;
                float _2216 = -_2212;
                float _2218 = _2216 + 1.0;
                float _2220 = _2218 * _2214;
                _2200 = _2220;
            }
            float _2222 = _2200;
            float _2224 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2190);
            float _2226 = fma(_2222, _165, _2196);
            float _2228 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2194);
            float _2230 = fma(_2180, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2224);
            float _2232 = -_405;
            float _2234 = _2232 + _2226;
            float _2236 = fma(_2222, _163, _2228);
            float _2238 = fma(_2222, _167, _2230);
            float _2240 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2242 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2244 = -_411;
            float _2246 = _2244 + _2236;
            float _2248 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2250 = -_417;
            float _2252 = _2250 + _2238;
            float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2240);
            float _2256 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2242);
            float _2258 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2248);
            float _2260 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2254);
            float _2262 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2256);
            float _2264 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2258);
            _457 = _2262;
            _459 = _2260;
            _461 = _2264;
            _2112 = _2260;
            _2118 = _2262;
            _2124 = _2264;
        }
        float _2266 = _457;
        float _2268 = _459;
        float _2270 = _461;
        float _2272 = _2112;
        float _2274 = _2118;
        float _2276 = _2124;
        float _2278 = _2266 * _2266;
        float _2280 = rsqrt(_2058);
        float _2282 = fma(_2268, _2268, _2278);
        float _2284 = fma(_2270, _2270, _2282);
        float _2286 = sqrt(_2284);
        float _2288 = _2038 * _2280;
        float _2290 = _2026 * _2280;
        float _2292 = _2044 * _2280;
        bool _2294 = _2286 > 0.0;
        bool _2296 = !_2294;
        _463 = _2290;
        _465 = _2268;
        if (!_2296)
        {
            float _2298 = rsqrt(_2284);
            float _2300 = _2298 * _2266;
            float _2302 = _2298 * _2268;
            float _2304 = _2298 * _2270;
            float _2306 = _2290 * _2300;
            float _2308 = fma(_2288, _2302, _2306);
            float _2310 = fma(_2292, _2304, _2308);
            float _2312 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2314 = fma(_2272, _2312, _2018);
            float _2316 = fma(_2274, _2312, _2016);
            float _2318 = fma(_2276, _2312, _2020);
            _2092 = _2316;
            _2094 = _2314;
            _2096 = _2318;
        }
    }
    float _2320 = _2092;
    float _2322 = _2094;
    float _2324 = _2096;
    float _2326 = _463;
    float _2328 = _465;
    bool _2330 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2332 = isnan(0.5);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2338 = _2334 || _2336;
    float _2340 = -_1680;
    float _2342 = _2340 + _2320;
    float _2344 = -_1678;
    float _2346 = _2344 + _2322;
    float _2348 = -_1688;
    float _2350 = _2348 + _2324;
    float _2352 = _2346;
    float _2354 = _2350;
    float _2356 = _2326;
    if (_2338)
    {
        _1764 = _2342;
    }
    float _2358 = _1764;
    float _2360 = _2358;
    if (!_2338)
    {
        float _2362 = _1698 * _1698;
        float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2366 = -_990;
        float _2368 = _2366 + _2322;
        float _2370 = -_1146;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_1706, _1706, _2362);
        float _2376 = -_862;
        float _2378 = _2376 + _2324;
        float _2380 = fma(_1714, _1714, _2374);
        float _2382 = 1.0 / _1802;
        float _2384 = sqrt(_2380);
        float _2386 = precise::min(_2384, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2388 = _2386 * _2364;
        float _2390 = _2388 * _2382;
        float _2392 = fma(_2368, _2390, _1692);
        float _2394 = fma(_2372, _2390, _1686);
        float _2396 = fma(_2378, _2390, _1702);
        _2360 = _2394;
        _2352 = _2392;
        _2354 = _2396;
    }
    float _2398 = _2360;
    float _2400 = _2352;
    float _2402 = _2354;
    float _2404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2406 = _2398 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2410 = _2400 + _2408;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2414 = _2402 + _2412;
    float _2416 = _2406 * _2406;
    float _2418 = fma(_2410, _2410, _2416);
    float _2420 = fma(_2414, _2414, _2418);
    float _2422 = rsqrt(_2420);
    float _2424 = sqrt(_2420);
    float _2426 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2428 = _2410 * _2426;
    float _2430 = _2414 * _2426;
    float _2432 = _2428 * _2428;
    float _2434 = _2430 * _2430;
    float _2436 = _2432 + _2434;
    float _2438 = sqrt(_2436);
    bool _2440 = _2438 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2444 = _2438 + _2442;
    float _2446 = _2422;
    float _2448 = _2444;
    float _2450 = _2406;
    float _2452 = _2426;
    if (_2440)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2446 = _2454;
    }
    float _2456 = _2446;
    float _2458 = _2456;
    if (_2440)
    {
        float _2460 = _2444 * _2456;
        _2448 = _2460;
    }
    float _2462 = _2448;
    if (_2440)
    {
        float _2464 = rsqrt(_2436);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = _2466;
    if (_2440)
    {
        float _2470 = _2462 * 0.15915493667125701904296875;
        _2356 = _2470;
    }
    float _2472 = _2356;
    float _2474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2476 = _2414;
    float _2478 = _2472;
    if (_2440)
    {
        float _2480 = _2472 * 6.283185482025146484375;
        float _2482 = sin(_2480);
        _2476 = _2482;
    }
    float _2484 = _2476;
    float _2486 = precise::max(0.0, _2474);
    float _2488 = _2328;
    float _2490 = _2486;
    if (_2440)
    {
        float _2492 = _2472 * 6.283185482025146484375;
        float _2494 = cos(_2492);
        _2488 = _2494;
    }
    float _2496 = _2488;
    float _2498 = -_2426;
    float _2500 = -_2486;
    float _2502 = fma(_2406, _2498, _2500);
    if (_2440)
    {
        float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2504;
    }
    float _2506 = _2450;
    float _2508 = _2484;
    float _2510 = _2506;
    if (_2440)
    {
        float _2512 = fma(_2484, _2506, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2508 = _2512;
    }
    float _2514 = _2508;
    float _2516 = _2514;
    if (!_2440)
    {
        _2510 = _2502;
    }
    float _2518 = _2510;
    float _2520 = _2518;
    if (_2440)
    {
        float _2522 = _2466 * _2514;
        _2452 = _2522;
    }
    float _2524 = _2452;
    if (!_2440)
    {
        _2468 = _2428;
    }
    float _2526 = _2468;
    float _2528 = _2526;
    float _2530 = _2496;
    if (_2440)
    {
        float _2532 = _2496 + (-1.0);
        _2490 = _2532;
    }
    float _2534 = _2490;
    float _2536 = _2534;
    if (_2440)
    {
        float _2538 = _2428 * _2524;
        _2528 = _2538;
    }
    float _2540 = _2528;
    if (!_2440)
    {
        _2516 = _2432;
    }
    float _2542 = _2516;
    float _2544 = _2542;
    if (_2440)
    {
        float _2546 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2478 = _2546;
    }
    float _2548 = _2478;
    if (!_2440)
    {
        _2536 = _2430;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (_2440)
    {
        float _2554 = _2430 * _2524;
        _2552 = _2554;
    }
    float _2556 = _2552;
    if (_2440)
    {
        float _2558 = _2540 * _2540;
        _2544 = _2558;
    }
    float _2560 = _2544;
    if (_2440)
    {
        float _2562 = fma(_2502, _2496, _2548);
        _2520 = _2562;
    }
    float _2564 = _2520;
    if (!_2440)
    {
        _2530 = _2434;
    }
    float _2566 = _2530;
    float _2568 = _2566;
    if (_2440)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2564, _2564, _2560);
    float _2576 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2578 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2580 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = _2574 + _2572;
    float _2584 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2576);
    float _2586 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = rsqrt(_2582);
    float _2596 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2584);
    float _2598 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2586);
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2610 = fma(_2400, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2612 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2600);
    float _2614 = abs(_2604);
    float _2616 = log2(_2614);
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2620 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2608);
    float _2622 = _2612 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2624 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2610);
    float _2626 = -_2618;
    float _2628 = fma(_2626, _2578, 1.0);
    float _2630 = _2594 * _2540;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2634 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2594 * _2564;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2640 = _2594 * _2556;
    float _2642 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2646 = -_2638;
    float _2648 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2646);
    float _2650 = log2(_2628);
    float _2652 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2654 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2656 = -_2640;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2648);
    float _2660 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2662 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2652);
    float _2664 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2658, -0.5, 0.5);
    float _2668 = exp2(_2654);
    float _2670 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2660);
    float _2672 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2658, 0.5, 0.5);
    float _2676 = _2636 + 1.0;
    float _2678 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2670);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = 1.0 / _2662;
    float _2684 = fma(_2674, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2686 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2678);
    float _2688 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2690 = _2650 * 0.693147182464599609375;
    float _2692 = fma(_2674, _2684, -0.212114393711090087890625);
    float _2694 = sqrt(_2666);
    float _2696 = -_2636;
    float _2698 = fma(_2668, _2676, _2696);
    float _2700 = fma(_2674, _2692, 1.570728778839111328125);
    float _2702 = fma(_2698, 0.5, 0.5);
    float _2704 = _2686 * _2682;
    float _2706 = _2688 * _2682;
    float _2708 = _2690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2710 = fma(_2704, 0.5, 0.5);
    float _2712 = fma(_2706, -0.5, 0.5);
    float _2714 = _2694 * 0.636619746685028076171875;
    float3 _7289 = float3(_2710, _2712, _2708);
    float _2716 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7289, float3(0.0), isnan(_7289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7289, float3(0.0), isnan(_7289)), level(0.0)).x;
    float3 _7300 = float3(_2710, _2712, _2708);
    float4 _2719 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7300, float3(0.0), isnan(_7300)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7300, float3(0.0), isnan(_7300)), level(0.0)).xyzw;
    float _2721 = _2719.x;
    float _2723 = _2719.y;
    float _2725 = _2719.z;
    float _2727 = _2719.w;
    float _2729 = -_2700;
    float _2731 = fma(_2714, _2729, 1.0);
    float2 _7322 = float2(_2731, _2702);
    float3 _2735 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7322, float2(0.0), isnan(_7322)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7322, float2(0.0), isnan(_7322)), level(0.0)).xyz;
    float _2737 = _2735.x;
    float _2739 = _2735.y;
    float _2741 = _2735.z;
    float _2743 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2745 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2747 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2749 = isnan(0.5);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2755 = _2751 || _2753;
    float _2757 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2759 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2743);
    float _2761 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2745);
    float _2763 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2757);
    float _2765 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2759);
    float _2767 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2761);
    float _2769 = _2662 * 0.5;
    float _2771 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2775 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2777 = fma(_2688, -0.5, _2769);
    float _2779 = _2765;
    float _2781 = _2632;
    float _2783 = _2688;
    float _2785 = _2686;
    if (!_2755)
    {
        _2779 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2787 = _2779;
    float _2789 = 1.0 / _2773;
    float _2791 = _2775 + _2773;
    float _2793 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2771);
    float _2795 = _2793 + _2662;
    out.gl_Position.x = _2686;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2793;
    out.gl_Position.w = _2662;
    float _2797 = _2795 * 0.5;
    float _2799 = _2791 * _2789;
    float _2801 = _2799 * 0.5;
    float _2803 = _2791;
    float _2805 = _2801;
    float _2807 = _2793;
    if (!_2755)
    {
        _2803 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2809 = _2803;
    float _2811 = _2809;
    if (!_2755)
    {
        float _2813 = -_2787;
        float _2815 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2813);
        _2805 = _2815;
    }
    float _2817 = _2805;
    float _2819 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2755)
    {
        float _2821 = -_2809;
        float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2781 = _2823;
    }
    float _2825 = _2781;
    float _2827 = _2686 + _2662;
    float _2829 = _2817;
    if (!_2755)
    {
        float _2831 = 1.0 / _2817;
        _2829 = _2831;
    }
    float _2833 = _2829;
    float _2835 = _2827 * 0.5;
    out.m_72.x = _2835;
    out.m_72.y = _2777;
    out.m_72.z = _2797;
    out.m_72.w = _2662;
    float _2837 = exp2(_2819);
    float _2839 = _2825;
    if (!_2755)
    {
        float _2841 = 1.0 / _2825;
        _2839 = _2841;
    }
    float _2843 = _2839;
    float _2845 = _2833;
    if (!_2755)
    {
        float _2847 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2849 = -_2809;
        float _2851 = fma(_2833, _2847, _2849);
        _2811 = _2851;
    }
    float _2853 = _2811;
    if (_2755)
    {
        _2845 = 1.0;
    }
    float _2855 = _2845;
    float _2857 = -_2837;
    float _2859 = _2857 + 1.0;
    float _2861 = _2859 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2855;
    if (!_2755)
    {
        float _2865 = _2853 * _2843;
        float _2867 = precise::clamp(_2865, 0.0, 1.0);
        _2863 = _2867;
    }
    float _2869 = _2863;
    bool _2871 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2873 = isnan(_2424);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2879 = _2875 || _2877;
    if (!_2879)
    {
        _2807 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2881 = _2807;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2879)
    {
        _2783 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2783;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2879)
    {
        _2785 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2785;
    float _2895 = _2861 * _2716;
    float _2897 = -_2861;
    float _2899 = _2897 + 1.0;
    float _2901 = _2727 * _2895;
    float _2903 = _2741 * _2895;
    float _2905 = fma(_2737, _2901, _2721);
    float _2907 = fma(_2739, _2901, _2723);
    float _2909 = _2727 * _2899;
    float _2911 = fma(_2727, _2903, _2725);
    float _2913 = _2869 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_74.x = _2905;
    out.m_74.y = _2907;
    out.m_74.z = _2911;
    out.m_74.w = _2909;
    bool _2915 = !_2879;
    float _2917 = _2893;
    float _2919 = _2893;
    if (!_2915)
    {
        bool _2921 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2923 = isnan(_2424);
        bool _2925 = _2921 || _2923;
        bool _2927 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2929 = _2925 || _2927;
        if (!_2929)
        {
            float _2931 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2933 = _2424 + _2931;
            float _2935 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2937 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2935;
            float _2939 = 1.0 / _2937;
            float _2941 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2947 = _2945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2949 = _2933 * _2939;
            float _2951 = precise::clamp(_2949, 0.0, 1.0);
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2955 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2957 = fma(_2951, _2947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2959 = fma(_2951, _2955, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2961 = fma(_2951, _2943, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2891 = _2961;
            _2885 = _2959;
            _2919 = _2957;
            _2963 = true;
        }
        else
        {
            bool _2965 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2967 = isnan(_2424);
            bool _2969 = _2965 || _2967;
            bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2973 = _2969 || _2971;
            if (!_2973)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2975 = _2883;
            _2885 = _2975;
            if (!_2973)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2977 = _2889;
            _2891 = _2977;
            if (!_2973)
            {
                _2917 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2979 = _2917;
            bool _2981 = !_2973;
            _2919 = _2979;
            if (!_2981)
            {
                bool _2983 = _2424 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2985 = isnan(_2424);
                bool _2987 = _2983 || _2985;
                bool _2989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2991 = _2987 || _2989;
                if (!_2991)
                {
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2995 = _2424 + _2993;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2999 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2997;
                    float _3001 = 1.0 / _2999;
                    float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3011 = _2995 * _3001;
                    float _3013 = precise::clamp(_3011, 0.0, 1.0);
                    float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3017 = _3015 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3019 = fma(_3013, _3009, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3021 = fma(_3013, _3017, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3023 = fma(_3013, _3005, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2891 = _3023;
                    _2885 = _3021;
                    _2919 = _3019;
                    _2963 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2919 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2963 = false;
    float _3025 = _2891;
    float _3027 = _2885;
    float _3029 = _2919;
    float _3031 = _2913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.x = 0.0;
    float _3033 = _3025 * 0.586610972881317138671875;
    bool _3035 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3031;
    float _3037 = fma(_3027, 0.298911988735198974609375, _3033);
    bool _3039 = _2869 > 0.0;
    bool _3041 = isnan(_2869);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan(0.0);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3029, 0.114477999508380889892578125, _3037);
    float _3051 = -_3049;
    float _3053 = _3051 + _3027;
    float _3055 = -_3049;
    float _3057 = _3055 + _3025;
    float _3059 = -_3049;
    float _3061 = _3059 + _3029;
    float _3063 = fma(_3053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3065 = fma(_3057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    float _3067 = fma(_3061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3049);
    bool _3069 = !_3035;
    if (!_3069)
    {
        float _3071 = -_2398;
        float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3075 = -_2400;
        float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3079 = -_2402;
        float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3083 = _3073 * _3073;
        float _3085 = fma(_3077, _3077, _3083);
        float _3087 = fma(_3081, _3081, _3085);
        float _3089 = sqrt(_3087);
        float _3091 = rsqrt(_3087);
        float _3093 = -_3089;
        float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3097 = _3095 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3077 * _3091;
        float _3103 = _3073 * _3091;
        float _3105 = abs(_3099);
        float _3107 = log2(_3105);
        float _3109 = _3081 * _3091;
        float _3111 = _3101 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3113 = _2080 * _3103;
        float _3115 = -_3103;
        float _3117 = -_3111;
        float _3119 = fma(_3115, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3117);
        float _3121 = fma(_2078, _3101, _3113);
        float _3123 = -_3109;
        float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3119);
        float _3127 = fma(_2082, _3109, _3121);
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3133 = _3125 + _3131;
        float _3135 = _3107 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3137 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3139 = precise::clamp(_3137, 0.0, 1.0);
        float _3141 = exp2(_3135);
        float _3143 = _3141 * _3139;
        float _3145 = _3129 * _3143;
        float _3147 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3149 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3151 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3147;
        out.m_76.y = _3149;
        out.m_76.z = _3151;
    }
    out.m_78.x = _3063;
    out.m_78.y = _3065;
    out.m_78.z = _3067;
    if (_3047)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3153 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3153;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

