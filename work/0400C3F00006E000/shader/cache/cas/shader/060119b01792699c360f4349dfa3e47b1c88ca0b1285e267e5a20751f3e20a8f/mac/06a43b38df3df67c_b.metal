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
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_70 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _451 = false;
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
        float _2893 = as_type<float>(_105);
        out.gl_Position.z = _2893;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2963 = as_type<float>(_143);
        out.gl_Position.z = _2963;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = _169 * 6.283185482025146484375;
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = floor(_169);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _173 * 0.15915493667125701904296875;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = in.m_47.x;
    float _193 = in.m_47.y;
    float _195 = in.m_47.z;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_175);
    bool _205 = !_181;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_185;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _187 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_177;
    float _219 = _169 + _217;
    float _221 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _223 = _219 < 0.5;
    float _225 = float(_223);
    float _227 = _201 * 6.283185482025146484375;
    float _229 = cos(_227);
    float _231 = -_203;
    float _233 = _175 + _231;
    float _235 = _203;
    float _237 = _221;
    if (!_161)
    {
        float _239 = _221 * _221;
        float _241 = _239 * 0.5;
        _235 = _241;
    }
    float _243 = _235;
    float _245 = _243;
    if (!_161)
    {
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = fma(_215, 0.5, 0.5);
    bool _253 = !_161;
    float _255 = _249;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _221 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _221);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_161;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _221 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _237 = _309;
    }
    float _311 = _237;
    float _313 = -_219;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_225;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_199;
    int _323 = _321 ? 0 : 1;
    float _325 = -_251;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _335 = _333 != 0;
    float _337 = in.m_54.w;
    bool _339 = _233 < 0.5;
    float _341 = float(_339);
    float _343 = -_233;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    bool _355 = !_331;
    int _357 = _355 ? 0 : 1;
    float _359 = -_341;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = fma(_311, _191, _347);
    float _365 = in.m_54.x;
    int _367 = abs(_323);
    float _369 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _371 = abs(_357);
    float _373 = in.m_54.y;
    float _375 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = fma(_229, 0.5, 0.5);
    bool _381 = !_335;
    int _383 = _381 ? 0 : 1;
    float _385 = fma(_311, _193, _369);
    float _387 = float(_371);
    float _389 = fma(_311, _195, _375);
    int _391 = abs(_383);
    float _393 = -_379;
    float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _397 = float(_367);
    float _399 = abs(_315);
    float _401 = _387 * _399;
    float _403 = abs(_345);
    float _405 = _387 * _403;
    float _407 = float(_391);
    float _409 = fma(_397, _327, _401);
    float _411 = fma(_397, _395, _405);
    float _413 = fma(_363, _337, _349);
    float _415 = fma(_385, _337, _351);
    float _417 = abs(_319);
    float _419 = fma(_407, _417, _409);
    float _421 = fma(_389, _337, _353);
    float _423 = abs(_361);
    float _425 = fma(_407, _423, _411);
    float _427 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _431 = !_377;
    int _433 = as_type<int>(_421);
    float _449;
    if (!_431)
    {
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _437 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_89);
        float _455 = 1.0 / _453;
        float _457 = _123 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _543 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _545 = isnan(_459);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _521 * _539;
    float _557 = _533 * _525;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _459 + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _541 * _555;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_557, _561, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _575 = -_553;
    float _577 = _575 + 1.0;
    float _579 = _565 * _527;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _459 + _581;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _587 = _483 * _577;
    float _589 = fma(_579, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = fma(_573, _535, _585);
    float _593 = fma(_589, _587, _591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[118].x, _593);
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _603;
    out.m_56.y = _605;
    out.m_56.z = _607;
    out.m_56.w = _609;
    bool _611 = !_523;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _615 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_89);
        float _633 = 1.0 / _631;
        float _635 = _123 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = _145 * 2.0;
    float _641 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = floor(_639);
    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _653 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _655 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _657 = precise::max(_653, _655);
    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _651);
    bool _665 = _657 >= 16.0;
    float _667 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = _607;
    int _675 = as_type<int>(_657);
    int _677 = as_type<int>(_663);
    if (_645)
    {
        float _679 = in.m_49.y;
        _673 = _679;
    }
    float _681 = _673;
    if (_645)
    {
        _433 = 0;
    }
    int _683 = _433;
    int _685 = _683;
    if (_645)
    {
        _675 = as_type<int>(_145);
    }
    int _687 = _675;
    float _689 = _605;
    int _691 = _687;
    if (_645)
    {
        float _693 = in.m_49.z;
        _689 = _693;
    }
    float _695 = _689;
    bool _697 = _649 > 0.0;
    bool _699 = _649 >= 0.0;
    bool _701 = isnan(_649);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _707 ? 0 : 1;
    int _711 = ~_709;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    int _717 = _715;
    bool _719 = _697;
    int _721 = _709;
    if (!_697)
    {
        int _723 = ~_709;
        int _725 = _723 + 1;
        _717 = _725;
    }
    int _727 = _717;
    if (_645)
    {
        _719 = false;
    }
    bool _729 = _719;
    bool _731 = _729;
    float _733 = _681;
    if (_645)
    {
        _677 = as_type<int>(_681);
    }
    int _735 = _677;
    float _737 = _695;
    int _739 = _735;
    if (_645)
    {
        _721 = as_type<int>(_695);
    }
    int _741 = _721;
    int _743 = _741;
    if (!_645)
    {
        float _745 = in.m_49.y;
        float _747 = _145 * 3.1415927410125732421875;
        float _749 = in.m_49.z;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _745 * 3.1415927410125732421875;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _749 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _759 * 6.283185482025146484375;
        float _767 = sin(_765);
        float _769 = _763 * 6.283185482025146484375;
        float _771 = sin(_769);
        _737 = _749;
        _731 = true;
        _739 = as_type<int>(_767);
        _691 = as_type<int>(_755);
        _743 = as_type<int>(_771);
        _733 = _745;
        _685 = 2;
    }
    float _773 = _737;
    bool _775 = _731;
    int _777 = _739;
    int _779 = _691;
    int _781 = _743;
    float _783 = _733;
    int _785 = _685;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    float _791 = _773 * 2.0;
    float _793 = _775 ? as_type<float>(_777) : as_type<float>(_779);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _797 = _775 ? as_type<float>(_781) : as_type<float>(_777);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _801 = _783 * 2.0;
    float _803 = fma(as_type<float>(_779), (*spvDescriptorSet0.vp_c9)._m0[93].z, _795);
    float _805 = as_type<float>(_779) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _807 = fma(as_type<float>(_777), (*spvDescriptorSet0.vp_c9)._m0[93].w, _799);
    float _809 = as_type<float>(_777) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _811 = floor(_791);
    float _813 = _669 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _815 = _785 != 2;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _821 = floor(_801);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[98].w, _817);
    float _825 = _797 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _827 = _789 * _123;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _833 = fma(_825, -2.0, _819);
    float _835 = exp2(_827);
    float _837 = -_829;
    float _839 = fma(_805, 2.0, _837);
    float _841 = _783 + _773;
    bool _843 = _811 >= 0.0;
    bool _845 = isnan(_811);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = fma(_809, -2.0, _831);
    bool _855 = _811 > 0.0;
    float _857 = _841 + (-1.0);
    float _859 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _861 = _821 > 0.0;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _865 = _851 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _869 = _821 >= 0.0;
    bool _871 = isnan(_821);
    bool _873 = _869 || _871;
    bool _875 = isnan(0.0);
    bool _877 = _873 || _875;
    float _879 = _145 + _783;
    float _881 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[98].z, _867);
    int _883 = _877 ? 0 : 1;
    float _885 = _793 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _887 = ~as_type<int>(_865);
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _895 = -_835;
    float _897 = _895 + 1.0;
    int _899 = ~_883;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _145 + _773;
    int _907 = _891;
    int _909 = _903;
    float _911 = _865;
    if (!_855)
    {
        int _913 = ~as_type<int>(_865);
        int _915 = _913 + 1;
        _907 = _915;
    }
    int _917 = _907;
    float _919 = _879 + (-1.0);
    if (!_861)
    {
        int _921 = ~_883;
        int _923 = _921 + 1;
        _909 = _923;
    }
    int _925 = _909;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _813 + _927;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_893;
    float _943 = fma(_885, 2.0, _941);
    float _945 = _905 + (-1.0);
    float _947 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _949 = _939 ? _897 : 0.0;
    float _951 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _859 + _953;
    float _957 = _929 * _929;
    float _959 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _951 + _961;
    float _965 = fma(_955, _955, _957);
    float _967 = _957;
    if (_775)
    {
        _967 = _783;
    }
    float _969 = _967;
    float _971 = -_123;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[96].x, _943);
    float _975 = fma(_963, _963, _965);
    float _977 = 0.0;
    float _979 = _969;
    if (_775)
    {
        _977 = _969;
    }
    float _981 = _977;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _985 = _773 > 0.5;
    float _987 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _803);
    float _989 = 0.0;
    float _991 = _981;
    if (_775)
    {
        _989 = _981;
    }
    float _993 = _989;
    float _995 = rsqrt(_975);
    float _997 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _807);
    float _999 = _993;
    if (!_775)
    {
        _979 = _783;
    }
    float _1001 = _979;
    float _1003 = -_123;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[91].x, _839);
    float _1007 = _1001;
    if (!_775)
    {
        _991 = _145;
    }
    float _1009 = _991;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1019 = _1017 != 0;
    float _1021 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _853);
    bool _1023 = _783 > 0.5;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    float _1027 = 0.0;
    if (_775)
    {
        _1027 = _773;
    }
    float _1029 = _1027;
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].z, _881);
    float _1033 = _1029;
    if (!_775)
    {
        _1033 = _1001;
    }
    float _1035 = _1033;
    float _1037 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].w, _823);
    float _1039 = -_211;
    int _1041 = _985 ? as_type<int>(_1039) : as_type<int>(_211);
    float _1043 = _929 * _995;
    float _1045 = -_207;
    int _1047 = _1023 ? as_type<int>(_1045) : as_type<int>(_207);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1011);
    if (_815)
    {
        _911 = _145;
    }
    float _1051 = _911;
    float _1053 = -_1043;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _1057 = _1051;
    if (!_775)
    {
        _999 = _145;
    }
    float _1059 = _999;
    float _1061 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1063 = _1055 * _1055;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_815)
    {
        _1057 = _773;
    }
    float _1067 = _1057;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1071 = 0.0;
    if (_775)
    {
        _1071 = _773;
    }
    float _1073 = _1071;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1077 = _1073;
    if (!_775)
    {
        _1077 = _1001;
    }
    float _1079 = _1077;
    float _1081 = -_1069;
    float _1083 = fma(_1065, 2.0, _1081);
    bool _1085 = !_1019;
    float _1087 = _1085 ? _211 : as_type<float>(_1041);
    bool _1089 = !_1015;
    float _1091 = _1089 ? _207 : as_type<float>(_1047);
    if (!_815)
    {
        _1007 = _145;
    }
    float _1093 = _1007;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1105 = _1103 != 0;
    float _1107 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1109 = _955 * _995;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1113 = -_1075;
    float _1115 = fma(_1107, 2.0, _1113);
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1121 = -_1109;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1125 = -_123;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1129 = fma(_1117, -2.0, _1119);
    float _1131 = fma(_1123, _1123, _1063);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1135 = 1.0 + _1133;
    float _1137 = _963 * _995;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = -_1137;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1147 = 1.0 / _1135;
    float _1149 = fma(_1111, -2.0, _1139);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1153 = fma(_1145, _1145, _1131);
    float _1155 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1129);
    bool _1169 = !_1097;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1151);
    bool _1175 = !_1105;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[96].y, _833);
    int _1181 = abs(_1171);
    float _1183 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1173);
    int _1185 = abs(_1177);
    float _1187 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1025);
    float _1189 = float(_917);
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1193 = float(_925);
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1049);
    float _1197 = float(_1181);
    float _1199 = -_123;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1083);
    float _1203 = float(_1185);
    float _1205 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1149);
    float _1207 = _1137;
    if (_1165)
    {
        float _1209 = _949 * _1147;
        _125 = _1209;
    }
    float _1211 = _125;
    float _1213 = _1197 * _1189;
    bool _1215 = !_1101;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1203 * _1193;
    float _1221 = _1213 * (-2.0);
    int _1223 = abs(_1217);
    float _1225 = _145 + (-0.5);
    float _1227 = _665 ? _1061 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1231 = fma(_947, _1221, _947);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1235 = float(_727);
    float _1237 = _1219 * (-2.0);
    float _1239 = _665 ? _1229 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1241 = fma(_1231, _1211, _1233);
    float _1243 = abs(_1227);
    bool _1245 = _1243 != 0.0;
    bool _1247 = isnan(_1243);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_959, _1237, _959);
    float _1257 = float(_1223);
    float _1259 = _1241 * 0.15915493667125701904296875;
    float _1261 = abs(_1239);
    bool _1263 = _1261 == 0.0;
    bool _1265 = !_1253;
    bool _1267 = _1263 && _1265;
    float _1269 = _783 + (-0.5);
    float _1271 = abs(_1239);
    bool _1273 = _1271 == 0.0;
    float _1275 = _1257 * _1235;
    bool _1277 = _145 > 0.5;
    float _1279 = _773 + (-0.5);
    float _1281 = sqrt(_1153);
    float _1283 = _1275 * (-2.0);
    float _1285 = -_207;
    int _1287 = _1277 ? as_type<int>(_1285) : as_type<int>(_207);
    float _1289 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1293 = fma(_863, _1283, _863);
    float _1295 = -_211;
    int _1297 = _1023 ? as_type<int>(_1295) : as_type<int>(_211);
    float _1299 = _1259 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1309 = _1307 != 0;
    float _1311 = fma(_1293, _1211, _1289);
    bool _1313 = _1105;
    int _1315 = as_type<int>(_1289);
    int _1317 = _1297;
    int _1319 = _1253 ? (-1) : 0;
    if (_1267)
    {
        bool _1321 = as_type<int>(_1239) >= 0;
        _1313 = _1321;
    }
    bool _1323 = _1313;
    float _1325 = fma(_1255, _1211, _1291);
    bool _1327 = !_1309;
    float _1329 = _1327 ? _211 : as_type<float>(_1297);
    float _1331 = _1259 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    if (_1267)
    {
        int _1335 = _1323 ? 0 : 1078530011;
        _1315 = _1335;
    }
    int _1337 = _1315;
    bool _1339 = !_1305;
    float _1341 = _1339 ? _207 : as_type<float>(_1287);
    if (_1267)
    {
        int _1343 = int(0x80000000) & as_type<int>(_1227);
        int _1345 = _1337 | _1343;
        _1317 = _1345;
    }
    int _1347 = _1317;
    bool _1349 = !_1253;
    bool _1351 = _1349 && _1273;
    int _1353 = _1347;
    float _1355 = as_type<float>(_1347);
    if (!_1351)
    {
        float _1357 = abs(_1227);
        bool _1359 = _1357 != as_type<float>(0x7f800000u /* inf */);
        bool _1361 = isnan(_1357);
        bool _1363 = _1359 || _1361;
        bool _1365 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1367 = _1363 || _1365;
        float _1369 = abs(_1239);
        bool _1371 = _1369 == as_type<float>(0x7f800000u /* inf */);
        float _1373 = abs(_1239);
        bool _1375 = _1373 == as_type<float>(0x7f800000u /* inf */);
        bool _1377 = !_1367;
        bool _1379 = _1375 && _1377;
        if (_1379)
        {
            bool _1381 = as_type<int>(_1239) >= 0;
            _1319 = _1381 ? (-1) : 0;
        }
        int _1383 = _1319;
        if (_1379)
        {
            _1353 = 1075235812;
        }
        int _1385 = _1353;
        int _1387 = _1385;
        if (_1379)
        {
            int _1389 = ~_1383;
            int _1391 = (_1389 != 0) ? _1385 : 1061752795;
            _1387 = _1391;
        }
        int _1393 = _1387;
        float _1395 = as_type<float>(_1393);
        if (_1379)
        {
            int _1397 = int(0x80000000) & as_type<int>(_1227);
            int _1399 = _1393 | _1397;
            _1395 = as_type<float>(_1399);
        }
        float _1401 = _1395;
        bool _1403 = !_1367;
        bool _1405 = _1403 && _1371;
        _1355 = _1401;
        if (!_1405)
        {
            float _1407 = abs(_1227);
            float _1409 = abs(_1239);
            float _1411 = precise::max(_1407, _1409);
            float _1413 = abs(_1227);
            float _1415 = abs(_1239);
            float _1417 = precise::min(_1413, _1415);
            float _1419 = 1.0 / _1411;
            float _1421 = abs(_1227);
            float _1423 = abs(_1239);
            bool _1425 = _1421 > _1423;
            bool _1427 = as_type<int>(_1239) >= 0;
            float _1429 = _1417 * _1419;
            float _1431 = abs(_1227);
            float _1433 = abs(_1239);
            float _1435 = _1431 + _1433;
            int _1437 = as_type<int>(_1227) & int(0x80000000);
            float _1439 = _1429 * _1429;
            bool _1441 = _1435 > as_type<float>(0x7f800000u /* inf */);
            bool _1443 = isnan(_1435);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1449 = _1445 || _1447;
            float _1451 = _1439 + 11.33538818359375;
            float _1453 = fma(_1439, _1451, 28.84246826171875);
            float _1455 = fma(_1439, _1453, 19.6966705322265625);
            float _1457 = fma(_1439, -0.82336294651031494140625, -5.674867153167724609375);
            float _1459 = fma(_1439, _1457, -6.565555095672607421875);
            float _1461 = 1.0 / _1455;
            float _1463 = _1439 * _1459;
            float _1465 = _1429 * _1463;
            float _1467 = fma(_1465, _1461, _1429);
            float _1469 = _1467;
            _1355 = _1435;
            if (_1425)
            {
                float _1471 = -_1467;
                float _1473 = _1471 + 1.57079637050628662109375;
                _1469 = _1473;
            }
            float _1475 = _1469;
            int _1477 = as_type<int>(_1475);
            if (!_1427)
            {
                float _1479 = -_1475;
                float _1481 = _1479 + 3.1415927410125732421875;
                _1477 = as_type<int>(_1481);
            }
            int _1483 = _1477;
            if (!_1449)
            {
                int _1485 = _1437 | _1483;
                _1355 = as_type<float>(_1485);
            }
        }
    }
    float _1487 = _1355;
    float _1489 = _1311 + _1487;
    float _1491 = _1325 * 0.15915493667125701904296875;
    float _1493 = _425 * _429;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1497 = _1489 * 0.15915493667125701904296875;
    float _1499 = _1491 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _995 * _1281;
    float _1505 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1507 = _419 * _427;
    float _1509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1513 = _1511 * 0.5;
    float _1515 = _1505 * _1503;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1519 = _1497 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = -_1109;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _1527 = _1515 * _1495;
    float _1529 = _1517 * _1503;
    float _1531 = -_1043;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1543 = _1539 || _1541;
    float _1545 = _1529 * _1509;
    float _1547 = _1497 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * _1527;
    bool _1553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1555 = isnan(0.5);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1561 = _1557 || _1559;
    float _1563 = _1491 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1333 * _1521;
    float _1569 = _1301 * _1549;
    float _1571 = _1301 * _1551;
    float _1573 = _1301 * _1521;
    float _1575 = _1333 * _1549;
    float _1577 = _1549 * _1501;
    float _1579 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1581 = _1521 * _1501;
    float _1583 = -_1137;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1587 = -_1567;
    float _1589 = fma(_1565, _1569, _1587);
    float _1591 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1593 = _1333 * _1551;
    float _1595 = fma(_1565, _1575, _1573);
    float _1597 = fma(_1589, _1545, _1571);
    float _1599 = -_1527;
    float _1601 = _1565 * _1599;
    float _1603 = fma(_1565, _1573, _1575);
    float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1607 = -_1569;
    float _1609 = fma(_1565, _1567, _1607);
    float _1611 = fma(_1577, _1545, _1601);
    float _1613 = fma(_1603, _1513, _1597);
    float _1615 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1617 = fma(_1595, _1545, _1593);
    float _1619 = fma(_1581, _1513, _1611);
    float _1621 = _951 + _1613;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1615);
    float _1627 = _859 + _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1621 + _1629;
    float _1633 = 1.0 / _1623;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1627 + _1635;
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1609, _1513, _1617);
    float _1643 = fma(_1637, _1637, _1639);
    float _1645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1647 = _813 + _1641;
    float _1649 = sqrt(_1643);
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1653 = _1651 + _1623;
    float _1655 = _1653 * _1633;
    float _1657 = _1655 * 0.5;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    bool _1663 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = 1.0 / _1661;
    bool _1667 = !_1663;
    float _1669 = _1627;
    float _1671 = _1621;
    float _1673 = _1647;
    float _1675 = _1641;
    float _1677 = _1567;
    float _1679 = _1503;
    float _1681 = _1623;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1667)
    {
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1689 = _1649 + _1687;
        float _1691 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1693 = rsqrt(_1643);
        float _1695 = _1689 * _1685;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1697 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 + (-1.0);
        float _1709 = fma(_1705, _1691, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1711 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1693 * _1709;
        float _1715 = fma(_1647, _1701, _1711);
        float _1717 = fma(_1637, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1631, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1669 = _1717;
        _1671 = _1719;
        _1673 = _1715;
        _1675 = _1711;
        _1677 = _1705;
    }
    float _1721 = _1669;
    float _1723 = _1671;
    float _1725 = _1673;
    float _1727 = _1675;
    float _1729 = _1677;
    float _1731 = -_1109;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1735 = -_1137;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1723);
    float _1739 = -_1043;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1725);
    float _1743 = _1729;
    float _1745 = _1733;
    float _1747 = _1741;
    float _1749 = _1721;
    float _1751 = _1737;
    float _1753 = _1727;
    if (_1561)
    {
        _1743 = 1.0;
    }
    float _1755 = _1743;
    float _1757 = _1755;
    if (_1543)
    {
        _1207 = _1733;
    }
    float _1759 = _1207;
    float _1761 = _1759;
    if (_1543)
    {
        _1745 = _1737;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1543)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1533 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1525 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1777 = -_951;
        float _1779 = _1777 + _1723;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1585 + _1783;
        float _1787 = -_859;
        float _1789 = _1787 + _1721;
        float _1791 = fma(_1773, _1773, _1781);
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1795 = fma(_1785, _1785, _1791);
        float _1797 = sqrt(_1795);
        float _1799 = 1.0 / _1503;
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1775;
        float _1807 = _1805 * _1799;
        float _1809 = -_813;
        float _1811 = _1809 + _1725;
        float _1813 = _1801 * _1807;
        float _1815 = _1779 * _1807;
        float _1817 = fma(_1789, _1813, _1525);
        float _1819 = fma(_1811, _1813, _1533);
        float _1821 = fma(_1801, _1815, _1585);
        _1747 = _1819;
        _1761 = _1817;
        _1765 = _1821;
        _1749 = _1789;
    }
    float _1823 = _1747;
    float _1825 = _1761;
    float _1827 = _1765;
    float _1829 = _1749;
    if (_1561)
    {
        _1679 = 1.0;
    }
    float _1831 = _1679;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1665 * _1833;
    float _1837 = _1835;
    float _1839 = _1831;
    if (!_1561)
    {
        float _1841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = _1841 * 0.15915493667125701904296875;
        float _1845 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1847;
        float _1851 = _1843 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = _1845 * 0.15915493667125701904296875;
        float _1857 = _1843 * 6.283185482025146484375;
        float _1859 = sin(_1857);
        float _1861 = 1.0 / _1853;
        float _1863 = _1855 * 6.283185482025146484375;
        float _1865 = cos(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = _1855 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1865 * _1867;
        float _1875 = 1.0 / _1849;
        float _1877 = 1.0 / _1873;
        float _1879 = _1871 * _1877;
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = fma(_1835, _1879, _1881);
        float _1885 = _1883 * _1875;
        float _1887 = precise::clamp(_1885, 0.0, 1.0);
        _1757 = _1887;
    }
    float _1889 = _1757;
    if (!_1561)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = fma(_1835, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        float _1939 = -_1937;
        float _1941 = _1939 + 1.0;
        _1751 = _1929;
        _1837 = _1937;
        _1839 = _1941;
    }
    float _1943 = _1751;
    float _1945 = _1837;
    float _1947 = _1839;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1951 = _1823 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1955 = _1825 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1827 + _1957;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = fma(_1959, _1959, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1955 * _1971;
    float _1975 = _1959 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1943;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1977;
    float _2003 = _1979;
    if (_1985)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1985)
    {
        float _2009 = rsqrt(_1981);
        _1993 = _2009;
    }
    float _2011 = _1993;
    if (_1985)
    {
        float _2013 = _1989 * _2007;
        _1995 = _2013;
    }
    float _2015 = _1995;
    if (_1985)
    {
        float _2017 = _2015 * 0.15915493667125701904296875;
        _1753 = _2017;
    }
    float _2019 = _1753;
    float _2021 = _1725;
    if (_1985)
    {
        float _2023 = _2019 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1945;
    float _2035 = _2031;
    float _2037 = _2029;
    if (_1985)
    {
        float _2039 = _2019 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = -_1971;
    float _2047 = -_2031;
    float _2049 = fma(_1951, _2045, _2047);
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    float _2059 = _2027;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2067 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2065);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2063;
    if (_1985)
    {
        float _2073 = _2043 + (-1.0);
        _2037 = _2073;
    }
    float _2075 = _2037;
    if (_1985)
    {
        float _2077 = _2011 * _2063;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2069;
    float _2083 = _2081 + 1.0;
    if (_1985)
    {
        float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2085;
    }
    float _2087 = _2071;
    if (_1985)
    {
        float _2089 = _1973 * _2079;
        _1997 = _2089;
    }
    float _2091 = _1997;
    if (_1985)
    {
        float _2093 = _1975 * _2079;
        _1999 = _2093;
    }
    float _2095 = _1999;
    if (_1985)
    {
        float _2097 = fma(_2049, _2043, _2087);
        _2051 = _2097;
    }
    float _2099 = _2051;
    if (_1985)
    {
        float _2101 = _2091 * _2091;
        _2001 = _2101;
    }
    float _2103 = _2001;
    if (_1985)
    {
        float _2105 = _2095 * _2095;
        _2003 = _2105;
    }
    float _2107 = _2003;
    float _2109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2111 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = abs(_2083);
    float _2119 = log2(_2117);
    float _2121 = _2113 + _2107;
    float _2123 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2129 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = rsqrt(_2121);
    float _2133 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2111);
    float _2139 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2141 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2127);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    float _2147 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2141);
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2109, 1.0);
    float _2155 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2131 * _2091;
    float _2165 = _2131 * _2099;
    float _2167 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2131 * _2095;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = exp2(_2159);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2185 = -_2169;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2189 = log2(_2153);
    float _2191 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2195 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2191);
    float _2197 = _2165 + 1.0;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2193);
    float _2201 = 1.0 / _2183;
    float _2203 = fma(_2187, -0.5, 0.5);
    float _2205 = fma(_2187, 0.5, 0.5);
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2209 = -_2165;
    float _2211 = fma(_2173, _2197, _2209);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2199);
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2219 = sqrt(_2203);
    float _2221 = _2189 * 0.693147182464599609375;
    float _2223 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2225 = fma(_2211, 0.5, 0.5);
    float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = fma(_2205, _2223, 1.570728778839111328125);
    float _2231 = _2217 * _2201;
    float _2233 = _2213 * _2201;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = fma(_2233, -0.5, 0.5);
    float _2239 = _2219 * 0.636619746685028076171875;
    float3 _6190 = float3(_2235, _2237, _2227);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6190, float3(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6190, float3(0.0), isnan(_6190)), level(0.0)).x;
    float3 _6201 = float3(_2235, _2237, _2227);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float _2254 = -_2229;
    float _2256 = fma(_2239, _2254, 1.0);
    float2 _6223 = float2(_2256, _2225);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2270 = _2268 != 0;
    float _2272 = in.m_49.w;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2276 = _2274 != 0;
    float _2278 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2282 = _2280 != 0;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2286 = _425 * _2278;
    float _2288 = -_1037;
    float _2290 = _2288 + 1.0;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2300 = _1829;
    float _2302 = _2237;
    bool _2304 = _2270;
    bool _2306 = _2276;
    if (_2270)
    {
        float _2308 = in.m_49.w;
        _2300 = _2308;
    }
    float _2310 = _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2318 = _2316 != 0;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2322 = _2235;
    bool _2324 = _2318;
    if (_2276)
    {
        float _2326 = in.m_49.z;
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2334 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_637);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _1341 + 0.5;
    float _2348 = _2227;
    if (_2282)
    {
        float _2350 = in.m_49.w;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2356 = -_1329;
    float _2358 = _2356 + 0.5;
    float _2360 = 1.0 / _2298;
    bool _2362 = _2272 > 0.5;
    float _2364 = -_1187;
    float _2366 = _2364 + 1.0;
    float _2368 = 1.0 / _2314;
    if (_2270)
    {
        float _2370 = _2310 * 3.1415927410125732421875;
        _2302 = _2370;
    }
    float _2372 = _2302;
    float _2374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2270)
    {
        float _2376 = _2372 * 0.15915493667125701904296875;
        _1681 = _2376;
    }
    float _2378 = _1681;
    float _2380 = _2328;
    if (_2276)
    {
        float _2382 = _2328 * 3.1415927410125732421875;
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2394 = -_211;
    int _2396 = _2362 ? as_type<int>(_2394) : as_type<int>(_211);
    float _2398 = _2384;
    if (_2276)
    {
        float _2400 = _2384 * 0.15915493667125701904296875;
        _2398 = _2400;
    }
    float _2402 = _2398;
    float _2404 = _2352;
    if (_2282)
    {
        float _2406 = _2352 * 3.1415927410125732421875;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2278;
    float _2412 = _2408;
    if (_2270)
    {
        float _2414 = _2378 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2392 * _2360;
    float _2422 = _2388 * _2368;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2426 = _637 + _2424;
    float _2428 = _211 * _2286;
    bool _2430 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2432 = isnan(_637);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = _2426;
    float _2444 = _2428;
    if (_2282)
    {
        float _2446 = _2408 * 0.15915493667125701904296875;
        _2412 = _2446;
    }
    float _2448 = _2412;
    bool _2450 = !_2318;
    float _2452 = _2450 ? _211 : as_type<float>(_2396);
    float _2454 = fma(_2422, _2426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2456 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2458 = isnan(_637);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = 1.0 / _2332;
    if (_2294)
    {
        float _2470 = _145 * 3.1415927410125732421875;
        _2442 = _2470;
    }
    float _2472 = _2442;
    float _2474 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = -_2466;
    float _2482 = _2480 + 1.0;
    float _2484 = _2472;
    if (_2294)
    {
        float _2486 = _2472 * 0.15915493667125701904296875;
        _2484 = _2486;
    }
    float _2488 = _2484;
    if (_2270)
    {
        bool _2490 = _2418 > 0.5;
        _2324 = _2490;
    }
    bool _2492 = _2324;
    float _2494 = _2466 * _2478;
    float _2496 = _2402;
    bool _2498 = _2492;
    if (_2276)
    {
        float _2500 = _2402 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        _2496 = _2502;
    }
    float _2504 = _2496;
    float _2506 = _419 * _2474;
    bool _2508 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2510 = isnan(_637);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = _2344 * _2482;
    float _2522 = -_2344;
    float _2524 = _2522 + 1.0;
    float _2526 = _207 * _2506;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2528;
    float _2532 = _2488;
    float _2534 = _2526;
    if (_2294)
    {
        float _2536 = _2488 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = _2518 * _2524;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2546 = _637 + _2544;
    float _2548 = _2530 * _2468;
    float _2550 = _2548;
    if (!_2270)
    {
        _1683 = _2526;
    }
    float _2552 = _1683;
    float _2554 = _2454 * _2542;
    float _2556 = -_2518;
    float _2558 = _2556 + 1.0;
    float _2560 = _2552;
    if (_2270)
    {
        float _2562 = -_2526;
        float _2564 = _2492 ? _2562 : _2526;
        _2560 = _2564;
    }
    float _2566 = _2560;
    float _2568 = _2448;
    if (_2282)
    {
        float _2570 = _2448 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    if (_2276)
    {
        bool _2576 = _2504 > 0.5;
        _2498 = _2576;
    }
    bool _2578 = _2498;
    float _2580 = fma(_2420, _2546, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2582 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2554);
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2586 = _637 + _2584;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_2580, _2520, _2582);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (_2294)
    {
        bool _2596 = _2540 > 0.5;
        _2304 = _2596;
    }
    bool _2598 = _2304;
    float _2600 = _2566 + 0.5;
    if (_2276)
    {
        float _2602 = -_2526;
        float _2604 = _2578 ? _2602 : _2526;
        _2534 = _2604;
    }
    float _2606 = _2534;
    float _2608 = fma(_2548, _2586, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (!_2294)
    {
        _2550 = _2428;
    }
    float _2610 = _2550;
    float _2612 = fma(_2354, _2600, _1005);
    float _2614 = _2610;
    if (_2294)
    {
        float _2616 = -_2428;
        float _2618 = _2598 ? _2616 : _2428;
        _2614 = _2618;
    }
    float _2620 = _2614;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_2282)
    {
        bool _2624 = _2574 > 0.5;
        _2306 = _2624;
    }
    bool _2626 = _2306;
    float _2628 = fma(_2608, _2494, _2592);
    float _2630 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2632 = _2620 + (-0.5);
    if (_2282)
    {
        float _2634 = -_2428;
        float _2636 = _2626 ? _2634 : _2428;
        _2444 = _2636;
    }
    float _2638 = _2444;
    float _2640 = _2606 + 0.5;
    float _2642 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2628);
    float _2644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2646 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2648 = _2638 + (-0.5);
    float _2650 = -_2630;
    float _2652 = -_1021;
    float _2654 = fma(_2650, _2632, _2652);
    float _2656 = _2642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2658 = -_2646;
    float _2660 = -_1179;
    float _2662 = fma(_2658, _2648, _2660);
    float _2664 = -_997;
    float _2666 = _2664 + 1.0;
    float _2668 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2670 = -_987;
    float _2672 = _2670 + 1.0;
    float _2674 = -_1031;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2666, _2620, _2654);
    float _2680 = fma(_2290, _2638, _2662);
    float _2682 = fma(_2668, _2640, _973);
    float _2684 = -_207;
    int _2686 = _985 ? as_type<int>(_2684) : as_type<int>(_207);
    float _2688 = _1091 + 0.5;
    float _2690 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2692 = -_2676;
    float _2694 = fma(_2692, _2606, _2682);
    bool _2696 = !_2590;
    float _2698 = _2696 ? _207 : as_type<float>(_2686);
    float _2700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2702 = fma(_2690, _2688, _1127);
    float _2704 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2706 = _2452 + (-0.5);
    out.m_58.x = _2694;
    out.m_58.y = _2680;
    float _2708 = -_2672;
    float _2710 = fma(_2708, _2566, _2612);
    float _2712 = _2698 + 0.5;
    float _2714 = -_2704;
    float _2716 = -_1167;
    float _2718 = fma(_2714, _2706, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2722 = _1889 > 0.0;
    bool _2724 = isnan(_1889);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    out.m_60.x = _2710;
    out.m_60.y = _2678;
    bool _2732 = _1947 <= 0.0;
    bool _2734 = !_2730;
    bool _2736 = _2732 || _2734;
    float _2738 = -_1195;
    float _2740 = _2738 + 1.0;
    out.m_62.w = _2656;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2744 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2746 = fma(_2452, _2740, _2718);
    float _2748 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2750 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2752 = fma(_2744, _2712, _1201);
    float _2754 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2756 = _1889 * _1947;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2760 = -_2366;
    float _2762 = fma(_2698, _2760, _2752);
    float _2764 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2766 = _2750 * _2720;
    float _2768 = _1087 + (-0.5);
    float _2770 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2764);
    float _2772 = exp2(_2748);
    float _2774 = _2754 * _2742;
    out.m_64.x = _2766;
    out.m_64.y = _2774;
    out.m_64.z = _2762;
    out.m_64.w = _2746;
    float _2776 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2778 = -_2776;
    float _2780 = -_1205;
    float _2782 = fma(_2778, _2768, _2780);
    float _2784 = _2756 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2770);
    float _2788 = -_1183;
    float _2790 = _2788 + 1.0;
    float _2792 = -_2772;
    float _2794 = _2792 + 1.0;
    float _2796 = -_1191;
    float _2798 = _2796 + 1.0;
    float _2800 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2786);
    float _2802 = _419 * _2784;
    float _2804 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2806 = fma(_1087, _2798, _2782);
    float _2808 = _2800 + _2183;
    float _2810 = -_2790;
    float _2812 = fma(_1091, _2810, _2702);
    float _2814 = -_2804;
    float _2816 = _2814 + 1.0;
    float _2818 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2820 = _2808 * 0.5;
    out.m_66.x = _2812;
    out.m_66.y = _2806;
    out.m_45.x = _2818;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _2800;
    out.gl_Position.w = _2183;
    out.m_68.z = _2820;
    out.m_68.w = _2183;
    float _2822 = _2804 * _2241;
    float _2824 = _2252 * _2822;
    float _2826 = _2266 * _2822;
    float _2828 = fma(_2262, _2824, _2246);
    float _2830 = fma(_2264, _2824, _2248);
    float _2832 = _2252 * _2816;
    float _2834 = fma(_2252, _2826, _2250);
    out.m_70.x = _2828;
    out.m_70.y = _2830;
    out.m_70.z = _2834;
    out.m_70.w = _2832;
    if (!_2736)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2836;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _451 = false;
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
        float _2893 = as_type<float>(_105);
        out.gl_Position.z = _2893;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2963 = as_type<float>(_143);
        out.gl_Position.z = _2963;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = _169 * 6.283185482025146484375;
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = floor(_169);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _173 * 0.15915493667125701904296875;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = in.m_47.x;
    float _193 = in.m_47.y;
    float _195 = in.m_47.z;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_175);
    bool _205 = !_181;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_185;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _187 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_177;
    float _219 = _169 + _217;
    float _221 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _223 = _219 < 0.5;
    float _225 = float(_223);
    float _227 = _201 * 6.283185482025146484375;
    float _229 = cos(_227);
    float _231 = -_203;
    float _233 = _175 + _231;
    float _235 = _203;
    float _237 = _221;
    if (!_161)
    {
        float _239 = _221 * _221;
        float _241 = _239 * 0.5;
        _235 = _241;
    }
    float _243 = _235;
    float _245 = _243;
    if (!_161)
    {
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = fma(_215, 0.5, 0.5);
    bool _253 = !_161;
    float _255 = _249;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _221 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _221);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_161;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _221 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _237 = _309;
    }
    float _311 = _237;
    float _313 = -_219;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_225;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_199;
    int _323 = _321 ? 0 : 1;
    float _325 = -_251;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _335 = _333 != 0;
    float _337 = in.m_54.w;
    bool _339 = _233 < 0.5;
    float _341 = float(_339);
    float _343 = -_233;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    bool _355 = !_331;
    int _357 = _355 ? 0 : 1;
    float _359 = -_341;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = fma(_311, _191, _347);
    float _365 = in.m_54.x;
    int _367 = abs(_323);
    float _369 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _371 = abs(_357);
    float _373 = in.m_54.y;
    float _375 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = fma(_229, 0.5, 0.5);
    bool _381 = !_335;
    int _383 = _381 ? 0 : 1;
    float _385 = fma(_311, _193, _369);
    float _387 = float(_371);
    float _389 = fma(_311, _195, _375);
    int _391 = abs(_383);
    float _393 = -_379;
    float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _397 = float(_367);
    float _399 = abs(_315);
    float _401 = _387 * _399;
    float _403 = abs(_345);
    float _405 = _387 * _403;
    float _407 = float(_391);
    float _409 = fma(_397, _327, _401);
    float _411 = fma(_397, _395, _405);
    float _413 = fma(_363, _337, _349);
    float _415 = fma(_385, _337, _351);
    float _417 = abs(_319);
    float _419 = fma(_407, _417, _409);
    float _421 = fma(_389, _337, _353);
    float _423 = abs(_361);
    float _425 = fma(_407, _423, _411);
    float _427 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _431 = !_377;
    int _433 = as_type<int>(_421);
    float _449;
    if (!_431)
    {
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _437 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_89);
        float _455 = 1.0 / _453;
        float _457 = _123 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _543 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _545 = isnan(_459);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _521 * _539;
    float _557 = _533 * _525;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _459 + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _541 * _555;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_557, _561, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _575 = -_553;
    float _577 = _575 + 1.0;
    float _579 = _565 * _527;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _459 + _581;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _587 = _483 * _577;
    float _589 = fma(_579, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = fma(_573, _535, _585);
    float _593 = fma(_589, _587, _591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[118].x, _593);
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _603;
    out.m_56.y = _605;
    out.m_56.z = _607;
    out.m_56.w = _609;
    bool _611 = !_523;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _615 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_89);
        float _633 = 1.0 / _631;
        float _635 = _123 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = _145 * 2.0;
    float _641 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = floor(_639);
    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _653 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _655 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _657 = precise::max(_653, _655);
    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _651);
    bool _665 = _657 >= 16.0;
    float _667 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = _607;
    int _675 = as_type<int>(_657);
    int _677 = as_type<int>(_663);
    if (_645)
    {
        float _679 = in.m_49.y;
        _673 = _679;
    }
    float _681 = _673;
    if (_645)
    {
        _433 = 0;
    }
    int _683 = _433;
    int _685 = _683;
    if (_645)
    {
        _675 = as_type<int>(_145);
    }
    int _687 = _675;
    float _689 = _605;
    int _691 = _687;
    if (_645)
    {
        float _693 = in.m_49.z;
        _689 = _693;
    }
    float _695 = _689;
    bool _697 = _649 > 0.0;
    bool _699 = _649 >= 0.0;
    bool _701 = isnan(_649);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _707 ? 0 : 1;
    int _711 = ~_709;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    int _717 = _715;
    bool _719 = _697;
    int _721 = _709;
    if (!_697)
    {
        int _723 = ~_709;
        int _725 = _723 + 1;
        _717 = _725;
    }
    int _727 = _717;
    if (_645)
    {
        _719 = false;
    }
    bool _729 = _719;
    bool _731 = _729;
    float _733 = _681;
    if (_645)
    {
        _677 = as_type<int>(_681);
    }
    int _735 = _677;
    float _737 = _695;
    int _739 = _735;
    if (_645)
    {
        _721 = as_type<int>(_695);
    }
    int _741 = _721;
    int _743 = _741;
    if (!_645)
    {
        float _745 = in.m_49.y;
        float _747 = _145 * 3.1415927410125732421875;
        float _749 = in.m_49.z;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _745 * 3.1415927410125732421875;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _749 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _759 * 6.283185482025146484375;
        float _767 = sin(_765);
        float _769 = _763 * 6.283185482025146484375;
        float _771 = sin(_769);
        _737 = _749;
        _731 = true;
        _739 = as_type<int>(_767);
        _691 = as_type<int>(_755);
        _743 = as_type<int>(_771);
        _733 = _745;
        _685 = 2;
    }
    float _773 = _737;
    bool _775 = _731;
    int _777 = _739;
    int _779 = _691;
    int _781 = _743;
    float _783 = _733;
    int _785 = _685;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    float _791 = _773 * 2.0;
    float _793 = _775 ? as_type<float>(_777) : as_type<float>(_779);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _797 = _775 ? as_type<float>(_781) : as_type<float>(_777);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _801 = _783 * 2.0;
    float _803 = fma(as_type<float>(_779), (*spvDescriptorSet0.vp_c9)._m0[93].z, _795);
    float _805 = as_type<float>(_779) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _807 = fma(as_type<float>(_777), (*spvDescriptorSet0.vp_c9)._m0[93].w, _799);
    float _809 = as_type<float>(_777) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _811 = floor(_791);
    float _813 = _669 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _815 = _785 != 2;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _821 = floor(_801);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[98].w, _817);
    float _825 = _797 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _827 = _789 * _123;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _833 = fma(_825, -2.0, _819);
    float _835 = exp2(_827);
    float _837 = -_829;
    float _839 = fma(_805, 2.0, _837);
    float _841 = _783 + _773;
    bool _843 = _811 >= 0.0;
    bool _845 = isnan(_811);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = fma(_809, -2.0, _831);
    bool _855 = _811 > 0.0;
    float _857 = _841 + (-1.0);
    float _859 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _861 = _821 > 0.0;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _865 = _851 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _869 = _821 >= 0.0;
    bool _871 = isnan(_821);
    bool _873 = _869 || _871;
    bool _875 = isnan(0.0);
    bool _877 = _873 || _875;
    float _879 = _145 + _783;
    float _881 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[98].z, _867);
    int _883 = _877 ? 0 : 1;
    float _885 = _793 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _887 = ~as_type<int>(_865);
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _895 = -_835;
    float _897 = _895 + 1.0;
    int _899 = ~_883;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _145 + _773;
    int _907 = _891;
    int _909 = _903;
    float _911 = _865;
    if (!_855)
    {
        int _913 = ~as_type<int>(_865);
        int _915 = _913 + 1;
        _907 = _915;
    }
    int _917 = _907;
    float _919 = _879 + (-1.0);
    if (!_861)
    {
        int _921 = ~_883;
        int _923 = _921 + 1;
        _909 = _923;
    }
    int _925 = _909;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _813 + _927;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_893;
    float _943 = fma(_885, 2.0, _941);
    float _945 = _905 + (-1.0);
    float _947 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _949 = _939 ? _897 : 0.0;
    float _951 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _859 + _953;
    float _957 = _929 * _929;
    float _959 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _951 + _961;
    float _965 = fma(_955, _955, _957);
    float _967 = _957;
    if (_775)
    {
        _967 = _783;
    }
    float _969 = _967;
    float _971 = -_123;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[96].x, _943);
    float _975 = fma(_963, _963, _965);
    float _977 = 0.0;
    float _979 = _969;
    if (_775)
    {
        _977 = _969;
    }
    float _981 = _977;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _985 = _773 > 0.5;
    float _987 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _803);
    float _989 = 0.0;
    float _991 = _981;
    if (_775)
    {
        _989 = _981;
    }
    float _993 = _989;
    float _995 = rsqrt(_975);
    float _997 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _807);
    float _999 = _993;
    if (!_775)
    {
        _979 = _783;
    }
    float _1001 = _979;
    float _1003 = -_123;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[91].x, _839);
    float _1007 = _1001;
    if (!_775)
    {
        _991 = _145;
    }
    float _1009 = _991;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1019 = _1017 != 0;
    float _1021 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _853);
    bool _1023 = _783 > 0.5;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    float _1027 = 0.0;
    if (_775)
    {
        _1027 = _773;
    }
    float _1029 = _1027;
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].z, _881);
    float _1033 = _1029;
    if (!_775)
    {
        _1033 = _1001;
    }
    float _1035 = _1033;
    float _1037 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].w, _823);
    float _1039 = -_211;
    int _1041 = _985 ? as_type<int>(_1039) : as_type<int>(_211);
    float _1043 = _929 * _995;
    float _1045 = -_207;
    int _1047 = _1023 ? as_type<int>(_1045) : as_type<int>(_207);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1011);
    if (_815)
    {
        _911 = _145;
    }
    float _1051 = _911;
    float _1053 = -_1043;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _1057 = _1051;
    if (!_775)
    {
        _999 = _145;
    }
    float _1059 = _999;
    float _1061 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1063 = _1055 * _1055;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_815)
    {
        _1057 = _773;
    }
    float _1067 = _1057;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1071 = 0.0;
    if (_775)
    {
        _1071 = _773;
    }
    float _1073 = _1071;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1077 = _1073;
    if (!_775)
    {
        _1077 = _1001;
    }
    float _1079 = _1077;
    float _1081 = -_1069;
    float _1083 = fma(_1065, 2.0, _1081);
    bool _1085 = !_1019;
    float _1087 = _1085 ? _211 : as_type<float>(_1041);
    bool _1089 = !_1015;
    float _1091 = _1089 ? _207 : as_type<float>(_1047);
    if (!_815)
    {
        _1007 = _145;
    }
    float _1093 = _1007;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1105 = _1103 != 0;
    float _1107 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1109 = _955 * _995;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1113 = -_1075;
    float _1115 = fma(_1107, 2.0, _1113);
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1121 = -_1109;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1125 = -_123;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1129 = fma(_1117, -2.0, _1119);
    float _1131 = fma(_1123, _1123, _1063);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1135 = 1.0 + _1133;
    float _1137 = _963 * _995;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = -_1137;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1147 = 1.0 / _1135;
    float _1149 = fma(_1111, -2.0, _1139);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1153 = fma(_1145, _1145, _1131);
    float _1155 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1129);
    bool _1169 = !_1097;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1151);
    bool _1175 = !_1105;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[96].y, _833);
    int _1181 = abs(_1171);
    float _1183 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1173);
    int _1185 = abs(_1177);
    float _1187 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1025);
    float _1189 = float(_917);
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1193 = float(_925);
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1049);
    float _1197 = float(_1181);
    float _1199 = -_123;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1083);
    float _1203 = float(_1185);
    float _1205 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1149);
    float _1207 = _1137;
    if (_1165)
    {
        float _1209 = _949 * _1147;
        _125 = _1209;
    }
    float _1211 = _125;
    float _1213 = _1197 * _1189;
    bool _1215 = !_1101;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1203 * _1193;
    float _1221 = _1213 * (-2.0);
    int _1223 = abs(_1217);
    float _1225 = _145 + (-0.5);
    float _1227 = _665 ? _1061 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1231 = fma(_947, _1221, _947);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1235 = float(_727);
    float _1237 = _1219 * (-2.0);
    float _1239 = _665 ? _1229 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1241 = fma(_1231, _1211, _1233);
    float _1243 = abs(_1227);
    bool _1245 = _1243 != 0.0;
    bool _1247 = isnan(_1243);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_959, _1237, _959);
    float _1257 = float(_1223);
    float _1259 = _1241 * 0.15915493667125701904296875;
    float _1261 = abs(_1239);
    bool _1263 = _1261 == 0.0;
    bool _1265 = !_1253;
    bool _1267 = _1263 && _1265;
    float _1269 = _783 + (-0.5);
    float _1271 = abs(_1239);
    bool _1273 = _1271 == 0.0;
    float _1275 = _1257 * _1235;
    bool _1277 = _145 > 0.5;
    float _1279 = _773 + (-0.5);
    float _1281 = sqrt(_1153);
    float _1283 = _1275 * (-2.0);
    float _1285 = -_207;
    int _1287 = _1277 ? as_type<int>(_1285) : as_type<int>(_207);
    float _1289 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1293 = fma(_863, _1283, _863);
    float _1295 = -_211;
    int _1297 = _1023 ? as_type<int>(_1295) : as_type<int>(_211);
    float _1299 = _1259 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1309 = _1307 != 0;
    float _1311 = fma(_1293, _1211, _1289);
    bool _1313 = _1105;
    int _1315 = as_type<int>(_1289);
    int _1317 = _1297;
    int _1319 = _1253 ? (-1) : 0;
    if (_1267)
    {
        bool _1321 = as_type<int>(_1239) >= 0;
        _1313 = _1321;
    }
    bool _1323 = _1313;
    float _1325 = fma(_1255, _1211, _1291);
    bool _1327 = !_1309;
    float _1329 = _1327 ? _211 : as_type<float>(_1297);
    float _1331 = _1259 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    if (_1267)
    {
        int _1335 = _1323 ? 0 : 1078530011;
        _1315 = _1335;
    }
    int _1337 = _1315;
    bool _1339 = !_1305;
    float _1341 = _1339 ? _207 : as_type<float>(_1287);
    if (_1267)
    {
        int _1343 = int(0x80000000) & as_type<int>(_1227);
        int _1345 = _1337 | _1343;
        _1317 = _1345;
    }
    int _1347 = _1317;
    bool _1349 = !_1253;
    bool _1351 = _1349 && _1273;
    int _1353 = _1347;
    float _1355 = as_type<float>(_1347);
    if (!_1351)
    {
        float _1357 = abs(_1227);
        bool _1359 = _1357 != as_type<float>(0x7f800000u /* inf */);
        bool _1361 = isnan(_1357);
        bool _1363 = _1359 || _1361;
        bool _1365 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1367 = _1363 || _1365;
        float _1369 = abs(_1239);
        bool _1371 = _1369 == as_type<float>(0x7f800000u /* inf */);
        float _1373 = abs(_1239);
        bool _1375 = _1373 == as_type<float>(0x7f800000u /* inf */);
        bool _1377 = !_1367;
        bool _1379 = _1375 && _1377;
        if (_1379)
        {
            bool _1381 = as_type<int>(_1239) >= 0;
            _1319 = _1381 ? (-1) : 0;
        }
        int _1383 = _1319;
        if (_1379)
        {
            _1353 = 1075235812;
        }
        int _1385 = _1353;
        int _1387 = _1385;
        if (_1379)
        {
            int _1389 = ~_1383;
            int _1391 = (_1389 != 0) ? _1385 : 1061752795;
            _1387 = _1391;
        }
        int _1393 = _1387;
        float _1395 = as_type<float>(_1393);
        if (_1379)
        {
            int _1397 = int(0x80000000) & as_type<int>(_1227);
            int _1399 = _1393 | _1397;
            _1395 = as_type<float>(_1399);
        }
        float _1401 = _1395;
        bool _1403 = !_1367;
        bool _1405 = _1403 && _1371;
        _1355 = _1401;
        if (!_1405)
        {
            float _1407 = abs(_1227);
            float _1409 = abs(_1239);
            float _1411 = precise::max(_1407, _1409);
            float _1413 = abs(_1227);
            float _1415 = abs(_1239);
            float _1417 = precise::min(_1413, _1415);
            float _1419 = 1.0 / _1411;
            float _1421 = abs(_1227);
            float _1423 = abs(_1239);
            bool _1425 = _1421 > _1423;
            bool _1427 = as_type<int>(_1239) >= 0;
            float _1429 = _1417 * _1419;
            float _1431 = abs(_1227);
            float _1433 = abs(_1239);
            float _1435 = _1431 + _1433;
            int _1437 = as_type<int>(_1227) & int(0x80000000);
            float _1439 = _1429 * _1429;
            bool _1441 = _1435 > as_type<float>(0x7f800000u /* inf */);
            bool _1443 = isnan(_1435);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1449 = _1445 || _1447;
            float _1451 = _1439 + 11.33538818359375;
            float _1453 = fma(_1439, _1451, 28.84246826171875);
            float _1455 = fma(_1439, _1453, 19.6966705322265625);
            float _1457 = fma(_1439, -0.82336294651031494140625, -5.674867153167724609375);
            float _1459 = fma(_1439, _1457, -6.565555095672607421875);
            float _1461 = 1.0 / _1455;
            float _1463 = _1439 * _1459;
            float _1465 = _1429 * _1463;
            float _1467 = fma(_1465, _1461, _1429);
            float _1469 = _1467;
            _1355 = _1435;
            if (_1425)
            {
                float _1471 = -_1467;
                float _1473 = _1471 + 1.57079637050628662109375;
                _1469 = _1473;
            }
            float _1475 = _1469;
            int _1477 = as_type<int>(_1475);
            if (!_1427)
            {
                float _1479 = -_1475;
                float _1481 = _1479 + 3.1415927410125732421875;
                _1477 = as_type<int>(_1481);
            }
            int _1483 = _1477;
            if (!_1449)
            {
                int _1485 = _1437 | _1483;
                _1355 = as_type<float>(_1485);
            }
        }
    }
    float _1487 = _1355;
    float _1489 = _1311 + _1487;
    float _1491 = _1325 * 0.15915493667125701904296875;
    float _1493 = _425 * _429;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1497 = _1489 * 0.15915493667125701904296875;
    float _1499 = _1491 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _995 * _1281;
    float _1505 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1507 = _419 * _427;
    float _1509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1513 = _1511 * 0.5;
    float _1515 = _1505 * _1503;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1519 = _1497 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = -_1109;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _1527 = _1515 * _1495;
    float _1529 = _1517 * _1503;
    float _1531 = -_1043;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1543 = _1539 || _1541;
    float _1545 = _1529 * _1509;
    float _1547 = _1497 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * _1527;
    bool _1553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1555 = isnan(0.5);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1561 = _1557 || _1559;
    float _1563 = _1491 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1333 * _1521;
    float _1569 = _1301 * _1549;
    float _1571 = _1301 * _1551;
    float _1573 = _1301 * _1521;
    float _1575 = _1333 * _1549;
    float _1577 = _1549 * _1501;
    float _1579 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1581 = _1521 * _1501;
    float _1583 = -_1137;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1587 = -_1567;
    float _1589 = fma(_1565, _1569, _1587);
    float _1591 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1593 = _1333 * _1551;
    float _1595 = fma(_1565, _1575, _1573);
    float _1597 = fma(_1589, _1545, _1571);
    float _1599 = -_1527;
    float _1601 = _1565 * _1599;
    float _1603 = fma(_1565, _1573, _1575);
    float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1607 = -_1569;
    float _1609 = fma(_1565, _1567, _1607);
    float _1611 = fma(_1577, _1545, _1601);
    float _1613 = fma(_1603, _1513, _1597);
    float _1615 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1617 = fma(_1595, _1545, _1593);
    float _1619 = fma(_1581, _1513, _1611);
    float _1621 = _951 + _1613;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1615);
    float _1627 = _859 + _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1621 + _1629;
    float _1633 = 1.0 / _1623;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1627 + _1635;
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1609, _1513, _1617);
    float _1643 = fma(_1637, _1637, _1639);
    float _1645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1647 = _813 + _1641;
    float _1649 = sqrt(_1643);
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1653 = _1651 + _1623;
    float _1655 = _1653 * _1633;
    float _1657 = _1655 * 0.5;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    bool _1663 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = 1.0 / _1661;
    bool _1667 = !_1663;
    float _1669 = _1627;
    float _1671 = _1621;
    float _1673 = _1647;
    float _1675 = _1641;
    float _1677 = _1567;
    float _1679 = _1503;
    float _1681 = _1623;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1667)
    {
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1689 = _1649 + _1687;
        float _1691 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1693 = rsqrt(_1643);
        float _1695 = _1689 * _1685;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1697 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 + (-1.0);
        float _1709 = fma(_1705, _1691, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1711 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1693 * _1709;
        float _1715 = fma(_1647, _1701, _1711);
        float _1717 = fma(_1637, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1631, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1669 = _1717;
        _1671 = _1719;
        _1673 = _1715;
        _1675 = _1711;
        _1677 = _1705;
    }
    float _1721 = _1669;
    float _1723 = _1671;
    float _1725 = _1673;
    float _1727 = _1675;
    float _1729 = _1677;
    float _1731 = -_1109;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1735 = -_1137;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1723);
    float _1739 = -_1043;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1725);
    float _1743 = _1729;
    float _1745 = _1733;
    float _1747 = _1741;
    float _1749 = _1721;
    float _1751 = _1737;
    float _1753 = _1727;
    if (_1561)
    {
        _1743 = 1.0;
    }
    float _1755 = _1743;
    float _1757 = _1755;
    if (_1543)
    {
        _1207 = _1733;
    }
    float _1759 = _1207;
    float _1761 = _1759;
    if (_1543)
    {
        _1745 = _1737;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1543)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1533 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1525 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1777 = -_951;
        float _1779 = _1777 + _1723;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1585 + _1783;
        float _1787 = -_859;
        float _1789 = _1787 + _1721;
        float _1791 = fma(_1773, _1773, _1781);
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1795 = fma(_1785, _1785, _1791);
        float _1797 = sqrt(_1795);
        float _1799 = 1.0 / _1503;
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1775;
        float _1807 = _1805 * _1799;
        float _1809 = -_813;
        float _1811 = _1809 + _1725;
        float _1813 = _1801 * _1807;
        float _1815 = _1779 * _1807;
        float _1817 = fma(_1789, _1813, _1525);
        float _1819 = fma(_1811, _1813, _1533);
        float _1821 = fma(_1801, _1815, _1585);
        _1747 = _1819;
        _1761 = _1817;
        _1765 = _1821;
        _1749 = _1789;
    }
    float _1823 = _1747;
    float _1825 = _1761;
    float _1827 = _1765;
    float _1829 = _1749;
    if (_1561)
    {
        _1679 = 1.0;
    }
    float _1831 = _1679;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1665 * _1833;
    float _1837 = _1835;
    float _1839 = _1831;
    if (!_1561)
    {
        float _1841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = _1841 * 0.15915493667125701904296875;
        float _1845 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1847;
        float _1851 = _1843 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = _1845 * 0.15915493667125701904296875;
        float _1857 = _1843 * 6.283185482025146484375;
        float _1859 = sin(_1857);
        float _1861 = 1.0 / _1853;
        float _1863 = _1855 * 6.283185482025146484375;
        float _1865 = cos(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = _1855 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1865 * _1867;
        float _1875 = 1.0 / _1849;
        float _1877 = 1.0 / _1873;
        float _1879 = _1871 * _1877;
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = fma(_1835, _1879, _1881);
        float _1885 = _1883 * _1875;
        float _1887 = precise::clamp(_1885, 0.0, 1.0);
        _1757 = _1887;
    }
    float _1889 = _1757;
    if (!_1561)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = fma(_1835, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        float _1939 = -_1937;
        float _1941 = _1939 + 1.0;
        _1751 = _1929;
        _1837 = _1937;
        _1839 = _1941;
    }
    float _1943 = _1751;
    float _1945 = _1837;
    float _1947 = _1839;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1951 = _1823 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1955 = _1825 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1827 + _1957;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = fma(_1959, _1959, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1955 * _1971;
    float _1975 = _1959 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1943;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1977;
    float _2003 = _1979;
    if (_1985)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1985)
    {
        float _2009 = rsqrt(_1981);
        _1993 = _2009;
    }
    float _2011 = _1993;
    if (_1985)
    {
        float _2013 = _1989 * _2007;
        _1995 = _2013;
    }
    float _2015 = _1995;
    if (_1985)
    {
        float _2017 = _2015 * 0.15915493667125701904296875;
        _1753 = _2017;
    }
    float _2019 = _1753;
    float _2021 = _1725;
    if (_1985)
    {
        float _2023 = _2019 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1945;
    float _2035 = _2031;
    float _2037 = _2029;
    if (_1985)
    {
        float _2039 = _2019 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = -_1971;
    float _2047 = -_2031;
    float _2049 = fma(_1951, _2045, _2047);
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    float _2059 = _2027;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2067 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2065);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2063;
    if (_1985)
    {
        float _2073 = _2043 + (-1.0);
        _2037 = _2073;
    }
    float _2075 = _2037;
    if (_1985)
    {
        float _2077 = _2011 * _2063;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2069;
    float _2083 = _2081 + 1.0;
    if (_1985)
    {
        float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2085;
    }
    float _2087 = _2071;
    if (_1985)
    {
        float _2089 = _1973 * _2079;
        _1997 = _2089;
    }
    float _2091 = _1997;
    if (_1985)
    {
        float _2093 = _1975 * _2079;
        _1999 = _2093;
    }
    float _2095 = _1999;
    if (_1985)
    {
        float _2097 = fma(_2049, _2043, _2087);
        _2051 = _2097;
    }
    float _2099 = _2051;
    if (_1985)
    {
        float _2101 = _2091 * _2091;
        _2001 = _2101;
    }
    float _2103 = _2001;
    if (_1985)
    {
        float _2105 = _2095 * _2095;
        _2003 = _2105;
    }
    float _2107 = _2003;
    float _2109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2111 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = abs(_2083);
    float _2119 = log2(_2117);
    float _2121 = _2113 + _2107;
    float _2123 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2129 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = rsqrt(_2121);
    float _2133 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2111);
    float _2139 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2141 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2127);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    float _2147 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2141);
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2109, 1.0);
    float _2155 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2131 * _2091;
    float _2165 = _2131 * _2099;
    float _2167 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2131 * _2095;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = exp2(_2159);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2185 = -_2169;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2189 = log2(_2153);
    float _2191 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2195 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2191);
    float _2197 = _2165 + 1.0;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2193);
    float _2201 = 1.0 / _2183;
    float _2203 = fma(_2187, -0.5, 0.5);
    float _2205 = fma(_2187, 0.5, 0.5);
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2209 = -_2165;
    float _2211 = fma(_2173, _2197, _2209);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2199);
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2219 = sqrt(_2203);
    float _2221 = _2189 * 0.693147182464599609375;
    float _2223 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2225 = fma(_2211, 0.5, 0.5);
    float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = fma(_2205, _2223, 1.570728778839111328125);
    float _2231 = _2217 * _2201;
    float _2233 = _2213 * _2201;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = fma(_2233, -0.5, 0.5);
    float _2239 = _2219 * 0.636619746685028076171875;
    float3 _6190 = float3(_2235, _2237, _2227);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6190, float3(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6190, float3(0.0), isnan(_6190)), level(0.0)).x;
    float3 _6201 = float3(_2235, _2237, _2227);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float _2254 = -_2229;
    float _2256 = fma(_2239, _2254, 1.0);
    float2 _6223 = float2(_2256, _2225);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2270 = _2268 != 0;
    float _2272 = in.m_49.w;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2276 = _2274 != 0;
    float _2278 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2282 = _2280 != 0;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2286 = _425 * _2278;
    float _2288 = -_1037;
    float _2290 = _2288 + 1.0;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2300 = _1829;
    float _2302 = _2237;
    bool _2304 = _2270;
    bool _2306 = _2276;
    if (_2270)
    {
        float _2308 = in.m_49.w;
        _2300 = _2308;
    }
    float _2310 = _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2318 = _2316 != 0;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2322 = _2235;
    bool _2324 = _2318;
    if (_2276)
    {
        float _2326 = in.m_49.z;
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2334 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_637);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _1341 + 0.5;
    float _2348 = _2227;
    if (_2282)
    {
        float _2350 = in.m_49.w;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2356 = -_1329;
    float _2358 = _2356 + 0.5;
    float _2360 = 1.0 / _2298;
    bool _2362 = _2272 > 0.5;
    float _2364 = -_1187;
    float _2366 = _2364 + 1.0;
    float _2368 = 1.0 / _2314;
    if (_2270)
    {
        float _2370 = _2310 * 3.1415927410125732421875;
        _2302 = _2370;
    }
    float _2372 = _2302;
    float _2374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2270)
    {
        float _2376 = _2372 * 0.15915493667125701904296875;
        _1681 = _2376;
    }
    float _2378 = _1681;
    float _2380 = _2328;
    if (_2276)
    {
        float _2382 = _2328 * 3.1415927410125732421875;
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2394 = -_211;
    int _2396 = _2362 ? as_type<int>(_2394) : as_type<int>(_211);
    float _2398 = _2384;
    if (_2276)
    {
        float _2400 = _2384 * 0.15915493667125701904296875;
        _2398 = _2400;
    }
    float _2402 = _2398;
    float _2404 = _2352;
    if (_2282)
    {
        float _2406 = _2352 * 3.1415927410125732421875;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2278;
    float _2412 = _2408;
    if (_2270)
    {
        float _2414 = _2378 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2392 * _2360;
    float _2422 = _2388 * _2368;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2426 = _637 + _2424;
    float _2428 = _211 * _2286;
    bool _2430 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2432 = isnan(_637);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = _2426;
    float _2444 = _2428;
    if (_2282)
    {
        float _2446 = _2408 * 0.15915493667125701904296875;
        _2412 = _2446;
    }
    float _2448 = _2412;
    bool _2450 = !_2318;
    float _2452 = _2450 ? _211 : as_type<float>(_2396);
    float _2454 = fma(_2422, _2426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2456 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2458 = isnan(_637);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = 1.0 / _2332;
    if (_2294)
    {
        float _2470 = _145 * 3.1415927410125732421875;
        _2442 = _2470;
    }
    float _2472 = _2442;
    float _2474 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = -_2466;
    float _2482 = _2480 + 1.0;
    float _2484 = _2472;
    if (_2294)
    {
        float _2486 = _2472 * 0.15915493667125701904296875;
        _2484 = _2486;
    }
    float _2488 = _2484;
    if (_2270)
    {
        bool _2490 = _2418 > 0.5;
        _2324 = _2490;
    }
    bool _2492 = _2324;
    float _2494 = _2466 * _2478;
    float _2496 = _2402;
    bool _2498 = _2492;
    if (_2276)
    {
        float _2500 = _2402 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        _2496 = _2502;
    }
    float _2504 = _2496;
    float _2506 = _419 * _2474;
    bool _2508 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2510 = isnan(_637);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = _2344 * _2482;
    float _2522 = -_2344;
    float _2524 = _2522 + 1.0;
    float _2526 = _207 * _2506;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2528;
    float _2532 = _2488;
    float _2534 = _2526;
    if (_2294)
    {
        float _2536 = _2488 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = _2518 * _2524;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2546 = _637 + _2544;
    float _2548 = _2530 * _2468;
    float _2550 = _2548;
    if (!_2270)
    {
        _1683 = _2526;
    }
    float _2552 = _1683;
    float _2554 = _2454 * _2542;
    float _2556 = -_2518;
    float _2558 = _2556 + 1.0;
    float _2560 = _2552;
    if (_2270)
    {
        float _2562 = -_2526;
        float _2564 = _2492 ? _2562 : _2526;
        _2560 = _2564;
    }
    float _2566 = _2560;
    float _2568 = _2448;
    if (_2282)
    {
        float _2570 = _2448 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    if (_2276)
    {
        bool _2576 = _2504 > 0.5;
        _2498 = _2576;
    }
    bool _2578 = _2498;
    float _2580 = fma(_2420, _2546, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2582 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2554);
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2586 = _637 + _2584;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_2580, _2520, _2582);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (_2294)
    {
        bool _2596 = _2540 > 0.5;
        _2304 = _2596;
    }
    bool _2598 = _2304;
    float _2600 = _2566 + 0.5;
    if (_2276)
    {
        float _2602 = -_2526;
        float _2604 = _2578 ? _2602 : _2526;
        _2534 = _2604;
    }
    float _2606 = _2534;
    float _2608 = fma(_2548, _2586, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (!_2294)
    {
        _2550 = _2428;
    }
    float _2610 = _2550;
    float _2612 = fma(_2354, _2600, _1005);
    float _2614 = _2610;
    if (_2294)
    {
        float _2616 = -_2428;
        float _2618 = _2598 ? _2616 : _2428;
        _2614 = _2618;
    }
    float _2620 = _2614;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_2282)
    {
        bool _2624 = _2574 > 0.5;
        _2306 = _2624;
    }
    bool _2626 = _2306;
    float _2628 = fma(_2608, _2494, _2592);
    float _2630 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2632 = _2620 + (-0.5);
    if (_2282)
    {
        float _2634 = -_2428;
        float _2636 = _2626 ? _2634 : _2428;
        _2444 = _2636;
    }
    float _2638 = _2444;
    float _2640 = _2606 + 0.5;
    float _2642 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2628);
    float _2644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2646 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2648 = _2638 + (-0.5);
    float _2650 = -_2630;
    float _2652 = -_1021;
    float _2654 = fma(_2650, _2632, _2652);
    float _2656 = _2642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2658 = -_2646;
    float _2660 = -_1179;
    float _2662 = fma(_2658, _2648, _2660);
    float _2664 = -_997;
    float _2666 = _2664 + 1.0;
    float _2668 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2670 = -_987;
    float _2672 = _2670 + 1.0;
    float _2674 = -_1031;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2666, _2620, _2654);
    float _2680 = fma(_2290, _2638, _2662);
    float _2682 = fma(_2668, _2640, _973);
    float _2684 = -_207;
    int _2686 = _985 ? as_type<int>(_2684) : as_type<int>(_207);
    float _2688 = _1091 + 0.5;
    float _2690 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2692 = -_2676;
    float _2694 = fma(_2692, _2606, _2682);
    bool _2696 = !_2590;
    float _2698 = _2696 ? _207 : as_type<float>(_2686);
    float _2700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2702 = fma(_2690, _2688, _1127);
    float _2704 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2706 = _2452 + (-0.5);
    out.m_58.x = _2694;
    out.m_58.y = _2680;
    float _2708 = -_2672;
    float _2710 = fma(_2708, _2566, _2612);
    float _2712 = _2698 + 0.5;
    float _2714 = -_2704;
    float _2716 = -_1167;
    float _2718 = fma(_2714, _2706, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2722 = _1889 > 0.0;
    bool _2724 = isnan(_1889);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    out.m_60.x = _2710;
    out.m_60.y = _2678;
    bool _2732 = _1947 <= 0.0;
    bool _2734 = !_2730;
    bool _2736 = _2732 || _2734;
    float _2738 = -_1195;
    float _2740 = _2738 + 1.0;
    out.m_62.w = _2656;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2744 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2746 = fma(_2452, _2740, _2718);
    float _2748 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2750 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2752 = fma(_2744, _2712, _1201);
    float _2754 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2756 = _1889 * _1947;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2760 = -_2366;
    float _2762 = fma(_2698, _2760, _2752);
    float _2764 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2766 = _2750 * _2720;
    float _2768 = _1087 + (-0.5);
    float _2770 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2764);
    float _2772 = exp2(_2748);
    float _2774 = _2754 * _2742;
    out.m_64.x = _2766;
    out.m_64.y = _2774;
    out.m_64.z = _2762;
    out.m_64.w = _2746;
    float _2776 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2778 = -_2776;
    float _2780 = -_1205;
    float _2782 = fma(_2778, _2768, _2780);
    float _2784 = _2756 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2770);
    float _2788 = -_1183;
    float _2790 = _2788 + 1.0;
    float _2792 = -_2772;
    float _2794 = _2792 + 1.0;
    float _2796 = -_1191;
    float _2798 = _2796 + 1.0;
    float _2800 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2786);
    float _2802 = _419 * _2784;
    float _2804 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2806 = fma(_1087, _2798, _2782);
    float _2808 = _2800 + _2183;
    float _2810 = -_2790;
    float _2812 = fma(_1091, _2810, _2702);
    float _2814 = -_2804;
    float _2816 = _2814 + 1.0;
    float _2818 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2820 = _2808 * 0.5;
    out.m_66.x = _2812;
    out.m_66.y = _2806;
    out.m_45.x = _2818;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _2800;
    out.gl_Position.w = _2183;
    out.m_68.z = _2820;
    out.m_68.w = _2183;
    float _2822 = _2804 * _2241;
    float _2824 = _2252 * _2822;
    float _2826 = _2266 * _2822;
    float _2828 = fma(_2262, _2824, _2246);
    float _2830 = fma(_2264, _2824, _2248);
    float _2832 = _2252 * _2816;
    float _2834 = fma(_2252, _2826, _2250);
    out.m_70.x = _2828;
    out.m_70.y = _2830;
    out.m_70.z = _2834;
    out.m_70.w = _2832;
    if (!_2736)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2836;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _629 = false;
    bool _451 = false;
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
        float _2893 = as_type<float>(_105);
        out.gl_Position.z = _2893;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2963 = as_type<float>(_143);
        out.gl_Position.z = _2963;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _165 = _149 * _147;
    float _167 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _171 = _167 * _163;
    float _173 = _169 * 6.283185482025146484375;
    float _175 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].y, _171);
    float _177 = floor(_169);
    int _179 = as_type<int>(_151) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_151) & 2;
    bool _185 = _183 != 0;
    float _187 = _173 * 0.15915493667125701904296875;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = in.m_47.x;
    float _193 = in.m_47.y;
    float _195 = in.m_47.z;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 0.15915493667125701904296875;
    float _203 = floor(_175);
    bool _205 = !_181;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_185;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _187 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = -_177;
    float _219 = _169 + _217;
    float _221 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _223 = _219 < 0.5;
    float _225 = float(_223);
    float _227 = _201 * 6.283185482025146484375;
    float _229 = cos(_227);
    float _231 = -_203;
    float _233 = _175 + _231;
    float _235 = _203;
    float _237 = _221;
    if (!_161)
    {
        float _239 = _221 * _221;
        float _241 = _239 * 0.5;
        _235 = _241;
    }
    float _243 = _235;
    float _245 = _243;
    if (!_161)
    {
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _247;
    }
    float _249 = _245;
    float _251 = fma(_215, 0.5, 0.5);
    bool _253 = !_161;
    float _255 = _249;
    if (!_253)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = _221 * _259;
        float _269 = 1.0 / _263;
        float _271 = _265 * 0.693147182464599609375;
        float _273 = exp2(_267);
        float _275 = 1.0 / _271;
        float _277 = _273 + (-1.0);
        float _279 = -_277;
        float _281 = fma(_279, _275, _221);
        float _283 = _281 * _269;
        float _285 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _255 = _285;
    }
    float _287 = _255;
    bool _289 = !_161;
    if (!_289)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = 1.0 / _297;
        float _301 = _221 * _293;
        float _303 = exp2(_301);
        float _305 = -_303;
        float _307 = _305 + 1.0;
        float _309 = _307 * _299;
        _237 = _309;
    }
    float _311 = _237;
    float _313 = -_219;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_225;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_199;
    int _323 = _321 ? 0 : 1;
    float _325 = -_251;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _335 = _333 != 0;
    float _337 = in.m_54.w;
    bool _339 = _233 < 0.5;
    float _341 = float(_339);
    float _343 = -_233;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    bool _355 = !_331;
    int _357 = _355 ? 0 : 1;
    float _359 = -_341;
    float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _363 = fma(_311, _191, _347);
    float _365 = in.m_54.x;
    int _367 = abs(_323);
    float _369 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _371 = abs(_357);
    float _373 = in.m_54.y;
    float _375 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _379 = fma(_229, 0.5, 0.5);
    bool _381 = !_335;
    int _383 = _381 ? 0 : 1;
    float _385 = fma(_311, _193, _369);
    float _387 = float(_371);
    float _389 = fma(_311, _195, _375);
    int _391 = abs(_383);
    float _393 = -_379;
    float _395 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _397 = float(_367);
    float _399 = abs(_315);
    float _401 = _387 * _399;
    float _403 = abs(_345);
    float _405 = _387 * _403;
    float _407 = float(_391);
    float _409 = fma(_397, _327, _401);
    float _411 = fma(_397, _395, _405);
    float _413 = fma(_363, _337, _349);
    float _415 = fma(_385, _337, _351);
    float _417 = abs(_319);
    float _419 = fma(_407, _417, _409);
    float _421 = fma(_389, _337, _353);
    float _423 = abs(_361);
    float _425 = fma(_407, _423, _411);
    float _427 = _365 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _431 = !_377;
    int _433 = as_type<int>(_421);
    float _449;
    if (!_431)
    {
        float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _437 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _441 = _439 * _435;
        float _443 = floor(_441);
        float _445 = -_443;
        float _447 = _441 + _445;
        _449 = _447;
        _451 = true;
    }
    else
    {
        float _453 = float(_89);
        float _455 = 1.0 / _453;
        float _457 = _123 * _455;
        _449 = _457;
    }
    _451 = false;
    float _459 = _449;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _463 = _459 + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = isnan(_459);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _489 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _491 = isnan(_459);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _467;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _503;
    float _507 = -_483;
    float _509 = _507 + 1.0;
    bool _511 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _513 = isnan(_459);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _525 = 1.0 / _471;
    float _527 = 1.0 / _487;
    float _529 = _505 * _501;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _535 = _499 * _509;
    float _537 = -_499;
    float _539 = _537 + 1.0;
    float _541 = fma(_529, _463, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _543 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _545 = isnan(_459);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = _521 * _539;
    float _557 = _533 * _525;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _459 + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _563;
    float _567 = _541 * _555;
    float _569 = -_521;
    float _571 = _569 + 1.0;
    float _573 = fma(_557, _561, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _575 = -_553;
    float _577 = _575 + 1.0;
    float _579 = _565 * _527;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _459 + _581;
    float _585 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _587 = _483 * _577;
    float _589 = fma(_579, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = fma(_573, _535, _585);
    float _593 = fma(_589, _587, _591);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _601 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[118].x, _593);
    float _603 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _603;
    out.m_56.y = _605;
    out.m_56.z = _607;
    out.m_56.w = _609;
    bool _611 = !_523;
    float _627;
    if (!_611)
    {
        float _613 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _615 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _617 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _619 = _617 * _613;
        float _621 = floor(_619);
        float _623 = -_621;
        float _625 = _619 + _623;
        _627 = _625;
        _629 = true;
    }
    else
    {
        float _631 = float(_89);
        float _633 = 1.0 / _631;
        float _635 = _123 * _633;
        _627 = _635;
    }
    _629 = false;
    float _637 = _627;
    float _639 = _145 * 2.0;
    float _641 = _415 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _645 = _643 != 0;
    float _647 = _415 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = floor(_639);
    float _651 = _415 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _653 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _655 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _657 = precise::max(_653, _655);
    float _659 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _661 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _663 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].x, _651);
    bool _665 = _657 >= 16.0;
    float _667 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _659);
    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _661);
    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _663);
    float _673 = _607;
    int _675 = as_type<int>(_657);
    int _677 = as_type<int>(_663);
    if (_645)
    {
        float _679 = in.m_49.y;
        _673 = _679;
    }
    float _681 = _673;
    if (_645)
    {
        _433 = 0;
    }
    int _683 = _433;
    int _685 = _683;
    if (_645)
    {
        _675 = as_type<int>(_145);
    }
    int _687 = _675;
    float _689 = _605;
    int _691 = _687;
    if (_645)
    {
        float _693 = in.m_49.z;
        _689 = _693;
    }
    float _695 = _689;
    bool _697 = _649 > 0.0;
    bool _699 = _649 >= 0.0;
    bool _701 = isnan(_649);
    bool _703 = _699 || _701;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    int _709 = _707 ? 0 : 1;
    int _711 = ~_709;
    int _713 = _711 + 1;
    int _715 = _713 + 1;
    int _717 = _715;
    bool _719 = _697;
    int _721 = _709;
    if (!_697)
    {
        int _723 = ~_709;
        int _725 = _723 + 1;
        _717 = _725;
    }
    int _727 = _717;
    if (_645)
    {
        _719 = false;
    }
    bool _729 = _719;
    bool _731 = _729;
    float _733 = _681;
    if (_645)
    {
        _677 = as_type<int>(_681);
    }
    int _735 = _677;
    float _737 = _695;
    int _739 = _735;
    if (_645)
    {
        _721 = as_type<int>(_695);
    }
    int _741 = _721;
    int _743 = _741;
    if (!_645)
    {
        float _745 = in.m_49.y;
        float _747 = _145 * 3.1415927410125732421875;
        float _749 = in.m_49.z;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _745 * 3.1415927410125732421875;
        float _759 = _757 * 0.15915493667125701904296875;
        float _761 = _749 * 3.1415927410125732421875;
        float _763 = _761 * 0.15915493667125701904296875;
        float _765 = _759 * 6.283185482025146484375;
        float _767 = sin(_765);
        float _769 = _763 * 6.283185482025146484375;
        float _771 = sin(_769);
        _737 = _749;
        _731 = true;
        _739 = as_type<int>(_767);
        _691 = as_type<int>(_755);
        _743 = as_type<int>(_771);
        _733 = _745;
        _685 = 2;
    }
    float _773 = _737;
    bool _775 = _731;
    int _777 = _739;
    int _779 = _691;
    int _781 = _743;
    float _783 = _733;
    int _785 = _685;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    float _791 = _773 * 2.0;
    float _793 = _775 ? as_type<float>(_777) : as_type<float>(_779);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _797 = _775 ? as_type<float>(_781) : as_type<float>(_777);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _801 = _783 * 2.0;
    float _803 = fma(as_type<float>(_779), (*spvDescriptorSet0.vp_c9)._m0[93].z, _795);
    float _805 = as_type<float>(_779) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _807 = fma(as_type<float>(_777), (*spvDescriptorSet0.vp_c9)._m0[93].w, _799);
    float _809 = as_type<float>(_777) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _811 = floor(_791);
    float _813 = _669 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _815 = _785 != 2;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _821 = floor(_801);
    float _823 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[98].w, _817);
    float _825 = _797 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _827 = _789 * _123;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _833 = fma(_825, -2.0, _819);
    float _835 = exp2(_827);
    float _837 = -_829;
    float _839 = fma(_805, 2.0, _837);
    float _841 = _783 + _773;
    bool _843 = _811 >= 0.0;
    bool _845 = isnan(_811);
    bool _847 = _843 || _845;
    bool _849 = isnan(0.0);
    bool _851 = _847 || _849;
    float _853 = fma(_809, -2.0, _831);
    bool _855 = _811 > 0.0;
    float _857 = _841 + (-1.0);
    float _859 = _667 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _861 = _821 > 0.0;
    float _863 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _865 = _851 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    bool _869 = _821 >= 0.0;
    bool _871 = isnan(_821);
    bool _873 = _869 || _871;
    bool _875 = isnan(0.0);
    bool _877 = _873 || _875;
    float _879 = _145 + _783;
    float _881 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[98].z, _867);
    int _883 = _877 ? 0 : 1;
    float _885 = _793 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _887 = ~as_type<int>(_865);
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _895 = -_835;
    float _897 = _895 + 1.0;
    int _899 = ~_883;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _145 + _773;
    int _907 = _891;
    int _909 = _903;
    float _911 = _865;
    if (!_855)
    {
        int _913 = ~as_type<int>(_865);
        int _915 = _913 + 1;
        _907 = _915;
    }
    int _917 = _907;
    float _919 = _879 + (-1.0);
    if (!_861)
    {
        int _921 = ~_883;
        int _923 = _921 + 1;
        _909 = _923;
    }
    int _925 = _909;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _813 + _927;
    bool _931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _933 = isnan(0.0);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _939 = _935 || _937;
    float _941 = -_893;
    float _943 = fma(_885, 2.0, _941);
    float _945 = _905 + (-1.0);
    float _947 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _949 = _939 ? _897 : 0.0;
    float _951 = _671 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _955 = _859 + _953;
    float _957 = _929 * _929;
    float _959 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _951 + _961;
    float _965 = fma(_955, _955, _957);
    float _967 = _957;
    if (_775)
    {
        _967 = _783;
    }
    float _969 = _967;
    float _971 = -_123;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[96].x, _943);
    float _975 = fma(_963, _963, _965);
    float _977 = 0.0;
    float _979 = _969;
    if (_775)
    {
        _977 = _969;
    }
    float _981 = _977;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _985 = _773 > 0.5;
    float _987 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _803);
    float _989 = 0.0;
    float _991 = _981;
    if (_775)
    {
        _989 = _981;
    }
    float _993 = _989;
    float _995 = rsqrt(_975);
    float _997 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _807);
    float _999 = _993;
    if (!_775)
    {
        _979 = _783;
    }
    float _1001 = _979;
    float _1003 = -_123;
    float _1005 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[91].x, _839);
    float _1007 = _1001;
    if (!_775)
    {
        _991 = _145;
    }
    float _1009 = _991;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1019 = _1017 != 0;
    float _1021 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _853);
    bool _1023 = _783 > 0.5;
    float _1025 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _983);
    float _1027 = 0.0;
    if (_775)
    {
        _1027 = _773;
    }
    float _1029 = _1027;
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].z, _881);
    float _1033 = _1029;
    if (!_775)
    {
        _1033 = _1001;
    }
    float _1035 = _1033;
    float _1037 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[97].w, _823);
    float _1039 = -_211;
    int _1041 = _985 ? as_type<int>(_1039) : as_type<int>(_211);
    float _1043 = _929 * _995;
    float _1045 = -_207;
    int _1047 = _1023 ? as_type<int>(_1045) : as_type<int>(_207);
    float _1049 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1011);
    if (_815)
    {
        _911 = _145;
    }
    float _1051 = _911;
    float _1053 = -_1043;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    float _1057 = _1051;
    if (!_775)
    {
        _999 = _145;
    }
    float _1059 = _999;
    float _1061 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1063 = _1055 * _1055;
    float _1065 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_815)
    {
        _1057 = _773;
    }
    float _1067 = _1057;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1071 = 0.0;
    if (_775)
    {
        _1071 = _773;
    }
    float _1073 = _1071;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1077 = _1073;
    if (!_775)
    {
        _1077 = _1001;
    }
    float _1079 = _1077;
    float _1081 = -_1069;
    float _1083 = fma(_1065, 2.0, _1081);
    bool _1085 = !_1019;
    float _1087 = _1085 ? _211 : as_type<float>(_1041);
    bool _1089 = !_1015;
    float _1091 = _1089 ? _207 : as_type<float>(_1047);
    if (!_815)
    {
        _1007 = _145;
    }
    float _1093 = _1007;
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1097 = _1095 != 0;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1105 = _1103 != 0;
    float _1107 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1109 = _955 * _995;
    float _1111 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1113 = -_1075;
    float _1115 = fma(_1107, 2.0, _1113);
    float _1117 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1121 = -_1109;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1125 = -_123;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1115);
    float _1129 = fma(_1117, -2.0, _1119);
    float _1131 = fma(_1123, _1123, _1063);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1135 = 1.0 + _1133;
    float _1137 = _963 * _995;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1143 = -_1137;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1147 = 1.0 / _1135;
    float _1149 = fma(_1111, -2.0, _1139);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1153 = fma(_1145, _1145, _1131);
    float _1155 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1141);
    bool _1157 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(1.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1129);
    bool _1169 = !_1097;
    int _1171 = _1169 ? 0 : 1;
    float _1173 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1151);
    bool _1175 = !_1105;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[96].y, _833);
    int _1181 = abs(_1171);
    float _1183 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1173);
    int _1185 = abs(_1177);
    float _1187 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1025);
    float _1189 = float(_917);
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1155);
    float _1193 = float(_925);
    float _1195 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1049);
    float _1197 = float(_1181);
    float _1199 = -_123;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1083);
    float _1203 = float(_1185);
    float _1205 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1149);
    float _1207 = _1137;
    if (_1165)
    {
        float _1209 = _949 * _1147;
        _125 = _1209;
    }
    float _1211 = _125;
    float _1213 = _1197 * _1189;
    bool _1215 = !_1101;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = _1203 * _1193;
    float _1221 = _1213 * (-2.0);
    int _1223 = abs(_1217);
    float _1225 = _145 + (-0.5);
    float _1227 = _665 ? _1061 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1229 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1231 = fma(_947, _1221, _947);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1235 = float(_727);
    float _1237 = _1219 * (-2.0);
    float _1239 = _665 ? _1229 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1241 = fma(_1231, _1211, _1233);
    float _1243 = abs(_1227);
    bool _1245 = _1243 != 0.0;
    bool _1247 = isnan(_1243);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan(0.0);
    bool _1253 = _1249 || _1251;
    float _1255 = fma(_959, _1237, _959);
    float _1257 = float(_1223);
    float _1259 = _1241 * 0.15915493667125701904296875;
    float _1261 = abs(_1239);
    bool _1263 = _1261 == 0.0;
    bool _1265 = !_1253;
    bool _1267 = _1263 && _1265;
    float _1269 = _783 + (-0.5);
    float _1271 = abs(_1239);
    bool _1273 = _1271 == 0.0;
    float _1275 = _1257 * _1235;
    bool _1277 = _145 > 0.5;
    float _1279 = _773 + (-0.5);
    float _1281 = sqrt(_1153);
    float _1283 = _1275 * (-2.0);
    float _1285 = -_207;
    int _1287 = _1277 ? as_type<int>(_1285) : as_type<int>(_207);
    float _1289 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1293 = fma(_863, _1283, _863);
    float _1295 = -_211;
    int _1297 = _1023 ? as_type<int>(_1295) : as_type<int>(_211);
    float _1299 = _1259 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1309 = _1307 != 0;
    float _1311 = fma(_1293, _1211, _1289);
    bool _1313 = _1105;
    int _1315 = as_type<int>(_1289);
    int _1317 = _1297;
    int _1319 = _1253 ? (-1) : 0;
    if (_1267)
    {
        bool _1321 = as_type<int>(_1239) >= 0;
        _1313 = _1321;
    }
    bool _1323 = _1313;
    float _1325 = fma(_1255, _1211, _1291);
    bool _1327 = !_1309;
    float _1329 = _1327 ? _211 : as_type<float>(_1297);
    float _1331 = _1259 * 6.283185482025146484375;
    float _1333 = cos(_1331);
    if (_1267)
    {
        int _1335 = _1323 ? 0 : 1078530011;
        _1315 = _1335;
    }
    int _1337 = _1315;
    bool _1339 = !_1305;
    float _1341 = _1339 ? _207 : as_type<float>(_1287);
    if (_1267)
    {
        int _1343 = int(0x80000000) & as_type<int>(_1227);
        int _1345 = _1337 | _1343;
        _1317 = _1345;
    }
    int _1347 = _1317;
    bool _1349 = !_1253;
    bool _1351 = _1349 && _1273;
    int _1353 = _1347;
    float _1355 = as_type<float>(_1347);
    if (!_1351)
    {
        float _1357 = abs(_1227);
        bool _1359 = _1357 != as_type<float>(0x7f800000u /* inf */);
        bool _1361 = isnan(_1357);
        bool _1363 = _1359 || _1361;
        bool _1365 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1367 = _1363 || _1365;
        float _1369 = abs(_1239);
        bool _1371 = _1369 == as_type<float>(0x7f800000u /* inf */);
        float _1373 = abs(_1239);
        bool _1375 = _1373 == as_type<float>(0x7f800000u /* inf */);
        bool _1377 = !_1367;
        bool _1379 = _1375 && _1377;
        if (_1379)
        {
            bool _1381 = as_type<int>(_1239) >= 0;
            _1319 = _1381 ? (-1) : 0;
        }
        int _1383 = _1319;
        if (_1379)
        {
            _1353 = 1075235812;
        }
        int _1385 = _1353;
        int _1387 = _1385;
        if (_1379)
        {
            int _1389 = ~_1383;
            int _1391 = (_1389 != 0) ? _1385 : 1061752795;
            _1387 = _1391;
        }
        int _1393 = _1387;
        float _1395 = as_type<float>(_1393);
        if (_1379)
        {
            int _1397 = int(0x80000000) & as_type<int>(_1227);
            int _1399 = _1393 | _1397;
            _1395 = as_type<float>(_1399);
        }
        float _1401 = _1395;
        bool _1403 = !_1367;
        bool _1405 = _1403 && _1371;
        _1355 = _1401;
        if (!_1405)
        {
            float _1407 = abs(_1227);
            float _1409 = abs(_1239);
            float _1411 = precise::max(_1407, _1409);
            float _1413 = abs(_1227);
            float _1415 = abs(_1239);
            float _1417 = precise::min(_1413, _1415);
            float _1419 = 1.0 / _1411;
            float _1421 = abs(_1227);
            float _1423 = abs(_1239);
            bool _1425 = _1421 > _1423;
            bool _1427 = as_type<int>(_1239) >= 0;
            float _1429 = _1417 * _1419;
            float _1431 = abs(_1227);
            float _1433 = abs(_1239);
            float _1435 = _1431 + _1433;
            int _1437 = as_type<int>(_1227) & int(0x80000000);
            float _1439 = _1429 * _1429;
            bool _1441 = _1435 > as_type<float>(0x7f800000u /* inf */);
            bool _1443 = isnan(_1435);
            bool _1445 = _1441 || _1443;
            bool _1447 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1449 = _1445 || _1447;
            float _1451 = _1439 + 11.33538818359375;
            float _1453 = fma(_1439, _1451, 28.84246826171875);
            float _1455 = fma(_1439, _1453, 19.6966705322265625);
            float _1457 = fma(_1439, -0.82336294651031494140625, -5.674867153167724609375);
            float _1459 = fma(_1439, _1457, -6.565555095672607421875);
            float _1461 = 1.0 / _1455;
            float _1463 = _1439 * _1459;
            float _1465 = _1429 * _1463;
            float _1467 = fma(_1465, _1461, _1429);
            float _1469 = _1467;
            _1355 = _1435;
            if (_1425)
            {
                float _1471 = -_1467;
                float _1473 = _1471 + 1.57079637050628662109375;
                _1469 = _1473;
            }
            float _1475 = _1469;
            int _1477 = as_type<int>(_1475);
            if (!_1427)
            {
                float _1479 = -_1475;
                float _1481 = _1479 + 3.1415927410125732421875;
                _1477 = as_type<int>(_1481);
            }
            int _1483 = _1477;
            if (!_1449)
            {
                int _1485 = _1437 | _1483;
                _1355 = as_type<float>(_1485);
            }
        }
    }
    float _1487 = _1355;
    float _1489 = _1311 + _1487;
    float _1491 = _1325 * 0.15915493667125701904296875;
    float _1493 = _425 * _429;
    float _1495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1497 = _1489 * 0.15915493667125701904296875;
    float _1499 = _1491 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _995 * _1281;
    float _1505 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1507 = _419 * _427;
    float _1509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1513 = _1511 * 0.5;
    float _1515 = _1505 * _1503;
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1519 = _1497 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = -_1109;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _859);
    float _1527 = _1515 * _1495;
    float _1529 = _1517 * _1503;
    float _1531 = -_1043;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    bool _1535 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1537 = isnan(0.5);
    bool _1539 = _1535 || _1537;
    bool _1541 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1543 = _1539 || _1541;
    float _1545 = _1529 * _1509;
    float _1547 = _1497 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * _1527;
    bool _1553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1555 = isnan(0.5);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1561 = _1557 || _1559;
    float _1563 = _1491 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1333 * _1521;
    float _1569 = _1301 * _1549;
    float _1571 = _1301 * _1551;
    float _1573 = _1301 * _1521;
    float _1575 = _1333 * _1549;
    float _1577 = _1549 * _1501;
    float _1579 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1581 = _1521 * _1501;
    float _1583 = -_1137;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[18].w, _951);
    float _1587 = -_1567;
    float _1589 = fma(_1565, _1569, _1587);
    float _1591 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1593 = _1333 * _1551;
    float _1595 = fma(_1565, _1575, _1573);
    float _1597 = fma(_1589, _1545, _1571);
    float _1599 = -_1527;
    float _1601 = _1565 * _1599;
    float _1603 = fma(_1565, _1573, _1575);
    float _1605 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1591);
    float _1607 = -_1569;
    float _1609 = fma(_1565, _1567, _1607);
    float _1611 = fma(_1577, _1545, _1601);
    float _1613 = fma(_1603, _1513, _1597);
    float _1615 = _1533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1617 = fma(_1595, _1545, _1593);
    float _1619 = fma(_1581, _1513, _1611);
    float _1621 = _951 + _1613;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1625 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1615);
    float _1627 = _859 + _1619;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1631 = _1621 + _1629;
    float _1633 = 1.0 / _1623;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1637 = _1627 + _1635;
    float _1639 = _1631 * _1631;
    float _1641 = fma(_1609, _1513, _1617);
    float _1643 = fma(_1637, _1637, _1639);
    float _1645 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1625);
    float _1647 = _813 + _1641;
    float _1649 = sqrt(_1643);
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1653 = _1651 + _1623;
    float _1655 = _1653 * _1633;
    float _1657 = _1655 * 0.5;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1661 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1659);
    bool _1663 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = 1.0 / _1661;
    bool _1667 = !_1663;
    float _1669 = _1627;
    float _1671 = _1621;
    float _1673 = _1647;
    float _1675 = _1641;
    float _1677 = _1567;
    float _1679 = _1503;
    float _1681 = _1623;
    float _1683 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_1667)
    {
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1689 = _1649 + _1687;
        float _1691 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1693 = rsqrt(_1643);
        float _1695 = _1689 * _1685;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1697 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        float _1703 = _1697 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 + (-1.0);
        float _1709 = fma(_1705, _1691, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1711 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1693 * _1709;
        float _1715 = fma(_1647, _1701, _1711);
        float _1717 = fma(_1637, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1631, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1669 = _1717;
        _1671 = _1719;
        _1673 = _1715;
        _1675 = _1711;
        _1677 = _1705;
    }
    float _1721 = _1669;
    float _1723 = _1671;
    float _1725 = _1673;
    float _1727 = _1675;
    float _1729 = _1677;
    float _1731 = -_1109;
    float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1735 = -_1137;
    float _1737 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1723);
    float _1739 = -_1043;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1725);
    float _1743 = _1729;
    float _1745 = _1733;
    float _1747 = _1741;
    float _1749 = _1721;
    float _1751 = _1737;
    float _1753 = _1727;
    if (_1561)
    {
        _1743 = 1.0;
    }
    float _1755 = _1743;
    float _1757 = _1755;
    if (_1543)
    {
        _1207 = _1733;
    }
    float _1759 = _1207;
    float _1761 = _1759;
    if (_1543)
    {
        _1745 = _1737;
    }
    float _1763 = _1745;
    float _1765 = _1763;
    if (!_1543)
    {
        float _1767 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1769 = _1533 + _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1773 = _1525 + _1771;
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1777 = -_951;
        float _1779 = _1777 + _1723;
        float _1781 = _1769 * _1769;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1785 = _1585 + _1783;
        float _1787 = -_859;
        float _1789 = _1787 + _1721;
        float _1791 = fma(_1773, _1773, _1781);
        float _1793 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1795 = fma(_1785, _1785, _1791);
        float _1797 = sqrt(_1795);
        float _1799 = 1.0 / _1503;
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1803 = precise::min(_1797, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1805 = _1803 * _1775;
        float _1807 = _1805 * _1799;
        float _1809 = -_813;
        float _1811 = _1809 + _1725;
        float _1813 = _1801 * _1807;
        float _1815 = _1779 * _1807;
        float _1817 = fma(_1789, _1813, _1525);
        float _1819 = fma(_1811, _1813, _1533);
        float _1821 = fma(_1801, _1815, _1585);
        _1747 = _1819;
        _1761 = _1817;
        _1765 = _1821;
        _1749 = _1789;
    }
    float _1823 = _1747;
    float _1825 = _1761;
    float _1827 = _1765;
    float _1829 = _1749;
    if (_1561)
    {
        _1679 = 1.0;
    }
    float _1831 = _1679;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1835 = _1665 * _1833;
    float _1837 = _1835;
    float _1839 = _1831;
    if (!_1561)
    {
        float _1841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1843 = _1841 * 0.15915493667125701904296875;
        float _1845 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1847;
        float _1851 = _1843 * 6.283185482025146484375;
        float _1853 = cos(_1851);
        float _1855 = _1845 * 0.15915493667125701904296875;
        float _1857 = _1843 * 6.283185482025146484375;
        float _1859 = sin(_1857);
        float _1861 = 1.0 / _1853;
        float _1863 = _1855 * 6.283185482025146484375;
        float _1865 = cos(_1863);
        float _1867 = _1859 * _1861;
        float _1869 = _1855 * 6.283185482025146484375;
        float _1871 = sin(_1869);
        float _1873 = _1865 * _1867;
        float _1875 = 1.0 / _1849;
        float _1877 = 1.0 / _1873;
        float _1879 = _1871 * _1877;
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = fma(_1835, _1879, _1881);
        float _1885 = _1883 * _1875;
        float _1887 = precise::clamp(_1885, 0.0, 1.0);
        _1757 = _1887;
    }
    float _1889 = _1757;
    if (!_1561)
    {
        float _1891 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1893 = _1891 * 0.15915493667125701904296875;
        float _1895 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1897 = _1893 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        float _1901 = _1895 * 0.15915493667125701904296875;
        float _1903 = _1893 * 6.283185482025146484375;
        float _1905 = sin(_1903);
        float _1907 = 1.0 / _1899;
        float _1909 = _1901 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = _1905 * _1907;
        float _1915 = _1901 * 6.283185482025146484375;
        float _1917 = sin(_1915);
        float _1919 = _1911 * _1913;
        float _1921 = 1.0 / _1919;
        float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1925 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1923;
        float _1927 = 1.0 / _1925;
        float _1929 = _1917 * _1921;
        float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1933 = fma(_1835, _1929, _1931);
        float _1935 = _1933 * _1927;
        float _1937 = precise::clamp(_1935, 0.0, 1.0);
        float _1939 = -_1937;
        float _1941 = _1939 + 1.0;
        _1751 = _1929;
        _1837 = _1937;
        _1839 = _1941;
    }
    float _1943 = _1751;
    float _1945 = _1837;
    float _1947 = _1839;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1951 = _1823 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1955 = _1825 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1827 + _1957;
    float _1961 = _1951 * _1951;
    float _1963 = fma(_1955, _1955, _1961);
    float _1965 = fma(_1959, _1959, _1963);
    float _1967 = rsqrt(_1965);
    float _1969 = sqrt(_1965);
    float _1971 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1973 = _1955 * _1971;
    float _1975 = _1959 * _1971;
    float _1977 = _1973 * _1973;
    float _1979 = _1975 * _1975;
    float _1981 = _1977 + _1979;
    float _1983 = sqrt(_1981);
    bool _1985 = _1983 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1989 = _1983 + _1987;
    float _1991 = _1943;
    float _1993 = _1981;
    float _1995 = _1989;
    float _1997 = _1973;
    float _1999 = _1975;
    float _2001 = _1977;
    float _2003 = _1979;
    if (_1985)
    {
        float _2005 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1991 = _2005;
    }
    float _2007 = _1991;
    if (_1985)
    {
        float _2009 = rsqrt(_1981);
        _1993 = _2009;
    }
    float _2011 = _1993;
    if (_1985)
    {
        float _2013 = _1989 * _2007;
        _1995 = _2013;
    }
    float _2015 = _1995;
    if (_1985)
    {
        float _2017 = _2015 * 0.15915493667125701904296875;
        _1753 = _2017;
    }
    float _2019 = _1753;
    float _2021 = _1725;
    if (_1985)
    {
        float _2023 = _2019 * 6.283185482025146484375;
        float _2025 = sin(_2023);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2031 = precise::max(0.0, _2029);
    float _2033 = _1945;
    float _2035 = _2031;
    float _2037 = _2029;
    if (_1985)
    {
        float _2039 = _2019 * 6.283185482025146484375;
        float _2041 = cos(_2039);
        _2033 = _2041;
    }
    float _2043 = _2033;
    float _2045 = -_1971;
    float _2047 = -_2031;
    float _2049 = fma(_1951, _2045, _2047);
    float _2051 = _2049;
    if (_1985)
    {
        float _2053 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2035 = _2053;
    }
    float _2055 = _2035;
    float _2057 = _2055;
    float _2059 = _2027;
    if (_1985)
    {
        float _2061 = fma(_2027, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2057 = _2061;
    }
    float _2063 = _2057;
    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2067 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2065);
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = _2063;
    if (_1985)
    {
        float _2073 = _2043 + (-1.0);
        _2037 = _2073;
    }
    float _2075 = _2037;
    if (_1985)
    {
        float _2077 = _2011 * _2063;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2069;
    float _2083 = _2081 + 1.0;
    if (_1985)
    {
        float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2085;
    }
    float _2087 = _2071;
    if (_1985)
    {
        float _2089 = _1973 * _2079;
        _1997 = _2089;
    }
    float _2091 = _1997;
    if (_1985)
    {
        float _2093 = _1975 * _2079;
        _1999 = _2093;
    }
    float _2095 = _1999;
    if (_1985)
    {
        float _2097 = fma(_2049, _2043, _2087);
        _2051 = _2097;
    }
    float _2099 = _2051;
    if (_1985)
    {
        float _2101 = _2091 * _2091;
        _2001 = _2101;
    }
    float _2103 = _2001;
    if (_1985)
    {
        float _2105 = _2095 * _2095;
        _2003 = _2105;
    }
    float _2107 = _2003;
    float _2109 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2111 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2113 = fma(_2099, _2099, _2103);
    float _2115 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2117 = abs(_2083);
    float _2119 = log2(_2117);
    float _2121 = _2113 + _2107;
    float _2123 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2115);
    float _2125 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2127 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2129 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2123);
    float _2131 = rsqrt(_2121);
    float _2133 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2125);
    float _2135 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2111);
    float _2139 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    float _2141 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2127);
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    float _2147 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2141);
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2109, 1.0);
    float _2155 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = _2131 * _2091;
    float _2165 = _2131 * _2099;
    float _2167 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2131 * _2095;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2173 = exp2(_2159);
    float _2175 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2177 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2179 = -_2171;
    float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2179);
    float _2183 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2175);
    float _2185 = -_2169;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2181);
    float _2189 = log2(_2153);
    float _2191 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2193 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2177);
    float _2195 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2191);
    float _2197 = _2165 + 1.0;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2193);
    float _2201 = 1.0 / _2183;
    float _2203 = fma(_2187, -0.5, 0.5);
    float _2205 = fma(_2187, 0.5, 0.5);
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2195);
    float _2209 = -_2165;
    float _2211 = fma(_2173, _2197, _2209);
    float _2213 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2199);
    float _2215 = fma(_2205, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2217 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float _2219 = sqrt(_2203);
    float _2221 = _2189 * 0.693147182464599609375;
    float _2223 = fma(_2205, _2215, -0.212114393711090087890625);
    float _2225 = fma(_2211, 0.5, 0.5);
    float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = fma(_2205, _2223, 1.570728778839111328125);
    float _2231 = _2217 * _2201;
    float _2233 = _2213 * _2201;
    float _2235 = fma(_2231, 0.5, 0.5);
    float _2237 = fma(_2233, -0.5, 0.5);
    float _2239 = _2219 * 0.636619746685028076171875;
    float3 _6190 = float3(_2235, _2237, _2227);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6190, float3(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6190, float3(0.0), isnan(_6190)), level(0.0)).x;
    float3 _6201 = float3(_2235, _2237, _2227);
    float4 _2244 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6201, float3(0.0), isnan(_6201)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6201, float3(0.0), isnan(_6201)), level(0.0)).xyzw;
    float _2246 = _2244.x;
    float _2248 = _2244.y;
    float _2250 = _2244.z;
    float _2252 = _2244.w;
    float _2254 = -_2229;
    float _2256 = fma(_2239, _2254, 1.0);
    float2 _6223 = float2(_2256, _2225);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    int _2268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2270 = _2268 != 0;
    float _2272 = in.m_49.w;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2276 = _2274 != 0;
    float _2278 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2282 = _2280 != 0;
    float _2284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2286 = _425 * _2278;
    float _2288 = -_1037;
    float _2290 = _2288 + 1.0;
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2300 = _1829;
    float _2302 = _2237;
    bool _2304 = _2270;
    bool _2306 = _2276;
    if (_2270)
    {
        float _2308 = in.m_49.w;
        _2300 = _2308;
    }
    float _2310 = _2300;
    float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2314 = _2312 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2318 = _2316 != 0;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2322 = _2235;
    bool _2324 = _2318;
    if (_2276)
    {
        float _2326 = in.m_49.z;
        _2322 = _2326;
    }
    float _2328 = _2322;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2334 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_637);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = _1341 + 0.5;
    float _2348 = _2227;
    if (_2282)
    {
        float _2350 = in.m_49.w;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2356 = -_1329;
    float _2358 = _2356 + 0.5;
    float _2360 = 1.0 / _2298;
    bool _2362 = _2272 > 0.5;
    float _2364 = -_1187;
    float _2366 = _2364 + 1.0;
    float _2368 = 1.0 / _2314;
    if (_2270)
    {
        float _2370 = _2310 * 3.1415927410125732421875;
        _2302 = _2370;
    }
    float _2372 = _2302;
    float _2374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2270)
    {
        float _2376 = _2372 * 0.15915493667125701904296875;
        _1681 = _2376;
    }
    float _2378 = _1681;
    float _2380 = _2328;
    if (_2276)
    {
        float _2382 = _2328 * 3.1415927410125732421875;
        _2380 = _2382;
    }
    float _2384 = _2380;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2392 = _2390 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2394 = -_211;
    int _2396 = _2362 ? as_type<int>(_2394) : as_type<int>(_211);
    float _2398 = _2384;
    if (_2276)
    {
        float _2400 = _2384 * 0.15915493667125701904296875;
        _2398 = _2400;
    }
    float _2402 = _2398;
    float _2404 = _2352;
    if (_2282)
    {
        float _2406 = _2352 * 3.1415927410125732421875;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = _2278;
    float _2412 = _2408;
    if (_2270)
    {
        float _2414 = _2378 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        _2410 = _2416;
    }
    float _2418 = _2410;
    float _2420 = _2392 * _2360;
    float _2422 = _2388 * _2368;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2426 = _637 + _2424;
    float _2428 = _211 * _2286;
    bool _2430 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2432 = isnan(_637);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = _2426;
    float _2444 = _2428;
    if (_2282)
    {
        float _2446 = _2408 * 0.15915493667125701904296875;
        _2412 = _2446;
    }
    float _2448 = _2412;
    bool _2450 = !_2318;
    float _2452 = _2450 ? _211 : as_type<float>(_2396);
    float _2454 = fma(_2422, _2426, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2456 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2458 = isnan(_637);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = 1.0 / _2332;
    if (_2294)
    {
        float _2470 = _145 * 3.1415927410125732421875;
        _2442 = _2470;
    }
    float _2472 = _2442;
    float _2474 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2476 = -_2440;
    float _2478 = _2476 + 1.0;
    float _2480 = -_2466;
    float _2482 = _2480 + 1.0;
    float _2484 = _2472;
    if (_2294)
    {
        float _2486 = _2472 * 0.15915493667125701904296875;
        _2484 = _2486;
    }
    float _2488 = _2484;
    if (_2270)
    {
        bool _2490 = _2418 > 0.5;
        _2324 = _2490;
    }
    bool _2492 = _2324;
    float _2494 = _2466 * _2478;
    float _2496 = _2402;
    bool _2498 = _2492;
    if (_2276)
    {
        float _2500 = _2402 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        _2496 = _2502;
    }
    float _2504 = _2496;
    float _2506 = _419 * _2474;
    bool _2508 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2510 = isnan(_637);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    float _2520 = _2344 * _2482;
    float _2522 = -_2344;
    float _2524 = _2522 + 1.0;
    float _2526 = _207 * _2506;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2530 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2528;
    float _2532 = _2488;
    float _2534 = _2526;
    if (_2294)
    {
        float _2536 = _2488 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = _2518 * _2524;
    float _2544 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2546 = _637 + _2544;
    float _2548 = _2530 * _2468;
    float _2550 = _2548;
    if (!_2270)
    {
        _1683 = _2526;
    }
    float _2552 = _1683;
    float _2554 = _2454 * _2542;
    float _2556 = -_2518;
    float _2558 = _2556 + 1.0;
    float _2560 = _2552;
    if (_2270)
    {
        float _2562 = -_2526;
        float _2564 = _2492 ? _2562 : _2526;
        _2560 = _2564;
    }
    float _2566 = _2560;
    float _2568 = _2448;
    if (_2282)
    {
        float _2570 = _2448 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    if (_2276)
    {
        bool _2576 = _2504 > 0.5;
        _2498 = _2576;
    }
    bool _2578 = _2498;
    float _2580 = fma(_2420, _2546, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2582 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2554);
    float _2584 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2586 = _637 + _2584;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2590 = _2588 != 0;
    float _2592 = fma(_2580, _2520, _2582);
    float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    if (_2294)
    {
        bool _2596 = _2540 > 0.5;
        _2304 = _2596;
    }
    bool _2598 = _2304;
    float _2600 = _2566 + 0.5;
    if (_2276)
    {
        float _2602 = -_2526;
        float _2604 = _2578 ? _2602 : _2526;
        _2534 = _2604;
    }
    float _2606 = _2534;
    float _2608 = fma(_2548, _2586, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (!_2294)
    {
        _2550 = _2428;
    }
    float _2610 = _2550;
    float _2612 = fma(_2354, _2600, _1005);
    float _2614 = _2610;
    if (_2294)
    {
        float _2616 = -_2428;
        float _2618 = _2598 ? _2616 : _2428;
        _2614 = _2618;
    }
    float _2620 = _2614;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_2282)
    {
        bool _2624 = _2574 > 0.5;
        _2306 = _2624;
    }
    bool _2626 = _2306;
    float _2628 = fma(_2608, _2494, _2592);
    float _2630 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2632 = _2620 + (-0.5);
    if (_2282)
    {
        float _2634 = -_2428;
        float _2636 = _2626 ? _2634 : _2428;
        _2444 = _2636;
    }
    float _2638 = _2444;
    float _2640 = _2606 + 0.5;
    float _2642 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2628);
    float _2644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2646 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2648 = _2638 + (-0.5);
    float _2650 = -_2630;
    float _2652 = -_1021;
    float _2654 = fma(_2650, _2632, _2652);
    float _2656 = _2642 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2658 = -_2646;
    float _2660 = -_1179;
    float _2662 = fma(_2658, _2648, _2660);
    float _2664 = -_997;
    float _2666 = _2664 + 1.0;
    float _2668 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2670 = -_987;
    float _2672 = _2670 + 1.0;
    float _2674 = -_1031;
    float _2676 = _2674 + 1.0;
    float _2678 = fma(_2666, _2620, _2654);
    float _2680 = fma(_2290, _2638, _2662);
    float _2682 = fma(_2668, _2640, _973);
    float _2684 = -_207;
    int _2686 = _985 ? as_type<int>(_2684) : as_type<int>(_207);
    float _2688 = _1091 + 0.5;
    float _2690 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2692 = -_2676;
    float _2694 = fma(_2692, _2606, _2682);
    bool _2696 = !_2590;
    float _2698 = _2696 ? _207 : as_type<float>(_2686);
    float _2700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2702 = fma(_2690, _2688, _1127);
    float _2704 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2706 = _2452 + (-0.5);
    out.m_58.x = _2694;
    out.m_58.y = _2680;
    float _2708 = -_2672;
    float _2710 = fma(_2708, _2566, _2612);
    float _2712 = _2698 + 0.5;
    float _2714 = -_2704;
    float _2716 = -_1167;
    float _2718 = fma(_2714, _2706, _2716);
    float _2720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2722 = _1889 > 0.0;
    bool _2724 = isnan(_1889);
    bool _2726 = _2722 || _2724;
    bool _2728 = isnan(0.0);
    bool _2730 = _2726 || _2728;
    out.m_60.x = _2710;
    out.m_60.y = _2678;
    bool _2732 = _1947 <= 0.0;
    bool _2734 = !_2730;
    bool _2736 = _2732 || _2734;
    float _2738 = -_1195;
    float _2740 = _2738 + 1.0;
    out.m_62.w = _2656;
    float _2742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2744 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2746 = fma(_2452, _2740, _2718);
    float _2748 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2750 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2752 = fma(_2744, _2712, _1201);
    float _2754 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2756 = _1889 * _1947;
    float _2758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2760 = -_2366;
    float _2762 = fma(_2698, _2760, _2752);
    float _2764 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2766 = _2750 * _2720;
    float _2768 = _1087 + (-0.5);
    float _2770 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2764);
    float _2772 = exp2(_2748);
    float _2774 = _2754 * _2742;
    out.m_64.x = _2766;
    out.m_64.y = _2774;
    out.m_64.z = _2762;
    out.m_64.w = _2746;
    float _2776 = _2758 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2778 = -_2776;
    float _2780 = -_1205;
    float _2782 = fma(_2778, _2768, _2780);
    float _2784 = _2756 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2770);
    float _2788 = -_1183;
    float _2790 = _2788 + 1.0;
    float _2792 = -_2772;
    float _2794 = _2792 + 1.0;
    float _2796 = -_1191;
    float _2798 = _2796 + 1.0;
    float _2800 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2786);
    float _2802 = _419 * _2784;
    float _2804 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2806 = fma(_1087, _2798, _2782);
    float _2808 = _2800 + _2183;
    float _2810 = -_2790;
    float _2812 = fma(_1091, _2810, _2702);
    float _2814 = -_2804;
    float _2816 = _2814 + 1.0;
    float _2818 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2820 = _2808 * 0.5;
    out.m_66.x = _2812;
    out.m_66.y = _2806;
    out.m_45.x = _2818;
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2213;
    out.gl_Position.z = _2800;
    out.gl_Position.w = _2183;
    out.m_68.z = _2820;
    out.m_68.w = _2183;
    float _2822 = _2804 * _2241;
    float _2824 = _2252 * _2822;
    float _2826 = _2266 * _2822;
    float _2828 = fma(_2262, _2824, _2246);
    float _2830 = fma(_2264, _2824, _2248);
    float _2832 = _2252 * _2816;
    float _2834 = fma(_2252, _2826, _2250);
    out.m_70.x = _2828;
    out.m_70.y = _2830;
    out.m_70.z = _2834;
    out.m_70.w = _2832;
    if (!_2736)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2836 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2836;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

