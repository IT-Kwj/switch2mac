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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
    float4 m_68 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _780 = false;
    bool _609 = false;
    bool _423 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = in.m_44.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4123 = as_type<float>(_127);
        out.gl_Position.z = _4123;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_102);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_107);
    bool _143 = _111 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _129 = as_type<int>(_153);
    }
    int _155 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_155);
        out.gl_Position.z = _4178;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _141;
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_157) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_157) & 2;
    bool _191 = _189 != 0;
    float _193 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * _193;
        float _199 = _197 * 0.5;
        _149 = _199;
    }
    float _201 = _149;
    bool _203 = !_187;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_171)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_171;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _193 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _193);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_171;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _193 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _195 = _273;
    }
    float _275 = _195;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = _111 * _159;
    float _287 = fma(_275, _173, _279);
    float _289 = fma(_275, _175, _281);
    float _291 = fma(_275, _177, _283);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_277;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        _317 = _285;
    }
    _319 = false;
    float _321 = _317;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    bool _331 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_321);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _343;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = 1.0 / _345;
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _371 = _357 * _361;
    float _373 = -_357;
    float _375 = _373 + 1.0;
    float _377 = _325 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = _383 * _371;
    float _389 = _385 * _371;
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _395 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].x, _391);
    float _397 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].y, _393);
    float _399 = _395 * _327;
    float _401 = _397 * _329;
    bool _403 = !_369;
    float _421;
    if (!_403)
    {
        float _405 = in.m_56.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _285;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = isnan(_425);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _451 = 1.0 / _433;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _461 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_425);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _429;
    float _477 = 1.0 / _449;
    float _479 = _455 * _451;
    bool _481 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_425);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = _459 * _475;
    float _495 = -_445;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _425 + _499;
    float _503 = _491 * _497;
    float _505 = -_491;
    float _507 = _505 + 1.0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = fma(_479, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = _425 + _515;
    float _519 = _471 * _507;
    float _521 = _511 * _477;
    bool _523 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = isnan(_425);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_471;
    float _537 = _535 + 1.0;
    float _539 = _513 * _519;
    float _541 = in.m_56.x;
    float _543 = fma(_493, _517, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = -_533;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _551 = _425 + _549;
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _555 = _445 * _547;
    float _557 = fma(_521, _551, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _559 = fma(_543, _503, _553);
    float _561 = fma(_557, _555, _559);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[118].x, _561);
    float _569 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * _541;
    out.m_58.x = _573;
    out.m_58.y = _579;
    out.m_58.z = _575;
    out.m_58.w = _577;
    float _583 = trunc(_581);
    int _585 = int(_583);
    int _587 = _585 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_473;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _541 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _285;
    }
    _609 = false;
    float _611 = _607;
    uint _614 = uint(int(uint(_589) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    int _622 = int(_614) + 1;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    int _626 = _622 & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _632 = _611 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _638 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_611);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _654 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_611);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    int _666 = _589 + 8;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[int(_670)][_672];
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = 1.0 / _636;
    float _682 = -_648;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _688 = _664 * _684;
    float _690 = -_664;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _652;
    float _696 = _678 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = fma(_696, _632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _704 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _706 = isnan(_611);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _700 * _694;
    float _718 = _702 * _688;
    float _720 = -_714;
    float _722 = _720 + 1.0;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _726 = _611 + _724;
    float _728 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[131].x, _718);
    float _730 = _648 * _722;
    float _732 = fma(_716, _726, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_732, _730, _728);
    float _736 = _620 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _628 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[133].x, _734);
    float _742 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _748 = _674 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _742;
    out.m_60.y = _744;
    out.m_60.z = _750;
    out.m_60.w = _746;
    bool _752 = !_686;
    float _754 = _674;
    int _756 = as_type<int>(_742);
    float _758 = _750;
    float _760 = _744;
    float _762 = _746;
    float _778;
    if (!_752)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _766 = _541 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _285;
    }
    _780 = false;
    float _782 = _778;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_56.z;
    float _790 = in.m_56.w;
    float _792 = 0.0;
    if (_786)
    {
        float _794 = in.m_56.y;
        _792 = _794;
    }
    float _796 = _792;
    if (_786)
    {
        _754 = 1.0;
    }
    float _798 = _754;
    float _800 = 0.0;
    float _802 = _798;
    if (_786)
    {
        _800 = 1.0;
    }
    float _804 = _800;
    int _806 = 0;
    float _808 = _804;
    if (_786)
    {
        _806 = 0;
    }
    int _810 = _806;
    int _812 = _810;
    if (_786)
    {
        _756 = 0;
    }
    int _814 = _756;
    int _816 = _814;
    if (_786)
    {
        _758 = _541;
    }
    float _818 = _758;
    float _820 = 0.0;
    float _822 = _818;
    if (_786)
    {
        _820 = _541;
    }
    float _824 = _820;
    bool _826 = _788 > 0.5;
    float _828 = _824;
    if (_786)
    {
        _760 = _541;
    }
    float _830 = _760;
    int _832 = int(_786);
    int _834 = _191 ? 2 : 0;
    int _836 = _832 | _834;
    int _838 = _826 ? 4 : 0;
    int _840 = _836 | _838;
    int _842 = false ? 8 : 0;
    int _844 = _840 | _842;
    int _846 = false ? 16 : 0;
    int _848 = _844 | _846;
    int _850 = false ? 32 : 0;
    int _852 = _848 | _850;
    int _854 = false ? 64 : 0;
    int _856 = _852 | _854;
    int _858 = _856 & 4;
    float _860 = _796;
    float _862 = _830;
    if (_786)
    {
        _762 = _796;
    }
    float _864 = _762;
    float _866 = _864;
    if (!_786)
    {
        float _868 = in.m_56.y;
        float _870 = _541 * 3.1415927410125732421875;
        float _872 = in.m_56.z;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _868 * 3.1415927410125732421875;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = sin(_884);
        _860 = _868;
        _802 = 7.345489978790283203125;
        _808 = 5.839270114898681640625;
        _828 = _872;
        _812 = 1;
        _822 = _868;
        _862 = _878;
        _816 = 2;
        _866 = _886;
    }
    float _888 = _860;
    float _890 = _802;
    float _892 = _808;
    float _894 = _828;
    int _896 = _812;
    float _898 = _822;
    float _900 = _862;
    int _902 = _816;
    float _904 = _866;
    float _906 = in.m_62.x;
    float _908 = in.m_62.y;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    bool _914 = _888 > 0.5;
    float _916 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _918 = _790 > 0.5;
    float _920 = in.m_64.x;
    float _922 = in.m_64.y;
    float _924 = in.m_64.z;
    float _926 = in.m_64.w;
    float _928 = -_209;
    int _930 = _826 ? as_type<int>(_928) : as_type<int>(_209);
    float _932 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _936 = _934 != 0;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _944 = _942 != 0;
    float _946 = in.m_66.x;
    float _948 = in.m_66.y;
    float _950 = in.m_66.z;
    float _952 = in.m_66.w;
    float _954 = -_205;
    int _956 = _914 ? as_type<int>(_954) : as_type<int>(_205);
    bool _958 = !_944;
    float _960 = _958 ? _209 : as_type<float>(_930);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    bool _964 = !_940;
    float _966 = _964 ? _205 : as_type<float>(_956);
    float _968 = -_209;
    int _970 = _918 ? as_type<int>(_968) : as_type<int>(_209);
    float _972 = _916 * _962;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _986 = _984 != 0;
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _990 = int(_918);
    int _992 = _914 ? 2 : 0;
    int _994 = _990 | _992;
    int _996 = _826 ? 4 : 0;
    int _998 = _994 | _996;
    int _1000 = _936 ? 8 : 0;
    int _1002 = _998 | _1000;
    int _1004 = _978 ? 16 : 0;
    int _1006 = _1002 | _1004;
    int _1008 = _982 ? 32 : 0;
    int _1010 = _1006 | _1008;
    int _1012 = _986 ? 64 : 0;
    int _1014 = _1010 | _1012;
    int _1016 = _1014 & 2;
    float _1018 = _295 * _908;
    float _1020 = _932 * _974;
    float _1022 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1024 = !_936;
    float _1026 = _1024 ? _209 : as_type<float>(_970);
    float _1028 = _295 * _922;
    float _1030 = fma(_293, _906, _1018);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1046 = _1044 != 0;
    float _1048 = _295 * _948;
    float _1050 = fma(_293, _920, _1028);
    float _1052 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1054 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _988);
    float _1056 = fma(_297, _910, _1030);
    float _1058 = fma(_297, _924, _1050);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1052);
    float _1062 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1054);
    float _1064 = fma(_293, _946, _1048);
    float _1066 = _1058 + _926;
    float _1068 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1060);
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = _1056 + _912;
    float _1074 = fma(_297, _950, _1064);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1066 + _1070;
    float _1080 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1082 = _1074 + _952;
    float _1084 = _1072 + _1076;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1088 = _1078 + _1086;
    bool _1090 = !_982;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1084 + _1096;
    float _1100 = _1088 * _1088;
    bool _1102 = !_978;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1094);
    bool _1108 = !_986;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = fma(_1098, _1098, _1100);
    float _1114 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1116 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1106);
    float _1118 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1080);
    float _1120 = sqrt(_1112);
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1126 = !_1038;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1142 = _1140 != 0;
    float _1144 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    bool _1146 = !_1034;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = 1.0 / _1124;
    bool _1152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1154 = isnan(0.5);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1160 = _1156 || _1158;
    float _1162 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1166 = !_1138;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1162 + _1124;
    float _1172 = _1082 + _1164;
    bool _1174 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1176 = !_1042;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1046;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1052;
    float _1186 = _1124;
    float _1188 = _1170;
    float _1190 = _1098;
    float _1192 = _1080;
    float _1194 = _1088;
    float _1196 = _898;
    if (_1160)
    {
        _1184 = 1.0;
    }
    float _1198 = _1184;
    float _1200 = _1170 * _1150;
    float _1202 = _1200 * 0.5;
    bool _1204 = !_1134;
    int _1206 = _1204 ? 0 : 1;
    bool _1208 = !_1142;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1150;
    float _1214 = _1198;
    if (!_1174)
    {
        _1186 = _1084;
    }
    float _1216 = _1186;
    float _1218 = _1216;
    if (!_1174)
    {
        _1188 = _1078;
    }
    float _1220 = _1188;
    float _1222 = _1220;
    if (!_1174)
    {
        _1212 = _1172;
    }
    float _1224 = _1212;
    bool _1226 = !_1174;
    float _1228 = _1224;
    if (!_1226)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1234 = _1120 + _1232;
        float _1236 = rsqrt(_1112);
        float _1238 = _1234 * _1230;
        float _1240 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = _1238 * 0.15915493667125701904296875;
        float _1244 = _1242 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        float _1248 = _1242 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = fma(_1246, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1254 = _1236 * _1252;
        float _1256 = _1250 + (-1.0);
        float _1258 = fma(_1098, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1260 = fma(_1088, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1262 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = fma(_1172, _1250, _1262);
        _1228 = _1264;
        _1218 = _1258;
        _1222 = _1260;
    }
    float _1266 = _1228;
    float _1268 = _1218;
    float _1270 = _1222;
    if (!_1160)
    {
        float _1272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1280 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1278);
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1276 * 0.15915493667125701904296875;
        float _1288 = _1274 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = 1.0 / _1284;
        float _1294 = _1286 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1290 * _1292;
        float _1300 = _1286 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = 1.0 / _1280;
        float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1310 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1308;
        float _1312 = 1.0 / _1304;
        float _1314 = 1.0 / _1310;
        float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1318 = _1306 * _1316;
        float _1320 = _1302 * _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1324 = fma(_1320, _1318, _1322);
        float _1326 = _1324 * _1314;
        float _1328 = precise::clamp(_1326, 0.0, 1.0);
        _1190 = _1314;
        _1214 = _1328;
    }
    float _1330 = _1190;
    float _1332 = _1214;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1266 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1340 = _1268 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1270 + _1342;
    bool _1346 = _858 != 0;
    float _1348 = _1336 * _1336;
    bool _1350 = _1016 != 0;
    float _1352 = fma(_1340, _1340, _1348);
    float _1354 = fma(_1344, _1344, _1352);
    float _1356 = rsqrt(_1354);
    float _1358 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1360 = _1340 * _1358;
    float _1362 = _1344 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 + _1366;
    float _1370 = sqrt(_1368);
    bool _1372 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = _1370 + _1374;
    float _1378 = _1356;
    float _1380 = _1368;
    float _1382 = _1376;
    float _1384 = _1330;
    float _1386 = _1336;
    if (_1372)
    {
        float _1388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    if (_1372)
    {
        float _1392 = rsqrt(_1368);
        _1380 = _1392;
    }
    float _1394 = _1380;
    float _1396 = _1394;
    if (_1372)
    {
        float _1398 = _1376 * _1390;
        _1382 = _1398;
    }
    float _1400 = _1382;
    if (_1372)
    {
        float _1402 = _1400 * 0.15915493667125701904296875;
        _1384 = _1402;
    }
    float _1404 = _1384;
    float _1406 = _1344;
    if (_1372)
    {
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        _1406 = _1410;
    }
    float _1412 = _1406;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1390;
    float _1420 = _1416;
    if (_1372)
    {
        float _1422 = _1404 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        _1418 = _1424;
    }
    float _1426 = _1418;
    float _1428 = -_1358;
    float _1430 = -_1416;
    float _1432 = fma(_1336, _1428, _1430);
    if (_1372)
    {
        float _1434 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1434;
    }
    float _1436 = _1386;
    float _1438 = sqrt(_1354);
    float _1440 = _1436;
    float _1442 = _1412;
    if (_1372)
    {
        float _1444 = fma(_1412, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (!_1372)
    {
        _1442 = _1360;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    float _1454 = _1426;
    if (_1372)
    {
        float _1456 = _1426 + (-1.0);
        _1420 = _1456;
    }
    float _1458 = _1420;
    float _1460 = _1458;
    if (_1372)
    {
        float _1462 = _1394 * _1446;
        _1192 = _1462;
    }
    float _1464 = _1192;
    if (!_1372)
    {
        _1448 = _1432;
    }
    float _1466 = _1448;
    float _1468 = _1466;
    if (_1372)
    {
        float _1470 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1470;
    }
    float _1472 = _1194;
    if (_1372)
    {
        float _1474 = _1360 * _1464;
        _1452 = _1474;
    }
    float _1476 = _1452;
    if (!_1372)
    {
        _1460 = _1362;
    }
    float _1478 = _1460;
    float _1480 = _1478;
    if (_1372)
    {
        float _1482 = _1362 * _1464;
        _1480 = _1482;
    }
    float _1484 = _1480;
    if (!_1372)
    {
        _1396 = _1364;
    }
    float _1486 = _1396;
    float _1488 = _1486;
    if (_1372)
    {
        float _1490 = fma(_1432, _1426, _1472);
        _1468 = _1490;
    }
    float _1492 = _1468;
    if (_1372)
    {
        float _1494 = _1476 * _1476;
        _1488 = _1494;
    }
    float _1496 = _1488;
    if (!_1372)
    {
        _1454 = _1366;
    }
    float _1498 = _1454;
    float _1500 = _1498;
    if (_1372)
    {
        float _1502 = _1484 * _1484;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1492, _1492, _1496);
    float _1508 = _1506 + _1504;
    float _1510 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1514 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1512);
    float _1516 = precise::clamp(_1514, 0.0, 1.0);
    float _1518 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1522 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1510);
    float _1524 = rsqrt(_1508);
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1522);
    float _1534 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1536 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1538 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1544 = abs(_1528);
    float _1546 = log2(_1544);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1536);
    float _1550 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1548);
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1560 = _1524 * _1476;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1524 * _1492;
    float _1566 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1572 = _1524 * _1484;
    float _1574 = -_1554;
    float _1576 = fma(_1574, _1520, 1.0);
    float _1578 = -_1568;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1584 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1586 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1588 = -_1572;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = log2(_1576);
    float _1596 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1590, -0.5, 0.5);
    float _1600 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1586);
    float _1602 = fma(_1590, 0.5, 0.5);
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = _1564 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = exp2(_1584);
    float _1612 = fma(_1602, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1614 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1616 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1618 = fma(_1602, _1612, -0.212114393711090087890625);
    float _1620 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1614);
    float _1622 = 1.0 / _1592;
    float _1624 = _1594 * 0.693147182464599609375;
    float _1626 = fma(_1602, _1618, 1.570728778839111328125);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1630 = sqrt(_1598);
    float _1632 = -_1564;
    float _1634 = fma(_1610, _1606, _1632);
    float _1636 = fma(_1634, 0.5, 0.5);
    float _1638 = _1620 * _1622;
    float _1640 = _1616 * _1622;
    float _1642 = fma(_1638, -0.5, 0.5);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1630 * 0.636619746685028076171875;
    float _1648 = -_1626;
    float _1650 = fma(_1646, _1648, 1.0);
    float3 _6474 = float3(_1644, _1642, _1628);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6474, float3(0.0), isnan(_6474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6474, float3(0.0), isnan(_6474)), level(0.0)).x;
    float3 _6485 = float3(_1644, _1642, _1628);
    float4 _1655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6485, float3(0.0), isnan(_6485)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6485, float3(0.0), isnan(_6485)), level(0.0)).xyzw;
    float _1657 = _1655.x;
    float _1659 = _1655.y;
    float _1661 = _1655.z;
    float _1663 = _1655.w;
    float2 _6502 = float2(_1650, _1636);
    float3 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).xyz;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1677 = int(_1675);
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1681 = _1679 != 0;
    float _1683 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1687 = _1685 != 0;
    float _1689 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1693 = _1691 != 0;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1697 = abs(_1206);
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1701 = int(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1705 = _1703 != 0;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1711 = int(_1709);
    float _1713 = float(_1677);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1727 = 1.0 / _1713;
    float _1729 = float(uint(_1701));
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1735 = ~_1701;
    int _1737 = _1735 + 1;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1743 = 1.0 / _1729;
    float _1745 = float(_1711);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1749 = _111 * _1727;
    float _1751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1753 = int(_1751);
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1148);
    int _1761 = abs(_1182);
    int _1763 = as_type<int>(_1743) + (-2);
    float _1765 = trunc(_1749);
    int _1767 = int(_1765);
    float _1769 = 1.0 / _1745;
    float _1771 = float(uint(_1753));
    int _1773 = ~_1753;
    int _1775 = _1773 + 1;
    int _1777 = ~_1753;
    int _1779 = _1777 + 1;
    float _1781 = float(uint(_1767));
    float _1783 = 1.0 / _1771;
    float _1785 = as_type<float>(_1763) * _1781;
    float _1787 = _111 * _1769;
    float _1789 = trunc(_1785);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = trunc(_1787);
    int _1797 = int(_1795);
    int _1799 = as_type<int>(_1783) + (-2);
    int _1801 = _1757 * int(_1793);
    int _1803 = _1801 + _1767;
    float _1805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1807 = int(_1805);
    float _1809 = float(uint(_1803));
    float _1811 = float(uint(_1797));
    float _1813 = as_type<float>(_1763) * _1809;
    float _1815 = float(_1767);
    float _1817 = 1.0 / _1717;
    float _1819 = float(_1797);
    float _1821 = as_type<float>(_1799) * _1811;
    float _1823 = float(_1807);
    float _1825 = trunc(_1821);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = trunc(_1813);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(_1701);
    bool _1839 = _1815 >= _1837;
    bool _1841 = isnan(_1815);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1837);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1775 * int(_1829);
    int _1853 = _1851 + _1797;
    float _1855 = _890 * _541;
    float _1857 = 1.0 / _1823;
    float _1859 = float(uint(_1853));
    int _1861 = int(_1793) + int(_1835);
    float _1863 = _892 * _894;
    float _1865 = as_type<float>(_1799) * _1859;
    float _1867 = floor(_1855);
    int _1869 = _1737 * _1861;
    int _1871 = _1869 + _1767;
    bool _1873 = uint(_1871) >= uint(_1701);
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = _111 * _1857;
    bool _1883 = !_1873;
    int _1885 = _1883 ? 0 : (-1);
    bool _1887 = _1701 == 0;
    int _1889 = ~_1861;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    float _1895 = trunc(_1849);
    int _1897 = int(_1895);
    float _1899 = -_1867;
    float _1901 = _1855 + _1899;
    float _1903 = _285 * _1837;
    int _1905 = _1701 * _1893;
    int _1907 = _1905 + _1767;
    float _1909 = _1901 * _1837;
    float _1911 = float(_1753);
    int _1913 = int(_1829) + int(_1879);
    float _1915 = floor(_1863);
    int _1917 = ~_1753;
    int _1919 = _1917 + 1;
    bool _1921 = !_1887;
    int _1923 = _1921 ? _1907 : (-1);
    bool _1925 = _1819 >= _1911;
    bool _1927 = isnan(_1819);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1911);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    int _1937 = _1919 * _1913;
    int _1939 = _1937 + _1797;
    int _1941 = ~_1897;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = trunc(_1903);
    int _1949 = int(_1947);
    bool _1951 = !_1693;
    int _1953 = _1951 ? 0 : 1;
    bool _1955 = uint(_1939) >= uint(_1753);
    int _1957 = _1923 * _1945;
    int _1959 = abs(_1092);
    int _1961 = abs(_1953);
    float _1963 = trunc(_1909);
    int _1965 = int(_1963);
    int _1967 = _1701 + (-1);
    float _1969 = -_1915;
    float _1971 = _1863 + _1969;
    int _1973 = ~_1701;
    int _1975 = _1973 + 1;
    int _1977 = _1897 * _1967;
    int _1979 = _1977 + _1957;
    int _1981 = abs(_1104);
    float _1983 = trunc(_1935);
    int _1985 = int(_1983);
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1979 * _1959;
    bool _1993 = _1753 == 0;
    int _1995 = ~_1913;
    int _1997 = _1995 + _1989;
    int _1999 = _1997 + 1;
    int _2001 = _1949 * _1981;
    int _2003 = _2001 + _1991;
    int _2005 = abs(_1110);
    int _2007 = _1965 * _1961;
    int _2009 = _2007 + _1767;
    float _2011 = _1971 * _1911;
    int _2013 = _1753 * _1999;
    int _2015 = _2013 + _1797;
    bool _2017 = !_1681;
    float _2019 = _2017 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2021 = _285 * _1911;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2025 = _2023 != 0;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2029 = int(_2027);
    bool _2031 = !_1993;
    int _2033 = _2031 ? _2015 : (-1);
    int _2035 = ~_1985;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(as_type<int>(_2019));
    float _2043 = _2019;
    bool _2045 = _1687;
    if (_1705)
    {
        float _2047 = _541 * 3.1415927410125732421875;
        _2043 = _2047;
    }
    float _2049 = _2043;
    int _2051 = abs(_1168);
    float _2053 = trunc(_2011);
    int _2055 = int(_2053);
    int _2057 = _2033 * _2039;
    int _2059 = _2009 * _2005;
    int _2061 = _2059 + _2003;
    bool _2063 = !_2025;
    int _2065 = _2063 ? 0 : 1;
    float _2067 = _2049;
    if (_1705)
    {
        float _2069 = _2049 * 0.15915493667125701904296875;
        _2067 = _2069;
    }
    float _2071 = _2067;
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2075 = _2073 != 0;
    int _2077 = _1965 * _2041;
    int _2079 = _2077 + _2061;
    float _2081 = trunc(_2021);
    int _2083 = int(_2081);
    int _2085 = _1753 + (-1);
    int _2087 = abs(_2065);
    int _2089 = _1985 * _2085;
    int _2091 = _2089 + _2057;
    int _2093 = abs(_1210);
    int _2095 = _2055 * _2087;
    int _2097 = _2095 + _1797;
    bool _2099 = !_1687;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = _2091 * _2051;
    float _2105 = trunc(_1881);
    int _2107 = int(_2105);
    float _2109 = float(uint(_2079));
    float _2111 = as_type<float>(_1697);
    float _2113 = _2071;
    if (_2075)
    {
        float _2115 = in.m_56.w;
        _2111 = _2115;
    }
    float _2117 = _2111;
    int _2119 = abs(_2101);
    int _2121 = _2083 * _1697;
    int _2123 = _2121 + _2103;
    float _2125 = as_type<float>(_1763) * _2109;
    if (_1705)
    {
        float _2127 = _2071 * 6.283185482025146484375;
        float _2129 = sin(_2127);
        _2113 = _2129;
    }
    float _2131 = _2113;
    float _2133 = float(uint(_2009));
    int _2135 = _2097 * _2093;
    int _2137 = _2135 + _2123;
    float _2139 = float(uint(_2029));
    int _2141 = ~_1701;
    int _2143 = _2141 + 1;
    int _2145 = _2055 * _2119;
    int _2147 = _2145 + _2137;
    int _2149 = ~_1701;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2125);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1763) * _2133;
    float _2161 = 0.0;
    if (!_2075)
    {
        _2161 = _205;
    }
    float _2163 = _2161;
    float _2165 = float(uint(_2147));
    float _2167 = trunc(_2159);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = as_type<float>(_1799) * _2165;
    float _2175 = _2165;
    float _2177 = as_type<float>(_2151);
    float _2179 = _2163;
    if (_2075)
    {
        float _2181 = _2117 * 3.1415927410125732421875;
        _2175 = _2181;
    }
    float _2183 = _2175;
    int _2185 = ~_1753;
    int _2187 = _2185 + 1;
    int _2189 = _2151 * int(_2157);
    int _2191 = _2189 + _2079;
    float _2193 = trunc(_2173);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    if (_2075)
    {
        float _2199 = _2183 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = float(uint(_2191));
    float _2205 = float(uint(_2097));
    int _2207 = _2143 * int(_2171);
    int _2209 = _2207 + _2009;
    float _2211 = _2201;
    if (_2075)
    {
        float _2213 = _2201 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = as_type<float>(_1763) * _2203;
    float _2221 = as_type<float>(_1799) * _2205;
    float _2223 = float(uint(_2209));
    float _2225 = trunc(_2219);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    int _2231 = _2187 * int(_2197);
    int _2233 = _2231 + _2147;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2235 = as_type<float>(_1763) * _2223;
    float _2237 = float(uint(_2233));
    float _2239 = 1.0 / _2139;
    if (_2075)
    {
        bool _2241 = _2217 > 0.5;
        _2045 = _2241;
    }
    bool _2243 = _2045;
    float _2245 = as_type<float>(_1799) * _2237;
    float _2247 = _2245;
    if (_2075)
    {
        float _2249 = -_205;
        float _2251 = _2243 ? _2249 : _205;
        _2179 = _2251;
    }
    float _2253 = _2179;
    float _2255 = float(uint(_2107));
    float _2257 = trunc(_2221);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    int _2263 = int(_2157) + int(_2229);
    int _2265 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2245);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = _1975 * _2263;
    int _2277 = _2275 + _2079;
    int _2279 = as_type<int>(_2239) + (-2);
    int _2281 = ~_1753;
    int _2283 = _2281 + 1;
    bool _2285 = uint(_2277) >= uint(_1701);
    float _2287 = as_type<float>(_2279) * _2255;
    int _2289 = _1779 * int(_2261);
    int _2291 = _2289 + _2097;
    float _2293 = trunc(_2235);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : (-1);
    bool _2303 = _2285;
    if (_1705)
    {
        bool _2305 = _2131 > 0.5;
        _2303 = _2305;
    }
    bool _2307 = _2303;
    float _2309 = float(uint(_2291));
    int _2311 = ~_2263;
    int _2313 = _2311 + _2301;
    int _2315 = _2313 + 1;
    float _2317 = trunc(_2287);
    float _2319 = precise::max(_2317, 0.0);
    uint _2321 = uint(_2319);
    int _2323 = int(_2197) + int(_2273);
    float _2325 = as_type<float>(_1799) * _2309;
    int _2327 = _1701 * _2315;
    int _2329 = _2327 + _2079;
    if (!_1705)
    {
        _2247 = _209;
    }
    float _2331 = _2247;
    int _2333 = ~_2029;
    int _2335 = _2333 + 1;
    int _2337 = _2283 * _2323;
    int _2339 = _2337 + _2147;
    float _2341 = _2331;
    if (_1705)
    {
        float _2343 = -_209;
        float _2345 = _2307 ? _2343 : _209;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = 1.0 / _1721;
    bool _2351 = !_1887;
    int _2353 = _2351 ? _2329 : (-1);
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2357 = _2355 != 0;
    float _2359 = -_205;
    int _2361 = _1346 ? as_type<int>(_2359) : as_type<int>(_205);
    int _2363 = _2335 * int(_2321);
    int _2365 = _2363 + _2107;
    bool _2367 = uint(_2339) >= uint(_1753);
    float _2369 = 1.0 / _1725;
    int _2371 = _2353 & 3;
    bool _2373 = _2371 != 0;
    bool _2375 = !_2357;
    float _2377 = _2375 ? _205 : as_type<float>(_2361);
    bool _2379 = !_2367;
    int _2381 = _2379 ? 0 : (-1);
    bool _2383 = uint(_2371) > 1u;
    float _2385 = 1.0 / _1733;
    float _2387 = float(uint(_2365));
    int _2389 = ~_2323;
    int _2391 = _2389 + _2381;
    int _2393 = _2391 + 1;
    int _2395 = int(_2171) + int(_2297);
    float _2397 = as_type<float>(_2279) * _2387;
    int _2399 = ~_1701;
    int _2401 = _2399 + 1;
    int _2403 = _1753 * _2393;
    int _2405 = _2403 + _2147;
    int _2407 = _2353 & 3;
    bool _2409 = _2407 != 0;
    float _2411 = trunc(_2397);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    float _2417 = -_209;
    int _2419 = _1350 ? as_type<int>(_2417) : as_type<int>(_209);
    int _2421 = _2401 * _2395;
    int _2423 = _2421 + _2009;
    int _2425 = _2409 ? 0 : 1;
    bool _2427 = _2371 != 3;
    bool _2429 = uint(_2371) >= 2u;
    float _2431 = trunc(_2325);
    float _2433 = precise::max(_2431, 0.0);
    uint _2435 = uint(_2433);
    bool _2437 = !_1993;
    int _2439 = _2437 ? _2405 : (-1);
    int _2441 = ~_2425;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = _2445;
    if (!_2383)
    {
        int _2449 = ~_2425;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = _2429 ? 0 : 1;
    float _2457 = 1.0 / _1741;
    bool _2459 = uint(_2423) >= uint(_1701);
    int _2461 = _2439 & 3;
    bool _2463 = _2461 != 0;
    bool _2465 = !_2459;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = uint(_2461) > 1u;
    float _2471 = exp2(_1689);
    int _2473 = ~_2455;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2427)
    {
        int _2481 = ~_2455;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2439 & 3;
    bool _2489 = _2487 != 0;
    int _2491 = int(_2321) + int(_2415);
    int _2493 = ~_2029;
    int _2495 = _2493 + 1;
    int _2497 = _2489 ? 0 : 1;
    bool _2499 = _2461 != 3;
    int _2501 = _2495 * _2491;
    int _2503 = _2501 + _2107;
    bool _2505 = !_2267;
    float _2507 = _2505 ? _209 : as_type<float>(_2419);
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2509;
    int _2513 = ~_1753;
    int _2515 = _2513 + 1;
    float _2517 = -_2471;
    float _2519 = _2517 + 1.0;
    int _2521 = int(_2261) + int(_2435);
    float _2523 = _2511 * _1817;
    int _2525 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2527 = _2525 != 0;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2533 = ~_2497;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    float _2539 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2541 = !_2463;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = _2531 * _2385;
    bool _2547 = uint(_2461) >= 2u;
    float _2549 = _2539 * _1652;
    int _2551 = _2537;
    if (!_2469)
    {
        int _2553 = ~_2497;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    bool _2559 = _2461 != 3;
    int _2561 = _2515 * _2521;
    int _2563 = _2561 + _2097;
    int _2565 = _2547 ? 0 : 1;
    float _2567 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2569 = uint(_2503) >= uint(_2029);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = -_1747;
    float _2577 = fma(_2567, 2.0, _2575);
    bool _2579 = uint(_2563) >= uint(_1753);
    int _2581 = ~_2565;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = _2585;
    if (_2499)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    float _2595 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2597 = _541 > 0.5;
    bool _2599 = !_2579;
    int _2601 = _2599 ? 0 : (-1);
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2605 = _2603 != 0;
    float _2607 = -_205;
    int _2609 = _2597 ? as_type<int>(_2607) : as_type<int>(_205);
    bool _2611 = !_2569;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : 1;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2527;
    float _2633 = _2631 ? _205 : as_type<float>(_2609);
    float _2635 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2637 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2639 = isnan(_782);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2635);
    float _2651 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1695);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2657 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2659;
    float _2663 = _2655 * _2349;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2677 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2679 = isnan(_782);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2685);
    float _2689 = _2667 * _2369;
    float _2691 = 1.0 / _2671;
    bool _2693 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2695 = isnan(_782);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2701 = _2697 || _2699;
    float _2703 = float(_2701);
    float _2705 = _2661 * _2457;
    float _2707 = -_2687;
    float _2709 = _2707 + 1.0;
    float _2711 = -_2647;
    float _2713 = _2711 + 1.0;
    float _2715 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2717 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2719 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2721 = 1.0 / _2675;
    float _2723 = _2687 * _2713;
    bool _2725 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2727 = isnan(_782);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2733 = _2729 || _2731;
    float _2735 = float(_2733);
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2741;
    bool _2745 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2747 = isnan(_782);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    out.m_70.x = _2715;
    out.m_70.y = _2717;
    out.m_70.z = _2719;
    bool _2757 = _896 != 1;
    float _2759 = _2739 * _2691;
    float _2761 = _2703 * _2709;
    float _2763 = fma(_1683, _1683, 1.0);
    float _2765 = -_2703;
    float _2767 = _2765 + 1.0;
    bool _2769 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2771 = isnan(_782);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = -_111;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2577);
    float _2789 = _2735 * _2767;
    float _2791 = rsqrt(_2763);
    float _2793 = _2743 * _2721;
    float _2795 = -_2735;
    float _2797 = _2795 + 1.0;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2801 = _782 + _2799;
    float _2803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2805 = _782 + _2803;
    bool _2807 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2809 = isnan(_782);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = _2755 * _2797;
    float _2821 = fma(_2523, _2801, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2823 = fma(_2663, _2805, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2825 = _2779 * _2783;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2829 = _782 + _2827;
    bool _2831 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2833 = isnan(_782);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = -_2779;
    float _2845 = _2843 + 1.0;
    float _2847 = -_2817;
    float _2849 = _2847 + 1.0;
    float _2851 = fma(_2705, _2829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2855 = _782 + _2853;
    float _2857 = _2817 * _2845;
    float _2859 = _2841 * _2849;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2863 = _782 + _2861;
    float _2865 = _1683 * _2791;
    float _2867 = fma(_2689, _2855, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2869 = _2821 * _2859;
    float _2871 = fma(_2545, _2863, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2875 = _2865 * _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2879 = _2865 * _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2883 = _2865 * _2881;
    float _2885 = -_2841;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2875);
    float _2891 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2879);
    float _2893 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2883);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2897 = _782 + _2895;
    float _2899 = _2633 + 0.5;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2903 = _782 + _2901;
    float _2905 = fma(_2887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2869);
    out.m_72.x = _2889;
    out.m_72.y = _2891;
    out.m_72.z = _2893;
    float _2907 = fma(_2899, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2787);
    float _2909 = fma(_2759, _2897, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2911 = fma(_2793, _2903, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2913 = fma(_2823, _2857, _2905);
    float _2915 = _890 * _898;
    float _2917 = _2903;
    float _2919 = _2823;
    float _2921 = _2759;
    if (!_2757)
    {
        _2917 = _888;
    }
    float _2923 = _2917;
    float _2925 = fma(_2851, _2825, _2913);
    float _2927 = _2923;
    if (!_2757)
    {
        _2919 = _888;
    }
    float _2929 = _2919;
    float _2931 = floor(_2915);
    float _2933 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2935 = fma(_2871, _2819, _2925);
    float _2937 = _2929;
    if (!_2757)
    {
        _1196 = _788;
    }
    float _2939 = _1196;
    float _2941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2943 = _2939;
    if (!_2757)
    {
        _2921 = _788;
    }
    float _2945 = _2921;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2949 = _2945;
    if (_2757)
    {
        _2927 = _541;
    }
    float _2951 = _2927;
    float _2953 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2941);
    if (_2757)
    {
        _2937 = _541;
    }
    float _2955 = _2937;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (_2757)
    {
        _2943 = _888;
    }
    float _2959 = _2943;
    float _2961 = fma(_2933, -2.0, _2947);
    if (_2757)
    {
        _2949 = _888;
    }
    float _2963 = _2949;
    float _2965 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2957);
    bool _2967 = _902 != 2;
    float _2969 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2971 = -_2931;
    float _2973 = _2915 + _2971;
    float _2975 = fma(_2867, _2789, _2935);
    float _2977 = float(_2107);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = float(_2029);
    float _2985 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2979);
    float _2987 = -_2981;
    float _2989 = fma(_2969, 2.0, _2987);
    bool _2991 = _2977 >= _2983;
    bool _2993 = isnan(_2977);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3005 = ~_2491;
    int _3007 = _3005 + _2613;
    int _3009 = _3007 + 1;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _3015 = _2969;
    if (_2967)
    {
        _3013 = _541;
    }
    float _3017 = _3013;
    float _3019 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2961);
    float _3021 = trunc(_3001);
    int _3023 = int(_3021);
    float _3025 = _3017;
    if (_2967)
    {
        _3015 = _888;
    }
    float _3027 = _3015;
    int _3029 = _2029 * _3009;
    int _3031 = _3029 + _2107;
    float _3033 = _3027;
    if (!_2967)
    {
        _3025 = _788;
    }
    float _3035 = _3025;
    float _3037 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3003);
    if (!_2967)
    {
        _3033 = _541;
    }
    float _3039 = _3033;
    float _3041 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3011);
    bool _3043 = _2029 == 0;
    float _3045 = _2973 * _2983;
    float _3047 = _285 * _2983;
    int _3049 = _2029 + (-1);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3053 = !_3043;
    int _3055 = _3053 ? _3031 : (-1);
    float _3057 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2965);
    float _3059 = trunc(_3045);
    int _3061 = int(_3059);
    float _3063 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3065 = ~_3023;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    float _3071 = -_3057;
    float _3073 = _3071 + 1.0;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3077 = abs(_1128);
    int _3079 = _3055 * _3069;
    float _3081 = trunc(_3047);
    int _3083 = int(_3081);
    int _3085 = abs(_2617);
    float _3087 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3075);
    int _3089 = _3023 * _3049;
    int _3091 = _3089 + _3079;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3095 = _904 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3097 = _3091 * _3077;
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3101 = fma(_3095, -2.0, _3093);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3105 = abs(_1178);
    int _3107 = _3061 * _3085;
    int _3109 = _3107 + _2107;
    float _3111 = _2253 + 0.5;
    int _3113 = _3083 * _1759;
    int _3115 = _3113 + _3097;
    float _3117 = -_111;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2989);
    float _3121 = _2347 + (-0.5);
    float _3123 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3101);
    float _3125 = -_3103;
    float _3127 = fma(_3051, 2.0, _3125);
    float _3129 = fma(_3111, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3119);
    float _3131 = -_3121;
    float _3133 = -_3123;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3133);
    int _3137 = _3109 * _3105;
    int _3139 = _3137 + _3115;
    float _3141 = _2507 + (-0.5);
    float _3143 = _2951 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3145 = _3061 * _1761;
    int _3147 = _3145 + _3139;
    float _3149 = -_3141;
    float _3151 = -_3019;
    float _3153 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3151);
    float _3155 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3159 = float(uint(_3147));
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2953);
    float _3169 = as_type<float>(_2279) * _3159;
    float _3171 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3087);
    float _3173 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3175 = float(uint(_3109));
    float _3177 = fma(_3063, -2.0, _3157);
    float _3179 = -_3171;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_3173, -2.0, _3161);
    float _3185 = trunc(_3169);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_2279) * _3175;
    float _3193 = -_3073;
    float _3195 = fma(_3193, _2253, _3129);
    int _3197 = _2439 >> 31;
    float _3199 = fma(_3181, _2347, _3135);
    int _3201 = ~_2029;
    int _3203 = _3201 + 1;
    float _3205 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3163);
    int _3207 = _3197 & 3;
    float _3209 = trunc(_3191);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    out.m_74.x = _3195;
    out.m_74.y = _3199;
    int _3215 = ~_2029;
    int _3217 = _3215 + 1;
    float _3219 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3099);
    int _3221 = _2439 + _3207;
    float _3223 = -_3165;
    float _3225 = fma(_3143, 2.0, _3223);
    float _3227 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3041);
    float _3229 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2985);
    int _3231 = _3203 * int(_3189);
    int _3233 = _3231 + _3147;
    float _3235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3237 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3205);
    int _3239 = _3221 >> 2;
    float _3241 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3219);
    float _3243 = float(uint(_3233));
    float _3245 = -_111;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3225);
    int _3249 = _3239 << 4;
    int _3251 = _3249 + 656;
    int _3253 = _3217 * int(_3213);
    int _3255 = _3253 + _3109;
    float _3257 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3177);
    float _3259 = as_type<float>(_2279) * _3243;
    uint _3261 = uint(int(uint(_3251) >> uint(2)));
    uint _3263 = uint(int(uint(int(_3261)) >> uint(2)));
    int _3265 = int(_3261) & 3;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[int(_3263)][_3265];
    int _3269 = int(_3261) + 1;
    uint _3271 = uint(int(uint(_3269) >> uint(2)));
    int _3273 = _3269 & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    float _3277 = -_111;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3127);
    float _3281 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3183);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3285 = fma(_2909, _2761, _2975);
    float _3287 = float(uint(_3255));
    float _3289 = _3235 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3291 = -_3241;
    float _3293 = _3291 + 1.0;
    int _3295 = _3251 + 8;
    uint _3297 = uint(int(uint(_3295) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    float _3313 = fma(_2911, _2723, _3285);
    float _3315 = as_type<float>(_2279) * _3287;
    float _3317 = trunc(_3259);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2377 + 0.5;
    float _3325 = _1026 + (-0.5);
    float _3327 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3313);
    int _3329 = abs(_2543);
    float _3331 = fma(_3289, _3323, _3247);
    float _3333 = -_3155;
    float _3335 = _3333 + 1.0;
    float _3337 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3341 = ~_2521;
    int _3343 = _3341 + _2601;
    int _3345 = _3343 + 1;
    float _3347 = -_3335;
    float _3349 = fma(_2633, _3347, _2907);
    int _3351 = ~_2029;
    int _3353 = _3351 + 1;
    float _3355 = -_3339;
    float _3357 = -_3257;
    float _3359 = fma(_3355, _3325, _3357);
    float _3361 = -_3167;
    float _3363 = _3361 + 1.0;
    float _3365 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    int _3367 = abs(_2557);
    float _3369 = fma(_1026, _3293, _3359);
    int _3371 = int(_3189) + int(_3321);
    float _3373 = -_3237;
    float _3375 = _3373 + 1.0;
    float _3377 = fma(_2507, _3363, _3153);
    bool _3379 = !_2625;
    int _3381 = _3379 ? 0 : 1;
    float _3383 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3385 = int(_3383);
    float _3387 = -_3375;
    float _3389 = fma(_2377, _3387, _3331);
    int _3391 = _3353 * _3371;
    int _3393 = _3391 + _3147;
    int _3395 = ~_2029;
    int _3397 = _3395 + 1;
    int _3399 = _1753 * _3345;
    int _3401 = _3399 + _2097;
    int _3403 = abs(_3381);
    out.m_76.x = _3349;
    out.m_76.y = _3377;
    out.m_76.z = _3389;
    out.m_76.w = _3369;
    bool _3405 = uint(_3393) >= uint(_2029);
    float _3407 = trunc(_3315);
    float _3409 = precise::max(_3407, 0.0);
    uint _3411 = uint(_3409);
    bool _3413 = !_1993;
    int _3415 = _3413 ? _3401 : (-1);
    float _3417 = -_3227;
    float _3419 = _3417 + 1.0;
    bool _3421 = !_3405;
    int _3423 = _3421 ? 0 : (-1);
    float _3425 = -_3229;
    float _3427 = _3425 + 1.0;
    int _3429 = ~_2395;
    int _3431 = _3429 + _2467;
    int _3433 = _3431 + 1;
    float _3435 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    int _3437 = ~_3371;
    int _3439 = _3437 + _3423;
    int _3441 = _3439 + 1;
    int _3443 = abs(_2485);
    int _3445 = _1701 * _3433;
    int _3447 = _3445 + _2009;
    int _3449 = ~_3385;
    int _3451 = _3449 + 1;
    int _3453 = _2029 * _3441;
    int _3455 = _3453 + _3147;
    float _3457 = _1673 * _2549;
    int _3459 = ~_3367;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    out.m_78.x = _3327;
    int _3465 = _2353 >> 31;
    int _3467 = abs(_2593);
    int _3469 = _3463 * as_type<int>(_3275);
    int _3471 = ~_3329;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    int _3477 = _3465 & 3;
    int _3479 = ~_3467;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    int _3485 = _3475 * as_type<int>(_3267);
    int _3487 = _3485 + _3469;
    int _3489 = _2353 + _3477;
    int _3491 = abs(_2573);
    int _3493 = _3483 * as_type<int>(_3303);
    int _3495 = _3493 + _3487;
    int _3497 = abs(_3385);
    int _3499 = _3489 >> 2;
    float _3501 = float(uint(_3385));
    int _3503 = ~_3491;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    float _3509 = float(uint(_3497));
    float _3511 = 1.0 / _3501;
    int _3513 = _3499 << 4;
    int _3515 = _3513 + 368;
    int _3517 = _3507 * as_type<int>(_3311);
    int _3519 = _3517 + _3495;
    int _3521 = int(_3213) + int(_3411);
    bool _3523 = !_3043;
    int _3525 = _3523 ? _3455 : (-1);
    int _3527 = ~_3403;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3397 * _3521;
    int _3535 = _3533 + _3109;
    uint _3537 = uint(int(uint(_3515) >> uint(2)));
    uint _3539 = uint(int(uint(int(_3537)) >> uint(2)));
    int _3541 = int(_3537) & 3;
    float _3543 = (*spvDescriptorSet0.vp_c9)._m0[int(_3539)][_3541];
    int _3545 = int(_3537) + 1;
    uint _3547 = uint(int(uint(_3545) >> uint(2)));
    int _3549 = _3545 & 3;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[int(_3547)][_3549];
    int _3553 = _3525 >> 31;
    float _3555 = 1.0 / _3509;
    int _3557 = _3519 * _3531;
    bool _3559 = uint(_3535) >= uint(_2029);
    int _3561 = _3553 & 3;
    int _3563 = _3415 * _3403;
    int _3565 = _3563 + _3557;
    bool _3567 = !_3559;
    int _3569 = _3567 ? 0 : (-1);
    int _3571 = _3515 + 8;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3525 + _3561;
    int _3591 = _3525 & 3;
    bool _3593 = _3591 != 0;
    int _3595 = _3525 & 3;
    bool _3597 = _3595 != 0;
    int _3599 = _3589 >> 2;
    int _3601 = as_type<int>(_3511) + (-2);
    float _3603 = float(uint(_3565));
    int _3605 = _3593 ? 0 : 1;
    bool _3607 = uint(_3595) > 1u;
    float _3609 = as_type<float>(_3601) * _3603;
    int _3611 = as_type<int>(_3555) + (-2);
    int _3613 = _3599 << 4;
    int _3615 = _3613 + 800;
    int _3617 = abs(_3565);
    float _3619 = trunc(_3609);
    float _3621 = precise::max(_3619, 0.0);
    uint _3623 = uint(_3621);
    uint _3625 = uint(int(uint(_3615) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = ~_3605;
    int _3643 = _3641 + 1;
    int _3645 = _3643 + 1;
    float _3647 = float(uint(_3617));
    int _3649 = _3645;
    if (!_3607)
    {
        int _3651 = ~_3605;
        int _3653 = _3651 + 1;
        _3649 = _3653;
    }
    int _3655 = _3649;
    float _3657 = as_type<float>(_3611) * _3647;
    int _3659 = ~_3521;
    int _3661 = _3659 + _3569;
    int _3663 = _3661 + 1;
    int _3665 = _3615 + 8;
    uint _3667 = uint(int(uint(_3665) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = uint(_3595) >= 2u;
    int _3685 = abs(_2453);
    float _3687 = trunc(_3657);
    float _3689 = precise::max(_3687, 0.0);
    uint _3691 = uint(_3689);
    int _3693 = _3451 * int(_3623);
    int _3695 = _3693 + _3565;
    int _3697 = _3683 ? 0 : 1;
    int _3699 = _2029 * _3663;
    int _3701 = _3699 + _3109;
    int _3703 = ~_3685;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    bool _3709 = _3595 != 3;
    float _3711 = float(uint(_3695));
    int _3713 = _3707 * as_type<int>(_3551);
    bool _3715 = !_2373;
    int _3717 = _3715 ? 0 : 1;
    bool _3719 = !_3597;
    int _3721 = _3719 ? 0 : 1;
    float _3723 = as_type<float>(_3601) * _3711;
    int _3725 = ~_3497;
    int _3727 = _3725 + 1;
    int _3729 = abs(_3717);
    float _3731 = trunc(_3723);
    float _3733 = precise::max(_3731, 0.0);
    uint _3735 = uint(_3733);
    int _3737 = ~_3697;
    int _3739 = _3737 + 1;
    int _3741 = _3739 + 1;
    int _3743 = abs(_3721);
    int _3745 = _3741;
    if (_3709)
    {
        int _3747 = ~_3697;
        int _3749 = _3747 + 1;
        _3745 = _3749;
    }
    int _3751 = _3745;
    int _3753 = _3727 * int(_3691);
    int _3755 = _3753 + _3617;
    int _3757 = abs(_3655);
    int _3759 = ~_3729;
    int _3761 = _3759 + 1;
    int _3763 = _3761 + 1;
    int _3765 = abs(_3751);
    float _3767 = float(uint(_3755));
    int _3769 = _3763 * as_type<int>(_3543);
    int _3771 = _3769 + _3713;
    float _3773 = _1616 + _1592;
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    float _3781 = as_type<float>(_3611) * _3767;
    int _3783 = ~_3443;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    int _3789 = ~_3743;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    int _3795 = _3779 * as_type<int>(_3639);
    int _3797 = ~_3765;
    int _3799 = _3797 + 1;
    int _3801 = _3799 + 1;
    int _3803 = _3787 * as_type<int>(_3579);
    int _3805 = _3803 + _3771;
    float _3807 = _1592 * 0.5;
    float _3809 = trunc(_3781);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    bool _3815 = _2371 != 3;
    int _3817 = _3793 * as_type<int>(_3631);
    int _3819 = _3817 + _3795;
    float _3821 = fma(_1620, -0.5, _3807);
    bool _3823 = _3595 != 3;
    bool _3825 = !_3815;
    int _3827 = _3825 ? 0 : (-1);
    int _3829 = _3801 * as_type<int>(_3673);
    int _3831 = _3829 + _3819;
    float _3833 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3435);
    bool _3835 = !_3823;
    int _3837 = _3835 ? 0 : (-1);
    int _3839 = abs(_3827);
    float _3841 = _3833 + _1592;
    int _3843 = int(_3623) + int(_3735);
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _1592;
    int _3845 = ~_3385;
    int _3847 = _3845 + 1;
    int _3849 = abs(_3837);
    float _3851 = _3841 * 0.5;
    int _3853 = int(_3691) + int(_3813);
    int _3855 = ~_3497;
    int _3857 = _3855 + 1;
    bool _3859 = _3385 == 0;
    bool _3861 = !_1887;
    int _3863 = _3861 ? _3447 : (-1);
    int _3865 = _3847 * _3843;
    int _3867 = _3865 + _3565;
    float _3869 = _3773 * 0.5;
    int _3871 = _3857 * _3853;
    int _3873 = _3871 + _3617;
    int _3875 = ~_3839;
    int _3877 = _3875 + 1;
    int _3879 = _3877 + 1;
    float _3881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3883 = uint(_3867) >= uint(_3385);
    out.m_80.x = _3869;
    out.m_80.y = _3821;
    out.m_80.z = _3851;
    out.m_80.w = _1592;
    int _3885 = ~_3849;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3879 * as_type<int>(_3587);
    int _3893 = _3891 + _3805;
    bool _3895 = !_2621;
    int _3897 = _3895 ? 0 : 1;
    bool _3899 = !_3883;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = _3889 * as_type<int>(_3681);
    int _3905 = _3903 + _3831;
    bool _3907 = uint(_3873) >= uint(_3497);
    int _3909 = abs(_3897);
    int _3911 = ~_3843;
    int _3913 = _3911 + _3901;
    int _3915 = _3913 + 1;
    int _3917 = _3565 ^ _3385;
    float _3919 = _3881 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3921 = !_3907;
    int _3923 = _3921 ? 0 : (-1);
    bool _3925 = _3385 == 0;
    int _3927 = _3385 * _3915;
    int _3929 = _3927 + _3565;
    uint _3931 = uint(int(uint(_3917) >> uint(31)));
    bool _3933 = !_2629;
    int _3935 = _3933 ? 0 : 1;
    int _3937 = ~_3923;
    int _3939 = _3853 + _3937;
    int _3941 = _3939 + 1;
    int _3943 = ~int(_3931);
    int _3945 = _3943 + 1;
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3949 = abs(_3935);
    bool _3951 = !_3925;
    int _3953 = _3951 ? _3929 : (-1);
    int _3955 = _3941 ^ _3945;
    float _3957 = float(_3953);
    int _3959 = ~_3945;
    int _3961 = _3959 + _3955;
    int _3963 = _3961 + 1;
    float _3965 = _966 + 0.5;
    int _3967 = ~_3909;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3919, _3957, _3279);
    bool _3975 = !_3859;
    int _3977 = _3975 ? _3963 : (-1);
    bool _3979 = !_3043;
    int _3981 = _3979 ? _3701 : (-1);
    float _3983 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3985 = float(_3977);
    int _3987 = _3893 * _3971;
    int _3989 = ~_3949;
    int _3991 = _3989 + 1;
    int _3993 = _3991 + 1;
    float _3995 = fma(_3919, _3965, _3973);
    bool _3997 = _1332 > 0.0;
    bool _3999 = isnan(_1332);
    bool _4001 = _3997 || _3999;
    bool _4003 = isnan(0.0);
    bool _4005 = _4001 || _4003;
    float _4007 = -_3281;
    float _4009 = fma(_3983, _3985, _4007);
    float _4011 = _960 + (-0.5);
    int _4013 = _3863 * _3909;
    int _4015 = _4013 + _3987;
    float _4017 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _4019 = _3905 * _3993;
    float _4021 = -_3983;
    float _4023 = fma(_4021, _4011, _4009);
    float _4025 = _1663 * _2549;
    float _4027 = float(_4015);
    int _4029 = _3981 * _3949;
    int _4031 = _4029 + _4019;
    float _4033 = -_2539;
    float _4035 = _4033 + 1.0;
    float _4037 = -_3419;
    float _4039 = fma(_966, _4037, _3995);
    float _4041 = fma(_960, _3427, _4023);
    out.m_82.x = _4027;
    float _4043 = float(_4031);
    float _4045 = _4017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_1669, _4025, _1657);
    float _4049 = fma(_1671, _4025, _1659);
    float _4051 = _1663 * _4035;
    float _4053 = fma(_1663, _3457, _1661);
    out.m_82.w = _4043;
    out.m_84.x = _4039;
    out.m_84.y = _4041;
    out.m_49.x = _4045;
    out.m_86.x = _4047;
    out.m_86.y = _4049;
    out.m_86.z = _4053;
    out.m_86.w = _4051;
    if (_4005)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _780 = false;
    bool _609 = false;
    bool _423 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = in.m_44.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4123 = as_type<float>(_127);
        out.gl_Position.z = _4123;
    }
    if (!_115)
    {
        return out;
    }
    bool _131 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_102);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_107);
    bool _143 = _111 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _129 = as_type<int>(_153);
    }
    int _155 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_155);
        out.gl_Position.z = _4178;
    }
    if (_147)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _141;
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_157) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_157) & 2;
    bool _191 = _189 != 0;
    float _193 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * _193;
        float _199 = _197 * 0.5;
        _149 = _199;
    }
    float _201 = _149;
    bool _203 = !_187;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_171)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_171;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _193 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _193);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_171;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _193 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _195 = _273;
    }
    float _275 = _195;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = _111 * _159;
    float _287 = fma(_275, _173, _279);
    float _289 = fma(_275, _175, _281);
    float _291 = fma(_275, _177, _283);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_277;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        _317 = _285;
    }
    _319 = false;
    float _321 = _317;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    bool _331 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_321);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _343;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = 1.0 / _345;
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _371 = _357 * _361;
    float _373 = -_357;
    float _375 = _373 + 1.0;
    float _377 = _325 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = _383 * _371;
    float _389 = _385 * _371;
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _395 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].x, _391);
    float _397 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].y, _393);
    float _399 = _395 * _327;
    float _401 = _397 * _329;
    bool _403 = !_369;
    float _421;
    if (!_403)
    {
        float _405 = in.m_56.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _285;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = isnan(_425);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _451 = 1.0 / _433;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _461 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_425);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _429;
    float _477 = 1.0 / _449;
    float _479 = _455 * _451;
    bool _481 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_425);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = _459 * _475;
    float _495 = -_445;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _425 + _499;
    float _503 = _491 * _497;
    float _505 = -_491;
    float _507 = _505 + 1.0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = fma(_479, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = _425 + _515;
    float _519 = _471 * _507;
    float _521 = _511 * _477;
    bool _523 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = isnan(_425);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_471;
    float _537 = _535 + 1.0;
    float _539 = _513 * _519;
    float _541 = in.m_56.x;
    float _543 = fma(_493, _517, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = -_533;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _551 = _425 + _549;
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _555 = _445 * _547;
    float _557 = fma(_521, _551, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _559 = fma(_543, _503, _553);
    float _561 = fma(_557, _555, _559);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[118].x, _561);
    float _569 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * _541;
    out.m_58.x = _573;
    out.m_58.y = _579;
    out.m_58.z = _575;
    out.m_58.w = _577;
    float _583 = trunc(_581);
    int _585 = int(_583);
    int _587 = _585 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_473;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _541 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _285;
    }
    _609 = false;
    float _611 = _607;
    uint _614 = uint(int(uint(_589) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    int _622 = int(_614) + 1;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    int _626 = _622 & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _632 = _611 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _638 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_611);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _654 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_611);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    int _666 = _589 + 8;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[int(_670)][_672];
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = 1.0 / _636;
    float _682 = -_648;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _688 = _664 * _684;
    float _690 = -_664;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _652;
    float _696 = _678 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = fma(_696, _632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _704 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _706 = isnan(_611);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _700 * _694;
    float _718 = _702 * _688;
    float _720 = -_714;
    float _722 = _720 + 1.0;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _726 = _611 + _724;
    float _728 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[131].x, _718);
    float _730 = _648 * _722;
    float _732 = fma(_716, _726, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_732, _730, _728);
    float _736 = _620 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _628 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[133].x, _734);
    float _742 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _748 = _674 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _742;
    out.m_60.y = _744;
    out.m_60.z = _750;
    out.m_60.w = _746;
    bool _752 = !_686;
    float _754 = _674;
    int _756 = as_type<int>(_742);
    float _758 = _750;
    float _760 = _744;
    float _762 = _746;
    float _778;
    if (!_752)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _766 = _541 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _285;
    }
    _780 = false;
    float _782 = _778;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_56.z;
    float _790 = in.m_56.w;
    float _792 = 0.0;
    if (_786)
    {
        float _794 = in.m_56.y;
        _792 = _794;
    }
    float _796 = _792;
    if (_786)
    {
        _754 = 1.0;
    }
    float _798 = _754;
    float _800 = 0.0;
    float _802 = _798;
    if (_786)
    {
        _800 = 1.0;
    }
    float _804 = _800;
    int _806 = 0;
    float _808 = _804;
    if (_786)
    {
        _806 = 0;
    }
    int _810 = _806;
    int _812 = _810;
    if (_786)
    {
        _756 = 0;
    }
    int _814 = _756;
    int _816 = _814;
    if (_786)
    {
        _758 = _541;
    }
    float _818 = _758;
    float _820 = 0.0;
    float _822 = _818;
    if (_786)
    {
        _820 = _541;
    }
    float _824 = _820;
    bool _826 = _788 > 0.5;
    float _828 = _824;
    if (_786)
    {
        _760 = _541;
    }
    float _830 = _760;
    int _832 = int(_786);
    int _834 = _191 ? 2 : 0;
    int _836 = _832 | _834;
    int _838 = _826 ? 4 : 0;
    int _840 = _836 | _838;
    int _842 = false ? 8 : 0;
    int _844 = _840 | _842;
    int _846 = false ? 16 : 0;
    int _848 = _844 | _846;
    int _850 = false ? 32 : 0;
    int _852 = _848 | _850;
    int _854 = false ? 64 : 0;
    int _856 = _852 | _854;
    int _858 = _856 & 4;
    float _860 = _796;
    float _862 = _830;
    if (_786)
    {
        _762 = _796;
    }
    float _864 = _762;
    float _866 = _864;
    if (!_786)
    {
        float _868 = in.m_56.y;
        float _870 = _541 * 3.1415927410125732421875;
        float _872 = in.m_56.z;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _868 * 3.1415927410125732421875;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = sin(_884);
        _860 = _868;
        _802 = 7.345489978790283203125;
        _808 = 5.839270114898681640625;
        _828 = _872;
        _812 = 1;
        _822 = _868;
        _862 = _878;
        _816 = 2;
        _866 = _886;
    }
    float _888 = _860;
    float _890 = _802;
    float _892 = _808;
    float _894 = _828;
    int _896 = _812;
    float _898 = _822;
    float _900 = _862;
    int _902 = _816;
    float _904 = _866;
    float _906 = in.m_62.x;
    float _908 = in.m_62.y;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    bool _914 = _888 > 0.5;
    float _916 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _918 = _790 > 0.5;
    float _920 = in.m_64.x;
    float _922 = in.m_64.y;
    float _924 = in.m_64.z;
    float _926 = in.m_64.w;
    float _928 = -_209;
    int _930 = _826 ? as_type<int>(_928) : as_type<int>(_209);
    float _932 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _936 = _934 != 0;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _944 = _942 != 0;
    float _946 = in.m_66.x;
    float _948 = in.m_66.y;
    float _950 = in.m_66.z;
    float _952 = in.m_66.w;
    float _954 = -_205;
    int _956 = _914 ? as_type<int>(_954) : as_type<int>(_205);
    bool _958 = !_944;
    float _960 = _958 ? _209 : as_type<float>(_930);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    bool _964 = !_940;
    float _966 = _964 ? _205 : as_type<float>(_956);
    float _968 = -_209;
    int _970 = _918 ? as_type<int>(_968) : as_type<int>(_209);
    float _972 = _916 * _962;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _986 = _984 != 0;
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _990 = int(_918);
    int _992 = _914 ? 2 : 0;
    int _994 = _990 | _992;
    int _996 = _826 ? 4 : 0;
    int _998 = _994 | _996;
    int _1000 = _936 ? 8 : 0;
    int _1002 = _998 | _1000;
    int _1004 = _978 ? 16 : 0;
    int _1006 = _1002 | _1004;
    int _1008 = _982 ? 32 : 0;
    int _1010 = _1006 | _1008;
    int _1012 = _986 ? 64 : 0;
    int _1014 = _1010 | _1012;
    int _1016 = _1014 & 2;
    float _1018 = _295 * _908;
    float _1020 = _932 * _974;
    float _1022 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1024 = !_936;
    float _1026 = _1024 ? _209 : as_type<float>(_970);
    float _1028 = _295 * _922;
    float _1030 = fma(_293, _906, _1018);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1046 = _1044 != 0;
    float _1048 = _295 * _948;
    float _1050 = fma(_293, _920, _1028);
    float _1052 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1054 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _988);
    float _1056 = fma(_297, _910, _1030);
    float _1058 = fma(_297, _924, _1050);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1052);
    float _1062 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1054);
    float _1064 = fma(_293, _946, _1048);
    float _1066 = _1058 + _926;
    float _1068 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1060);
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = _1056 + _912;
    float _1074 = fma(_297, _950, _1064);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1066 + _1070;
    float _1080 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1082 = _1074 + _952;
    float _1084 = _1072 + _1076;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1088 = _1078 + _1086;
    bool _1090 = !_982;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1084 + _1096;
    float _1100 = _1088 * _1088;
    bool _1102 = !_978;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1094);
    bool _1108 = !_986;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = fma(_1098, _1098, _1100);
    float _1114 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1116 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1106);
    float _1118 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1080);
    float _1120 = sqrt(_1112);
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1126 = !_1038;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1142 = _1140 != 0;
    float _1144 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    bool _1146 = !_1034;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = 1.0 / _1124;
    bool _1152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1154 = isnan(0.5);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1160 = _1156 || _1158;
    float _1162 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1166 = !_1138;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1162 + _1124;
    float _1172 = _1082 + _1164;
    bool _1174 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1176 = !_1042;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1046;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1052;
    float _1186 = _1124;
    float _1188 = _1170;
    float _1190 = _1098;
    float _1192 = _1080;
    float _1194 = _1088;
    float _1196 = _898;
    if (_1160)
    {
        _1184 = 1.0;
    }
    float _1198 = _1184;
    float _1200 = _1170 * _1150;
    float _1202 = _1200 * 0.5;
    bool _1204 = !_1134;
    int _1206 = _1204 ? 0 : 1;
    bool _1208 = !_1142;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1150;
    float _1214 = _1198;
    if (!_1174)
    {
        _1186 = _1084;
    }
    float _1216 = _1186;
    float _1218 = _1216;
    if (!_1174)
    {
        _1188 = _1078;
    }
    float _1220 = _1188;
    float _1222 = _1220;
    if (!_1174)
    {
        _1212 = _1172;
    }
    float _1224 = _1212;
    bool _1226 = !_1174;
    float _1228 = _1224;
    if (!_1226)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1234 = _1120 + _1232;
        float _1236 = rsqrt(_1112);
        float _1238 = _1234 * _1230;
        float _1240 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = _1238 * 0.15915493667125701904296875;
        float _1244 = _1242 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        float _1248 = _1242 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = fma(_1246, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1254 = _1236 * _1252;
        float _1256 = _1250 + (-1.0);
        float _1258 = fma(_1098, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1260 = fma(_1088, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1262 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = fma(_1172, _1250, _1262);
        _1228 = _1264;
        _1218 = _1258;
        _1222 = _1260;
    }
    float _1266 = _1228;
    float _1268 = _1218;
    float _1270 = _1222;
    if (!_1160)
    {
        float _1272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1280 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1278);
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1276 * 0.15915493667125701904296875;
        float _1288 = _1274 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = 1.0 / _1284;
        float _1294 = _1286 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1290 * _1292;
        float _1300 = _1286 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = 1.0 / _1280;
        float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1310 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1308;
        float _1312 = 1.0 / _1304;
        float _1314 = 1.0 / _1310;
        float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1318 = _1306 * _1316;
        float _1320 = _1302 * _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1324 = fma(_1320, _1318, _1322);
        float _1326 = _1324 * _1314;
        float _1328 = precise::clamp(_1326, 0.0, 1.0);
        _1190 = _1314;
        _1214 = _1328;
    }
    float _1330 = _1190;
    float _1332 = _1214;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1266 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1340 = _1268 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1270 + _1342;
    bool _1346 = _858 != 0;
    float _1348 = _1336 * _1336;
    bool _1350 = _1016 != 0;
    float _1352 = fma(_1340, _1340, _1348);
    float _1354 = fma(_1344, _1344, _1352);
    float _1356 = rsqrt(_1354);
    float _1358 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1360 = _1340 * _1358;
    float _1362 = _1344 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 + _1366;
    float _1370 = sqrt(_1368);
    bool _1372 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = _1370 + _1374;
    float _1378 = _1356;
    float _1380 = _1368;
    float _1382 = _1376;
    float _1384 = _1330;
    float _1386 = _1336;
    if (_1372)
    {
        float _1388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    if (_1372)
    {
        float _1392 = rsqrt(_1368);
        _1380 = _1392;
    }
    float _1394 = _1380;
    float _1396 = _1394;
    if (_1372)
    {
        float _1398 = _1376 * _1390;
        _1382 = _1398;
    }
    float _1400 = _1382;
    if (_1372)
    {
        float _1402 = _1400 * 0.15915493667125701904296875;
        _1384 = _1402;
    }
    float _1404 = _1384;
    float _1406 = _1344;
    if (_1372)
    {
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        _1406 = _1410;
    }
    float _1412 = _1406;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1390;
    float _1420 = _1416;
    if (_1372)
    {
        float _1422 = _1404 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        _1418 = _1424;
    }
    float _1426 = _1418;
    float _1428 = -_1358;
    float _1430 = -_1416;
    float _1432 = fma(_1336, _1428, _1430);
    if (_1372)
    {
        float _1434 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1434;
    }
    float _1436 = _1386;
    float _1438 = sqrt(_1354);
    float _1440 = _1436;
    float _1442 = _1412;
    if (_1372)
    {
        float _1444 = fma(_1412, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (!_1372)
    {
        _1442 = _1360;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    float _1454 = _1426;
    if (_1372)
    {
        float _1456 = _1426 + (-1.0);
        _1420 = _1456;
    }
    float _1458 = _1420;
    float _1460 = _1458;
    if (_1372)
    {
        float _1462 = _1394 * _1446;
        _1192 = _1462;
    }
    float _1464 = _1192;
    if (!_1372)
    {
        _1448 = _1432;
    }
    float _1466 = _1448;
    float _1468 = _1466;
    if (_1372)
    {
        float _1470 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1470;
    }
    float _1472 = _1194;
    if (_1372)
    {
        float _1474 = _1360 * _1464;
        _1452 = _1474;
    }
    float _1476 = _1452;
    if (!_1372)
    {
        _1460 = _1362;
    }
    float _1478 = _1460;
    float _1480 = _1478;
    if (_1372)
    {
        float _1482 = _1362 * _1464;
        _1480 = _1482;
    }
    float _1484 = _1480;
    if (!_1372)
    {
        _1396 = _1364;
    }
    float _1486 = _1396;
    float _1488 = _1486;
    if (_1372)
    {
        float _1490 = fma(_1432, _1426, _1472);
        _1468 = _1490;
    }
    float _1492 = _1468;
    if (_1372)
    {
        float _1494 = _1476 * _1476;
        _1488 = _1494;
    }
    float _1496 = _1488;
    if (!_1372)
    {
        _1454 = _1366;
    }
    float _1498 = _1454;
    float _1500 = _1498;
    if (_1372)
    {
        float _1502 = _1484 * _1484;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1492, _1492, _1496);
    float _1508 = _1506 + _1504;
    float _1510 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1514 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1512);
    float _1516 = precise::clamp(_1514, 0.0, 1.0);
    float _1518 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1522 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1510);
    float _1524 = rsqrt(_1508);
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1522);
    float _1534 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1536 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1538 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1544 = abs(_1528);
    float _1546 = log2(_1544);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1536);
    float _1550 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1548);
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1560 = _1524 * _1476;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1524 * _1492;
    float _1566 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1572 = _1524 * _1484;
    float _1574 = -_1554;
    float _1576 = fma(_1574, _1520, 1.0);
    float _1578 = -_1568;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1584 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1586 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1588 = -_1572;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = log2(_1576);
    float _1596 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1590, -0.5, 0.5);
    float _1600 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1586);
    float _1602 = fma(_1590, 0.5, 0.5);
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = _1564 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = exp2(_1584);
    float _1612 = fma(_1602, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1614 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1616 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1618 = fma(_1602, _1612, -0.212114393711090087890625);
    float _1620 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1614);
    float _1622 = 1.0 / _1592;
    float _1624 = _1594 * 0.693147182464599609375;
    float _1626 = fma(_1602, _1618, 1.570728778839111328125);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1630 = sqrt(_1598);
    float _1632 = -_1564;
    float _1634 = fma(_1610, _1606, _1632);
    float _1636 = fma(_1634, 0.5, 0.5);
    float _1638 = _1620 * _1622;
    float _1640 = _1616 * _1622;
    float _1642 = fma(_1638, -0.5, 0.5);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1630 * 0.636619746685028076171875;
    float _1648 = -_1626;
    float _1650 = fma(_1646, _1648, 1.0);
    float3 _6474 = float3(_1644, _1642, _1628);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6474, float3(0.0), isnan(_6474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6474, float3(0.0), isnan(_6474)), level(0.0)).x;
    float3 _6485 = float3(_1644, _1642, _1628);
    float4 _1655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6485, float3(0.0), isnan(_6485)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6485, float3(0.0), isnan(_6485)), level(0.0)).xyzw;
    float _1657 = _1655.x;
    float _1659 = _1655.y;
    float _1661 = _1655.z;
    float _1663 = _1655.w;
    float2 _6502 = float2(_1650, _1636);
    float3 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).xyz;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1677 = int(_1675);
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1681 = _1679 != 0;
    float _1683 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1687 = _1685 != 0;
    float _1689 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1693 = _1691 != 0;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1697 = abs(_1206);
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1701 = int(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1705 = _1703 != 0;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1711 = int(_1709);
    float _1713 = float(_1677);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1727 = 1.0 / _1713;
    float _1729 = float(uint(_1701));
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1735 = ~_1701;
    int _1737 = _1735 + 1;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1743 = 1.0 / _1729;
    float _1745 = float(_1711);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1749 = _111 * _1727;
    float _1751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1753 = int(_1751);
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1148);
    int _1761 = abs(_1182);
    int _1763 = as_type<int>(_1743) + (-2);
    float _1765 = trunc(_1749);
    int _1767 = int(_1765);
    float _1769 = 1.0 / _1745;
    float _1771 = float(uint(_1753));
    int _1773 = ~_1753;
    int _1775 = _1773 + 1;
    int _1777 = ~_1753;
    int _1779 = _1777 + 1;
    float _1781 = float(uint(_1767));
    float _1783 = 1.0 / _1771;
    float _1785 = as_type<float>(_1763) * _1781;
    float _1787 = _111 * _1769;
    float _1789 = trunc(_1785);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = trunc(_1787);
    int _1797 = int(_1795);
    int _1799 = as_type<int>(_1783) + (-2);
    int _1801 = _1757 * int(_1793);
    int _1803 = _1801 + _1767;
    float _1805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1807 = int(_1805);
    float _1809 = float(uint(_1803));
    float _1811 = float(uint(_1797));
    float _1813 = as_type<float>(_1763) * _1809;
    float _1815 = float(_1767);
    float _1817 = 1.0 / _1717;
    float _1819 = float(_1797);
    float _1821 = as_type<float>(_1799) * _1811;
    float _1823 = float(_1807);
    float _1825 = trunc(_1821);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = trunc(_1813);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(_1701);
    bool _1839 = _1815 >= _1837;
    bool _1841 = isnan(_1815);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1837);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1775 * int(_1829);
    int _1853 = _1851 + _1797;
    float _1855 = _890 * _541;
    float _1857 = 1.0 / _1823;
    float _1859 = float(uint(_1853));
    int _1861 = int(_1793) + int(_1835);
    float _1863 = _892 * _894;
    float _1865 = as_type<float>(_1799) * _1859;
    float _1867 = floor(_1855);
    int _1869 = _1737 * _1861;
    int _1871 = _1869 + _1767;
    bool _1873 = uint(_1871) >= uint(_1701);
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = _111 * _1857;
    bool _1883 = !_1873;
    int _1885 = _1883 ? 0 : (-1);
    bool _1887 = _1701 == 0;
    int _1889 = ~_1861;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    float _1895 = trunc(_1849);
    int _1897 = int(_1895);
    float _1899 = -_1867;
    float _1901 = _1855 + _1899;
    float _1903 = _285 * _1837;
    int _1905 = _1701 * _1893;
    int _1907 = _1905 + _1767;
    float _1909 = _1901 * _1837;
    float _1911 = float(_1753);
    int _1913 = int(_1829) + int(_1879);
    float _1915 = floor(_1863);
    int _1917 = ~_1753;
    int _1919 = _1917 + 1;
    bool _1921 = !_1887;
    int _1923 = _1921 ? _1907 : (-1);
    bool _1925 = _1819 >= _1911;
    bool _1927 = isnan(_1819);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1911);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    int _1937 = _1919 * _1913;
    int _1939 = _1937 + _1797;
    int _1941 = ~_1897;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = trunc(_1903);
    int _1949 = int(_1947);
    bool _1951 = !_1693;
    int _1953 = _1951 ? 0 : 1;
    bool _1955 = uint(_1939) >= uint(_1753);
    int _1957 = _1923 * _1945;
    int _1959 = abs(_1092);
    int _1961 = abs(_1953);
    float _1963 = trunc(_1909);
    int _1965 = int(_1963);
    int _1967 = _1701 + (-1);
    float _1969 = -_1915;
    float _1971 = _1863 + _1969;
    int _1973 = ~_1701;
    int _1975 = _1973 + 1;
    int _1977 = _1897 * _1967;
    int _1979 = _1977 + _1957;
    int _1981 = abs(_1104);
    float _1983 = trunc(_1935);
    int _1985 = int(_1983);
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1979 * _1959;
    bool _1993 = _1753 == 0;
    int _1995 = ~_1913;
    int _1997 = _1995 + _1989;
    int _1999 = _1997 + 1;
    int _2001 = _1949 * _1981;
    int _2003 = _2001 + _1991;
    int _2005 = abs(_1110);
    int _2007 = _1965 * _1961;
    int _2009 = _2007 + _1767;
    float _2011 = _1971 * _1911;
    int _2013 = _1753 * _1999;
    int _2015 = _2013 + _1797;
    bool _2017 = !_1681;
    float _2019 = _2017 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2021 = _285 * _1911;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2025 = _2023 != 0;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2029 = int(_2027);
    bool _2031 = !_1993;
    int _2033 = _2031 ? _2015 : (-1);
    int _2035 = ~_1985;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(as_type<int>(_2019));
    float _2043 = _2019;
    bool _2045 = _1687;
    if (_1705)
    {
        float _2047 = _541 * 3.1415927410125732421875;
        _2043 = _2047;
    }
    float _2049 = _2043;
    int _2051 = abs(_1168);
    float _2053 = trunc(_2011);
    int _2055 = int(_2053);
    int _2057 = _2033 * _2039;
    int _2059 = _2009 * _2005;
    int _2061 = _2059 + _2003;
    bool _2063 = !_2025;
    int _2065 = _2063 ? 0 : 1;
    float _2067 = _2049;
    if (_1705)
    {
        float _2069 = _2049 * 0.15915493667125701904296875;
        _2067 = _2069;
    }
    float _2071 = _2067;
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2075 = _2073 != 0;
    int _2077 = _1965 * _2041;
    int _2079 = _2077 + _2061;
    float _2081 = trunc(_2021);
    int _2083 = int(_2081);
    int _2085 = _1753 + (-1);
    int _2087 = abs(_2065);
    int _2089 = _1985 * _2085;
    int _2091 = _2089 + _2057;
    int _2093 = abs(_1210);
    int _2095 = _2055 * _2087;
    int _2097 = _2095 + _1797;
    bool _2099 = !_1687;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = _2091 * _2051;
    float _2105 = trunc(_1881);
    int _2107 = int(_2105);
    float _2109 = float(uint(_2079));
    float _2111 = as_type<float>(_1697);
    float _2113 = _2071;
    if (_2075)
    {
        float _2115 = in.m_56.w;
        _2111 = _2115;
    }
    float _2117 = _2111;
    int _2119 = abs(_2101);
    int _2121 = _2083 * _1697;
    int _2123 = _2121 + _2103;
    float _2125 = as_type<float>(_1763) * _2109;
    if (_1705)
    {
        float _2127 = _2071 * 6.283185482025146484375;
        float _2129 = sin(_2127);
        _2113 = _2129;
    }
    float _2131 = _2113;
    float _2133 = float(uint(_2009));
    int _2135 = _2097 * _2093;
    int _2137 = _2135 + _2123;
    float _2139 = float(uint(_2029));
    int _2141 = ~_1701;
    int _2143 = _2141 + 1;
    int _2145 = _2055 * _2119;
    int _2147 = _2145 + _2137;
    int _2149 = ~_1701;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2125);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1763) * _2133;
    float _2161 = 0.0;
    if (!_2075)
    {
        _2161 = _205;
    }
    float _2163 = _2161;
    float _2165 = float(uint(_2147));
    float _2167 = trunc(_2159);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = as_type<float>(_1799) * _2165;
    float _2175 = _2165;
    float _2177 = as_type<float>(_2151);
    float _2179 = _2163;
    if (_2075)
    {
        float _2181 = _2117 * 3.1415927410125732421875;
        _2175 = _2181;
    }
    float _2183 = _2175;
    int _2185 = ~_1753;
    int _2187 = _2185 + 1;
    int _2189 = _2151 * int(_2157);
    int _2191 = _2189 + _2079;
    float _2193 = trunc(_2173);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    if (_2075)
    {
        float _2199 = _2183 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = float(uint(_2191));
    float _2205 = float(uint(_2097));
    int _2207 = _2143 * int(_2171);
    int _2209 = _2207 + _2009;
    float _2211 = _2201;
    if (_2075)
    {
        float _2213 = _2201 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = as_type<float>(_1763) * _2203;
    float _2221 = as_type<float>(_1799) * _2205;
    float _2223 = float(uint(_2209));
    float _2225 = trunc(_2219);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    int _2231 = _2187 * int(_2197);
    int _2233 = _2231 + _2147;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2235 = as_type<float>(_1763) * _2223;
    float _2237 = float(uint(_2233));
    float _2239 = 1.0 / _2139;
    if (_2075)
    {
        bool _2241 = _2217 > 0.5;
        _2045 = _2241;
    }
    bool _2243 = _2045;
    float _2245 = as_type<float>(_1799) * _2237;
    float _2247 = _2245;
    if (_2075)
    {
        float _2249 = -_205;
        float _2251 = _2243 ? _2249 : _205;
        _2179 = _2251;
    }
    float _2253 = _2179;
    float _2255 = float(uint(_2107));
    float _2257 = trunc(_2221);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    int _2263 = int(_2157) + int(_2229);
    int _2265 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2245);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = _1975 * _2263;
    int _2277 = _2275 + _2079;
    int _2279 = as_type<int>(_2239) + (-2);
    int _2281 = ~_1753;
    int _2283 = _2281 + 1;
    bool _2285 = uint(_2277) >= uint(_1701);
    float _2287 = as_type<float>(_2279) * _2255;
    int _2289 = _1779 * int(_2261);
    int _2291 = _2289 + _2097;
    float _2293 = trunc(_2235);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : (-1);
    bool _2303 = _2285;
    if (_1705)
    {
        bool _2305 = _2131 > 0.5;
        _2303 = _2305;
    }
    bool _2307 = _2303;
    float _2309 = float(uint(_2291));
    int _2311 = ~_2263;
    int _2313 = _2311 + _2301;
    int _2315 = _2313 + 1;
    float _2317 = trunc(_2287);
    float _2319 = precise::max(_2317, 0.0);
    uint _2321 = uint(_2319);
    int _2323 = int(_2197) + int(_2273);
    float _2325 = as_type<float>(_1799) * _2309;
    int _2327 = _1701 * _2315;
    int _2329 = _2327 + _2079;
    if (!_1705)
    {
        _2247 = _209;
    }
    float _2331 = _2247;
    int _2333 = ~_2029;
    int _2335 = _2333 + 1;
    int _2337 = _2283 * _2323;
    int _2339 = _2337 + _2147;
    float _2341 = _2331;
    if (_1705)
    {
        float _2343 = -_209;
        float _2345 = _2307 ? _2343 : _209;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = 1.0 / _1721;
    bool _2351 = !_1887;
    int _2353 = _2351 ? _2329 : (-1);
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2357 = _2355 != 0;
    float _2359 = -_205;
    int _2361 = _1346 ? as_type<int>(_2359) : as_type<int>(_205);
    int _2363 = _2335 * int(_2321);
    int _2365 = _2363 + _2107;
    bool _2367 = uint(_2339) >= uint(_1753);
    float _2369 = 1.0 / _1725;
    int _2371 = _2353 & 3;
    bool _2373 = _2371 != 0;
    bool _2375 = !_2357;
    float _2377 = _2375 ? _205 : as_type<float>(_2361);
    bool _2379 = !_2367;
    int _2381 = _2379 ? 0 : (-1);
    bool _2383 = uint(_2371) > 1u;
    float _2385 = 1.0 / _1733;
    float _2387 = float(uint(_2365));
    int _2389 = ~_2323;
    int _2391 = _2389 + _2381;
    int _2393 = _2391 + 1;
    int _2395 = int(_2171) + int(_2297);
    float _2397 = as_type<float>(_2279) * _2387;
    int _2399 = ~_1701;
    int _2401 = _2399 + 1;
    int _2403 = _1753 * _2393;
    int _2405 = _2403 + _2147;
    int _2407 = _2353 & 3;
    bool _2409 = _2407 != 0;
    float _2411 = trunc(_2397);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    float _2417 = -_209;
    int _2419 = _1350 ? as_type<int>(_2417) : as_type<int>(_209);
    int _2421 = _2401 * _2395;
    int _2423 = _2421 + _2009;
    int _2425 = _2409 ? 0 : 1;
    bool _2427 = _2371 != 3;
    bool _2429 = uint(_2371) >= 2u;
    float _2431 = trunc(_2325);
    float _2433 = precise::max(_2431, 0.0);
    uint _2435 = uint(_2433);
    bool _2437 = !_1993;
    int _2439 = _2437 ? _2405 : (-1);
    int _2441 = ~_2425;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = _2445;
    if (!_2383)
    {
        int _2449 = ~_2425;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = _2429 ? 0 : 1;
    float _2457 = 1.0 / _1741;
    bool _2459 = uint(_2423) >= uint(_1701);
    int _2461 = _2439 & 3;
    bool _2463 = _2461 != 0;
    bool _2465 = !_2459;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = uint(_2461) > 1u;
    float _2471 = exp2(_1689);
    int _2473 = ~_2455;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2427)
    {
        int _2481 = ~_2455;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2439 & 3;
    bool _2489 = _2487 != 0;
    int _2491 = int(_2321) + int(_2415);
    int _2493 = ~_2029;
    int _2495 = _2493 + 1;
    int _2497 = _2489 ? 0 : 1;
    bool _2499 = _2461 != 3;
    int _2501 = _2495 * _2491;
    int _2503 = _2501 + _2107;
    bool _2505 = !_2267;
    float _2507 = _2505 ? _209 : as_type<float>(_2419);
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2509;
    int _2513 = ~_1753;
    int _2515 = _2513 + 1;
    float _2517 = -_2471;
    float _2519 = _2517 + 1.0;
    int _2521 = int(_2261) + int(_2435);
    float _2523 = _2511 * _1817;
    int _2525 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2527 = _2525 != 0;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2533 = ~_2497;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    float _2539 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2541 = !_2463;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = _2531 * _2385;
    bool _2547 = uint(_2461) >= 2u;
    float _2549 = _2539 * _1652;
    int _2551 = _2537;
    if (!_2469)
    {
        int _2553 = ~_2497;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    bool _2559 = _2461 != 3;
    int _2561 = _2515 * _2521;
    int _2563 = _2561 + _2097;
    int _2565 = _2547 ? 0 : 1;
    float _2567 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2569 = uint(_2503) >= uint(_2029);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = -_1747;
    float _2577 = fma(_2567, 2.0, _2575);
    bool _2579 = uint(_2563) >= uint(_1753);
    int _2581 = ~_2565;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = _2585;
    if (_2499)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    float _2595 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2597 = _541 > 0.5;
    bool _2599 = !_2579;
    int _2601 = _2599 ? 0 : (-1);
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2605 = _2603 != 0;
    float _2607 = -_205;
    int _2609 = _2597 ? as_type<int>(_2607) : as_type<int>(_205);
    bool _2611 = !_2569;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : 1;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2527;
    float _2633 = _2631 ? _205 : as_type<float>(_2609);
    float _2635 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2637 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2639 = isnan(_782);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2635);
    float _2651 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1695);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2657 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2659;
    float _2663 = _2655 * _2349;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2677 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2679 = isnan(_782);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2685);
    float _2689 = _2667 * _2369;
    float _2691 = 1.0 / _2671;
    bool _2693 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2695 = isnan(_782);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2701 = _2697 || _2699;
    float _2703 = float(_2701);
    float _2705 = _2661 * _2457;
    float _2707 = -_2687;
    float _2709 = _2707 + 1.0;
    float _2711 = -_2647;
    float _2713 = _2711 + 1.0;
    float _2715 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2717 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2719 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2721 = 1.0 / _2675;
    float _2723 = _2687 * _2713;
    bool _2725 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2727 = isnan(_782);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2733 = _2729 || _2731;
    float _2735 = float(_2733);
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2741;
    bool _2745 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2747 = isnan(_782);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    out.m_70.x = _2715;
    out.m_70.y = _2717;
    out.m_70.z = _2719;
    bool _2757 = _896 != 1;
    float _2759 = _2739 * _2691;
    float _2761 = _2703 * _2709;
    float _2763 = fma(_1683, _1683, 1.0);
    float _2765 = -_2703;
    float _2767 = _2765 + 1.0;
    bool _2769 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2771 = isnan(_782);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = -_111;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2577);
    float _2789 = _2735 * _2767;
    float _2791 = rsqrt(_2763);
    float _2793 = _2743 * _2721;
    float _2795 = -_2735;
    float _2797 = _2795 + 1.0;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2801 = _782 + _2799;
    float _2803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2805 = _782 + _2803;
    bool _2807 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2809 = isnan(_782);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = _2755 * _2797;
    float _2821 = fma(_2523, _2801, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2823 = fma(_2663, _2805, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2825 = _2779 * _2783;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2829 = _782 + _2827;
    bool _2831 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2833 = isnan(_782);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = -_2779;
    float _2845 = _2843 + 1.0;
    float _2847 = -_2817;
    float _2849 = _2847 + 1.0;
    float _2851 = fma(_2705, _2829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2855 = _782 + _2853;
    float _2857 = _2817 * _2845;
    float _2859 = _2841 * _2849;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2863 = _782 + _2861;
    float _2865 = _1683 * _2791;
    float _2867 = fma(_2689, _2855, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2869 = _2821 * _2859;
    float _2871 = fma(_2545, _2863, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2875 = _2865 * _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2879 = _2865 * _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2883 = _2865 * _2881;
    float _2885 = -_2841;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2875);
    float _2891 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2879);
    float _2893 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2883);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2897 = _782 + _2895;
    float _2899 = _2633 + 0.5;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2903 = _782 + _2901;
    float _2905 = fma(_2887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2869);
    out.m_72.x = _2889;
    out.m_72.y = _2891;
    out.m_72.z = _2893;
    float _2907 = fma(_2899, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2787);
    float _2909 = fma(_2759, _2897, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2911 = fma(_2793, _2903, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2913 = fma(_2823, _2857, _2905);
    float _2915 = _890 * _898;
    float _2917 = _2903;
    float _2919 = _2823;
    float _2921 = _2759;
    if (!_2757)
    {
        _2917 = _888;
    }
    float _2923 = _2917;
    float _2925 = fma(_2851, _2825, _2913);
    float _2927 = _2923;
    if (!_2757)
    {
        _2919 = _888;
    }
    float _2929 = _2919;
    float _2931 = floor(_2915);
    float _2933 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2935 = fma(_2871, _2819, _2925);
    float _2937 = _2929;
    if (!_2757)
    {
        _1196 = _788;
    }
    float _2939 = _1196;
    float _2941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2943 = _2939;
    if (!_2757)
    {
        _2921 = _788;
    }
    float _2945 = _2921;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2949 = _2945;
    if (_2757)
    {
        _2927 = _541;
    }
    float _2951 = _2927;
    float _2953 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2941);
    if (_2757)
    {
        _2937 = _541;
    }
    float _2955 = _2937;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (_2757)
    {
        _2943 = _888;
    }
    float _2959 = _2943;
    float _2961 = fma(_2933, -2.0, _2947);
    if (_2757)
    {
        _2949 = _888;
    }
    float _2963 = _2949;
    float _2965 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2957);
    bool _2967 = _902 != 2;
    float _2969 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2971 = -_2931;
    float _2973 = _2915 + _2971;
    float _2975 = fma(_2867, _2789, _2935);
    float _2977 = float(_2107);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = float(_2029);
    float _2985 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2979);
    float _2987 = -_2981;
    float _2989 = fma(_2969, 2.0, _2987);
    bool _2991 = _2977 >= _2983;
    bool _2993 = isnan(_2977);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3005 = ~_2491;
    int _3007 = _3005 + _2613;
    int _3009 = _3007 + 1;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _3015 = _2969;
    if (_2967)
    {
        _3013 = _541;
    }
    float _3017 = _3013;
    float _3019 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2961);
    float _3021 = trunc(_3001);
    int _3023 = int(_3021);
    float _3025 = _3017;
    if (_2967)
    {
        _3015 = _888;
    }
    float _3027 = _3015;
    int _3029 = _2029 * _3009;
    int _3031 = _3029 + _2107;
    float _3033 = _3027;
    if (!_2967)
    {
        _3025 = _788;
    }
    float _3035 = _3025;
    float _3037 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3003);
    if (!_2967)
    {
        _3033 = _541;
    }
    float _3039 = _3033;
    float _3041 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3011);
    bool _3043 = _2029 == 0;
    float _3045 = _2973 * _2983;
    float _3047 = _285 * _2983;
    int _3049 = _2029 + (-1);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3053 = !_3043;
    int _3055 = _3053 ? _3031 : (-1);
    float _3057 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2965);
    float _3059 = trunc(_3045);
    int _3061 = int(_3059);
    float _3063 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3065 = ~_3023;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    float _3071 = -_3057;
    float _3073 = _3071 + 1.0;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3077 = abs(_1128);
    int _3079 = _3055 * _3069;
    float _3081 = trunc(_3047);
    int _3083 = int(_3081);
    int _3085 = abs(_2617);
    float _3087 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3075);
    int _3089 = _3023 * _3049;
    int _3091 = _3089 + _3079;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3095 = _904 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3097 = _3091 * _3077;
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3101 = fma(_3095, -2.0, _3093);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3105 = abs(_1178);
    int _3107 = _3061 * _3085;
    int _3109 = _3107 + _2107;
    float _3111 = _2253 + 0.5;
    int _3113 = _3083 * _1759;
    int _3115 = _3113 + _3097;
    float _3117 = -_111;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2989);
    float _3121 = _2347 + (-0.5);
    float _3123 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3101);
    float _3125 = -_3103;
    float _3127 = fma(_3051, 2.0, _3125);
    float _3129 = fma(_3111, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3119);
    float _3131 = -_3121;
    float _3133 = -_3123;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3133);
    int _3137 = _3109 * _3105;
    int _3139 = _3137 + _3115;
    float _3141 = _2507 + (-0.5);
    float _3143 = _2951 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3145 = _3061 * _1761;
    int _3147 = _3145 + _3139;
    float _3149 = -_3141;
    float _3151 = -_3019;
    float _3153 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3151);
    float _3155 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3159 = float(uint(_3147));
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2953);
    float _3169 = as_type<float>(_2279) * _3159;
    float _3171 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3087);
    float _3173 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3175 = float(uint(_3109));
    float _3177 = fma(_3063, -2.0, _3157);
    float _3179 = -_3171;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_3173, -2.0, _3161);
    float _3185 = trunc(_3169);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_2279) * _3175;
    float _3193 = -_3073;
    float _3195 = fma(_3193, _2253, _3129);
    int _3197 = _2439 >> 31;
    float _3199 = fma(_3181, _2347, _3135);
    int _3201 = ~_2029;
    int _3203 = _3201 + 1;
    float _3205 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3163);
    int _3207 = _3197 & 3;
    float _3209 = trunc(_3191);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    out.m_74.x = _3195;
    out.m_74.y = _3199;
    int _3215 = ~_2029;
    int _3217 = _3215 + 1;
    float _3219 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3099);
    int _3221 = _2439 + _3207;
    float _3223 = -_3165;
    float _3225 = fma(_3143, 2.0, _3223);
    float _3227 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3041);
    float _3229 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2985);
    int _3231 = _3203 * int(_3189);
    int _3233 = _3231 + _3147;
    float _3235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3237 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3205);
    int _3239 = _3221 >> 2;
    float _3241 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3219);
    float _3243 = float(uint(_3233));
    float _3245 = -_111;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3225);
    int _3249 = _3239 << 4;
    int _3251 = _3249 + 656;
    int _3253 = _3217 * int(_3213);
    int _3255 = _3253 + _3109;
    float _3257 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3177);
    float _3259 = as_type<float>(_2279) * _3243;
    uint _3261 = uint(int(uint(_3251) >> uint(2)));
    uint _3263 = uint(int(uint(int(_3261)) >> uint(2)));
    int _3265 = int(_3261) & 3;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[int(_3263)][_3265];
    int _3269 = int(_3261) + 1;
    uint _3271 = uint(int(uint(_3269) >> uint(2)));
    int _3273 = _3269 & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    float _3277 = -_111;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3127);
    float _3281 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3183);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3285 = fma(_2909, _2761, _2975);
    float _3287 = float(uint(_3255));
    float _3289 = _3235 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3291 = -_3241;
    float _3293 = _3291 + 1.0;
    int _3295 = _3251 + 8;
    uint _3297 = uint(int(uint(_3295) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    float _3313 = fma(_2911, _2723, _3285);
    float _3315 = as_type<float>(_2279) * _3287;
    float _3317 = trunc(_3259);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2377 + 0.5;
    float _3325 = _1026 + (-0.5);
    float _3327 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3313);
    int _3329 = abs(_2543);
    float _3331 = fma(_3289, _3323, _3247);
    float _3333 = -_3155;
    float _3335 = _3333 + 1.0;
    float _3337 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3341 = ~_2521;
    int _3343 = _3341 + _2601;
    int _3345 = _3343 + 1;
    float _3347 = -_3335;
    float _3349 = fma(_2633, _3347, _2907);
    int _3351 = ~_2029;
    int _3353 = _3351 + 1;
    float _3355 = -_3339;
    float _3357 = -_3257;
    float _3359 = fma(_3355, _3325, _3357);
    float _3361 = -_3167;
    float _3363 = _3361 + 1.0;
    float _3365 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    int _3367 = abs(_2557);
    float _3369 = fma(_1026, _3293, _3359);
    int _3371 = int(_3189) + int(_3321);
    float _3373 = -_3237;
    float _3375 = _3373 + 1.0;
    float _3377 = fma(_2507, _3363, _3153);
    bool _3379 = !_2625;
    int _3381 = _3379 ? 0 : 1;
    float _3383 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3385 = int(_3383);
    float _3387 = -_3375;
    float _3389 = fma(_2377, _3387, _3331);
    int _3391 = _3353 * _3371;
    int _3393 = _3391 + _3147;
    int _3395 = ~_2029;
    int _3397 = _3395 + 1;
    int _3399 = _1753 * _3345;
    int _3401 = _3399 + _2097;
    int _3403 = abs(_3381);
    out.m_76.x = _3349;
    out.m_76.y = _3377;
    out.m_76.z = _3389;
    out.m_76.w = _3369;
    bool _3405 = uint(_3393) >= uint(_2029);
    float _3407 = trunc(_3315);
    float _3409 = precise::max(_3407, 0.0);
    uint _3411 = uint(_3409);
    bool _3413 = !_1993;
    int _3415 = _3413 ? _3401 : (-1);
    float _3417 = -_3227;
    float _3419 = _3417 + 1.0;
    bool _3421 = !_3405;
    int _3423 = _3421 ? 0 : (-1);
    float _3425 = -_3229;
    float _3427 = _3425 + 1.0;
    int _3429 = ~_2395;
    int _3431 = _3429 + _2467;
    int _3433 = _3431 + 1;
    float _3435 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    int _3437 = ~_3371;
    int _3439 = _3437 + _3423;
    int _3441 = _3439 + 1;
    int _3443 = abs(_2485);
    int _3445 = _1701 * _3433;
    int _3447 = _3445 + _2009;
    int _3449 = ~_3385;
    int _3451 = _3449 + 1;
    int _3453 = _2029 * _3441;
    int _3455 = _3453 + _3147;
    float _3457 = _1673 * _2549;
    int _3459 = ~_3367;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    out.m_78.x = _3327;
    int _3465 = _2353 >> 31;
    int _3467 = abs(_2593);
    int _3469 = _3463 * as_type<int>(_3275);
    int _3471 = ~_3329;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    int _3477 = _3465 & 3;
    int _3479 = ~_3467;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    int _3485 = _3475 * as_type<int>(_3267);
    int _3487 = _3485 + _3469;
    int _3489 = _2353 + _3477;
    int _3491 = abs(_2573);
    int _3493 = _3483 * as_type<int>(_3303);
    int _3495 = _3493 + _3487;
    int _3497 = abs(_3385);
    int _3499 = _3489 >> 2;
    float _3501 = float(uint(_3385));
    int _3503 = ~_3491;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    float _3509 = float(uint(_3497));
    float _3511 = 1.0 / _3501;
    int _3513 = _3499 << 4;
    int _3515 = _3513 + 368;
    int _3517 = _3507 * as_type<int>(_3311);
    int _3519 = _3517 + _3495;
    int _3521 = int(_3213) + int(_3411);
    bool _3523 = !_3043;
    int _3525 = _3523 ? _3455 : (-1);
    int _3527 = ~_3403;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3397 * _3521;
    int _3535 = _3533 + _3109;
    uint _3537 = uint(int(uint(_3515) >> uint(2)));
    uint _3539 = uint(int(uint(int(_3537)) >> uint(2)));
    int _3541 = int(_3537) & 3;
    float _3543 = (*spvDescriptorSet0.vp_c9)._m0[int(_3539)][_3541];
    int _3545 = int(_3537) + 1;
    uint _3547 = uint(int(uint(_3545) >> uint(2)));
    int _3549 = _3545 & 3;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[int(_3547)][_3549];
    int _3553 = _3525 >> 31;
    float _3555 = 1.0 / _3509;
    int _3557 = _3519 * _3531;
    bool _3559 = uint(_3535) >= uint(_2029);
    int _3561 = _3553 & 3;
    int _3563 = _3415 * _3403;
    int _3565 = _3563 + _3557;
    bool _3567 = !_3559;
    int _3569 = _3567 ? 0 : (-1);
    int _3571 = _3515 + 8;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3525 + _3561;
    int _3591 = _3525 & 3;
    bool _3593 = _3591 != 0;
    int _3595 = _3525 & 3;
    bool _3597 = _3595 != 0;
    int _3599 = _3589 >> 2;
    int _3601 = as_type<int>(_3511) + (-2);
    float _3603 = float(uint(_3565));
    int _3605 = _3593 ? 0 : 1;
    bool _3607 = uint(_3595) > 1u;
    float _3609 = as_type<float>(_3601) * _3603;
    int _3611 = as_type<int>(_3555) + (-2);
    int _3613 = _3599 << 4;
    int _3615 = _3613 + 800;
    int _3617 = abs(_3565);
    float _3619 = trunc(_3609);
    float _3621 = precise::max(_3619, 0.0);
    uint _3623 = uint(_3621);
    uint _3625 = uint(int(uint(_3615) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = ~_3605;
    int _3643 = _3641 + 1;
    int _3645 = _3643 + 1;
    float _3647 = float(uint(_3617));
    int _3649 = _3645;
    if (!_3607)
    {
        int _3651 = ~_3605;
        int _3653 = _3651 + 1;
        _3649 = _3653;
    }
    int _3655 = _3649;
    float _3657 = as_type<float>(_3611) * _3647;
    int _3659 = ~_3521;
    int _3661 = _3659 + _3569;
    int _3663 = _3661 + 1;
    int _3665 = _3615 + 8;
    uint _3667 = uint(int(uint(_3665) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = uint(_3595) >= 2u;
    int _3685 = abs(_2453);
    float _3687 = trunc(_3657);
    float _3689 = precise::max(_3687, 0.0);
    uint _3691 = uint(_3689);
    int _3693 = _3451 * int(_3623);
    int _3695 = _3693 + _3565;
    int _3697 = _3683 ? 0 : 1;
    int _3699 = _2029 * _3663;
    int _3701 = _3699 + _3109;
    int _3703 = ~_3685;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    bool _3709 = _3595 != 3;
    float _3711 = float(uint(_3695));
    int _3713 = _3707 * as_type<int>(_3551);
    bool _3715 = !_2373;
    int _3717 = _3715 ? 0 : 1;
    bool _3719 = !_3597;
    int _3721 = _3719 ? 0 : 1;
    float _3723 = as_type<float>(_3601) * _3711;
    int _3725 = ~_3497;
    int _3727 = _3725 + 1;
    int _3729 = abs(_3717);
    float _3731 = trunc(_3723);
    float _3733 = precise::max(_3731, 0.0);
    uint _3735 = uint(_3733);
    int _3737 = ~_3697;
    int _3739 = _3737 + 1;
    int _3741 = _3739 + 1;
    int _3743 = abs(_3721);
    int _3745 = _3741;
    if (_3709)
    {
        int _3747 = ~_3697;
        int _3749 = _3747 + 1;
        _3745 = _3749;
    }
    int _3751 = _3745;
    int _3753 = _3727 * int(_3691);
    int _3755 = _3753 + _3617;
    int _3757 = abs(_3655);
    int _3759 = ~_3729;
    int _3761 = _3759 + 1;
    int _3763 = _3761 + 1;
    int _3765 = abs(_3751);
    float _3767 = float(uint(_3755));
    int _3769 = _3763 * as_type<int>(_3543);
    int _3771 = _3769 + _3713;
    float _3773 = _1616 + _1592;
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    float _3781 = as_type<float>(_3611) * _3767;
    int _3783 = ~_3443;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    int _3789 = ~_3743;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    int _3795 = _3779 * as_type<int>(_3639);
    int _3797 = ~_3765;
    int _3799 = _3797 + 1;
    int _3801 = _3799 + 1;
    int _3803 = _3787 * as_type<int>(_3579);
    int _3805 = _3803 + _3771;
    float _3807 = _1592 * 0.5;
    float _3809 = trunc(_3781);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    bool _3815 = _2371 != 3;
    int _3817 = _3793 * as_type<int>(_3631);
    int _3819 = _3817 + _3795;
    float _3821 = fma(_1620, -0.5, _3807);
    bool _3823 = _3595 != 3;
    bool _3825 = !_3815;
    int _3827 = _3825 ? 0 : (-1);
    int _3829 = _3801 * as_type<int>(_3673);
    int _3831 = _3829 + _3819;
    float _3833 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3435);
    bool _3835 = !_3823;
    int _3837 = _3835 ? 0 : (-1);
    int _3839 = abs(_3827);
    float _3841 = _3833 + _1592;
    int _3843 = int(_3623) + int(_3735);
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _1592;
    int _3845 = ~_3385;
    int _3847 = _3845 + 1;
    int _3849 = abs(_3837);
    float _3851 = _3841 * 0.5;
    int _3853 = int(_3691) + int(_3813);
    int _3855 = ~_3497;
    int _3857 = _3855 + 1;
    bool _3859 = _3385 == 0;
    bool _3861 = !_1887;
    int _3863 = _3861 ? _3447 : (-1);
    int _3865 = _3847 * _3843;
    int _3867 = _3865 + _3565;
    float _3869 = _3773 * 0.5;
    int _3871 = _3857 * _3853;
    int _3873 = _3871 + _3617;
    int _3875 = ~_3839;
    int _3877 = _3875 + 1;
    int _3879 = _3877 + 1;
    float _3881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3883 = uint(_3867) >= uint(_3385);
    out.m_80.x = _3869;
    out.m_80.y = _3821;
    out.m_80.z = _3851;
    out.m_80.w = _1592;
    int _3885 = ~_3849;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3879 * as_type<int>(_3587);
    int _3893 = _3891 + _3805;
    bool _3895 = !_2621;
    int _3897 = _3895 ? 0 : 1;
    bool _3899 = !_3883;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = _3889 * as_type<int>(_3681);
    int _3905 = _3903 + _3831;
    bool _3907 = uint(_3873) >= uint(_3497);
    int _3909 = abs(_3897);
    int _3911 = ~_3843;
    int _3913 = _3911 + _3901;
    int _3915 = _3913 + 1;
    int _3917 = _3565 ^ _3385;
    float _3919 = _3881 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3921 = !_3907;
    int _3923 = _3921 ? 0 : (-1);
    bool _3925 = _3385 == 0;
    int _3927 = _3385 * _3915;
    int _3929 = _3927 + _3565;
    uint _3931 = uint(int(uint(_3917) >> uint(31)));
    bool _3933 = !_2629;
    int _3935 = _3933 ? 0 : 1;
    int _3937 = ~_3923;
    int _3939 = _3853 + _3937;
    int _3941 = _3939 + 1;
    int _3943 = ~int(_3931);
    int _3945 = _3943 + 1;
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3949 = abs(_3935);
    bool _3951 = !_3925;
    int _3953 = _3951 ? _3929 : (-1);
    int _3955 = _3941 ^ _3945;
    float _3957 = float(_3953);
    int _3959 = ~_3945;
    int _3961 = _3959 + _3955;
    int _3963 = _3961 + 1;
    float _3965 = _966 + 0.5;
    int _3967 = ~_3909;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3919, _3957, _3279);
    bool _3975 = !_3859;
    int _3977 = _3975 ? _3963 : (-1);
    bool _3979 = !_3043;
    int _3981 = _3979 ? _3701 : (-1);
    float _3983 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3985 = float(_3977);
    int _3987 = _3893 * _3971;
    int _3989 = ~_3949;
    int _3991 = _3989 + 1;
    int _3993 = _3991 + 1;
    float _3995 = fma(_3919, _3965, _3973);
    bool _3997 = _1332 > 0.0;
    bool _3999 = isnan(_1332);
    bool _4001 = _3997 || _3999;
    bool _4003 = isnan(0.0);
    bool _4005 = _4001 || _4003;
    float _4007 = -_3281;
    float _4009 = fma(_3983, _3985, _4007);
    float _4011 = _960 + (-0.5);
    int _4013 = _3863 * _3909;
    int _4015 = _4013 + _3987;
    float _4017 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _4019 = _3905 * _3993;
    float _4021 = -_3983;
    float _4023 = fma(_4021, _4011, _4009);
    float _4025 = _1663 * _2549;
    float _4027 = float(_4015);
    int _4029 = _3981 * _3949;
    int _4031 = _4029 + _4019;
    float _4033 = -_2539;
    float _4035 = _4033 + 1.0;
    float _4037 = -_3419;
    float _4039 = fma(_966, _4037, _3995);
    float _4041 = fma(_960, _3427, _4023);
    out.m_82.x = _4027;
    float _4043 = float(_4031);
    float _4045 = _4017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_1669, _4025, _1657);
    float _4049 = fma(_1671, _4025, _1659);
    float _4051 = _1663 * _4035;
    float _4053 = fma(_1663, _3457, _1661);
    out.m_82.w = _4043;
    out.m_84.x = _4039;
    out.m_84.y = _4041;
    out.m_49.x = _4045;
    out.m_86.x = _4047;
    out.m_86.y = _4049;
    out.m_86.z = _4053;
    out.m_86.w = _4051;
    if (_4005)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _780 = false;
    bool _609 = false;
    bool _423 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_42.w;
    float _102 = in.m_44.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = as_type<float>(_107);
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _117;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4123 = as_type<float>(_127);
        out.gl_Position.z = _4123;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_102);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_107);
    bool _143 = _111 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    float _149 = 0.0;
    if (_147)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_147)
    {
        out.m_49.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _129 = as_type<int>(_153);
    }
    int _155 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_155);
        out.gl_Position.z = _4178;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _141;
    float _161 = in.m_54.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_44.x;
    float _175 = in.m_44.y;
    float _177 = in.m_44.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_157) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_157) & 2;
    bool _191 = _189 != 0;
    float _193 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * _193;
        float _199 = _197 * 0.5;
        _149 = _199;
    }
    float _201 = _149;
    bool _203 = !_187;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_191;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = _201;
    if (!_171)
    {
        float _213 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_171;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _193 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _193);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_171;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _193 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _195 = _273;
    }
    float _275 = _195;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _279 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _285 = _111 * _159;
    float _287 = fma(_275, _173, _279);
    float _289 = fma(_275, _175, _281);
    float _291 = fma(_275, _177, _283);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_277;
    float _317;
    if (!_299)
    {
        float _301 = in.m_56.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        _317 = _285;
    }
    _319 = false;
    float _321 = _317;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    float _327 = in.m_54.x;
    float _329 = in.m_54.y;
    bool _331 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _333 = isnan(_321);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _343;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = 1.0 / _345;
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _371 = _357 * _361;
    float _373 = -_357;
    float _375 = _373 + 1.0;
    float _377 = _325 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = _383 * _371;
    float _389 = _385 * _371;
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].x, _387);
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[143].y, _389);
    float _395 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].x, _391);
    float _397 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[144].y, _393);
    float _399 = _395 * _327;
    float _401 = _397 * _329;
    bool _403 = !_369;
    float _421;
    if (!_403)
    {
        float _405 = in.m_56.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _285;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _435 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _437 = isnan(_425);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _451 = 1.0 / _433;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _461 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _463 = isnan(_425);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _475 = 1.0 / _429;
    float _477 = 1.0 / _449;
    float _479 = _455 * _451;
    bool _481 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = isnan(_425);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = _459 * _475;
    float _495 = -_445;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _425 + _499;
    float _503 = _491 * _497;
    float _505 = -_491;
    float _507 = _505 + 1.0;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _509;
    float _513 = fma(_479, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _517 = _425 + _515;
    float _519 = _471 * _507;
    float _521 = _511 * _477;
    bool _523 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _525 = isnan(_425);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_471;
    float _537 = _535 + 1.0;
    float _539 = _513 * _519;
    float _541 = in.m_56.x;
    float _543 = fma(_493, _517, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _545 = -_533;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _551 = _425 + _549;
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _555 = _445 * _547;
    float _557 = fma(_521, _551, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _559 = fma(_543, _503, _553);
    float _561 = fma(_557, _555, _559);
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _567 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[118].x, _561);
    float _569 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _573 = _563 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _575 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _577 = _567 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _581 = _569 * _541;
    out.m_58.x = _573;
    out.m_58.y = _579;
    out.m_58.z = _575;
    out.m_58.w = _577;
    float _583 = trunc(_581);
    int _585 = int(_583);
    int _587 = _585 << 4;
    int _589 = _587 + 1968;
    bool _591 = !_473;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _595 = _541 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        _607 = _285;
    }
    _609 = false;
    float _611 = _607;
    uint _614 = uint(int(uint(_589) >> uint(2)));
    uint _616 = uint(int(uint(int(_614)) >> uint(2)));
    int _618 = int(_614) & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[int(_616)][_618];
    int _622 = int(_614) + 1;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    int _626 = _622 & 3;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[int(_624)][_626];
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _632 = _611 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _638 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_611);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _654 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_611);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    int _666 = _589 + 8;
    uint _668 = uint(int(uint(_666) >> uint(2)));
    uint _670 = uint(int(uint(int(_668)) >> uint(2)));
    int _672 = int(_668) & 3;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[int(_670)][_672];
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = 1.0 / _636;
    float _682 = -_648;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _688 = _664 * _684;
    float _690 = -_664;
    float _692 = _690 + 1.0;
    float _694 = 1.0 / _652;
    float _696 = _678 * _680;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = fma(_696, _632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _704 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _706 = isnan(_611);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _700 * _694;
    float _718 = _702 * _688;
    float _720 = -_714;
    float _722 = _720 + 1.0;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _726 = _611 + _724;
    float _728 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[131].x, _718);
    float _730 = _648 * _722;
    float _732 = fma(_716, _726, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_732, _730, _728);
    float _736 = _620 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _628 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[133].x, _734);
    float _742 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _748 = _674 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _742;
    out.m_60.y = _744;
    out.m_60.z = _750;
    out.m_60.w = _746;
    bool _752 = !_686;
    float _754 = _674;
    int _756 = as_type<int>(_742);
    float _758 = _750;
    float _760 = _744;
    float _762 = _746;
    float _778;
    if (!_752)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _766 = _541 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[14].x, _111);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _285;
    }
    _780 = false;
    float _782 = _778;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _786 = _784 != 0;
    float _788 = in.m_56.z;
    float _790 = in.m_56.w;
    float _792 = 0.0;
    if (_786)
    {
        float _794 = in.m_56.y;
        _792 = _794;
    }
    float _796 = _792;
    if (_786)
    {
        _754 = 1.0;
    }
    float _798 = _754;
    float _800 = 0.0;
    float _802 = _798;
    if (_786)
    {
        _800 = 1.0;
    }
    float _804 = _800;
    int _806 = 0;
    float _808 = _804;
    if (_786)
    {
        _806 = 0;
    }
    int _810 = _806;
    int _812 = _810;
    if (_786)
    {
        _756 = 0;
    }
    int _814 = _756;
    int _816 = _814;
    if (_786)
    {
        _758 = _541;
    }
    float _818 = _758;
    float _820 = 0.0;
    float _822 = _818;
    if (_786)
    {
        _820 = _541;
    }
    float _824 = _820;
    bool _826 = _788 > 0.5;
    float _828 = _824;
    if (_786)
    {
        _760 = _541;
    }
    float _830 = _760;
    int _832 = int(_786);
    int _834 = _191 ? 2 : 0;
    int _836 = _832 | _834;
    int _838 = _826 ? 4 : 0;
    int _840 = _836 | _838;
    int _842 = false ? 8 : 0;
    int _844 = _840 | _842;
    int _846 = false ? 16 : 0;
    int _848 = _844 | _846;
    int _850 = false ? 32 : 0;
    int _852 = _848 | _850;
    int _854 = false ? 64 : 0;
    int _856 = _852 | _854;
    int _858 = _856 & 4;
    float _860 = _796;
    float _862 = _830;
    if (_786)
    {
        _762 = _796;
    }
    float _864 = _762;
    float _866 = _864;
    if (!_786)
    {
        float _868 = in.m_56.y;
        float _870 = _541 * 3.1415927410125732421875;
        float _872 = in.m_56.z;
        float _874 = _870 * 0.15915493667125701904296875;
        float _876 = _874 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _868 * 3.1415927410125732421875;
        float _882 = _880 * 0.15915493667125701904296875;
        float _884 = _882 * 6.283185482025146484375;
        float _886 = sin(_884);
        _860 = _868;
        _802 = 7.345489978790283203125;
        _808 = 5.839270114898681640625;
        _828 = _872;
        _812 = 1;
        _822 = _868;
        _862 = _878;
        _816 = 2;
        _866 = _886;
    }
    float _888 = _860;
    float _890 = _802;
    float _892 = _808;
    float _894 = _828;
    int _896 = _812;
    float _898 = _822;
    float _900 = _862;
    int _902 = _816;
    float _904 = _866;
    float _906 = in.m_62.x;
    float _908 = in.m_62.y;
    float _910 = in.m_62.z;
    float _912 = in.m_62.w;
    bool _914 = _888 > 0.5;
    float _916 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _918 = _790 > 0.5;
    float _920 = in.m_64.x;
    float _922 = in.m_64.y;
    float _924 = in.m_64.z;
    float _926 = in.m_64.w;
    float _928 = -_209;
    int _930 = _826 ? as_type<int>(_928) : as_type<int>(_209);
    float _932 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _936 = _934 != 0;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _944 = _942 != 0;
    float _946 = in.m_66.x;
    float _948 = in.m_66.y;
    float _950 = in.m_66.z;
    float _952 = in.m_66.w;
    float _954 = -_205;
    int _956 = _914 ? as_type<int>(_954) : as_type<int>(_205);
    bool _958 = !_944;
    float _960 = _958 ? _209 : as_type<float>(_930);
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    bool _964 = !_940;
    float _966 = _964 ? _205 : as_type<float>(_956);
    float _968 = -_209;
    int _970 = _918 ? as_type<int>(_968) : as_type<int>(_209);
    float _972 = _916 * _962;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _978 = _976 != 0;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _986 = _984 != 0;
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _990 = int(_918);
    int _992 = _914 ? 2 : 0;
    int _994 = _990 | _992;
    int _996 = _826 ? 4 : 0;
    int _998 = _994 | _996;
    int _1000 = _936 ? 8 : 0;
    int _1002 = _998 | _1000;
    int _1004 = _978 ? 16 : 0;
    int _1006 = _1002 | _1004;
    int _1008 = _982 ? 32 : 0;
    int _1010 = _1006 | _1008;
    int _1012 = _986 ? 64 : 0;
    int _1014 = _1010 | _1012;
    int _1016 = _1014 & 2;
    float _1018 = _295 * _908;
    float _1020 = _932 * _974;
    float _1022 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1024 = !_936;
    float _1026 = _1024 ? _209 : as_type<float>(_970);
    float _1028 = _295 * _922;
    float _1030 = fma(_293, _906, _1018);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1034 = _1032 != 0;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1046 = _1044 != 0;
    float _1048 = _295 * _948;
    float _1050 = fma(_293, _920, _1028);
    float _1052 = _972 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1054 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _988);
    float _1056 = fma(_297, _910, _1030);
    float _1058 = fma(_297, _924, _1050);
    float _1060 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1052);
    float _1062 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1054);
    float _1064 = fma(_293, _946, _1048);
    float _1066 = _1058 + _926;
    float _1068 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1060);
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = _1056 + _912;
    float _1074 = fma(_297, _950, _1064);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1078 = _1066 + _1070;
    float _1080 = _972 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1082 = _1074 + _952;
    float _1084 = _1072 + _1076;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1088 = _1078 + _1086;
    bool _1090 = !_982;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1084 + _1096;
    float _1100 = _1088 * _1088;
    bool _1102 = !_978;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1094);
    bool _1108 = !_986;
    int _1110 = _1108 ? 0 : 1;
    float _1112 = fma(_1098, _1098, _1100);
    float _1114 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1116 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1106);
    float _1118 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1080);
    float _1120 = sqrt(_1112);
    float _1122 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1126 = !_1038;
    int _1128 = _1126 ? 0 : 1;
    float _1130 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1118);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1134 = _1132 != 0;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1142 = _1140 != 0;
    float _1144 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1122);
    bool _1146 = !_1034;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = 1.0 / _1124;
    bool _1152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1154 = isnan(0.5);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1160 = _1156 || _1158;
    float _1162 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1166 = !_1138;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = _1162 + _1124;
    float _1172 = _1082 + _1164;
    bool _1174 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1176 = !_1042;
    int _1178 = _1176 ? 0 : 1;
    bool _1180 = !_1046;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1052;
    float _1186 = _1124;
    float _1188 = _1170;
    float _1190 = _1098;
    float _1192 = _1080;
    float _1194 = _1088;
    float _1196 = _898;
    if (_1160)
    {
        _1184 = 1.0;
    }
    float _1198 = _1184;
    float _1200 = _1170 * _1150;
    float _1202 = _1200 * 0.5;
    bool _1204 = !_1134;
    int _1206 = _1204 ? 0 : 1;
    bool _1208 = !_1142;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1150;
    float _1214 = _1198;
    if (!_1174)
    {
        _1186 = _1084;
    }
    float _1216 = _1186;
    float _1218 = _1216;
    if (!_1174)
    {
        _1188 = _1078;
    }
    float _1220 = _1188;
    float _1222 = _1220;
    if (!_1174)
    {
        _1212 = _1172;
    }
    float _1224 = _1212;
    bool _1226 = !_1174;
    float _1228 = _1224;
    if (!_1226)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1234 = _1120 + _1232;
        float _1236 = rsqrt(_1112);
        float _1238 = _1234 * _1230;
        float _1240 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = _1238 * 0.15915493667125701904296875;
        float _1244 = _1242 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        float _1248 = _1242 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = fma(_1246, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1254 = _1236 * _1252;
        float _1256 = _1250 + (-1.0);
        float _1258 = fma(_1098, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1260 = fma(_1088, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1262 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1264 = fma(_1172, _1250, _1262);
        _1228 = _1264;
        _1218 = _1258;
        _1222 = _1260;
    }
    float _1266 = _1228;
    float _1268 = _1218;
    float _1270 = _1222;
    if (!_1160)
    {
        float _1272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1274 = _1272 * 0.15915493667125701904296875;
        float _1276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1280 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1278);
        float _1282 = _1274 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        float _1286 = _1276 * 0.15915493667125701904296875;
        float _1288 = _1274 * 6.283185482025146484375;
        float _1290 = sin(_1288);
        float _1292 = 1.0 / _1284;
        float _1294 = _1286 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = _1290 * _1292;
        float _1300 = _1286 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = _1296 * _1298;
        float _1306 = 1.0 / _1280;
        float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1310 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1308;
        float _1312 = 1.0 / _1304;
        float _1314 = 1.0 / _1310;
        float _1316 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1318 = _1306 * _1316;
        float _1320 = _1302 * _1312;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1324 = fma(_1320, _1318, _1322);
        float _1326 = _1324 * _1314;
        float _1328 = precise::clamp(_1326, 0.0, 1.0);
        _1190 = _1314;
        _1214 = _1328;
    }
    float _1330 = _1190;
    float _1332 = _1214;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1336 = _1266 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1340 = _1268 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1270 + _1342;
    bool _1346 = _858 != 0;
    float _1348 = _1336 * _1336;
    bool _1350 = _1016 != 0;
    float _1352 = fma(_1340, _1340, _1348);
    float _1354 = fma(_1344, _1344, _1352);
    float _1356 = rsqrt(_1354);
    float _1358 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1360 = _1340 * _1358;
    float _1362 = _1344 * _1358;
    float _1364 = _1360 * _1360;
    float _1366 = _1362 * _1362;
    float _1368 = _1364 + _1366;
    float _1370 = sqrt(_1368);
    bool _1372 = _1370 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1376 = _1370 + _1374;
    float _1378 = _1356;
    float _1380 = _1368;
    float _1382 = _1376;
    float _1384 = _1330;
    float _1386 = _1336;
    if (_1372)
    {
        float _1388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1388;
    }
    float _1390 = _1378;
    if (_1372)
    {
        float _1392 = rsqrt(_1368);
        _1380 = _1392;
    }
    float _1394 = _1380;
    float _1396 = _1394;
    if (_1372)
    {
        float _1398 = _1376 * _1390;
        _1382 = _1398;
    }
    float _1400 = _1382;
    if (_1372)
    {
        float _1402 = _1400 * 0.15915493667125701904296875;
        _1384 = _1402;
    }
    float _1404 = _1384;
    float _1406 = _1344;
    if (_1372)
    {
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = sin(_1408);
        _1406 = _1410;
    }
    float _1412 = _1406;
    float _1414 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1416 = precise::max(0.0, _1414);
    float _1418 = _1390;
    float _1420 = _1416;
    if (_1372)
    {
        float _1422 = _1404 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        _1418 = _1424;
    }
    float _1426 = _1418;
    float _1428 = -_1358;
    float _1430 = -_1416;
    float _1432 = fma(_1336, _1428, _1430);
    if (_1372)
    {
        float _1434 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1434;
    }
    float _1436 = _1386;
    float _1438 = sqrt(_1354);
    float _1440 = _1436;
    float _1442 = _1412;
    if (_1372)
    {
        float _1444 = fma(_1412, _1436, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = _1446;
    if (!_1372)
    {
        _1442 = _1360;
    }
    float _1450 = _1442;
    float _1452 = _1450;
    float _1454 = _1426;
    if (_1372)
    {
        float _1456 = _1426 + (-1.0);
        _1420 = _1456;
    }
    float _1458 = _1420;
    float _1460 = _1458;
    if (_1372)
    {
        float _1462 = _1394 * _1446;
        _1192 = _1462;
    }
    float _1464 = _1192;
    if (!_1372)
    {
        _1448 = _1432;
    }
    float _1466 = _1448;
    float _1468 = _1466;
    if (_1372)
    {
        float _1470 = _1458 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1194 = _1470;
    }
    float _1472 = _1194;
    if (_1372)
    {
        float _1474 = _1360 * _1464;
        _1452 = _1474;
    }
    float _1476 = _1452;
    if (!_1372)
    {
        _1460 = _1362;
    }
    float _1478 = _1460;
    float _1480 = _1478;
    if (_1372)
    {
        float _1482 = _1362 * _1464;
        _1480 = _1482;
    }
    float _1484 = _1480;
    if (!_1372)
    {
        _1396 = _1364;
    }
    float _1486 = _1396;
    float _1488 = _1486;
    if (_1372)
    {
        float _1490 = fma(_1432, _1426, _1472);
        _1468 = _1490;
    }
    float _1492 = _1468;
    if (_1372)
    {
        float _1494 = _1476 * _1476;
        _1488 = _1494;
    }
    float _1496 = _1488;
    if (!_1372)
    {
        _1454 = _1366;
    }
    float _1498 = _1454;
    float _1500 = _1498;
    if (_1372)
    {
        float _1502 = _1484 * _1484;
        _1500 = _1502;
    }
    float _1504 = _1500;
    float _1506 = fma(_1492, _1492, _1496);
    float _1508 = _1506 + _1504;
    float _1510 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1514 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1512);
    float _1516 = precise::clamp(_1514, 0.0, 1.0);
    float _1518 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1522 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1510);
    float _1524 = rsqrt(_1508);
    float _1526 = -_1516;
    float _1528 = _1526 + 1.0;
    float _1530 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1532 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1522);
    float _1534 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1536 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1538 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1530);
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1534);
    float _1544 = abs(_1528);
    float _1546 = log2(_1544);
    float _1548 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1536);
    float _1550 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1538);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1548);
    float _1558 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1560 = _1524 * _1476;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1564 = _1524 * _1492;
    float _1566 = _1556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1562);
    float _1572 = _1524 * _1484;
    float _1574 = -_1554;
    float _1576 = fma(_1574, _1520, 1.0);
    float _1578 = -_1568;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1578);
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1584 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1586 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1588 = -_1572;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1580);
    float _1592 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = log2(_1576);
    float _1596 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1598 = fma(_1590, -0.5, 0.5);
    float _1600 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1586);
    float _1602 = fma(_1590, 0.5, 0.5);
    float _1604 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1596);
    float _1606 = _1564 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1600);
    float _1610 = exp2(_1584);
    float _1612 = fma(_1602, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1614 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1616 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1618 = fma(_1602, _1612, -0.212114393711090087890625);
    float _1620 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1614);
    float _1622 = 1.0 / _1592;
    float _1624 = _1594 * 0.693147182464599609375;
    float _1626 = fma(_1602, _1618, 1.570728778839111328125);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1630 = sqrt(_1598);
    float _1632 = -_1564;
    float _1634 = fma(_1610, _1606, _1632);
    float _1636 = fma(_1634, 0.5, 0.5);
    float _1638 = _1620 * _1622;
    float _1640 = _1616 * _1622;
    float _1642 = fma(_1638, -0.5, 0.5);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1630 * 0.636619746685028076171875;
    float _1648 = -_1626;
    float _1650 = fma(_1646, _1648, 1.0);
    float3 _6474 = float3(_1644, _1642, _1628);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6474, float3(0.0), isnan(_6474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6474, float3(0.0), isnan(_6474)), level(0.0)).x;
    float3 _6485 = float3(_1644, _1642, _1628);
    float4 _1655 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6485, float3(0.0), isnan(_6485)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6485, float3(0.0), isnan(_6485)), level(0.0)).xyzw;
    float _1657 = _1655.x;
    float _1659 = _1655.y;
    float _1661 = _1655.z;
    float _1663 = _1655.w;
    float2 _6502 = float2(_1650, _1636);
    float3 _1667 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6502, float2(0.0), isnan(_6502)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6502, float2(0.0), isnan(_6502)), level(0.0)).xyz;
    float _1669 = _1667.x;
    float _1671 = _1667.y;
    float _1673 = _1667.z;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1677 = int(_1675);
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1681 = _1679 != 0;
    float _1683 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1687 = _1685 != 0;
    float _1689 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1693 = _1691 != 0;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1697 = abs(_1206);
    float _1699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1701 = int(_1699);
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1705 = _1703 != 0;
    float _1707 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1711 = int(_1709);
    float _1713 = float(_1677);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1725 = _1723 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1727 = 1.0 / _1713;
    float _1729 = float(uint(_1701));
    float _1731 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1733 = _1731 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1735 = ~_1701;
    int _1737 = _1735 + 1;
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1743 = 1.0 / _1729;
    float _1745 = float(_1711);
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1749 = _111 * _1727;
    float _1751 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1753 = int(_1751);
    int _1755 = ~_1701;
    int _1757 = _1755 + 1;
    int _1759 = abs(_1148);
    int _1761 = abs(_1182);
    int _1763 = as_type<int>(_1743) + (-2);
    float _1765 = trunc(_1749);
    int _1767 = int(_1765);
    float _1769 = 1.0 / _1745;
    float _1771 = float(uint(_1753));
    int _1773 = ~_1753;
    int _1775 = _1773 + 1;
    int _1777 = ~_1753;
    int _1779 = _1777 + 1;
    float _1781 = float(uint(_1767));
    float _1783 = 1.0 / _1771;
    float _1785 = as_type<float>(_1763) * _1781;
    float _1787 = _111 * _1769;
    float _1789 = trunc(_1785);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = trunc(_1787);
    int _1797 = int(_1795);
    int _1799 = as_type<int>(_1783) + (-2);
    int _1801 = _1757 * int(_1793);
    int _1803 = _1801 + _1767;
    float _1805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1807 = int(_1805);
    float _1809 = float(uint(_1803));
    float _1811 = float(uint(_1797));
    float _1813 = as_type<float>(_1763) * _1809;
    float _1815 = float(_1767);
    float _1817 = 1.0 / _1717;
    float _1819 = float(_1797);
    float _1821 = as_type<float>(_1799) * _1811;
    float _1823 = float(_1807);
    float _1825 = trunc(_1821);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = trunc(_1813);
    float _1833 = precise::max(_1831, 0.0);
    uint _1835 = uint(_1833);
    float _1837 = float(_1701);
    bool _1839 = _1815 >= _1837;
    bool _1841 = isnan(_1815);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan(_1837);
    bool _1847 = _1843 || _1845;
    float _1849 = float(_1847);
    int _1851 = _1775 * int(_1829);
    int _1853 = _1851 + _1797;
    float _1855 = _890 * _541;
    float _1857 = 1.0 / _1823;
    float _1859 = float(uint(_1853));
    int _1861 = int(_1793) + int(_1835);
    float _1863 = _892 * _894;
    float _1865 = as_type<float>(_1799) * _1859;
    float _1867 = floor(_1855);
    int _1869 = _1737 * _1861;
    int _1871 = _1869 + _1767;
    bool _1873 = uint(_1871) >= uint(_1701);
    float _1875 = trunc(_1865);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    float _1881 = _111 * _1857;
    bool _1883 = !_1873;
    int _1885 = _1883 ? 0 : (-1);
    bool _1887 = _1701 == 0;
    int _1889 = ~_1861;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    float _1895 = trunc(_1849);
    int _1897 = int(_1895);
    float _1899 = -_1867;
    float _1901 = _1855 + _1899;
    float _1903 = _285 * _1837;
    int _1905 = _1701 * _1893;
    int _1907 = _1905 + _1767;
    float _1909 = _1901 * _1837;
    float _1911 = float(_1753);
    int _1913 = int(_1829) + int(_1879);
    float _1915 = floor(_1863);
    int _1917 = ~_1753;
    int _1919 = _1917 + 1;
    bool _1921 = !_1887;
    int _1923 = _1921 ? _1907 : (-1);
    bool _1925 = _1819 >= _1911;
    bool _1927 = isnan(_1819);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan(_1911);
    bool _1933 = _1929 || _1931;
    float _1935 = float(_1933);
    int _1937 = _1919 * _1913;
    int _1939 = _1937 + _1797;
    int _1941 = ~_1897;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    float _1947 = trunc(_1903);
    int _1949 = int(_1947);
    bool _1951 = !_1693;
    int _1953 = _1951 ? 0 : 1;
    bool _1955 = uint(_1939) >= uint(_1753);
    int _1957 = _1923 * _1945;
    int _1959 = abs(_1092);
    int _1961 = abs(_1953);
    float _1963 = trunc(_1909);
    int _1965 = int(_1963);
    int _1967 = _1701 + (-1);
    float _1969 = -_1915;
    float _1971 = _1863 + _1969;
    int _1973 = ~_1701;
    int _1975 = _1973 + 1;
    int _1977 = _1897 * _1967;
    int _1979 = _1977 + _1957;
    int _1981 = abs(_1104);
    float _1983 = trunc(_1935);
    int _1985 = int(_1983);
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = _1979 * _1959;
    bool _1993 = _1753 == 0;
    int _1995 = ~_1913;
    int _1997 = _1995 + _1989;
    int _1999 = _1997 + 1;
    int _2001 = _1949 * _1981;
    int _2003 = _2001 + _1991;
    int _2005 = abs(_1110);
    int _2007 = _1965 * _1961;
    int _2009 = _2007 + _1767;
    float _2011 = _1971 * _1911;
    int _2013 = _1753 * _1999;
    int _2015 = _2013 + _1797;
    bool _2017 = !_1681;
    float _2019 = _2017 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2021 = _285 * _1911;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2025 = _2023 != 0;
    float _2027 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2029 = int(_2027);
    bool _2031 = !_1993;
    int _2033 = _2031 ? _2015 : (-1);
    int _2035 = ~_1985;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(as_type<int>(_2019));
    float _2043 = _2019;
    bool _2045 = _1687;
    if (_1705)
    {
        float _2047 = _541 * 3.1415927410125732421875;
        _2043 = _2047;
    }
    float _2049 = _2043;
    int _2051 = abs(_1168);
    float _2053 = trunc(_2011);
    int _2055 = int(_2053);
    int _2057 = _2033 * _2039;
    int _2059 = _2009 * _2005;
    int _2061 = _2059 + _2003;
    bool _2063 = !_2025;
    int _2065 = _2063 ? 0 : 1;
    float _2067 = _2049;
    if (_1705)
    {
        float _2069 = _2049 * 0.15915493667125701904296875;
        _2067 = _2069;
    }
    float _2071 = _2067;
    int _2073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2075 = _2073 != 0;
    int _2077 = _1965 * _2041;
    int _2079 = _2077 + _2061;
    float _2081 = trunc(_2021);
    int _2083 = int(_2081);
    int _2085 = _1753 + (-1);
    int _2087 = abs(_2065);
    int _2089 = _1985 * _2085;
    int _2091 = _2089 + _2057;
    int _2093 = abs(_1210);
    int _2095 = _2055 * _2087;
    int _2097 = _2095 + _1797;
    bool _2099 = !_1687;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = _2091 * _2051;
    float _2105 = trunc(_1881);
    int _2107 = int(_2105);
    float _2109 = float(uint(_2079));
    float _2111 = as_type<float>(_1697);
    float _2113 = _2071;
    if (_2075)
    {
        float _2115 = in.m_56.w;
        _2111 = _2115;
    }
    float _2117 = _2111;
    int _2119 = abs(_2101);
    int _2121 = _2083 * _1697;
    int _2123 = _2121 + _2103;
    float _2125 = as_type<float>(_1763) * _2109;
    if (_1705)
    {
        float _2127 = _2071 * 6.283185482025146484375;
        float _2129 = sin(_2127);
        _2113 = _2129;
    }
    float _2131 = _2113;
    float _2133 = float(uint(_2009));
    int _2135 = _2097 * _2093;
    int _2137 = _2135 + _2123;
    float _2139 = float(uint(_2029));
    int _2141 = ~_1701;
    int _2143 = _2141 + 1;
    int _2145 = _2055 * _2119;
    int _2147 = _2145 + _2137;
    int _2149 = ~_1701;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2125);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1763) * _2133;
    float _2161 = 0.0;
    if (!_2075)
    {
        _2161 = _205;
    }
    float _2163 = _2161;
    float _2165 = float(uint(_2147));
    float _2167 = trunc(_2159);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = as_type<float>(_1799) * _2165;
    float _2175 = _2165;
    float _2177 = as_type<float>(_2151);
    float _2179 = _2163;
    if (_2075)
    {
        float _2181 = _2117 * 3.1415927410125732421875;
        _2175 = _2181;
    }
    float _2183 = _2175;
    int _2185 = ~_1753;
    int _2187 = _2185 + 1;
    int _2189 = _2151 * int(_2157);
    int _2191 = _2189 + _2079;
    float _2193 = trunc(_2173);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    if (_2075)
    {
        float _2199 = _2183 * 0.15915493667125701904296875;
        _2177 = _2199;
    }
    float _2201 = _2177;
    float _2203 = float(uint(_2191));
    float _2205 = float(uint(_2097));
    int _2207 = _2143 * int(_2171);
    int _2209 = _2207 + _2009;
    float _2211 = _2201;
    if (_2075)
    {
        float _2213 = _2201 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = as_type<float>(_1763) * _2203;
    float _2221 = as_type<float>(_1799) * _2205;
    float _2223 = float(uint(_2209));
    float _2225 = trunc(_2219);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    int _2231 = _2187 * int(_2197);
    int _2233 = _2231 + _2147;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2235 = as_type<float>(_1763) * _2223;
    float _2237 = float(uint(_2233));
    float _2239 = 1.0 / _2139;
    if (_2075)
    {
        bool _2241 = _2217 > 0.5;
        _2045 = _2241;
    }
    bool _2243 = _2045;
    float _2245 = as_type<float>(_1799) * _2237;
    float _2247 = _2245;
    if (_2075)
    {
        float _2249 = -_205;
        float _2251 = _2243 ? _2249 : _205;
        _2179 = _2251;
    }
    float _2253 = _2179;
    float _2255 = float(uint(_2107));
    float _2257 = trunc(_2221);
    float _2259 = precise::max(_2257, 0.0);
    uint _2261 = uint(_2259);
    int _2263 = int(_2157) + int(_2229);
    int _2265 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2245);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = _1975 * _2263;
    int _2277 = _2275 + _2079;
    int _2279 = as_type<int>(_2239) + (-2);
    int _2281 = ~_1753;
    int _2283 = _2281 + 1;
    bool _2285 = uint(_2277) >= uint(_1701);
    float _2287 = as_type<float>(_2279) * _2255;
    int _2289 = _1779 * int(_2261);
    int _2291 = _2289 + _2097;
    float _2293 = trunc(_2235);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = !_2285;
    int _2301 = _2299 ? 0 : (-1);
    bool _2303 = _2285;
    if (_1705)
    {
        bool _2305 = _2131 > 0.5;
        _2303 = _2305;
    }
    bool _2307 = _2303;
    float _2309 = float(uint(_2291));
    int _2311 = ~_2263;
    int _2313 = _2311 + _2301;
    int _2315 = _2313 + 1;
    float _2317 = trunc(_2287);
    float _2319 = precise::max(_2317, 0.0);
    uint _2321 = uint(_2319);
    int _2323 = int(_2197) + int(_2273);
    float _2325 = as_type<float>(_1799) * _2309;
    int _2327 = _1701 * _2315;
    int _2329 = _2327 + _2079;
    if (!_1705)
    {
        _2247 = _209;
    }
    float _2331 = _2247;
    int _2333 = ~_2029;
    int _2335 = _2333 + 1;
    int _2337 = _2283 * _2323;
    int _2339 = _2337 + _2147;
    float _2341 = _2331;
    if (_1705)
    {
        float _2343 = -_209;
        float _2345 = _2307 ? _2343 : _209;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = 1.0 / _1721;
    bool _2351 = !_1887;
    int _2353 = _2351 ? _2329 : (-1);
    int _2355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2357 = _2355 != 0;
    float _2359 = -_205;
    int _2361 = _1346 ? as_type<int>(_2359) : as_type<int>(_205);
    int _2363 = _2335 * int(_2321);
    int _2365 = _2363 + _2107;
    bool _2367 = uint(_2339) >= uint(_1753);
    float _2369 = 1.0 / _1725;
    int _2371 = _2353 & 3;
    bool _2373 = _2371 != 0;
    bool _2375 = !_2357;
    float _2377 = _2375 ? _205 : as_type<float>(_2361);
    bool _2379 = !_2367;
    int _2381 = _2379 ? 0 : (-1);
    bool _2383 = uint(_2371) > 1u;
    float _2385 = 1.0 / _1733;
    float _2387 = float(uint(_2365));
    int _2389 = ~_2323;
    int _2391 = _2389 + _2381;
    int _2393 = _2391 + 1;
    int _2395 = int(_2171) + int(_2297);
    float _2397 = as_type<float>(_2279) * _2387;
    int _2399 = ~_1701;
    int _2401 = _2399 + 1;
    int _2403 = _1753 * _2393;
    int _2405 = _2403 + _2147;
    int _2407 = _2353 & 3;
    bool _2409 = _2407 != 0;
    float _2411 = trunc(_2397);
    float _2413 = precise::max(_2411, 0.0);
    uint _2415 = uint(_2413);
    float _2417 = -_209;
    int _2419 = _1350 ? as_type<int>(_2417) : as_type<int>(_209);
    int _2421 = _2401 * _2395;
    int _2423 = _2421 + _2009;
    int _2425 = _2409 ? 0 : 1;
    bool _2427 = _2371 != 3;
    bool _2429 = uint(_2371) >= 2u;
    float _2431 = trunc(_2325);
    float _2433 = precise::max(_2431, 0.0);
    uint _2435 = uint(_2433);
    bool _2437 = !_1993;
    int _2439 = _2437 ? _2405 : (-1);
    int _2441 = ~_2425;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    int _2447 = _2445;
    if (!_2383)
    {
        int _2449 = ~_2425;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = _2429 ? 0 : 1;
    float _2457 = 1.0 / _1741;
    bool _2459 = uint(_2423) >= uint(_1701);
    int _2461 = _2439 & 3;
    bool _2463 = _2461 != 0;
    bool _2465 = !_2459;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = uint(_2461) > 1u;
    float _2471 = exp2(_1689);
    int _2473 = ~_2455;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = _2477;
    if (_2427)
    {
        int _2481 = ~_2455;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _2439 & 3;
    bool _2489 = _2487 != 0;
    int _2491 = int(_2321) + int(_2415);
    int _2493 = ~_2029;
    int _2495 = _2493 + 1;
    int _2497 = _2489 ? 0 : 1;
    bool _2499 = _2461 != 3;
    int _2501 = _2495 * _2491;
    int _2503 = _2501 + _2107;
    bool _2505 = !_2267;
    float _2507 = _2505 ? _209 : as_type<float>(_2419);
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2509;
    int _2513 = ~_1753;
    int _2515 = _2513 + 1;
    float _2517 = -_2471;
    float _2519 = _2517 + 1.0;
    int _2521 = int(_2261) + int(_2435);
    float _2523 = _2511 * _1817;
    int _2525 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2527 = _2525 != 0;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2533 = ~_2497;
    int _2535 = _2533 + 1;
    int _2537 = _2535 + 1;
    float _2539 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2541 = !_2463;
    int _2543 = _2541 ? 0 : 1;
    float _2545 = _2531 * _2385;
    bool _2547 = uint(_2461) >= 2u;
    float _2549 = _2539 * _1652;
    int _2551 = _2537;
    if (!_2469)
    {
        int _2553 = ~_2497;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    bool _2559 = _2461 != 3;
    int _2561 = _2515 * _2521;
    int _2563 = _2561 + _2097;
    int _2565 = _2547 ? 0 : 1;
    float _2567 = _541 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2569 = uint(_2503) >= uint(_2029);
    bool _2571 = !_2559;
    int _2573 = _2571 ? 0 : (-1);
    float _2575 = -_1747;
    float _2577 = fma(_2567, 2.0, _2575);
    bool _2579 = uint(_2563) >= uint(_1753);
    int _2581 = ~_2565;
    int _2583 = _2581 + 1;
    int _2585 = _2583 + 1;
    int _2587 = _2585;
    if (_2499)
    {
        int _2589 = ~_2565;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    float _2595 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2597 = _541 > 0.5;
    bool _2599 = !_2579;
    int _2601 = _2599 ? 0 : (-1);
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2605 = _2603 != 0;
    float _2607 = -_205;
    int _2609 = _2597 ? as_type<int>(_2607) : as_type<int>(_205);
    bool _2611 = !_2569;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = !_2605;
    int _2617 = _2615 ? 0 : 1;
    int _2619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2621 = _2619 != 0;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2629 = _2627 != 0;
    bool _2631 = !_2527;
    float _2633 = _2631 ? _205 : as_type<float>(_2609);
    float _2635 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2637 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2639 = isnan(_782);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2635);
    float _2651 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1695);
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2655 = _2653 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2657 = fma(_2595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2661 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2659;
    float _2663 = _2655 * _2349;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2665;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _2669 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2677 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2679 = isnan(_782);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2685 = _2681 || _2683;
    float _2687 = float(_2685);
    float _2689 = _2667 * _2369;
    float _2691 = 1.0 / _2671;
    bool _2693 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2695 = isnan(_782);
    bool _2697 = _2693 || _2695;
    bool _2699 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2701 = _2697 || _2699;
    float _2703 = float(_2701);
    float _2705 = _2661 * _2457;
    float _2707 = -_2687;
    float _2709 = _2707 + 1.0;
    float _2711 = -_2647;
    float _2713 = _2711 + 1.0;
    float _2715 = _2649 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2717 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2719 = _2657 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2721 = 1.0 / _2675;
    float _2723 = _2687 * _2713;
    bool _2725 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2727 = isnan(_782);
    bool _2729 = _2725 || _2727;
    bool _2731 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2733 = _2729 || _2731;
    float _2735 = float(_2733);
    float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2739 = _2737 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2741 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2741;
    bool _2745 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2747 = isnan(_782);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    out.m_70.x = _2715;
    out.m_70.y = _2717;
    out.m_70.z = _2719;
    bool _2757 = _896 != 1;
    float _2759 = _2739 * _2691;
    float _2761 = _2703 * _2709;
    float _2763 = fma(_1683, _1683, 1.0);
    float _2765 = -_2703;
    float _2767 = _2765 + 1.0;
    bool _2769 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2771 = isnan(_782);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = -_111;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2577);
    float _2789 = _2735 * _2767;
    float _2791 = rsqrt(_2763);
    float _2793 = _2743 * _2721;
    float _2795 = -_2735;
    float _2797 = _2795 + 1.0;
    float _2799 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2801 = _782 + _2799;
    float _2803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2805 = _782 + _2803;
    bool _2807 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2809 = isnan(_782);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = _2755 * _2797;
    float _2821 = fma(_2523, _2801, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2823 = fma(_2663, _2805, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2825 = _2779 * _2783;
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2829 = _782 + _2827;
    bool _2831 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2833 = isnan(_782);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = -_2779;
    float _2845 = _2843 + 1.0;
    float _2847 = -_2817;
    float _2849 = _2847 + 1.0;
    float _2851 = fma(_2705, _2829, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2853 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2855 = _782 + _2853;
    float _2857 = _2817 * _2845;
    float _2859 = _2841 * _2849;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2863 = _782 + _2861;
    float _2865 = _1683 * _2791;
    float _2867 = fma(_2689, _2855, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2869 = _2821 * _2859;
    float _2871 = fma(_2545, _2863, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2873 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2875 = _2865 * _2873;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2879 = _2865 * _2877;
    float _2881 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2883 = _2865 * _2881;
    float _2885 = -_2841;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2875);
    float _2891 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2879);
    float _2893 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2883);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2897 = _782 + _2895;
    float _2899 = _2633 + 0.5;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2903 = _782 + _2901;
    float _2905 = fma(_2887, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2869);
    out.m_72.x = _2889;
    out.m_72.y = _2891;
    out.m_72.z = _2893;
    float _2907 = fma(_2899, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2787);
    float _2909 = fma(_2759, _2897, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2911 = fma(_2793, _2903, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2913 = fma(_2823, _2857, _2905);
    float _2915 = _890 * _898;
    float _2917 = _2903;
    float _2919 = _2823;
    float _2921 = _2759;
    if (!_2757)
    {
        _2917 = _888;
    }
    float _2923 = _2917;
    float _2925 = fma(_2851, _2825, _2913);
    float _2927 = _2923;
    if (!_2757)
    {
        _2919 = _888;
    }
    float _2929 = _2919;
    float _2931 = floor(_2915);
    float _2933 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2935 = fma(_2871, _2819, _2925);
    float _2937 = _2929;
    if (!_2757)
    {
        _1196 = _788;
    }
    float _2939 = _1196;
    float _2941 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2943 = _2939;
    if (!_2757)
    {
        _2921 = _788;
    }
    float _2945 = _2921;
    float _2947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2949 = _2945;
    if (_2757)
    {
        _2927 = _541;
    }
    float _2951 = _2927;
    float _2953 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2941);
    if (_2757)
    {
        _2937 = _541;
    }
    float _2955 = _2937;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (_2757)
    {
        _2943 = _888;
    }
    float _2959 = _2943;
    float _2961 = fma(_2933, -2.0, _2947);
    if (_2757)
    {
        _2949 = _888;
    }
    float _2963 = _2949;
    float _2965 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2957);
    bool _2967 = _902 != 2;
    float _2969 = _900 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2971 = -_2931;
    float _2973 = _2915 + _2971;
    float _2975 = fma(_2867, _2789, _2935);
    float _2977 = float(_2107);
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = float(_2029);
    float _2985 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2979);
    float _2987 = -_2981;
    float _2989 = fma(_2969, 2.0, _2987);
    bool _2991 = _2977 >= _2983;
    bool _2993 = isnan(_2977);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan(_2983);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _3005 = ~_2491;
    int _3007 = _3005 + _2613;
    int _3009 = _3007 + 1;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _3015 = _2969;
    if (_2967)
    {
        _3013 = _541;
    }
    float _3017 = _3013;
    float _3019 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2961);
    float _3021 = trunc(_3001);
    int _3023 = int(_3021);
    float _3025 = _3017;
    if (_2967)
    {
        _3015 = _888;
    }
    float _3027 = _3015;
    int _3029 = _2029 * _3009;
    int _3031 = _3029 + _2107;
    float _3033 = _3027;
    if (!_2967)
    {
        _3025 = _788;
    }
    float _3035 = _3025;
    float _3037 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3003);
    if (!_2967)
    {
        _3033 = _541;
    }
    float _3039 = _3033;
    float _3041 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3011);
    bool _3043 = _2029 == 0;
    float _3045 = _2973 * _2983;
    float _3047 = _285 * _2983;
    int _3049 = _2029 + (-1);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3053 = !_3043;
    int _3055 = _3053 ? _3031 : (-1);
    float _3057 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2965);
    float _3059 = trunc(_3045);
    int _3061 = int(_3059);
    float _3063 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3065 = ~_3023;
    int _3067 = _3065 + 1;
    int _3069 = _3067 + 1;
    float _3071 = -_3057;
    float _3073 = _3071 + 1.0;
    float _3075 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3077 = abs(_1128);
    int _3079 = _3055 * _3069;
    float _3081 = trunc(_3047);
    int _3083 = int(_3081);
    int _3085 = abs(_2617);
    float _3087 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3075);
    int _3089 = _3023 * _3049;
    int _3091 = _3089 + _3079;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3095 = _904 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3097 = _3091 * _3077;
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3101 = fma(_3095, -2.0, _3093);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3105 = abs(_1178);
    int _3107 = _3061 * _3085;
    int _3109 = _3107 + _2107;
    float _3111 = _2253 + 0.5;
    int _3113 = _3083 * _1759;
    int _3115 = _3113 + _3097;
    float _3117 = -_111;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2989);
    float _3121 = _2347 + (-0.5);
    float _3123 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3101);
    float _3125 = -_3103;
    float _3127 = fma(_3051, 2.0, _3125);
    float _3129 = fma(_3111, (*spvDescriptorSet0.vp_c9)._m0[95].x, _3119);
    float _3131 = -_3121;
    float _3133 = -_3123;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3133);
    int _3137 = _3109 * _3105;
    int _3139 = _3137 + _3115;
    float _3141 = _2507 + (-0.5);
    float _3143 = _2951 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3145 = _3061 * _1761;
    int _3147 = _3145 + _3139;
    float _3149 = -_3141;
    float _3151 = -_3019;
    float _3153 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3151);
    float _3155 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3037);
    float _3157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3159 = float(uint(_3147));
    float _3161 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2953);
    float _3169 = as_type<float>(_2279) * _3159;
    float _3171 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3087);
    float _3173 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3175 = float(uint(_3109));
    float _3177 = fma(_3063, -2.0, _3157);
    float _3179 = -_3171;
    float _3181 = _3179 + 1.0;
    float _3183 = fma(_3173, -2.0, _3161);
    float _3185 = trunc(_3169);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = as_type<float>(_2279) * _3175;
    float _3193 = -_3073;
    float _3195 = fma(_3193, _2253, _3129);
    int _3197 = _2439 >> 31;
    float _3199 = fma(_3181, _2347, _3135);
    int _3201 = ~_2029;
    int _3203 = _3201 + 1;
    float _3205 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3163);
    int _3207 = _3197 & 3;
    float _3209 = trunc(_3191);
    float _3211 = precise::max(_3209, 0.0);
    uint _3213 = uint(_3211);
    out.m_74.x = _3195;
    out.m_74.y = _3199;
    int _3215 = ~_2029;
    int _3217 = _3215 + 1;
    float _3219 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3099);
    int _3221 = _2439 + _3207;
    float _3223 = -_3165;
    float _3225 = fma(_3143, 2.0, _3223);
    float _3227 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3041);
    float _3229 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2985);
    int _3231 = _3203 * int(_3189);
    int _3233 = _3231 + _3147;
    float _3235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3237 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3205);
    int _3239 = _3221 >> 2;
    float _3241 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3219);
    float _3243 = float(uint(_3233));
    float _3245 = -_111;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3225);
    int _3249 = _3239 << 4;
    int _3251 = _3249 + 656;
    int _3253 = _3217 * int(_3213);
    int _3255 = _3253 + _3109;
    float _3257 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3177);
    float _3259 = as_type<float>(_2279) * _3243;
    uint _3261 = uint(int(uint(_3251) >> uint(2)));
    uint _3263 = uint(int(uint(int(_3261)) >> uint(2)));
    int _3265 = int(_3261) & 3;
    float _3267 = (*spvDescriptorSet0.vp_c9)._m0[int(_3263)][_3265];
    int _3269 = int(_3261) + 1;
    uint _3271 = uint(int(uint(_3269) >> uint(2)));
    int _3273 = _3269 & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    float _3277 = -_111;
    float _3279 = fma(_3277, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3127);
    float _3281 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3183);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3285 = fma(_2909, _2761, _2975);
    float _3287 = float(uint(_3255));
    float _3289 = _3235 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3291 = -_3241;
    float _3293 = _3291 + 1.0;
    int _3295 = _3251 + 8;
    uint _3297 = uint(int(uint(_3295) >> uint(2)));
    uint _3299 = uint(int(uint(int(_3297)) >> uint(2)));
    int _3301 = int(_3297) & 3;
    float _3303 = (*spvDescriptorSet0.vp_c9)._m0[int(_3299)][_3301];
    int _3305 = int(_3297) + 1;
    uint _3307 = uint(int(uint(_3305) >> uint(2)));
    int _3309 = _3305 & 3;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[int(_3307)][_3309];
    float _3313 = fma(_2911, _2723, _3285);
    float _3315 = as_type<float>(_2279) * _3287;
    float _3317 = trunc(_3259);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2377 + 0.5;
    float _3325 = _1026 + (-0.5);
    float _3327 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3313);
    int _3329 = abs(_2543);
    float _3331 = fma(_3289, _3323, _3247);
    float _3333 = -_3155;
    float _3335 = _3333 + 1.0;
    float _3337 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3339 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3341 = ~_2521;
    int _3343 = _3341 + _2601;
    int _3345 = _3343 + 1;
    float _3347 = -_3335;
    float _3349 = fma(_2633, _3347, _2907);
    int _3351 = ~_2029;
    int _3353 = _3351 + 1;
    float _3355 = -_3339;
    float _3357 = -_3257;
    float _3359 = fma(_3355, _3325, _3357);
    float _3361 = -_3167;
    float _3363 = _3361 + 1.0;
    float _3365 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3337);
    int _3367 = abs(_2557);
    float _3369 = fma(_1026, _3293, _3359);
    int _3371 = int(_3189) + int(_3321);
    float _3373 = -_3237;
    float _3375 = _3373 + 1.0;
    float _3377 = fma(_2507, _3363, _3153);
    bool _3379 = !_2625;
    int _3381 = _3379 ? 0 : 1;
    float _3383 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3385 = int(_3383);
    float _3387 = -_3375;
    float _3389 = fma(_2377, _3387, _3331);
    int _3391 = _3353 * _3371;
    int _3393 = _3391 + _3147;
    int _3395 = ~_2029;
    int _3397 = _3395 + 1;
    int _3399 = _1753 * _3345;
    int _3401 = _3399 + _2097;
    int _3403 = abs(_3381);
    out.m_76.x = _3349;
    out.m_76.y = _3377;
    out.m_76.z = _3389;
    out.m_76.w = _3369;
    bool _3405 = uint(_3393) >= uint(_2029);
    float _3407 = trunc(_3315);
    float _3409 = precise::max(_3407, 0.0);
    uint _3411 = uint(_3409);
    bool _3413 = !_1993;
    int _3415 = _3413 ? _3401 : (-1);
    float _3417 = -_3227;
    float _3419 = _3417 + 1.0;
    bool _3421 = !_3405;
    int _3423 = _3421 ? 0 : (-1);
    float _3425 = -_3229;
    float _3427 = _3425 + 1.0;
    int _3429 = ~_2395;
    int _3431 = _3429 + _2467;
    int _3433 = _3431 + 1;
    float _3435 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3365);
    int _3437 = ~_3371;
    int _3439 = _3437 + _3423;
    int _3441 = _3439 + 1;
    int _3443 = abs(_2485);
    int _3445 = _1701 * _3433;
    int _3447 = _3445 + _2009;
    int _3449 = ~_3385;
    int _3451 = _3449 + 1;
    int _3453 = _2029 * _3441;
    int _3455 = _3453 + _3147;
    float _3457 = _1673 * _2549;
    int _3459 = ~_3367;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    out.m_78.x = _3327;
    int _3465 = _2353 >> 31;
    int _3467 = abs(_2593);
    int _3469 = _3463 * as_type<int>(_3275);
    int _3471 = ~_3329;
    int _3473 = _3471 + 1;
    int _3475 = _3473 + 1;
    int _3477 = _3465 & 3;
    int _3479 = ~_3467;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    int _3485 = _3475 * as_type<int>(_3267);
    int _3487 = _3485 + _3469;
    int _3489 = _2353 + _3477;
    int _3491 = abs(_2573);
    int _3493 = _3483 * as_type<int>(_3303);
    int _3495 = _3493 + _3487;
    int _3497 = abs(_3385);
    int _3499 = _3489 >> 2;
    float _3501 = float(uint(_3385));
    int _3503 = ~_3491;
    int _3505 = _3503 + 1;
    int _3507 = _3505 + 1;
    float _3509 = float(uint(_3497));
    float _3511 = 1.0 / _3501;
    int _3513 = _3499 << 4;
    int _3515 = _3513 + 368;
    int _3517 = _3507 * as_type<int>(_3311);
    int _3519 = _3517 + _3495;
    int _3521 = int(_3213) + int(_3411);
    bool _3523 = !_3043;
    int _3525 = _3523 ? _3455 : (-1);
    int _3527 = ~_3403;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3397 * _3521;
    int _3535 = _3533 + _3109;
    uint _3537 = uint(int(uint(_3515) >> uint(2)));
    uint _3539 = uint(int(uint(int(_3537)) >> uint(2)));
    int _3541 = int(_3537) & 3;
    float _3543 = (*spvDescriptorSet0.vp_c9)._m0[int(_3539)][_3541];
    int _3545 = int(_3537) + 1;
    uint _3547 = uint(int(uint(_3545) >> uint(2)));
    int _3549 = _3545 & 3;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[int(_3547)][_3549];
    int _3553 = _3525 >> 31;
    float _3555 = 1.0 / _3509;
    int _3557 = _3519 * _3531;
    bool _3559 = uint(_3535) >= uint(_2029);
    int _3561 = _3553 & 3;
    int _3563 = _3415 * _3403;
    int _3565 = _3563 + _3557;
    bool _3567 = !_3559;
    int _3569 = _3567 ? 0 : (-1);
    int _3571 = _3515 + 8;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    uint _3575 = uint(int(uint(int(_3573)) >> uint(2)));
    int _3577 = int(_3573) & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    int _3581 = int(_3573) + 1;
    uint _3583 = uint(int(uint(_3581) >> uint(2)));
    int _3585 = _3581 & 3;
    float _3587 = (*spvDescriptorSet0.vp_c9)._m0[int(_3583)][_3585];
    int _3589 = _3525 + _3561;
    int _3591 = _3525 & 3;
    bool _3593 = _3591 != 0;
    int _3595 = _3525 & 3;
    bool _3597 = _3595 != 0;
    int _3599 = _3589 >> 2;
    int _3601 = as_type<int>(_3511) + (-2);
    float _3603 = float(uint(_3565));
    int _3605 = _3593 ? 0 : 1;
    bool _3607 = uint(_3595) > 1u;
    float _3609 = as_type<float>(_3601) * _3603;
    int _3611 = as_type<int>(_3555) + (-2);
    int _3613 = _3599 << 4;
    int _3615 = _3613 + 800;
    int _3617 = abs(_3565);
    float _3619 = trunc(_3609);
    float _3621 = precise::max(_3619, 0.0);
    uint _3623 = uint(_3621);
    uint _3625 = uint(int(uint(_3615) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = ~_3605;
    int _3643 = _3641 + 1;
    int _3645 = _3643 + 1;
    float _3647 = float(uint(_3617));
    int _3649 = _3645;
    if (!_3607)
    {
        int _3651 = ~_3605;
        int _3653 = _3651 + 1;
        _3649 = _3653;
    }
    int _3655 = _3649;
    float _3657 = as_type<float>(_3611) * _3647;
    int _3659 = ~_3521;
    int _3661 = _3659 + _3569;
    int _3663 = _3661 + 1;
    int _3665 = _3615 + 8;
    uint _3667 = uint(int(uint(_3665) >> uint(2)));
    uint _3669 = uint(int(uint(int(_3667)) >> uint(2)));
    int _3671 = int(_3667) & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    int _3675 = int(_3667) + 1;
    uint _3677 = uint(int(uint(_3675) >> uint(2)));
    int _3679 = _3675 & 3;
    float _3681 = (*spvDescriptorSet0.vp_c9)._m0[int(_3677)][_3679];
    bool _3683 = uint(_3595) >= 2u;
    int _3685 = abs(_2453);
    float _3687 = trunc(_3657);
    float _3689 = precise::max(_3687, 0.0);
    uint _3691 = uint(_3689);
    int _3693 = _3451 * int(_3623);
    int _3695 = _3693 + _3565;
    int _3697 = _3683 ? 0 : 1;
    int _3699 = _2029 * _3663;
    int _3701 = _3699 + _3109;
    int _3703 = ~_3685;
    int _3705 = _3703 + 1;
    int _3707 = _3705 + 1;
    bool _3709 = _3595 != 3;
    float _3711 = float(uint(_3695));
    int _3713 = _3707 * as_type<int>(_3551);
    bool _3715 = !_2373;
    int _3717 = _3715 ? 0 : 1;
    bool _3719 = !_3597;
    int _3721 = _3719 ? 0 : 1;
    float _3723 = as_type<float>(_3601) * _3711;
    int _3725 = ~_3497;
    int _3727 = _3725 + 1;
    int _3729 = abs(_3717);
    float _3731 = trunc(_3723);
    float _3733 = precise::max(_3731, 0.0);
    uint _3735 = uint(_3733);
    int _3737 = ~_3697;
    int _3739 = _3737 + 1;
    int _3741 = _3739 + 1;
    int _3743 = abs(_3721);
    int _3745 = _3741;
    if (_3709)
    {
        int _3747 = ~_3697;
        int _3749 = _3747 + 1;
        _3745 = _3749;
    }
    int _3751 = _3745;
    int _3753 = _3727 * int(_3691);
    int _3755 = _3753 + _3617;
    int _3757 = abs(_3655);
    int _3759 = ~_3729;
    int _3761 = _3759 + 1;
    int _3763 = _3761 + 1;
    int _3765 = abs(_3751);
    float _3767 = float(uint(_3755));
    int _3769 = _3763 * as_type<int>(_3543);
    int _3771 = _3769 + _3713;
    float _3773 = _1616 + _1592;
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    float _3781 = as_type<float>(_3611) * _3767;
    int _3783 = ~_3443;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    int _3789 = ~_3743;
    int _3791 = _3789 + 1;
    int _3793 = _3791 + 1;
    int _3795 = _3779 * as_type<int>(_3639);
    int _3797 = ~_3765;
    int _3799 = _3797 + 1;
    int _3801 = _3799 + 1;
    int _3803 = _3787 * as_type<int>(_3579);
    int _3805 = _3803 + _3771;
    float _3807 = _1592 * 0.5;
    float _3809 = trunc(_3781);
    float _3811 = precise::max(_3809, 0.0);
    uint _3813 = uint(_3811);
    bool _3815 = _2371 != 3;
    int _3817 = _3793 * as_type<int>(_3631);
    int _3819 = _3817 + _3795;
    float _3821 = fma(_1620, -0.5, _3807);
    bool _3823 = _3595 != 3;
    bool _3825 = !_3815;
    int _3827 = _3825 ? 0 : (-1);
    int _3829 = _3801 * as_type<int>(_3673);
    int _3831 = _3829 + _3819;
    float _3833 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3435);
    bool _3835 = !_3823;
    int _3837 = _3835 ? 0 : (-1);
    int _3839 = abs(_3827);
    float _3841 = _3833 + _1592;
    int _3843 = int(_3623) + int(_3735);
    out.gl_Position.x = _1616;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _3833;
    out.gl_Position.w = _1592;
    int _3845 = ~_3385;
    int _3847 = _3845 + 1;
    int _3849 = abs(_3837);
    float _3851 = _3841 * 0.5;
    int _3853 = int(_3691) + int(_3813);
    int _3855 = ~_3497;
    int _3857 = _3855 + 1;
    bool _3859 = _3385 == 0;
    bool _3861 = !_1887;
    int _3863 = _3861 ? _3447 : (-1);
    int _3865 = _3847 * _3843;
    int _3867 = _3865 + _3565;
    float _3869 = _3773 * 0.5;
    int _3871 = _3857 * _3853;
    int _3873 = _3871 + _3617;
    int _3875 = ~_3839;
    int _3877 = _3875 + 1;
    int _3879 = _3877 + 1;
    float _3881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3883 = uint(_3867) >= uint(_3385);
    out.m_80.x = _3869;
    out.m_80.y = _3821;
    out.m_80.z = _3851;
    out.m_80.w = _1592;
    int _3885 = ~_3849;
    int _3887 = _3885 + 1;
    int _3889 = _3887 + 1;
    int _3891 = _3879 * as_type<int>(_3587);
    int _3893 = _3891 + _3805;
    bool _3895 = !_2621;
    int _3897 = _3895 ? 0 : 1;
    bool _3899 = !_3883;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = _3889 * as_type<int>(_3681);
    int _3905 = _3903 + _3831;
    bool _3907 = uint(_3873) >= uint(_3497);
    int _3909 = abs(_3897);
    int _3911 = ~_3843;
    int _3913 = _3911 + _3901;
    int _3915 = _3913 + 1;
    int _3917 = _3565 ^ _3385;
    float _3919 = _3881 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3921 = !_3907;
    int _3923 = _3921 ? 0 : (-1);
    bool _3925 = _3385 == 0;
    int _3927 = _3385 * _3915;
    int _3929 = _3927 + _3565;
    uint _3931 = uint(int(uint(_3917) >> uint(31)));
    bool _3933 = !_2629;
    int _3935 = _3933 ? 0 : 1;
    int _3937 = ~_3923;
    int _3939 = _3853 + _3937;
    int _3941 = _3939 + 1;
    int _3943 = ~int(_3931);
    int _3945 = _3943 + 1;
    float _3947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3949 = abs(_3935);
    bool _3951 = !_3925;
    int _3953 = _3951 ? _3929 : (-1);
    int _3955 = _3941 ^ _3945;
    float _3957 = float(_3953);
    int _3959 = ~_3945;
    int _3961 = _3959 + _3955;
    int _3963 = _3961 + 1;
    float _3965 = _966 + 0.5;
    int _3967 = ~_3909;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    float _3973 = fma(_3919, _3957, _3279);
    bool _3975 = !_3859;
    int _3977 = _3975 ? _3963 : (-1);
    bool _3979 = !_3043;
    int _3981 = _3979 ? _3701 : (-1);
    float _3983 = _3947 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3985 = float(_3977);
    int _3987 = _3893 * _3971;
    int _3989 = ~_3949;
    int _3991 = _3989 + 1;
    int _3993 = _3991 + 1;
    float _3995 = fma(_3919, _3965, _3973);
    bool _3997 = _1332 > 0.0;
    bool _3999 = isnan(_1332);
    bool _4001 = _3997 || _3999;
    bool _4003 = isnan(0.0);
    bool _4005 = _4001 || _4003;
    float _4007 = -_3281;
    float _4009 = fma(_3983, _3985, _4007);
    float _4011 = _960 + (-0.5);
    int _4013 = _3863 * _3909;
    int _4015 = _4013 + _3987;
    float _4017 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _4019 = _3905 * _3993;
    float _4021 = -_3983;
    float _4023 = fma(_4021, _4011, _4009);
    float _4025 = _1663 * _2549;
    float _4027 = float(_4015);
    int _4029 = _3981 * _3949;
    int _4031 = _4029 + _4019;
    float _4033 = -_2539;
    float _4035 = _4033 + 1.0;
    float _4037 = -_3419;
    float _4039 = fma(_966, _4037, _3995);
    float _4041 = fma(_960, _3427, _4023);
    out.m_82.x = _4027;
    float _4043 = float(_4031);
    float _4045 = _4017 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4047 = fma(_1669, _4025, _1657);
    float _4049 = fma(_1671, _4025, _1659);
    float _4051 = _1663 * _4035;
    float _4053 = fma(_1663, _3457, _1661);
    out.m_82.w = _4043;
    out.m_84.x = _4039;
    out.m_84.y = _4041;
    out.m_49.x = _4045;
    out.m_86.x = _4047;
    out.m_86.y = _4049;
    out.m_86.z = _4053;
    out.m_86.w = _4051;
    if (_4005)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4055 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4055;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

