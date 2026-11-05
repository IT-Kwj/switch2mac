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
    texture2d<float> vp_t_tcb_10 [[id(6)]];
    sampler vp_t_tcb_10Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_10Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_46.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2995 = as_type<float>(_107);
        out.gl_Position.z = _2995;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_51.w;
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
        float _129 = float(_89);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _97;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_143);
        out.gl_Position.z = _3064;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_53.x;
    float _147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _149 = log2(_147);
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.y;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _159 = 1.0 + _157;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = in.m_53.z;
    float _167 = in.m_58.w;
    float _169 = _149 * _125;
    float _171 = exp2(_169);
    float _173 = _145 * 2.0;
    float _175 = _151 * _163;
    float _177 = _153 * 2.0;
    float _179 = floor(_173);
    int _181 = as_type<int>(_161) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_161) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _191 = isnan(0.0);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _197 = _193 || _195;
    bool _199 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _201 = isnan(1.0);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _207 = _203 || _205;
    float _209 = _145 + _165;
    float _211 = floor(_177);
    float _213 = -_171;
    float _215 = _213 + 1.0;
    float _217 = _209 + (-1.0);
    bool _219 = !_183;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_187;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _229 = _197 ? _215 : 0.0;
    float _231 = 1.0 / _159;
    bool _233 = _179 > 0.0;
    bool _235 = _179 >= 0.0;
    bool _237 = isnan(_179);
    bool _239 = _235 || _237;
    bool _241 = isnan(0.0);
    bool _243 = _239 || _241;
    float _245 = _165 * 2.0;
    bool _247 = _211 > 0.0;
    float _249 = floor(_245);
    bool _251 = _211 >= 0.0;
    bool _253 = isnan(_211);
    bool _255 = _251 || _253;
    bool _257 = isnan(0.0);
    bool _259 = _255 || _257;
    int _261 = _243 ? 0 : 1;
    int _263 = _259 ? 0 : 1;
    float _265 = _217;
    if (_207)
    {
        float _267 = _229 * _231;
        _127 = _267;
    }
    float _269 = _127;
    int _271 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _273 = _271 != 0;
    int _275 = ~_263;
    int _277 = _275 + 1;
    int _279 = _277 + 1;
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = _283 + 1;
    int _287 = _279;
    int _289 = _285;
    if (!_247)
    {
        int _291 = ~_263;
        int _293 = _291 + 1;
        _287 = _293;
    }
    int _295 = _287;
    float _297 = _145 + _153;
    float _299 = as_type<float>(_295);
    if (!_233)
    {
        int _301 = ~_261;
        int _303 = _301 + 1;
        _289 = _303;
    }
    int _305 = _289;
    bool _307 = _249 >= 0.0;
    bool _309 = isnan(_249);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = _297 + (-1.0);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _329 = _249 > 0.0;
    float _331 = in.m_51.x;
    float _333 = in.m_51.y;
    float _335 = in.m_51.z;
    int _337 = _315 ? 0 : 1;
    float _339 = _153 + _165;
    bool _341 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _345 = _341 || _343;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    float _351 = in.m_46.x;
    float _353 = in.m_46.y;
    float _355 = in.m_46.z;
    int _357 = ~_337;
    int _359 = _357 + 1;
    int _361 = _359 + 1;
    float _363 = _339 + (-1.0);
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _367 = _361;
    float _369 = _363;
    if (!_329)
    {
        int _371 = ~_337;
        int _373 = _371 + 1;
        _367 = _373;
    }
    int _375 = _367;
    if (!_349)
    {
        float _377 = _155 * _155;
        float _379 = _377 * 0.5;
        _265 = _379;
    }
    float _381 = _265;
    float _383 = _381;
    if (!_349)
    {
        _369 = _155;
    }
    float _385 = _369;
    float _387 = _385;
    if (!_349)
    {
        float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _389;
    }
    float _391 = _383;
    bool _393 = !_349;
    float _395 = _391;
    if (!_393)
    {
        float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _399 = log2(_397);
        float _401 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _403 = _401 + 1.0;
        float _405 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = _155 * _399;
        float _409 = 1.0 / _403;
        float _411 = _405 * 0.693147182464599609375;
        float _413 = exp2(_407);
        float _415 = 1.0 / _411;
        float _417 = _413 + (-1.0);
        float _419 = -_417;
        float _421 = fma(_419, _415, _155);
        float _423 = _421 * _409;
        float _425 = _423 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _395 = _425;
    }
    float _427 = _395;
    bool _429 = !_349;
    if (!_429)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _155 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _387 = _449;
    }
    float _451 = _387;
    float _453 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _459 = _145 > 0.5;
    float _461 = fma(_451, _333, _453);
    float _463 = fma(_451, _331, _455);
    float _465 = fma(_451, _335, _457);
    float _467 = -_221;
    int _469 = _459 ? as_type<int>(_467) : as_type<int>(_221);
    float _471 = fma(_461, _167, _353);
    float _473 = fma(_463, _167, _351);
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = fma(_465, _167, _355);
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = !_321;
    float _487 = _485 ? _221 : as_type<float>(_469);
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _479);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    bool _495 = _153 > 0.5;
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _499 = _487 + 0.5;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = -_225;
    int _513 = _495 ? as_type<int>(_511) : as_type<int>(_225);
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _517 = _505 + _515;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = !_325;
    float _527 = _525 ? _225 : as_type<float>(_513);
    float _529 = _507 * _475;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _509 + _545;
    float _549 = _517 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _517 * _517;
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _543 + _561;
    float _565 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    bool _567 = !_541;
    int _569 = _567 ? 0 : 1;
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    out.m_60.w = _551;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _565);
    float _575 = -_527;
    float _577 = _575 + 0.5;
    bool _579 = _573 >= 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _591 = _589 != 0;
    float _593 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _595 = !_537;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_547, _547, _559);
    int _601 = abs(_569);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = float(_295);
    float _607 = fma(_563, _563, _599);
    float _609 = float(_601);
    float _611 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _613 = !_533;
    int _615 = _613 ? 0 : 1;
    float _617 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _621 = _609 * _605;
    int _623 = abs(_615);
    float _625 = rsqrt(_607);
    float _627 = in.m_62.x;
    float _629 = in.m_62.y;
    float _631 = in.m_62.z;
    int _633 = abs(_597);
    float _635 = _619 * _571;
    float _637 = _509;
    float _639 = _505;
    float _641 = _543;
    if (_579)
    {
        _299 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _643 = _299;
    out.m_64.x = _593;
    out.m_64.y = _611;
    out.m_64.z = _617;
    float _645 = float(_305);
    int _647 = as_type<int>(_643);
    if (_579)
    {
        float _649 = _643 * 5.0;
        _647 = as_type<int>(_649);
    }
    int _651 = _647;
    out.m_66.x = _529;
    out.m_66.y = _635;
    float _653 = float(_375);
    float _655 = float(_623);
    if (_579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3857 = as_type<float>(_651);
        out.gl_Position.z = _3857;
    }
    if (_579)
    {
        out.m_49.x = 0.0;
    }
    float _657 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    float _663 = _517 * _625;
    float _665 = float(_633);
    float _667 = _547 * _625;
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = _665 * _645;
    if (_579)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _679 = _563 * _625;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _685 = _655 * _653;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _677 + _687;
    float _691 = -_679;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _683 + _695;
    float _699 = _685 * (-2.0);
    float _701 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _705 = _693 + _703;
    float _707 = floor(_657);
    float _709 = _621 * (-2.0);
    float _711 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _701);
    float _713 = fma(_327, _699, _327);
    float _715 = fma(_699, _627, _627);
    float _717 = _145 + (-0.5);
    float _719 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _721 = fma(_227, _709, _227);
    float _723 = fma(_709, _631, _631);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _727 = _165 + (-0.5);
    bool _729 = _719 >= 0.0;
    float _731 = in.m_58.x;
    float _733 = fma(_713, _269, _725);
    int _735 = abs(_661);
    float _737 = -_707;
    float _739 = _657 + _737;
    float _741 = _657 * 6.283185482025146484375;
    float _743 = in.m_58.y;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _747 = float(_735);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = -_739;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _755 = _733 * 0.15915493667125701904296875;
    float _757 = _713;
    int _759 = as_type<int>(_749);
    if (_729)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _761 = _757;
    float _763 = _749 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _673 * (-2.0);
    if (_729)
    {
        out.m_49.x = 0.0;
    }
    float _769 = fma(_721, _269, _745);
    float _771 = fma(_365, _767, _365);
    float _773 = fma(_767, _629, _629);
    float _775 = _755 * 6.283185482025146484375;
    float _777 = sin(_775);
    if (_729)
    {
        float _779 = _761 * 5.0;
        _759 = as_type<int>(_779);
    }
    int _781 = _759;
    float _783 = abs(_753);
    float _785 = _747 * _783;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_781);
        out.gl_Position.z = _4075;
    }
    float _787 = _755 * 6.283185482025146484375;
    float _789 = cos(_787);
    if (_729)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _791 = -_505;
    float _793 = _791 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _795 = !_273;
    int _797 = _795 ? 0 : 1;
    float _799 = -_509;
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = -_543;
    float _805 = _803 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _793 * _793;
    int _809 = abs(_797);
    float _811 = fma(_765, 0.5, 0.5);
    int _813 = abs(_671);
    float _815 = fma(_801, _801, _807);
    float _817 = -_811;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _821 = _769 * 0.15915493667125701904296875;
    float _823 = fma(_805, _805, _815);
    float _825 = float(_809);
    float _827 = -_663;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    bool _831 = _739 < 0.5;
    float _833 = float(_831);
    float _835 = rsqrt(_823);
    float _837 = _153 + (-0.5);
    float _839 = fma(_825, _819, _785);
    float _841 = -_667;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _851 = float(_813);
    float _853 = -_679;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _857 = _829 * _829;
    float _859 = fma(_771, _269, _849);
    float _861 = _743 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _863 = abs(_847);
    float _865 = fma(_851, _863, _839);
    float _867 = fma(_843, _843, _857);
    float _869 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _871 = _821 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _859 * 0.15915493667125701904296875;
    float _877 = fma(_855, _855, _867);
    float _879 = _865 * _869;
    float _881 = _801 * _835;
    float _883 = _865 * _861;
    float _885 = _805 * _835;
    float _887 = _793 * _835;
    float _889 = _821 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = _881 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _899 = _885 * _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _903 = _887 * _901;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _909 = -_895;
    float _911 = fma(_885, _907, _909);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _915 = -_899;
    float _917 = fma(_887, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_903;
    float _923 = fma(_881, _919, _921);
    float _925 = sqrt(_877);
    float _927 = _911 * _911;
    float _929 = _777 * _873;
    float _931 = fma(_917, _917, _927);
    float _933 = _875 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _789 * _891;
    float _939 = _875 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _625 * _925;
    float _945 = fma(_923, _923, _931);
    float _947 = fma(_935, _929, _937);
    float _949 = fma(_935, _937, _929);
    float _951 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = rsqrt(_945);
    float _957 = _943 * _951;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _961 = _943 * _953;
    float _963 = _789 * _873;
    float _965 = _905 * _957;
    float _967 = _777 * _891;
    float _969 = _959 * _961;
    float _971 = _789 * _941;
    float _973 = _941 * _965;
    float _975 = _777 * _941;
    float _977 = _947 * _969;
    float _979 = -_963;
    float _981 = fma(_935, _967, _979);
    float _983 = -_967;
    float _985 = fma(_935, _963, _983);
    float _987 = _975 * _969;
    float _989 = fma(_873, _973, _977);
    float _991 = _911 * _955;
    float _993 = _917 * _955;
    float _995 = _981 * _969;
    float _997 = _923 * _955;
    float _999 = _943 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1001 = _999 * 0.5;
    float _1003 = _885 * _991;
    float _1005 = _887 * _993;
    float _1007 = fma(_891, _973, _995);
    float _1009 = fma(_985, _1001, _989);
    float _1011 = -_1003;
    float _1013 = fma(_887, _997, _1011);
    float _1015 = -_1005;
    float _1017 = fma(_881, _991, _1015);
    float _1019 = -_935;
    float _1021 = fma(_1019, _965, _987);
    float _1023 = fma(_949, _1001, _1007);
    float _1025 = _1013 * _1009;
    float _1027 = _1017 * _1009;
    float _1029 = fma(_971, _1001, _1021);
    float _1031 = fma(_993, _1023, _1025);
    float _1033 = fma(_997, _1023, _1027);
    float _1035 = _881 * _997;
    float _1037 = fma(_881, _1029, _1031);
    float _1039 = fma(_885, _1029, _1033);
    float _1041 = -_1035;
    float _1043 = fma(_885, _993, _1041);
    float _1045 = _509 + _1037;
    float _1047 = _543 + _1039;
    float _1049 = _1043 * _1009;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_991, _1023, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = fma(_887, _1029, _1059);
    float _1067 = _1061 + _1063;
    float _1069 = _505 + _1065;
    float _1071 = sqrt(_1067);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = _993;
    float _1077 = _1023;
    float _1079 = _1061;
    float _1081 = _1063;
    float _1083 = _1045;
    if (!_1073)
    {
        _1075 = _1047;
    }
    float _1085 = _1075;
    float _1087 = _1085;
    if (!_1073)
    {
        _1077 = _1069;
    }
    float _1089 = _1077;
    bool _1091 = !_1073;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1071 + _1097;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1067);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = _1103 * _1117;
        float _1121 = _1115 + (-1.0);
        float _1123 = fma(_1053, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1057, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1127 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1131 = _1123 + _1129;
        float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1135 = _1125 + _1133;
        float _1137 = fma(_1069, _1115, _1127);
        float _1139 = _1131 * _1131;
        float _1141 = _1135 * _1135;
        _1093 = _1137;
        _1079 = _1139;
        _1081 = _1141;
        _1083 = _1123;
        _1087 = _1125;
    }
    float _1143 = _1093;
    float _1145 = _1079;
    float _1147 = _1081;
    float _1149 = _1083;
    float _1151 = _1087;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1155 = _1143 + _1153;
    float _1157 = fma(_1155, _1155, _1145);
    float _1159 = _1157 + _1147;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1165 = isnan(_1161);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1171 = _1167 || _1169;
    float _1173 = _1157;
    if (!_1171)
    {
        _1173 = 1.0;
    }
    float _1175 = _1173;
    bool _1177 = !_1171;
    float _1179 = _1175;
    if (!_1177)
    {
        bool _1181 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1183 = isnan(_1161);
        bool _1185 = _1181 || _1183;
        bool _1187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1189 = _1185 || _1187;
        if (!_1189)
        {
            float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1193 = _1161 + _1191;
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1201 = _1199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1203 = 1.0 / _1197;
            float _1205 = _1193 * _1203;
            float _1207 = fma(_1205, _1201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1179 = _1207;
            _1209 = true;
        }
        else
        {
            bool _1211 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1213 = isnan(_1161);
            bool _1215 = _1211 || _1213;
            bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1219 = _1215 || _1217;
            if (!_1219)
            {
                float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1223 = _1161 + _1221;
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1233 = 1.0 / _1227;
                float _1235 = _1223 * _1233;
                float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1179 = _1237;
                _1209 = true;
            }
            else
            {
                _1179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1209 = false;
    float _1239 = _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1243 = _1149 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1247 = _1143 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1251 = _1151 + _1249;
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1265 = fma(_1247, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1267 = fma(_1251, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1269 = -_667;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1273 = -_663;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1277 = -_679;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1281 = _1275;
    float _1283 = _1271;
    float _1285 = _1279;
    if (!_1261)
    {
        float _1287 = _689 * _689;
        float _1289 = -_509;
        float _1291 = _1289 + _1263;
        float _1293 = -_505;
        float _1295 = _1293 + _1265;
        float _1297 = fma(_697, _697, _1287);
        float _1299 = 1.0 / _943;
        float _1301 = fma(_705, _705, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1305;
        float _1311 = _1309 * _1299;
        float _1313 = -_543;
        float _1315 = _1313 + _1267;
        float _1317 = fma(_1291, _1311, _683);
        float _1319 = fma(_1295, _1311, _677);
        float _1321 = fma(_1315, _1311, _693);
        _1281 = _1319;
        _1283 = _1317;
        _1285 = _1321;
        _637 = _1291;
        _639 = _1295;
    }
    float _1323 = _1281;
    float _1325 = _1283;
    float _1327 = _1285;
    float _1329 = _637;
    float _1331 = _639;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1325 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1327 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = fma(_1339, _1339, _1345);
    float _1349 = fma(_1343, _1343, _1347);
    float _1351 = rsqrt(_1349);
    float _1353 = sqrt(_1349);
    float _1355 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1357 = _1339 * _1355;
    float _1359 = _1343 * _1355;
    float _1361 = _1357 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 + _1363;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = _1367 + _1371;
    float _1375 = _1351;
    float _1377 = _1365;
    float _1379 = _1373;
    float _1381 = _1329;
    float _1383 = _1335;
    float _1385 = _1331;
    if (_1369)
    {
        float _1387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1387;
    }
    float _1389 = _1375;
    if (_1369)
    {
        float _1391 = rsqrt(_1365);
        _1377 = _1391;
    }
    float _1393 = _1377;
    if (_1369)
    {
        float _1395 = _1373 * _1389;
        _1379 = _1395;
    }
    float _1397 = _1379;
    if (_1369)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1381 = _1399;
    }
    float _1401 = _1381;
    float _1403 = _1343;
    if (_1369)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1389;
    float _1417 = _1413;
    if (_1369)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1355;
    float _1427 = -_1413;
    float _1429 = fma(_1335, _1425, _1427);
    if (_1369)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1431;
    }
    float _1433 = _1383;
    float _1435 = _677 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1369)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1385 = _1441;
    }
    float _1443 = _1385;
    float _1445 = _1443;
    if (!_1369)
    {
        _1437 = _1357;
    }
    float _1447 = _1437;
    float _1449 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1435);
    float _1451 = _1447;
    if (!_1369)
    {
        _1439 = _1429;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    float _1457 = _1423;
    if (_1369)
    {
        float _1459 = _1423 + (-1.0);
        _1417 = _1459;
    }
    float _1461 = _1417;
    float _1463 = _1461;
    if (_1369)
    {
        float _1465 = _1393 * _1443;
        _1445 = _1465;
    }
    float _1467 = _1445;
    float _1469 = _677 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1471 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1449);
    if (_1369)
    {
        float _1473 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _641 = _1473;
    }
    float _1475 = _641;
    float _1477 = _1475;
    if (_1369)
    {
        float _1479 = _1357 * _1467;
        _1451 = _1479;
    }
    float _1481 = _1451;
    if (!_1369)
    {
        _1463 = _1359;
    }
    float _1483 = _1463;
    float _1485 = _1483;
    if (_1369)
    {
        float _1487 = _1359 * _1467;
        _1485 = _1487;
    }
    float _1489 = _1485;
    if (_1369)
    {
        float _1491 = fma(_1429, _1423, _1475);
        _1455 = _1491;
    }
    float _1493 = _1455;
    if (!_1369)
    {
        _1477 = _1361;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1369)
    {
        float _1499 = _1481 * _1481;
        _1497 = _1499;
    }
    float _1501 = _1497;
    if (!_1369)
    {
        _1457 = _1363;
    }
    float _1503 = _1457;
    float _1505 = _1503;
    if (_1369)
    {
        float _1507 = _1489 * _1489;
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1469);
    float _1513 = fma(_1493, _1493, _1501);
    float _1515 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1517 = _1513 + _1509;
    float _1519 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1511);
    float _1521 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1525 = fma(_1353, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1523);
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = rsqrt(_1517);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1533 = _1521 * 0.5;
    float _1535 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1537 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1539 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1541 = fma(_1531, -0.5, _1533);
    float _1543 = -_1527;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1549 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1535);
    float _1551 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1515);
    float _1553 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1539);
    float _1555 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1557 = abs(_1545);
    float _1559 = log2(_1557);
    float _1561 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1563 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1551);
    float _1565 = _1529 * _1481;
    float _1567 = _1529 * _1493;
    float _1569 = _1529 * _1489;
    float _1571 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1575 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1577 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1581 = -_1573;
    float _1583 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1581);
    float _1585 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = -_1569;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1583);
    float _1593 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1579);
    float _1597 = fma(_1591, -0.5, 0.5);
    float _1599 = fma(_1591, 0.5, 0.5);
    float _1601 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1595);
    float _1603 = exp2(_1593);
    float _1605 = _1567 + 1.0;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1601);
    float _1611 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1613 = fma(_1599, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1615 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1541);
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1619 = _1541 + _1617;
    float _1621 = sqrt(_1597);
    float _1623 = -_1611;
    float _1625 = fma(_1623, _1607, 1.0);
    float _1627 = fma(_1599, _1613, -0.212114393711090087890625);
    float _1629 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1631 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1635 = fma(_1599, _1627, 1.570728778839111328125);
    float _1637 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1541);
    float _1639 = -_1567;
    float _1641 = fma(_1603, _1605, _1639);
    float _1643 = _677 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1645 = 1.0 / _1609;
    float _1647 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1629);
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1651 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1643);
    float _1653 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1541);
    float _1655 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1657 = _1621 * 0.636619746685028076171875;
    float _1659 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1651);
    float _1661 = 1.0 / _1521;
    float _1663 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1649);
    float _1665 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1667 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1669 = -_1635;
    float _1671 = fma(_1657, _1669, 1.0);
    float _1673 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1663);
    float _1675 = fma(_1641, 0.5, 0.5);
    float _1677 = _1667 + _1521;
    float _1679 = _1665 * _1645;
    float _1681 = _1673 * _1645;
    float _1683 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1541);
    float _1685 = _1677 * 0.5;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1541);
    float _1693 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1685);
    float _1695 = _1541 * _1661;
    float _1697 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1541);
    float _1699 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1541);
    float _1701 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1541);
    float _1703 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1541);
    float _1705 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1541);
    float _1707 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1541);
    float _1709 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1541);
    float _1711 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1541);
    float _1713 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1541);
    float _1715 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1541);
    float _1717 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1541);
    float _1719 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1541);
    float _1721 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1541);
    float _1723 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1541);
    float _1725 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1541);
    float _1727 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1541);
    float _1729 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1541);
    float _1731 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1685);
    float _1733 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1685);
    float _1735 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1685);
    float _1737 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1685);
    float _1739 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1685);
    float _1741 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1685);
    float _1743 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1685);
    float _1745 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1685);
    float _1747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1685);
    float _1749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1685);
    float _1751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1685);
    float _1753 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1685);
    float _1755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1685);
    float _1757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1685);
    float _1759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1685);
    float _1761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1685);
    float _1763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1685);
    float _1765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1685);
    float _1767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1685);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1771 = _1685 + _1769;
    float _1773 = _1685 * _1661;
    float _1775 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1777 = _1693 * _1661;
    float _1779 = _1691 * _1661;
    float _1781 = _1615 * _1661;
    float _1783 = _1731 * _1661;
    float _1785 = _1771 * _1661;
    float _1787 = _1619 * _1661;
    float2 _5739 = float2(_1777, _1779);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5739, float2(0.0), isnan(_5739)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5739, float2(0.0), isnan(_5739)), level(0.0)).x;
    float _1791 = _1633 * _1661;
    float2 _5752 = float2(_1783, _1781);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5752, float2(0.0), isnan(_5752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5752, float2(0.0), isnan(_5752)), level(0.0)).x;
    float _1795 = _1637 * _1661;
    float2 _5763 = float2(_1785, _1695);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).x;
    float2 _5771 = float2(_1773, _1787);
    float _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5771, float2(0.0), isnan(_5771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5771, float2(0.0), isnan(_5771)), level(0.0)).x;
    float _1801 = _1775 * _1661;
    float2 _5782 = float2(_1773, _1791);
    float _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5782, float2(0.0), isnan(_5782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5782, float2(0.0), isnan(_5782)), level(0.0)).x;
    float _1805 = _1733 * _1661;
    float2 _5793 = float2(_1783, _1795);
    float _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5793, float2(0.0), isnan(_5793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5793, float2(0.0), isnan(_5793)), level(0.0)).x;
    float _1809 = _1653 * _1661;
    float _1811 = _1735 * _1661;
    float2 _5807 = float2(_1801, _1695);
    float _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).x;
    float _1815 = _1683 * _1661;
    float2 _5818 = float2(_1805, _1809);
    float _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1819 = _1737 * _1661;
    float _1821 = _1697 * _1661;
    float2 _5832 = float2(_1811, _1815);
    float _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5832, float2(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5832, float2(0.0), isnan(_5832)), level(0.0)).x;
    float _1825 = log2(_1625);
    float _1827 = _1739 * _1661;
    float _1829 = _1725 * _1661;
    float2 _5848 = float2(_1819, _1695);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1833 = _1699 * _1661;
    float2 _5859 = float2(_1827, _1821);
    float _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).x;
    float2 _5867 = float2(_1773, _1779);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5867, float2(0.0), isnan(_5867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5867, float2(0.0), isnan(_5867)), level(0.0)).x;
    float _1839 = _1741 * _1661;
    float _1841 = _1701 * _1661;
    float _1843 = _1729 * _1661;
    float _1845 = _1743 * _1661;
    float _1847 = _1703 * _1661;
    float _1849 = _1705 * _1661;
    float _1851 = _1745 * _1661;
    float _1853 = _1747 * _1661;
    float _1855 = _1709 * _1661;
    float _1857 = _1825 * 0.693147182464599609375;
    float _1859 = _1727 * _1661;
    float _1861 = _1707 * _1661;
    float2 _5910 = float2(_1773, _1809);
    float _1863 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5910, float2(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5910, float2(0.0), isnan(_5910)), level(0.0)).x;
    float2 _5918 = float2(_1827, _1833);
    float _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5918, float2(0.0), isnan(_5918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5918, float2(0.0), isnan(_5918)), level(0.0)).x;
    float _1867 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = _1711 * _1661;
    float2 _5933 = float2(_1783, _1695);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5933, float2(0.0), isnan(_5933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5933, float2(0.0), isnan(_5933)), level(0.0)).x;
    float2 _5941 = float2(_1839, _1841);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).x;
    float _1875 = _1723 * _1661;
    float _1877 = _1749 * _1661;
    float2 _5955 = float2(_1845, _1847);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float2 _5963 = float2(_1851, _1695);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).x;
    float2 _5971 = float2(_1853, _1849);
    float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5971, float2(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5971, float2(0.0), isnan(_5971)), level(0.0)).x;
    float2 _5979 = float2(_1773, _1861);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float2 _5987 = float2(_1773, _1855);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5987, float2(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5987, float2(0.0), isnan(_5987)), level(0.0)).x;
    float2 _5995 = float2(_1853, _1869);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5995, float2(0.0), isnan(_5995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5995, float2(0.0), isnan(_5995)), level(0.0)).x;
    float2 _6003 = float2(_1877, _1695);
    float _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).x;
    float _1893 = _1751 * _1661;
    float _1895 = _1753 * _1661;
    float _1897 = _1713 * _1661;
    float _1899 = _1755 * _1661;
    float _1901 = _1715 * _1661;
    float _1903 = _1757 * _1661;
    float _1905 = _1717 * _1661;
    float _1907 = _1759 * _1661;
    float _1909 = _1719 * _1661;
    float _1911 = _1761 * _1661;
    float _1913 = _1721 * _1661;
    float _1915 = _1763 * _1661;
    float2 _6047 = float2(_1893, _1897);
    float _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).x;
    float2 _6055 = float2(_1895, _1901);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6055, float2(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6055, float2(0.0), isnan(_6055)), level(0.0)).x;
    float2 _6063 = float2(_1899, _1905);
    float _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6063, float2(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6063, float2(0.0), isnan(_6063)), level(0.0)).x;
    float2 _6071 = float2(_1903, _1909);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).x;
    float2 _6079 = float2(_1907, _1913);
    float _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6079, float2(0.0), isnan(_6079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6079, float2(0.0), isnan(_6079)), level(0.0)).x;
    float2 _6087 = float2(_1911, _1875);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6087, float2(0.0), isnan(_6087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6087, float2(0.0), isnan(_6087)), level(0.0)).x;
    float2 _6095 = float2(_1915, _1829);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _1931 = _1765 * _1661;
    float _1933 = _1767 * _1661;
    float2 _6109 = float2(_1931, _1859);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6109, float2(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6109, float2(0.0), isnan(_6109)), level(0.0)).x;
    float2 _6117 = float2(_1933, _1843);
    float _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6117, float2(0.0), isnan(_6117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6117, float2(0.0), isnan(_6117)), level(0.0)).x;
    float2 _6125 = float2(_1773, _1695);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6125, float2(0.0), isnan(_6125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6125, float2(0.0), isnan(_6125)), level(0.0)).x;
    float3 _6134 = float3(_1687, _1689, _1867);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6134, float3(0.0), isnan(_6134)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6134, float3(0.0), isnan(_6134)), level(0.0)).x;
    float3 _6145 = float3(_1687, _1689, _1867);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _6161 = float2(_1671, _1675);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = _677 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1966 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1968 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1964);
    float _1970 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1966);
    float _1972 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1968);
    float _1974 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1976 = _1974 + _1521;
    float _1978 = _1976 * _1661;
    float _1980 = _1978 * 0.5;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1984 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1982);
    float _1986 = 1.0 / _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1990 = _1986 * _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1994 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1998 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1996);
    float _2000 = 1.0 / _1994;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2008 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2006);
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2012 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2010);
    float _2014 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2016 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2014);
    float _2018 = 1.0 / _2004;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2022 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2020);
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2030 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2028);
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = -_1990;
    float _2036 = fma(_2000, _2032, _2034);
    float _2038 = 1.0 / _2008;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2050 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2048);
    bool _2052 = _2036 >= 0.0;
    bool _2054 = isnan(_2036);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = 1.0 / _1998;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2066 = -_1990;
    float _2068 = fma(_2038, _2064, _2066);
    float _2070 = 1.0 / _2022;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2074 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2072);
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2078 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2082 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2080);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2086 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2084);
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = -_1990;
    float _2092 = fma(_2062, _2088, _2090);
    float _2094 = 1.0 / _2042;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2098 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2096);
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2102 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2100);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2106 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
    bool _2108 = _2092 >= 0.0;
    bool _2110 = isnan(_2092);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2120 = -_1990;
    float _2122 = fma(_2018, _2118, _2120);
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2126 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2124);
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2130 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2128);
    bool _2132 = !_2116;
    float _2134 = _2132 ? 0.0 : 2.0;
    float _2136 = 1.0 / _2050;
    bool _2138 = _2122 >= 0.0;
    bool _2140 = isnan(_2122);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2152 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2150);
    bool _2154 = !_2060;
    float _2156 = _2154 ? 0.0 : 2.0;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2160 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2158);
    float _2162 = _2156 + _2148;
    bool _2164 = _2068 >= 0.0;
    bool _2166 = isnan(_2068);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(0.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = -_1990;
    float _2180 = fma(_2070, _2176, _2178);
    float _2182 = 1.0 / _2102;
    float _2184 = _2162 + _2134;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2188 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2186);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2192 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2190);
    bool _2194 = _2180 >= 0.0;
    bool _2196 = isnan(_2180);
    bool _2198 = _2194 || _2196;
    bool _2200 = isnan(0.0);
    bool _2202 = _2198 || _2200;
    float _2204 = float(_2202);
    float _2206 = _2184 + _2174;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2210 = -_1990;
    float _2212 = fma(_2094, _2208, _2210);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = 1.0 / _2012;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2222 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2220);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2230 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2234 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2232);
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2238 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2236);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2246 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2244);
    float _2248 = 1.0 / _2160;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2252 = -_1990;
    float _2254 = fma(_2218, _2250, _2252);
    float _2256 = 1.0 / _2246;
    bool _2258 = _2254 >= 0.0;
    bool _2260 = isnan(_2254);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = float(_2266);
    float _2270 = _2206 + _2268;
    float _2272 = 1.0 / _2016;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1990;
    float _2278 = fma(_2272, _2274, _2276);
    bool _2280 = _2278 >= 0.0;
    bool _2282 = isnan(_2278);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.0);
    bool _2288 = _2284 || _2286;
    bool _2290 = !_2288;
    float _2292 = _2290 ? 0.0 : 2.0;
    float _2294 = _2270 + _2292;
    float _2296 = 1.0 / _2026;
    float _2298 = _2294 + _2204;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2302 = -_1990;
    float _2304 = fma(_2296, _2300, _2302);
    bool _2306 = _2304 >= 0.0;
    bool _2308 = isnan(_2304);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan(0.0);
    bool _2314 = _2310 || _2312;
    float _2316 = 1.0 / _2030;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_1990;
    float _2322 = fma(_2316, _2318, _2320);
    bool _2324 = _2322 >= 0.0;
    bool _2326 = isnan(_2322);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    bool _2334 = !_2314;
    float _2336 = _2334 ? 0.0 : 2.0;
    bool _2338 = !_2332;
    float _2340 = _2338 ? 0.0 : 2.0;
    float _2342 = _2298 + _2336;
    bool _2344 = _2212 >= 0.0;
    bool _2346 = isnan(_2212);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2358 = -_1990;
    float _2360 = fma(_2136, _2356, _2358);
    float _2362 = _2342 + _2340;
    float _2364 = 1.0 / _2074;
    float _2366 = _2362 + _2354;
    float _2368 = 1.0 / _2046;
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2372 = -_1990;
    float _2374 = fma(_2364, _2370, _2372);
    bool _2376 = _2360 >= 0.0;
    bool _2378 = isnan(_2360);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2390 = -_1990;
    float _2392 = fma(_2368, _2388, _2390);
    bool _2394 = _2392 >= 0.0;
    bool _2396 = isnan(_2392);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    bool _2404 = !_2402;
    float _2406 = _2404 ? 0.0 : 2.0;
    float _2408 = _2366 + _2406;
    bool _2410 = _2374 >= 0.0;
    bool _2412 = isnan(_2374);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(0.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2408 + _2386;
    float _2424 = 1.0 / _2082;
    float _2426 = _2422 + _2420;
    float _2428 = 1.0 / _2078;
    float _2430 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2432 = -_1990;
    float _2434 = fma(_2424, _2430, _2432);
    bool _2436 = _2434 >= 0.0;
    bool _2438 = isnan(_2434);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = float(_2444);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2450 = -_1990;
    float _2452 = fma(_2182, _2448, _2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = -_1990;
    float _2458 = fma(_2428, _2454, _2456);
    bool _2460 = _2458 >= 0.0;
    bool _2462 = isnan(_2458);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(0.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = !_2468;
    float _2472 = _2470 ? 0.0 : 2.0;
    float _2474 = _2426 + _2472;
    float _2476 = 1.0 / _2086;
    float _2478 = _2474 + _2446;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2482 = -_1990;
    float _2484 = fma(_2476, _2480, _2482);
    bool _2486 = _2484 >= 0.0;
    bool _2488 = isnan(_2484);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = 1.0 / _2098;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = -_1990;
    float _2502 = fma(_2496, _2498, _2500);
    bool _2504 = _2502 >= 0.0;
    bool _2506 = isnan(_2502);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = !_2494;
    float _2516 = _2514 ? 0.0 : 2.0;
    bool _2518 = !_2512;
    float _2520 = _2518 ? 0.0 : 2.0;
    float _2522 = _2478 + _2516;
    bool _2524 = _2452 >= 0.0;
    bool _2526 = isnan(_2452);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.0);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = _2522 + _2520;
    float _2538 = _2536 + _2534;
    float _2540 = 1.0 / _2106;
    float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2544 = -_1990;
    float _2546 = fma(_2540, _2542, _2544);
    bool _2548 = _2546 >= 0.0;
    bool _2550 = isnan(_2546);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.0);
    bool _2556 = _2552 || _2554;
    float _2558 = 1.0 / _2126;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_1990;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = !_2556;
    float _2568 = _2566 ? 0.0 : 2.0;
    bool _2570 = _2564 >= 0.0;
    bool _2572 = isnan(_2564);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2538 + _2568;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2586 = -_1990;
    float _2588 = fma(_2248, _2584, _2586);
    float _2590 = 1.0 / _2130;
    float _2592 = _2582 + _2580;
    bool _2594 = _2588 >= 0.0;
    bool _2596 = isnan(_2588);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2608 = -_1990;
    float _2610 = fma(_2590, _2606, _2608);
    bool _2612 = _2610 >= 0.0;
    bool _2614 = isnan(_2610);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = _2592 + _2622;
    float _2626 = 1.0 / _2152;
    float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2630 = -_1990;
    float _2632 = fma(_2626, _2628, _2630);
    bool _2634 = _2632 >= 0.0;
    bool _2636 = isnan(_2632);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2642;
    float _2646 = _2644 ? 0.0 : 2.0;
    float _2648 = _2624 + _2646;
    float _2650 = 1.0 / _2188;
    float _2652 = _2648 + _2604;
    float _2654 = 1.0 / _2234;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_1990;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2660 >= 0.0;
    bool _2664 = isnan(_2660);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = 1.0 / _2192;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_1990;
    float _2678 = fma(_2654, _2674, _2676);
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = -_1990;
    float _2684 = fma(_2672, _2680, _2682);
    bool _2686 = _2684 >= 0.0;
    bool _2688 = isnan(_2684);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = 1.0 / _2216;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2700 = -_1990;
    float _2702 = fma(_2696, _2698, _2700);
    bool _2704 = _2702 >= 0.0;
    bool _2706 = isnan(_2702);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan(0.0);
    bool _2712 = _2708 || _2710;
    float _2714 = 1.0 / _2222;
    bool _2716 = !_2712;
    float _2718 = _2716 ? 0.0 : 3.0;
    float _2720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2722 = -_1990;
    float _2724 = fma(_2714, _2720, _2722);
    bool _2726 = _2724 >= 0.0;
    bool _2728 = isnan(_2724);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan(0.0);
    bool _2734 = _2730 || _2732;
    float _2736 = 1.0 / _2226;
    bool _2738 = !_2734;
    float _2740 = _2738 ? 0.0 : 3.0;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2744 = -_1990;
    float _2746 = fma(_2736, _2742, _2744);
    bool _2748 = _2746 >= 0.0;
    bool _2750 = isnan(_2746);
    bool _2752 = _2748 || _2750;
    bool _2754 = isnan(0.0);
    bool _2756 = _2752 || _2754;
    float _2758 = 1.0 / _2230;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2762 = -_1990;
    float _2764 = fma(_2758, _2760, _2762);
    bool _2766 = _2764 >= 0.0;
    bool _2768 = isnan(_2764);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    bool _2776 = !_2694;
    float _2778 = _2776 ? 0.0 : 3.0;
    bool _2780 = _2678 >= 0.0;
    bool _2782 = isnan(_2678);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan(0.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = !_2774;
    float _2792 = _2790 ? 0.0 : 3.0;
    float _2794 = _2778 + _2718;
    bool _2796 = !_2756;
    float _2798 = _2796 ? 0.0 : 3.0;
    bool _2800 = !_2788;
    float _2802 = _2800 ? 0.0 : 3.0;
    float _2804 = _2794 + _2740;
    float _2806 = _2804 + _2798;
    bool _2808 = !_2670;
    float _2810 = _2808 ? 0.0 : 2.0;
    float _2812 = _2806 + _2792;
    float _2814 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2652 + _2810;
    float _2818 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _2820 = _2812 + _2802;
    float _2822 = 1.0 / _2238;
    float _2824 = _2816 * 0.02857142873108386993408203125;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2818);
    float _2830 = _2828 + _1609;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2828;
    out.gl_Position.w = _1609;
    float _2832 = 1.0 / _2242;
    float _2834 = _2830 * 0.5;
    out.m_68.z = _2834;
    out.m_68.w = _1609;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = -_1990;
    float _2840 = fma(_2822, _2836, _2838);
    float _2842 = exp2(_2814);
    bool _2844 = _2840 >= 0.0;
    bool _2846 = isnan(_2840);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan(0.0);
    bool _2852 = _2848 || _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = -_1990;
    float _2858 = fma(_2832, _2854, _2856);
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2862 = -_1990;
    float _2864 = fma(_2256, _2860, _2862);
    bool _2866 = !_2852;
    float _2868 = _2866 ? 0.0 : 3.0;
    bool _2870 = _2858 >= 0.0;
    bool _2872 = isnan(_2858);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    bool _2880 = _2864 >= 0.0;
    bool _2882 = isnan(_2864);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2820 + _2868;
    bool _2892 = !_2878;
    float _2894 = _2892 ? 0.0 : 3.0;
    float _2896 = -_2842;
    float _2898 = _2896 + 1.0;
    bool _2900 = !_2888;
    float _2902 = _2900 ? 0.0 : 5.0;
    float _2904 = _2890 + _2894;
    float _2906 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2908 = _2904 + _2902;
    float _2910 = _2906 * _1941;
    float _2912 = -_2906;
    float _2914 = _2912 + 1.0;
    float _2916 = _2908 * 0.14285714924335479736328125;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _1952 * _2910;
    float _2922 = _1962 * _2910;
    float _2924 = _2826 * _2918;
    float _2926 = fma(_1958, _2920, _1946);
    float _2928 = _2924 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = fma(_1960, _2920, _1948);
    float _2932 = _1952 * _2914;
    float _2934 = fma(_1952, _2922, _1950);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2926;
    out.m_70.y = _2930;
    out.m_70.z = _2934;
    out.m_70.w = _2932;
    out.m_49.x = _2936;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_46.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2995 = as_type<float>(_107);
        out.gl_Position.z = _2995;
    }
    if (!_93)
    {
        return out;
    }
    float _111 = in.m_51.w;
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
        float _129 = float(_89);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _97;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_143);
        out.gl_Position.z = _3064;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_53.x;
    float _147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _149 = log2(_147);
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.y;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _159 = 1.0 + _157;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = in.m_53.z;
    float _167 = in.m_58.w;
    float _169 = _149 * _125;
    float _171 = exp2(_169);
    float _173 = _145 * 2.0;
    float _175 = _151 * _163;
    float _177 = _153 * 2.0;
    float _179 = floor(_173);
    int _181 = as_type<int>(_161) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_161) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _191 = isnan(0.0);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _197 = _193 || _195;
    bool _199 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _201 = isnan(1.0);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _207 = _203 || _205;
    float _209 = _145 + _165;
    float _211 = floor(_177);
    float _213 = -_171;
    float _215 = _213 + 1.0;
    float _217 = _209 + (-1.0);
    bool _219 = !_183;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_187;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _229 = _197 ? _215 : 0.0;
    float _231 = 1.0 / _159;
    bool _233 = _179 > 0.0;
    bool _235 = _179 >= 0.0;
    bool _237 = isnan(_179);
    bool _239 = _235 || _237;
    bool _241 = isnan(0.0);
    bool _243 = _239 || _241;
    float _245 = _165 * 2.0;
    bool _247 = _211 > 0.0;
    float _249 = floor(_245);
    bool _251 = _211 >= 0.0;
    bool _253 = isnan(_211);
    bool _255 = _251 || _253;
    bool _257 = isnan(0.0);
    bool _259 = _255 || _257;
    int _261 = _243 ? 0 : 1;
    int _263 = _259 ? 0 : 1;
    float _265 = _217;
    if (_207)
    {
        float _267 = _229 * _231;
        _127 = _267;
    }
    float _269 = _127;
    int _271 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _273 = _271 != 0;
    int _275 = ~_263;
    int _277 = _275 + 1;
    int _279 = _277 + 1;
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = _283 + 1;
    int _287 = _279;
    int _289 = _285;
    if (!_247)
    {
        int _291 = ~_263;
        int _293 = _291 + 1;
        _287 = _293;
    }
    int _295 = _287;
    float _297 = _145 + _153;
    float _299 = as_type<float>(_295);
    if (!_233)
    {
        int _301 = ~_261;
        int _303 = _301 + 1;
        _289 = _303;
    }
    int _305 = _289;
    bool _307 = _249 >= 0.0;
    bool _309 = isnan(_249);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = _297 + (-1.0);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _329 = _249 > 0.0;
    float _331 = in.m_51.x;
    float _333 = in.m_51.y;
    float _335 = in.m_51.z;
    int _337 = _315 ? 0 : 1;
    float _339 = _153 + _165;
    bool _341 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _345 = _341 || _343;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    float _351 = in.m_46.x;
    float _353 = in.m_46.y;
    float _355 = in.m_46.z;
    int _357 = ~_337;
    int _359 = _357 + 1;
    int _361 = _359 + 1;
    float _363 = _339 + (-1.0);
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _367 = _361;
    float _369 = _363;
    if (!_329)
    {
        int _371 = ~_337;
        int _373 = _371 + 1;
        _367 = _373;
    }
    int _375 = _367;
    if (!_349)
    {
        float _377 = _155 * _155;
        float _379 = _377 * 0.5;
        _265 = _379;
    }
    float _381 = _265;
    float _383 = _381;
    if (!_349)
    {
        _369 = _155;
    }
    float _385 = _369;
    float _387 = _385;
    if (!_349)
    {
        float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _389;
    }
    float _391 = _383;
    bool _393 = !_349;
    float _395 = _391;
    if (!_393)
    {
        float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _399 = log2(_397);
        float _401 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _403 = _401 + 1.0;
        float _405 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = _155 * _399;
        float _409 = 1.0 / _403;
        float _411 = _405 * 0.693147182464599609375;
        float _413 = exp2(_407);
        float _415 = 1.0 / _411;
        float _417 = _413 + (-1.0);
        float _419 = -_417;
        float _421 = fma(_419, _415, _155);
        float _423 = _421 * _409;
        float _425 = _423 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _395 = _425;
    }
    float _427 = _395;
    bool _429 = !_349;
    if (!_429)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _155 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _387 = _449;
    }
    float _451 = _387;
    float _453 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _459 = _145 > 0.5;
    float _461 = fma(_451, _333, _453);
    float _463 = fma(_451, _331, _455);
    float _465 = fma(_451, _335, _457);
    float _467 = -_221;
    int _469 = _459 ? as_type<int>(_467) : as_type<int>(_221);
    float _471 = fma(_461, _167, _353);
    float _473 = fma(_463, _167, _351);
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = fma(_465, _167, _355);
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = !_321;
    float _487 = _485 ? _221 : as_type<float>(_469);
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _479);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    bool _495 = _153 > 0.5;
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _499 = _487 + 0.5;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = -_225;
    int _513 = _495 ? as_type<int>(_511) : as_type<int>(_225);
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _517 = _505 + _515;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = !_325;
    float _527 = _525 ? _225 : as_type<float>(_513);
    float _529 = _507 * _475;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _509 + _545;
    float _549 = _517 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _517 * _517;
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _543 + _561;
    float _565 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    bool _567 = !_541;
    int _569 = _567 ? 0 : 1;
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    out.m_60.w = _551;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _565);
    float _575 = -_527;
    float _577 = _575 + 0.5;
    bool _579 = _573 >= 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _591 = _589 != 0;
    float _593 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _595 = !_537;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_547, _547, _559);
    int _601 = abs(_569);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = float(_295);
    float _607 = fma(_563, _563, _599);
    float _609 = float(_601);
    float _611 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _613 = !_533;
    int _615 = _613 ? 0 : 1;
    float _617 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _621 = _609 * _605;
    int _623 = abs(_615);
    float _625 = rsqrt(_607);
    float _627 = in.m_62.x;
    float _629 = in.m_62.y;
    float _631 = in.m_62.z;
    int _633 = abs(_597);
    float _635 = _619 * _571;
    float _637 = _509;
    float _639 = _505;
    float _641 = _543;
    if (_579)
    {
        _299 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _643 = _299;
    out.m_64.x = _593;
    out.m_64.y = _611;
    out.m_64.z = _617;
    float _645 = float(_305);
    int _647 = as_type<int>(_643);
    if (_579)
    {
        float _649 = _643 * 5.0;
        _647 = as_type<int>(_649);
    }
    int _651 = _647;
    out.m_66.x = _529;
    out.m_66.y = _635;
    float _653 = float(_375);
    float _655 = float(_623);
    if (_579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3857 = as_type<float>(_651);
        out.gl_Position.z = _3857;
    }
    if (_579)
    {
        out.m_49.x = 0.0;
    }
    float _657 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    float _663 = _517 * _625;
    float _665 = float(_633);
    float _667 = _547 * _625;
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = _665 * _645;
    if (_579)
    {
        return out;
    }
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _679 = _563 * _625;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _685 = _655 * _653;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _677 + _687;
    float _691 = -_679;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _683 + _695;
    float _699 = _685 * (-2.0);
    float _701 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _705 = _693 + _703;
    float _707 = floor(_657);
    float _709 = _621 * (-2.0);
    float _711 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _701);
    float _713 = fma(_327, _699, _327);
    float _715 = fma(_699, _627, _627);
    float _717 = _145 + (-0.5);
    float _719 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _721 = fma(_227, _709, _227);
    float _723 = fma(_709, _631, _631);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _727 = _165 + (-0.5);
    bool _729 = _719 >= 0.0;
    float _731 = in.m_58.x;
    float _733 = fma(_713, _269, _725);
    int _735 = abs(_661);
    float _737 = -_707;
    float _739 = _657 + _737;
    float _741 = _657 * 6.283185482025146484375;
    float _743 = in.m_58.y;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _747 = float(_735);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = -_739;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _755 = _733 * 0.15915493667125701904296875;
    float _757 = _713;
    int _759 = as_type<int>(_749);
    if (_729)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _761 = _757;
    float _763 = _749 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _673 * (-2.0);
    if (_729)
    {
        out.m_49.x = 0.0;
    }
    float _769 = fma(_721, _269, _745);
    float _771 = fma(_365, _767, _365);
    float _773 = fma(_767, _629, _629);
    float _775 = _755 * 6.283185482025146484375;
    float _777 = sin(_775);
    if (_729)
    {
        float _779 = _761 * 5.0;
        _759 = as_type<int>(_779);
    }
    int _781 = _759;
    float _783 = abs(_753);
    float _785 = _747 * _783;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_781);
        out.gl_Position.z = _4075;
    }
    float _787 = _755 * 6.283185482025146484375;
    float _789 = cos(_787);
    if (_729)
    {
        return out;
    }
    float _791 = -_505;
    float _793 = _791 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _795 = !_273;
    int _797 = _795 ? 0 : 1;
    float _799 = -_509;
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = -_543;
    float _805 = _803 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _793 * _793;
    int _809 = abs(_797);
    float _811 = fma(_765, 0.5, 0.5);
    int _813 = abs(_671);
    float _815 = fma(_801, _801, _807);
    float _817 = -_811;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _821 = _769 * 0.15915493667125701904296875;
    float _823 = fma(_805, _805, _815);
    float _825 = float(_809);
    float _827 = -_663;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    bool _831 = _739 < 0.5;
    float _833 = float(_831);
    float _835 = rsqrt(_823);
    float _837 = _153 + (-0.5);
    float _839 = fma(_825, _819, _785);
    float _841 = -_667;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _851 = float(_813);
    float _853 = -_679;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _857 = _829 * _829;
    float _859 = fma(_771, _269, _849);
    float _861 = _743 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _863 = abs(_847);
    float _865 = fma(_851, _863, _839);
    float _867 = fma(_843, _843, _857);
    float _869 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _871 = _821 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _859 * 0.15915493667125701904296875;
    float _877 = fma(_855, _855, _867);
    float _879 = _865 * _869;
    float _881 = _801 * _835;
    float _883 = _865 * _861;
    float _885 = _805 * _835;
    float _887 = _793 * _835;
    float _889 = _821 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = _881 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _899 = _885 * _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _903 = _887 * _901;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _909 = -_895;
    float _911 = fma(_885, _907, _909);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _915 = -_899;
    float _917 = fma(_887, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_903;
    float _923 = fma(_881, _919, _921);
    float _925 = sqrt(_877);
    float _927 = _911 * _911;
    float _929 = _777 * _873;
    float _931 = fma(_917, _917, _927);
    float _933 = _875 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _789 * _891;
    float _939 = _875 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _625 * _925;
    float _945 = fma(_923, _923, _931);
    float _947 = fma(_935, _929, _937);
    float _949 = fma(_935, _937, _929);
    float _951 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = rsqrt(_945);
    float _957 = _943 * _951;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _961 = _943 * _953;
    float _963 = _789 * _873;
    float _965 = _905 * _957;
    float _967 = _777 * _891;
    float _969 = _959 * _961;
    float _971 = _789 * _941;
    float _973 = _941 * _965;
    float _975 = _777 * _941;
    float _977 = _947 * _969;
    float _979 = -_963;
    float _981 = fma(_935, _967, _979);
    float _983 = -_967;
    float _985 = fma(_935, _963, _983);
    float _987 = _975 * _969;
    float _989 = fma(_873, _973, _977);
    float _991 = _911 * _955;
    float _993 = _917 * _955;
    float _995 = _981 * _969;
    float _997 = _923 * _955;
    float _999 = _943 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1001 = _999 * 0.5;
    float _1003 = _885 * _991;
    float _1005 = _887 * _993;
    float _1007 = fma(_891, _973, _995);
    float _1009 = fma(_985, _1001, _989);
    float _1011 = -_1003;
    float _1013 = fma(_887, _997, _1011);
    float _1015 = -_1005;
    float _1017 = fma(_881, _991, _1015);
    float _1019 = -_935;
    float _1021 = fma(_1019, _965, _987);
    float _1023 = fma(_949, _1001, _1007);
    float _1025 = _1013 * _1009;
    float _1027 = _1017 * _1009;
    float _1029 = fma(_971, _1001, _1021);
    float _1031 = fma(_993, _1023, _1025);
    float _1033 = fma(_997, _1023, _1027);
    float _1035 = _881 * _997;
    float _1037 = fma(_881, _1029, _1031);
    float _1039 = fma(_885, _1029, _1033);
    float _1041 = -_1035;
    float _1043 = fma(_885, _993, _1041);
    float _1045 = _509 + _1037;
    float _1047 = _543 + _1039;
    float _1049 = _1043 * _1009;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_991, _1023, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = fma(_887, _1029, _1059);
    float _1067 = _1061 + _1063;
    float _1069 = _505 + _1065;
    float _1071 = sqrt(_1067);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = _993;
    float _1077 = _1023;
    float _1079 = _1061;
    float _1081 = _1063;
    float _1083 = _1045;
    if (!_1073)
    {
        _1075 = _1047;
    }
    float _1085 = _1075;
    float _1087 = _1085;
    if (!_1073)
    {
        _1077 = _1069;
    }
    float _1089 = _1077;
    bool _1091 = !_1073;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1071 + _1097;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1067);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = _1103 * _1117;
        float _1121 = _1115 + (-1.0);
        float _1123 = fma(_1053, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1057, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1127 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1131 = _1123 + _1129;
        float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1135 = _1125 + _1133;
        float _1137 = fma(_1069, _1115, _1127);
        float _1139 = _1131 * _1131;
        float _1141 = _1135 * _1135;
        _1093 = _1137;
        _1079 = _1139;
        _1081 = _1141;
        _1083 = _1123;
        _1087 = _1125;
    }
    float _1143 = _1093;
    float _1145 = _1079;
    float _1147 = _1081;
    float _1149 = _1083;
    float _1151 = _1087;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1155 = _1143 + _1153;
    float _1157 = fma(_1155, _1155, _1145);
    float _1159 = _1157 + _1147;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1165 = isnan(_1161);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1171 = _1167 || _1169;
    float _1173 = _1157;
    if (!_1171)
    {
        _1173 = 1.0;
    }
    float _1175 = _1173;
    bool _1177 = !_1171;
    float _1179 = _1175;
    if (!_1177)
    {
        bool _1181 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1183 = isnan(_1161);
        bool _1185 = _1181 || _1183;
        bool _1187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1189 = _1185 || _1187;
        if (!_1189)
        {
            float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1193 = _1161 + _1191;
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1201 = _1199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1203 = 1.0 / _1197;
            float _1205 = _1193 * _1203;
            float _1207 = fma(_1205, _1201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1179 = _1207;
            _1209 = true;
        }
        else
        {
            bool _1211 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1213 = isnan(_1161);
            bool _1215 = _1211 || _1213;
            bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1219 = _1215 || _1217;
            if (!_1219)
            {
                float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1223 = _1161 + _1221;
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1233 = 1.0 / _1227;
                float _1235 = _1223 * _1233;
                float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1179 = _1237;
                _1209 = true;
            }
            else
            {
                _1179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1209 = false;
    float _1239 = _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1243 = _1149 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1247 = _1143 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1251 = _1151 + _1249;
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1265 = fma(_1247, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1267 = fma(_1251, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1269 = -_667;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1273 = -_663;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1277 = -_679;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1281 = _1275;
    float _1283 = _1271;
    float _1285 = _1279;
    if (!_1261)
    {
        float _1287 = _689 * _689;
        float _1289 = -_509;
        float _1291 = _1289 + _1263;
        float _1293 = -_505;
        float _1295 = _1293 + _1265;
        float _1297 = fma(_697, _697, _1287);
        float _1299 = 1.0 / _943;
        float _1301 = fma(_705, _705, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1305;
        float _1311 = _1309 * _1299;
        float _1313 = -_543;
        float _1315 = _1313 + _1267;
        float _1317 = fma(_1291, _1311, _683);
        float _1319 = fma(_1295, _1311, _677);
        float _1321 = fma(_1315, _1311, _693);
        _1281 = _1319;
        _1283 = _1317;
        _1285 = _1321;
        _637 = _1291;
        _639 = _1295;
    }
    float _1323 = _1281;
    float _1325 = _1283;
    float _1327 = _1285;
    float _1329 = _637;
    float _1331 = _639;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1325 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1327 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = fma(_1339, _1339, _1345);
    float _1349 = fma(_1343, _1343, _1347);
    float _1351 = rsqrt(_1349);
    float _1353 = sqrt(_1349);
    float _1355 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1357 = _1339 * _1355;
    float _1359 = _1343 * _1355;
    float _1361 = _1357 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 + _1363;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = _1367 + _1371;
    float _1375 = _1351;
    float _1377 = _1365;
    float _1379 = _1373;
    float _1381 = _1329;
    float _1383 = _1335;
    float _1385 = _1331;
    if (_1369)
    {
        float _1387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1387;
    }
    float _1389 = _1375;
    if (_1369)
    {
        float _1391 = rsqrt(_1365);
        _1377 = _1391;
    }
    float _1393 = _1377;
    if (_1369)
    {
        float _1395 = _1373 * _1389;
        _1379 = _1395;
    }
    float _1397 = _1379;
    if (_1369)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1381 = _1399;
    }
    float _1401 = _1381;
    float _1403 = _1343;
    if (_1369)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1389;
    float _1417 = _1413;
    if (_1369)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1355;
    float _1427 = -_1413;
    float _1429 = fma(_1335, _1425, _1427);
    if (_1369)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1431;
    }
    float _1433 = _1383;
    float _1435 = _677 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1369)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1385 = _1441;
    }
    float _1443 = _1385;
    float _1445 = _1443;
    if (!_1369)
    {
        _1437 = _1357;
    }
    float _1447 = _1437;
    float _1449 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1435);
    float _1451 = _1447;
    if (!_1369)
    {
        _1439 = _1429;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    float _1457 = _1423;
    if (_1369)
    {
        float _1459 = _1423 + (-1.0);
        _1417 = _1459;
    }
    float _1461 = _1417;
    float _1463 = _1461;
    if (_1369)
    {
        float _1465 = _1393 * _1443;
        _1445 = _1465;
    }
    float _1467 = _1445;
    float _1469 = _677 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1471 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1449);
    if (_1369)
    {
        float _1473 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _641 = _1473;
    }
    float _1475 = _641;
    float _1477 = _1475;
    if (_1369)
    {
        float _1479 = _1357 * _1467;
        _1451 = _1479;
    }
    float _1481 = _1451;
    if (!_1369)
    {
        _1463 = _1359;
    }
    float _1483 = _1463;
    float _1485 = _1483;
    if (_1369)
    {
        float _1487 = _1359 * _1467;
        _1485 = _1487;
    }
    float _1489 = _1485;
    if (_1369)
    {
        float _1491 = fma(_1429, _1423, _1475);
        _1455 = _1491;
    }
    float _1493 = _1455;
    if (!_1369)
    {
        _1477 = _1361;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1369)
    {
        float _1499 = _1481 * _1481;
        _1497 = _1499;
    }
    float _1501 = _1497;
    if (!_1369)
    {
        _1457 = _1363;
    }
    float _1503 = _1457;
    float _1505 = _1503;
    if (_1369)
    {
        float _1507 = _1489 * _1489;
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1469);
    float _1513 = fma(_1493, _1493, _1501);
    float _1515 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1517 = _1513 + _1509;
    float _1519 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1511);
    float _1521 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1525 = fma(_1353, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1523);
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = rsqrt(_1517);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1533 = _1521 * 0.5;
    float _1535 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1537 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1539 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1541 = fma(_1531, -0.5, _1533);
    float _1543 = -_1527;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1549 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1535);
    float _1551 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1515);
    float _1553 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1539);
    float _1555 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1557 = abs(_1545);
    float _1559 = log2(_1557);
    float _1561 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1563 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1551);
    float _1565 = _1529 * _1481;
    float _1567 = _1529 * _1493;
    float _1569 = _1529 * _1489;
    float _1571 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1575 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1577 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1581 = -_1573;
    float _1583 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1581);
    float _1585 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = -_1569;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1583);
    float _1593 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1579);
    float _1597 = fma(_1591, -0.5, 0.5);
    float _1599 = fma(_1591, 0.5, 0.5);
    float _1601 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1595);
    float _1603 = exp2(_1593);
    float _1605 = _1567 + 1.0;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1601);
    float _1611 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1613 = fma(_1599, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1615 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1541);
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1619 = _1541 + _1617;
    float _1621 = sqrt(_1597);
    float _1623 = -_1611;
    float _1625 = fma(_1623, _1607, 1.0);
    float _1627 = fma(_1599, _1613, -0.212114393711090087890625);
    float _1629 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1631 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1635 = fma(_1599, _1627, 1.570728778839111328125);
    float _1637 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1541);
    float _1639 = -_1567;
    float _1641 = fma(_1603, _1605, _1639);
    float _1643 = _677 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1645 = 1.0 / _1609;
    float _1647 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1629);
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1651 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1643);
    float _1653 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1541);
    float _1655 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1657 = _1621 * 0.636619746685028076171875;
    float _1659 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1651);
    float _1661 = 1.0 / _1521;
    float _1663 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1649);
    float _1665 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1667 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1669 = -_1635;
    float _1671 = fma(_1657, _1669, 1.0);
    float _1673 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1663);
    float _1675 = fma(_1641, 0.5, 0.5);
    float _1677 = _1667 + _1521;
    float _1679 = _1665 * _1645;
    float _1681 = _1673 * _1645;
    float _1683 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1541);
    float _1685 = _1677 * 0.5;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1541);
    float _1693 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1685);
    float _1695 = _1541 * _1661;
    float _1697 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1541);
    float _1699 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1541);
    float _1701 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1541);
    float _1703 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1541);
    float _1705 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1541);
    float _1707 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1541);
    float _1709 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1541);
    float _1711 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1541);
    float _1713 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1541);
    float _1715 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1541);
    float _1717 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1541);
    float _1719 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1541);
    float _1721 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1541);
    float _1723 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1541);
    float _1725 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1541);
    float _1727 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1541);
    float _1729 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1541);
    float _1731 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1685);
    float _1733 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1685);
    float _1735 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1685);
    float _1737 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1685);
    float _1739 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1685);
    float _1741 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1685);
    float _1743 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1685);
    float _1745 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1685);
    float _1747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1685);
    float _1749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1685);
    float _1751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1685);
    float _1753 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1685);
    float _1755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1685);
    float _1757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1685);
    float _1759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1685);
    float _1761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1685);
    float _1763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1685);
    float _1765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1685);
    float _1767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1685);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1771 = _1685 + _1769;
    float _1773 = _1685 * _1661;
    float _1775 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1777 = _1693 * _1661;
    float _1779 = _1691 * _1661;
    float _1781 = _1615 * _1661;
    float _1783 = _1731 * _1661;
    float _1785 = _1771 * _1661;
    float _1787 = _1619 * _1661;
    float2 _5739 = float2(_1777, _1779);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5739, float2(0.0), isnan(_5739)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5739, float2(0.0), isnan(_5739)), level(0.0)).x;
    float _1791 = _1633 * _1661;
    float2 _5752 = float2(_1783, _1781);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5752, float2(0.0), isnan(_5752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5752, float2(0.0), isnan(_5752)), level(0.0)).x;
    float _1795 = _1637 * _1661;
    float2 _5763 = float2(_1785, _1695);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).x;
    float2 _5771 = float2(_1773, _1787);
    float _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5771, float2(0.0), isnan(_5771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5771, float2(0.0), isnan(_5771)), level(0.0)).x;
    float _1801 = _1775 * _1661;
    float2 _5782 = float2(_1773, _1791);
    float _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5782, float2(0.0), isnan(_5782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5782, float2(0.0), isnan(_5782)), level(0.0)).x;
    float _1805 = _1733 * _1661;
    float2 _5793 = float2(_1783, _1795);
    float _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5793, float2(0.0), isnan(_5793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5793, float2(0.0), isnan(_5793)), level(0.0)).x;
    float _1809 = _1653 * _1661;
    float _1811 = _1735 * _1661;
    float2 _5807 = float2(_1801, _1695);
    float _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).x;
    float _1815 = _1683 * _1661;
    float2 _5818 = float2(_1805, _1809);
    float _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1819 = _1737 * _1661;
    float _1821 = _1697 * _1661;
    float2 _5832 = float2(_1811, _1815);
    float _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5832, float2(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5832, float2(0.0), isnan(_5832)), level(0.0)).x;
    float _1825 = log2(_1625);
    float _1827 = _1739 * _1661;
    float _1829 = _1725 * _1661;
    float2 _5848 = float2(_1819, _1695);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1833 = _1699 * _1661;
    float2 _5859 = float2(_1827, _1821);
    float _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).x;
    float2 _5867 = float2(_1773, _1779);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5867, float2(0.0), isnan(_5867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5867, float2(0.0), isnan(_5867)), level(0.0)).x;
    float _1839 = _1741 * _1661;
    float _1841 = _1701 * _1661;
    float _1843 = _1729 * _1661;
    float _1845 = _1743 * _1661;
    float _1847 = _1703 * _1661;
    float _1849 = _1705 * _1661;
    float _1851 = _1745 * _1661;
    float _1853 = _1747 * _1661;
    float _1855 = _1709 * _1661;
    float _1857 = _1825 * 0.693147182464599609375;
    float _1859 = _1727 * _1661;
    float _1861 = _1707 * _1661;
    float2 _5910 = float2(_1773, _1809);
    float _1863 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5910, float2(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5910, float2(0.0), isnan(_5910)), level(0.0)).x;
    float2 _5918 = float2(_1827, _1833);
    float _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5918, float2(0.0), isnan(_5918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5918, float2(0.0), isnan(_5918)), level(0.0)).x;
    float _1867 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = _1711 * _1661;
    float2 _5933 = float2(_1783, _1695);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5933, float2(0.0), isnan(_5933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5933, float2(0.0), isnan(_5933)), level(0.0)).x;
    float2 _5941 = float2(_1839, _1841);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).x;
    float _1875 = _1723 * _1661;
    float _1877 = _1749 * _1661;
    float2 _5955 = float2(_1845, _1847);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float2 _5963 = float2(_1851, _1695);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).x;
    float2 _5971 = float2(_1853, _1849);
    float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5971, float2(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5971, float2(0.0), isnan(_5971)), level(0.0)).x;
    float2 _5979 = float2(_1773, _1861);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float2 _5987 = float2(_1773, _1855);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5987, float2(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5987, float2(0.0), isnan(_5987)), level(0.0)).x;
    float2 _5995 = float2(_1853, _1869);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5995, float2(0.0), isnan(_5995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5995, float2(0.0), isnan(_5995)), level(0.0)).x;
    float2 _6003 = float2(_1877, _1695);
    float _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).x;
    float _1893 = _1751 * _1661;
    float _1895 = _1753 * _1661;
    float _1897 = _1713 * _1661;
    float _1899 = _1755 * _1661;
    float _1901 = _1715 * _1661;
    float _1903 = _1757 * _1661;
    float _1905 = _1717 * _1661;
    float _1907 = _1759 * _1661;
    float _1909 = _1719 * _1661;
    float _1911 = _1761 * _1661;
    float _1913 = _1721 * _1661;
    float _1915 = _1763 * _1661;
    float2 _6047 = float2(_1893, _1897);
    float _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).x;
    float2 _6055 = float2(_1895, _1901);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6055, float2(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6055, float2(0.0), isnan(_6055)), level(0.0)).x;
    float2 _6063 = float2(_1899, _1905);
    float _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6063, float2(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6063, float2(0.0), isnan(_6063)), level(0.0)).x;
    float2 _6071 = float2(_1903, _1909);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).x;
    float2 _6079 = float2(_1907, _1913);
    float _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6079, float2(0.0), isnan(_6079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6079, float2(0.0), isnan(_6079)), level(0.0)).x;
    float2 _6087 = float2(_1911, _1875);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6087, float2(0.0), isnan(_6087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6087, float2(0.0), isnan(_6087)), level(0.0)).x;
    float2 _6095 = float2(_1915, _1829);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _1931 = _1765 * _1661;
    float _1933 = _1767 * _1661;
    float2 _6109 = float2(_1931, _1859);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6109, float2(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6109, float2(0.0), isnan(_6109)), level(0.0)).x;
    float2 _6117 = float2(_1933, _1843);
    float _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6117, float2(0.0), isnan(_6117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6117, float2(0.0), isnan(_6117)), level(0.0)).x;
    float2 _6125 = float2(_1773, _1695);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6125, float2(0.0), isnan(_6125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6125, float2(0.0), isnan(_6125)), level(0.0)).x;
    float3 _6134 = float3(_1687, _1689, _1867);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6134, float3(0.0), isnan(_6134)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6134, float3(0.0), isnan(_6134)), level(0.0)).x;
    float3 _6145 = float3(_1687, _1689, _1867);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _6161 = float2(_1671, _1675);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = _677 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1966 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1968 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1964);
    float _1970 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1966);
    float _1972 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1968);
    float _1974 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1976 = _1974 + _1521;
    float _1978 = _1976 * _1661;
    float _1980 = _1978 * 0.5;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1984 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1982);
    float _1986 = 1.0 / _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1990 = _1986 * _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1994 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1998 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1996);
    float _2000 = 1.0 / _1994;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2008 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2006);
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2012 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2010);
    float _2014 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2016 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2014);
    float _2018 = 1.0 / _2004;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2022 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2020);
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2030 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2028);
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = -_1990;
    float _2036 = fma(_2000, _2032, _2034);
    float _2038 = 1.0 / _2008;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2050 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2048);
    bool _2052 = _2036 >= 0.0;
    bool _2054 = isnan(_2036);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = 1.0 / _1998;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2066 = -_1990;
    float _2068 = fma(_2038, _2064, _2066);
    float _2070 = 1.0 / _2022;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2074 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2072);
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2078 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2082 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2080);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2086 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2084);
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = -_1990;
    float _2092 = fma(_2062, _2088, _2090);
    float _2094 = 1.0 / _2042;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2098 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2096);
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2102 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2100);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2106 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
    bool _2108 = _2092 >= 0.0;
    bool _2110 = isnan(_2092);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2120 = -_1990;
    float _2122 = fma(_2018, _2118, _2120);
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2126 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2124);
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2130 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2128);
    bool _2132 = !_2116;
    float _2134 = _2132 ? 0.0 : 2.0;
    float _2136 = 1.0 / _2050;
    bool _2138 = _2122 >= 0.0;
    bool _2140 = isnan(_2122);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2152 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2150);
    bool _2154 = !_2060;
    float _2156 = _2154 ? 0.0 : 2.0;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2160 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2158);
    float _2162 = _2156 + _2148;
    bool _2164 = _2068 >= 0.0;
    bool _2166 = isnan(_2068);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(0.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = -_1990;
    float _2180 = fma(_2070, _2176, _2178);
    float _2182 = 1.0 / _2102;
    float _2184 = _2162 + _2134;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2188 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2186);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2192 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2190);
    bool _2194 = _2180 >= 0.0;
    bool _2196 = isnan(_2180);
    bool _2198 = _2194 || _2196;
    bool _2200 = isnan(0.0);
    bool _2202 = _2198 || _2200;
    float _2204 = float(_2202);
    float _2206 = _2184 + _2174;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2210 = -_1990;
    float _2212 = fma(_2094, _2208, _2210);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = 1.0 / _2012;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2222 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2220);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2230 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2234 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2232);
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2238 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2236);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2246 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2244);
    float _2248 = 1.0 / _2160;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2252 = -_1990;
    float _2254 = fma(_2218, _2250, _2252);
    float _2256 = 1.0 / _2246;
    bool _2258 = _2254 >= 0.0;
    bool _2260 = isnan(_2254);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = float(_2266);
    float _2270 = _2206 + _2268;
    float _2272 = 1.0 / _2016;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1990;
    float _2278 = fma(_2272, _2274, _2276);
    bool _2280 = _2278 >= 0.0;
    bool _2282 = isnan(_2278);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.0);
    bool _2288 = _2284 || _2286;
    bool _2290 = !_2288;
    float _2292 = _2290 ? 0.0 : 2.0;
    float _2294 = _2270 + _2292;
    float _2296 = 1.0 / _2026;
    float _2298 = _2294 + _2204;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2302 = -_1990;
    float _2304 = fma(_2296, _2300, _2302);
    bool _2306 = _2304 >= 0.0;
    bool _2308 = isnan(_2304);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan(0.0);
    bool _2314 = _2310 || _2312;
    float _2316 = 1.0 / _2030;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_1990;
    float _2322 = fma(_2316, _2318, _2320);
    bool _2324 = _2322 >= 0.0;
    bool _2326 = isnan(_2322);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    bool _2334 = !_2314;
    float _2336 = _2334 ? 0.0 : 2.0;
    bool _2338 = !_2332;
    float _2340 = _2338 ? 0.0 : 2.0;
    float _2342 = _2298 + _2336;
    bool _2344 = _2212 >= 0.0;
    bool _2346 = isnan(_2212);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2358 = -_1990;
    float _2360 = fma(_2136, _2356, _2358);
    float _2362 = _2342 + _2340;
    float _2364 = 1.0 / _2074;
    float _2366 = _2362 + _2354;
    float _2368 = 1.0 / _2046;
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2372 = -_1990;
    float _2374 = fma(_2364, _2370, _2372);
    bool _2376 = _2360 >= 0.0;
    bool _2378 = isnan(_2360);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2390 = -_1990;
    float _2392 = fma(_2368, _2388, _2390);
    bool _2394 = _2392 >= 0.0;
    bool _2396 = isnan(_2392);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    bool _2404 = !_2402;
    float _2406 = _2404 ? 0.0 : 2.0;
    float _2408 = _2366 + _2406;
    bool _2410 = _2374 >= 0.0;
    bool _2412 = isnan(_2374);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(0.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2408 + _2386;
    float _2424 = 1.0 / _2082;
    float _2426 = _2422 + _2420;
    float _2428 = 1.0 / _2078;
    float _2430 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2432 = -_1990;
    float _2434 = fma(_2424, _2430, _2432);
    bool _2436 = _2434 >= 0.0;
    bool _2438 = isnan(_2434);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = float(_2444);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2450 = -_1990;
    float _2452 = fma(_2182, _2448, _2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = -_1990;
    float _2458 = fma(_2428, _2454, _2456);
    bool _2460 = _2458 >= 0.0;
    bool _2462 = isnan(_2458);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(0.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = !_2468;
    float _2472 = _2470 ? 0.0 : 2.0;
    float _2474 = _2426 + _2472;
    float _2476 = 1.0 / _2086;
    float _2478 = _2474 + _2446;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2482 = -_1990;
    float _2484 = fma(_2476, _2480, _2482);
    bool _2486 = _2484 >= 0.0;
    bool _2488 = isnan(_2484);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = 1.0 / _2098;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = -_1990;
    float _2502 = fma(_2496, _2498, _2500);
    bool _2504 = _2502 >= 0.0;
    bool _2506 = isnan(_2502);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = !_2494;
    float _2516 = _2514 ? 0.0 : 2.0;
    bool _2518 = !_2512;
    float _2520 = _2518 ? 0.0 : 2.0;
    float _2522 = _2478 + _2516;
    bool _2524 = _2452 >= 0.0;
    bool _2526 = isnan(_2452);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.0);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = _2522 + _2520;
    float _2538 = _2536 + _2534;
    float _2540 = 1.0 / _2106;
    float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2544 = -_1990;
    float _2546 = fma(_2540, _2542, _2544);
    bool _2548 = _2546 >= 0.0;
    bool _2550 = isnan(_2546);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.0);
    bool _2556 = _2552 || _2554;
    float _2558 = 1.0 / _2126;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_1990;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = !_2556;
    float _2568 = _2566 ? 0.0 : 2.0;
    bool _2570 = _2564 >= 0.0;
    bool _2572 = isnan(_2564);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2538 + _2568;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2586 = -_1990;
    float _2588 = fma(_2248, _2584, _2586);
    float _2590 = 1.0 / _2130;
    float _2592 = _2582 + _2580;
    bool _2594 = _2588 >= 0.0;
    bool _2596 = isnan(_2588);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2608 = -_1990;
    float _2610 = fma(_2590, _2606, _2608);
    bool _2612 = _2610 >= 0.0;
    bool _2614 = isnan(_2610);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = _2592 + _2622;
    float _2626 = 1.0 / _2152;
    float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2630 = -_1990;
    float _2632 = fma(_2626, _2628, _2630);
    bool _2634 = _2632 >= 0.0;
    bool _2636 = isnan(_2632);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2642;
    float _2646 = _2644 ? 0.0 : 2.0;
    float _2648 = _2624 + _2646;
    float _2650 = 1.0 / _2188;
    float _2652 = _2648 + _2604;
    float _2654 = 1.0 / _2234;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_1990;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2660 >= 0.0;
    bool _2664 = isnan(_2660);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = 1.0 / _2192;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_1990;
    float _2678 = fma(_2654, _2674, _2676);
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = -_1990;
    float _2684 = fma(_2672, _2680, _2682);
    bool _2686 = _2684 >= 0.0;
    bool _2688 = isnan(_2684);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = 1.0 / _2216;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2700 = -_1990;
    float _2702 = fma(_2696, _2698, _2700);
    bool _2704 = _2702 >= 0.0;
    bool _2706 = isnan(_2702);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan(0.0);
    bool _2712 = _2708 || _2710;
    float _2714 = 1.0 / _2222;
    bool _2716 = !_2712;
    float _2718 = _2716 ? 0.0 : 3.0;
    float _2720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2722 = -_1990;
    float _2724 = fma(_2714, _2720, _2722);
    bool _2726 = _2724 >= 0.0;
    bool _2728 = isnan(_2724);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan(0.0);
    bool _2734 = _2730 || _2732;
    float _2736 = 1.0 / _2226;
    bool _2738 = !_2734;
    float _2740 = _2738 ? 0.0 : 3.0;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2744 = -_1990;
    float _2746 = fma(_2736, _2742, _2744);
    bool _2748 = _2746 >= 0.0;
    bool _2750 = isnan(_2746);
    bool _2752 = _2748 || _2750;
    bool _2754 = isnan(0.0);
    bool _2756 = _2752 || _2754;
    float _2758 = 1.0 / _2230;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2762 = -_1990;
    float _2764 = fma(_2758, _2760, _2762);
    bool _2766 = _2764 >= 0.0;
    bool _2768 = isnan(_2764);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    bool _2776 = !_2694;
    float _2778 = _2776 ? 0.0 : 3.0;
    bool _2780 = _2678 >= 0.0;
    bool _2782 = isnan(_2678);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan(0.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = !_2774;
    float _2792 = _2790 ? 0.0 : 3.0;
    float _2794 = _2778 + _2718;
    bool _2796 = !_2756;
    float _2798 = _2796 ? 0.0 : 3.0;
    bool _2800 = !_2788;
    float _2802 = _2800 ? 0.0 : 3.0;
    float _2804 = _2794 + _2740;
    float _2806 = _2804 + _2798;
    bool _2808 = !_2670;
    float _2810 = _2808 ? 0.0 : 2.0;
    float _2812 = _2806 + _2792;
    float _2814 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2652 + _2810;
    float _2818 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _2820 = _2812 + _2802;
    float _2822 = 1.0 / _2238;
    float _2824 = _2816 * 0.02857142873108386993408203125;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2818);
    float _2830 = _2828 + _1609;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2828;
    out.gl_Position.w = _1609;
    float _2832 = 1.0 / _2242;
    float _2834 = _2830 * 0.5;
    out.m_68.z = _2834;
    out.m_68.w = _1609;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = -_1990;
    float _2840 = fma(_2822, _2836, _2838);
    float _2842 = exp2(_2814);
    bool _2844 = _2840 >= 0.0;
    bool _2846 = isnan(_2840);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan(0.0);
    bool _2852 = _2848 || _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = -_1990;
    float _2858 = fma(_2832, _2854, _2856);
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2862 = -_1990;
    float _2864 = fma(_2256, _2860, _2862);
    bool _2866 = !_2852;
    float _2868 = _2866 ? 0.0 : 3.0;
    bool _2870 = _2858 >= 0.0;
    bool _2872 = isnan(_2858);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    bool _2880 = _2864 >= 0.0;
    bool _2882 = isnan(_2864);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2820 + _2868;
    bool _2892 = !_2878;
    float _2894 = _2892 ? 0.0 : 3.0;
    float _2896 = -_2842;
    float _2898 = _2896 + 1.0;
    bool _2900 = !_2888;
    float _2902 = _2900 ? 0.0 : 5.0;
    float _2904 = _2890 + _2894;
    float _2906 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2908 = _2904 + _2902;
    float _2910 = _2906 * _1941;
    float _2912 = -_2906;
    float _2914 = _2912 + 1.0;
    float _2916 = _2908 * 0.14285714924335479736328125;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _1952 * _2910;
    float _2922 = _1962 * _2910;
    float _2924 = _2826 * _2918;
    float _2926 = fma(_1958, _2920, _1946);
    float _2928 = _2924 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = fma(_1960, _2920, _1948);
    float _2932 = _1952 * _2914;
    float _2934 = fma(_1952, _2922, _1950);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2926;
    out.m_70.y = _2930;
    out.m_70.z = _2934;
    out.m_70.w = _2932;
    out.m_49.x = _2936;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_46.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_93)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2995 = as_type<float>(_107);
        out.gl_Position.z = _2995;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_51.w;
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
        float _129 = float(_89);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _97;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_143);
        out.gl_Position.z = _3064;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_53.x;
    float _147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _149 = log2(_147);
    float _151 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = in.m_53.y;
    float _155 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _159 = 1.0 + _157;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _165 = in.m_53.z;
    float _167 = in.m_58.w;
    float _169 = _149 * _125;
    float _171 = exp2(_169);
    float _173 = _145 * 2.0;
    float _175 = _151 * _163;
    float _177 = _153 * 2.0;
    float _179 = floor(_173);
    int _181 = as_type<int>(_161) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_161) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _191 = isnan(0.0);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _197 = _193 || _195;
    bool _199 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _201 = isnan(1.0);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _207 = _203 || _205;
    float _209 = _145 + _165;
    float _211 = floor(_177);
    float _213 = -_171;
    float _215 = _213 + 1.0;
    float _217 = _209 + (-1.0);
    bool _219 = !_183;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_187;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _229 = _197 ? _215 : 0.0;
    float _231 = 1.0 / _159;
    bool _233 = _179 > 0.0;
    bool _235 = _179 >= 0.0;
    bool _237 = isnan(_179);
    bool _239 = _235 || _237;
    bool _241 = isnan(0.0);
    bool _243 = _239 || _241;
    float _245 = _165 * 2.0;
    bool _247 = _211 > 0.0;
    float _249 = floor(_245);
    bool _251 = _211 >= 0.0;
    bool _253 = isnan(_211);
    bool _255 = _251 || _253;
    bool _257 = isnan(0.0);
    bool _259 = _255 || _257;
    int _261 = _243 ? 0 : 1;
    int _263 = _259 ? 0 : 1;
    float _265 = _217;
    if (_207)
    {
        float _267 = _229 * _231;
        _127 = _267;
    }
    float _269 = _127;
    int _271 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _273 = _271 != 0;
    int _275 = ~_263;
    int _277 = _275 + 1;
    int _279 = _277 + 1;
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = _283 + 1;
    int _287 = _279;
    int _289 = _285;
    if (!_247)
    {
        int _291 = ~_263;
        int _293 = _291 + 1;
        _287 = _293;
    }
    int _295 = _287;
    float _297 = _145 + _153;
    float _299 = as_type<float>(_295);
    if (!_233)
    {
        int _301 = ~_261;
        int _303 = _301 + 1;
        _289 = _303;
    }
    int _305 = _289;
    bool _307 = _249 >= 0.0;
    bool _309 = isnan(_249);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = _297 + (-1.0);
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _325 = _323 != 0;
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _329 = _249 > 0.0;
    float _331 = in.m_51.x;
    float _333 = in.m_51.y;
    float _335 = in.m_51.z;
    int _337 = _315 ? 0 : 1;
    float _339 = _153 + _165;
    bool _341 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _345 = _341 || _343;
    bool _347 = isnan(1.0);
    bool _349 = _345 || _347;
    float _351 = in.m_46.x;
    float _353 = in.m_46.y;
    float _355 = in.m_46.z;
    int _357 = ~_337;
    int _359 = _357 + 1;
    int _361 = _359 + 1;
    float _363 = _339 + (-1.0);
    float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _367 = _361;
    float _369 = _363;
    if (!_329)
    {
        int _371 = ~_337;
        int _373 = _371 + 1;
        _367 = _373;
    }
    int _375 = _367;
    if (!_349)
    {
        float _377 = _155 * _155;
        float _379 = _377 * 0.5;
        _265 = _379;
    }
    float _381 = _265;
    float _383 = _381;
    if (!_349)
    {
        _369 = _155;
    }
    float _385 = _369;
    float _387 = _385;
    if (!_349)
    {
        float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _383 = _389;
    }
    float _391 = _383;
    bool _393 = !_349;
    float _395 = _391;
    if (!_393)
    {
        float _397 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _399 = log2(_397);
        float _401 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _403 = _401 + 1.0;
        float _405 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = _155 * _399;
        float _409 = 1.0 / _403;
        float _411 = _405 * 0.693147182464599609375;
        float _413 = exp2(_407);
        float _415 = 1.0 / _411;
        float _417 = _413 + (-1.0);
        float _419 = -_417;
        float _421 = fma(_419, _415, _155);
        float _423 = _421 * _409;
        float _425 = _423 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _395 = _425;
    }
    float _427 = _395;
    bool _429 = !_349;
    if (!_429)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _155 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _387 = _449;
    }
    float _451 = _387;
    float _453 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _455 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _427 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _459 = _145 > 0.5;
    float _461 = fma(_451, _333, _453);
    float _463 = fma(_451, _331, _455);
    float _465 = fma(_451, _335, _457);
    float _467 = -_221;
    int _469 = _459 ? as_type<int>(_467) : as_type<int>(_221);
    float _471 = fma(_461, _167, _353);
    float _473 = fma(_463, _167, _351);
    float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _477 = fma(_465, _167, _355);
    float _479 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _481 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _485 = !_321;
    float _487 = _485 ? _221 : as_type<float>(_469);
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].x, _479);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _493 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].x, _483);
    bool _495 = _153 > 0.5;
    float _497 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _499 = _487 + 0.5;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[4].z, _491);
    float _503 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _505 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = -_225;
    int _513 = _495 ? as_type<int>(_511) : as_type<int>(_225);
    float _515 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _517 = _505 + _515;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _525 = !_325;
    float _527 = _525 ? _225 : as_type<float>(_513);
    float _529 = _507 * _475;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _533 = _531 != 0;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _541 = _539 != 0;
    float _543 = _503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _509 + _545;
    float _549 = _517 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _553 = _519 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _517 * _517;
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _543 + _561;
    float _565 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    bool _567 = !_541;
    int _569 = _567 ? 0 : 1;
    out.m_60.x = _553;
    out.m_60.y = _555;
    out.m_60.z = _557;
    out.m_60.w = _551;
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _565);
    float _575 = -_527;
    float _577 = _575 + 0.5;
    bool _579 = _573 >= 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _587 = _585 != 0;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _591 = _589 != 0;
    float _593 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _595 = !_537;
    int _597 = _595 ? 0 : 1;
    float _599 = fma(_547, _547, _559);
    int _601 = abs(_569);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = float(_295);
    float _607 = fma(_563, _563, _599);
    float _609 = float(_601);
    float _611 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _613 = !_533;
    int _615 = _613 ? 0 : 1;
    float _617 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _621 = _609 * _605;
    int _623 = abs(_615);
    float _625 = rsqrt(_607);
    float _627 = in.m_62.x;
    float _629 = in.m_62.y;
    float _631 = in.m_62.z;
    int _633 = abs(_597);
    float _635 = _619 * _571;
    float _637 = _509;
    float _639 = _505;
    float _641 = _543;
    if (_579)
    {
        _299 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _643 = _299;
    out.m_64.x = _593;
    out.m_64.y = _611;
    out.m_64.z = _617;
    float _645 = float(_305);
    int _647 = as_type<int>(_643);
    if (_579)
    {
        float _649 = _643 * 5.0;
        _647 = as_type<int>(_649);
    }
    int _651 = _647;
    out.m_66.x = _529;
    out.m_66.y = _635;
    float _653 = float(_375);
    float _655 = float(_623);
    if (_579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3857 = as_type<float>(_651);
        out.gl_Position.z = _3857;
    }
    if (_579)
    {
        out.m_49.x = 0.0;
    }
    float _657 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    bool _659 = !_587;
    int _661 = _659 ? 0 : 1;
    float _663 = _517 * _625;
    float _665 = float(_633);
    float _667 = _547 * _625;
    bool _669 = !_591;
    int _671 = _669 ? 0 : 1;
    float _673 = _665 * _645;
    if (_579)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _675 = -_663;
    float _677 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _505);
    float _679 = _563 * _625;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _685 = _655 * _653;
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _677 + _687;
    float _691 = -_679;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _683 + _695;
    float _699 = _685 * (-2.0);
    float _701 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _705 = _693 + _703;
    float _707 = floor(_657);
    float _709 = _621 * (-2.0);
    float _711 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _701);
    float _713 = fma(_327, _699, _327);
    float _715 = fma(_699, _627, _627);
    float _717 = _145 + (-0.5);
    float _719 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].z, _711);
    float _721 = fma(_227, _709, _227);
    float _723 = fma(_709, _631, _631);
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _727 = _165 + (-0.5);
    bool _729 = _719 >= 0.0;
    float _731 = in.m_58.x;
    float _733 = fma(_713, _269, _725);
    int _735 = abs(_661);
    float _737 = -_707;
    float _739 = _657 + _737;
    float _741 = _657 * 6.283185482025146484375;
    float _743 = in.m_58.y;
    float _745 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[196].z, _723);
    float _747 = float(_735);
    float _749 = _741 * 0.15915493667125701904296875;
    float _751 = -_739;
    float _753 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _755 = _733 * 0.15915493667125701904296875;
    float _757 = _713;
    int _759 = as_type<int>(_749);
    if (_729)
    {
        _757 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _761 = _757;
    float _763 = _749 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = _673 * (-2.0);
    if (_729)
    {
        out.m_49.x = 0.0;
    }
    float _769 = fma(_721, _269, _745);
    float _771 = fma(_365, _767, _365);
    float _773 = fma(_767, _629, _629);
    float _775 = _755 * 6.283185482025146484375;
    float _777 = sin(_775);
    if (_729)
    {
        float _779 = _761 * 5.0;
        _759 = as_type<int>(_779);
    }
    int _781 = _759;
    float _783 = abs(_753);
    float _785 = _747 * _783;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4075 = as_type<float>(_781);
        out.gl_Position.z = _4075;
    }
    float _787 = _755 * 6.283185482025146484375;
    float _789 = cos(_787);
    if (_729)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _791 = -_505;
    float _793 = _791 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _795 = !_273;
    int _797 = _795 ? 0 : 1;
    float _799 = -_509;
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _803 = -_543;
    float _805 = _803 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _807 = _793 * _793;
    int _809 = abs(_797);
    float _811 = fma(_765, 0.5, 0.5);
    int _813 = abs(_671);
    float _815 = fma(_801, _801, _807);
    float _817 = -_811;
    float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _821 = _769 * 0.15915493667125701904296875;
    float _823 = fma(_805, _805, _815);
    float _825 = float(_809);
    float _827 = -_663;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    bool _831 = _739 < 0.5;
    float _833 = float(_831);
    float _835 = rsqrt(_823);
    float _837 = _153 + (-0.5);
    float _839 = fma(_825, _819, _785);
    float _841 = -_667;
    float _843 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _849 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[196].y, _773);
    float _851 = float(_813);
    float _853 = -_679;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _857 = _829 * _829;
    float _859 = fma(_771, _269, _849);
    float _861 = _743 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _863 = abs(_847);
    float _865 = fma(_851, _863, _839);
    float _867 = fma(_843, _843, _857);
    float _869 = _731 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _871 = _821 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _859 * 0.15915493667125701904296875;
    float _877 = fma(_855, _855, _867);
    float _879 = _865 * _869;
    float _881 = _801 * _835;
    float _883 = _865 * _861;
    float _885 = _805 * _835;
    float _887 = _793 * _835;
    float _889 = _821 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = _881 * _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _899 = _885 * _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _903 = _887 * _901;
    float _905 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _907 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _909 = -_895;
    float _911 = fma(_885, _907, _909);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _915 = -_899;
    float _917 = fma(_887, _913, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = -_903;
    float _923 = fma(_881, _919, _921);
    float _925 = sqrt(_877);
    float _927 = _911 * _911;
    float _929 = _777 * _873;
    float _931 = fma(_917, _917, _927);
    float _933 = _875 * 6.283185482025146484375;
    float _935 = sin(_933);
    float _937 = _789 * _891;
    float _939 = _875 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = _625 * _925;
    float _945 = fma(_923, _923, _931);
    float _947 = fma(_935, _929, _937);
    float _949 = fma(_935, _937, _929);
    float _951 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _953 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _955 = rsqrt(_945);
    float _957 = _943 * _951;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _961 = _943 * _953;
    float _963 = _789 * _873;
    float _965 = _905 * _957;
    float _967 = _777 * _891;
    float _969 = _959 * _961;
    float _971 = _789 * _941;
    float _973 = _941 * _965;
    float _975 = _777 * _941;
    float _977 = _947 * _969;
    float _979 = -_963;
    float _981 = fma(_935, _967, _979);
    float _983 = -_967;
    float _985 = fma(_935, _963, _983);
    float _987 = _975 * _969;
    float _989 = fma(_873, _973, _977);
    float _991 = _911 * _955;
    float _993 = _917 * _955;
    float _995 = _981 * _969;
    float _997 = _923 * _955;
    float _999 = _943 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1001 = _999 * 0.5;
    float _1003 = _885 * _991;
    float _1005 = _887 * _993;
    float _1007 = fma(_891, _973, _995);
    float _1009 = fma(_985, _1001, _989);
    float _1011 = -_1003;
    float _1013 = fma(_887, _997, _1011);
    float _1015 = -_1005;
    float _1017 = fma(_881, _991, _1015);
    float _1019 = -_935;
    float _1021 = fma(_1019, _965, _987);
    float _1023 = fma(_949, _1001, _1007);
    float _1025 = _1013 * _1009;
    float _1027 = _1017 * _1009;
    float _1029 = fma(_971, _1001, _1021);
    float _1031 = fma(_993, _1023, _1025);
    float _1033 = fma(_997, _1023, _1027);
    float _1035 = _881 * _997;
    float _1037 = fma(_881, _1029, _1031);
    float _1039 = fma(_885, _1029, _1033);
    float _1041 = -_1035;
    float _1043 = fma(_885, _993, _1041);
    float _1045 = _509 + _1037;
    float _1047 = _543 + _1039;
    float _1049 = _1043 * _1009;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1045 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1057 = _1047 + _1055;
    float _1059 = fma(_991, _1023, _1049);
    float _1061 = _1053 * _1053;
    float _1063 = _1057 * _1057;
    float _1065 = fma(_887, _1029, _1059);
    float _1067 = _1061 + _1063;
    float _1069 = _505 + _1065;
    float _1071 = sqrt(_1067);
    bool _1073 = _1071 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1075 = _993;
    float _1077 = _1023;
    float _1079 = _1061;
    float _1081 = _1063;
    float _1083 = _1045;
    if (!_1073)
    {
        _1075 = _1047;
    }
    float _1085 = _1075;
    float _1087 = _1085;
    if (!_1073)
    {
        _1077 = _1069;
    }
    float _1089 = _1077;
    bool _1091 = !_1073;
    float _1093 = _1089;
    if (!_1091)
    {
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1099 = _1071 + _1097;
        float _1101 = _1069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = rsqrt(_1067);
        float _1105 = _1099 * _1095;
        float _1107 = _1105 * 0.15915493667125701904296875;
        float _1109 = _1107 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 * 6.283185482025146484375;
        float _1115 = cos(_1113);
        float _1117 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1119 = _1103 * _1117;
        float _1121 = _1115 + (-1.0);
        float _1123 = fma(_1053, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1057, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1127 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1131 = _1123 + _1129;
        float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1135 = _1125 + _1133;
        float _1137 = fma(_1069, _1115, _1127);
        float _1139 = _1131 * _1131;
        float _1141 = _1135 * _1135;
        _1093 = _1137;
        _1079 = _1139;
        _1081 = _1141;
        _1083 = _1123;
        _1087 = _1125;
    }
    float _1143 = _1093;
    float _1145 = _1079;
    float _1147 = _1081;
    float _1149 = _1083;
    float _1151 = _1087;
    float _1153 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1155 = _1143 + _1153;
    float _1157 = fma(_1155, _1155, _1145);
    float _1159 = _1157 + _1147;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1165 = isnan(_1161);
    bool _1167 = _1163 || _1165;
    bool _1169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1171 = _1167 || _1169;
    float _1173 = _1157;
    if (!_1171)
    {
        _1173 = 1.0;
    }
    float _1175 = _1173;
    bool _1177 = !_1171;
    float _1179 = _1175;
    if (!_1177)
    {
        bool _1181 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1183 = isnan(_1161);
        bool _1185 = _1181 || _1183;
        bool _1187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1189 = _1185 || _1187;
        if (!_1189)
        {
            float _1191 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1193 = _1161 + _1191;
            float _1195 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1197 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1195;
            float _1199 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1201 = _1199 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1203 = 1.0 / _1197;
            float _1205 = _1193 * _1203;
            float _1207 = fma(_1205, _1201, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1179 = _1207;
            _1209 = true;
        }
        else
        {
            bool _1211 = _1161 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1213 = isnan(_1161);
            bool _1215 = _1211 || _1213;
            bool _1217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1219 = _1215 || _1217;
            if (!_1219)
            {
                float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1223 = _1161 + _1221;
                float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1229 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1231 = _1229 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1233 = 1.0 / _1227;
                float _1235 = _1223 * _1233;
                float _1237 = fma(_1235, _1231, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1179 = _1237;
                _1209 = true;
            }
            else
            {
                _1179 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1209 = false;
    float _1239 = _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1243 = _1149 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1247 = _1143 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1251 = _1151 + _1249;
    bool _1253 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1257 = _1253 || _1255;
    bool _1259 = isnan(0.5);
    bool _1261 = _1257 || _1259;
    float _1263 = fma(_1243, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1265 = fma(_1247, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1267 = fma(_1251, _1239, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1269 = -_667;
    float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1273 = -_663;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1265);
    float _1277 = -_679;
    float _1279 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1267);
    float _1281 = _1275;
    float _1283 = _1271;
    float _1285 = _1279;
    if (!_1261)
    {
        float _1287 = _689 * _689;
        float _1289 = -_509;
        float _1291 = _1289 + _1263;
        float _1293 = -_505;
        float _1295 = _1293 + _1265;
        float _1297 = fma(_697, _697, _1287);
        float _1299 = 1.0 / _943;
        float _1301 = fma(_705, _705, _1297);
        float _1303 = sqrt(_1301);
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1307 = precise::min(_1303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1309 = _1307 * _1305;
        float _1311 = _1309 * _1299;
        float _1313 = -_543;
        float _1315 = _1313 + _1267;
        float _1317 = fma(_1291, _1311, _683);
        float _1319 = fma(_1295, _1311, _677);
        float _1321 = fma(_1315, _1311, _693);
        _1281 = _1319;
        _1283 = _1317;
        _1285 = _1321;
        _637 = _1291;
        _639 = _1295;
    }
    float _1323 = _1281;
    float _1325 = _1283;
    float _1327 = _1285;
    float _1329 = _637;
    float _1331 = _639;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1323 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1325 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1327 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = fma(_1339, _1339, _1345);
    float _1349 = fma(_1343, _1343, _1347);
    float _1351 = rsqrt(_1349);
    float _1353 = sqrt(_1349);
    float _1355 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1357 = _1339 * _1355;
    float _1359 = _1343 * _1355;
    float _1361 = _1357 * _1357;
    float _1363 = _1359 * _1359;
    float _1365 = _1361 + _1363;
    float _1367 = sqrt(_1365);
    bool _1369 = _1367 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1373 = _1367 + _1371;
    float _1375 = _1351;
    float _1377 = _1365;
    float _1379 = _1373;
    float _1381 = _1329;
    float _1383 = _1335;
    float _1385 = _1331;
    if (_1369)
    {
        float _1387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1375 = _1387;
    }
    float _1389 = _1375;
    if (_1369)
    {
        float _1391 = rsqrt(_1365);
        _1377 = _1391;
    }
    float _1393 = _1377;
    if (_1369)
    {
        float _1395 = _1373 * _1389;
        _1379 = _1395;
    }
    float _1397 = _1379;
    if (_1369)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1381 = _1399;
    }
    float _1401 = _1381;
    float _1403 = _1343;
    if (_1369)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1389;
    float _1417 = _1413;
    if (_1369)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1355;
    float _1427 = -_1413;
    float _1429 = fma(_1335, _1425, _1427);
    if (_1369)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1431;
    }
    float _1433 = _1383;
    float _1435 = _677 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1369)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1385 = _1441;
    }
    float _1443 = _1385;
    float _1445 = _1443;
    if (!_1369)
    {
        _1437 = _1357;
    }
    float _1447 = _1437;
    float _1449 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1435);
    float _1451 = _1447;
    if (!_1369)
    {
        _1439 = _1429;
    }
    float _1453 = _1439;
    float _1455 = _1453;
    float _1457 = _1423;
    if (_1369)
    {
        float _1459 = _1423 + (-1.0);
        _1417 = _1459;
    }
    float _1461 = _1417;
    float _1463 = _1461;
    if (_1369)
    {
        float _1465 = _1393 * _1443;
        _1445 = _1465;
    }
    float _1467 = _1445;
    float _1469 = _677 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1471 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1449);
    if (_1369)
    {
        float _1473 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _641 = _1473;
    }
    float _1475 = _641;
    float _1477 = _1475;
    if (_1369)
    {
        float _1479 = _1357 * _1467;
        _1451 = _1479;
    }
    float _1481 = _1451;
    if (!_1369)
    {
        _1463 = _1359;
    }
    float _1483 = _1463;
    float _1485 = _1483;
    if (_1369)
    {
        float _1487 = _1359 * _1467;
        _1485 = _1487;
    }
    float _1489 = _1485;
    if (_1369)
    {
        float _1491 = fma(_1429, _1423, _1475);
        _1455 = _1491;
    }
    float _1493 = _1455;
    if (!_1369)
    {
        _1477 = _1361;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1369)
    {
        float _1499 = _1481 * _1481;
        _1497 = _1499;
    }
    float _1501 = _1497;
    if (!_1369)
    {
        _1457 = _1363;
    }
    float _1503 = _1457;
    float _1505 = _1503;
    if (_1369)
    {
        float _1507 = _1489 * _1489;
        _1505 = _1507;
    }
    float _1509 = _1505;
    float _1511 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1469);
    float _1513 = fma(_1493, _1493, _1501);
    float _1515 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1517 = _1513 + _1509;
    float _1519 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1511);
    float _1521 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1525 = fma(_1353, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1523);
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = rsqrt(_1517);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1533 = _1521 * 0.5;
    float _1535 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1537 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1539 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1541 = fma(_1531, -0.5, _1533);
    float _1543 = -_1527;
    float _1545 = _1543 + 1.0;
    float _1547 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1537);
    float _1549 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1535);
    float _1551 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1515);
    float _1553 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1539);
    float _1555 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1557 = abs(_1545);
    float _1559 = log2(_1557);
    float _1561 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1563 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1551);
    float _1565 = _1529 * _1481;
    float _1567 = _1529 * _1493;
    float _1569 = _1529 * _1489;
    float _1571 = _1561 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1573 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1575 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1553);
    float _1577 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1579 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1581 = -_1573;
    float _1583 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1581);
    float _1585 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1589 = -_1569;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1583);
    float _1593 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1595 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1579);
    float _1597 = fma(_1591, -0.5, 0.5);
    float _1599 = fma(_1591, 0.5, 0.5);
    float _1601 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1595);
    float _1603 = exp2(_1593);
    float _1605 = _1567 + 1.0;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1601);
    float _1611 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1613 = fma(_1599, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1615 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1541);
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1619 = _1541 + _1617;
    float _1621 = sqrt(_1597);
    float _1623 = -_1611;
    float _1625 = fma(_1623, _1607, 1.0);
    float _1627 = fma(_1599, _1613, -0.212114393711090087890625);
    float _1629 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1631 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1635 = fma(_1599, _1627, 1.570728778839111328125);
    float _1637 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1541);
    float _1639 = -_1567;
    float _1641 = fma(_1603, _1605, _1639);
    float _1643 = _677 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1645 = 1.0 / _1609;
    float _1647 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1629);
    float _1649 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1651 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1643);
    float _1653 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1541);
    float _1655 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1647);
    float _1657 = _1621 * 0.636619746685028076171875;
    float _1659 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1651);
    float _1661 = 1.0 / _1521;
    float _1663 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1649);
    float _1665 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1667 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1669 = -_1635;
    float _1671 = fma(_1657, _1669, 1.0);
    float _1673 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1663);
    float _1675 = fma(_1641, 0.5, 0.5);
    float _1677 = _1667 + _1521;
    float _1679 = _1665 * _1645;
    float _1681 = _1673 * _1645;
    float _1683 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1541);
    float _1685 = _1677 * 0.5;
    float _1687 = fma(_1679, 0.5, 0.5);
    float _1689 = fma(_1681, -0.5, 0.5);
    float _1691 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1541);
    float _1693 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1685);
    float _1695 = _1541 * _1661;
    float _1697 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1541);
    float _1699 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1541);
    float _1701 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1541);
    float _1703 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1541);
    float _1705 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1541);
    float _1707 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1541);
    float _1709 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1541);
    float _1711 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1541);
    float _1713 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1541);
    float _1715 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1541);
    float _1717 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1541);
    float _1719 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1541);
    float _1721 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1541);
    float _1723 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1541);
    float _1725 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1541);
    float _1727 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1541);
    float _1729 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1541);
    float _1731 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1685);
    float _1733 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1685);
    float _1735 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1685);
    float _1737 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1685);
    float _1739 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1685);
    float _1741 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1685);
    float _1743 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1685);
    float _1745 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1685);
    float _1747 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1685);
    float _1749 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1685);
    float _1751 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1685);
    float _1753 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1685);
    float _1755 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1685);
    float _1757 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1685);
    float _1759 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1685);
    float _1761 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1685);
    float _1763 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1685);
    float _1765 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1685);
    float _1767 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1685);
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1771 = _1685 + _1769;
    float _1773 = _1685 * _1661;
    float _1775 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1777 = _1693 * _1661;
    float _1779 = _1691 * _1661;
    float _1781 = _1615 * _1661;
    float _1783 = _1731 * _1661;
    float _1785 = _1771 * _1661;
    float _1787 = _1619 * _1661;
    float2 _5739 = float2(_1777, _1779);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5739, float2(0.0), isnan(_5739)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5739, float2(0.0), isnan(_5739)), level(0.0)).x;
    float _1791 = _1633 * _1661;
    float2 _5752 = float2(_1783, _1781);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5752, float2(0.0), isnan(_5752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5752, float2(0.0), isnan(_5752)), level(0.0)).x;
    float _1795 = _1637 * _1661;
    float2 _5763 = float2(_1785, _1695);
    float _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).x;
    float2 _5771 = float2(_1773, _1787);
    float _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5771, float2(0.0), isnan(_5771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5771, float2(0.0), isnan(_5771)), level(0.0)).x;
    float _1801 = _1775 * _1661;
    float2 _5782 = float2(_1773, _1791);
    float _1803 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5782, float2(0.0), isnan(_5782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5782, float2(0.0), isnan(_5782)), level(0.0)).x;
    float _1805 = _1733 * _1661;
    float2 _5793 = float2(_1783, _1795);
    float _1807 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5793, float2(0.0), isnan(_5793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5793, float2(0.0), isnan(_5793)), level(0.0)).x;
    float _1809 = _1653 * _1661;
    float _1811 = _1735 * _1661;
    float2 _5807 = float2(_1801, _1695);
    float _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).x;
    float _1815 = _1683 * _1661;
    float2 _5818 = float2(_1805, _1809);
    float _1817 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5818, float2(0.0), isnan(_5818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5818, float2(0.0), isnan(_5818)), level(0.0)).x;
    float _1819 = _1737 * _1661;
    float _1821 = _1697 * _1661;
    float2 _5832 = float2(_1811, _1815);
    float _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5832, float2(0.0), isnan(_5832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5832, float2(0.0), isnan(_5832)), level(0.0)).x;
    float _1825 = log2(_1625);
    float _1827 = _1739 * _1661;
    float _1829 = _1725 * _1661;
    float2 _5848 = float2(_1819, _1695);
    float _1831 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5848, float2(0.0), isnan(_5848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5848, float2(0.0), isnan(_5848)), level(0.0)).x;
    float _1833 = _1699 * _1661;
    float2 _5859 = float2(_1827, _1821);
    float _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5859, float2(0.0), isnan(_5859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5859, float2(0.0), isnan(_5859)), level(0.0)).x;
    float2 _5867 = float2(_1773, _1779);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5867, float2(0.0), isnan(_5867)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5867, float2(0.0), isnan(_5867)), level(0.0)).x;
    float _1839 = _1741 * _1661;
    float _1841 = _1701 * _1661;
    float _1843 = _1729 * _1661;
    float _1845 = _1743 * _1661;
    float _1847 = _1703 * _1661;
    float _1849 = _1705 * _1661;
    float _1851 = _1745 * _1661;
    float _1853 = _1747 * _1661;
    float _1855 = _1709 * _1661;
    float _1857 = _1825 * 0.693147182464599609375;
    float _1859 = _1727 * _1661;
    float _1861 = _1707 * _1661;
    float2 _5910 = float2(_1773, _1809);
    float _1863 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5910, float2(0.0), isnan(_5910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5910, float2(0.0), isnan(_5910)), level(0.0)).x;
    float2 _5918 = float2(_1827, _1833);
    float _1865 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5918, float2(0.0), isnan(_5918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5918, float2(0.0), isnan(_5918)), level(0.0)).x;
    float _1867 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1869 = _1711 * _1661;
    float2 _5933 = float2(_1783, _1695);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5933, float2(0.0), isnan(_5933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5933, float2(0.0), isnan(_5933)), level(0.0)).x;
    float2 _5941 = float2(_1839, _1841);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).x;
    float _1875 = _1723 * _1661;
    float _1877 = _1749 * _1661;
    float2 _5955 = float2(_1845, _1847);
    float _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float2 _5963 = float2(_1851, _1695);
    float _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5963, float2(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5963, float2(0.0), isnan(_5963)), level(0.0)).x;
    float2 _5971 = float2(_1853, _1849);
    float _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5971, float2(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5971, float2(0.0), isnan(_5971)), level(0.0)).x;
    float2 _5979 = float2(_1773, _1861);
    float _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5979, float2(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5979, float2(0.0), isnan(_5979)), level(0.0)).x;
    float2 _5987 = float2(_1773, _1855);
    float _1887 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5987, float2(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5987, float2(0.0), isnan(_5987)), level(0.0)).x;
    float2 _5995 = float2(_1853, _1869);
    float _1889 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_5995, float2(0.0), isnan(_5995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_5995, float2(0.0), isnan(_5995)), level(0.0)).x;
    float2 _6003 = float2(_1877, _1695);
    float _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).x;
    float _1893 = _1751 * _1661;
    float _1895 = _1753 * _1661;
    float _1897 = _1713 * _1661;
    float _1899 = _1755 * _1661;
    float _1901 = _1715 * _1661;
    float _1903 = _1757 * _1661;
    float _1905 = _1717 * _1661;
    float _1907 = _1759 * _1661;
    float _1909 = _1719 * _1661;
    float _1911 = _1761 * _1661;
    float _1913 = _1721 * _1661;
    float _1915 = _1763 * _1661;
    float2 _6047 = float2(_1893, _1897);
    float _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).x;
    float2 _6055 = float2(_1895, _1901);
    float _1919 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6055, float2(0.0), isnan(_6055)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6055, float2(0.0), isnan(_6055)), level(0.0)).x;
    float2 _6063 = float2(_1899, _1905);
    float _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6063, float2(0.0), isnan(_6063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6063, float2(0.0), isnan(_6063)), level(0.0)).x;
    float2 _6071 = float2(_1903, _1909);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6071, float2(0.0), isnan(_6071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6071, float2(0.0), isnan(_6071)), level(0.0)).x;
    float2 _6079 = float2(_1907, _1913);
    float _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6079, float2(0.0), isnan(_6079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6079, float2(0.0), isnan(_6079)), level(0.0)).x;
    float2 _6087 = float2(_1911, _1875);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6087, float2(0.0), isnan(_6087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6087, float2(0.0), isnan(_6087)), level(0.0)).x;
    float2 _6095 = float2(_1915, _1829);
    float _1929 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _1931 = _1765 * _1661;
    float _1933 = _1767 * _1661;
    float2 _6109 = float2(_1931, _1859);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6109, float2(0.0), isnan(_6109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6109, float2(0.0), isnan(_6109)), level(0.0)).x;
    float2 _6117 = float2(_1933, _1843);
    float _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6117, float2(0.0), isnan(_6117)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6117, float2(0.0), isnan(_6117)), level(0.0)).x;
    float2 _6125 = float2(_1773, _1695);
    float _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6125, float2(0.0), isnan(_6125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6125, float2(0.0), isnan(_6125)), level(0.0)).x;
    float3 _6134 = float3(_1687, _1689, _1867);
    float _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6134, float3(0.0), isnan(_6134)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6134, float3(0.0), isnan(_6134)), level(0.0)).x;
    float3 _6145 = float3(_1687, _1689, _1867);
    float4 _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).xyzw;
    float _1946 = _1944.x;
    float _1948 = _1944.y;
    float _1950 = _1944.z;
    float _1952 = _1944.w;
    float2 _6161 = float2(_1671, _1675);
    float3 _1956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _1958 = _1956.x;
    float _1960 = _1956.y;
    float _1962 = _1956.z;
    float _1964 = _677 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1966 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1968 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1964);
    float _1970 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1966);
    float _1972 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1968);
    float _1974 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1976 = _1974 + _1521;
    float _1978 = _1976 * _1661;
    float _1980 = _1978 * 0.5;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1984 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1982);
    float _1986 = 1.0 / _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1990 = _1986 * _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1994 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1992);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1998 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1996);
    float _2000 = 1.0 / _1994;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2004 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2008 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2006);
    float _2010 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2012 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2010);
    float _2014 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2016 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2014);
    float _2018 = 1.0 / _2004;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2022 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2020);
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2026 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2024);
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2030 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2028);
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2034 = -_1990;
    float _2036 = fma(_2000, _2032, _2034);
    float _2038 = 1.0 / _2008;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2042 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2040);
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    float _2048 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2050 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2048);
    bool _2052 = _2036 >= 0.0;
    bool _2054 = isnan(_2036);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = 1.0 / _1998;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2066 = -_1990;
    float _2068 = fma(_2038, _2064, _2066);
    float _2070 = 1.0 / _2022;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2074 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2072);
    float _2076 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2078 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2082 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2080);
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2086 = fma(_1873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2084);
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = -_1990;
    float _2092 = fma(_2062, _2088, _2090);
    float _2094 = 1.0 / _2042;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2098 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2096);
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2102 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2100);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2106 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
    bool _2108 = _2092 >= 0.0;
    bool _2110 = isnan(_2092);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2120 = -_1990;
    float _2122 = fma(_2018, _2118, _2120);
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2126 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2124);
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2130 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2128);
    bool _2132 = !_2116;
    float _2134 = _2132 ? 0.0 : 2.0;
    float _2136 = 1.0 / _2050;
    bool _2138 = _2122 >= 0.0;
    bool _2140 = isnan(_2122);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2152 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2150);
    bool _2154 = !_2060;
    float _2156 = _2154 ? 0.0 : 2.0;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2160 = fma(_1891, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2158);
    float _2162 = _2156 + _2148;
    bool _2164 = _2068 >= 0.0;
    bool _2166 = isnan(_2068);
    bool _2168 = _2164 || _2166;
    bool _2170 = isnan(0.0);
    bool _2172 = _2168 || _2170;
    float _2174 = float(_2172);
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2178 = -_1990;
    float _2180 = fma(_2070, _2176, _2178);
    float _2182 = 1.0 / _2102;
    float _2184 = _2162 + _2134;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2188 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2186);
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2192 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2190);
    bool _2194 = _2180 >= 0.0;
    bool _2196 = isnan(_2180);
    bool _2198 = _2194 || _2196;
    bool _2200 = isnan(0.0);
    bool _2202 = _2198 || _2200;
    float _2204 = float(_2202);
    float _2206 = _2184 + _2174;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2210 = -_1990;
    float _2212 = fma(_2094, _2208, _2210);
    float _2214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2216 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2214);
    float _2218 = 1.0 / _2012;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2222 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2220);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2230 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2234 = fma(_1929, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2232);
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2238 = fma(_1935, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2236);
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2242 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2240);
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2246 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2244);
    float _2248 = 1.0 / _2160;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2252 = -_1990;
    float _2254 = fma(_2218, _2250, _2252);
    float _2256 = 1.0 / _2246;
    bool _2258 = _2254 >= 0.0;
    bool _2260 = isnan(_2254);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan(0.0);
    bool _2266 = _2262 || _2264;
    float _2268 = float(_2266);
    float _2270 = _2206 + _2268;
    float _2272 = 1.0 / _2016;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1990;
    float _2278 = fma(_2272, _2274, _2276);
    bool _2280 = _2278 >= 0.0;
    bool _2282 = isnan(_2278);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.0);
    bool _2288 = _2284 || _2286;
    bool _2290 = !_2288;
    float _2292 = _2290 ? 0.0 : 2.0;
    float _2294 = _2270 + _2292;
    float _2296 = 1.0 / _2026;
    float _2298 = _2294 + _2204;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2302 = -_1990;
    float _2304 = fma(_2296, _2300, _2302);
    bool _2306 = _2304 >= 0.0;
    bool _2308 = isnan(_2304);
    bool _2310 = _2306 || _2308;
    bool _2312 = isnan(0.0);
    bool _2314 = _2310 || _2312;
    float _2316 = 1.0 / _2030;
    float _2318 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2320 = -_1990;
    float _2322 = fma(_2316, _2318, _2320);
    bool _2324 = _2322 >= 0.0;
    bool _2326 = isnan(_2322);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    bool _2334 = !_2314;
    float _2336 = _2334 ? 0.0 : 2.0;
    bool _2338 = !_2332;
    float _2340 = _2338 ? 0.0 : 2.0;
    float _2342 = _2298 + _2336;
    bool _2344 = _2212 >= 0.0;
    bool _2346 = isnan(_2212);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan(0.0);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2358 = -_1990;
    float _2360 = fma(_2136, _2356, _2358);
    float _2362 = _2342 + _2340;
    float _2364 = 1.0 / _2074;
    float _2366 = _2362 + _2354;
    float _2368 = 1.0 / _2046;
    float _2370 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2372 = -_1990;
    float _2374 = fma(_2364, _2370, _2372);
    bool _2376 = _2360 >= 0.0;
    bool _2378 = isnan(_2360);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2390 = -_1990;
    float _2392 = fma(_2368, _2388, _2390);
    bool _2394 = _2392 >= 0.0;
    bool _2396 = isnan(_2392);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.0);
    bool _2402 = _2398 || _2400;
    bool _2404 = !_2402;
    float _2406 = _2404 ? 0.0 : 2.0;
    float _2408 = _2366 + _2406;
    bool _2410 = _2374 >= 0.0;
    bool _2412 = isnan(_2374);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(0.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2408 + _2386;
    float _2424 = 1.0 / _2082;
    float _2426 = _2422 + _2420;
    float _2428 = 1.0 / _2078;
    float _2430 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2432 = -_1990;
    float _2434 = fma(_2424, _2430, _2432);
    bool _2436 = _2434 >= 0.0;
    bool _2438 = isnan(_2434);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan(0.0);
    bool _2444 = _2440 || _2442;
    float _2446 = float(_2444);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2450 = -_1990;
    float _2452 = fma(_2182, _2448, _2450);
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2456 = -_1990;
    float _2458 = fma(_2428, _2454, _2456);
    bool _2460 = _2458 >= 0.0;
    bool _2462 = isnan(_2458);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(0.0);
    bool _2468 = _2464 || _2466;
    bool _2470 = !_2468;
    float _2472 = _2470 ? 0.0 : 2.0;
    float _2474 = _2426 + _2472;
    float _2476 = 1.0 / _2086;
    float _2478 = _2474 + _2446;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2482 = -_1990;
    float _2484 = fma(_2476, _2480, _2482);
    bool _2486 = _2484 >= 0.0;
    bool _2488 = isnan(_2484);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = 1.0 / _2098;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = -_1990;
    float _2502 = fma(_2496, _2498, _2500);
    bool _2504 = _2502 >= 0.0;
    bool _2506 = isnan(_2502);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    bool _2514 = !_2494;
    float _2516 = _2514 ? 0.0 : 2.0;
    bool _2518 = !_2512;
    float _2520 = _2518 ? 0.0 : 2.0;
    float _2522 = _2478 + _2516;
    bool _2524 = _2452 >= 0.0;
    bool _2526 = isnan(_2452);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.0);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = _2522 + _2520;
    float _2538 = _2536 + _2534;
    float _2540 = 1.0 / _2106;
    float _2542 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2544 = -_1990;
    float _2546 = fma(_2540, _2542, _2544);
    bool _2548 = _2546 >= 0.0;
    bool _2550 = isnan(_2546);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.0);
    bool _2556 = _2552 || _2554;
    float _2558 = 1.0 / _2126;
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2562 = -_1990;
    float _2564 = fma(_2558, _2560, _2562);
    bool _2566 = !_2556;
    float _2568 = _2566 ? 0.0 : 2.0;
    bool _2570 = _2564 >= 0.0;
    bool _2572 = isnan(_2564);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    float _2582 = _2538 + _2568;
    float _2584 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2586 = -_1990;
    float _2588 = fma(_2248, _2584, _2586);
    float _2590 = 1.0 / _2130;
    float _2592 = _2582 + _2580;
    bool _2594 = _2588 >= 0.0;
    bool _2596 = isnan(_2588);
    bool _2598 = _2594 || _2596;
    bool _2600 = isnan(0.0);
    bool _2602 = _2598 || _2600;
    float _2604 = float(_2602);
    float _2606 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2608 = -_1990;
    float _2610 = fma(_2590, _2606, _2608);
    bool _2612 = _2610 >= 0.0;
    bool _2614 = isnan(_2610);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = _2592 + _2622;
    float _2626 = 1.0 / _2152;
    float _2628 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2630 = -_1990;
    float _2632 = fma(_2626, _2628, _2630);
    bool _2634 = _2632 >= 0.0;
    bool _2636 = isnan(_2632);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(0.0);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2642;
    float _2646 = _2644 ? 0.0 : 2.0;
    float _2648 = _2624 + _2646;
    float _2650 = 1.0 / _2188;
    float _2652 = _2648 + _2604;
    float _2654 = 1.0 / _2234;
    float _2656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2658 = -_1990;
    float _2660 = fma(_2650, _2656, _2658);
    bool _2662 = _2660 >= 0.0;
    bool _2664 = isnan(_2660);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = 1.0 / _2192;
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2676 = -_1990;
    float _2678 = fma(_2654, _2674, _2676);
    float _2680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2682 = -_1990;
    float _2684 = fma(_2672, _2680, _2682);
    bool _2686 = _2684 >= 0.0;
    bool _2688 = isnan(_2684);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = 1.0 / _2216;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2700 = -_1990;
    float _2702 = fma(_2696, _2698, _2700);
    bool _2704 = _2702 >= 0.0;
    bool _2706 = isnan(_2702);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan(0.0);
    bool _2712 = _2708 || _2710;
    float _2714 = 1.0 / _2222;
    bool _2716 = !_2712;
    float _2718 = _2716 ? 0.0 : 3.0;
    float _2720 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2722 = -_1990;
    float _2724 = fma(_2714, _2720, _2722);
    bool _2726 = _2724 >= 0.0;
    bool _2728 = isnan(_2724);
    bool _2730 = _2726 || _2728;
    bool _2732 = isnan(0.0);
    bool _2734 = _2730 || _2732;
    float _2736 = 1.0 / _2226;
    bool _2738 = !_2734;
    float _2740 = _2738 ? 0.0 : 3.0;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2744 = -_1990;
    float _2746 = fma(_2736, _2742, _2744);
    bool _2748 = _2746 >= 0.0;
    bool _2750 = isnan(_2746);
    bool _2752 = _2748 || _2750;
    bool _2754 = isnan(0.0);
    bool _2756 = _2752 || _2754;
    float _2758 = 1.0 / _2230;
    float _2760 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2762 = -_1990;
    float _2764 = fma(_2758, _2760, _2762);
    bool _2766 = _2764 >= 0.0;
    bool _2768 = isnan(_2764);
    bool _2770 = _2766 || _2768;
    bool _2772 = isnan(0.0);
    bool _2774 = _2770 || _2772;
    bool _2776 = !_2694;
    float _2778 = _2776 ? 0.0 : 3.0;
    bool _2780 = _2678 >= 0.0;
    bool _2782 = isnan(_2678);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan(0.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = !_2774;
    float _2792 = _2790 ? 0.0 : 3.0;
    float _2794 = _2778 + _2718;
    bool _2796 = !_2756;
    float _2798 = _2796 ? 0.0 : 3.0;
    bool _2800 = !_2788;
    float _2802 = _2800 ? 0.0 : 3.0;
    float _2804 = _2794 + _2740;
    float _2806 = _2804 + _2798;
    bool _2808 = !_2670;
    float _2810 = _2808 ? 0.0 : 2.0;
    float _2812 = _2806 + _2792;
    float _2814 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2652 + _2810;
    float _2818 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1970);
    float _2820 = _2812 + _2802;
    float _2822 = 1.0 / _2238;
    float _2824 = _2816 * 0.02857142873108386993408203125;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2818);
    float _2830 = _2828 + _1609;
    out.gl_Position.x = _1665;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _2828;
    out.gl_Position.w = _1609;
    float _2832 = 1.0 / _2242;
    float _2834 = _2830 * 0.5;
    out.m_68.z = _2834;
    out.m_68.w = _1609;
    float _2836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2838 = -_1990;
    float _2840 = fma(_2822, _2836, _2838);
    float _2842 = exp2(_2814);
    bool _2844 = _2840 >= 0.0;
    bool _2846 = isnan(_2840);
    bool _2848 = _2844 || _2846;
    bool _2850 = isnan(0.0);
    bool _2852 = _2848 || _2850;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = -_1990;
    float _2858 = fma(_2832, _2854, _2856);
    float _2860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2862 = -_1990;
    float _2864 = fma(_2256, _2860, _2862);
    bool _2866 = !_2852;
    float _2868 = _2866 ? 0.0 : 3.0;
    bool _2870 = _2858 >= 0.0;
    bool _2872 = isnan(_2858);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(0.0);
    bool _2878 = _2874 || _2876;
    bool _2880 = _2864 >= 0.0;
    bool _2882 = isnan(_2864);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2820 + _2868;
    bool _2892 = !_2878;
    float _2894 = _2892 ? 0.0 : 3.0;
    float _2896 = -_2842;
    float _2898 = _2896 + 1.0;
    bool _2900 = !_2888;
    float _2902 = _2900 ? 0.0 : 5.0;
    float _2904 = _2890 + _2894;
    float _2906 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2908 = _2904 + _2902;
    float _2910 = _2906 * _1941;
    float _2912 = -_2906;
    float _2914 = _2912 + 1.0;
    float _2916 = _2908 * 0.14285714924335479736328125;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _1952 * _2910;
    float _2922 = _1962 * _2910;
    float _2924 = _2826 * _2918;
    float _2926 = fma(_1958, _2920, _1946);
    float _2928 = _2924 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = fma(_1960, _2920, _1948);
    float _2932 = _1952 * _2914;
    float _2934 = fma(_1952, _2922, _1950);
    float _2936 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2926;
    out.m_70.y = _2930;
    out.m_70.z = _2934;
    out.m_70.w = _2932;
    out.m_49.x = _2936;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

