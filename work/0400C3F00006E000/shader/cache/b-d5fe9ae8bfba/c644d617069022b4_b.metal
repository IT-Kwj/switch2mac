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
    float4 m_60 [[user(locn1)]];
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
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _571 = false;
    bool _417 = false;
    bool _307 = false;
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
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_45.x = 0.0;
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
        float _2970 = as_type<float>(_107);
        out.gl_Position.z = _2970;
    }
    if (!_93)
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
        float _131 = float(_89);
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
        float _3039 = as_type<float>(_145);
        out.gl_Position.z = _3039;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
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
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _315 + _317;
    float _321 = in.m_52.x;
    float _323 = in.m_52.y;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = 1.0 / _339;
    float _345 = -_335;
    float _347 = _345 + 1.0;
    float _349 = _319 * _343;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _347;
    float _373 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_369, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = -_361;
    float _379 = _377 + 1.0;
    float _381 = _373 * _371;
    float _383 = _375 * _371;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _389 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _391 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _387);
    float _393 = _389 * _321;
    float _395 = _391 * _323;
    bool _397 = !_341;
    float _415;
    if (!_397)
    {
        float _399 = in.m_54.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_89);
        float _421 = 1.0 / _419;
        float _423 = _125 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _429;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _461;
    float _465 = -_441;
    float _467 = _465 + 1.0;
    bool _469 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_425);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _483 = _457 * _467;
    float _485 = -_457;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _445;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _463 * _459;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _425 + _497;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _425 + _507;
    float _511 = _441 * _503;
    float _513 = _493 * _489;
    float _515 = _505 * _483;
    float _517 = fma(_513, _509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _519 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _523 = fma(_517, _511, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _527;
    out.m_56.y = _533;
    out.m_56.z = _535;
    out.m_56.w = _537;
    bool _539 = !_481;
    float _541 = _525;
    float _565;
    float _567;
    float _569;
    if (!_539)
    {
        float _543 = in.m_54.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _553 = _125 * _549;
        float _555 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _557 = _555 * _545;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _553;
        _97 = _557;
        _567 = _547;
        _541 = _543;
        _569 = _563;
        _571 = true;
    }
    else
    {
        float _573 = float(_89);
        float _575 = 1.0 / _573;
        float _577 = _125 * _575;
        _565 = _577;
        _567 = _573;
        _569 = _577;
    }
    _571 = false;
    float _579 = _565;
    float _581 = _97;
    float _583 = _567;
    float _585 = _541;
    float _587 = _569;
    float _589 = in.m_54.x;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _593 = int(_591);
    float _595 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = in.m_54.w;
    float _603 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _607 = _605 != 0;
    float _609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _611 = int(_609);
    float _613 = in.m_54.z;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _617 = _579 + _615;
    bool _619 = !_607;
    int _621 = _619 ? 0 : 1;
    float _623 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _625;
    float _629 = _581;
    float _631 = _595;
    float _633 = _585;
    if (!_599)
    {
        float _635 = in.m_54.y;
        _629 = _635;
    }
    float _637 = _629;
    float _639 = float(uint(_593));
    float _641 = 1.0 / _583;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _647 = _589 * 2.0;
    float _649 = float(_611);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _655 = 1.0 / _639;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _661 = _601 > 0.5;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _667 = -_199;
    int _669 = _661 ? as_type<int>(_667) : as_type<int>(_199);
    float _671 = 1.0 / _649;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _677 = as_type<float>(_593);
    if (!_599)
    {
        _631 = _613;
    }
    float _679 = _631;
    float _681 = _679;
    if (!_599)
    {
        _633 = _637;
    }
    float _683 = _633;
    float _685 = floor(_647);
    bool _687 = !_599;
    float _689 = _687 ? 1.2345600128173828125 : 1.0;
    float _691 = _683;
    float _693 = _637;
    if (_599)
    {
        float _695 = in.m_54.x;
        float _697 = in.m_54.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = _671 * _125;
    float _705 = 1.0 / _627;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _707;
    bool _711 = _685 > 0.0;
    float _713 = trunc(_703);
    int _715 = int(_713);
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _731;
    int _735 = _725 ? 0 : 1;
    float _737 = 1.0 / _645;
    int _739 = ~_735;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _701 * 2.0;
    int _747 = _743;
    if (!_711)
    {
        int _749 = ~_735;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _761 = _759 != 0;
    float _763 = floor(_745);
    float _765 = float(uint(_715));
    if (_599)
    {
        _681 = _701;
    }
    float _767 = _681;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _775 = _773 != 0;
    bool _777 = !_761;
    int _779 = _777 ? 0 : 1;
    float _781 = 1.0 / _653;
    int _783 = as_type<int>(_655) + (-2);
    float _785 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _787 = _613 > 0.5;
    bool _789 = !_757;
    int _791 = _789 ? 0 : 1;
    float _793 = as_type<float>(_783) * _765;
    float _795 = -_195;
    int _797 = _787 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    bool _801 = _589 > 0.5;
    float _803 = 1.0 / _659;
    bool _805 = _763 >= 0.0;
    bool _807 = isnan(_763);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = !_771;
    int _817 = _815 ? 0 : 1;
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = -_195;
    int _825 = _801 ? as_type<int>(_823) : as_type<int>(_195);
    float _827 = trunc(_793);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _848 = _846 != 0;
    float _850 = 1.0 / _665;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _854 = _852 != 0;
    float _856 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _858 = _813 ? 0 : 1;
    float _860 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    bool _862 = _763 > 0.0;
    float _864 = 1.0 / _675;
    int _866 = ~_593;
    int _868 = _866 + 1;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _874 = ~_858;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = as_type<float>(_868);
    int _882 = _878;
    if (!_599)
    {
        _880 = _613;
    }
    float _884 = _880;
    float _886 = 1.0 / _872;
    float _888 = _884;
    if (_599)
    {
        _888 = _701;
    }
    float _890 = _888;
    int _892 = _868 * int(_832);
    int _894 = _892 + _715;
    bool _896 = !_599;
    float _898 = _896 ? _701 : _589;
    if (!_862)
    {
        int _900 = ~_858;
        int _902 = _900 + 1;
        _882 = _902;
    }
    int _904 = _882;
    float _906 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _908 = !_836;
    float _910 = _908 ? _195 : as_type<float>(_797);
    float _912 = _689 * _898;
    float _914 = float(uint(_894));
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = _587 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _938 = as_type<float>(_783) * _914;
    float _940 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _860);
    float _942 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _603);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _944;
    float _948 = trunc(_938);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = _918 * _705;
    float _956 = _946 * _737;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _970 = !_922;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _936;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _976;
    float _980 = _960 * _781;
    float _982 = _968 * _803;
    float _984 = _964 * _864;
    float _986 = _978 * _850;
    float _988 = _613 * 2.0;
    int _990 = ~_593;
    int _992 = _990 + 1;
    float _994 = floor(_912);
    int _996 = int(_832) + int(_952);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1002 = fma(_982, _617, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1004 = float(_593);
    float _1006 = _1000 * _886;
    int _1008 = abs(_791);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1010;
    float _1014 = floor(_988);
    float _1016 = _1004 * _125;
    int _1018 = _992 * _996;
    int _1020 = _1018 + _715;
    float _1022 = _1012 * _974;
    float _1024 = float(_715);
    float _1026 = _1016 * _641;
    bool _1028 = !_926;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_994;
    float _1034 = _912 + _1032;
    bool _1036 = _1024 >= _1004;
    bool _1038 = isnan(_1024);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1004);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_729, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1050 = uint(_1020) >= uint(_593);
    float _1052 = trunc(_1026);
    int _1054 = int(_1052);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1058 = _579 + _1056;
    float _1060 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1062 = !_1050;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1068 = _1014 >= 0.0;
    bool _1070 = isnan(_1014);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1080 = ~_996;
    int _1082 = _1080 + _1064;
    int _1084 = _1082 + 1;
    float _1086 = trunc(_1046);
    int _1088 = int(_1086);
    bool _1090 = _1014 > 0.0;
    float _1092 = fma(_709, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1004 * _1034;
    int _1096 = _593 * _1084;
    int _1098 = _1096 + _715;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1102 = _579 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1106 = _579 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1110 = _579 + _1108;
    float _1112 = trunc(_1094);
    int _1114 = int(_1112);
    int _1116 = _1076 ? 0 : 1;
    float _1118 = fma(_980, _1102, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1120 = _593 == 0;
    float _1122 = fma(_956, _1106, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _1124 = abs(_621);
    float _1126 = fma(_984, _1110, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1128 = !_1120;
    int _1130 = _1128 ? _1098 : (-1);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _579 + _1132;
    int _1136 = ~_1088;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    float _1142 = fma(_733, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1144 = _593 + (-1);
    int _1146 = abs(_779);
    int _1148 = _1140 * _1130;
    float _1150 = fma(_986, _1134, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1152 = abs(_817);
    int _1154 = _1114 * _1124;
    int _1156 = _1154 + _715;
    int _1158 = _1088 * _1144;
    int _1160 = _1158 + _1148;
    bool _1162 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1164 = isnan(_579);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    int _1174 = _1160 * _1146;
    int _1176 = abs(_821);
    bool _1178 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1180 = isnan(_579);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    int _1190 = _1054 * _1008;
    int _1192 = _1190 + _1174;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    bool _1198 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1200 = isnan(_579);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = _1156 * _1152;
    int _1212 = _1210 + _1192;
    float _1214 = _1188 * _1196;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    bool _1220 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1222 = isnan(_579);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    int _1232 = _1114 * _1176;
    int _1234 = _1232 + _1212;
    float _1236 = -_1208;
    float _1238 = _1236 + 1.0;
    float _1240 = _1208 * _1218;
    bool _1242 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1244 = isnan(_579);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -_1230;
    float _1256 = _1254 + 1.0;
    float _1258 = float(uint(_1234));
    float _1260 = _1230 * _1238;
    bool _1262 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1264 = isnan(_579);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    bool _1274 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1276 = isnan(_587);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = as_type<float>(_783) * _1258;
    bool _1288 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1290 = isnan(_587);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1252 * _1256;
    float _1302 = -_1252;
    float _1304 = _1302 + 1.0;
    bool _1306 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1308 = isnan(_579);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1272;
    float _1320 = _1318 + 1.0;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    bool _1328 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1330 = isnan(_579);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1342 = _579 + _1340;
    float _1344 = -_1284;
    float _1346 = _1344 + 1.0;
    int _1348 = ~_593;
    int _1350 = _1348 + 1;
    float _1352 = _1272 * _1304;
    float _1354 = _1316 * _1320;
    float _1356 = -_1316;
    float _1358 = _1356 + 1.0;
    float _1360 = _1298 * _1346;
    float _1362 = fma(_1022, _1058, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1364 = -_1298;
    float _1366 = _1364 + 1.0;
    float _1368 = _1142 * _1360;
    float _1370 = _1092 * _1360;
    float _1372 = _1338 * _1358;
    float _1374 = -_1338;
    float _1376 = _1374 + 1.0;
    int _1378 = _1350 * int(_1326);
    int _1380 = _1378 + _1234;
    float _1382 = _1048 * _1360;
    float _1384 = _1122 * _1372;
    float _1386 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1388 = float(uint(_1380));
    float _1390 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1382);
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1396 = _699 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1398 = as_type<float>(_783) * _1388;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1384);
    float _1402 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1394);
    int _1404 = ~_1116;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1006, _1342, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1414 = _1408;
    if (!_1090)
    {
        int _1416 = ~_1116;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc(_1398);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1390);
    float _1430 = -_1412;
    float _1432 = fma(_1396, 2.0, _1430);
    float _1434 = fma(_1118, _1354, _1400);
    float _1436 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1386);
    float _1438 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1392);
    float _1440 = _613 + _701;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _910 + 0.5;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1450 = ~_593;
    int _1452 = _1450 + 1;
    float _1454 = _1440 + (-1.0);
    float _1456 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    float _1458 = _589 + _701;
    int _1460 = int(_1326) + int(_1426);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1464 = _1458 + (-1.0);
    float _1466 = -_125;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1432);
    int _1470 = _1452 * _1460;
    int _1472 = _1470 + _1234;
    float _1474 = fma(_906, -2.0, _1462);
    float _1476 = _1444 * _125;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1482 = !_840;
    float _1484 = _1482 ? _199 : as_type<float>(_669);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1468);
    float _1488 = exp2(_1476);
    bool _1490 = uint(_1472) >= uint(_593);
    float _1492 = fma(_1126, _1352, _1434);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1496 = 1.0 + _1494;
    int _1498 = abs(_1030);
    float _1500 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1402);
    float _1502 = float(uint(_1156));
    float _1504 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    int _1506 = abs(_972);
    float _1508 = 1.0 / _1496;
    bool _1510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1512 = isnan(1.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1518 = _1514 || _1516;
    float _1520 = as_type<float>(_783) * _1502;
    float _1522 = float(_753);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1060 + _1524;
    float _1528 = float(_1506);
    float _1530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1474);
    float _1532 = float(_1420);
    float _1534 = -_1488;
    float _1536 = _1534 + 1.0;
    bool _1538 = !_1490;
    int _1540 = _1538 ? 0 : (-1);
    float _1542 = trunc(_1520);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1528 * _1532;
    int _1560 = ~_1460;
    int _1562 = _1560 + _1540;
    int _1564 = _1562 + 1;
    float _1566 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1568 = _1556 ? _1536 : 0.0;
    float _1570 = _1558 * (-2.0);
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1574 = _1066 + _1572;
    int _1576 = ~_593;
    int _1578 = _1576 + 1;
    if (_1518)
    {
        float _1580 = _1568 * _1508;
        _129 = _1580;
    }
    float _1582 = _129;
    int _1584 = _593 * _1564;
    int _1586 = _1584 + _1234;
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1566);
    float _1590 = fma(_1002, _1300, _1492);
    float _1592 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1594 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1596 = !_1120;
    int _1598 = _1596 ? _1586 : (-1);
    int _1600 = _1578 * int(_1546);
    int _1602 = _1600 + _1156;
    bool _1604 = !_848;
    float _1606 = _1604 ? _195 : as_type<float>(_825);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1078 + _1608;
    int _1612 = _1598 >> 31;
    float _1614 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = float(uint(_1602));
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1588);
    int _1620 = _1612 & 3;
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = float(_1498);
    float _1626 = as_type<float>(_783) * _1616;
    int _1628 = _1598 + _1620;
    float _1630 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1632 = _701 > 0.5;
    float _1634 = _1624 * _1522;
    int _1636 = _1628 >> 2;
    float _1638 = trunc(_1626);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = _1484 + (-0.5);
    float _1652 = -_199;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_199);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1658 = uint(int(uint(_1648) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    int _1674 = _1598 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_1150, _1260, _1590);
    bool _1680 = _1618 >= 0.0;
    float _1682 = in.m_58.x;
    float _1684 = in.m_58.y;
    float _1686 = in.m_58.z;
    int _1688 = ~_593;
    int _1690 = _1688 + 1;
    float _1692 = -_1650;
    float _1694 = -_1530;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1676 ? 0 : 1;
    int _1700 = _1648 + 8;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    bool _1718 = uint(_1674) > 1u;
    out.m_60.x = _1622;
    out.m_60.y = _1630;
    out.m_60.z = _1644;
    out.m_60.w = _1656;
    int _1720 = int(_1546) + int(_1642);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1724 = fma(_1478, _1570, _1478);
    int _1726 = ~_1698;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    float _1732 = _1606 + 0.5;
    float _1734 = fma(_1410, _1240, _1678);
    int _1736 = _1730;
    if (_1680)
    {
        out.m_45.x = 0.0;
    }
    float _1738 = fma(_1362, _1214, _1734);
    if (!_1718)
    {
        int _1740 = ~_1698;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1748 = !_854;
    float _1750 = _1748 ? _199 : as_type<float>(_1654);
    float _1752 = -_1504;
    float _1754 = _1752 + 1.0;
    bool _1756 = _1674 != 3;
    int _1758 = _1690 * _1720;
    int _1760 = _1758 + _1156;
    bool _1762 = uint(_1674) >= 2u;
    float _1764 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1766 = -_1750;
    float _1768 = _1766 + 0.5;
    float _1770 = fma(_1484, _1754, _1696);
    bool _1772 = uint(_1760) >= uint(_593);
    float _1774 = -_1500;
    float _1776 = _1774 + 1.0;
    float _1778 = _1634 * (-2.0);
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1782 = abs(_1744);
    float _1784 = -_1776;
    float _1786 = fma(_910, _1784, _1486);
    int _1788 = _1762 ? 0 : 1;
    float _1790 = fma(_1480, _1778, _1480);
    int _1792 = _1598 & 3;
    bool _1794 = _1792 != 0;
    float _1796 = fma(_1778, _1684, _1684);
    float _1798 = _1764 * _1722;
    float _1800 = _1780 * _1746;
    bool _1802 = !_1794;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = fma(_1570, _1682, _1682);
    int _1808 = ~_1788;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1738);
    bool _1816 = _1674 != 3;
    out.m_62.x = _1798;
    out.m_62.y = _1800;
    out.m_62.z = _1786;
    out.m_62.w = _1770;
    int _1818 = _1812;
    if (_1756)
    {
        int _1820 = ~_1788;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = abs(_1804);
    out.m_64.x = _1814;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = !_1772;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = ~_1782;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1826;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1824);
    int _1850 = _1840 * as_type<int>(_1672);
    int _1852 = abs(_1830);
    int _1854 = ~_1848;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * as_type<int>(_1664);
    int _1862 = _1860 + _1850;
    float _1864 = _1526 * _1526;
    bool _1866 = !_844;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = fma(_1574, _1574, _1864);
    int _1872 = ~_1720;
    int _1874 = _1872 + _1834;
    int _1876 = _1874 + 1;
    int _1878 = _1858 * as_type<int>(_1708);
    int _1880 = _1878 + _1862;
    int _1882 = abs(_1868);
    float _1884 = fma(_1610, _1610, _1870);
    int _1886 = ~_1852;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    int _1892 = _593 * _1876;
    int _1894 = _1892 + _1156;
    int _1896 = ~_1882;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1890 * as_type<int>(_1716);
    int _1904 = _1902 + _1880;
    float _1906 = rsqrt(_1884);
    bool _1908 = !_1120;
    int _1910 = _1908 ? _1894 : (-1);
    float _1912 = _589 + (-0.5);
    int _1914 = _1900 * _1904;
    float _1916 = as_type<float>(_1890);
    if (_1680)
    {
        _1916 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1918 = _1916;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1806);
    int _1922 = _1910 * _1882;
    int _1924 = _1922 + _1914;
    bool _1926 = !_930;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = as_type<int>(_1918);
    if (_1680)
    {
        float _1932 = _1918 * 5.0;
        _1930 = as_type<int>(_1932);
    }
    int _1934 = _1930;
    float _1936 = fma(_1724, _1582, _1920);
    float _1938 = _623 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1940 = float(_1924);
    if (_1680)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5730 = as_type<float>(_1934);
        out.gl_Position.z = _5730;
    }
    int _1942 = abs(_1928);
    float _1944 = _1938 * _1906;
    float _1946 = _701 + (-0.5);
    out.m_66.y = _1940;
    float _1948 = _1574 * _1944;
    float _1950 = _1526 * _1944;
    if (_1680)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1952 = -_1950;
    float _1954 = _1060 + _1952;
    float _1956 = _1610 * _1944;
    float _1958 = -_1948;
    float _1960 = _1066 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1954 + _1962;
    float _1966 = -_1956;
    float _1968 = _1078 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1960 + _1970;
    float _1974 = -_1950;
    float _1976 = _1526 + _1974;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1982 = _1968 + _1980;
    float _1984 = float(_1942);
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1796);
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1978);
    float _1990 = float(_904);
    float _1992 = -_1948;
    float _1994 = _1574 + _1992;
    float _1996 = _1976 * _1976;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1988);
    float _2000 = fma(_1790, _1582, _1986);
    float _2002 = _589 + _613;
    float _2004 = fma(_1994, _1994, _1996);
    float _2006 = -_1956;
    float _2008 = _1610 + _2006;
    bool _2010 = _1998 >= 0.0;
    float _2012 = _1984 * _1990;
    float _2014 = _2000 * 0.15915493667125701904296875;
    float _2016 = _2002 + (-1.0);
    float _2018 = fma(_2008, _2008, _2004);
    float _2020 = _2012 * (-2.0);
    float _2022 = _1936 * 0.15915493667125701904296875;
    float _2024 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2026 = _2014 * 6.283185482025146484375;
    float _2028 = sin(_2026);
    float _2030 = fma(_2020, _1686, _1686);
    float _2032 = _613 + (-0.5);
    float _2034 = fma(_2024, _2020, _2024);
    int _2036 = as_type<int>(_2030);
    float _2038 = _1972;
    float _2040 = _1954;
    if (_2010)
    {
        _677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _677;
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2030);
    if (_2010)
    {
        out.m_45.x = 0.0;
    }
    float _2046 = _2022 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    if (_2010)
    {
        float _2050 = _2042 * 5.0;
        _2036 = as_type<int>(_2050);
    }
    int _2052 = _2036;
    float _2054 = fma(_2034, _1582, _2044);
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5918 = as_type<float>(_2052);
        out.gl_Position.z = _5918;
    }
    float _2056 = _2054 * 0.15915493667125701904296875;
    float _2058 = _2022 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    float _2062 = sqrt(_2018);
    float _2064 = _2014 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    if (_2010)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2068 = _2056 * 6.283185482025146484375;
    float _2070 = cos(_2068);
    float _2072 = _1906 * _2062;
    float _2074 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2080 = _623 * _2072;
    float _2082 = _2072 * _2074;
    float _2084 = _2048 * _2028;
    float _2086 = _2056 * 6.283185482025146484375;
    float _2088 = sin(_2086);
    float _2090 = _2060 * _2066;
    float _2092 = _2076 * _2082;
    float _2094 = _2078 * _2080;
    float _2096 = _2060 * _2028;
    bool _2098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2100 = isnan(0.5);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2106 = _2102 || _2104;
    float _2108 = _2070 * _2092;
    float _2110 = _2028 * _2070;
    float _2112 = _2066 * _2070;
    float _2114 = _2048 * _2066;
    float _2116 = _2060 * _2108;
    float _2118 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2120 = _2118 * 0.5;
    bool _2122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2124 = isnan(0.5);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2130 = _2126 || _2128;
    float _2132 = fma(_2088, _2090, _2084);
    float _2134 = -_2092;
    float _2136 = _2088 * _2134;
    float _2138 = fma(_2088, _2084, _2090);
    float _2140 = fma(_2132, _2094, _2116);
    float _2142 = -_2114;
    float _2144 = fma(_2088, _2096, _2142);
    float _2146 = -_2096;
    float _2148 = fma(_2088, _2114, _2146);
    float _2150 = _2048 * _2108;
    float _2152 = fma(_2112, _2094, _2136);
    float _2154 = fma(_2144, _2120, _2140);
    float _2156 = fma(_2148, _2094, _2150);
    float _2158 = fma(_2110, _2120, _2152);
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2138, _2120, _2156);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2168 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2174);
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _1078 + _2178;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2188 = _1066 + _2182;
    float _2190 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2184 + _2192;
    float _2196 = 1.0 / _2186;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2200 = _2188 + _2198;
    float _2202 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2190);
    float _2204 = _2194 * _2194;
    float _2206 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2202);
    float _2208 = fma(_2200, _2200, _2204);
    float _2210 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2212 = sqrt(_2208);
    float _2214 = _2210 + _2186;
    float _2216 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _2214 * _2196;
    float _2220 = _2218 * 0.5;
    float _2222 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    bool _2230 = _2212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2232 = 1.0 / _2226;
    float _2234 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2236 = _1060 + _2234;
    float _2238 = _2154;
    float _2240 = _2234;
    float _2242 = _2214;
    float _2244 = _2212;
    float _2246 = _2184;
    if (!_2230)
    {
        _2238 = _2188;
    }
    float _2248 = _2238;
    float _2250 = _2248;
    if (!_2230)
    {
        _2240 = _2184;
    }
    float _2252 = _2240;
    float _2254 = _2252;
    if (!_2230)
    {
        _2242 = _2236;
    }
    float _2256 = _2242;
    bool _2258 = !_2230;
    float _2260 = _2256;
    if (!_2258)
    {
        float _2262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2266 = _2212 + _2264;
        float _2268 = rsqrt(_2208);
        float _2270 = _2266 * _2262;
        float _2272 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = _2270 * 0.15915493667125701904296875;
        float _2276 = _2274 * 6.283185482025146484375;
        float _2278 = sin(_2276);
        float _2280 = _2274 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = fma(_2278, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2286 = _2268 * _2284;
        float _2288 = _2282 + (-1.0);
        float _2290 = fma(_2200, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = fma(_2194, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2294 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = fma(_2236, _2282, _2294);
        _2250 = _2290;
        _2260 = _2296;
        _2254 = _2292;
        _2244 = _2294;
    }
    float _2298 = _2250;
    float _2300 = _2260;
    float _2302 = _2254;
    float _2304 = _2244;
    float _2306 = -_1948;
    float _2308 = _2306 + _2298;
    float _2310 = -_1950;
    float _2312 = _2310 + _2300;
    float _2314 = -_1956;
    float _2316 = _2314 + _2302;
    float _2318 = _2304;
    float _2320 = _2312;
    float _2322 = _2308;
    float _2324 = _2316;
    float _2326 = _2302;
    if (_2130)
    {
        _2318 = 1.0;
    }
    float _2328 = _2318;
    float _2330 = _2328;
    if (!_2106)
    {
        float _2332 = _1964 * _1964;
        float _2334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2336 = -_1078;
        float _2338 = _2336 + _2302;
        float _2340 = -_1066;
        float _2342 = _2340 + _2298;
        float _2344 = fma(_1972, _1972, _2332);
        float _2346 = -_1060;
        float _2348 = _2346 + _2300;
        float _2350 = fma(_1982, _1982, _2344);
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2354 = sqrt(_2350);
        float _2356 = 1.0 / _2072;
        float _2358 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2360 = precise::min(_2354, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2362 = _2360 * _2334;
        float _2364 = _2362 * _2356;
        float _2366 = _2358 * _2364;
        float _2368 = _2338 * _2364;
        float _2370 = fma(_2342, _2366, _1960);
        float _2372 = fma(_2348, _2366, _1954);
        float _2374 = fma(_2358, _2368, _1968);
        _2038 = _2354;
        _2320 = _2372;
        _2322 = _2370;
        _2324 = _2374;
        _2326 = _2348;
    }
    float _2376 = _2038;
    float _2378 = _2320;
    float _2380 = _2322;
    float _2382 = _2324;
    float _2384 = _2326;
    float _2386 = _2376;
    float _2388 = _2384;
    if (_2130)
    {
        _2040 = 1.0;
    }
    float _2390 = _2040;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2394 = _2232 * _2392;
    float _2396 = _2390;
    if (!_2130)
    {
        float _2398 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2398 * 0.15915493667125701904296875;
        float _2402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2404 = _2400 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        float _2408 = _2402 * 0.15915493667125701904296875;
        float _2410 = _2400 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = 1.0 / _2406;
        float _2416 = _2408 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        float _2420 = _2412 * _2414;
        float _2422 = _2408 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2426;
        float _2430 = _2418 * _2420;
        float _2432 = 1.0 / _2428;
        float _2434 = 1.0 / _2430;
        float _2436 = _2424 * _2434;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = fma(_2394, _2436, _2438);
        float _2442 = _2440 * _2432;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        _2386 = _2400;
        _2330 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2330;
    float _2450 = _2446;
    if (!_2130)
    {
        float _2452 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2458 = _2454 * 6.283185482025146484375;
        float _2460 = cos(_2458);
        float _2462 = _2456 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2460;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2494 = fma(_2394, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        float _2500 = -_2498;
        float _2502 = _2500 + 1.0;
        _2450 = _2460;
        _2396 = _2502;
    }
    float _2504 = _2450;
    float _2506 = _2396;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2510 = _2378 + _2508;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2514 = _2380 + _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2518 = _2382 + _2516;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2522 = _2510 * _2510;
    float _2524 = fma(_2514, _2514, _2522);
    float _2526 = fma(_2518, _2518, _2524);
    float _2528 = rsqrt(_2526);
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2532 = _2514 * _2530;
    float _2534 = _2518 * _2530;
    float _2536 = _2532 * _2532;
    float _2538 = _2534 * _2534;
    float _2540 = _2536 + _2538;
    float _2542 = sqrt(_2540);
    bool _2544 = _2542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2542 + _2546;
    float _2550 = _2518;
    float _2552 = _2522;
    float _2554 = _2548;
    float _2556 = _2510;
    float _2558 = _2532;
    if (_2544)
    {
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (_2544)
    {
        float _2564 = rsqrt(_2540);
        _2552 = _2564;
    }
    float _2566 = _2552;
    float _2568 = _2566;
    if (_2544)
    {
        float _2570 = _2548 * _2562;
        _2554 = _2570;
    }
    float _2572 = _2554;
    if (_2544)
    {
        float _2574 = _2572 * 0.15915493667125701904296875;
        _2388 = _2574;
    }
    float _2576 = _2388;
    float _2578 = _2504;
    if (_2544)
    {
        float _2580 = _2576 * 6.283185482025146484375;
        float _2582 = sin(_2580);
        _2578 = _2582;
    }
    float _2584 = _2578;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2588 = precise::max(0.0, _2586);
    float _2590 = _2528;
    float _2592 = _2588;
    float _2594 = _2586;
    if (_2544)
    {
        float _2596 = _2576 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        _2590 = _2598;
    }
    float _2600 = _2590;
    float _2602 = -_2530;
    float _2604 = -_2588;
    float _2606 = fma(_2510, _2602, _2604);
    if (_2544)
    {
        float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2592 = _2608;
    }
    float _2610 = _2592;
    float _2612 = _2610;
    if (_2544)
    {
        float _2614 = fma(_2584, _2610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2616;
    if (!_2544)
    {
        _2612 = _2606;
    }
    float _2620 = _2612;
    float _2622 = sqrt(_2526);
    float _2624 = _2620;
    float _2626 = _2600;
    if (_2544)
    {
        float _2628 = _2600 + (-1.0);
        _2594 = _2628;
    }
    float _2630 = _2594;
    float _2632 = _2630;
    if (_2544)
    {
        float _2634 = _2566 * _2616;
        _2246 = _2634;
    }
    float _2636 = _2246;
    if (!_2544)
    {
        _2618 = _2534;
    }
    float _2638 = _2618;
    float _2640 = _2638;
    if (_2544)
    {
        float _2642 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2642;
    }
    float _2644 = _2568;
    if (_2544)
    {
        float _2646 = _2532 * _2636;
        _2558 = _2646;
    }
    float _2648 = _2558;
    if (!_2544)
    {
        _2632 = _2536;
    }
    float _2650 = _2632;
    float _2652 = _2650;
    if (_2544)
    {
        float _2654 = _2534 * _2636;
        _2640 = _2654;
    }
    float _2656 = _2640;
    if (_2544)
    {
        float _2658 = fma(_2606, _2600, _2644);
        _2624 = _2658;
    }
    float _2660 = _2624;
    if (_2544)
    {
        float _2662 = _2648 * _2648;
        _2652 = _2662;
    }
    float _2664 = _2652;
    if (!_2544)
    {
        _2626 = _2538;
    }
    float _2666 = _2626;
    float _2668 = _2666;
    if (_2544)
    {
        float _2670 = _2656 * _2656;
        _2668 = _2670;
    }
    float _2672 = _2668;
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2678 = _2674 + _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2682 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2680);
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2676);
    float _2688 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2690 = rsqrt(_2678);
    float _2692 = -_2684;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2686);
    float _2698 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2700 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2688);
    float _2702 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2704 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2706 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2698);
    float _2708 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2700);
    float _2710 = abs(_2694);
    float _2712 = log2(_2710);
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2716 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2702);
    float _2718 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2706);
    float _2720 = _2708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2722 = -_2714;
    float _2724 = fma(_2722, _2520, 1.0);
    float _2726 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2716);
    float _2728 = _2690 * _2648;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2732 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2734 = _2690 * _2660;
    float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2738 = _2690 * _2656;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2732);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2744 = -_2736;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2744);
    float _2748 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2740);
    float _2752 = log2(_2724);
    float _2754 = -_2738;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2746);
    float _2758 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2760 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2750);
    float _2762 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2764 = fma(_2756, -0.5, 0.5);
    float _2766 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2758);
    float _2768 = fma(_2756, 0.5, 0.5);
    float _2770 = exp2(_2748);
    float _2772 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2762);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2766);
    float _2776 = _2734 + 1.0;
    float _2778 = fma(_2768, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2780 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2782 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2774);
    float _2784 = 1.0 / _2760;
    float _2786 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2780);
    float _2788 = fma(_2768, _2778, -0.212114393711090087890625);
    float _2790 = _2752 * 0.693147182464599609375;
    float _2792 = fma(_2768, _2788, 1.570728778839111328125);
    float _2794 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2796 = sqrt(_2764);
    float _2798 = -_2734;
    float _2800 = fma(_2770, _2776, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float _2804 = _2782 * _2784;
    float _2806 = _2786 * _2784;
    float _2808 = fma(_2804, 0.5, 0.5);
    float _2810 = fma(_2806, -0.5, 0.5);
    float _2812 = _2796 * 0.636619746685028076171875;
    float3 _7099 = float3(_2808, _2810, _2794);
    float _2814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7099, float3(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7099, float3(0.0), isnan(_7099)), level(0.0)).x;
    float3 _7110 = float3(_2808, _2810, _2794);
    float4 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).xyzw;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = _2817.w;
    float _2827 = -_2792;
    float _2829 = fma(_2812, _2827, 1.0);
    float2 _7132 = float2(_2829, _2802);
    float3 _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7132, float2(0.0), isnan(_7132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7132, float2(0.0), isnan(_7132)), level(0.0)).xyz;
    float _2835 = _2833.x;
    float _2837 = _2833.y;
    float _2839 = _2833.z;
    float _2841 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2843 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = _2448 * _2506;
    bool _2847 = _2448 > 0.0;
    bool _2849 = isnan(_2448);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan(0.0);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2859 = exp2(_2841);
    float _2861 = _2845 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2863 = _2506 <= 0.0;
    bool _2865 = !_2855;
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2857);
    float _2871 = _2760 * 0.5;
    float _2873 = _2861 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = _2782 + _2760;
    float _2877 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2879 = fma(_2786, -0.5, _2871);
    float _2881 = _2875 * 0.5;
    float _2883 = _2877 + _2760;
    out.m_45.x = _2873;
    float _2885 = _2883 * 0.5;
    float _2887 = -_2859;
    float _2889 = _2887 + 1.0;
    out.gl_Position.x = _2782;
    out.gl_Position.y = _2786;
    out.gl_Position.z = _2877;
    out.gl_Position.w = _2760;
    float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2881;
    out.m_68.y = _2879;
    out.m_68.z = _2885;
    out.m_68.w = _2760;
    float _2893 = -_2891;
    float _2895 = _2893 + 1.0;
    float _2897 = _2891 * _2814;
    float _2899 = _2825 * _2897;
    float _2901 = _2825 * _2895;
    float _2903 = _2839 * _2897;
    float _2905 = fma(_2835, _2899, _2819);
    float _2907 = fma(_2837, _2899, _2821);
    float _2909 = fma(_2825, _2903, _2823);
    out.m_70.x = _2905;
    out.m_70.y = _2907;
    out.m_70.z = _2909;
    out.m_70.w = _2901;
    if (!_2867)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2911 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2911;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _571 = false;
    bool _417 = false;
    bool _307 = false;
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
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_45.x = 0.0;
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
        float _2970 = as_type<float>(_107);
        out.gl_Position.z = _2970;
    }
    if (!_93)
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
        float _131 = float(_89);
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
        float _3039 = as_type<float>(_145);
        out.gl_Position.z = _3039;
    }
    if (_139)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
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
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _315 + _317;
    float _321 = in.m_52.x;
    float _323 = in.m_52.y;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = 1.0 / _339;
    float _345 = -_335;
    float _347 = _345 + 1.0;
    float _349 = _319 * _343;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _347;
    float _373 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_369, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = -_361;
    float _379 = _377 + 1.0;
    float _381 = _373 * _371;
    float _383 = _375 * _371;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _389 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _391 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _387);
    float _393 = _389 * _321;
    float _395 = _391 * _323;
    bool _397 = !_341;
    float _415;
    if (!_397)
    {
        float _399 = in.m_54.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_89);
        float _421 = 1.0 / _419;
        float _423 = _125 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _429;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _461;
    float _465 = -_441;
    float _467 = _465 + 1.0;
    bool _469 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_425);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _483 = _457 * _467;
    float _485 = -_457;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _445;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _463 * _459;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _425 + _497;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _425 + _507;
    float _511 = _441 * _503;
    float _513 = _493 * _489;
    float _515 = _505 * _483;
    float _517 = fma(_513, _509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _519 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _523 = fma(_517, _511, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _527;
    out.m_56.y = _533;
    out.m_56.z = _535;
    out.m_56.w = _537;
    bool _539 = !_481;
    float _541 = _525;
    float _565;
    float _567;
    float _569;
    if (!_539)
    {
        float _543 = in.m_54.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _553 = _125 * _549;
        float _555 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _557 = _555 * _545;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _553;
        _97 = _557;
        _567 = _547;
        _541 = _543;
        _569 = _563;
        _571 = true;
    }
    else
    {
        float _573 = float(_89);
        float _575 = 1.0 / _573;
        float _577 = _125 * _575;
        _565 = _577;
        _567 = _573;
        _569 = _577;
    }
    _571 = false;
    float _579 = _565;
    float _581 = _97;
    float _583 = _567;
    float _585 = _541;
    float _587 = _569;
    float _589 = in.m_54.x;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _593 = int(_591);
    float _595 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = in.m_54.w;
    float _603 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _607 = _605 != 0;
    float _609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _611 = int(_609);
    float _613 = in.m_54.z;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _617 = _579 + _615;
    bool _619 = !_607;
    int _621 = _619 ? 0 : 1;
    float _623 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _625;
    float _629 = _581;
    float _631 = _595;
    float _633 = _585;
    if (!_599)
    {
        float _635 = in.m_54.y;
        _629 = _635;
    }
    float _637 = _629;
    float _639 = float(uint(_593));
    float _641 = 1.0 / _583;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _647 = _589 * 2.0;
    float _649 = float(_611);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _655 = 1.0 / _639;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _661 = _601 > 0.5;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _667 = -_199;
    int _669 = _661 ? as_type<int>(_667) : as_type<int>(_199);
    float _671 = 1.0 / _649;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _677 = as_type<float>(_593);
    if (!_599)
    {
        _631 = _613;
    }
    float _679 = _631;
    float _681 = _679;
    if (!_599)
    {
        _633 = _637;
    }
    float _683 = _633;
    float _685 = floor(_647);
    bool _687 = !_599;
    float _689 = _687 ? 1.2345600128173828125 : 1.0;
    float _691 = _683;
    float _693 = _637;
    if (_599)
    {
        float _695 = in.m_54.x;
        float _697 = in.m_54.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = _671 * _125;
    float _705 = 1.0 / _627;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _707;
    bool _711 = _685 > 0.0;
    float _713 = trunc(_703);
    int _715 = int(_713);
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _731;
    int _735 = _725 ? 0 : 1;
    float _737 = 1.0 / _645;
    int _739 = ~_735;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _701 * 2.0;
    int _747 = _743;
    if (!_711)
    {
        int _749 = ~_735;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _761 = _759 != 0;
    float _763 = floor(_745);
    float _765 = float(uint(_715));
    if (_599)
    {
        _681 = _701;
    }
    float _767 = _681;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _775 = _773 != 0;
    bool _777 = !_761;
    int _779 = _777 ? 0 : 1;
    float _781 = 1.0 / _653;
    int _783 = as_type<int>(_655) + (-2);
    float _785 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _787 = _613 > 0.5;
    bool _789 = !_757;
    int _791 = _789 ? 0 : 1;
    float _793 = as_type<float>(_783) * _765;
    float _795 = -_195;
    int _797 = _787 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    bool _801 = _589 > 0.5;
    float _803 = 1.0 / _659;
    bool _805 = _763 >= 0.0;
    bool _807 = isnan(_763);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = !_771;
    int _817 = _815 ? 0 : 1;
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = -_195;
    int _825 = _801 ? as_type<int>(_823) : as_type<int>(_195);
    float _827 = trunc(_793);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _848 = _846 != 0;
    float _850 = 1.0 / _665;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _854 = _852 != 0;
    float _856 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _858 = _813 ? 0 : 1;
    float _860 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    bool _862 = _763 > 0.0;
    float _864 = 1.0 / _675;
    int _866 = ~_593;
    int _868 = _866 + 1;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _874 = ~_858;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = as_type<float>(_868);
    int _882 = _878;
    if (!_599)
    {
        _880 = _613;
    }
    float _884 = _880;
    float _886 = 1.0 / _872;
    float _888 = _884;
    if (_599)
    {
        _888 = _701;
    }
    float _890 = _888;
    int _892 = _868 * int(_832);
    int _894 = _892 + _715;
    bool _896 = !_599;
    float _898 = _896 ? _701 : _589;
    if (!_862)
    {
        int _900 = ~_858;
        int _902 = _900 + 1;
        _882 = _902;
    }
    int _904 = _882;
    float _906 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _908 = !_836;
    float _910 = _908 ? _195 : as_type<float>(_797);
    float _912 = _689 * _898;
    float _914 = float(uint(_894));
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = _587 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _938 = as_type<float>(_783) * _914;
    float _940 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _860);
    float _942 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _603);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _944;
    float _948 = trunc(_938);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = _918 * _705;
    float _956 = _946 * _737;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _970 = !_922;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _936;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _976;
    float _980 = _960 * _781;
    float _982 = _968 * _803;
    float _984 = _964 * _864;
    float _986 = _978 * _850;
    float _988 = _613 * 2.0;
    int _990 = ~_593;
    int _992 = _990 + 1;
    float _994 = floor(_912);
    int _996 = int(_832) + int(_952);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1002 = fma(_982, _617, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1004 = float(_593);
    float _1006 = _1000 * _886;
    int _1008 = abs(_791);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1010;
    float _1014 = floor(_988);
    float _1016 = _1004 * _125;
    int _1018 = _992 * _996;
    int _1020 = _1018 + _715;
    float _1022 = _1012 * _974;
    float _1024 = float(_715);
    float _1026 = _1016 * _641;
    bool _1028 = !_926;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_994;
    float _1034 = _912 + _1032;
    bool _1036 = _1024 >= _1004;
    bool _1038 = isnan(_1024);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1004);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_729, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1050 = uint(_1020) >= uint(_593);
    float _1052 = trunc(_1026);
    int _1054 = int(_1052);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1058 = _579 + _1056;
    float _1060 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1062 = !_1050;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1068 = _1014 >= 0.0;
    bool _1070 = isnan(_1014);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1080 = ~_996;
    int _1082 = _1080 + _1064;
    int _1084 = _1082 + 1;
    float _1086 = trunc(_1046);
    int _1088 = int(_1086);
    bool _1090 = _1014 > 0.0;
    float _1092 = fma(_709, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1004 * _1034;
    int _1096 = _593 * _1084;
    int _1098 = _1096 + _715;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1102 = _579 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1106 = _579 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1110 = _579 + _1108;
    float _1112 = trunc(_1094);
    int _1114 = int(_1112);
    int _1116 = _1076 ? 0 : 1;
    float _1118 = fma(_980, _1102, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1120 = _593 == 0;
    float _1122 = fma(_956, _1106, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _1124 = abs(_621);
    float _1126 = fma(_984, _1110, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1128 = !_1120;
    int _1130 = _1128 ? _1098 : (-1);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _579 + _1132;
    int _1136 = ~_1088;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    float _1142 = fma(_733, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1144 = _593 + (-1);
    int _1146 = abs(_779);
    int _1148 = _1140 * _1130;
    float _1150 = fma(_986, _1134, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1152 = abs(_817);
    int _1154 = _1114 * _1124;
    int _1156 = _1154 + _715;
    int _1158 = _1088 * _1144;
    int _1160 = _1158 + _1148;
    bool _1162 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1164 = isnan(_579);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    int _1174 = _1160 * _1146;
    int _1176 = abs(_821);
    bool _1178 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1180 = isnan(_579);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    int _1190 = _1054 * _1008;
    int _1192 = _1190 + _1174;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    bool _1198 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1200 = isnan(_579);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = _1156 * _1152;
    int _1212 = _1210 + _1192;
    float _1214 = _1188 * _1196;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    bool _1220 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1222 = isnan(_579);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    int _1232 = _1114 * _1176;
    int _1234 = _1232 + _1212;
    float _1236 = -_1208;
    float _1238 = _1236 + 1.0;
    float _1240 = _1208 * _1218;
    bool _1242 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1244 = isnan(_579);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -_1230;
    float _1256 = _1254 + 1.0;
    float _1258 = float(uint(_1234));
    float _1260 = _1230 * _1238;
    bool _1262 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1264 = isnan(_579);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    bool _1274 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1276 = isnan(_587);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = as_type<float>(_783) * _1258;
    bool _1288 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1290 = isnan(_587);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1252 * _1256;
    float _1302 = -_1252;
    float _1304 = _1302 + 1.0;
    bool _1306 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1308 = isnan(_579);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1272;
    float _1320 = _1318 + 1.0;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    bool _1328 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1330 = isnan(_579);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1342 = _579 + _1340;
    float _1344 = -_1284;
    float _1346 = _1344 + 1.0;
    int _1348 = ~_593;
    int _1350 = _1348 + 1;
    float _1352 = _1272 * _1304;
    float _1354 = _1316 * _1320;
    float _1356 = -_1316;
    float _1358 = _1356 + 1.0;
    float _1360 = _1298 * _1346;
    float _1362 = fma(_1022, _1058, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1364 = -_1298;
    float _1366 = _1364 + 1.0;
    float _1368 = _1142 * _1360;
    float _1370 = _1092 * _1360;
    float _1372 = _1338 * _1358;
    float _1374 = -_1338;
    float _1376 = _1374 + 1.0;
    int _1378 = _1350 * int(_1326);
    int _1380 = _1378 + _1234;
    float _1382 = _1048 * _1360;
    float _1384 = _1122 * _1372;
    float _1386 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1388 = float(uint(_1380));
    float _1390 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1382);
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1396 = _699 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1398 = as_type<float>(_783) * _1388;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1384);
    float _1402 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1394);
    int _1404 = ~_1116;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1006, _1342, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1414 = _1408;
    if (!_1090)
    {
        int _1416 = ~_1116;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc(_1398);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1390);
    float _1430 = -_1412;
    float _1432 = fma(_1396, 2.0, _1430);
    float _1434 = fma(_1118, _1354, _1400);
    float _1436 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1386);
    float _1438 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1392);
    float _1440 = _613 + _701;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _910 + 0.5;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1450 = ~_593;
    int _1452 = _1450 + 1;
    float _1454 = _1440 + (-1.0);
    float _1456 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    float _1458 = _589 + _701;
    int _1460 = int(_1326) + int(_1426);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1464 = _1458 + (-1.0);
    float _1466 = -_125;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1432);
    int _1470 = _1452 * _1460;
    int _1472 = _1470 + _1234;
    float _1474 = fma(_906, -2.0, _1462);
    float _1476 = _1444 * _125;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1482 = !_840;
    float _1484 = _1482 ? _199 : as_type<float>(_669);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1468);
    float _1488 = exp2(_1476);
    bool _1490 = uint(_1472) >= uint(_593);
    float _1492 = fma(_1126, _1352, _1434);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1496 = 1.0 + _1494;
    int _1498 = abs(_1030);
    float _1500 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1402);
    float _1502 = float(uint(_1156));
    float _1504 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    int _1506 = abs(_972);
    float _1508 = 1.0 / _1496;
    bool _1510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1512 = isnan(1.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1518 = _1514 || _1516;
    float _1520 = as_type<float>(_783) * _1502;
    float _1522 = float(_753);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1060 + _1524;
    float _1528 = float(_1506);
    float _1530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1474);
    float _1532 = float(_1420);
    float _1534 = -_1488;
    float _1536 = _1534 + 1.0;
    bool _1538 = !_1490;
    int _1540 = _1538 ? 0 : (-1);
    float _1542 = trunc(_1520);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1528 * _1532;
    int _1560 = ~_1460;
    int _1562 = _1560 + _1540;
    int _1564 = _1562 + 1;
    float _1566 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1568 = _1556 ? _1536 : 0.0;
    float _1570 = _1558 * (-2.0);
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1574 = _1066 + _1572;
    int _1576 = ~_593;
    int _1578 = _1576 + 1;
    if (_1518)
    {
        float _1580 = _1568 * _1508;
        _129 = _1580;
    }
    float _1582 = _129;
    int _1584 = _593 * _1564;
    int _1586 = _1584 + _1234;
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1566);
    float _1590 = fma(_1002, _1300, _1492);
    float _1592 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1594 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1596 = !_1120;
    int _1598 = _1596 ? _1586 : (-1);
    int _1600 = _1578 * int(_1546);
    int _1602 = _1600 + _1156;
    bool _1604 = !_848;
    float _1606 = _1604 ? _195 : as_type<float>(_825);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1078 + _1608;
    int _1612 = _1598 >> 31;
    float _1614 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = float(uint(_1602));
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1588);
    int _1620 = _1612 & 3;
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = float(_1498);
    float _1626 = as_type<float>(_783) * _1616;
    int _1628 = _1598 + _1620;
    float _1630 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1632 = _701 > 0.5;
    float _1634 = _1624 * _1522;
    int _1636 = _1628 >> 2;
    float _1638 = trunc(_1626);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = _1484 + (-0.5);
    float _1652 = -_199;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_199);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1658 = uint(int(uint(_1648) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    int _1674 = _1598 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_1150, _1260, _1590);
    bool _1680 = _1618 >= 0.0;
    float _1682 = in.m_58.x;
    float _1684 = in.m_58.y;
    float _1686 = in.m_58.z;
    int _1688 = ~_593;
    int _1690 = _1688 + 1;
    float _1692 = -_1650;
    float _1694 = -_1530;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1676 ? 0 : 1;
    int _1700 = _1648 + 8;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    bool _1718 = uint(_1674) > 1u;
    out.m_60.x = _1622;
    out.m_60.y = _1630;
    out.m_60.z = _1644;
    out.m_60.w = _1656;
    int _1720 = int(_1546) + int(_1642);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1724 = fma(_1478, _1570, _1478);
    int _1726 = ~_1698;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    float _1732 = _1606 + 0.5;
    float _1734 = fma(_1410, _1240, _1678);
    int _1736 = _1730;
    if (_1680)
    {
        out.m_45.x = 0.0;
    }
    float _1738 = fma(_1362, _1214, _1734);
    if (!_1718)
    {
        int _1740 = ~_1698;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1748 = !_854;
    float _1750 = _1748 ? _199 : as_type<float>(_1654);
    float _1752 = -_1504;
    float _1754 = _1752 + 1.0;
    bool _1756 = _1674 != 3;
    int _1758 = _1690 * _1720;
    int _1760 = _1758 + _1156;
    bool _1762 = uint(_1674) >= 2u;
    float _1764 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1766 = -_1750;
    float _1768 = _1766 + 0.5;
    float _1770 = fma(_1484, _1754, _1696);
    bool _1772 = uint(_1760) >= uint(_593);
    float _1774 = -_1500;
    float _1776 = _1774 + 1.0;
    float _1778 = _1634 * (-2.0);
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1782 = abs(_1744);
    float _1784 = -_1776;
    float _1786 = fma(_910, _1784, _1486);
    int _1788 = _1762 ? 0 : 1;
    float _1790 = fma(_1480, _1778, _1480);
    int _1792 = _1598 & 3;
    bool _1794 = _1792 != 0;
    float _1796 = fma(_1778, _1684, _1684);
    float _1798 = _1764 * _1722;
    float _1800 = _1780 * _1746;
    bool _1802 = !_1794;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = fma(_1570, _1682, _1682);
    int _1808 = ~_1788;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1738);
    bool _1816 = _1674 != 3;
    out.m_62.x = _1798;
    out.m_62.y = _1800;
    out.m_62.z = _1786;
    out.m_62.w = _1770;
    int _1818 = _1812;
    if (_1756)
    {
        int _1820 = ~_1788;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = abs(_1804);
    out.m_64.x = _1814;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = !_1772;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = ~_1782;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1826;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1824);
    int _1850 = _1840 * as_type<int>(_1672);
    int _1852 = abs(_1830);
    int _1854 = ~_1848;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * as_type<int>(_1664);
    int _1862 = _1860 + _1850;
    float _1864 = _1526 * _1526;
    bool _1866 = !_844;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = fma(_1574, _1574, _1864);
    int _1872 = ~_1720;
    int _1874 = _1872 + _1834;
    int _1876 = _1874 + 1;
    int _1878 = _1858 * as_type<int>(_1708);
    int _1880 = _1878 + _1862;
    int _1882 = abs(_1868);
    float _1884 = fma(_1610, _1610, _1870);
    int _1886 = ~_1852;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    int _1892 = _593 * _1876;
    int _1894 = _1892 + _1156;
    int _1896 = ~_1882;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1890 * as_type<int>(_1716);
    int _1904 = _1902 + _1880;
    float _1906 = rsqrt(_1884);
    bool _1908 = !_1120;
    int _1910 = _1908 ? _1894 : (-1);
    float _1912 = _589 + (-0.5);
    int _1914 = _1900 * _1904;
    float _1916 = as_type<float>(_1890);
    if (_1680)
    {
        _1916 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1918 = _1916;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1806);
    int _1922 = _1910 * _1882;
    int _1924 = _1922 + _1914;
    bool _1926 = !_930;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = as_type<int>(_1918);
    if (_1680)
    {
        float _1932 = _1918 * 5.0;
        _1930 = as_type<int>(_1932);
    }
    int _1934 = _1930;
    float _1936 = fma(_1724, _1582, _1920);
    float _1938 = _623 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1940 = float(_1924);
    if (_1680)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5730 = as_type<float>(_1934);
        out.gl_Position.z = _5730;
    }
    int _1942 = abs(_1928);
    float _1944 = _1938 * _1906;
    float _1946 = _701 + (-0.5);
    out.m_66.y = _1940;
    float _1948 = _1574 * _1944;
    float _1950 = _1526 * _1944;
    if (_1680)
    {
        return out;
    }
    float _1952 = -_1950;
    float _1954 = _1060 + _1952;
    float _1956 = _1610 * _1944;
    float _1958 = -_1948;
    float _1960 = _1066 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1954 + _1962;
    float _1966 = -_1956;
    float _1968 = _1078 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1960 + _1970;
    float _1974 = -_1950;
    float _1976 = _1526 + _1974;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1982 = _1968 + _1980;
    float _1984 = float(_1942);
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1796);
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1978);
    float _1990 = float(_904);
    float _1992 = -_1948;
    float _1994 = _1574 + _1992;
    float _1996 = _1976 * _1976;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1988);
    float _2000 = fma(_1790, _1582, _1986);
    float _2002 = _589 + _613;
    float _2004 = fma(_1994, _1994, _1996);
    float _2006 = -_1956;
    float _2008 = _1610 + _2006;
    bool _2010 = _1998 >= 0.0;
    float _2012 = _1984 * _1990;
    float _2014 = _2000 * 0.15915493667125701904296875;
    float _2016 = _2002 + (-1.0);
    float _2018 = fma(_2008, _2008, _2004);
    float _2020 = _2012 * (-2.0);
    float _2022 = _1936 * 0.15915493667125701904296875;
    float _2024 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2026 = _2014 * 6.283185482025146484375;
    float _2028 = sin(_2026);
    float _2030 = fma(_2020, _1686, _1686);
    float _2032 = _613 + (-0.5);
    float _2034 = fma(_2024, _2020, _2024);
    int _2036 = as_type<int>(_2030);
    float _2038 = _1972;
    float _2040 = _1954;
    if (_2010)
    {
        _677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _677;
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2030);
    if (_2010)
    {
        out.m_45.x = 0.0;
    }
    float _2046 = _2022 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    if (_2010)
    {
        float _2050 = _2042 * 5.0;
        _2036 = as_type<int>(_2050);
    }
    int _2052 = _2036;
    float _2054 = fma(_2034, _1582, _2044);
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5918 = as_type<float>(_2052);
        out.gl_Position.z = _5918;
    }
    float _2056 = _2054 * 0.15915493667125701904296875;
    float _2058 = _2022 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    float _2062 = sqrt(_2018);
    float _2064 = _2014 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    if (_2010)
    {
        return out;
    }
    float _2068 = _2056 * 6.283185482025146484375;
    float _2070 = cos(_2068);
    float _2072 = _1906 * _2062;
    float _2074 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2080 = _623 * _2072;
    float _2082 = _2072 * _2074;
    float _2084 = _2048 * _2028;
    float _2086 = _2056 * 6.283185482025146484375;
    float _2088 = sin(_2086);
    float _2090 = _2060 * _2066;
    float _2092 = _2076 * _2082;
    float _2094 = _2078 * _2080;
    float _2096 = _2060 * _2028;
    bool _2098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2100 = isnan(0.5);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2106 = _2102 || _2104;
    float _2108 = _2070 * _2092;
    float _2110 = _2028 * _2070;
    float _2112 = _2066 * _2070;
    float _2114 = _2048 * _2066;
    float _2116 = _2060 * _2108;
    float _2118 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2120 = _2118 * 0.5;
    bool _2122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2124 = isnan(0.5);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2130 = _2126 || _2128;
    float _2132 = fma(_2088, _2090, _2084);
    float _2134 = -_2092;
    float _2136 = _2088 * _2134;
    float _2138 = fma(_2088, _2084, _2090);
    float _2140 = fma(_2132, _2094, _2116);
    float _2142 = -_2114;
    float _2144 = fma(_2088, _2096, _2142);
    float _2146 = -_2096;
    float _2148 = fma(_2088, _2114, _2146);
    float _2150 = _2048 * _2108;
    float _2152 = fma(_2112, _2094, _2136);
    float _2154 = fma(_2144, _2120, _2140);
    float _2156 = fma(_2148, _2094, _2150);
    float _2158 = fma(_2110, _2120, _2152);
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2138, _2120, _2156);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2168 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2174);
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _1078 + _2178;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2188 = _1066 + _2182;
    float _2190 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2184 + _2192;
    float _2196 = 1.0 / _2186;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2200 = _2188 + _2198;
    float _2202 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2190);
    float _2204 = _2194 * _2194;
    float _2206 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2202);
    float _2208 = fma(_2200, _2200, _2204);
    float _2210 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2212 = sqrt(_2208);
    float _2214 = _2210 + _2186;
    float _2216 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _2214 * _2196;
    float _2220 = _2218 * 0.5;
    float _2222 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    bool _2230 = _2212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2232 = 1.0 / _2226;
    float _2234 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2236 = _1060 + _2234;
    float _2238 = _2154;
    float _2240 = _2234;
    float _2242 = _2214;
    float _2244 = _2212;
    float _2246 = _2184;
    if (!_2230)
    {
        _2238 = _2188;
    }
    float _2248 = _2238;
    float _2250 = _2248;
    if (!_2230)
    {
        _2240 = _2184;
    }
    float _2252 = _2240;
    float _2254 = _2252;
    if (!_2230)
    {
        _2242 = _2236;
    }
    float _2256 = _2242;
    bool _2258 = !_2230;
    float _2260 = _2256;
    if (!_2258)
    {
        float _2262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2266 = _2212 + _2264;
        float _2268 = rsqrt(_2208);
        float _2270 = _2266 * _2262;
        float _2272 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = _2270 * 0.15915493667125701904296875;
        float _2276 = _2274 * 6.283185482025146484375;
        float _2278 = sin(_2276);
        float _2280 = _2274 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = fma(_2278, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2286 = _2268 * _2284;
        float _2288 = _2282 + (-1.0);
        float _2290 = fma(_2200, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = fma(_2194, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2294 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = fma(_2236, _2282, _2294);
        _2250 = _2290;
        _2260 = _2296;
        _2254 = _2292;
        _2244 = _2294;
    }
    float _2298 = _2250;
    float _2300 = _2260;
    float _2302 = _2254;
    float _2304 = _2244;
    float _2306 = -_1948;
    float _2308 = _2306 + _2298;
    float _2310 = -_1950;
    float _2312 = _2310 + _2300;
    float _2314 = -_1956;
    float _2316 = _2314 + _2302;
    float _2318 = _2304;
    float _2320 = _2312;
    float _2322 = _2308;
    float _2324 = _2316;
    float _2326 = _2302;
    if (_2130)
    {
        _2318 = 1.0;
    }
    float _2328 = _2318;
    float _2330 = _2328;
    if (!_2106)
    {
        float _2332 = _1964 * _1964;
        float _2334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2336 = -_1078;
        float _2338 = _2336 + _2302;
        float _2340 = -_1066;
        float _2342 = _2340 + _2298;
        float _2344 = fma(_1972, _1972, _2332);
        float _2346 = -_1060;
        float _2348 = _2346 + _2300;
        float _2350 = fma(_1982, _1982, _2344);
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2354 = sqrt(_2350);
        float _2356 = 1.0 / _2072;
        float _2358 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2360 = precise::min(_2354, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2362 = _2360 * _2334;
        float _2364 = _2362 * _2356;
        float _2366 = _2358 * _2364;
        float _2368 = _2338 * _2364;
        float _2370 = fma(_2342, _2366, _1960);
        float _2372 = fma(_2348, _2366, _1954);
        float _2374 = fma(_2358, _2368, _1968);
        _2038 = _2354;
        _2320 = _2372;
        _2322 = _2370;
        _2324 = _2374;
        _2326 = _2348;
    }
    float _2376 = _2038;
    float _2378 = _2320;
    float _2380 = _2322;
    float _2382 = _2324;
    float _2384 = _2326;
    float _2386 = _2376;
    float _2388 = _2384;
    if (_2130)
    {
        _2040 = 1.0;
    }
    float _2390 = _2040;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2394 = _2232 * _2392;
    float _2396 = _2390;
    if (!_2130)
    {
        float _2398 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2398 * 0.15915493667125701904296875;
        float _2402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2404 = _2400 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        float _2408 = _2402 * 0.15915493667125701904296875;
        float _2410 = _2400 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = 1.0 / _2406;
        float _2416 = _2408 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        float _2420 = _2412 * _2414;
        float _2422 = _2408 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2426;
        float _2430 = _2418 * _2420;
        float _2432 = 1.0 / _2428;
        float _2434 = 1.0 / _2430;
        float _2436 = _2424 * _2434;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = fma(_2394, _2436, _2438);
        float _2442 = _2440 * _2432;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        _2386 = _2400;
        _2330 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2330;
    float _2450 = _2446;
    if (!_2130)
    {
        float _2452 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2458 = _2454 * 6.283185482025146484375;
        float _2460 = cos(_2458);
        float _2462 = _2456 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2460;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2494 = fma(_2394, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        float _2500 = -_2498;
        float _2502 = _2500 + 1.0;
        _2450 = _2460;
        _2396 = _2502;
    }
    float _2504 = _2450;
    float _2506 = _2396;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2510 = _2378 + _2508;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2514 = _2380 + _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2518 = _2382 + _2516;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2522 = _2510 * _2510;
    float _2524 = fma(_2514, _2514, _2522);
    float _2526 = fma(_2518, _2518, _2524);
    float _2528 = rsqrt(_2526);
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2532 = _2514 * _2530;
    float _2534 = _2518 * _2530;
    float _2536 = _2532 * _2532;
    float _2538 = _2534 * _2534;
    float _2540 = _2536 + _2538;
    float _2542 = sqrt(_2540);
    bool _2544 = _2542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2542 + _2546;
    float _2550 = _2518;
    float _2552 = _2522;
    float _2554 = _2548;
    float _2556 = _2510;
    float _2558 = _2532;
    if (_2544)
    {
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (_2544)
    {
        float _2564 = rsqrt(_2540);
        _2552 = _2564;
    }
    float _2566 = _2552;
    float _2568 = _2566;
    if (_2544)
    {
        float _2570 = _2548 * _2562;
        _2554 = _2570;
    }
    float _2572 = _2554;
    if (_2544)
    {
        float _2574 = _2572 * 0.15915493667125701904296875;
        _2388 = _2574;
    }
    float _2576 = _2388;
    float _2578 = _2504;
    if (_2544)
    {
        float _2580 = _2576 * 6.283185482025146484375;
        float _2582 = sin(_2580);
        _2578 = _2582;
    }
    float _2584 = _2578;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2588 = precise::max(0.0, _2586);
    float _2590 = _2528;
    float _2592 = _2588;
    float _2594 = _2586;
    if (_2544)
    {
        float _2596 = _2576 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        _2590 = _2598;
    }
    float _2600 = _2590;
    float _2602 = -_2530;
    float _2604 = -_2588;
    float _2606 = fma(_2510, _2602, _2604);
    if (_2544)
    {
        float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2592 = _2608;
    }
    float _2610 = _2592;
    float _2612 = _2610;
    if (_2544)
    {
        float _2614 = fma(_2584, _2610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2616;
    if (!_2544)
    {
        _2612 = _2606;
    }
    float _2620 = _2612;
    float _2622 = sqrt(_2526);
    float _2624 = _2620;
    float _2626 = _2600;
    if (_2544)
    {
        float _2628 = _2600 + (-1.0);
        _2594 = _2628;
    }
    float _2630 = _2594;
    float _2632 = _2630;
    if (_2544)
    {
        float _2634 = _2566 * _2616;
        _2246 = _2634;
    }
    float _2636 = _2246;
    if (!_2544)
    {
        _2618 = _2534;
    }
    float _2638 = _2618;
    float _2640 = _2638;
    if (_2544)
    {
        float _2642 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2642;
    }
    float _2644 = _2568;
    if (_2544)
    {
        float _2646 = _2532 * _2636;
        _2558 = _2646;
    }
    float _2648 = _2558;
    if (!_2544)
    {
        _2632 = _2536;
    }
    float _2650 = _2632;
    float _2652 = _2650;
    if (_2544)
    {
        float _2654 = _2534 * _2636;
        _2640 = _2654;
    }
    float _2656 = _2640;
    if (_2544)
    {
        float _2658 = fma(_2606, _2600, _2644);
        _2624 = _2658;
    }
    float _2660 = _2624;
    if (_2544)
    {
        float _2662 = _2648 * _2648;
        _2652 = _2662;
    }
    float _2664 = _2652;
    if (!_2544)
    {
        _2626 = _2538;
    }
    float _2666 = _2626;
    float _2668 = _2666;
    if (_2544)
    {
        float _2670 = _2656 * _2656;
        _2668 = _2670;
    }
    float _2672 = _2668;
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2678 = _2674 + _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2682 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2680);
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2676);
    float _2688 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2690 = rsqrt(_2678);
    float _2692 = -_2684;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2686);
    float _2698 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2700 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2688);
    float _2702 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2704 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2706 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2698);
    float _2708 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2700);
    float _2710 = abs(_2694);
    float _2712 = log2(_2710);
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2716 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2702);
    float _2718 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2706);
    float _2720 = _2708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2722 = -_2714;
    float _2724 = fma(_2722, _2520, 1.0);
    float _2726 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2716);
    float _2728 = _2690 * _2648;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2732 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2734 = _2690 * _2660;
    float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2738 = _2690 * _2656;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2732);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2744 = -_2736;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2744);
    float _2748 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2740);
    float _2752 = log2(_2724);
    float _2754 = -_2738;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2746);
    float _2758 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2760 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2750);
    float _2762 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2764 = fma(_2756, -0.5, 0.5);
    float _2766 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2758);
    float _2768 = fma(_2756, 0.5, 0.5);
    float _2770 = exp2(_2748);
    float _2772 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2762);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2766);
    float _2776 = _2734 + 1.0;
    float _2778 = fma(_2768, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2780 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2782 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2774);
    float _2784 = 1.0 / _2760;
    float _2786 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2780);
    float _2788 = fma(_2768, _2778, -0.212114393711090087890625);
    float _2790 = _2752 * 0.693147182464599609375;
    float _2792 = fma(_2768, _2788, 1.570728778839111328125);
    float _2794 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2796 = sqrt(_2764);
    float _2798 = -_2734;
    float _2800 = fma(_2770, _2776, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float _2804 = _2782 * _2784;
    float _2806 = _2786 * _2784;
    float _2808 = fma(_2804, 0.5, 0.5);
    float _2810 = fma(_2806, -0.5, 0.5);
    float _2812 = _2796 * 0.636619746685028076171875;
    float3 _7099 = float3(_2808, _2810, _2794);
    float _2814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7099, float3(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7099, float3(0.0), isnan(_7099)), level(0.0)).x;
    float3 _7110 = float3(_2808, _2810, _2794);
    float4 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).xyzw;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = _2817.w;
    float _2827 = -_2792;
    float _2829 = fma(_2812, _2827, 1.0);
    float2 _7132 = float2(_2829, _2802);
    float3 _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7132, float2(0.0), isnan(_7132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7132, float2(0.0), isnan(_7132)), level(0.0)).xyz;
    float _2835 = _2833.x;
    float _2837 = _2833.y;
    float _2839 = _2833.z;
    float _2841 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2843 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = _2448 * _2506;
    bool _2847 = _2448 > 0.0;
    bool _2849 = isnan(_2448);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan(0.0);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2859 = exp2(_2841);
    float _2861 = _2845 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2863 = _2506 <= 0.0;
    bool _2865 = !_2855;
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2857);
    float _2871 = _2760 * 0.5;
    float _2873 = _2861 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = _2782 + _2760;
    float _2877 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2879 = fma(_2786, -0.5, _2871);
    float _2881 = _2875 * 0.5;
    float _2883 = _2877 + _2760;
    out.m_45.x = _2873;
    float _2885 = _2883 * 0.5;
    float _2887 = -_2859;
    float _2889 = _2887 + 1.0;
    out.gl_Position.x = _2782;
    out.gl_Position.y = _2786;
    out.gl_Position.z = _2877;
    out.gl_Position.w = _2760;
    float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2881;
    out.m_68.y = _2879;
    out.m_68.z = _2885;
    out.m_68.w = _2760;
    float _2893 = -_2891;
    float _2895 = _2893 + 1.0;
    float _2897 = _2891 * _2814;
    float _2899 = _2825 * _2897;
    float _2901 = _2825 * _2895;
    float _2903 = _2839 * _2897;
    float _2905 = fma(_2835, _2899, _2819);
    float _2907 = fma(_2837, _2899, _2821);
    float _2909 = fma(_2825, _2903, _2823);
    out.m_70.x = _2905;
    out.m_70.y = _2907;
    out.m_70.z = _2909;
    out.m_70.w = _2901;
    if (!_2867)
    {
        return out;
    }
    float _2911 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2911;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _571 = false;
    bool _417 = false;
    bool _307 = false;
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
    float _97 = as_type<float>(_89);
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_93)
    {
        out.m_45.x = 0.0;
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
        float _2970 = as_type<float>(_107);
        out.gl_Position.z = _2970;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _131 = float(_89);
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
        float _3039 = as_type<float>(_145);
        out.gl_Position.z = _3039;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
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
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    float _181 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = 0.0;
    float _185 = _181;
    if (!_159)
    {
        float _187 = _181 * _181;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _191;
    if (!_159)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_159;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _181 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _181);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _181 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _185 = _263;
    }
    float _265 = _185;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _305;
    if (!_287)
    {
        float _289 = in.m_54.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_89);
        float _311 = 1.0 / _309;
        float _313 = _125 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = _315 + _317;
    float _321 = in.m_52.x;
    float _323 = in.m_52.y;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _343 = 1.0 / _339;
    float _345 = -_335;
    float _347 = _345 + 1.0;
    float _349 = _319 * _343;
    bool _351 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_315);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _367;
    float _371 = _361 * _347;
    float _373 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = fma(_369, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _377 = -_361;
    float _379 = _377 + 1.0;
    float _381 = _373 * _371;
    float _383 = _375 * _371;
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].x, _381);
    float _387 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[143].y, _383);
    float _389 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _391 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[144].y, _387);
    float _393 = _389 * _321;
    float _395 = _391 * _323;
    bool _397 = !_341;
    float _415;
    if (!_397)
    {
        float _399 = in.m_54.x;
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _399 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        float _419 = float(_89);
        float _421 = 1.0 / _419;
        float _423 = _125 * _421;
        _415 = _423;
    }
    _417 = false;
    float _425 = _415;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_425);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_425);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _429;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _461;
    float _465 = -_441;
    float _467 = _465 + 1.0;
    bool _469 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _471 = isnan(_425);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _483 = _457 * _467;
    float _485 = -_457;
    float _487 = _485 + 1.0;
    float _489 = 1.0 / _445;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _495 = _463 * _459;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _499 = _425 + _497;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = fma(_495, _499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _509 = _425 + _507;
    float _511 = _441 * _503;
    float _513 = _493 * _489;
    float _515 = _505 * _483;
    float _517 = fma(_513, _509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _519 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _523 = fma(_517, _511, _519);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _527;
    out.m_56.y = _533;
    out.m_56.z = _535;
    out.m_56.w = _537;
    bool _539 = !_481;
    float _541 = _525;
    float _565;
    float _567;
    float _569;
    if (!_539)
    {
        float _543 = in.m_54.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _553 = _125 * _549;
        float _555 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _557 = _555 * _545;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _553;
        _97 = _557;
        _567 = _547;
        _541 = _543;
        _569 = _563;
        _571 = true;
    }
    else
    {
        float _573 = float(_89);
        float _575 = 1.0 / _573;
        float _577 = _125 * _575;
        _565 = _577;
        _567 = _573;
        _569 = _577;
    }
    _571 = false;
    float _579 = _565;
    float _581 = _97;
    float _583 = _567;
    float _585 = _541;
    float _587 = _569;
    float _589 = in.m_54.x;
    float _591 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _593 = int(_591);
    float _595 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = in.m_54.w;
    float _603 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _595);
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _607 = _605 != 0;
    float _609 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _611 = int(_609);
    float _613 = in.m_54.z;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _617 = _579 + _615;
    bool _619 = !_607;
    int _621 = _619 ? 0 : 1;
    float _623 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _625;
    float _629 = _581;
    float _631 = _595;
    float _633 = _585;
    if (!_599)
    {
        float _635 = in.m_54.y;
        _629 = _635;
    }
    float _637 = _629;
    float _639 = float(uint(_593));
    float _641 = 1.0 / _583;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _647 = _589 * 2.0;
    float _649 = float(_611);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _655 = 1.0 / _639;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _661 = _601 > 0.5;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _667 = -_199;
    int _669 = _661 ? as_type<int>(_667) : as_type<int>(_199);
    float _671 = 1.0 / _649;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _677 = as_type<float>(_593);
    if (!_599)
    {
        _631 = _613;
    }
    float _679 = _631;
    float _681 = _679;
    if (!_599)
    {
        _633 = _637;
    }
    float _683 = _633;
    float _685 = floor(_647);
    bool _687 = !_599;
    float _689 = _687 ? 1.2345600128173828125 : 1.0;
    float _691 = _683;
    float _693 = _637;
    if (_599)
    {
        float _695 = in.m_54.x;
        float _697 = in.m_54.y;
        _691 = _695;
        _693 = _697;
    }
    float _699 = _691;
    float _701 = _693;
    float _703 = _671 * _125;
    float _705 = 1.0 / _627;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _707;
    bool _711 = _685 > 0.0;
    float _713 = trunc(_703);
    int _715 = int(_713);
    bool _717 = _685 >= 0.0;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan(0.0);
    bool _725 = _721 || _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _731;
    int _735 = _725 ? 0 : 1;
    float _737 = 1.0 / _645;
    int _739 = ~_735;
    int _741 = _739 + 1;
    int _743 = _741 + 1;
    float _745 = _701 * 2.0;
    int _747 = _743;
    if (!_711)
    {
        int _749 = ~_735;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _761 = _759 != 0;
    float _763 = floor(_745);
    float _765 = float(uint(_715));
    if (_599)
    {
        _681 = _701;
    }
    float _767 = _681;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _775 = _773 != 0;
    bool _777 = !_761;
    int _779 = _777 ? 0 : 1;
    float _781 = 1.0 / _653;
    int _783 = as_type<int>(_655) + (-2);
    float _785 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _787 = _613 > 0.5;
    bool _789 = !_757;
    int _791 = _789 ? 0 : 1;
    float _793 = as_type<float>(_783) * _765;
    float _795 = -_195;
    int _797 = _787 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _785);
    bool _801 = _589 > 0.5;
    float _803 = 1.0 / _659;
    bool _805 = _763 >= 0.0;
    bool _807 = isnan(_763);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = !_771;
    int _817 = _815 ? 0 : 1;
    bool _819 = !_775;
    int _821 = _819 ? 0 : 1;
    float _823 = -_195;
    int _825 = _801 ? as_type<int>(_823) : as_type<int>(_195);
    float _827 = trunc(_793);
    float _829 = precise::max(_827, 0.0);
    uint _832 = uint(_829);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _844 = _842 != 0;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _848 = _846 != 0;
    float _850 = 1.0 / _665;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _854 = _852 != 0;
    float _856 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _858 = _813 ? 0 : 1;
    float _860 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _856);
    bool _862 = _763 > 0.0;
    float _864 = 1.0 / _675;
    int _866 = ~_593;
    int _868 = _866 + 1;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _874 = ~_858;
    int _876 = _874 + 1;
    int _878 = _876 + 1;
    float _880 = as_type<float>(_868);
    int _882 = _878;
    if (!_599)
    {
        _880 = _613;
    }
    float _884 = _880;
    float _886 = 1.0 / _872;
    float _888 = _884;
    if (_599)
    {
        _888 = _701;
    }
    float _890 = _888;
    int _892 = _868 * int(_832);
    int _894 = _892 + _715;
    bool _896 = !_599;
    float _898 = _896 ? _701 : _589;
    if (!_862)
    {
        int _900 = ~_858;
        int _902 = _900 + 1;
        _882 = _902;
    }
    int _904 = _882;
    float _906 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _908 = !_836;
    float _910 = _908 ? _195 : as_type<float>(_797);
    float _912 = _689 * _898;
    float _914 = float(uint(_894));
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = _587 + _916;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _930 = _928 != 0;
    float _932 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _799);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _938 = as_type<float>(_783) * _914;
    float _940 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _860);
    float _942 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _603);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _944;
    float _948 = trunc(_938);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = _918 * _705;
    float _956 = _946 * _737;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    bool _970 = !_922;
    int _972 = _970 ? 0 : 1;
    float _974 = 1.0 / _936;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _976;
    float _980 = _960 * _781;
    float _982 = _968 * _803;
    float _984 = _964 * _864;
    float _986 = _978 * _850;
    float _988 = _613 * 2.0;
    int _990 = ~_593;
    int _992 = _990 + 1;
    float _994 = floor(_912);
    int _996 = int(_832) + int(_952);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1002 = fma(_982, _617, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1004 = float(_593);
    float _1006 = _1000 * _886;
    int _1008 = abs(_791);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1010;
    float _1014 = floor(_988);
    float _1016 = _1004 * _125;
    int _1018 = _992 * _996;
    int _1020 = _1018 + _715;
    float _1022 = _1012 * _974;
    float _1024 = float(_715);
    float _1026 = _1016 * _641;
    bool _1028 = !_926;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = -_994;
    float _1034 = _912 + _1032;
    bool _1036 = _1024 >= _1004;
    bool _1038 = isnan(_1024);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1004);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_729, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1050 = uint(_1020) >= uint(_593);
    float _1052 = trunc(_1026);
    int _1054 = int(_1052);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1058 = _579 + _1056;
    float _1060 = _940 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1062 = !_1050;
    int _1064 = _1062 ? 0 : (-1);
    float _1066 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1068 = _1014 >= 0.0;
    bool _1070 = isnan(_1014);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _942 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1080 = ~_996;
    int _1082 = _1080 + _1064;
    int _1084 = _1082 + 1;
    float _1086 = trunc(_1046);
    int _1088 = int(_1086);
    bool _1090 = _1014 > 0.0;
    float _1092 = fma(_709, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1004 * _1034;
    int _1096 = _593 * _1084;
    int _1098 = _1096 + _715;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1102 = _579 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1106 = _579 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1110 = _579 + _1108;
    float _1112 = trunc(_1094);
    int _1114 = int(_1112);
    int _1116 = _1076 ? 0 : 1;
    float _1118 = fma(_980, _1102, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1120 = _593 == 0;
    float _1122 = fma(_956, _1106, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    int _1124 = abs(_621);
    float _1126 = fma(_984, _1110, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1128 = !_1120;
    int _1130 = _1128 ? _1098 : (-1);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _579 + _1132;
    int _1136 = ~_1088;
    int _1138 = _1136 + 1;
    int _1140 = _1138 + 1;
    float _1142 = fma(_733, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1144 = _593 + (-1);
    int _1146 = abs(_779);
    int _1148 = _1140 * _1130;
    float _1150 = fma(_986, _1134, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1152 = abs(_817);
    int _1154 = _1114 * _1124;
    int _1156 = _1154 + _715;
    int _1158 = _1088 * _1144;
    int _1160 = _1158 + _1148;
    bool _1162 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1164 = isnan(_579);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    int _1174 = _1160 * _1146;
    int _1176 = abs(_821);
    bool _1178 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1180 = isnan(_579);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    int _1190 = _1054 * _1008;
    int _1192 = _1190 + _1174;
    float _1194 = -_1172;
    float _1196 = _1194 + 1.0;
    bool _1198 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1200 = isnan(_579);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    int _1210 = _1156 * _1152;
    int _1212 = _1210 + _1192;
    float _1214 = _1188 * _1196;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    bool _1220 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1222 = isnan(_579);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    int _1232 = _1114 * _1176;
    int _1234 = _1232 + _1212;
    float _1236 = -_1208;
    float _1238 = _1236 + 1.0;
    float _1240 = _1208 * _1218;
    bool _1242 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1244 = isnan(_579);
    bool _1246 = _1242 || _1244;
    bool _1248 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1250 = _1246 || _1248;
    float _1252 = float(_1250);
    float _1254 = -_1230;
    float _1256 = _1254 + 1.0;
    float _1258 = float(uint(_1234));
    float _1260 = _1230 * _1238;
    bool _1262 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1264 = isnan(_579);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    bool _1274 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1276 = isnan(_587);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = as_type<float>(_783) * _1258;
    bool _1288 = _587 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1290 = isnan(_587);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = _1252 * _1256;
    float _1302 = -_1252;
    float _1304 = _1302 + 1.0;
    bool _1306 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1308 = isnan(_579);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1272;
    float _1320 = _1318 + 1.0;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    bool _1328 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1330 = isnan(_579);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1342 = _579 + _1340;
    float _1344 = -_1284;
    float _1346 = _1344 + 1.0;
    int _1348 = ~_593;
    int _1350 = _1348 + 1;
    float _1352 = _1272 * _1304;
    float _1354 = _1316 * _1320;
    float _1356 = -_1316;
    float _1358 = _1356 + 1.0;
    float _1360 = _1298 * _1346;
    float _1362 = fma(_1022, _1058, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1364 = -_1298;
    float _1366 = _1364 + 1.0;
    float _1368 = _1142 * _1360;
    float _1370 = _1092 * _1360;
    float _1372 = _1338 * _1358;
    float _1374 = -_1338;
    float _1376 = _1374 + 1.0;
    int _1378 = _1350 * int(_1326);
    int _1380 = _1378 + _1234;
    float _1382 = _1048 * _1360;
    float _1384 = _1122 * _1372;
    float _1386 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1370);
    float _1388 = float(uint(_1380));
    float _1390 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1382);
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1368);
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1396 = _699 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1398 = as_type<float>(_783) * _1388;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1384);
    float _1402 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1394);
    int _1404 = ~_1116;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = fma(_1006, _1342, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1414 = _1408;
    if (!_1090)
    {
        int _1416 = ~_1116;
        int _1418 = _1416 + 1;
        _1414 = _1418;
    }
    int _1420 = _1414;
    float _1422 = trunc(_1398);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1390);
    float _1430 = -_1412;
    float _1432 = fma(_1396, 2.0, _1430);
    float _1434 = fma(_1118, _1354, _1400);
    float _1436 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1386);
    float _1438 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1392);
    float _1440 = _613 + _701;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _910 + 0.5;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1450 = ~_593;
    int _1452 = _1450 + 1;
    float _1454 = _1440 + (-1.0);
    float _1456 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    float _1458 = _589 + _701;
    int _1460 = int(_1326) + int(_1426);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1464 = _1458 + (-1.0);
    float _1466 = -_125;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1432);
    int _1470 = _1452 * _1460;
    int _1472 = _1470 + _1234;
    float _1474 = fma(_906, -2.0, _1462);
    float _1476 = _1444 * _125;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1482 = !_840;
    float _1484 = _1482 ? _199 : as_type<float>(_669);
    float _1486 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1468);
    float _1488 = exp2(_1476);
    bool _1490 = uint(_1472) >= uint(_593);
    float _1492 = fma(_1126, _1352, _1434);
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1496 = 1.0 + _1494;
    int _1498 = abs(_1030);
    float _1500 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1402);
    float _1502 = float(uint(_1156));
    float _1504 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    int _1506 = abs(_972);
    float _1508 = 1.0 / _1496;
    bool _1510 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1512 = isnan(1.0);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1518 = _1514 || _1516;
    float _1520 = as_type<float>(_783) * _1502;
    float _1522 = float(_753);
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1060 + _1524;
    float _1528 = float(_1506);
    float _1530 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1474);
    float _1532 = float(_1420);
    float _1534 = -_1488;
    float _1536 = _1534 + 1.0;
    bool _1538 = !_1490;
    int _1540 = _1538 ? 0 : (-1);
    float _1542 = trunc(_1520);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    bool _1548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = _1528 * _1532;
    int _1560 = ~_1460;
    int _1562 = _1560 + _1540;
    int _1564 = _1562 + 1;
    float _1566 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1568 = _1556 ? _1536 : 0.0;
    float _1570 = _1558 * (-2.0);
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1574 = _1066 + _1572;
    int _1576 = ~_593;
    int _1578 = _1576 + 1;
    if (_1518)
    {
        float _1580 = _1568 * _1508;
        _129 = _1580;
    }
    float _1582 = _129;
    int _1584 = _593 * _1564;
    int _1586 = _1584 + _1234;
    float _1588 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1566);
    float _1590 = fma(_1002, _1300, _1492);
    float _1592 = _1438 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1594 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1596 = !_1120;
    int _1598 = _1596 ? _1586 : (-1);
    int _1600 = _1578 * int(_1546);
    int _1602 = _1600 + _1156;
    bool _1604 = !_848;
    float _1606 = _1604 ? _195 : as_type<float>(_825);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1078 + _1608;
    int _1612 = _1598 >> 31;
    float _1614 = _1436 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = float(uint(_1602));
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1588);
    int _1620 = _1612 & 3;
    float _1622 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1624 = float(_1498);
    float _1626 = as_type<float>(_783) * _1616;
    int _1628 = _1598 + _1620;
    float _1630 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1632 = _701 > 0.5;
    float _1634 = _1624 * _1522;
    int _1636 = _1628 >> 2;
    float _1638 = trunc(_1626);
    float _1640 = precise::max(_1638, 0.0);
    uint _1642 = uint(_1640);
    float _1644 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = _1484 + (-0.5);
    float _1652 = -_199;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_199);
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _1658 = uint(int(uint(_1648) >> uint(2)));
    uint _1660 = uint(int(uint(int(_1658)) >> uint(2)));
    int _1662 = int(_1658) & 3;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[int(_1660)][_1662];
    int _1666 = int(_1658) + 1;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    int _1670 = _1666 & 3;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[int(_1668)][_1670];
    int _1674 = _1598 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = fma(_1150, _1260, _1590);
    bool _1680 = _1618 >= 0.0;
    float _1682 = in.m_58.x;
    float _1684 = in.m_58.y;
    float _1686 = in.m_58.z;
    int _1688 = ~_593;
    int _1690 = _1688 + 1;
    float _1692 = -_1650;
    float _1694 = -_1530;
    float _1696 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1694);
    int _1698 = _1676 ? 0 : 1;
    int _1700 = _1648 + 8;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    uint _1704 = uint(int(uint(int(_1702)) >> uint(2)));
    int _1706 = int(_1702) & 3;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[int(_1704)][_1706];
    int _1710 = int(_1702) + 1;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    int _1714 = _1710 & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    bool _1718 = uint(_1674) > 1u;
    out.m_60.x = _1622;
    out.m_60.y = _1630;
    out.m_60.z = _1644;
    out.m_60.w = _1656;
    int _1720 = int(_1546) + int(_1642);
    float _1722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1724 = fma(_1478, _1570, _1478);
    int _1726 = ~_1698;
    int _1728 = _1726 + 1;
    int _1730 = _1728 + 1;
    float _1732 = _1606 + 0.5;
    float _1734 = fma(_1410, _1240, _1678);
    int _1736 = _1730;
    if (_1680)
    {
        out.m_45.x = 0.0;
    }
    float _1738 = fma(_1362, _1214, _1734);
    if (!_1718)
    {
        int _1740 = ~_1698;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1748 = !_854;
    float _1750 = _1748 ? _199 : as_type<float>(_1654);
    float _1752 = -_1504;
    float _1754 = _1752 + 1.0;
    bool _1756 = _1674 != 3;
    int _1758 = _1690 * _1720;
    int _1760 = _1758 + _1156;
    bool _1762 = uint(_1674) >= 2u;
    float _1764 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1766 = -_1750;
    float _1768 = _1766 + 0.5;
    float _1770 = fma(_1484, _1754, _1696);
    bool _1772 = uint(_1760) >= uint(_593);
    float _1774 = -_1500;
    float _1776 = _1774 + 1.0;
    float _1778 = _1634 * (-2.0);
    float _1780 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1782 = abs(_1744);
    float _1784 = -_1776;
    float _1786 = fma(_910, _1784, _1486);
    int _1788 = _1762 ? 0 : 1;
    float _1790 = fma(_1480, _1778, _1480);
    int _1792 = _1598 & 3;
    bool _1794 = _1792 != 0;
    float _1796 = fma(_1778, _1684, _1684);
    float _1798 = _1764 * _1722;
    float _1800 = _1780 * _1746;
    bool _1802 = !_1794;
    int _1804 = _1802 ? 0 : 1;
    float _1806 = fma(_1570, _1682, _1682);
    int _1808 = ~_1788;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1738);
    bool _1816 = _1674 != 3;
    out.m_62.x = _1798;
    out.m_62.y = _1800;
    out.m_62.z = _1786;
    out.m_62.w = _1770;
    int _1818 = _1812;
    if (_1756)
    {
        int _1820 = ~_1788;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    int _1826 = abs(_1804);
    out.m_64.x = _1814;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = !_1772;
    int _1834 = _1832 ? 0 : (-1);
    int _1836 = ~_1782;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1826;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = abs(_1824);
    int _1850 = _1840 * as_type<int>(_1672);
    int _1852 = abs(_1830);
    int _1854 = ~_1848;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * as_type<int>(_1664);
    int _1862 = _1860 + _1850;
    float _1864 = _1526 * _1526;
    bool _1866 = !_844;
    int _1868 = _1866 ? 0 : 1;
    float _1870 = fma(_1574, _1574, _1864);
    int _1872 = ~_1720;
    int _1874 = _1872 + _1834;
    int _1876 = _1874 + 1;
    int _1878 = _1858 * as_type<int>(_1708);
    int _1880 = _1878 + _1862;
    int _1882 = abs(_1868);
    float _1884 = fma(_1610, _1610, _1870);
    int _1886 = ~_1852;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    int _1892 = _593 * _1876;
    int _1894 = _1892 + _1156;
    int _1896 = ~_1882;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = _1890 * as_type<int>(_1716);
    int _1904 = _1902 + _1880;
    float _1906 = rsqrt(_1884);
    bool _1908 = !_1120;
    int _1910 = _1908 ? _1894 : (-1);
    float _1912 = _589 + (-0.5);
    int _1914 = _1900 * _1904;
    float _1916 = as_type<float>(_1890);
    if (_1680)
    {
        _1916 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1918 = _1916;
    float _1920 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1806);
    int _1922 = _1910 * _1882;
    int _1924 = _1922 + _1914;
    bool _1926 = !_930;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = as_type<int>(_1918);
    if (_1680)
    {
        float _1932 = _1918 * 5.0;
        _1930 = as_type<int>(_1932);
    }
    int _1934 = _1930;
    float _1936 = fma(_1724, _1582, _1920);
    float _1938 = _623 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1940 = float(_1924);
    if (_1680)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5730 = as_type<float>(_1934);
        out.gl_Position.z = _5730;
    }
    int _1942 = abs(_1928);
    float _1944 = _1938 * _1906;
    float _1946 = _701 + (-0.5);
    out.m_66.y = _1940;
    float _1948 = _1574 * _1944;
    float _1950 = _1526 * _1944;
    if (_1680)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1952 = -_1950;
    float _1954 = _1060 + _1952;
    float _1956 = _1610 * _1944;
    float _1958 = -_1948;
    float _1960 = _1066 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1954 + _1962;
    float _1966 = -_1956;
    float _1968 = _1078 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1960 + _1970;
    float _1974 = -_1950;
    float _1976 = _1526 + _1974;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1982 = _1968 + _1980;
    float _1984 = float(_1942);
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1796);
    float _1988 = fma(_1972, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1978);
    float _1990 = float(_904);
    float _1992 = -_1948;
    float _1994 = _1574 + _1992;
    float _1996 = _1976 * _1976;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1988);
    float _2000 = fma(_1790, _1582, _1986);
    float _2002 = _589 + _613;
    float _2004 = fma(_1994, _1994, _1996);
    float _2006 = -_1956;
    float _2008 = _1610 + _2006;
    bool _2010 = _1998 >= 0.0;
    float _2012 = _1984 * _1990;
    float _2014 = _2000 * 0.15915493667125701904296875;
    float _2016 = _2002 + (-1.0);
    float _2018 = fma(_2008, _2008, _2004);
    float _2020 = _2012 * (-2.0);
    float _2022 = _1936 * 0.15915493667125701904296875;
    float _2024 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2026 = _2014 * 6.283185482025146484375;
    float _2028 = sin(_2026);
    float _2030 = fma(_2020, _1686, _1686);
    float _2032 = _613 + (-0.5);
    float _2034 = fma(_2024, _2020, _2024);
    int _2036 = as_type<int>(_2030);
    float _2038 = _1972;
    float _2040 = _1954;
    if (_2010)
    {
        _677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _677;
    float _2044 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2030);
    if (_2010)
    {
        out.m_45.x = 0.0;
    }
    float _2046 = _2022 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    if (_2010)
    {
        float _2050 = _2042 * 5.0;
        _2036 = as_type<int>(_2050);
    }
    int _2052 = _2036;
    float _2054 = fma(_2034, _1582, _2044);
    if (_2010)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5918 = as_type<float>(_2052);
        out.gl_Position.z = _5918;
    }
    float _2056 = _2054 * 0.15915493667125701904296875;
    float _2058 = _2022 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    float _2062 = sqrt(_2018);
    float _2064 = _2014 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    if (_2010)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2068 = _2056 * 6.283185482025146484375;
    float _2070 = cos(_2068);
    float _2072 = _1906 * _2062;
    float _2074 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2080 = _623 * _2072;
    float _2082 = _2072 * _2074;
    float _2084 = _2048 * _2028;
    float _2086 = _2056 * 6.283185482025146484375;
    float _2088 = sin(_2086);
    float _2090 = _2060 * _2066;
    float _2092 = _2076 * _2082;
    float _2094 = _2078 * _2080;
    float _2096 = _2060 * _2028;
    bool _2098 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2100 = isnan(0.5);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2106 = _2102 || _2104;
    float _2108 = _2070 * _2092;
    float _2110 = _2028 * _2070;
    float _2112 = _2066 * _2070;
    float _2114 = _2048 * _2066;
    float _2116 = _2060 * _2108;
    float _2118 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2120 = _2118 * 0.5;
    bool _2122 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2124 = isnan(0.5);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2130 = _2126 || _2128;
    float _2132 = fma(_2088, _2090, _2084);
    float _2134 = -_2092;
    float _2136 = _2088 * _2134;
    float _2138 = fma(_2088, _2084, _2090);
    float _2140 = fma(_2132, _2094, _2116);
    float _2142 = -_2114;
    float _2144 = fma(_2088, _2096, _2142);
    float _2146 = -_2096;
    float _2148 = fma(_2088, _2114, _2146);
    float _2150 = _2048 * _2108;
    float _2152 = fma(_2112, _2094, _2136);
    float _2154 = fma(_2144, _2120, _2140);
    float _2156 = fma(_2148, _2094, _2150);
    float _2158 = fma(_2110, _2120, _2152);
    float _2160 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2138, _2120, _2156);
    float _2166 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2168 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2166);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2174);
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _1078 + _2178;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2188 = _1066 + _2182;
    float _2190 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2184 + _2192;
    float _2196 = 1.0 / _2186;
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2200 = _2188 + _2198;
    float _2202 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2190);
    float _2204 = _2194 * _2194;
    float _2206 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2202);
    float _2208 = fma(_2200, _2200, _2204);
    float _2210 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2212 = sqrt(_2208);
    float _2214 = _2210 + _2186;
    float _2216 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = _2214 * _2196;
    float _2220 = _2218 * 0.5;
    float _2222 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2226 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2224);
    float _2228 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2222);
    bool _2230 = _2212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2232 = 1.0 / _2226;
    float _2234 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2236 = _1060 + _2234;
    float _2238 = _2154;
    float _2240 = _2234;
    float _2242 = _2214;
    float _2244 = _2212;
    float _2246 = _2184;
    if (!_2230)
    {
        _2238 = _2188;
    }
    float _2248 = _2238;
    float _2250 = _2248;
    if (!_2230)
    {
        _2240 = _2184;
    }
    float _2252 = _2240;
    float _2254 = _2252;
    if (!_2230)
    {
        _2242 = _2236;
    }
    float _2256 = _2242;
    bool _2258 = !_2230;
    float _2260 = _2256;
    if (!_2258)
    {
        float _2262 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2266 = _2212 + _2264;
        float _2268 = rsqrt(_2208);
        float _2270 = _2266 * _2262;
        float _2272 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = _2270 * 0.15915493667125701904296875;
        float _2276 = _2274 * 6.283185482025146484375;
        float _2278 = sin(_2276);
        float _2280 = _2274 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = fma(_2278, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2286 = _2268 * _2284;
        float _2288 = _2282 + (-1.0);
        float _2290 = fma(_2200, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2292 = fma(_2194, _2286, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2294 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = fma(_2236, _2282, _2294);
        _2250 = _2290;
        _2260 = _2296;
        _2254 = _2292;
        _2244 = _2294;
    }
    float _2298 = _2250;
    float _2300 = _2260;
    float _2302 = _2254;
    float _2304 = _2244;
    float _2306 = -_1948;
    float _2308 = _2306 + _2298;
    float _2310 = -_1950;
    float _2312 = _2310 + _2300;
    float _2314 = -_1956;
    float _2316 = _2314 + _2302;
    float _2318 = _2304;
    float _2320 = _2312;
    float _2322 = _2308;
    float _2324 = _2316;
    float _2326 = _2302;
    if (_2130)
    {
        _2318 = 1.0;
    }
    float _2328 = _2318;
    float _2330 = _2328;
    if (!_2106)
    {
        float _2332 = _1964 * _1964;
        float _2334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2336 = -_1078;
        float _2338 = _2336 + _2302;
        float _2340 = -_1066;
        float _2342 = _2340 + _2298;
        float _2344 = fma(_1972, _1972, _2332);
        float _2346 = -_1060;
        float _2348 = _2346 + _2300;
        float _2350 = fma(_1982, _1982, _2344);
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2354 = sqrt(_2350);
        float _2356 = 1.0 / _2072;
        float _2358 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2360 = precise::min(_2354, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2362 = _2360 * _2334;
        float _2364 = _2362 * _2356;
        float _2366 = _2358 * _2364;
        float _2368 = _2338 * _2364;
        float _2370 = fma(_2342, _2366, _1960);
        float _2372 = fma(_2348, _2366, _1954);
        float _2374 = fma(_2358, _2368, _1968);
        _2038 = _2354;
        _2320 = _2372;
        _2322 = _2370;
        _2324 = _2374;
        _2326 = _2348;
    }
    float _2376 = _2038;
    float _2378 = _2320;
    float _2380 = _2322;
    float _2382 = _2324;
    float _2384 = _2326;
    float _2386 = _2376;
    float _2388 = _2384;
    if (_2130)
    {
        _2040 = 1.0;
    }
    float _2390 = _2040;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2394 = _2232 * _2392;
    float _2396 = _2390;
    if (!_2130)
    {
        float _2398 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2398 * 0.15915493667125701904296875;
        float _2402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2404 = _2400 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        float _2408 = _2402 * 0.15915493667125701904296875;
        float _2410 = _2400 * 6.283185482025146484375;
        float _2412 = sin(_2410);
        float _2414 = 1.0 / _2406;
        float _2416 = _2408 * 6.283185482025146484375;
        float _2418 = cos(_2416);
        float _2420 = _2412 * _2414;
        float _2422 = _2408 * 6.283185482025146484375;
        float _2424 = sin(_2422);
        float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2426;
        float _2430 = _2418 * _2420;
        float _2432 = 1.0 / _2428;
        float _2434 = 1.0 / _2430;
        float _2436 = _2424 * _2434;
        float _2438 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2440 = fma(_2394, _2436, _2438);
        float _2442 = _2440 * _2432;
        float _2444 = precise::clamp(_2442, 0.0, 1.0);
        _2386 = _2400;
        _2330 = _2444;
    }
    float _2446 = _2386;
    float _2448 = _2330;
    float _2450 = _2446;
    if (!_2130)
    {
        float _2452 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2458 = _2454 * 6.283185482025146484375;
        float _2460 = cos(_2458);
        float _2462 = _2456 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2460;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2494 = fma(_2394, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        float _2500 = -_2498;
        float _2502 = _2500 + 1.0;
        _2450 = _2460;
        _2396 = _2502;
    }
    float _2504 = _2450;
    float _2506 = _2396;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2510 = _2378 + _2508;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2514 = _2380 + _2512;
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2518 = _2382 + _2516;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2522 = _2510 * _2510;
    float _2524 = fma(_2514, _2514, _2522);
    float _2526 = fma(_2518, _2518, _2524);
    float _2528 = rsqrt(_2526);
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2532 = _2514 * _2530;
    float _2534 = _2518 * _2530;
    float _2536 = _2532 * _2532;
    float _2538 = _2534 * _2534;
    float _2540 = _2536 + _2538;
    float _2542 = sqrt(_2540);
    bool _2544 = _2542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2548 = _2542 + _2546;
    float _2550 = _2518;
    float _2552 = _2522;
    float _2554 = _2548;
    float _2556 = _2510;
    float _2558 = _2532;
    if (_2544)
    {
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2550 = _2560;
    }
    float _2562 = _2550;
    if (_2544)
    {
        float _2564 = rsqrt(_2540);
        _2552 = _2564;
    }
    float _2566 = _2552;
    float _2568 = _2566;
    if (_2544)
    {
        float _2570 = _2548 * _2562;
        _2554 = _2570;
    }
    float _2572 = _2554;
    if (_2544)
    {
        float _2574 = _2572 * 0.15915493667125701904296875;
        _2388 = _2574;
    }
    float _2576 = _2388;
    float _2578 = _2504;
    if (_2544)
    {
        float _2580 = _2576 * 6.283185482025146484375;
        float _2582 = sin(_2580);
        _2578 = _2582;
    }
    float _2584 = _2578;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2588 = precise::max(0.0, _2586);
    float _2590 = _2528;
    float _2592 = _2588;
    float _2594 = _2586;
    if (_2544)
    {
        float _2596 = _2576 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        _2590 = _2598;
    }
    float _2600 = _2590;
    float _2602 = -_2530;
    float _2604 = -_2588;
    float _2606 = fma(_2510, _2602, _2604);
    if (_2544)
    {
        float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2592 = _2608;
    }
    float _2610 = _2592;
    float _2612 = _2610;
    if (_2544)
    {
        float _2614 = fma(_2584, _2610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2556 = _2614;
    }
    float _2616 = _2556;
    float _2618 = _2616;
    if (!_2544)
    {
        _2612 = _2606;
    }
    float _2620 = _2612;
    float _2622 = sqrt(_2526);
    float _2624 = _2620;
    float _2626 = _2600;
    if (_2544)
    {
        float _2628 = _2600 + (-1.0);
        _2594 = _2628;
    }
    float _2630 = _2594;
    float _2632 = _2630;
    if (_2544)
    {
        float _2634 = _2566 * _2616;
        _2246 = _2634;
    }
    float _2636 = _2246;
    if (!_2544)
    {
        _2618 = _2534;
    }
    float _2638 = _2618;
    float _2640 = _2638;
    if (_2544)
    {
        float _2642 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2642;
    }
    float _2644 = _2568;
    if (_2544)
    {
        float _2646 = _2532 * _2636;
        _2558 = _2646;
    }
    float _2648 = _2558;
    if (!_2544)
    {
        _2632 = _2536;
    }
    float _2650 = _2632;
    float _2652 = _2650;
    if (_2544)
    {
        float _2654 = _2534 * _2636;
        _2640 = _2654;
    }
    float _2656 = _2640;
    if (_2544)
    {
        float _2658 = fma(_2606, _2600, _2644);
        _2624 = _2658;
    }
    float _2660 = _2624;
    if (_2544)
    {
        float _2662 = _2648 * _2648;
        _2652 = _2662;
    }
    float _2664 = _2652;
    if (!_2544)
    {
        _2626 = _2538;
    }
    float _2666 = _2626;
    float _2668 = _2666;
    if (_2544)
    {
        float _2670 = _2656 * _2656;
        _2668 = _2670;
    }
    float _2672 = _2668;
    float _2674 = fma(_2660, _2660, _2664);
    float _2676 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2678 = _2674 + _2672;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2682 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2680);
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2676);
    float _2688 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2690 = rsqrt(_2678);
    float _2692 = -_2684;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2686);
    float _2698 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2700 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2688);
    float _2702 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2704 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2706 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2698);
    float _2708 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2700);
    float _2710 = abs(_2694);
    float _2712 = log2(_2710);
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2716 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2702);
    float _2718 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2706);
    float _2720 = _2708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2722 = -_2714;
    float _2724 = fma(_2722, _2520, 1.0);
    float _2726 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2716);
    float _2728 = _2690 * _2648;
    float _2730 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2732 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2734 = _2690 * _2660;
    float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2738 = _2690 * _2656;
    float _2740 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2732);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2744 = -_2736;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2744);
    float _2748 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2750 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2740);
    float _2752 = log2(_2724);
    float _2754 = -_2738;
    float _2756 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2746);
    float _2758 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2760 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2750);
    float _2762 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2764 = fma(_2756, -0.5, 0.5);
    float _2766 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2758);
    float _2768 = fma(_2756, 0.5, 0.5);
    float _2770 = exp2(_2748);
    float _2772 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2762);
    float _2774 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2766);
    float _2776 = _2734 + 1.0;
    float _2778 = fma(_2768, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2780 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2772);
    float _2782 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2774);
    float _2784 = 1.0 / _2760;
    float _2786 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2780);
    float _2788 = fma(_2768, _2778, -0.212114393711090087890625);
    float _2790 = _2752 * 0.693147182464599609375;
    float _2792 = fma(_2768, _2788, 1.570728778839111328125);
    float _2794 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2796 = sqrt(_2764);
    float _2798 = -_2734;
    float _2800 = fma(_2770, _2776, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float _2804 = _2782 * _2784;
    float _2806 = _2786 * _2784;
    float _2808 = fma(_2804, 0.5, 0.5);
    float _2810 = fma(_2806, -0.5, 0.5);
    float _2812 = _2796 * 0.636619746685028076171875;
    float3 _7099 = float3(_2808, _2810, _2794);
    float _2814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7099, float3(0.0), isnan(_7099)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7099, float3(0.0), isnan(_7099)), level(0.0)).x;
    float3 _7110 = float3(_2808, _2810, _2794);
    float4 _2817 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).xyzw;
    float _2819 = _2817.x;
    float _2821 = _2817.y;
    float _2823 = _2817.z;
    float _2825 = _2817.w;
    float _2827 = -_2792;
    float _2829 = fma(_2812, _2827, 1.0);
    float2 _7132 = float2(_2829, _2802);
    float3 _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7132, float2(0.0), isnan(_7132)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7132, float2(0.0), isnan(_7132)), level(0.0)).xyz;
    float _2835 = _2833.x;
    float _2837 = _2833.y;
    float _2839 = _2833.z;
    float _2841 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2843 = _2720 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = _2448 * _2506;
    bool _2847 = _2448 > 0.0;
    bool _2849 = isnan(_2448);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan(0.0);
    bool _2855 = _2851 || _2853;
    float _2857 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2859 = exp2(_2841);
    float _2861 = _2845 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2863 = _2506 <= 0.0;
    bool _2865 = !_2855;
    bool _2867 = _2863 || _2865;
    float _2869 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2857);
    float _2871 = _2760 * 0.5;
    float _2873 = _2861 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2875 = _2782 + _2760;
    float _2877 = fma(_2742, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2869);
    float _2879 = fma(_2786, -0.5, _2871);
    float _2881 = _2875 * 0.5;
    float _2883 = _2877 + _2760;
    out.m_45.x = _2873;
    float _2885 = _2883 * 0.5;
    float _2887 = -_2859;
    float _2889 = _2887 + 1.0;
    out.gl_Position.x = _2782;
    out.gl_Position.y = _2786;
    out.gl_Position.z = _2877;
    out.gl_Position.w = _2760;
    float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2881;
    out.m_68.y = _2879;
    out.m_68.z = _2885;
    out.m_68.w = _2760;
    float _2893 = -_2891;
    float _2895 = _2893 + 1.0;
    float _2897 = _2891 * _2814;
    float _2899 = _2825 * _2897;
    float _2901 = _2825 * _2895;
    float _2903 = _2839 * _2897;
    float _2905 = fma(_2835, _2899, _2819);
    float _2907 = fma(_2837, _2899, _2821);
    float _2909 = fma(_2825, _2903, _2823);
    out.m_70.x = _2905;
    out.m_70.y = _2907;
    out.m_70.z = _2909;
    out.m_70.w = _2901;
    if (!_2867)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2911 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2911;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

