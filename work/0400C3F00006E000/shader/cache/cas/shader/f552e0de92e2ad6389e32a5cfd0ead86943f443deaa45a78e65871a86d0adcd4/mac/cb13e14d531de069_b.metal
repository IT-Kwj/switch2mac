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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_64 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_109);
        out.gl_Position.z = _1337;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1405 = as_type<float>(_145);
        out.gl_Position.z = _1405;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _151 * _149;
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 0.15915493667125701904296875;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    float _199 = cos(_197);
    float _201 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = 0.0;
    float _209 = _201;
    if (!_163)
    {
        float _211 = _201 * _201;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = -_177;
    float _219 = _167 + _217;
    float _221 = _215;
    if (!_163)
    {
        float _223 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_163;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _209 = _283;
    }
    float _285 = _209;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = in.m_56.w;
    bool _297 = !_195;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_199, 0.5, 0.5);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_289;
    int _311 = _309 ? 0 : 1;
    bool _313 = _219 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.x;
    int _319 = abs(_299);
    float _321 = -_219;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_311);
    float _327 = in.m_56.y;
    float _329 = -_315;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_285, _169, _337);
    bool _341 = !_293;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = float(_319);
    float _351 = fma(_285, _171, _345);
    float _353 = float(_325);
    int _355 = abs(_343);
    float _357 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_339, _295, _303);
    float _361 = abs(_323);
    float _363 = _353 * _361;
    float _365 = fma(_285, _173, _357);
    float _367 = fma(_351, _295, _305);
    float _369 = fma(_349, _335, _363);
    float _371 = float(_355);
    float _373 = fma(_365, _295, _307);
    float _375 = _317 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = _327 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = abs(_331);
    float _381 = fma(_371, _379, _369);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_93);
        float _405 = 1.0 / _403;
        float _407 = _127 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = _381 * _375;
    float _419 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
    float _433 = _425 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _431 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _441 = in.m_51.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _435 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _437 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _439 + _451;
    bool _455 = _147 > 0.5;
    float _457 = _445 * _445;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _461 = fma(_449, _449, _457);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = fma(_453, _453, _461);
    float _473 = sqrt(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _441 > 0.5;
    float _481 = rsqrt(_471);
    float _483 = _473 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _485 = 1.0 / _477;
    float _487 = precise::min(_433, _483);
    float _489 = _445 * _481;
    float _491 = _449 * _481;
    float _493 = _453 * _481;
    out.m_58.w = _487;
    float _495 = -_489;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _499 = -_491;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _503 = _489 * _487;
    float _505 = _491 * _487;
    float _507 = _497 * _497;
    float _509 = fma(_501, _501, _507);
    float _511 = -_503;
    float _513 = _445 + _511;
    float _515 = -_505;
    float _517 = _449 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _527 = _513 * _513;
    bool _529 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_409);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _521 * _485;
    float _543 = fma(_525, _525, _509);
    float _545 = fma(_517, _517, _527);
    float _547 = _493 * _487;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _409 + _549;
    bool _553 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_409);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_539;
    float _567 = _565 + 1.0;
    float _569 = -_547;
    float _571 = _453 + _569;
    float _573 = fma(_541, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _575 = sqrt(_543);
    float _577 = _563 * _567;
    float _579 = fma(_571, _571, _545);
    float _581 = _445 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _583 = -_191;
    int _585 = _455 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = _573 * _577;
    float _589 = -_205;
    int _591 = _479 ? as_type<int>(_589) : as_type<int>(_205);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[28].x, _581);
    float _595 = sqrt(_579);
    bool _597 = !_465;
    float _599 = _597 ? _191 : as_type<float>(_585);
    float _601 = -_563;
    float _603 = _601 + 1.0;
    bool _605 = !_469;
    float _607 = _605 ? _205 : as_type<float>(_591);
    float _609 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _611 = _599 + 0.5;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _617 = -_607;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _481 * _575;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[116].x, _613);
    float _631 = _481 * _595;
    float _633 = _625 * _459;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * _623;
    float _639 = _627 * _615;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _645 = _581;
    float _647 = _487;
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _671 = as_type<int>(_649);
    if (_621)
    {
        float _673 = _649 * 5.0;
        _671 = as_type<int>(_673);
    }
    int _675 = _671;
    float _677 = _425 * _637;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_62.x = _633;
    out.m_62.y = _639;
    out.m_64.x = _657;
    out.m_64.y = _665;
    out.m_64.z = _667;
    out.m_64.w = _669;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_675);
        out.gl_Position.z = _2271;
    }
    if (_621)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _677;
    if (_621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _679 = -_489;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _683 = -_491;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _687 = -_493;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _439);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _685 + _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _701 = _689 + _699;
    float _703 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _703);
    float _707 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    bool _709 = _707 >= 0.0;
    float _711 = _701;
    if (_709)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _713 = _711;
    int _715 = as_type<int>(_713);
    if (_709)
    {
        out.m_47.x = 0.0;
    }
    if (_709)
    {
        float _717 = _713 * 5.0;
        _715 = as_type<int>(_717);
    }
    int _719 = _715;
    if (_709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2364 = as_type<float>(_719);
        out.gl_Position.z = _2364;
    }
    if (_709)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _721 = _381 * _377;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _727 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = _677 * _725;
    float _731 = _727 * _637;
    float _733 = _637 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _731 * _723;
    float _739 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _739);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _751 = _747 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _439 + _751;
    float _757 = _437 + _753;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _755 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _757 + _763;
    float _767 = _761 * _761;
    float _769 = fma(_765, _765, _767);
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _773 = sqrt(_769);
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _771);
    float _777 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _775);
    float _779 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _435 + _779;
    bool _783 = _773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _779;
    float _787 = _777;
    float _789 = _757;
    float _791 = _769;
    if (!_783)
    {
        _785 = _757;
    }
    float _793 = _785;
    float _795 = _793;
    if (!_783)
    {
        _787 = _755;
    }
    float _797 = _787;
    float _799 = _797;
    if (!_783)
    {
        _789 = _781;
    }
    float _801 = _789;
    bool _803 = !_783;
    float _805 = _801;
    if (!_803)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _811 = _773 + _809;
        float _813 = rsqrt(_769);
        float _815 = _811 * _807;
        float _817 = _781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = _815 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _819 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = _823 + (-1.0);
        float _831 = fma(_827, _817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _833 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _813 * _831;
        float _837 = fma(_781, _823, _833);
        float _839 = fma(_765, _835, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _841 = fma(_761, _835, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _837;
        _795 = _839;
        _799 = _841;
    }
    float _843 = _805;
    float _845 = _795;
    float _847 = _799;
    float _849 = -_503;
    float _851 = _849 + _843;
    float _853 = -_505;
    float _855 = _853 + _845;
    float _857 = -_489;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _861 = -_547;
    float _863 = _861 + _847;
    float _865 = -_491;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _859 + _869;
    float _873 = -_493;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _867 + _877;
    float _881 = _871 * _871;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _875 + _883;
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_885, _885, _887);
    float _891 = rsqrt(_889);
    float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _895 = _879 * _893;
    float _897 = _885 * _893;
    float _899 = _895 * _895;
    float _901 = _897 * _897;
    float _903 = _899 + _901;
    float _905 = sqrt(_903);
    bool _907 = _905 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = _905 + _909;
    float _913 = _761;
    float _915 = _911;
    float _917 = _871;
    float _919 = _895;
    if (_907)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _921;
    }
    float _923 = _913;
    float _925 = _923;
    if (_907)
    {
        float _927 = _911 * _923;
        _915 = _927;
    }
    float _929 = _915;
    if (_907)
    {
        float _931 = rsqrt(_903);
        _925 = _931;
    }
    float _933 = _925;
    float _935 = _933;
    if (_907)
    {
        float _937 = _929 * 0.15915493667125701904296875;
        _791 = _937;
    }
    float _939 = _791;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _943 = _885;
    if (_907)
    {
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        _943 = _947;
    }
    float _949 = _943;
    float _951 = precise::max(0.0, _941);
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _955 = _781;
    float _957 = _951;
    if (_907)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _955 = _961;
    }
    float _963 = _955;
    float _965 = -_893;
    float _967 = -_951;
    float _969 = fma(_871, _965, _967);
    if (_907)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _971;
    }
    float _973 = _917;
    float _975 = sqrt(_889);
    float _977 = _949;
    float _979 = _973;
    if (_907)
    {
        float _981 = fma(_949, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_907)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_907)
    {
        float _991 = _933 * _983;
        _647 = _991;
    }
    float _993 = _647;
    if (!_907)
    {
        _985 = _899;
    }
    float _995 = _985;
    float _997 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _999 = _995;
    float _1001 = _963;
    if (_907)
    {
        float _1003 = _963 + (-1.0);
        _957 = _1003;
    }
    float _1005 = _957;
    float _1007 = _1005;
    if (_907)
    {
        float _1009 = _895 * _993;
        _919 = _1009;
    }
    float _1011 = _919;
    float _1013 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _997);
    if (_907)
    {
        float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1015;
    }
    float _1017 = _935;
    if (!_907)
    {
        _1007 = _897;
    }
    float _1019 = _1007;
    float _1021 = _1019;
    if (_907)
    {
        float _1023 = _897 * _993;
        _1021 = _1023;
    }
    float _1025 = _1021;
    if (_907)
    {
        float _1027 = _1011 * _1011;
        _999 = _1027;
    }
    float _1029 = _999;
    if (_907)
    {
        float _1031 = fma(_969, _963, _1017);
        _989 = _1031;
    }
    float _1033 = _989;
    if (!_907)
    {
        _1001 = _901;
    }
    float _1035 = _1001;
    float _1037 = _1035;
    if (_907)
    {
        float _1039 = _1025 * _1025;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = fma(_1033, _1033, _1029);
    float _1045 = _1043 + _1041;
    float _1047 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1049);
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1057 = rsqrt(_1045);
    float _1059 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1047);
    float _1061 = -_1053;
    float _1063 = _1061 + 1.0;
    float _1065 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1055);
    float _1067 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1059);
    float _1069 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1071 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = abs(_1063);
    float _1075 = log2(_1073);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1079 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1069);
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1079);
    float _1089 = _1057 * _1033;
    float _1091 = -_1085;
    float _1093 = fma(_1091, _953, 1.0);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1097 = _1057 * _1011;
    float _1099 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1101 = _1057 * _1025;
    float _1103 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1099);
    float _1109 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = log2(_1093);
    float _1113 = -_1105;
    float _1115 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1113);
    float _1117 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1107);
    float _1119 = _1089 + 1.0;
    float _1121 = -_1101;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1115);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1117);
    float _1127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1129 = exp2(_1109);
    float _1131 = fma(_1123, -0.5, 0.5);
    float _1133 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1127);
    float _1137 = fma(_1123, 0.5, 0.5);
    float _1139 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1133);
    float _1141 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1143 = 1.0 / _1125;
    float _1145 = fma(_1137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1147 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1139);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1141);
    float _1151 = _1111 * 0.693147182464599609375;
    float _1153 = sqrt(_1131);
    float _1155 = -_1089;
    float _1157 = fma(_1129, _1119, _1155);
    float _1159 = fma(_1137, _1145, -0.212114393711090087890625);
    float _1161 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1165 = fma(_1137, _1159, 1.570728778839111328125);
    float _1167 = fma(_1157, 0.5, 0.5);
    float _1169 = _1149 * _1143;
    float _1171 = _1161 * _1143;
    float _1173 = fma(_1169, 0.5, 0.5);
    float _1175 = fma(_1171, -0.5, 0.5);
    float _1177 = _1153 * 0.636619746685028076171875;
    float3 _3129 = float3(_1173, _1175, _1163);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3129, float3(0.0), isnan(_3129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3129, float3(0.0), isnan(_3129)), level(0.0)).x;
    float3 _3140 = float3(_1173, _1175, _1163);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3140, float3(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3140, float3(0.0), isnan(_3140)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float _1192 = -_1165;
    float _1194 = fma(_1177, _1192, 1.0);
    float2 _3162 = float2(_1194, _1167);
    float3 _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3162, float2(0.0), isnan(_3162)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3162, float2(0.0), isnan(_3162)), level(0.0)).xyz;
    float _1200 = _1198.x;
    float _1202 = _1198.y;
    float _1204 = _1198.z;
    float _1206 = -_505;
    float _1208 = _437 + _1206;
    float _1210 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1212 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1214 = -_503;
    float _1216 = _435 + _1214;
    float _1218 = _1125 * 0.5;
    float _1220 = -_547;
    float _1222 = _439 + _1220;
    float _1224 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1212);
    float _1226 = exp2(_1210);
    float _1228 = -_489;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1232 = fma(_1161, -0.5, _1218);
    float _1234 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1236 = -_491;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1240 = -_493;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1244 = _1149 + _1125;
    float _1246 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1248 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _867;
    out.m_68.y = _859;
    out.m_68.z = _875;
    float _1250 = _1246 + _1125;
    float _1252 = _1244 * 0.5;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1238;
    out.m_70.y = _1230;
    out.m_70.z = _1242;
    float _1256 = _1250 * 0.5;
    float _1258 = -_1226;
    float _1260 = _1258 + 1.0;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1161;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1125;
    float _1262 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1252;
    out.m_72.y = _1232;
    out.m_72.z = _1256;
    out.m_72.w = _1125;
    out.m_47.x = _1254;
    float _1264 = _1262 * _1179;
    float _1266 = -_1262;
    float _1268 = _1266 + 1.0;
    float _1270 = _1190 * _1264;
    float _1272 = _1190 * _1268;
    float _1274 = _1204 * _1264;
    float _1276 = fma(_1200, _1270, _1184);
    float _1278 = fma(_1202, _1270, _1186);
    float _1280 = fma(_1190, _1274, _1188);
    out.m_74.x = _1276;
    out.m_74.y = _1278;
    out.m_74.z = _1280;
    out.m_74.w = _1272;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_109);
        out.gl_Position.z = _1337;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1405 = as_type<float>(_145);
        out.gl_Position.z = _1405;
    }
    if (_139)
    {
        return out;
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _151 * _149;
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 0.15915493667125701904296875;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    float _199 = cos(_197);
    float _201 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = 0.0;
    float _209 = _201;
    if (!_163)
    {
        float _211 = _201 * _201;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = -_177;
    float _219 = _167 + _217;
    float _221 = _215;
    if (!_163)
    {
        float _223 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_163;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _209 = _283;
    }
    float _285 = _209;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = in.m_56.w;
    bool _297 = !_195;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_199, 0.5, 0.5);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_289;
    int _311 = _309 ? 0 : 1;
    bool _313 = _219 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.x;
    int _319 = abs(_299);
    float _321 = -_219;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_311);
    float _327 = in.m_56.y;
    float _329 = -_315;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_285, _169, _337);
    bool _341 = !_293;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = float(_319);
    float _351 = fma(_285, _171, _345);
    float _353 = float(_325);
    int _355 = abs(_343);
    float _357 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_339, _295, _303);
    float _361 = abs(_323);
    float _363 = _353 * _361;
    float _365 = fma(_285, _173, _357);
    float _367 = fma(_351, _295, _305);
    float _369 = fma(_349, _335, _363);
    float _371 = float(_355);
    float _373 = fma(_365, _295, _307);
    float _375 = _317 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = _327 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = abs(_331);
    float _381 = fma(_371, _379, _369);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_93);
        float _405 = 1.0 / _403;
        float _407 = _127 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = _381 * _375;
    float _419 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
    float _433 = _425 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _431 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _441 = in.m_51.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _435 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _437 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _439 + _451;
    bool _455 = _147 > 0.5;
    float _457 = _445 * _445;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _461 = fma(_449, _449, _457);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = fma(_453, _453, _461);
    float _473 = sqrt(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _441 > 0.5;
    float _481 = rsqrt(_471);
    float _483 = _473 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _485 = 1.0 / _477;
    float _487 = precise::min(_433, _483);
    float _489 = _445 * _481;
    float _491 = _449 * _481;
    float _493 = _453 * _481;
    out.m_58.w = _487;
    float _495 = -_489;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _499 = -_491;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _503 = _489 * _487;
    float _505 = _491 * _487;
    float _507 = _497 * _497;
    float _509 = fma(_501, _501, _507);
    float _511 = -_503;
    float _513 = _445 + _511;
    float _515 = -_505;
    float _517 = _449 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _527 = _513 * _513;
    bool _529 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_409);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _521 * _485;
    float _543 = fma(_525, _525, _509);
    float _545 = fma(_517, _517, _527);
    float _547 = _493 * _487;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _409 + _549;
    bool _553 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_409);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_539;
    float _567 = _565 + 1.0;
    float _569 = -_547;
    float _571 = _453 + _569;
    float _573 = fma(_541, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _575 = sqrt(_543);
    float _577 = _563 * _567;
    float _579 = fma(_571, _571, _545);
    float _581 = _445 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _583 = -_191;
    int _585 = _455 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = _573 * _577;
    float _589 = -_205;
    int _591 = _479 ? as_type<int>(_589) : as_type<int>(_205);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[28].x, _581);
    float _595 = sqrt(_579);
    bool _597 = !_465;
    float _599 = _597 ? _191 : as_type<float>(_585);
    float _601 = -_563;
    float _603 = _601 + 1.0;
    bool _605 = !_469;
    float _607 = _605 ? _205 : as_type<float>(_591);
    float _609 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _611 = _599 + 0.5;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _617 = -_607;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _481 * _575;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[116].x, _613);
    float _631 = _481 * _595;
    float _633 = _625 * _459;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * _623;
    float _639 = _627 * _615;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _645 = _581;
    float _647 = _487;
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _671 = as_type<int>(_649);
    if (_621)
    {
        float _673 = _649 * 5.0;
        _671 = as_type<int>(_673);
    }
    int _675 = _671;
    float _677 = _425 * _637;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_62.x = _633;
    out.m_62.y = _639;
    out.m_64.x = _657;
    out.m_64.y = _665;
    out.m_64.z = _667;
    out.m_64.w = _669;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_675);
        out.gl_Position.z = _2271;
    }
    if (_621)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _677;
    if (_621)
    {
        return out;
    }
    float _679 = -_489;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _683 = -_491;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _687 = -_493;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _439);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _685 + _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _701 = _689 + _699;
    float _703 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _703);
    float _707 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    bool _709 = _707 >= 0.0;
    float _711 = _701;
    if (_709)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _713 = _711;
    int _715 = as_type<int>(_713);
    if (_709)
    {
        out.m_47.x = 0.0;
    }
    if (_709)
    {
        float _717 = _713 * 5.0;
        _715 = as_type<int>(_717);
    }
    int _719 = _715;
    if (_709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2364 = as_type<float>(_719);
        out.gl_Position.z = _2364;
    }
    if (_709)
    {
        return out;
    }
    float _721 = _381 * _377;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _727 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = _677 * _725;
    float _731 = _727 * _637;
    float _733 = _637 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _731 * _723;
    float _739 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _739);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _751 = _747 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _439 + _751;
    float _757 = _437 + _753;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _755 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _757 + _763;
    float _767 = _761 * _761;
    float _769 = fma(_765, _765, _767);
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _773 = sqrt(_769);
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _771);
    float _777 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _775);
    float _779 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _435 + _779;
    bool _783 = _773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _779;
    float _787 = _777;
    float _789 = _757;
    float _791 = _769;
    if (!_783)
    {
        _785 = _757;
    }
    float _793 = _785;
    float _795 = _793;
    if (!_783)
    {
        _787 = _755;
    }
    float _797 = _787;
    float _799 = _797;
    if (!_783)
    {
        _789 = _781;
    }
    float _801 = _789;
    bool _803 = !_783;
    float _805 = _801;
    if (!_803)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _811 = _773 + _809;
        float _813 = rsqrt(_769);
        float _815 = _811 * _807;
        float _817 = _781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = _815 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _819 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = _823 + (-1.0);
        float _831 = fma(_827, _817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _833 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _813 * _831;
        float _837 = fma(_781, _823, _833);
        float _839 = fma(_765, _835, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _841 = fma(_761, _835, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _837;
        _795 = _839;
        _799 = _841;
    }
    float _843 = _805;
    float _845 = _795;
    float _847 = _799;
    float _849 = -_503;
    float _851 = _849 + _843;
    float _853 = -_505;
    float _855 = _853 + _845;
    float _857 = -_489;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _861 = -_547;
    float _863 = _861 + _847;
    float _865 = -_491;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _859 + _869;
    float _873 = -_493;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _867 + _877;
    float _881 = _871 * _871;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _875 + _883;
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_885, _885, _887);
    float _891 = rsqrt(_889);
    float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _895 = _879 * _893;
    float _897 = _885 * _893;
    float _899 = _895 * _895;
    float _901 = _897 * _897;
    float _903 = _899 + _901;
    float _905 = sqrt(_903);
    bool _907 = _905 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = _905 + _909;
    float _913 = _761;
    float _915 = _911;
    float _917 = _871;
    float _919 = _895;
    if (_907)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _921;
    }
    float _923 = _913;
    float _925 = _923;
    if (_907)
    {
        float _927 = _911 * _923;
        _915 = _927;
    }
    float _929 = _915;
    if (_907)
    {
        float _931 = rsqrt(_903);
        _925 = _931;
    }
    float _933 = _925;
    float _935 = _933;
    if (_907)
    {
        float _937 = _929 * 0.15915493667125701904296875;
        _791 = _937;
    }
    float _939 = _791;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _943 = _885;
    if (_907)
    {
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        _943 = _947;
    }
    float _949 = _943;
    float _951 = precise::max(0.0, _941);
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _955 = _781;
    float _957 = _951;
    if (_907)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _955 = _961;
    }
    float _963 = _955;
    float _965 = -_893;
    float _967 = -_951;
    float _969 = fma(_871, _965, _967);
    if (_907)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _971;
    }
    float _973 = _917;
    float _975 = sqrt(_889);
    float _977 = _949;
    float _979 = _973;
    if (_907)
    {
        float _981 = fma(_949, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_907)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_907)
    {
        float _991 = _933 * _983;
        _647 = _991;
    }
    float _993 = _647;
    if (!_907)
    {
        _985 = _899;
    }
    float _995 = _985;
    float _997 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _999 = _995;
    float _1001 = _963;
    if (_907)
    {
        float _1003 = _963 + (-1.0);
        _957 = _1003;
    }
    float _1005 = _957;
    float _1007 = _1005;
    if (_907)
    {
        float _1009 = _895 * _993;
        _919 = _1009;
    }
    float _1011 = _919;
    float _1013 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _997);
    if (_907)
    {
        float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1015;
    }
    float _1017 = _935;
    if (!_907)
    {
        _1007 = _897;
    }
    float _1019 = _1007;
    float _1021 = _1019;
    if (_907)
    {
        float _1023 = _897 * _993;
        _1021 = _1023;
    }
    float _1025 = _1021;
    if (_907)
    {
        float _1027 = _1011 * _1011;
        _999 = _1027;
    }
    float _1029 = _999;
    if (_907)
    {
        float _1031 = fma(_969, _963, _1017);
        _989 = _1031;
    }
    float _1033 = _989;
    if (!_907)
    {
        _1001 = _901;
    }
    float _1035 = _1001;
    float _1037 = _1035;
    if (_907)
    {
        float _1039 = _1025 * _1025;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = fma(_1033, _1033, _1029);
    float _1045 = _1043 + _1041;
    float _1047 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1049);
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1057 = rsqrt(_1045);
    float _1059 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1047);
    float _1061 = -_1053;
    float _1063 = _1061 + 1.0;
    float _1065 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1055);
    float _1067 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1059);
    float _1069 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1071 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = abs(_1063);
    float _1075 = log2(_1073);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1079 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1069);
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1079);
    float _1089 = _1057 * _1033;
    float _1091 = -_1085;
    float _1093 = fma(_1091, _953, 1.0);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1097 = _1057 * _1011;
    float _1099 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1101 = _1057 * _1025;
    float _1103 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1099);
    float _1109 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = log2(_1093);
    float _1113 = -_1105;
    float _1115 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1113);
    float _1117 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1107);
    float _1119 = _1089 + 1.0;
    float _1121 = -_1101;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1115);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1117);
    float _1127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1129 = exp2(_1109);
    float _1131 = fma(_1123, -0.5, 0.5);
    float _1133 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1127);
    float _1137 = fma(_1123, 0.5, 0.5);
    float _1139 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1133);
    float _1141 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1143 = 1.0 / _1125;
    float _1145 = fma(_1137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1147 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1139);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1141);
    float _1151 = _1111 * 0.693147182464599609375;
    float _1153 = sqrt(_1131);
    float _1155 = -_1089;
    float _1157 = fma(_1129, _1119, _1155);
    float _1159 = fma(_1137, _1145, -0.212114393711090087890625);
    float _1161 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1165 = fma(_1137, _1159, 1.570728778839111328125);
    float _1167 = fma(_1157, 0.5, 0.5);
    float _1169 = _1149 * _1143;
    float _1171 = _1161 * _1143;
    float _1173 = fma(_1169, 0.5, 0.5);
    float _1175 = fma(_1171, -0.5, 0.5);
    float _1177 = _1153 * 0.636619746685028076171875;
    float3 _3129 = float3(_1173, _1175, _1163);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3129, float3(0.0), isnan(_3129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3129, float3(0.0), isnan(_3129)), level(0.0)).x;
    float3 _3140 = float3(_1173, _1175, _1163);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3140, float3(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3140, float3(0.0), isnan(_3140)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float _1192 = -_1165;
    float _1194 = fma(_1177, _1192, 1.0);
    float2 _3162 = float2(_1194, _1167);
    float3 _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3162, float2(0.0), isnan(_3162)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3162, float2(0.0), isnan(_3162)), level(0.0)).xyz;
    float _1200 = _1198.x;
    float _1202 = _1198.y;
    float _1204 = _1198.z;
    float _1206 = -_505;
    float _1208 = _437 + _1206;
    float _1210 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1212 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1214 = -_503;
    float _1216 = _435 + _1214;
    float _1218 = _1125 * 0.5;
    float _1220 = -_547;
    float _1222 = _439 + _1220;
    float _1224 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1212);
    float _1226 = exp2(_1210);
    float _1228 = -_489;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1232 = fma(_1161, -0.5, _1218);
    float _1234 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1236 = -_491;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1240 = -_493;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1244 = _1149 + _1125;
    float _1246 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1248 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _867;
    out.m_68.y = _859;
    out.m_68.z = _875;
    float _1250 = _1246 + _1125;
    float _1252 = _1244 * 0.5;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1238;
    out.m_70.y = _1230;
    out.m_70.z = _1242;
    float _1256 = _1250 * 0.5;
    float _1258 = -_1226;
    float _1260 = _1258 + 1.0;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1161;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1125;
    float _1262 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1252;
    out.m_72.y = _1232;
    out.m_72.z = _1256;
    out.m_72.w = _1125;
    out.m_47.x = _1254;
    float _1264 = _1262 * _1179;
    float _1266 = -_1262;
    float _1268 = _1266 + 1.0;
    float _1270 = _1190 * _1264;
    float _1272 = _1190 * _1268;
    float _1274 = _1204 * _1264;
    float _1276 = fma(_1200, _1270, _1184);
    float _1278 = fma(_1202, _1270, _1186);
    float _1280 = fma(_1190, _1274, _1188);
    out.m_74.x = _1276;
    out.m_74.y = _1278;
    out.m_74.z = _1280;
    out.m_74.w = _1272;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _401 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_109);
        out.gl_Position.z = _1337;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    if (_123)
    {
        float _131 = float(_93);
        _129 = _131;
    }
    float _133 = _129;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    if (_139)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_139)
    {
        out.m_47.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1405 = as_type<float>(_145);
        out.gl_Position.z = _1405;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_51.x;
    float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _151 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _153 = as_type<float>(int(gl_VertexIndex));
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _151 * _149;
    float _167 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _169 = in.m_49.x;
    float _171 = in.m_49.y;
    float _173 = in.m_49.z;
    float _175 = _167 * 6.283185482025146484375;
    float _177 = floor(_167);
    int _179 = as_type<int>(_153) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_153) & 2;
    bool _185 = _183 != 0;
    float _187 = _175 * 0.15915493667125701904296875;
    bool _189 = !_181;
    float _191 = _189 ? (-0.5) : 0.5;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _187 * 6.283185482025146484375;
    float _199 = cos(_197);
    float _201 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _203 = !_185;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = 0.0;
    float _209 = _201;
    if (!_163)
    {
        float _211 = _201 * _201;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = -_177;
    float _219 = _167 + _217;
    float _221 = _215;
    if (!_163)
    {
        float _223 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_163;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_163;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _209 = _283;
    }
    float _285 = _209;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = in.m_56.w;
    bool _297 = !_195;
    int _299 = _297 ? 0 : 1;
    float _301 = fma(_199, 0.5, 0.5);
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    bool _309 = !_289;
    int _311 = _309 ? 0 : 1;
    bool _313 = _219 < 0.5;
    float _315 = float(_313);
    float _317 = in.m_56.x;
    int _319 = abs(_299);
    float _321 = -_219;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_311);
    float _327 = in.m_56.y;
    float _329 = -_315;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_301;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_285, _169, _337);
    bool _341 = !_293;
    int _343 = _341 ? 0 : 1;
    float _345 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _347 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _349 = float(_319);
    float _351 = fma(_285, _171, _345);
    float _353 = float(_325);
    int _355 = abs(_343);
    float _357 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_339, _295, _303);
    float _361 = abs(_323);
    float _363 = _353 * _361;
    float _365 = fma(_285, _173, _357);
    float _367 = fma(_351, _295, _305);
    float _369 = fma(_349, _335, _363);
    float _371 = float(_355);
    float _373 = fma(_365, _295, _307);
    float _375 = _317 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = _327 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = abs(_331);
    float _381 = fma(_371, _379, _369);
    bool _383 = !_347;
    float _399;
    if (!_383)
    {
        float _385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _387 = _147 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _389 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _391 = _389 * _385;
        float _393 = floor(_391);
        float _395 = -_393;
        float _397 = _391 + _395;
        _399 = _397;
        _401 = true;
    }
    else
    {
        float _403 = float(_93);
        float _405 = 1.0 / _403;
        float _407 = _127 * _405;
        _399 = _407;
    }
    _401 = false;
    float _409 = _399;
    float _411 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _413 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _417 = _381 * _375;
    float _419 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _411);
    float _421 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _423 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _415);
    float _425 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _427 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _421);
    float _431 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _423);
    float _433 = _425 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _439 = _431 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _441 = in.m_51.y;
    float _443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _445 = _435 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _449 = _437 + _447;
    float _451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _453 = _439 + _451;
    bool _455 = _147 > 0.5;
    float _457 = _445 * _445;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _461 = fma(_449, _449, _457);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _465 = _463 != 0;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _469 = _467 != 0;
    float _471 = fma(_453, _453, _461);
    float _473 = sqrt(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = _441 > 0.5;
    float _481 = rsqrt(_471);
    float _483 = _473 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _485 = 1.0 / _477;
    float _487 = precise::min(_433, _483);
    float _489 = _445 * _481;
    float _491 = _449 * _481;
    float _493 = _453 * _481;
    out.m_58.w = _487;
    float _495 = -_489;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _445);
    float _499 = -_491;
    float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[18].w, _449);
    float _503 = _489 * _487;
    float _505 = _491 * _487;
    float _507 = _497 * _497;
    float _509 = fma(_501, _501, _507);
    float _511 = -_503;
    float _513 = _445 + _511;
    float _515 = -_505;
    float _517 = _449 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = -_493;
    float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _453);
    float _527 = _513 * _513;
    bool _529 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = isnan(_409);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _521 * _485;
    float _543 = fma(_525, _525, _509);
    float _545 = fma(_517, _517, _527);
    float _547 = _493 * _487;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _409 + _549;
    bool _553 = _409 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _555 = isnan(_409);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_539;
    float _567 = _565 + 1.0;
    float _569 = -_547;
    float _571 = _453 + _569;
    float _573 = fma(_541, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _575 = sqrt(_543);
    float _577 = _563 * _567;
    float _579 = fma(_571, _571, _545);
    float _581 = _445 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _583 = -_191;
    int _585 = _455 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = _573 * _577;
    float _589 = -_205;
    int _591 = _479 ? as_type<int>(_589) : as_type<int>(_205);
    float _593 = fma(_449, (*spvDescriptorSet0.vp_c8)._m0[28].x, _581);
    float _595 = sqrt(_579);
    bool _597 = !_465;
    float _599 = _597 ? _191 : as_type<float>(_585);
    float _601 = -_563;
    float _603 = _601 + 1.0;
    bool _605 = !_469;
    float _607 = _605 ? _205 : as_type<float>(_591);
    float _609 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[28].z, _593);
    float _611 = _599 + 0.5;
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[115].x, _587);
    float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _617 = -_607;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _481 * _575;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[116].x, _613);
    float _631 = _481 * _595;
    float _633 = _625 * _459;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * _623;
    float _639 = _627 * _615;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _645 = _581;
    float _647 = _487;
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _671 = as_type<int>(_649);
    if (_621)
    {
        float _673 = _649 * 5.0;
        _671 = as_type<int>(_673);
    }
    int _675 = _671;
    float _677 = _425 * _637;
    out.m_60.x = _659;
    out.m_60.y = _661;
    out.m_60.z = _663;
    out.m_62.x = _633;
    out.m_62.y = _639;
    out.m_64.x = _657;
    out.m_64.y = _665;
    out.m_64.z = _667;
    out.m_64.w = _669;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2271 = as_type<float>(_675);
        out.gl_Position.z = _2271;
    }
    if (_621)
    {
        out.m_47.x = 0.0;
    }
    out.m_66.x = _677;
    if (_621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _679 = -_489;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _435);
    float _683 = -_491;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _437);
    float _687 = -_493;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _439);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _697 = _685 + _695;
    float _699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _701 = _689 + _699;
    float _703 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].x, _703);
    float _707 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    bool _709 = _707 >= 0.0;
    float _711 = _701;
    if (_709)
    {
        _711 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _713 = _711;
    int _715 = as_type<int>(_713);
    if (_709)
    {
        out.m_47.x = 0.0;
    }
    if (_709)
    {
        float _717 = _713 * 5.0;
        _715 = as_type<int>(_717);
    }
    int _719 = _715;
    if (_709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2364 = as_type<float>(_719);
        out.gl_Position.z = _2364;
    }
    if (_709)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _721 = _381 * _377;
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _727 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _729 = _677 * _725;
    float _731 = _727 * _637;
    float _733 = _637 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _731 * _723;
    float _739 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].x, _739);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _747 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _749 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _751 = _747 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _439 + _751;
    float _757 = _437 + _753;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _755 + _759;
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _757 + _763;
    float _767 = _761 * _761;
    float _769 = fma(_765, _765, _767);
    float _771 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _773 = sqrt(_769);
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].x, _771);
    float _777 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _775);
    float _779 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _781 = _435 + _779;
    bool _783 = _773 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _785 = _779;
    float _787 = _777;
    float _789 = _757;
    float _791 = _769;
    if (!_783)
    {
        _785 = _757;
    }
    float _793 = _785;
    float _795 = _793;
    if (!_783)
    {
        _787 = _755;
    }
    float _797 = _787;
    float _799 = _797;
    if (!_783)
    {
        _789 = _781;
    }
    float _801 = _789;
    bool _803 = !_783;
    float _805 = _801;
    if (!_803)
    {
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _809 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _811 = _773 + _809;
        float _813 = rsqrt(_769);
        float _815 = _811 * _807;
        float _817 = _781 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = _815 * 0.15915493667125701904296875;
        float _821 = _819 * 6.283185482025146484375;
        float _823 = cos(_821);
        float _825 = _819 * 6.283185482025146484375;
        float _827 = sin(_825);
        float _829 = _823 + (-1.0);
        float _831 = fma(_827, _817, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _833 = _829 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = _813 * _831;
        float _837 = fma(_781, _823, _833);
        float _839 = fma(_765, _835, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _841 = fma(_761, _835, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _837;
        _795 = _839;
        _799 = _841;
    }
    float _843 = _805;
    float _845 = _795;
    float _847 = _799;
    float _849 = -_503;
    float _851 = _849 + _843;
    float _853 = -_505;
    float _855 = _853 + _845;
    float _857 = -_489;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _851);
    float _861 = -_547;
    float _863 = _861 + _847;
    float _865 = -_491;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _871 = _859 + _869;
    float _873 = -_493;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _879 = _867 + _877;
    float _881 = _871 * _871;
    float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _885 = _875 + _883;
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_885, _885, _887);
    float _891 = rsqrt(_889);
    float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _895 = _879 * _893;
    float _897 = _885 * _893;
    float _899 = _895 * _895;
    float _901 = _897 * _897;
    float _903 = _899 + _901;
    float _905 = sqrt(_903);
    bool _907 = _905 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _911 = _905 + _909;
    float _913 = _761;
    float _915 = _911;
    float _917 = _871;
    float _919 = _895;
    if (_907)
    {
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _913 = _921;
    }
    float _923 = _913;
    float _925 = _923;
    if (_907)
    {
        float _927 = _911 * _923;
        _915 = _927;
    }
    float _929 = _915;
    if (_907)
    {
        float _931 = rsqrt(_903);
        _925 = _931;
    }
    float _933 = _925;
    float _935 = _933;
    if (_907)
    {
        float _937 = _929 * 0.15915493667125701904296875;
        _791 = _937;
    }
    float _939 = _791;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _943 = _885;
    if (_907)
    {
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        _943 = _947;
    }
    float _949 = _943;
    float _951 = precise::max(0.0, _941);
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _955 = _781;
    float _957 = _951;
    if (_907)
    {
        float _959 = _939 * 6.283185482025146484375;
        float _961 = cos(_959);
        _955 = _961;
    }
    float _963 = _955;
    float _965 = -_893;
    float _967 = -_951;
    float _969 = fma(_871, _965, _967);
    if (_907)
    {
        float _971 = _969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _971;
    }
    float _973 = _917;
    float _975 = sqrt(_889);
    float _977 = _949;
    float _979 = _973;
    if (_907)
    {
        float _981 = fma(_949, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _977 = _981;
    }
    float _983 = _977;
    float _985 = _983;
    if (!_907)
    {
        _979 = _969;
    }
    float _987 = _979;
    float _989 = _987;
    if (_907)
    {
        float _991 = _933 * _983;
        _647 = _991;
    }
    float _993 = _647;
    if (!_907)
    {
        _985 = _899;
    }
    float _995 = _985;
    float _997 = _859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _999 = _995;
    float _1001 = _963;
    if (_907)
    {
        float _1003 = _963 + (-1.0);
        _957 = _1003;
    }
    float _1005 = _957;
    float _1007 = _1005;
    if (_907)
    {
        float _1009 = _895 * _993;
        _919 = _1009;
    }
    float _1011 = _919;
    float _1013 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _997);
    if (_907)
    {
        float _1015 = _1005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _935 = _1015;
    }
    float _1017 = _935;
    if (!_907)
    {
        _1007 = _897;
    }
    float _1019 = _1007;
    float _1021 = _1019;
    if (_907)
    {
        float _1023 = _897 * _993;
        _1021 = _1023;
    }
    float _1025 = _1021;
    if (_907)
    {
        float _1027 = _1011 * _1011;
        _999 = _1027;
    }
    float _1029 = _999;
    if (_907)
    {
        float _1031 = fma(_969, _963, _1017);
        _989 = _1031;
    }
    float _1033 = _989;
    if (!_907)
    {
        _1001 = _901;
    }
    float _1035 = _1001;
    float _1037 = _1035;
    if (_907)
    {
        float _1039 = _1025 * _1025;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = fma(_1033, _1033, _1029);
    float _1045 = _1043 + _1041;
    float _1047 = _859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1051 = fma(_975, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1049);
    float _1053 = precise::clamp(_1051, 0.0, 1.0);
    float _1055 = _859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1057 = rsqrt(_1045);
    float _1059 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1047);
    float _1061 = -_1053;
    float _1063 = _1061 + 1.0;
    float _1065 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1055);
    float _1067 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1059);
    float _1069 = _859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1071 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1073 = abs(_1063);
    float _1075 = log2(_1073);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1079 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1069);
    float _1081 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1087 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1079);
    float _1089 = _1057 * _1033;
    float _1091 = -_1085;
    float _1093 = fma(_1091, _953, 1.0);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1097 = _1057 * _1011;
    float _1099 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1101 = _1057 * _1025;
    float _1103 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1107 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1099);
    float _1109 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = log2(_1093);
    float _1113 = -_1105;
    float _1115 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1113);
    float _1117 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1107);
    float _1119 = _1089 + 1.0;
    float _1121 = -_1101;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1115);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1117);
    float _1127 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1129 = exp2(_1109);
    float _1131 = fma(_1123, -0.5, 0.5);
    float _1133 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1135 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1127);
    float _1137 = fma(_1123, 0.5, 0.5);
    float _1139 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1133);
    float _1141 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1135);
    float _1143 = 1.0 / _1125;
    float _1145 = fma(_1137, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1147 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1139);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1141);
    float _1151 = _1111 * 0.693147182464599609375;
    float _1153 = sqrt(_1131);
    float _1155 = -_1089;
    float _1157 = fma(_1129, _1119, _1155);
    float _1159 = fma(_1137, _1145, -0.212114393711090087890625);
    float _1161 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1147);
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1165 = fma(_1137, _1159, 1.570728778839111328125);
    float _1167 = fma(_1157, 0.5, 0.5);
    float _1169 = _1149 * _1143;
    float _1171 = _1161 * _1143;
    float _1173 = fma(_1169, 0.5, 0.5);
    float _1175 = fma(_1171, -0.5, 0.5);
    float _1177 = _1153 * 0.636619746685028076171875;
    float3 _3129 = float3(_1173, _1175, _1163);
    float _1179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3129, float3(0.0), isnan(_3129)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3129, float3(0.0), isnan(_3129)), level(0.0)).x;
    float3 _3140 = float3(_1173, _1175, _1163);
    float4 _1182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3140, float3(0.0), isnan(_3140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3140, float3(0.0), isnan(_3140)), level(0.0)).xyzw;
    float _1184 = _1182.x;
    float _1186 = _1182.y;
    float _1188 = _1182.z;
    float _1190 = _1182.w;
    float _1192 = -_1165;
    float _1194 = fma(_1177, _1192, 1.0);
    float2 _3162 = float2(_1194, _1167);
    float3 _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3162, float2(0.0), isnan(_3162)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3162, float2(0.0), isnan(_3162)), level(0.0)).xyz;
    float _1200 = _1198.x;
    float _1202 = _1198.y;
    float _1204 = _1198.z;
    float _1206 = -_505;
    float _1208 = _437 + _1206;
    float _1210 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1212 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1214 = -_503;
    float _1216 = _435 + _1214;
    float _1218 = _1125 * 0.5;
    float _1220 = -_547;
    float _1222 = _439 + _1220;
    float _1224 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1212);
    float _1226 = exp2(_1210);
    float _1228 = -_489;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1232 = fma(_1161, -0.5, _1218);
    float _1234 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1236 = -_491;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1208);
    float _1240 = -_493;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1244 = _1149 + _1125;
    float _1246 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1234);
    float _1248 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_68.x = _867;
    out.m_68.y = _859;
    out.m_68.z = _875;
    float _1250 = _1246 + _1125;
    float _1252 = _1244 * 0.5;
    float _1254 = _1248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _1238;
    out.m_70.y = _1230;
    out.m_70.z = _1242;
    float _1256 = _1250 * 0.5;
    float _1258 = -_1226;
    float _1260 = _1258 + 1.0;
    out.gl_Position.x = _1149;
    out.gl_Position.y = _1161;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1125;
    float _1262 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.x = _1252;
    out.m_72.y = _1232;
    out.m_72.z = _1256;
    out.m_72.w = _1125;
    out.m_47.x = _1254;
    float _1264 = _1262 * _1179;
    float _1266 = -_1262;
    float _1268 = _1266 + 1.0;
    float _1270 = _1190 * _1264;
    float _1272 = _1190 * _1268;
    float _1274 = _1204 * _1264;
    float _1276 = fma(_1200, _1270, _1184);
    float _1278 = fma(_1202, _1270, _1186);
    float _1280 = fma(_1190, _1274, _1188);
    out.m_74.x = _1276;
    out.m_74.y = _1278;
    out.m_74.z = _1280;
    out.m_74.w = _1272;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

