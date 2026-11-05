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
    float4 m_58 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _817 = false;
    bool _667 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2771 = as_type<float>(_105);
        out.gl_Position.z = _2771;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2840 = as_type<float>(_141);
        out.gl_Position.z = _2840;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = _143;
    if (!_203)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _239;
        _207 = _223;
        _209 = _229;
    }
    float _241 = _205;
    float _243 = _207;
    float _245 = _209;
    bool _247 = !_157;
    float _249 = _245;
    float _251 = _243;
    float _253 = _241;
    if (!_247)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _173 = _273;
        _249 = _261;
    }
    float _275 = _173;
    float _277 = _249;
    float _279 = _277;
    if (!_157)
    {
        float _281 = _123 * _123;
        float _283 = _281 * 0.5;
        _251 = _283;
    }
    float _285 = _251;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _279 = _123;
    }
    float _293 = _279;
    float _295 = fma(_275, _159, _287);
    float _297 = fma(_275, _161, _289);
    float _299 = _293;
    if (!_157)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_157;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _123 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _123);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_157;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _123 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _161, _365);
    float _375 = fma(_363, _159, _367);
    float _377 = fma(_363, _163, _369);
    float _379 = fma(_297, _147, _167);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_275, _163, _291);
    float _387 = fma(_295, _147, _165);
    float _389 = -_375;
    float _391 = _295 + _389;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -_377;
    float _401 = _385 + _399;
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _409 = fma(_385, _147, _169);
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _413 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_56.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_89);
        float _447 = 1.0 / _445;
        float _449 = _123 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_54.x;
    float _459 = in.m_54.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_451);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = 1.0 / _475;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _501 = _487 * _491;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _455 * _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    float _513 = fma(_495, _507, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _513 * _501;
    float _519 = _515 * _501;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_499;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _123 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_577;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _599;
    float _603 = 1.0 / _581;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _607 = _593 * _597;
    float _609 = -_593;
    float _611 = _609 + 1.0;
    float _613 = _565 * _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _615;
    float _619 = fma(_601, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _621;
    float _625 = fma(_617, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _627 = _619 * _607;
    float _629 = fma(_623, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = _625 * _607;
    float _633 = _629 * _607;
    float _635 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _637 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _639 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _641 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].x, _635);
    float _643 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].y, _637);
    float _645 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].z, _639);
    bool _647 = !_605;
    float _665;
    if (!_647)
    {
        float _649 = in.m_56.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_89);
        float _671 = 1.0 / _669;
        float _673 = _123 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _675 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _685 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _687 = isnan(_675);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _701 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _703 = isnan(_675);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _713;
    bool _717 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _719 = isnan(_675);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _683;
    float _731 = -_695;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _737 = 1.0 / _699;
    float _739 = _715 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _751 = _711 * _733;
    float _753 = -_711;
    float _755 = _753 + 1.0;
    float _757 = _695 * _747;
    float _759 = _743 * _737;
    float _761 = _749 * _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = _675 + _763;
    float _767 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _769 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[115].x, _761);
    float _773 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_773, _757, _771);
    float _781 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[117].x, _779);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _777;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _787;
    bool _789 = !_735;
    float _813;
    float _815;
    if (!_789)
    {
        float _791 = in.m_56.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _795 = float(_89);
        float _797 = 1.0 / _795;
        float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _801 = _123 * _797;
        float _803 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _805 = _803 * _793;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _801;
        _815 = _811;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _813 = _823;
        _815 = _823;
    }
    _817 = false;
    float _825 = _813;
    float _827 = _815;
    float _829 = in.m_56.x;
    float _831 = in.m_56.y;
    float _833 = in.m_56.z;
    float _835 = in.m_56.w;
    float _837 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _851 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    float _853 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _857 = _855 != 0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _865 = _863 != 0;
    float _867 = 1.0 / _845;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _879 = _877 != 0;
    float _881 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _885 = _825 + _883;
    float _887 = 1.0 / _849;
    bool _889 = _835 > 0.5;
    float _891 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _897 = _829 > 0.5;
    float _899 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _901 = -_201;
    int _903 = _889 ? as_type<int>(_901) : as_type<int>(_201);
    float _905 = 1.0 / _861;
    bool _907 = _831 > 0.5;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = -_197;
    int _913 = _897 ? as_type<int>(_911) : as_type<int>(_197);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _919 = 1.0 / _875;
    float _921 = -_909;
    float _923 = fma(_899, 2.0, _921);
    float _925 = -_201;
    int _927 = _907 ? as_type<int>(_925) : as_type<int>(_201);
    float _929 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _891);
    bool _931 = !_857;
    float _933 = _931 ? _197 : as_type<float>(_913);
    float _935 = _833 * 2.0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _943 = _941 != 0;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _947 = _945 != 0;
    float _949 = 1.0 / _895;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = _827 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _963 = fma(_917, -2.0, _915);
    float _965 = _953 * _867;
    float _967 = _957 * _887;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _973;
    float _977 = floor(_935);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _987 = _975 * _905;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _989;
    float _993 = _981 * _919;
    float _995 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _997 = _829 * 2.0;
    float _999 = 1.0 / _961;
    float _1001 = _991 * _949;
    bool _1003 = !_865;
    float _1005 = _1003 ? _201 : as_type<float>(_927);
    float _1007 = _831 * 2.0;
    bool _1009 = _833 > 0.5;
    float _1011 = _831 + _829;
    bool _1013 = !_879;
    float _1015 = _1013 ? _201 : as_type<float>(_903);
    float _1017 = -_123;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1021 = 1.0 / _985;
    float _1023 = -_197;
    int _1025 = _1009 ? as_type<int>(_1023) : as_type<int>(_197);
    float _1027 = _853 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1029 = _977 > 0.0;
    float _1031 = _929 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _977 >= 0.0;
    bool _1035 = isnan(_977);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    float _1043 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = floor(_997);
    float _1047 = _971 * _999;
    float _1049 = _831 + _833;
    int _1051 = _1041 ? 0 : 1;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1057 = !_871;
    float _1059 = _1057 ? _197 : as_type<float>(_1025);
    float _1061 = floor(_1007);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = _1049 + (-1.0);
    float _1069 = _1011 + (-1.0);
    float _1071 = _1065 * _1021;
    float _1073 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1075 = 1.0 / _1055;
    bool _1077 = _1045 > 0.0;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1081 = _1045 >= 0.0;
    bool _1083 = isnan(_1045);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1093 = _825 + _1091;
    int _1095 = ~_1051;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1047, _885, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1103 = _1099;
    if (!_1029)
    {
        int _1105 = ~_1051;
        int _1107 = _1105 + 1;
        _1103 = _1107;
    }
    int _1109 = _1103;
    float _1111 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1113 = log2(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1115;
    int _1119 = _1089 ? 0 : 1;
    float _1121 = fma(_967, _1093, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1123 = _1061 > 0.0;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1127 = _825 + _1125;
    bool _1129 = _1061 >= 0.0;
    bool _1131 = isnan(_1061);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.0);
    bool _1137 = _1133 || _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1141 = _825 + _1139;
    float _1143 = _1117 * _1075;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = fma(_987, _1141, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1151 = _825 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1153;
    float _1157 = _123 * _1113;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1167;
    float _1171 = fma(_1155, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1173 = fma(_1071, _1127, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1175 = fma(_1165, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1177 = fma(_1143, _1151, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1179 = exp2(_1157);
    float _1181 = fma(_1169, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1183 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _933 + 0.5;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1189 = _825 + _1187;
    float _1191 = _1005 + (-0.5);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1195 = _825 + _1193;
    float _1197 = fma(_1183, _1185, _1019);
    float _1199 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1201 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1203 = isnan(_825);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = fma(_1001, _1189, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1215 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1217 = isnan(_825);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1199;
    float _1229 = -_1161;
    float _1231 = fma(_1227, _1191, _1229);
    bool _1233 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1235 = isnan(_825);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = -_1211;
    float _1247 = _1245 + 1.0;
    float _1249 = fma(_993, _1195, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1251 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1253 = isnan(_827);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = -_1179;
    float _1265 = _1263 + 1.0;
    bool _1267 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_827);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = _1225 * _1247;
    float _1281 = -_1225;
    float _1283 = _1281 + 1.0;
    int _1285 = _1137 ? 0 : 1;
    float _1287 = -_1243;
    float _1289 = _1287 + 1.0;
    bool _1291 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1293 = isnan(_825);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = _1243 * _1283;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    float _1319 = _1301 * _1289;
    bool _1321 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1323 = isnan(_825);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1301;
    float _1335 = _1333 + 1.0;
    float _1337 = _1313 ? _1265 : 0.0;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = _1331 * _1335;
    bool _1355 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1357 = isnan(_825);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -_1331;
    float _1369 = _1367 + 1.0;
    bool _1371 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_825);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = _1261 * _1317;
    float _1385 = -_1365;
    float _1387 = _1385 + 1.0;
    float _1389 = _1365 * _1369;
    float _1391 = _1171 * _1383;
    bool _1393 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1395 = isnan(_825);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1381 * _1387;
    float _1407 = -_1381;
    float _1409 = _1407 + 1.0;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = _1175 * _1383;
    float _1415 = _1181 * _1383;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = _1403 * _1409;
    float _1421 = 1.0 / _1341;
    float _1423 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    float _1425 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1427 = _1121 * _1419;
    float _1429 = _1059 + 0.5;
    float _1431 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1423);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1425);
    float _1435 = float(_1109);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1439 = -_1431;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -_1441;
    float _1449 = fma(_933, _1447, _1197);
    float _1451 = -_1403;
    float _1453 = _1451 + 1.0;
    float _1455 = fma(_1005, _1445, _1231);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1459 = -_1261;
    float _1461 = _1459 + 1.0;
    float _1463 = _1337 * _1421;
    float _1465 = -_1015;
    float _1467 = _1465 + 0.5;
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1427);
    float _1471 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1391);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1413);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1415);
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1481 = fma(_1101, _1405, _1469);
    bool _1483 = !_939;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1471 * _1437;
    float _1489 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1475);
    int _1491 = ~_1285;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    float _1497 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1473);
    float _1499 = _1479 * _1457;
    int _1501 = abs(_1485);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1027 + _1503;
    int _1507 = _1495;
    float _1509 = _1173;
    if (!_1123)
    {
        int _1511 = ~_1285;
        int _1513 = _1511 + 1;
        _1507 = _1513;
    }
    int _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1031 + _1517;
    out.m_60.x = _1449;
    out.m_60.y = _1455;
    out.m_60.z = _1487;
    out.m_60.w = _1499;
    float _1521 = fma(_1147, _1389, _1481);
    float _1523 = _1505 * _1505;
    float _1525 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1477);
    float _1527 = float(_1501);
    bool _1529 = !_943;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = ~_1119;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = _1527 * _1435;
    int _1541 = abs(_1531);
    float _1543 = fma(_1249, _1353, _1521);
    int _1545 = _1537;
    if (!_1077)
    {
        int _1547 = ~_1119;
        int _1549 = _1547 + 1;
        _1545 = _1549;
    }
    int _1551 = _1545;
    float _1553 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1043 + _1557;
    float _1561 = fma(_1213, _1319, _1543);
    float _1563 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1555);
    float _1565 = float(_1551);
    float _1567 = in.m_62.x;
    float _1569 = in.m_62.y;
    float _1571 = in.m_62.z;
    float _1573 = float(_1541);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1563);
    float _1577 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1581 = _1539 * (-2.0);
    float _1583 = _1573 * _1565;
    bool _1585 = _1575 >= 0.0;
    float _1587 = fma(_1519, _1519, _1523);
    float _1589 = fma(_1173, _1303, _1561);
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1595 = fma(_1559, _1559, _1587);
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1073, _1581, _1073);
    float _1601 = fma(_1177, _1279, _1589);
    float _1603 = rsqrt(_1595);
    out.m_64.x = _1591;
    out.m_64.y = _1593;
    out.m_64.z = _1597;
    float _1605 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1601);
    if (_1585)
    {
        _1509 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1607 = _1509;
    int _1609 = as_type<int>(_1607);
    if (_1585)
    {
        out.m_47.x = 0.0;
    }
    float _1611 = fma(_1581, _1567, _1567);
    float _1613 = _1583 * (-2.0);
    if (_1585)
    {
        float _1615 = _1607 * 5.0;
        _1609 = as_type<int>(_1615);
    }
    int _1617 = _1609;
    out.m_66.x = _1605;
    float _1619 = fma(_1079, _1613, _1079);
    float _1621 = fma(_1613, _1569, _1569);
    float _1623 = _1505 * _1603;
    float _1625 = _829 + (-0.5);
    float _1627 = _1519 * _1603;
    float _1629 = _1627;
    if (_1585)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5160 = as_type<float>(_1617);
        out.gl_Position.z = _5160;
    }
    float _1631 = -_1623;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    bool _1637 = !_947;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = -_1627;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1645 = _1633 * _1633;
    if (_1585)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1647 = -_1623;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1651 = -_1627;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1655 = _1559 * _1603;
    int _1657 = abs(_1639);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1649 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1653 + _1663;
    float _1667 = fma(_1643, _1643, _1645);
    float _1669 = -_1655;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1675 = float(_1515);
    float _1677 = _833 + _829;
    float _1679 = fma(_1671, _1671, _1667);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1673);
    float _1683 = -_1655;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1687 = _831 + (-0.5);
    bool _1689 = !_1351;
    float _1691 = _1689 ? _123 : _1463;
    float _1693 = _1677 + (-1.0);
    float _1695 = float(_1657);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1699 = _1685 + _1697;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1621);
    float _1703 = _833 + (-0.5);
    float _1705 = fma(_1691, _1599, _1635);
    float _1707 = _1695 * _1675;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1681);
    float _1711 = fma(_1691, _1619, _1701);
    float _1713 = _1707 * (-2.0);
    float _1715 = sqrt(_1679);
    float _1717 = _1711 * 0.15915493667125701904296875;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1723 = fma(_1713, _1571, _1571);
    float _1725 = _1705 * 0.15915493667125701904296875;
    float _1727 = fma(_1721, _1713, _1721);
    float _1729 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1723);
    float _1731 = _1725 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1691, _1727, _1729);
    float _1737 = _1703;
    if (_1719)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1739 = _1737;
    float _1741 = _1735 * 0.15915493667125701904296875;
    float _1743 = _1725 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    int _1747 = as_type<int>(_1739);
    if (_1719)
    {
        out.m_47.x = 0.0;
    }
    float _1749 = _1603 * _1715;
    if (_1719)
    {
        float _1751 = _1739 * 5.0;
        _1747 = as_type<int>(_1751);
    }
    int _1753 = _1747;
    float _1755 = _1717 * 6.283185482025146484375;
    float _1757 = sin(_1755);
    if (_1719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1753);
        out.gl_Position.z = _5380;
    }
    float _1759 = _1717 * 6.283185482025146484375;
    float _1761 = cos(_1759);
    float _1763 = _1741 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    if (_1719)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = cos(_1767);
    float _1771 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1775 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1777 = _1733 * _1757;
    float _1779 = _1749 * _1771;
    float _1781 = _1745 * _1761;
    float _1783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1785 = _1749 * _1775;
    float _1787 = _1773 * _1779;
    float _1789 = fma(_1765, _1781, _1777);
    float _1791 = _1745 * _1757;
    float _1793 = _1783 * _1785;
    float _1795 = _1733 * _1761;
    float _1797 = _1769 * _1787;
    float _1799 = -_1787;
    float _1801 = _1765 * _1799;
    float _1803 = _1745 * _1797;
    float _1805 = _1757 * _1769;
    float _1807 = _1761 * _1769;
    float _1809 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1789, _1793, _1803);
    float _1815 = -_1795;
    float _1817 = fma(_1765, _1791, _1815);
    float _1819 = -_1791;
    float _1821 = fma(_1765, _1795, _1819);
    float _1823 = _1733 * _1797;
    float _1825 = fma(_1807, _1793, _1801);
    float _1827 = fma(_1817, _1811, _1813);
    float _1829 = fma(_1765, _1777, _1781);
    float _1831 = fma(_1821, _1793, _1823);
    float _1833 = fma(_1805, _1811, _1825);
    float _1835 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1839 = fma(_1829, _1811, _1831);
    float _1841 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1835);
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1837);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1843);
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1851 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1853 = _1031 + _1849;
    float _1855 = _1043 + _1851;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1861 = _1853 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1855 + _1863;
    float _1867 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1857);
    float _1869 = _1861 * _1861;
    float _1871 = _1865 * _1865;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1867);
    float _1875 = _1869 + _1871;
    float _1877 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1879 = sqrt(_1875);
    float _1881 = _1027 + _1877;
    bool _1883 = _1879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = _1839;
    float _1887 = _1877;
    float _1889 = _1871;
    float _1891 = _1853;
    float _1893 = _1855;
    float _1895 = _1833;
    if (!_1883)
    {
        _1885 = _1869;
    }
    float _1897 = _1885;
    float _1899 = _1897;
    if (!_1883)
    {
        _1887 = _1881;
    }
    float _1901 = _1887;
    bool _1903 = !_1883;
    float _1905 = _1901;
    if (!_1903)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1911 = _1879 + _1909;
        float _1913 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1915 = rsqrt(_1875);
        float _1917 = _1911 * _1907;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = _1919 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1919 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = fma(_1923, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1931 = _1915 * _1929;
        float _1933 = _1927 + (-1.0);
        float _1935 = fma(_1861, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1937 = fma(_1865, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1943 = _1935 + _1941;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1947 = _1937 + _1945;
        float _1949 = fma(_1881, _1927, _1939);
        float _1951 = _1943 * _1943;
        float _1953 = _1947 * _1947;
        _1905 = _1949;
        _1899 = _1951;
        _1889 = _1953;
        _1891 = _1935;
        _1893 = _1937;
        _1895 = _1947;
    }
    float _1955 = _1905;
    float _1957 = _1899;
    float _1959 = _1889;
    float _1961 = _1891;
    float _1963 = _1893;
    float _1965 = _1895;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1969 = _1955 + _1967;
    float _1971 = fma(_1969, _1969, _1957);
    float _1973 = _1971 + _1959;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1979 = isnan(_1975);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1985 = _1981 || _1983;
    float _1987 = _1969;
    float _1989 = _1965;
    if (!_1985)
    {
        _1987 = 1.0;
    }
    float _1991 = _1987;
    bool _1993 = !_1985;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1975);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1975 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1975);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1975 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1955 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1961 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1963 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1027;
    float _2077 = _2075 + _2069;
    float _2079 = -_1031;
    float _2081 = _2079 + _2071;
    float _2083 = -_1043;
    float _2085 = _2083 + _2073;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = sqrt(_2091);
    bool _2095 = _2093 > 0.0;
    bool _2097 = !_2095;
    float _2099 = _2059;
    float _2101 = _2069;
    float _2103 = _2071;
    float _2105 = _2073;
    if (!_2097)
    {
        bool _2107 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2109 = _2093;
        if (_2107)
        {
            float _2111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2109 = _2111;
        }
        float _2113 = _2109;
        float _2115 = _2113;
        if (_2107)
        {
            float _2117 = _411 * _2113;
            _1989 = _2117;
        }
        float _2119 = _1989;
        float _2121 = _2119;
        if (_2107)
        {
            float _2123 = _413 * _2113;
            _2099 = _2123;
        }
        float _2125 = _2099;
        float _2127 = _2125;
        if (_2107)
        {
            float _2129 = _415 * _2113;
            _2115 = _2129;
        }
        float _2131 = _2115;
        float _2133 = _2131;
        float _2135 = _2131;
        if (!_2107)
        {
            float _2137 = _123 + 1.0;
            float _2139 = _2137;
            if (!_157)
            {
                float _2141 = _2137 * _2137;
                float _2143 = _2141 * 0.5;
                _2133 = _2143;
            }
            float _2145 = _2133;
            float _2147 = _2145;
            if (!_157)
            {
                float _2149 = _2145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2147 = _2149;
            }
            float _2151 = _2147;
            bool _2153 = !_157;
            float _2155 = _2151;
            if (!_2153)
            {
                float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2159 = log2(_2157);
                float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2163 = _2161 + 1.0;
                float _2165 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2167 = _2159 * _2137;
                float _2169 = 1.0 / _2163;
                float _2171 = _2165 * 0.693147182464599609375;
                float _2173 = exp2(_2167);
                float _2175 = 1.0 / _2171;
                float _2177 = _2173 + (-1.0);
                float _2179 = -_2177;
                float _2181 = fma(_2179, _2175, _2137);
                float _2183 = _2181 * _2169;
                float _2185 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2155 = _2185;
            }
            float _2187 = _2155;
            float _2189 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2191 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2193 = !_157;
            if (!_2193)
            {
                float _2195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2197 = log2(_2195);
                float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2201 = _2199 + 1.0;
                float _2203 = 1.0 / _2201;
                float _2205 = _2197 * _2137;
                float _2207 = exp2(_2205);
                float _2209 = -_2207;
                float _2211 = _2209 + 1.0;
                float _2213 = _2211 * _2203;
                _2139 = _2213;
            }
            float _2215 = _2139;
            float _2217 = fma(_2215, _161, _2191);
            float _2219 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2221 = fma(_2215, _159, _2189);
            float _2223 = -_373;
            float _2225 = _2223 + _2217;
            float _2227 = fma(_2215, _163, _2219);
            float _2229 = -_375;
            float _2231 = _2229 + _2221;
            float _2233 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2235 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2237 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2239 = -_377;
            float _2241 = _2239 + _2227;
            float _2243 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2233);
            float _2245 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2235);
            float _2247 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2237);
            float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2243);
            float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2245);
            float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2247);
            _419 = _2251;
            _421 = _2249;
            _423 = _2253;
            _2121 = _2249;
            _2127 = _2251;
            _2135 = _2253;
        }
        float _2255 = _419;
        float _2257 = _421;
        float _2259 = _423;
        float _2261 = _2121;
        float _2263 = _2127;
        float _2265 = _2135;
        float _2267 = _2255 * _2255;
        float _2269 = rsqrt(_2091);
        float _2271 = fma(_2257, _2257, _2267);
        float _2273 = fma(_2259, _2259, _2271);
        float _2275 = sqrt(_2273);
        float _2277 = _2081 * _2269;
        float _2279 = _2077 * _2269;
        float _2281 = _2085 * _2269;
        bool _2283 = _2275 > 0.0;
        bool _2285 = !_2283;
        if (!_2285)
        {
            float _2287 = rsqrt(_2273);
            float _2289 = _2287 * _2255;
            float _2291 = _2287 * _2257;
            float _2293 = _2287 * _2259;
            float _2295 = _2279 * _2289;
            float _2297 = fma(_2277, _2291, _2295);
            float _2299 = fma(_2281, _2293, _2297);
            float _2301 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2303 = fma(_2261, _2301, _2071);
            float _2305 = fma(_2263, _2301, _2069);
            float _2307 = fma(_2265, _2301, _2073);
            _2101 = _2305;
            _2103 = _2303;
            _2105 = _2307;
        }
    }
    float _2309 = _2101;
    float _2311 = _2103;
    float _2313 = _2105;
    float _2315 = -_1623;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2309);
    float _2319 = -_1627;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2311);
    float _2323 = -_1655;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2313);
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2317 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2321 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2333 * _2349;
    float _2353 = _2337 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2345;
    float _2371 = _2367;
    float _2373 = _2329;
    float _2375 = _2349;
    if (_2363)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2377;
    }
    float _2379 = _2369;
    float _2381 = _2379;
    if (_2363)
    {
        float _2383 = _2367 * _2379;
        _2371 = _2383;
    }
    float _2385 = _2371;
    if (_2363)
    {
        float _2387 = rsqrt(_2359);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = _2389;
    if (_2363)
    {
        float _2393 = _2385 * 0.15915493667125701904296875;
        _1629 = _2393;
    }
    float _2395 = _1629;
    float _2397 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2399 = _2337;
    float _2401 = _2395;
    if (_2363)
    {
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = precise::max(0.0, _2397);
    float _2411 = _2091;
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2395 * 6.283185482025146484375;
        float _2417 = cos(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    float _2421 = -_2349;
    float _2423 = -_2409;
    float _2425 = fma(_2329, _2421, _2423);
    if (_2363)
    {
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2373 = _2427;
    }
    float _2429 = _2373;
    float _2431 = _2407;
    float _2433 = _2429;
    if (_2363)
    {
        float _2435 = fma(_2407, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (!_2363)
    {
        _2433 = _2425;
    }
    float _2441 = _2433;
    float _2443 = _2441;
    if (_2363)
    {
        float _2445 = _2389 * _2437;
        _2375 = _2445;
    }
    float _2447 = _2375;
    if (!_2363)
    {
        _2391 = _2351;
    }
    float _2449 = _2391;
    float _2451 = _2449;
    float _2453 = _2419;
    if (_2363)
    {
        float _2455 = _2419 + (-1.0);
        _2413 = _2455;
    }
    float _2457 = _2413;
    float _2459 = _2457;
    if (_2363)
    {
        float _2461 = _2351 * _2447;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (!_2363)
    {
        _2439 = _2355;
    }
    float _2465 = _2439;
    float _2467 = _2465;
    if (_2363)
    {
        float _2469 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2469;
    }
    float _2471 = _2401;
    if (!_2363)
    {
        _2459 = _2353;
    }
    float _2473 = _2459;
    float _2475 = _2473;
    if (_2363)
    {
        float _2477 = _2353 * _2447;
        _2475 = _2477;
    }
    float _2479 = _2475;
    if (_2363)
    {
        float _2481 = _2463 * _2463;
        _2467 = _2481;
    }
    float _2483 = _2467;
    if (_2363)
    {
        float _2485 = fma(_2425, _2419, _2471);
        _2443 = _2485;
    }
    float _2487 = _2443;
    if (!_2363)
    {
        _2453 = _2357;
    }
    float _2489 = _2453;
    float _2491 = _2489;
    if (_2363)
    {
        float _2493 = _2479 * _2479;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = fma(_2487, _2487, _2483);
    float _2499 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2501 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2503 = _2497 + _2495;
    float _2505 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2499);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2509 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2507);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2515 = rsqrt(_2503);
    float _2517 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2519 = -_2511;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2513);
    float _2525 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2527 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2529 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2501);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2523);
    float _2533 = abs(_2521);
    float _2535 = log2(_2533);
    float _2537 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2525);
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2541 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2543 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2537);
    float _2547 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2529);
    float _2549 = _2515 * _2463;
    float _2551 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2553 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2555 = -_2543;
    float _2557 = fma(_2555, _2539, 1.0);
    float _2559 = _2515 * _2487;
    float _2561 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2553);
    float _2565 = _2515 * _2479;
    float _2567 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = -_2561;
    float _2571 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2569);
    float _2573 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2563);
    float _2577 = log2(_2557);
    float _2579 = -_2565;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2571);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2585 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2575);
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2589 = fma(_2581, -0.5, 0.5);
    float _2591 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2583);
    float _2593 = _2559 + 1.0;
    float _2595 = exp2(_2567);
    float _2597 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2587);
    float _2599 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2591);
    float _2601 = fma(_2581, 0.5, 0.5);
    float _2603 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2597);
    float _2605 = fma(_2601, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = 1.0 / _2585;
    float _2609 = fma(_2601, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2601, _2609, 1.570728778839111328125);
    float _2613 = sqrt(_2589);
    float _2615 = -_2559;
    float _2617 = fma(_2595, _2593, _2615);
    float _2619 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2599);
    float _2621 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2603);
    float _2623 = _2577 * 0.693147182464599609375;
    float _2625 = _2619 * _2607;
    float _2627 = _2621 * _2607;
    float _2629 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = fma(_2627, -0.5, 0.5);
    float _2635 = fma(_2617, 0.5, 0.5);
    float _2637 = _2613 * 0.636619746685028076171875;
    float3 _6795 = float3(_2631, _2633, _2629);
    float _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6795, float3(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6795, float3(0.0), isnan(_6795)), level(0.0)).x;
    float _2641 = -_2611;
    float _2643 = fma(_2637, _2641, 1.0);
    float3 _6811 = float3(_2631, _2633, _2629);
    float4 _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2648 = _2646.x;
    float _2650 = _2646.y;
    float _2652 = _2646.z;
    float _2654 = _2646.w;
    float2 _6828 = float2(_2643, _2635);
    float3 _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6828, float2(0.0), isnan(_6828)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6828, float2(0.0), isnan(_6828)), level(0.0)).xyz;
    float _2660 = _2658.x;
    float _2662 = _2658.y;
    float _2664 = _2658.z;
    float _2666 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2668 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2670 = _2619 + _2585;
    float _2672 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2666);
    float _2674 = _2670 * 0.5;
    float _2676 = exp2(_2668);
    float _2678 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2680 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2678);
    float _2682 = _2585 * 0.5;
    float _2684 = _2680 + _2585;
    float _2686 = -_2676;
    float _2688 = _2686 + 1.0;
    float _2690 = fma(_2621, -0.5, _2682);
    float _2692 = _2684 * 0.5;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2619;
    out.gl_Position.y = _2621;
    out.gl_Position.z = _2680;
    out.gl_Position.w = _2585;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2674;
    out.m_68.y = _2690;
    out.m_68.z = _2692;
    out.m_68.w = _2585;
    out.m_47.x = _2696;
    float _2698 = _2694 * _2639;
    float _2700 = -_2694;
    float _2702 = _2700 + 1.0;
    float _2704 = _2654 * _2698;
    float _2706 = _2664 * _2698;
    float _2708 = fma(_2660, _2704, _2648);
    float _2710 = fma(_2662, _2704, _2650);
    float _2712 = _2654 * _2702;
    float _2714 = fma(_2654, _2706, _2652);
    out.m_70.x = _2708;
    out.m_70.y = _2710;
    out.m_70.z = _2714;
    out.m_70.w = _2712;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _817 = false;
    bool _667 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2771 = as_type<float>(_105);
        out.gl_Position.z = _2771;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2840 = as_type<float>(_141);
        out.gl_Position.z = _2840;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = _143;
    if (!_203)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _239;
        _207 = _223;
        _209 = _229;
    }
    float _241 = _205;
    float _243 = _207;
    float _245 = _209;
    bool _247 = !_157;
    float _249 = _245;
    float _251 = _243;
    float _253 = _241;
    if (!_247)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _173 = _273;
        _249 = _261;
    }
    float _275 = _173;
    float _277 = _249;
    float _279 = _277;
    if (!_157)
    {
        float _281 = _123 * _123;
        float _283 = _281 * 0.5;
        _251 = _283;
    }
    float _285 = _251;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _279 = _123;
    }
    float _293 = _279;
    float _295 = fma(_275, _159, _287);
    float _297 = fma(_275, _161, _289);
    float _299 = _293;
    if (!_157)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_157;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _123 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _123);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_157;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _123 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _161, _365);
    float _375 = fma(_363, _159, _367);
    float _377 = fma(_363, _163, _369);
    float _379 = fma(_297, _147, _167);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_275, _163, _291);
    float _387 = fma(_295, _147, _165);
    float _389 = -_375;
    float _391 = _295 + _389;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -_377;
    float _401 = _385 + _399;
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _409 = fma(_385, _147, _169);
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _413 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_56.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_89);
        float _447 = 1.0 / _445;
        float _449 = _123 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_54.x;
    float _459 = in.m_54.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_451);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = 1.0 / _475;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _501 = _487 * _491;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _455 * _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    float _513 = fma(_495, _507, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _513 * _501;
    float _519 = _515 * _501;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_499;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _123 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_577;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _599;
    float _603 = 1.0 / _581;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _607 = _593 * _597;
    float _609 = -_593;
    float _611 = _609 + 1.0;
    float _613 = _565 * _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _615;
    float _619 = fma(_601, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _621;
    float _625 = fma(_617, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _627 = _619 * _607;
    float _629 = fma(_623, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = _625 * _607;
    float _633 = _629 * _607;
    float _635 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _637 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _639 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _641 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].x, _635);
    float _643 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].y, _637);
    float _645 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].z, _639);
    bool _647 = !_605;
    float _665;
    if (!_647)
    {
        float _649 = in.m_56.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_89);
        float _671 = 1.0 / _669;
        float _673 = _123 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _675 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _685 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _687 = isnan(_675);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _701 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _703 = isnan(_675);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _713;
    bool _717 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _719 = isnan(_675);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _683;
    float _731 = -_695;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _737 = 1.0 / _699;
    float _739 = _715 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _751 = _711 * _733;
    float _753 = -_711;
    float _755 = _753 + 1.0;
    float _757 = _695 * _747;
    float _759 = _743 * _737;
    float _761 = _749 * _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = _675 + _763;
    float _767 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _769 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[115].x, _761);
    float _773 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_773, _757, _771);
    float _781 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[117].x, _779);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _777;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _787;
    bool _789 = !_735;
    float _813;
    float _815;
    if (!_789)
    {
        float _791 = in.m_56.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _795 = float(_89);
        float _797 = 1.0 / _795;
        float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _801 = _123 * _797;
        float _803 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _805 = _803 * _793;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _801;
        _815 = _811;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _813 = _823;
        _815 = _823;
    }
    _817 = false;
    float _825 = _813;
    float _827 = _815;
    float _829 = in.m_56.x;
    float _831 = in.m_56.y;
    float _833 = in.m_56.z;
    float _835 = in.m_56.w;
    float _837 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _851 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    float _853 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _857 = _855 != 0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _865 = _863 != 0;
    float _867 = 1.0 / _845;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _879 = _877 != 0;
    float _881 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _885 = _825 + _883;
    float _887 = 1.0 / _849;
    bool _889 = _835 > 0.5;
    float _891 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _897 = _829 > 0.5;
    float _899 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _901 = -_201;
    int _903 = _889 ? as_type<int>(_901) : as_type<int>(_201);
    float _905 = 1.0 / _861;
    bool _907 = _831 > 0.5;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = -_197;
    int _913 = _897 ? as_type<int>(_911) : as_type<int>(_197);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _919 = 1.0 / _875;
    float _921 = -_909;
    float _923 = fma(_899, 2.0, _921);
    float _925 = -_201;
    int _927 = _907 ? as_type<int>(_925) : as_type<int>(_201);
    float _929 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _891);
    bool _931 = !_857;
    float _933 = _931 ? _197 : as_type<float>(_913);
    float _935 = _833 * 2.0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _943 = _941 != 0;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _947 = _945 != 0;
    float _949 = 1.0 / _895;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = _827 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _963 = fma(_917, -2.0, _915);
    float _965 = _953 * _867;
    float _967 = _957 * _887;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _973;
    float _977 = floor(_935);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _987 = _975 * _905;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _989;
    float _993 = _981 * _919;
    float _995 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _997 = _829 * 2.0;
    float _999 = 1.0 / _961;
    float _1001 = _991 * _949;
    bool _1003 = !_865;
    float _1005 = _1003 ? _201 : as_type<float>(_927);
    float _1007 = _831 * 2.0;
    bool _1009 = _833 > 0.5;
    float _1011 = _831 + _829;
    bool _1013 = !_879;
    float _1015 = _1013 ? _201 : as_type<float>(_903);
    float _1017 = -_123;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1021 = 1.0 / _985;
    float _1023 = -_197;
    int _1025 = _1009 ? as_type<int>(_1023) : as_type<int>(_197);
    float _1027 = _853 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1029 = _977 > 0.0;
    float _1031 = _929 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _977 >= 0.0;
    bool _1035 = isnan(_977);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    float _1043 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = floor(_997);
    float _1047 = _971 * _999;
    float _1049 = _831 + _833;
    int _1051 = _1041 ? 0 : 1;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1057 = !_871;
    float _1059 = _1057 ? _197 : as_type<float>(_1025);
    float _1061 = floor(_1007);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = _1049 + (-1.0);
    float _1069 = _1011 + (-1.0);
    float _1071 = _1065 * _1021;
    float _1073 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1075 = 1.0 / _1055;
    bool _1077 = _1045 > 0.0;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1081 = _1045 >= 0.0;
    bool _1083 = isnan(_1045);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1093 = _825 + _1091;
    int _1095 = ~_1051;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1047, _885, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1103 = _1099;
    if (!_1029)
    {
        int _1105 = ~_1051;
        int _1107 = _1105 + 1;
        _1103 = _1107;
    }
    int _1109 = _1103;
    float _1111 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1113 = log2(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1115;
    int _1119 = _1089 ? 0 : 1;
    float _1121 = fma(_967, _1093, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1123 = _1061 > 0.0;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1127 = _825 + _1125;
    bool _1129 = _1061 >= 0.0;
    bool _1131 = isnan(_1061);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.0);
    bool _1137 = _1133 || _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1141 = _825 + _1139;
    float _1143 = _1117 * _1075;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = fma(_987, _1141, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1151 = _825 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1153;
    float _1157 = _123 * _1113;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1167;
    float _1171 = fma(_1155, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1173 = fma(_1071, _1127, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1175 = fma(_1165, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1177 = fma(_1143, _1151, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1179 = exp2(_1157);
    float _1181 = fma(_1169, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1183 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _933 + 0.5;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1189 = _825 + _1187;
    float _1191 = _1005 + (-0.5);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1195 = _825 + _1193;
    float _1197 = fma(_1183, _1185, _1019);
    float _1199 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1201 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1203 = isnan(_825);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = fma(_1001, _1189, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1215 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1217 = isnan(_825);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1199;
    float _1229 = -_1161;
    float _1231 = fma(_1227, _1191, _1229);
    bool _1233 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1235 = isnan(_825);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = -_1211;
    float _1247 = _1245 + 1.0;
    float _1249 = fma(_993, _1195, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1251 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1253 = isnan(_827);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = -_1179;
    float _1265 = _1263 + 1.0;
    bool _1267 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_827);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = _1225 * _1247;
    float _1281 = -_1225;
    float _1283 = _1281 + 1.0;
    int _1285 = _1137 ? 0 : 1;
    float _1287 = -_1243;
    float _1289 = _1287 + 1.0;
    bool _1291 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1293 = isnan(_825);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = _1243 * _1283;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    float _1319 = _1301 * _1289;
    bool _1321 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1323 = isnan(_825);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1301;
    float _1335 = _1333 + 1.0;
    float _1337 = _1313 ? _1265 : 0.0;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = _1331 * _1335;
    bool _1355 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1357 = isnan(_825);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -_1331;
    float _1369 = _1367 + 1.0;
    bool _1371 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_825);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = _1261 * _1317;
    float _1385 = -_1365;
    float _1387 = _1385 + 1.0;
    float _1389 = _1365 * _1369;
    float _1391 = _1171 * _1383;
    bool _1393 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1395 = isnan(_825);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1381 * _1387;
    float _1407 = -_1381;
    float _1409 = _1407 + 1.0;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = _1175 * _1383;
    float _1415 = _1181 * _1383;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = _1403 * _1409;
    float _1421 = 1.0 / _1341;
    float _1423 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    float _1425 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1427 = _1121 * _1419;
    float _1429 = _1059 + 0.5;
    float _1431 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1423);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1425);
    float _1435 = float(_1109);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1439 = -_1431;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -_1441;
    float _1449 = fma(_933, _1447, _1197);
    float _1451 = -_1403;
    float _1453 = _1451 + 1.0;
    float _1455 = fma(_1005, _1445, _1231);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1459 = -_1261;
    float _1461 = _1459 + 1.0;
    float _1463 = _1337 * _1421;
    float _1465 = -_1015;
    float _1467 = _1465 + 0.5;
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1427);
    float _1471 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1391);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1413);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1415);
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1481 = fma(_1101, _1405, _1469);
    bool _1483 = !_939;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1471 * _1437;
    float _1489 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1475);
    int _1491 = ~_1285;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    float _1497 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1473);
    float _1499 = _1479 * _1457;
    int _1501 = abs(_1485);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1027 + _1503;
    int _1507 = _1495;
    float _1509 = _1173;
    if (!_1123)
    {
        int _1511 = ~_1285;
        int _1513 = _1511 + 1;
        _1507 = _1513;
    }
    int _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1031 + _1517;
    out.m_60.x = _1449;
    out.m_60.y = _1455;
    out.m_60.z = _1487;
    out.m_60.w = _1499;
    float _1521 = fma(_1147, _1389, _1481);
    float _1523 = _1505 * _1505;
    float _1525 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1477);
    float _1527 = float(_1501);
    bool _1529 = !_943;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = ~_1119;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = _1527 * _1435;
    int _1541 = abs(_1531);
    float _1543 = fma(_1249, _1353, _1521);
    int _1545 = _1537;
    if (!_1077)
    {
        int _1547 = ~_1119;
        int _1549 = _1547 + 1;
        _1545 = _1549;
    }
    int _1551 = _1545;
    float _1553 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1043 + _1557;
    float _1561 = fma(_1213, _1319, _1543);
    float _1563 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1555);
    float _1565 = float(_1551);
    float _1567 = in.m_62.x;
    float _1569 = in.m_62.y;
    float _1571 = in.m_62.z;
    float _1573 = float(_1541);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1563);
    float _1577 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1581 = _1539 * (-2.0);
    float _1583 = _1573 * _1565;
    bool _1585 = _1575 >= 0.0;
    float _1587 = fma(_1519, _1519, _1523);
    float _1589 = fma(_1173, _1303, _1561);
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1595 = fma(_1559, _1559, _1587);
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1073, _1581, _1073);
    float _1601 = fma(_1177, _1279, _1589);
    float _1603 = rsqrt(_1595);
    out.m_64.x = _1591;
    out.m_64.y = _1593;
    out.m_64.z = _1597;
    float _1605 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1601);
    if (_1585)
    {
        _1509 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1607 = _1509;
    int _1609 = as_type<int>(_1607);
    if (_1585)
    {
        out.m_47.x = 0.0;
    }
    float _1611 = fma(_1581, _1567, _1567);
    float _1613 = _1583 * (-2.0);
    if (_1585)
    {
        float _1615 = _1607 * 5.0;
        _1609 = as_type<int>(_1615);
    }
    int _1617 = _1609;
    out.m_66.x = _1605;
    float _1619 = fma(_1079, _1613, _1079);
    float _1621 = fma(_1613, _1569, _1569);
    float _1623 = _1505 * _1603;
    float _1625 = _829 + (-0.5);
    float _1627 = _1519 * _1603;
    float _1629 = _1627;
    if (_1585)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5160 = as_type<float>(_1617);
        out.gl_Position.z = _5160;
    }
    float _1631 = -_1623;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    bool _1637 = !_947;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = -_1627;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1645 = _1633 * _1633;
    if (_1585)
    {
        return out;
    }
    float _1647 = -_1623;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1651 = -_1627;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1655 = _1559 * _1603;
    int _1657 = abs(_1639);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1649 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1653 + _1663;
    float _1667 = fma(_1643, _1643, _1645);
    float _1669 = -_1655;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1675 = float(_1515);
    float _1677 = _833 + _829;
    float _1679 = fma(_1671, _1671, _1667);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1673);
    float _1683 = -_1655;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1687 = _831 + (-0.5);
    bool _1689 = !_1351;
    float _1691 = _1689 ? _123 : _1463;
    float _1693 = _1677 + (-1.0);
    float _1695 = float(_1657);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1699 = _1685 + _1697;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1621);
    float _1703 = _833 + (-0.5);
    float _1705 = fma(_1691, _1599, _1635);
    float _1707 = _1695 * _1675;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1681);
    float _1711 = fma(_1691, _1619, _1701);
    float _1713 = _1707 * (-2.0);
    float _1715 = sqrt(_1679);
    float _1717 = _1711 * 0.15915493667125701904296875;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1723 = fma(_1713, _1571, _1571);
    float _1725 = _1705 * 0.15915493667125701904296875;
    float _1727 = fma(_1721, _1713, _1721);
    float _1729 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1723);
    float _1731 = _1725 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1691, _1727, _1729);
    float _1737 = _1703;
    if (_1719)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1739 = _1737;
    float _1741 = _1735 * 0.15915493667125701904296875;
    float _1743 = _1725 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    int _1747 = as_type<int>(_1739);
    if (_1719)
    {
        out.m_47.x = 0.0;
    }
    float _1749 = _1603 * _1715;
    if (_1719)
    {
        float _1751 = _1739 * 5.0;
        _1747 = as_type<int>(_1751);
    }
    int _1753 = _1747;
    float _1755 = _1717 * 6.283185482025146484375;
    float _1757 = sin(_1755);
    if (_1719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1753);
        out.gl_Position.z = _5380;
    }
    float _1759 = _1717 * 6.283185482025146484375;
    float _1761 = cos(_1759);
    float _1763 = _1741 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    if (_1719)
    {
        return out;
    }
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = cos(_1767);
    float _1771 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1775 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1777 = _1733 * _1757;
    float _1779 = _1749 * _1771;
    float _1781 = _1745 * _1761;
    float _1783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1785 = _1749 * _1775;
    float _1787 = _1773 * _1779;
    float _1789 = fma(_1765, _1781, _1777);
    float _1791 = _1745 * _1757;
    float _1793 = _1783 * _1785;
    float _1795 = _1733 * _1761;
    float _1797 = _1769 * _1787;
    float _1799 = -_1787;
    float _1801 = _1765 * _1799;
    float _1803 = _1745 * _1797;
    float _1805 = _1757 * _1769;
    float _1807 = _1761 * _1769;
    float _1809 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1789, _1793, _1803);
    float _1815 = -_1795;
    float _1817 = fma(_1765, _1791, _1815);
    float _1819 = -_1791;
    float _1821 = fma(_1765, _1795, _1819);
    float _1823 = _1733 * _1797;
    float _1825 = fma(_1807, _1793, _1801);
    float _1827 = fma(_1817, _1811, _1813);
    float _1829 = fma(_1765, _1777, _1781);
    float _1831 = fma(_1821, _1793, _1823);
    float _1833 = fma(_1805, _1811, _1825);
    float _1835 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1839 = fma(_1829, _1811, _1831);
    float _1841 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1835);
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1837);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1843);
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1851 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1853 = _1031 + _1849;
    float _1855 = _1043 + _1851;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1861 = _1853 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1855 + _1863;
    float _1867 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1857);
    float _1869 = _1861 * _1861;
    float _1871 = _1865 * _1865;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1867);
    float _1875 = _1869 + _1871;
    float _1877 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1879 = sqrt(_1875);
    float _1881 = _1027 + _1877;
    bool _1883 = _1879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = _1839;
    float _1887 = _1877;
    float _1889 = _1871;
    float _1891 = _1853;
    float _1893 = _1855;
    float _1895 = _1833;
    if (!_1883)
    {
        _1885 = _1869;
    }
    float _1897 = _1885;
    float _1899 = _1897;
    if (!_1883)
    {
        _1887 = _1881;
    }
    float _1901 = _1887;
    bool _1903 = !_1883;
    float _1905 = _1901;
    if (!_1903)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1911 = _1879 + _1909;
        float _1913 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1915 = rsqrt(_1875);
        float _1917 = _1911 * _1907;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = _1919 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1919 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = fma(_1923, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1931 = _1915 * _1929;
        float _1933 = _1927 + (-1.0);
        float _1935 = fma(_1861, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1937 = fma(_1865, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1943 = _1935 + _1941;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1947 = _1937 + _1945;
        float _1949 = fma(_1881, _1927, _1939);
        float _1951 = _1943 * _1943;
        float _1953 = _1947 * _1947;
        _1905 = _1949;
        _1899 = _1951;
        _1889 = _1953;
        _1891 = _1935;
        _1893 = _1937;
        _1895 = _1947;
    }
    float _1955 = _1905;
    float _1957 = _1899;
    float _1959 = _1889;
    float _1961 = _1891;
    float _1963 = _1893;
    float _1965 = _1895;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1969 = _1955 + _1967;
    float _1971 = fma(_1969, _1969, _1957);
    float _1973 = _1971 + _1959;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1979 = isnan(_1975);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1985 = _1981 || _1983;
    float _1987 = _1969;
    float _1989 = _1965;
    if (!_1985)
    {
        _1987 = 1.0;
    }
    float _1991 = _1987;
    bool _1993 = !_1985;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1975);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1975 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1975);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1975 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1955 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1961 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1963 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1027;
    float _2077 = _2075 + _2069;
    float _2079 = -_1031;
    float _2081 = _2079 + _2071;
    float _2083 = -_1043;
    float _2085 = _2083 + _2073;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = sqrt(_2091);
    bool _2095 = _2093 > 0.0;
    bool _2097 = !_2095;
    float _2099 = _2059;
    float _2101 = _2069;
    float _2103 = _2071;
    float _2105 = _2073;
    if (!_2097)
    {
        bool _2107 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2109 = _2093;
        if (_2107)
        {
            float _2111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2109 = _2111;
        }
        float _2113 = _2109;
        float _2115 = _2113;
        if (_2107)
        {
            float _2117 = _411 * _2113;
            _1989 = _2117;
        }
        float _2119 = _1989;
        float _2121 = _2119;
        if (_2107)
        {
            float _2123 = _413 * _2113;
            _2099 = _2123;
        }
        float _2125 = _2099;
        float _2127 = _2125;
        if (_2107)
        {
            float _2129 = _415 * _2113;
            _2115 = _2129;
        }
        float _2131 = _2115;
        float _2133 = _2131;
        float _2135 = _2131;
        if (!_2107)
        {
            float _2137 = _123 + 1.0;
            float _2139 = _2137;
            if (!_157)
            {
                float _2141 = _2137 * _2137;
                float _2143 = _2141 * 0.5;
                _2133 = _2143;
            }
            float _2145 = _2133;
            float _2147 = _2145;
            if (!_157)
            {
                float _2149 = _2145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2147 = _2149;
            }
            float _2151 = _2147;
            bool _2153 = !_157;
            float _2155 = _2151;
            if (!_2153)
            {
                float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2159 = log2(_2157);
                float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2163 = _2161 + 1.0;
                float _2165 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2167 = _2159 * _2137;
                float _2169 = 1.0 / _2163;
                float _2171 = _2165 * 0.693147182464599609375;
                float _2173 = exp2(_2167);
                float _2175 = 1.0 / _2171;
                float _2177 = _2173 + (-1.0);
                float _2179 = -_2177;
                float _2181 = fma(_2179, _2175, _2137);
                float _2183 = _2181 * _2169;
                float _2185 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2155 = _2185;
            }
            float _2187 = _2155;
            float _2189 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2191 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2193 = !_157;
            if (!_2193)
            {
                float _2195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2197 = log2(_2195);
                float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2201 = _2199 + 1.0;
                float _2203 = 1.0 / _2201;
                float _2205 = _2197 * _2137;
                float _2207 = exp2(_2205);
                float _2209 = -_2207;
                float _2211 = _2209 + 1.0;
                float _2213 = _2211 * _2203;
                _2139 = _2213;
            }
            float _2215 = _2139;
            float _2217 = fma(_2215, _161, _2191);
            float _2219 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2221 = fma(_2215, _159, _2189);
            float _2223 = -_373;
            float _2225 = _2223 + _2217;
            float _2227 = fma(_2215, _163, _2219);
            float _2229 = -_375;
            float _2231 = _2229 + _2221;
            float _2233 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2235 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2237 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2239 = -_377;
            float _2241 = _2239 + _2227;
            float _2243 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2233);
            float _2245 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2235);
            float _2247 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2237);
            float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2243);
            float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2245);
            float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2247);
            _419 = _2251;
            _421 = _2249;
            _423 = _2253;
            _2121 = _2249;
            _2127 = _2251;
            _2135 = _2253;
        }
        float _2255 = _419;
        float _2257 = _421;
        float _2259 = _423;
        float _2261 = _2121;
        float _2263 = _2127;
        float _2265 = _2135;
        float _2267 = _2255 * _2255;
        float _2269 = rsqrt(_2091);
        float _2271 = fma(_2257, _2257, _2267);
        float _2273 = fma(_2259, _2259, _2271);
        float _2275 = sqrt(_2273);
        float _2277 = _2081 * _2269;
        float _2279 = _2077 * _2269;
        float _2281 = _2085 * _2269;
        bool _2283 = _2275 > 0.0;
        bool _2285 = !_2283;
        if (!_2285)
        {
            float _2287 = rsqrt(_2273);
            float _2289 = _2287 * _2255;
            float _2291 = _2287 * _2257;
            float _2293 = _2287 * _2259;
            float _2295 = _2279 * _2289;
            float _2297 = fma(_2277, _2291, _2295);
            float _2299 = fma(_2281, _2293, _2297);
            float _2301 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2303 = fma(_2261, _2301, _2071);
            float _2305 = fma(_2263, _2301, _2069);
            float _2307 = fma(_2265, _2301, _2073);
            _2101 = _2305;
            _2103 = _2303;
            _2105 = _2307;
        }
    }
    float _2309 = _2101;
    float _2311 = _2103;
    float _2313 = _2105;
    float _2315 = -_1623;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2309);
    float _2319 = -_1627;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2311);
    float _2323 = -_1655;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2313);
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2317 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2321 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2333 * _2349;
    float _2353 = _2337 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2345;
    float _2371 = _2367;
    float _2373 = _2329;
    float _2375 = _2349;
    if (_2363)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2377;
    }
    float _2379 = _2369;
    float _2381 = _2379;
    if (_2363)
    {
        float _2383 = _2367 * _2379;
        _2371 = _2383;
    }
    float _2385 = _2371;
    if (_2363)
    {
        float _2387 = rsqrt(_2359);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = _2389;
    if (_2363)
    {
        float _2393 = _2385 * 0.15915493667125701904296875;
        _1629 = _2393;
    }
    float _2395 = _1629;
    float _2397 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2399 = _2337;
    float _2401 = _2395;
    if (_2363)
    {
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = precise::max(0.0, _2397);
    float _2411 = _2091;
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2395 * 6.283185482025146484375;
        float _2417 = cos(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    float _2421 = -_2349;
    float _2423 = -_2409;
    float _2425 = fma(_2329, _2421, _2423);
    if (_2363)
    {
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2373 = _2427;
    }
    float _2429 = _2373;
    float _2431 = _2407;
    float _2433 = _2429;
    if (_2363)
    {
        float _2435 = fma(_2407, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (!_2363)
    {
        _2433 = _2425;
    }
    float _2441 = _2433;
    float _2443 = _2441;
    if (_2363)
    {
        float _2445 = _2389 * _2437;
        _2375 = _2445;
    }
    float _2447 = _2375;
    if (!_2363)
    {
        _2391 = _2351;
    }
    float _2449 = _2391;
    float _2451 = _2449;
    float _2453 = _2419;
    if (_2363)
    {
        float _2455 = _2419 + (-1.0);
        _2413 = _2455;
    }
    float _2457 = _2413;
    float _2459 = _2457;
    if (_2363)
    {
        float _2461 = _2351 * _2447;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (!_2363)
    {
        _2439 = _2355;
    }
    float _2465 = _2439;
    float _2467 = _2465;
    if (_2363)
    {
        float _2469 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2469;
    }
    float _2471 = _2401;
    if (!_2363)
    {
        _2459 = _2353;
    }
    float _2473 = _2459;
    float _2475 = _2473;
    if (_2363)
    {
        float _2477 = _2353 * _2447;
        _2475 = _2477;
    }
    float _2479 = _2475;
    if (_2363)
    {
        float _2481 = _2463 * _2463;
        _2467 = _2481;
    }
    float _2483 = _2467;
    if (_2363)
    {
        float _2485 = fma(_2425, _2419, _2471);
        _2443 = _2485;
    }
    float _2487 = _2443;
    if (!_2363)
    {
        _2453 = _2357;
    }
    float _2489 = _2453;
    float _2491 = _2489;
    if (_2363)
    {
        float _2493 = _2479 * _2479;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = fma(_2487, _2487, _2483);
    float _2499 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2501 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2503 = _2497 + _2495;
    float _2505 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2499);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2509 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2507);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2515 = rsqrt(_2503);
    float _2517 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2519 = -_2511;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2513);
    float _2525 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2527 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2529 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2501);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2523);
    float _2533 = abs(_2521);
    float _2535 = log2(_2533);
    float _2537 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2525);
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2541 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2543 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2537);
    float _2547 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2529);
    float _2549 = _2515 * _2463;
    float _2551 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2553 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2555 = -_2543;
    float _2557 = fma(_2555, _2539, 1.0);
    float _2559 = _2515 * _2487;
    float _2561 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2553);
    float _2565 = _2515 * _2479;
    float _2567 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = -_2561;
    float _2571 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2569);
    float _2573 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2563);
    float _2577 = log2(_2557);
    float _2579 = -_2565;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2571);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2585 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2575);
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2589 = fma(_2581, -0.5, 0.5);
    float _2591 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2583);
    float _2593 = _2559 + 1.0;
    float _2595 = exp2(_2567);
    float _2597 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2587);
    float _2599 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2591);
    float _2601 = fma(_2581, 0.5, 0.5);
    float _2603 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2597);
    float _2605 = fma(_2601, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = 1.0 / _2585;
    float _2609 = fma(_2601, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2601, _2609, 1.570728778839111328125);
    float _2613 = sqrt(_2589);
    float _2615 = -_2559;
    float _2617 = fma(_2595, _2593, _2615);
    float _2619 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2599);
    float _2621 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2603);
    float _2623 = _2577 * 0.693147182464599609375;
    float _2625 = _2619 * _2607;
    float _2627 = _2621 * _2607;
    float _2629 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = fma(_2627, -0.5, 0.5);
    float _2635 = fma(_2617, 0.5, 0.5);
    float _2637 = _2613 * 0.636619746685028076171875;
    float3 _6795 = float3(_2631, _2633, _2629);
    float _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6795, float3(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6795, float3(0.0), isnan(_6795)), level(0.0)).x;
    float _2641 = -_2611;
    float _2643 = fma(_2637, _2641, 1.0);
    float3 _6811 = float3(_2631, _2633, _2629);
    float4 _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2648 = _2646.x;
    float _2650 = _2646.y;
    float _2652 = _2646.z;
    float _2654 = _2646.w;
    float2 _6828 = float2(_2643, _2635);
    float3 _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6828, float2(0.0), isnan(_6828)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6828, float2(0.0), isnan(_6828)), level(0.0)).xyz;
    float _2660 = _2658.x;
    float _2662 = _2658.y;
    float _2664 = _2658.z;
    float _2666 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2668 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2670 = _2619 + _2585;
    float _2672 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2666);
    float _2674 = _2670 * 0.5;
    float _2676 = exp2(_2668);
    float _2678 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2680 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2678);
    float _2682 = _2585 * 0.5;
    float _2684 = _2680 + _2585;
    float _2686 = -_2676;
    float _2688 = _2686 + 1.0;
    float _2690 = fma(_2621, -0.5, _2682);
    float _2692 = _2684 * 0.5;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2619;
    out.gl_Position.y = _2621;
    out.gl_Position.z = _2680;
    out.gl_Position.w = _2585;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2674;
    out.m_68.y = _2690;
    out.m_68.z = _2692;
    out.m_68.w = _2585;
    out.m_47.x = _2696;
    float _2698 = _2694 * _2639;
    float _2700 = -_2694;
    float _2702 = _2700 + 1.0;
    float _2704 = _2654 * _2698;
    float _2706 = _2664 * _2698;
    float _2708 = fma(_2660, _2704, _2648);
    float _2710 = fma(_2662, _2704, _2650);
    float _2712 = _2654 * _2702;
    float _2714 = fma(_2654, _2706, _2652);
    out.m_70.x = _2708;
    out.m_70.y = _2710;
    out.m_70.z = _2714;
    out.m_70.w = _2712;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _817 = false;
    bool _667 = false;
    bool _553 = false;
    bool _443 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2771 = as_type<float>(_105);
        out.gl_Position.z = _2771;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2840 = as_type<float>(_141);
        out.gl_Position.z = _2840;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    float _207 = 0.0;
    float _209 = _143;
    if (!_203)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _239;
        _207 = _223;
        _209 = _229;
    }
    float _241 = _205;
    float _243 = _207;
    float _245 = _209;
    bool _247 = !_157;
    float _249 = _245;
    float _251 = _243;
    float _253 = _241;
    if (!_247)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _173 = _273;
        _249 = _261;
    }
    float _275 = _173;
    float _277 = _249;
    float _279 = _277;
    if (!_157)
    {
        float _281 = _123 * _123;
        float _283 = _281 * 0.5;
        _251 = _283;
    }
    float _285 = _251;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _279 = _123;
    }
    float _293 = _279;
    float _295 = fma(_275, _159, _287);
    float _297 = fma(_275, _161, _289);
    float _299 = _293;
    if (!_157)
    {
        float _301 = _285 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = !_157;
    float _307 = _303;
    if (!_305)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _319 = _123 * _311;
        float _321 = 1.0 / _315;
        float _323 = _317 * 0.693147182464599609375;
        float _325 = exp2(_319);
        float _327 = 1.0 / _323;
        float _329 = _325 + (-1.0);
        float _331 = -_329;
        float _333 = fma(_331, _327, _123);
        float _335 = _333 * _321;
        float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _307 = _337;
    }
    float _339 = _307;
    bool _341 = !_157;
    if (!_341)
    {
        float _343 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _345 = log2(_343);
        float _347 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _349 = _347 + 1.0;
        float _351 = 1.0 / _349;
        float _353 = _123 * _345;
        float _355 = exp2(_353);
        float _357 = -_355;
        float _359 = _357 + 1.0;
        float _361 = _359 * _351;
        _299 = _361;
    }
    float _363 = _299;
    float _365 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _367 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _339 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _373 = fma(_363, _161, _365);
    float _375 = fma(_363, _159, _367);
    float _377 = fma(_363, _163, _369);
    float _379 = fma(_297, _147, _167);
    float _381 = -_373;
    float _383 = _297 + _381;
    float _385 = fma(_275, _163, _291);
    float _387 = fma(_295, _147, _165);
    float _389 = -_375;
    float _391 = _295 + _389;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = -_377;
    float _401 = _385 + _399;
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _407 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _409 = fma(_385, _147, _169);
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _413 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = !_371;
    float _419 = _413;
    float _421 = _411;
    float _423 = _415;
    float _441;
    if (!_417)
    {
        float _425 = in.m_56.x;
        float _427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _429 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _431 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _433 = _431 * _427;
        float _435 = floor(_433);
        float _437 = -_435;
        float _439 = _433 + _437;
        _441 = _439;
        _443 = true;
    }
    else
    {
        float _445 = float(_89);
        float _447 = 1.0 / _445;
        float _449 = _123 * _447;
        _441 = _449;
    }
    _443 = false;
    float _451 = _441;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _455 = _451 + _453;
    float _457 = in.m_54.x;
    float _459 = in.m_54.y;
    bool _461 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _463 = isnan(_451);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _473;
    bool _477 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_451);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = 1.0 / _475;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _501 = _487 * _491;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _455 * _497;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _509;
    float _513 = fma(_495, _507, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _515 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _517 = _513 * _501;
    float _519 = _515 * _501;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _517);
    float _523 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _519);
    float _525 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].x, _521);
    float _527 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[144].y, _523);
    float _529 = _525 * _457;
    float _531 = _527 * _459;
    bool _533 = !_499;
    float _551;
    if (!_533)
    {
        float _535 = in.m_56.x;
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _539 = _535 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_89);
        float _557 = 1.0 / _555;
        float _559 = _123 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _565 = _561 + _563;
    bool _567 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _569 = isnan(_561);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _579;
    bool _583 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _585 = isnan(_561);
    bool _587 = _583 || _585;
    bool _589 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _591 = _587 || _589;
    float _593 = float(_591);
    float _595 = -_577;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _599;
    float _603 = 1.0 / _581;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _607 = _593 * _597;
    float _609 = -_593;
    float _611 = _609 + 1.0;
    float _613 = _565 * _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _615;
    float _619 = fma(_601, _613, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _621;
    float _625 = fma(_617, _613, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _627 = _619 * _607;
    float _629 = fma(_623, _613, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _631 = _625 * _607;
    float _633 = _629 * _607;
    float _635 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].x, _627);
    float _637 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].y, _633);
    float _639 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[107].z, _631);
    float _641 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].x, _635);
    float _643 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].y, _637);
    float _645 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[108].z, _639);
    bool _647 = !_605;
    float _665;
    if (!_647)
    {
        float _649 = in.m_56.x;
        float _651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _653 = _649 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _657 = _655 * _651;
        float _659 = floor(_657);
        float _661 = -_659;
        float _663 = _657 + _661;
        _665 = _663;
        _667 = true;
    }
    else
    {
        float _669 = float(_89);
        float _671 = 1.0 / _669;
        float _673 = _123 * _671;
        _665 = _673;
    }
    _667 = false;
    float _675 = _665;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _675 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _685 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _687 = isnan(_675);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _701 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _703 = isnan(_675);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _713;
    bool _717 = _675 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _719 = isnan(_675);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _683;
    float _731 = -_695;
    float _733 = _731 + 1.0;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _737 = 1.0 / _699;
    float _739 = _715 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _745 = -_727;
    float _747 = _745 + 1.0;
    float _749 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _751 = _711 * _733;
    float _753 = -_711;
    float _755 = _753 + 1.0;
    float _757 = _695 * _747;
    float _759 = _743 * _737;
    float _761 = _749 * _751;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = _675 + _763;
    float _767 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _769 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[115].x, _761);
    float _773 = fma(_759, _765, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _775 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _777 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = fma(_773, _757, _771);
    float _781 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[117].x, _779);
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _777;
    out.m_58.y = _783;
    out.m_58.z = _785;
    out.m_58.w = _787;
    bool _789 = !_735;
    float _813;
    float _815;
    if (!_789)
    {
        float _791 = in.m_56.x;
        float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _795 = float(_89);
        float _797 = 1.0 / _795;
        float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _801 = _123 * _797;
        float _803 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _805 = _803 * _793;
        float _807 = floor(_805);
        float _809 = -_807;
        float _811 = _805 + _809;
        _813 = _801;
        _815 = _811;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _813 = _823;
        _815 = _823;
    }
    _817 = false;
    float _825 = _813;
    float _827 = _815;
    float _829 = in.m_56.x;
    float _831 = in.m_56.y;
    float _833 = in.m_56.z;
    float _835 = in.m_56.w;
    float _837 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _851 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    float _853 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _857 = _855 != 0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _865 = _863 != 0;
    float _867 = 1.0 / _845;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _879 = _877 != 0;
    float _881 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _885 = _825 + _883;
    float _887 = 1.0 / _849;
    bool _889 = _835 > 0.5;
    float _891 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _881);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _897 = _829 > 0.5;
    float _899 = _829 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _901 = -_201;
    int _903 = _889 ? as_type<int>(_901) : as_type<int>(_201);
    float _905 = 1.0 / _861;
    bool _907 = _831 > 0.5;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _911 = -_197;
    int _913 = _897 ? as_type<int>(_911) : as_type<int>(_197);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _917 = _831 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _919 = 1.0 / _875;
    float _921 = -_909;
    float _923 = fma(_899, 2.0, _921);
    float _925 = -_201;
    int _927 = _907 ? as_type<int>(_925) : as_type<int>(_201);
    float _929 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _891);
    bool _931 = !_857;
    float _933 = _931 ? _197 : as_type<float>(_913);
    float _935 = _833 * 2.0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _939 = _937 != 0;
    int _941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _943 = _941 != 0;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _947 = _945 != 0;
    float _949 = 1.0 / _895;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _953 = _827 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _963 = fma(_917, -2.0, _915);
    float _965 = _953 * _867;
    float _967 = _957 * _887;
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _973;
    float _977 = floor(_935);
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = _983 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _987 = _975 * _905;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _989;
    float _993 = _981 * _919;
    float _995 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _997 = _829 * 2.0;
    float _999 = 1.0 / _961;
    float _1001 = _991 * _949;
    bool _1003 = !_865;
    float _1005 = _1003 ? _201 : as_type<float>(_927);
    float _1007 = _831 * 2.0;
    bool _1009 = _833 > 0.5;
    float _1011 = _831 + _829;
    bool _1013 = !_879;
    float _1015 = _1013 ? _201 : as_type<float>(_903);
    float _1017 = -_123;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1021 = 1.0 / _985;
    float _1023 = -_197;
    int _1025 = _1009 ? as_type<int>(_1023) : as_type<int>(_197);
    float _1027 = _853 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1029 = _977 > 0.0;
    float _1031 = _929 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1033 = _977 >= 0.0;
    bool _1035 = isnan(_977);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    float _1043 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1045 = floor(_997);
    float _1047 = _971 * _999;
    float _1049 = _831 + _833;
    int _1051 = _1041 ? 0 : 1;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1057 = !_871;
    float _1059 = _1057 ? _197 : as_type<float>(_1025);
    float _1061 = floor(_1007);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1067 = _1049 + (-1.0);
    float _1069 = _1011 + (-1.0);
    float _1071 = _1065 * _1021;
    float _1073 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1075 = 1.0 / _1055;
    bool _1077 = _1045 > 0.0;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1081 = _1045 >= 0.0;
    bool _1083 = isnan(_1045);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan(0.0);
    bool _1089 = _1085 || _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1093 = _825 + _1091;
    int _1095 = ~_1051;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1047, _885, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    int _1103 = _1099;
    if (!_1029)
    {
        int _1105 = ~_1051;
        int _1107 = _1105 + 1;
        _1103 = _1107;
    }
    int _1109 = _1103;
    float _1111 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1113 = log2(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1115;
    int _1119 = _1089 ? 0 : 1;
    float _1121 = fma(_967, _1093, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1123 = _1061 > 0.0;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1127 = _825 + _1125;
    bool _1129 = _1061 >= 0.0;
    bool _1131 = isnan(_1061);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan(0.0);
    bool _1137 = _1133 || _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1141 = _825 + _1139;
    float _1143 = _1117 * _1075;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = fma(_987, _1141, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1151 = _825 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1153;
    float _1157 = _123 * _1113;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _963);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1167;
    float _1171 = fma(_1155, _965, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1173 = fma(_1071, _1127, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1175 = fma(_1165, _965, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1177 = fma(_1143, _1151, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1179 = exp2(_1157);
    float _1181 = fma(_1169, _965, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1183 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1185 = _933 + 0.5;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1189 = _825 + _1187;
    float _1191 = _1005 + (-0.5);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1195 = _825 + _1193;
    float _1197 = fma(_1183, _1185, _1019);
    float _1199 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1201 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1203 = isnan(_825);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1209 = _1205 || _1207;
    float _1211 = float(_1209);
    float _1213 = fma(_1001, _1189, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1215 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1217 = isnan(_825);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1199;
    float _1229 = -_1161;
    float _1231 = fma(_1227, _1191, _1229);
    bool _1233 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1235 = isnan(_825);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = -_1211;
    float _1247 = _1245 + 1.0;
    float _1249 = fma(_993, _1195, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1251 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1253 = isnan(_827);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = -_1179;
    float _1265 = _1263 + 1.0;
    bool _1267 = _827 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_827);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = _1225 * _1247;
    float _1281 = -_1225;
    float _1283 = _1281 + 1.0;
    int _1285 = _1137 ? 0 : 1;
    float _1287 = -_1243;
    float _1289 = _1287 + 1.0;
    bool _1291 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1293 = isnan(_825);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    float _1303 = _1243 * _1283;
    bool _1305 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1307 = isnan(0.0);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1313 = _1309 || _1311;
    float _1315 = -_1277;
    float _1317 = _1315 + 1.0;
    float _1319 = _1301 * _1289;
    bool _1321 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1323 = isnan(_825);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1301;
    float _1335 = _1333 + 1.0;
    float _1337 = _1313 ? _1265 : 0.0;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    bool _1343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(1.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = _1331 * _1335;
    bool _1355 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1357 = isnan(_825);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -_1331;
    float _1369 = _1367 + 1.0;
    bool _1371 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_825);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = _1261 * _1317;
    float _1385 = -_1365;
    float _1387 = _1385 + 1.0;
    float _1389 = _1365 * _1369;
    float _1391 = _1171 * _1383;
    bool _1393 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1395 = isnan(_825);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1381 * _1387;
    float _1407 = -_1381;
    float _1409 = _1407 + 1.0;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1413 = _1175 * _1383;
    float _1415 = _1181 * _1383;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1419 = _1403 * _1409;
    float _1421 = 1.0 / _1341;
    float _1423 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1411);
    float _1425 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1417);
    float _1427 = _1121 * _1419;
    float _1429 = _1059 + 0.5;
    float _1431 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1423);
    float _1433 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1425);
    float _1435 = float(_1109);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1439 = -_1431;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -_1441;
    float _1449 = fma(_933, _1447, _1197);
    float _1451 = -_1403;
    float _1453 = _1451 + 1.0;
    float _1455 = fma(_1005, _1445, _1231);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1459 = -_1261;
    float _1461 = _1459 + 1.0;
    float _1463 = _1337 * _1421;
    float _1465 = -_1015;
    float _1467 = _1465 + 0.5;
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1427);
    float _1471 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1391);
    float _1475 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1413);
    float _1477 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1415);
    float _1479 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1481 = fma(_1101, _1405, _1469);
    bool _1483 = !_939;
    int _1485 = _1483 ? 0 : 1;
    float _1487 = _1471 * _1437;
    float _1489 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1475);
    int _1491 = ~_1285;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    float _1497 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1473);
    float _1499 = _1479 * _1457;
    int _1501 = abs(_1485);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1505 = _1027 + _1503;
    int _1507 = _1495;
    float _1509 = _1173;
    if (!_1123)
    {
        int _1511 = ~_1285;
        int _1513 = _1511 + 1;
        _1507 = _1513;
    }
    int _1515 = _1507;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1031 + _1517;
    out.m_60.x = _1449;
    out.m_60.y = _1455;
    out.m_60.z = _1487;
    out.m_60.w = _1499;
    float _1521 = fma(_1147, _1389, _1481);
    float _1523 = _1505 * _1505;
    float _1525 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1477);
    float _1527 = float(_1501);
    bool _1529 = !_943;
    int _1531 = _1529 ? 0 : 1;
    int _1533 = ~_1119;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    float _1539 = _1527 * _1435;
    int _1541 = abs(_1531);
    float _1543 = fma(_1249, _1353, _1521);
    int _1545 = _1537;
    if (!_1077)
    {
        int _1547 = ~_1119;
        int _1549 = _1547 + 1;
        _1545 = _1549;
    }
    int _1551 = _1545;
    float _1553 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1043 + _1557;
    float _1561 = fma(_1213, _1319, _1543);
    float _1563 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1555);
    float _1565 = float(_1551);
    float _1567 = in.m_62.x;
    float _1569 = in.m_62.y;
    float _1571 = in.m_62.z;
    float _1573 = float(_1541);
    float _1575 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1563);
    float _1577 = _1489 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1579 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1581 = _1539 * (-2.0);
    float _1583 = _1573 * _1565;
    bool _1585 = _1575 >= 0.0;
    float _1587 = fma(_1519, _1519, _1523);
    float _1589 = fma(_1173, _1303, _1561);
    float _1591 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1595 = fma(_1559, _1559, _1587);
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1073, _1581, _1073);
    float _1601 = fma(_1177, _1279, _1589);
    float _1603 = rsqrt(_1595);
    out.m_64.x = _1591;
    out.m_64.y = _1593;
    out.m_64.z = _1597;
    float _1605 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1601);
    if (_1585)
    {
        _1509 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1607 = _1509;
    int _1609 = as_type<int>(_1607);
    if (_1585)
    {
        out.m_47.x = 0.0;
    }
    float _1611 = fma(_1581, _1567, _1567);
    float _1613 = _1583 * (-2.0);
    if (_1585)
    {
        float _1615 = _1607 * 5.0;
        _1609 = as_type<int>(_1615);
    }
    int _1617 = _1609;
    out.m_66.x = _1605;
    float _1619 = fma(_1079, _1613, _1079);
    float _1621 = fma(_1613, _1569, _1569);
    float _1623 = _1505 * _1603;
    float _1625 = _829 + (-0.5);
    float _1627 = _1519 * _1603;
    float _1629 = _1627;
    if (_1585)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5160 = as_type<float>(_1617);
        out.gl_Position.z = _5160;
    }
    float _1631 = -_1623;
    float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1611);
    bool _1637 = !_947;
    int _1639 = _1637 ? 0 : 1;
    float _1641 = -_1627;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1519);
    float _1645 = _1633 * _1633;
    if (_1585)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1647 = -_1623;
    float _1649 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1027);
    float _1651 = -_1627;
    float _1653 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1031);
    float _1655 = _1559 * _1603;
    int _1657 = abs(_1639);
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1661 = _1649 + _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1665 = _1653 + _1663;
    float _1667 = fma(_1643, _1643, _1645);
    float _1669 = -_1655;
    float _1671 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1559);
    float _1673 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1675 = float(_1515);
    float _1677 = _833 + _829;
    float _1679 = fma(_1671, _1671, _1667);
    float _1681 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1673);
    float _1683 = -_1655;
    float _1685 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1687 = _831 + (-0.5);
    bool _1689 = !_1351;
    float _1691 = _1689 ? _123 : _1463;
    float _1693 = _1677 + (-1.0);
    float _1695 = float(_1657);
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1699 = _1685 + _1697;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1621);
    float _1703 = _833 + (-0.5);
    float _1705 = fma(_1691, _1599, _1635);
    float _1707 = _1695 * _1675;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1681);
    float _1711 = fma(_1691, _1619, _1701);
    float _1713 = _1707 * (-2.0);
    float _1715 = sqrt(_1679);
    float _1717 = _1711 * 0.15915493667125701904296875;
    bool _1719 = _1709 >= 0.0;
    float _1721 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1723 = fma(_1713, _1571, _1571);
    float _1725 = _1705 * 0.15915493667125701904296875;
    float _1727 = fma(_1721, _1713, _1721);
    float _1729 = fma(_1703, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1723);
    float _1731 = _1725 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(_1691, _1727, _1729);
    float _1737 = _1703;
    if (_1719)
    {
        _1737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1739 = _1737;
    float _1741 = _1735 * 0.15915493667125701904296875;
    float _1743 = _1725 * 6.283185482025146484375;
    float _1745 = cos(_1743);
    int _1747 = as_type<int>(_1739);
    if (_1719)
    {
        out.m_47.x = 0.0;
    }
    float _1749 = _1603 * _1715;
    if (_1719)
    {
        float _1751 = _1739 * 5.0;
        _1747 = as_type<int>(_1751);
    }
    int _1753 = _1747;
    float _1755 = _1717 * 6.283185482025146484375;
    float _1757 = sin(_1755);
    if (_1719)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1753);
        out.gl_Position.z = _5380;
    }
    float _1759 = _1717 * 6.283185482025146484375;
    float _1761 = cos(_1759);
    float _1763 = _1741 * 6.283185482025146484375;
    float _1765 = sin(_1763);
    if (_1719)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = cos(_1767);
    float _1771 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1775 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1777 = _1733 * _1757;
    float _1779 = _1749 * _1771;
    float _1781 = _1745 * _1761;
    float _1783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1785 = _1749 * _1775;
    float _1787 = _1773 * _1779;
    float _1789 = fma(_1765, _1781, _1777);
    float _1791 = _1745 * _1757;
    float _1793 = _1783 * _1785;
    float _1795 = _1733 * _1761;
    float _1797 = _1769 * _1787;
    float _1799 = -_1787;
    float _1801 = _1765 * _1799;
    float _1803 = _1745 * _1797;
    float _1805 = _1757 * _1769;
    float _1807 = _1761 * _1769;
    float _1809 = _1749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1811 = _1809 * 0.5;
    float _1813 = fma(_1789, _1793, _1803);
    float _1815 = -_1795;
    float _1817 = fma(_1765, _1791, _1815);
    float _1819 = -_1791;
    float _1821 = fma(_1765, _1795, _1819);
    float _1823 = _1733 * _1797;
    float _1825 = fma(_1807, _1793, _1801);
    float _1827 = fma(_1817, _1811, _1813);
    float _1829 = fma(_1765, _1777, _1781);
    float _1831 = fma(_1821, _1793, _1823);
    float _1833 = fma(_1805, _1811, _1825);
    float _1835 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1837 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1839 = fma(_1829, _1811, _1831);
    float _1841 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1835);
    float _1843 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1837);
    float _1845 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1841);
    float _1847 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1843);
    float _1849 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1851 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1853 = _1031 + _1849;
    float _1855 = _1043 + _1851;
    float _1857 = _1827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1861 = _1853 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1865 = _1855 + _1863;
    float _1867 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1857);
    float _1869 = _1861 * _1861;
    float _1871 = _1865 * _1865;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1867);
    float _1875 = _1869 + _1871;
    float _1877 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1879 = sqrt(_1875);
    float _1881 = _1027 + _1877;
    bool _1883 = _1879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1885 = _1839;
    float _1887 = _1877;
    float _1889 = _1871;
    float _1891 = _1853;
    float _1893 = _1855;
    float _1895 = _1833;
    if (!_1883)
    {
        _1885 = _1869;
    }
    float _1897 = _1885;
    float _1899 = _1897;
    if (!_1883)
    {
        _1887 = _1881;
    }
    float _1901 = _1887;
    bool _1903 = !_1883;
    float _1905 = _1901;
    if (!_1903)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1911 = _1879 + _1909;
        float _1913 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1915 = rsqrt(_1875);
        float _1917 = _1911 * _1907;
        float _1919 = _1917 * 0.15915493667125701904296875;
        float _1921 = _1919 * 6.283185482025146484375;
        float _1923 = sin(_1921);
        float _1925 = _1919 * 6.283185482025146484375;
        float _1927 = cos(_1925);
        float _1929 = fma(_1923, _1913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1931 = _1915 * _1929;
        float _1933 = _1927 + (-1.0);
        float _1935 = fma(_1861, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1937 = fma(_1865, _1931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1939 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1943 = _1935 + _1941;
        float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1947 = _1937 + _1945;
        float _1949 = fma(_1881, _1927, _1939);
        float _1951 = _1943 * _1943;
        float _1953 = _1947 * _1947;
        _1905 = _1949;
        _1899 = _1951;
        _1889 = _1953;
        _1891 = _1935;
        _1893 = _1937;
        _1895 = _1947;
    }
    float _1955 = _1905;
    float _1957 = _1899;
    float _1959 = _1889;
    float _1961 = _1891;
    float _1963 = _1893;
    float _1965 = _1895;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1969 = _1955 + _1967;
    float _1971 = fma(_1969, _1969, _1957);
    float _1973 = _1971 + _1959;
    float _1975 = sqrt(_1973);
    bool _1977 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1979 = isnan(_1975);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1985 = _1981 || _1983;
    float _1987 = _1969;
    float _1989 = _1965;
    if (!_1985)
    {
        _1987 = 1.0;
    }
    float _1991 = _1987;
    bool _1993 = !_1985;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1975);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1975 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1975 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1975);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1975 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1955 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1961 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1963 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -_1027;
    float _2077 = _2075 + _2069;
    float _2079 = -_1031;
    float _2081 = _2079 + _2071;
    float _2083 = -_1043;
    float _2085 = _2083 + _2073;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = sqrt(_2091);
    bool _2095 = _2093 > 0.0;
    bool _2097 = !_2095;
    float _2099 = _2059;
    float _2101 = _2069;
    float _2103 = _2071;
    float _2105 = _2073;
    if (!_2097)
    {
        bool _2107 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2109 = _2093;
        if (_2107)
        {
            float _2111 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2109 = _2111;
        }
        float _2113 = _2109;
        float _2115 = _2113;
        if (_2107)
        {
            float _2117 = _411 * _2113;
            _1989 = _2117;
        }
        float _2119 = _1989;
        float _2121 = _2119;
        if (_2107)
        {
            float _2123 = _413 * _2113;
            _2099 = _2123;
        }
        float _2125 = _2099;
        float _2127 = _2125;
        if (_2107)
        {
            float _2129 = _415 * _2113;
            _2115 = _2129;
        }
        float _2131 = _2115;
        float _2133 = _2131;
        float _2135 = _2131;
        if (!_2107)
        {
            float _2137 = _123 + 1.0;
            float _2139 = _2137;
            if (!_157)
            {
                float _2141 = _2137 * _2137;
                float _2143 = _2141 * 0.5;
                _2133 = _2143;
            }
            float _2145 = _2133;
            float _2147 = _2145;
            if (!_157)
            {
                float _2149 = _2145 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2147 = _2149;
            }
            float _2151 = _2147;
            bool _2153 = !_157;
            float _2155 = _2151;
            if (!_2153)
            {
                float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2159 = log2(_2157);
                float _2161 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2163 = _2161 + 1.0;
                float _2165 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2167 = _2159 * _2137;
                float _2169 = 1.0 / _2163;
                float _2171 = _2165 * 0.693147182464599609375;
                float _2173 = exp2(_2167);
                float _2175 = 1.0 / _2171;
                float _2177 = _2173 + (-1.0);
                float _2179 = -_2177;
                float _2181 = fma(_2179, _2175, _2137);
                float _2183 = _2181 * _2169;
                float _2185 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2155 = _2185;
            }
            float _2187 = _2155;
            float _2189 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2191 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2193 = !_157;
            if (!_2193)
            {
                float _2195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2197 = log2(_2195);
                float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2201 = _2199 + 1.0;
                float _2203 = 1.0 / _2201;
                float _2205 = _2197 * _2137;
                float _2207 = exp2(_2205);
                float _2209 = -_2207;
                float _2211 = _2209 + 1.0;
                float _2213 = _2211 * _2203;
                _2139 = _2213;
            }
            float _2215 = _2139;
            float _2217 = fma(_2215, _161, _2191);
            float _2219 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2221 = fma(_2215, _159, _2189);
            float _2223 = -_373;
            float _2225 = _2223 + _2217;
            float _2227 = fma(_2215, _163, _2219);
            float _2229 = -_375;
            float _2231 = _2229 + _2221;
            float _2233 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2235 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2237 = _2225 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2239 = -_377;
            float _2241 = _2239 + _2227;
            float _2243 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2233);
            float _2245 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2235);
            float _2247 = fma(_2231, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2237);
            float _2249 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2243);
            float _2251 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2245);
            float _2253 = fma(_2241, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2247);
            _419 = _2251;
            _421 = _2249;
            _423 = _2253;
            _2121 = _2249;
            _2127 = _2251;
            _2135 = _2253;
        }
        float _2255 = _419;
        float _2257 = _421;
        float _2259 = _423;
        float _2261 = _2121;
        float _2263 = _2127;
        float _2265 = _2135;
        float _2267 = _2255 * _2255;
        float _2269 = rsqrt(_2091);
        float _2271 = fma(_2257, _2257, _2267);
        float _2273 = fma(_2259, _2259, _2271);
        float _2275 = sqrt(_2273);
        float _2277 = _2081 * _2269;
        float _2279 = _2077 * _2269;
        float _2281 = _2085 * _2269;
        bool _2283 = _2275 > 0.0;
        bool _2285 = !_2283;
        if (!_2285)
        {
            float _2287 = rsqrt(_2273);
            float _2289 = _2287 * _2255;
            float _2291 = _2287 * _2257;
            float _2293 = _2287 * _2259;
            float _2295 = _2279 * _2289;
            float _2297 = fma(_2277, _2291, _2295);
            float _2299 = fma(_2281, _2293, _2297);
            float _2301 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2303 = fma(_2261, _2301, _2071);
            float _2305 = fma(_2263, _2301, _2069);
            float _2307 = fma(_2265, _2301, _2073);
            _2101 = _2305;
            _2103 = _2303;
            _2105 = _2307;
        }
    }
    float _2309 = _2101;
    float _2311 = _2103;
    float _2313 = _2105;
    float _2315 = -_1623;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2309);
    float _2319 = -_1627;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2311);
    float _2323 = -_1655;
    float _2325 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2313);
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2329 = _2317 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2333 = _2321 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2337 = _2325 + _2335;
    float _2339 = _2329 * _2329;
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = fma(_2337, _2337, _2341);
    float _2345 = rsqrt(_2343);
    float _2347 = sqrt(_2343);
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2351 = _2333 * _2349;
    float _2353 = _2337 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 * _2353;
    float _2359 = _2355 + _2357;
    float _2361 = sqrt(_2359);
    bool _2363 = _2361 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2367 = _2361 + _2365;
    float _2369 = _2345;
    float _2371 = _2367;
    float _2373 = _2329;
    float _2375 = _2349;
    if (_2363)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2369 = _2377;
    }
    float _2379 = _2369;
    float _2381 = _2379;
    if (_2363)
    {
        float _2383 = _2367 * _2379;
        _2371 = _2383;
    }
    float _2385 = _2371;
    if (_2363)
    {
        float _2387 = rsqrt(_2359);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = _2389;
    if (_2363)
    {
        float _2393 = _2385 * 0.15915493667125701904296875;
        _1629 = _2393;
    }
    float _2395 = _1629;
    float _2397 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2399 = _2337;
    float _2401 = _2395;
    if (_2363)
    {
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = precise::max(0.0, _2397);
    float _2411 = _2091;
    float _2413 = _2409;
    if (_2363)
    {
        float _2415 = _2395 * 6.283185482025146484375;
        float _2417 = cos(_2415);
        _2411 = _2417;
    }
    float _2419 = _2411;
    float _2421 = -_2349;
    float _2423 = -_2409;
    float _2425 = fma(_2329, _2421, _2423);
    if (_2363)
    {
        float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2373 = _2427;
    }
    float _2429 = _2373;
    float _2431 = _2407;
    float _2433 = _2429;
    if (_2363)
    {
        float _2435 = fma(_2407, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (!_2363)
    {
        _2433 = _2425;
    }
    float _2441 = _2433;
    float _2443 = _2441;
    if (_2363)
    {
        float _2445 = _2389 * _2437;
        _2375 = _2445;
    }
    float _2447 = _2375;
    if (!_2363)
    {
        _2391 = _2351;
    }
    float _2449 = _2391;
    float _2451 = _2449;
    float _2453 = _2419;
    if (_2363)
    {
        float _2455 = _2419 + (-1.0);
        _2413 = _2455;
    }
    float _2457 = _2413;
    float _2459 = _2457;
    if (_2363)
    {
        float _2461 = _2351 * _2447;
        _2451 = _2461;
    }
    float _2463 = _2451;
    if (!_2363)
    {
        _2439 = _2355;
    }
    float _2465 = _2439;
    float _2467 = _2465;
    if (_2363)
    {
        float _2469 = _2457 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2469;
    }
    float _2471 = _2401;
    if (!_2363)
    {
        _2459 = _2353;
    }
    float _2473 = _2459;
    float _2475 = _2473;
    if (_2363)
    {
        float _2477 = _2353 * _2447;
        _2475 = _2477;
    }
    float _2479 = _2475;
    if (_2363)
    {
        float _2481 = _2463 * _2463;
        _2467 = _2481;
    }
    float _2483 = _2467;
    if (_2363)
    {
        float _2485 = fma(_2425, _2419, _2471);
        _2443 = _2485;
    }
    float _2487 = _2443;
    if (!_2363)
    {
        _2453 = _2357;
    }
    float _2489 = _2453;
    float _2491 = _2489;
    if (_2363)
    {
        float _2493 = _2479 * _2479;
        _2491 = _2493;
    }
    float _2495 = _2491;
    float _2497 = fma(_2487, _2487, _2483);
    float _2499 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2501 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2503 = _2497 + _2495;
    float _2505 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2499);
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2509 = fma(_2347, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2507);
    float _2511 = precise::clamp(_2509, 0.0, 1.0);
    float _2513 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2515 = rsqrt(_2503);
    float _2517 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2519 = -_2511;
    float _2521 = _2519 + 1.0;
    float _2523 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2513);
    float _2525 = _2317 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2527 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2529 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2501);
    float _2531 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2523);
    float _2533 = abs(_2521);
    float _2535 = log2(_2533);
    float _2537 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2525);
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2541 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2543 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2545 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2537);
    float _2547 = fma(_2325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2529);
    float _2549 = _2515 * _2463;
    float _2551 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2553 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2555 = -_2543;
    float _2557 = fma(_2555, _2539, 1.0);
    float _2559 = _2515 * _2487;
    float _2561 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2563 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2553);
    float _2565 = _2515 * _2479;
    float _2567 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = -_2561;
    float _2571 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2569);
    float _2573 = _2547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2563);
    float _2577 = log2(_2557);
    float _2579 = -_2565;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2571);
    float _2583 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2585 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2575);
    float _2587 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2589 = fma(_2581, -0.5, 0.5);
    float _2591 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2583);
    float _2593 = _2559 + 1.0;
    float _2595 = exp2(_2567);
    float _2597 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2587);
    float _2599 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2591);
    float _2601 = fma(_2581, 0.5, 0.5);
    float _2603 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2597);
    float _2605 = fma(_2601, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2607 = 1.0 / _2585;
    float _2609 = fma(_2601, _2605, -0.212114393711090087890625);
    float _2611 = fma(_2601, _2609, 1.570728778839111328125);
    float _2613 = sqrt(_2589);
    float _2615 = -_2559;
    float _2617 = fma(_2595, _2593, _2615);
    float _2619 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2599);
    float _2621 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2603);
    float _2623 = _2577 * 0.693147182464599609375;
    float _2625 = _2619 * _2607;
    float _2627 = _2621 * _2607;
    float _2629 = _2623 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2631 = fma(_2625, 0.5, 0.5);
    float _2633 = fma(_2627, -0.5, 0.5);
    float _2635 = fma(_2617, 0.5, 0.5);
    float _2637 = _2613 * 0.636619746685028076171875;
    float3 _6795 = float3(_2631, _2633, _2629);
    float _2639 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6795, float3(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6795, float3(0.0), isnan(_6795)), level(0.0)).x;
    float _2641 = -_2611;
    float _2643 = fma(_2637, _2641, 1.0);
    float3 _6811 = float3(_2631, _2633, _2629);
    float4 _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2648 = _2646.x;
    float _2650 = _2646.y;
    float _2652 = _2646.z;
    float _2654 = _2646.w;
    float2 _6828 = float2(_2643, _2635);
    float3 _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6828, float2(0.0), isnan(_6828)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6828, float2(0.0), isnan(_6828)), level(0.0)).xyz;
    float _2660 = _2658.x;
    float _2662 = _2658.y;
    float _2664 = _2658.z;
    float _2666 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2668 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2670 = _2619 + _2585;
    float _2672 = fma(_2551, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2666);
    float _2674 = _2670 * 0.5;
    float _2676 = exp2(_2668);
    float _2678 = fma(_2527, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2680 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2678);
    float _2682 = _2585 * 0.5;
    float _2684 = _2680 + _2585;
    float _2686 = -_2676;
    float _2688 = _2686 + 1.0;
    float _2690 = fma(_2621, -0.5, _2682);
    float _2692 = _2684 * 0.5;
    float _2694 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2619;
    out.gl_Position.y = _2621;
    out.gl_Position.z = _2680;
    out.gl_Position.w = _2585;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.x = _2674;
    out.m_68.y = _2690;
    out.m_68.z = _2692;
    out.m_68.w = _2585;
    out.m_47.x = _2696;
    float _2698 = _2694 * _2639;
    float _2700 = -_2694;
    float _2702 = _2700 + 1.0;
    float _2704 = _2654 * _2698;
    float _2706 = _2664 * _2698;
    float _2708 = fma(_2660, _2704, _2648);
    float _2710 = fma(_2662, _2704, _2650);
    float _2712 = _2654 * _2702;
    float _2714 = fma(_2654, _2706, _2652);
    out.m_70.x = _2708;
    out.m_70.y = _2710;
    out.m_70.z = _2714;
    out.m_70.w = _2712;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

