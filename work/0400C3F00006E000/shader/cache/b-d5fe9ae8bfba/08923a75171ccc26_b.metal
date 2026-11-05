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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2240 = false;
    bool _491 = false;
    bool _303 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2545 = as_type<float>(_121);
        out.gl_Position.z = _2545;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_159);
        out.gl_Position.z = _2614;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _229;
    float _239 = _213 * _237;
    bool _241 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_209);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = _251 * _233;
    float _263 = fma(_255, _239, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_259, _239, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _263 * _261;
    float _273 = _265 * _261;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_235;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_105);
        float _307 = 1.0 / _305;
        float _309 = _139 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_58.x;
    float _315 = in.m_58.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _325 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = isnan(_311);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _319;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _355;
    float _359 = -_335;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _323;
    float _367 = _353 * _361;
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _377 = _281 * _315;
    bool _379 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _381 = isnan(_311);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _341;
    float _393 = _357 * _337;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _311 + _395;
    float _399 = _389 * _371;
    float _401 = -_389;
    float _403 = _401 + 1.0;
    float _405 = fma(_393, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _311 + _407;
    float _411 = _375 * _365;
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _399;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _311 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _391;
    float _445 = _335 * _439;
    float _447 = fma(_431, _367, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = _279 * _313;
    float _453 = fma(_449, _445, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _453);
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _471 = !_363;
    float _489;
    if (!_471)
    {
        float _473 = in.m_56.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_105);
        float _495 = 1.0 / _493;
        float _497 = _139 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = in.m_56.z;
    float _507 = in.m_56.w;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    bool _535 = !_529;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_525;
    int _541 = _539 ? 0 : 1;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    int _553 = abs(_537);
    float _555 = _505 * 2.0;
    float _557 = _501 * 2.0;
    float _559 = _503 * 2.0;
    float _561 = float(_553);
    float _563 = -_519;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[77].x, _563);
    float _567 = floor(_555);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = -_139;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _575 = floor(_559);
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    bool _581 = _567 > 0.0;
    float _583 = _503 + _505;
    bool _585 = _567 >= 0.0;
    bool _587 = isnan(_567);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _597 = _583 + (-1.0);
    float _599 = floor(_557);
    float _601 = fma(_595, -2.0, _569);
    int _603 = _593 ? 0 : 1;
    float _605 = _503 + _501;
    bool _607 = _575 >= 0.0;
    bool _609 = isnan(_575);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _619 = ~_603;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = _605 + (-1.0);
    int _627 = _623;
    if (!_581)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _601);
    bool _637 = _575 > 0.0;
    float _639 = _579 * _139;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _643 = in.m_62.x;
    float _645 = in.m_62.y;
    float _647 = in.m_62.z;
    bool _649 = _599 > 0.0;
    float _651 = exp2(_639);
    bool _653 = _599 >= 0.0;
    bool _655 = isnan(_599);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _665 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _667 = isnan(1.0);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _673 = _669 || _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    float _679 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = float(_633);
    float _685 = 1.0 / _677;
    float _687 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    float _689 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    int _691 = abs(_541);
    int _693 = _615 ? 0 : 1;
    float _695 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _689);
    int _697 = _661 ? 0 : 1;
    float _699 = -_651;
    float _701 = _699 + 1.0;
    float _703 = float(_691);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    int _711 = _709;
    if (!_649)
    {
        int _713 = ~_697;
        int _715 = _713 + 1;
        _711 = _715;
    }
    int _717 = _711;
    float _719 = _703 * _683;
    float _721 = _551 ? _701 : 0.0;
    float _723 = in.m_46.x;
    float _725 = in.m_46.y;
    float _727 = in.m_46.z;
    float _729 = float(_717);
    float _731 = _719 * (-2.0);
    int _733 = ~_693;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (_673)
    {
        float _741 = _721 * _685;
        _143 = _741;
    }
    float _743 = _143;
    if (!_637)
    {
        int _745 = ~_693;
        int _747 = _745 + 1;
        _739 = _747;
    }
    int _749 = _739;
    float _751 = _561 * _729;
    float _753 = in.m_64.x;
    float _755 = in.m_64.y;
    float _757 = in.m_64.z;
    float _759 = in.m_64.w;
    float _761 = _501 + (-0.5);
    float _763 = fma(_731, _643, _643);
    float _765 = fma(_641, _731, _641);
    float _767 = _751 * (-2.0);
    bool _769 = !_533;
    int _771 = _769 ? 0 : 1;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    float _775 = _503 + (-0.5);
    float _777 = fma(_767, _645, _645);
    float _779 = in.m_66.x;
    float _781 = in.m_66.y;
    float _783 = in.m_66.z;
    float _785 = in.m_66.w;
    int _787 = abs(_771);
    float _789 = fma(_617, _767, _617);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _793 = float(_749);
    float _795 = _505 + _501;
    float _797 = fma(_765, _743, _773);
    float _799 = fma(_789, _743, _791);
    float _801 = _795 + (-1.0);
    float _803 = float(_787);
    float _805 = _797 * 0.15915493667125701904296875;
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _811 = _803 * _793;
    float _813 = _725 * _755;
    float _815 = _805 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _811 * (-2.0);
    float _821 = fma(_723, _753, _813);
    float _823 = fma(_809, _819, _809);
    float _825 = fma(_819, _647, _647);
    float _827 = _505 + (-0.5);
    float _829 = _725 * _781;
    float _831 = _725 * _513;
    float _833 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = fma(_723, _779, _829);
    float _839 = fma(_727, _757, _821);
    float _841 = _807 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_823, _743, _835);
    float _847 = fma(_727, _783, _837);
    float _849 = fma(_723, _511, _831);
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _833);
    float _853 = _845 * 0.15915493667125701904296875;
    float _855 = _847 + _785;
    float _857 = _839 + _759;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_727, _515, _849);
    float _865 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _867 = _855 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _871 = _857 + _869;
    float _873 = _863 + _517;
    float _875 = _867 * _867;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _879 = _805 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _885 = fma(_871, _871, _875);
    float _887 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _889 = _873 + _887;
    float _891 = _521 * _877;
    float _893 = _509 * _883;
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    float _897 = fma(_889, _889, _885);
    float _899 = _853 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _817 * _861;
    float _905 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _909 = _853 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _881 * _843;
    float _915 = _881 * _861;
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _881 * _901;
    float _923 = _817 * _843;
    float _925 = _817 * _901;
    float _927 = _861 * _901;
    float _929 = _843 * _901;
    float _931 = sqrt(_895);
    float _933 = _925 * _891;
    float _935 = fma(_911, _903, _913);
    float _937 = -_923;
    float _939 = fma(_911, _915, _937);
    float _941 = -_915;
    float _943 = fma(_911, _923, _941);
    float _945 = fma(_911, _913, _903);
    float _947 = -_891;
    float _949 = _911 * _947;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = fma(_935, _893, _933);
    float _955 = _921 * _891;
    float _957 = sqrt(_897);
    float _959 = fma(_927, _893, _949);
    float _961 = fma(_943, _951, _953);
    float _963 = fma(_939, _893, _955);
    float _965 = fma(_929, _951, _959);
    float _967 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _969 = fma(_945, _951, _963);
    float _971 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = _931 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _967);
    float _977 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    bool _985 = _957 < _973;
    float _987 = float(_985);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _979);
    float _991 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _993 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    float _995 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_991, _987, _873);
    float _999 = _993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_995, _987, _857);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = _919 + _999;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1013 = _1001 + _1011;
    float _1015 = _1005 * _1005;
    float _1017 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_1013, _1013, _1015);
    float _1021 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = sqrt(_1019);
    float _1025 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    bool _1027 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.5);
    bool _1035 = _1031 || _1033;
    bool _1037 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    float _1047 = _1009 * _1007;
    float _1049 = _1047 * 0.5;
    float _1051 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1055 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1053);
    float _1057 = fma(_1051, _987, _855);
    float _1059 = 1.0 / _1055;
    bool _1061 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1007;
    float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1067 = _1001;
    float _1069 = _1023;
    float _1071 = _1055;
    float _1073 = _847;
    float _1075 = _855;
    if (!_1061)
    {
        _1063 = _1001;
    }
    float _1077 = _1063;
    float _1079 = _1077;
    if (!_1061)
    {
        _1065 = _997;
    }
    float _1081 = _1065;
    float _1083 = _1081;
    if (!_1061)
    {
        _1067 = _1057;
    }
    float _1085 = _1067;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1023 + _1093;
        float _1097 = rsqrt(_1019);
        float _1099 = _1095 * _1091;
        float _1101 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1117 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = _1097 * _1115;
        float _1121 = fma(_1057, _1107, _1117);
        float _1123 = fma(_1013, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1005, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1079 = _1123;
        _1083 = _1125;
        _1089 = _1121;
        _1069 = _1103;
    }
    float _1127 = _1079;
    float _1129 = _1083;
    float _1131 = _1089;
    float _1133 = _1069;
    float _1135 = _1131;
    float _1137 = _1127;
    float _1139 = _1129;
    float _1141 = _1133;
    if (_1035)
    {
        _1071 = 1.0;
    }
    float _1143 = _1071;
    float _1145 = _1143;
    if (!_1045)
    {
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1149 = _855 + _1147;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1153 = _857 + _1151;
        float _1155 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1157 = -_857;
        float _1159 = _1157 + _1127;
        float _1161 = _1149 * _1149;
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1165 = _873 + _1163;
        float _1167 = -_873;
        float _1169 = _1167 + _1129;
        float _1171 = fma(_1153, _1153, _1161);
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1175 = fma(_1165, _1165, _1171);
        float _1177 = sqrt(_1175);
        float _1179 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = -_855;
        float _1183 = _1181 + _1131;
        float _1185 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1173;
        float _1189 = _1179 * _1187;
        float _1191 = fma(_1183, _1189, _855);
        float _1193 = fma(_1159, _1189, _857);
        float _1195 = fma(_1169, _1189, _873);
        _1135 = _1191;
        _1137 = _1193;
        _1139 = _1195;
    }
    float _1197 = _1135;
    float _1199 = _1137;
    float _1201 = _1139;
    if (_1035)
    {
        _1073 = 1.0;
    }
    float _1203 = _1073;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1059 * _1205;
    float _1209 = _1203;
    if (!_1035)
    {
        float _1211 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = _1211 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1221;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1215;
        float _1247 = 1.0 / _1243;
        float _1249 = _1241 * _1247;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = fma(_1207, _1249, _1251);
        float _1255 = _1253 * _1245;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        _1141 = _1225;
        _1145 = _1257;
    }
    float _1259 = _1141;
    float _1261 = _1145;
    if (!_1035)
    {
        float _1263 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1265 = _1263 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1265 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = 1.0 / _1269;
        float _1281 = _1273 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1277 * _1279;
        float _1287 = _1273 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        float _1291 = _1283 * _1285;
        float _1293 = 1.0 / _1291;
        float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1297 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1295;
        float _1299 = 1.0 / _1297;
        float _1301 = _1289 * _1293;
        float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1305 = fma(_1207, _1301, _1303);
        float _1307 = _1305 * _1299;
        float _1309 = precise::clamp(_1307, 0.0, 1.0);
        float _1311 = -_1309;
        float _1313 = _1311 + 1.0;
        _1209 = _1313;
    }
    float _1315 = _1209;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1197 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1199 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1201 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1335 = fma(_1327, _1327, _1331);
    float _1337 = rsqrt(_1335);
    float _1339 = sqrt(_1335);
    float _1341 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1323 * _1341;
    float _1345 = _1327 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1259;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    float _1369 = _1345;
    float _1371 = _1347;
    if (_1355)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1373;
    }
    float _1375 = _1361;
    if (_1355)
    {
        float _1377 = rsqrt(_1351);
        _1363 = _1377;
    }
    float _1379 = _1363;
    if (_1355)
    {
        float _1381 = _1359 * _1375;
        _1365 = _1381;
    }
    float _1383 = _1365;
    if (_1355)
    {
        float _1385 = _1383 * 0.15915493667125701904296875;
        _1075 = _1385;
    }
    float _1387 = _1075;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = _1057;
    float _1393 = _1389;
    if (_1355)
    {
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = precise::max(0.0, _1389);
    float _1403 = _1383;
    float _1405 = _1401;
    if (_1355)
    {
        float _1407 = _1387 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1341;
    float _1415 = -_1401;
    float _1417 = fma(_1319, _1413, _1415);
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1421;
    }
    float _1423 = _1405;
    float _1425 = _1399;
    if (_1355)
    {
        float _1427 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = _1429;
    if (_1355)
    {
        float _1435 = _1379 * _1429;
        _1433 = _1435;
    }
    float _1437 = _1433;
    float _1439 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1441 = _1411;
    if (_1355)
    {
        float _1443 = _1411 + (-1.0);
        _1393 = _1443;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1355)
    {
        float _1449 = _1343 * _1437;
        _1367 = _1449;
    }
    float _1451 = _1367;
    if (_1355)
    {
        float _1453 = _1345 * _1437;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1355)
    {
        float _1459 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1355)
    {
        float _1463 = _1451 * _1451;
        _1371 = _1463;
    }
    float _1465 = _1371;
    float _1467 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1469 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1355)
    {
        float _1471 = fma(_1417, _1411, _1461);
        _1419 = _1471;
    }
    float _1473 = _1419;
    if (!_1355)
    {
        _1441 = _1349;
    }
    float _1475 = _1441;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1455 * _1455;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1485 = fma(_1473, _1473, _1465);
    float _1487 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1489 = floor(_1333);
    float _1491 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = _1485 + _1481;
    float _1495 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1487);
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1495);
    float _1505 = rsqrt(_1493);
    float _1507 = -_1501;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = -_1515;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1531 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = -_1489;
    float _1535 = _1333 + _1533;
    float _1537 = _1505 * _1451;
    float _1539 = _1505 * _1473;
    float _1541 = _1505 * _1455;
    float _1543 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = floor(_1523);
    float _1551 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = -_1545;
    float _1555 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = -_1541;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1567 = log2(_1527);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1571 = fma(_1563, -0.5, 0.5);
    float _1573 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1575 = exp2(_1559);
    float _1577 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = -_1549;
    float _1581 = _1523 + _1579;
    float _1583 = _1539 + 1.0;
    float _1585 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1587 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = fma(_1563, 0.5, 0.5);
    float _1591 = sqrt(_1571);
    float _1593 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = _1567 * 0.693147182464599609375;
    float _1599 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1601 = fma(_1589, _1595, -0.212114393711090087890625);
    float2 _4836 = float2(_1535, _1581);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4836, float2(0.0), isnan(_4836)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4836, float2(0.0), isnan(_4836)), level(0.0)).x;
    float _1605 = 1.0 / _1587;
    float _1607 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1599);
    float _1609 = -_1539;
    float _1611 = fma(_1575, _1583, _1609);
    float _1613 = fma(_1589, _1601, 1.570728778839111328125);
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1619 = fma(_1611, 0.5, 0.5);
    float _1621 = _1591 * 0.636619746685028076171875;
    float _1623 = _1585 * _1605;
    float _1625 = _1617 * _1605;
    float _1627 = -_1613;
    float _1629 = fma(_1621, _1627, 1.0);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = fma(_1625, -0.5, 0.5);
    float3 _4893 = float3(_1631, _1633, _1615);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4893, float3(0.0), isnan(_4893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4893, float3(0.0), isnan(_4893)), level(0.0)).x;
    float3 _4904 = float3(_1631, _1633, _1615);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4904, float3(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4904, float3(0.0), isnan(_4904)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4920 = float2(_1629, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4920, float2(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4920, float2(0.0), isnan(_4920)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    out.m_68.x = _463;
    out.m_68.y = _465;
    out.m_68.z = _467;
    out.m_68.w = _469;
    float _1658 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1664 = _507 > 0.5;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1670 = _501 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1676 = _503 > 0.5;
    float _1678 = 1.0 / _1662;
    float _1680 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1682 = 1.0 / _1668;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1684;
    float _1688 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1680);
    float _1690 = -_175;
    int _1692 = _1670 ? as_type<int>(_1690) : as_type<int>(_175);
    bool _1694 = _505 > 0.5;
    float _1696 = 1.0 / _1674;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1702;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1708 = _1706 != 0;
    float _1710 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1714 = _1712 != 0;
    float _1716 = _1700 * _1678;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1720 = _1718 != 0;
    float _1722 = _1704 * _1682;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1726 = _1724 != 0;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1730 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1732 = isnan(_499);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    bool _1742 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_499);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    bool _1754 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1756 = isnan(_499);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = _1686 * _1696;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _499 + _1772;
    float _1776 = -_1752;
    float _1778 = _1776 + 1.0;
    float _1780 = _1752 * _1768;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _499 + _1782;
    float _1786 = fma(_1770, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1788 = _1764 * _1778;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = -_1764;
    float _1794 = _1792 + 1.0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _499 + _1796;
    float _1800 = fma(_1716, _1784, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = -_179;
    int _1804 = _1676 ? as_type<int>(_1802) : as_type<int>(_179);
    float _1806 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1808 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1810 = isnan(_499);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1722, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1822 = !_1714;
    float _1824 = _1822 ? _179 : as_type<float>(_1804);
    float _1826 = exp2(_1658);
    bool _1828 = !_1708;
    float _1830 = _1828 ? _175 : as_type<float>(_1692);
    float _1832 = _1818 * _1794;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1824 + (-0.5);
    float _1840 = _1786 * _1832;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = -_1806;
    float _1846 = -_635;
    float _1848 = fma(_1844, _1838, _1846);
    float _1850 = _1830 + 0.5;
    float _1852 = -_179;
    int _1854 = _1664 ? as_type<int>(_1852) : as_type<int>(_179);
    float _1856 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1840);
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1860 = fma(_1842, _1850, _573);
    bool _1862 = !_1726;
    float _1864 = _1862 ? _179 : as_type<float>(_1854);
    float _1866 = _973 + (-10.0);
    float _1868 = fma(_1800, _1788, _1856);
    float _1870 = -_687;
    float _1872 = _1870 + 1.0;
    float _1874 = -_695;
    float _1876 = _1874 + 1.0;
    float _1878 = -_1864;
    float _1880 = _1878 + 0.5;
    float _1882 = abs(_1207);
    float _1884 = log2(_1882);
    float _1886 = precise::max(_957, _1866);
    float _1888 = fma(_1824, _1876, _1848);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1892 = -_175;
    int _1894 = _1694 ? as_type<int>(_1892) : as_type<int>(_175);
    float _1896 = fma(_1820, _1780, _1868);
    float _1898 = precise::min(_973, _1886);
    float _1900 = -_1872;
    float _1902 = fma(_1830, _1900, _1860);
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1906 = _1890 * _1858;
    bool _1908 = !_1720;
    float _1910 = _1908 ? _175 : as_type<float>(_1894);
    float _1912 = -_1866;
    float _1914 = _1912 + _1898;
    float _1916 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1896);
    float _1918 = _1910 + 0.5;
    float _1920 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1922 = fma(_1914, -0.100000001490116119384765625, 1.0);
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1928 = exp2(_1920);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1924 * _1904;
    float _1938 = _1926 * _1922;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1902;
    out.m_70.y = _1888;
    out.m_70.z = _1936;
    out.m_70.w = _1906;
    float _1946 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1948 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _1940;
    out.m_72.y = _1942;
    out.m_72.z = _1944;
    out.m_72.w = _1938;
    bool _1950 = _1207 <= 8000.0;
    bool _1952 = isnan(_1207);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(8000.0);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1826;
    float _1964 = _1962 + 1.0;
    float _1966 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1968 = precise::clamp(_1966, 0.0, 1.0);
    float _1970 = _1587 * 0.5;
    bool _1972 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1974 = isnan(_1339);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1980 = _1976 || _1978;
    float _1982 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1984 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1986 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1988 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = -_911;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1984);
    float _1994 = -_911;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1986);
    float _1998 = -_911;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1946);
    float _2002 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2004 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2008 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1992);
    float _2010 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1996);
    float _2012 = fma(_1968, -2.0, 3.0);
    float _2014 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2016 = _1968 * _1968;
    float _2018 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2000);
    float _2022 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2006);
    float _2026 = _2016 * _2012;
    float _2028 = _2018 * _2008;
    float _2030 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _2018 * _2010;
    float _2036 = _2018 * _2020;
    float _2038 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2040 = -_2026;
    float _2042 = _2040 + 1.0;
    float _2044 = in.m_74.x;
    float _2046 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2050 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2026);
    float _2052 = fma(_1617, -0.5, _1970);
    float _2054 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2056 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2058 = _1960 * _2050;
    float _2060 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2062 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = fma(_1948, _2056, _2034);
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2068 = fma(_1948, _2038, _2028);
    float _2070 = fma(_1948, _2062, _2036);
    float _2072 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1710);
    float _2074 = _2060 + _2064;
    float _2076 = _1585 + _1587;
    float _2078 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2024);
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1617;
    out.gl_Position.z = _2072;
    out.gl_Position.w = _1587;
    float _2080 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2082 = _2072 + _1587;
    float _2084 = _2078 + _2068;
    float _2086 = _2080 + _2070;
    float _2088 = _2082 * 0.5;
    float _2090 = _2076 * 0.5;
    out.m_76.x = _2084;
    out.m_76.y = _2074;
    out.m_76.z = _2086;
    out.m_78.x = _2090;
    out.m_78.y = _2052;
    out.m_78.z = _2088;
    out.m_78.w = _1587;
    float _2092 = _1587;
    float _2094 = _2072;
    float _2096 = _2052;
    float _2098 = _2090;
    if (!_1980)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2092;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_1980)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_1980)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_1980)
    {
        _2098 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _2098;
    float _2120 = -_1603;
    float _2122 = _2120 + 1.0;
    float _2124 = _2122 * _2066;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2126;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2132 = _2130 * _2044;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2134;
    float _2136 = _1982 * _1635;
    float _2138 = -_1982;
    float _2140 = _2138 + 1.0;
    float _2142 = _1646 * _2136;
    float _2144 = _1656 * _2136;
    float _2146 = _1646 * _2140;
    float _2148 = _1261 * _1315;
    float _2150 = fma(_1652, _2142, _1640);
    float _2152 = fma(_1654, _2142, _1642);
    float _2154 = fma(_1646, _2144, _1644);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = _2142;
    float _2160 = _2148;
    float _2162 = _2118;
    float _2164 = _2118;
    if (!_1980)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _2158;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_1980)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2160;
    out.m_82.x = _2150;
    out.m_82.y = _2152;
    out.m_82.z = _2154;
    out.m_82.w = _2146;
    bool _2174 = !_1980;
    float _2176 = _2172;
    float _2178 = _2172;
    if (!_2174)
    {
        bool _2180 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2182 = isnan(_1339);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2188 = _2184 || _2186;
        if (!_2188)
        {
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2192 = _1339 + _2190;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = 1.0 / _2196;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2220 = _2192 * _2202;
            float _2222 = precise::clamp(_2220, 0.0, 1.0);
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2228 = fma(_2222, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2230 = fma(_2222, _2226, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2222, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2222, _2210, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2236 = fma(_2222, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2238 = fma(_2222, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2164 = _2232;
            _2170 = _2236;
            _2116 = _2228;
            _2110 = _2234;
            _2104 = _2230;
            _2178 = _2238;
            _2240 = true;
        }
        else
        {
            bool _2242 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2244 = isnan(_1339);
            bool _2246 = _2242 || _2244;
            bool _2248 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2250 = _2246 || _2248;
            if (!_2250)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2252 = _2114;
            _2116 = _2252;
            if (!_2250)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2254 = _2162;
            _2164 = _2254;
            if (!_2250)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2256 = _2102;
            _2104 = _2256;
            if (!_2250)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2258 = _2108;
            _2110 = _2258;
            if (!_2250)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2260 = _2168;
            _2170 = _2260;
            if (!_2250)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2262 = _2176;
            bool _2264 = !_2250;
            _2178 = _2262;
            if (!_2264)
            {
                bool _2266 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2268 = isnan(_1339);
                bool _2270 = _2266 || _2268;
                bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2274 = _2270 || _2272;
                if (!_2274)
                {
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2278 = _1339 + _2276;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = 1.0 / _2282;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2306 = _2278 * _2288;
                    float _2308 = precise::clamp(_2306, 0.0, 1.0);
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2164 = _2318;
                    _2170 = _2322;
                    _2116 = _2314;
                    _2110 = _2320;
                    _2104 = _2316;
                    _2178 = _2324;
                    _2240 = true;
                }
                else
                {
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2240 = false;
    float _2326 = _2164;
    float _2328 = _2170;
    float _2330 = _2116;
    float _2332 = _2110;
    float _2334 = _2104;
    float _2336 = _2178;
    float _2338 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2340 = fma(_2074, -0.5, 0.5);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = -_2326;
    float _2346 = _2344 + _2328;
    float _2348 = -_2330;
    float _2350 = _2348 + _2332;
    out.m_84.x = 0.0;
    float _2352 = fma(_2342, _2346, _2326);
    float _2354 = -_2334;
    float _2356 = _2354 + _2336;
    float _2358 = fma(_2342, _2350, _2330);
    float _2360 = _2352 * 0.586610972881317138671875;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2342, _2356, _2334);
    out.m_49.x = _2338;
    float _2366 = fma(_2358, 0.298911988735198974609375, _2360);
    bool _2368 = _1261 > 0.0;
    bool _2370 = isnan(_1261);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = fma(_2364, 0.114477999508380889892578125, _2366);
    bool _2380 = _1315 <= 0.0;
    bool _2382 = !_2376;
    bool _2384 = _2380 || _2382;
    float _2386 = -_2378;
    float _2388 = _2358 + _2386;
    float _2390 = -_2378;
    float _2392 = _2352 + _2390;
    float _2394 = -_2378;
    float _2396 = _2364 + _2394;
    float _2398 = fma(_2388, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2400 = fma(_2392, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    bool _2404 = !_2362;
    if (!_2404)
    {
        float _2406 = -_1197;
        float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2410 = -_1199;
        float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2414 = -_1201;
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2418 = _2408 * _2408;
        float _2420 = fma(_2412, _2412, _2418);
        float _2422 = fma(_2416, _2416, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = rsqrt(_2422);
        float _2428 = -_2424;
        float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2434 = precise::clamp(_2432, 0.0, 1.0);
        float _2436 = _2412 * _2426;
        float _2438 = _2408 * _2426;
        float _2440 = abs(_2434);
        float _2442 = log2(_2440);
        float _2444 = _2416 * _2426;
        float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2448 = _2074 * _2438;
        float _2450 = -_2438;
        float _2452 = -_2446;
        float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
        float _2456 = fma(_2084, _2436, _2448);
        float _2458 = -_2444;
        float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
        float _2462 = fma(_2086, _2444, _2456);
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2468 = _2460 + _2466;
        float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = exp2(_2470);
        float _2478 = _2476 * _2474;
        float _2480 = _2464 * _2478;
        float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2482;
        out.m_84.y = _2484;
        out.m_84.z = _2486;
    }
    out.m_86.x = _2398;
    out.m_86.y = _2400;
    out.m_86.z = _2402;
    if (!_2384)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2240 = false;
    bool _491 = false;
    bool _303 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2545 = as_type<float>(_121);
        out.gl_Position.z = _2545;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_159);
        out.gl_Position.z = _2614;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _229;
    float _239 = _213 * _237;
    bool _241 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_209);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = _251 * _233;
    float _263 = fma(_255, _239, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_259, _239, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _263 * _261;
    float _273 = _265 * _261;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_235;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_105);
        float _307 = 1.0 / _305;
        float _309 = _139 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_58.x;
    float _315 = in.m_58.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _325 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = isnan(_311);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _319;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _355;
    float _359 = -_335;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _323;
    float _367 = _353 * _361;
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _377 = _281 * _315;
    bool _379 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _381 = isnan(_311);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _341;
    float _393 = _357 * _337;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _311 + _395;
    float _399 = _389 * _371;
    float _401 = -_389;
    float _403 = _401 + 1.0;
    float _405 = fma(_393, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _311 + _407;
    float _411 = _375 * _365;
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _399;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _311 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _391;
    float _445 = _335 * _439;
    float _447 = fma(_431, _367, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = _279 * _313;
    float _453 = fma(_449, _445, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _453);
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _471 = !_363;
    float _489;
    if (!_471)
    {
        float _473 = in.m_56.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_105);
        float _495 = 1.0 / _493;
        float _497 = _139 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = in.m_56.z;
    float _507 = in.m_56.w;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    bool _535 = !_529;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_525;
    int _541 = _539 ? 0 : 1;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    int _553 = abs(_537);
    float _555 = _505 * 2.0;
    float _557 = _501 * 2.0;
    float _559 = _503 * 2.0;
    float _561 = float(_553);
    float _563 = -_519;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[77].x, _563);
    float _567 = floor(_555);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = -_139;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _575 = floor(_559);
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    bool _581 = _567 > 0.0;
    float _583 = _503 + _505;
    bool _585 = _567 >= 0.0;
    bool _587 = isnan(_567);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _597 = _583 + (-1.0);
    float _599 = floor(_557);
    float _601 = fma(_595, -2.0, _569);
    int _603 = _593 ? 0 : 1;
    float _605 = _503 + _501;
    bool _607 = _575 >= 0.0;
    bool _609 = isnan(_575);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _619 = ~_603;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = _605 + (-1.0);
    int _627 = _623;
    if (!_581)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _601);
    bool _637 = _575 > 0.0;
    float _639 = _579 * _139;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _643 = in.m_62.x;
    float _645 = in.m_62.y;
    float _647 = in.m_62.z;
    bool _649 = _599 > 0.0;
    float _651 = exp2(_639);
    bool _653 = _599 >= 0.0;
    bool _655 = isnan(_599);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _665 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _667 = isnan(1.0);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _673 = _669 || _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    float _679 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = float(_633);
    float _685 = 1.0 / _677;
    float _687 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    float _689 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    int _691 = abs(_541);
    int _693 = _615 ? 0 : 1;
    float _695 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _689);
    int _697 = _661 ? 0 : 1;
    float _699 = -_651;
    float _701 = _699 + 1.0;
    float _703 = float(_691);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    int _711 = _709;
    if (!_649)
    {
        int _713 = ~_697;
        int _715 = _713 + 1;
        _711 = _715;
    }
    int _717 = _711;
    float _719 = _703 * _683;
    float _721 = _551 ? _701 : 0.0;
    float _723 = in.m_46.x;
    float _725 = in.m_46.y;
    float _727 = in.m_46.z;
    float _729 = float(_717);
    float _731 = _719 * (-2.0);
    int _733 = ~_693;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (_673)
    {
        float _741 = _721 * _685;
        _143 = _741;
    }
    float _743 = _143;
    if (!_637)
    {
        int _745 = ~_693;
        int _747 = _745 + 1;
        _739 = _747;
    }
    int _749 = _739;
    float _751 = _561 * _729;
    float _753 = in.m_64.x;
    float _755 = in.m_64.y;
    float _757 = in.m_64.z;
    float _759 = in.m_64.w;
    float _761 = _501 + (-0.5);
    float _763 = fma(_731, _643, _643);
    float _765 = fma(_641, _731, _641);
    float _767 = _751 * (-2.0);
    bool _769 = !_533;
    int _771 = _769 ? 0 : 1;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    float _775 = _503 + (-0.5);
    float _777 = fma(_767, _645, _645);
    float _779 = in.m_66.x;
    float _781 = in.m_66.y;
    float _783 = in.m_66.z;
    float _785 = in.m_66.w;
    int _787 = abs(_771);
    float _789 = fma(_617, _767, _617);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _793 = float(_749);
    float _795 = _505 + _501;
    float _797 = fma(_765, _743, _773);
    float _799 = fma(_789, _743, _791);
    float _801 = _795 + (-1.0);
    float _803 = float(_787);
    float _805 = _797 * 0.15915493667125701904296875;
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _811 = _803 * _793;
    float _813 = _725 * _755;
    float _815 = _805 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _811 * (-2.0);
    float _821 = fma(_723, _753, _813);
    float _823 = fma(_809, _819, _809);
    float _825 = fma(_819, _647, _647);
    float _827 = _505 + (-0.5);
    float _829 = _725 * _781;
    float _831 = _725 * _513;
    float _833 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = fma(_723, _779, _829);
    float _839 = fma(_727, _757, _821);
    float _841 = _807 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_823, _743, _835);
    float _847 = fma(_727, _783, _837);
    float _849 = fma(_723, _511, _831);
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _833);
    float _853 = _845 * 0.15915493667125701904296875;
    float _855 = _847 + _785;
    float _857 = _839 + _759;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_727, _515, _849);
    float _865 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _867 = _855 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _871 = _857 + _869;
    float _873 = _863 + _517;
    float _875 = _867 * _867;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _879 = _805 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _885 = fma(_871, _871, _875);
    float _887 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _889 = _873 + _887;
    float _891 = _521 * _877;
    float _893 = _509 * _883;
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    float _897 = fma(_889, _889, _885);
    float _899 = _853 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _817 * _861;
    float _905 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _909 = _853 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _881 * _843;
    float _915 = _881 * _861;
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _881 * _901;
    float _923 = _817 * _843;
    float _925 = _817 * _901;
    float _927 = _861 * _901;
    float _929 = _843 * _901;
    float _931 = sqrt(_895);
    float _933 = _925 * _891;
    float _935 = fma(_911, _903, _913);
    float _937 = -_923;
    float _939 = fma(_911, _915, _937);
    float _941 = -_915;
    float _943 = fma(_911, _923, _941);
    float _945 = fma(_911, _913, _903);
    float _947 = -_891;
    float _949 = _911 * _947;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = fma(_935, _893, _933);
    float _955 = _921 * _891;
    float _957 = sqrt(_897);
    float _959 = fma(_927, _893, _949);
    float _961 = fma(_943, _951, _953);
    float _963 = fma(_939, _893, _955);
    float _965 = fma(_929, _951, _959);
    float _967 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _969 = fma(_945, _951, _963);
    float _971 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = _931 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _967);
    float _977 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    bool _985 = _957 < _973;
    float _987 = float(_985);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _979);
    float _991 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _993 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    float _995 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_991, _987, _873);
    float _999 = _993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_995, _987, _857);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = _919 + _999;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1013 = _1001 + _1011;
    float _1015 = _1005 * _1005;
    float _1017 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_1013, _1013, _1015);
    float _1021 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = sqrt(_1019);
    float _1025 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    bool _1027 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.5);
    bool _1035 = _1031 || _1033;
    bool _1037 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    float _1047 = _1009 * _1007;
    float _1049 = _1047 * 0.5;
    float _1051 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1055 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1053);
    float _1057 = fma(_1051, _987, _855);
    float _1059 = 1.0 / _1055;
    bool _1061 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1007;
    float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1067 = _1001;
    float _1069 = _1023;
    float _1071 = _1055;
    float _1073 = _847;
    float _1075 = _855;
    if (!_1061)
    {
        _1063 = _1001;
    }
    float _1077 = _1063;
    float _1079 = _1077;
    if (!_1061)
    {
        _1065 = _997;
    }
    float _1081 = _1065;
    float _1083 = _1081;
    if (!_1061)
    {
        _1067 = _1057;
    }
    float _1085 = _1067;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1023 + _1093;
        float _1097 = rsqrt(_1019);
        float _1099 = _1095 * _1091;
        float _1101 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1117 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = _1097 * _1115;
        float _1121 = fma(_1057, _1107, _1117);
        float _1123 = fma(_1013, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1005, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1079 = _1123;
        _1083 = _1125;
        _1089 = _1121;
        _1069 = _1103;
    }
    float _1127 = _1079;
    float _1129 = _1083;
    float _1131 = _1089;
    float _1133 = _1069;
    float _1135 = _1131;
    float _1137 = _1127;
    float _1139 = _1129;
    float _1141 = _1133;
    if (_1035)
    {
        _1071 = 1.0;
    }
    float _1143 = _1071;
    float _1145 = _1143;
    if (!_1045)
    {
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1149 = _855 + _1147;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1153 = _857 + _1151;
        float _1155 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1157 = -_857;
        float _1159 = _1157 + _1127;
        float _1161 = _1149 * _1149;
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1165 = _873 + _1163;
        float _1167 = -_873;
        float _1169 = _1167 + _1129;
        float _1171 = fma(_1153, _1153, _1161);
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1175 = fma(_1165, _1165, _1171);
        float _1177 = sqrt(_1175);
        float _1179 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = -_855;
        float _1183 = _1181 + _1131;
        float _1185 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1173;
        float _1189 = _1179 * _1187;
        float _1191 = fma(_1183, _1189, _855);
        float _1193 = fma(_1159, _1189, _857);
        float _1195 = fma(_1169, _1189, _873);
        _1135 = _1191;
        _1137 = _1193;
        _1139 = _1195;
    }
    float _1197 = _1135;
    float _1199 = _1137;
    float _1201 = _1139;
    if (_1035)
    {
        _1073 = 1.0;
    }
    float _1203 = _1073;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1059 * _1205;
    float _1209 = _1203;
    if (!_1035)
    {
        float _1211 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = _1211 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1221;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1215;
        float _1247 = 1.0 / _1243;
        float _1249 = _1241 * _1247;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = fma(_1207, _1249, _1251);
        float _1255 = _1253 * _1245;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        _1141 = _1225;
        _1145 = _1257;
    }
    float _1259 = _1141;
    float _1261 = _1145;
    if (!_1035)
    {
        float _1263 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1265 = _1263 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1265 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = 1.0 / _1269;
        float _1281 = _1273 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1277 * _1279;
        float _1287 = _1273 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        float _1291 = _1283 * _1285;
        float _1293 = 1.0 / _1291;
        float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1297 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1295;
        float _1299 = 1.0 / _1297;
        float _1301 = _1289 * _1293;
        float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1305 = fma(_1207, _1301, _1303);
        float _1307 = _1305 * _1299;
        float _1309 = precise::clamp(_1307, 0.0, 1.0);
        float _1311 = -_1309;
        float _1313 = _1311 + 1.0;
        _1209 = _1313;
    }
    float _1315 = _1209;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1197 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1199 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1201 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1335 = fma(_1327, _1327, _1331);
    float _1337 = rsqrt(_1335);
    float _1339 = sqrt(_1335);
    float _1341 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1323 * _1341;
    float _1345 = _1327 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1259;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    float _1369 = _1345;
    float _1371 = _1347;
    if (_1355)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1373;
    }
    float _1375 = _1361;
    if (_1355)
    {
        float _1377 = rsqrt(_1351);
        _1363 = _1377;
    }
    float _1379 = _1363;
    if (_1355)
    {
        float _1381 = _1359 * _1375;
        _1365 = _1381;
    }
    float _1383 = _1365;
    if (_1355)
    {
        float _1385 = _1383 * 0.15915493667125701904296875;
        _1075 = _1385;
    }
    float _1387 = _1075;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = _1057;
    float _1393 = _1389;
    if (_1355)
    {
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = precise::max(0.0, _1389);
    float _1403 = _1383;
    float _1405 = _1401;
    if (_1355)
    {
        float _1407 = _1387 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1341;
    float _1415 = -_1401;
    float _1417 = fma(_1319, _1413, _1415);
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1421;
    }
    float _1423 = _1405;
    float _1425 = _1399;
    if (_1355)
    {
        float _1427 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = _1429;
    if (_1355)
    {
        float _1435 = _1379 * _1429;
        _1433 = _1435;
    }
    float _1437 = _1433;
    float _1439 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1441 = _1411;
    if (_1355)
    {
        float _1443 = _1411 + (-1.0);
        _1393 = _1443;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1355)
    {
        float _1449 = _1343 * _1437;
        _1367 = _1449;
    }
    float _1451 = _1367;
    if (_1355)
    {
        float _1453 = _1345 * _1437;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1355)
    {
        float _1459 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1355)
    {
        float _1463 = _1451 * _1451;
        _1371 = _1463;
    }
    float _1465 = _1371;
    float _1467 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1469 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1355)
    {
        float _1471 = fma(_1417, _1411, _1461);
        _1419 = _1471;
    }
    float _1473 = _1419;
    if (!_1355)
    {
        _1441 = _1349;
    }
    float _1475 = _1441;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1455 * _1455;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1485 = fma(_1473, _1473, _1465);
    float _1487 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1489 = floor(_1333);
    float _1491 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = _1485 + _1481;
    float _1495 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1487);
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1495);
    float _1505 = rsqrt(_1493);
    float _1507 = -_1501;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = -_1515;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1531 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = -_1489;
    float _1535 = _1333 + _1533;
    float _1537 = _1505 * _1451;
    float _1539 = _1505 * _1473;
    float _1541 = _1505 * _1455;
    float _1543 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = floor(_1523);
    float _1551 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = -_1545;
    float _1555 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = -_1541;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1567 = log2(_1527);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1571 = fma(_1563, -0.5, 0.5);
    float _1573 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1575 = exp2(_1559);
    float _1577 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = -_1549;
    float _1581 = _1523 + _1579;
    float _1583 = _1539 + 1.0;
    float _1585 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1587 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = fma(_1563, 0.5, 0.5);
    float _1591 = sqrt(_1571);
    float _1593 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = _1567 * 0.693147182464599609375;
    float _1599 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1601 = fma(_1589, _1595, -0.212114393711090087890625);
    float2 _4836 = float2(_1535, _1581);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4836, float2(0.0), isnan(_4836)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4836, float2(0.0), isnan(_4836)), level(0.0)).x;
    float _1605 = 1.0 / _1587;
    float _1607 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1599);
    float _1609 = -_1539;
    float _1611 = fma(_1575, _1583, _1609);
    float _1613 = fma(_1589, _1601, 1.570728778839111328125);
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1619 = fma(_1611, 0.5, 0.5);
    float _1621 = _1591 * 0.636619746685028076171875;
    float _1623 = _1585 * _1605;
    float _1625 = _1617 * _1605;
    float _1627 = -_1613;
    float _1629 = fma(_1621, _1627, 1.0);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = fma(_1625, -0.5, 0.5);
    float3 _4893 = float3(_1631, _1633, _1615);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4893, float3(0.0), isnan(_4893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4893, float3(0.0), isnan(_4893)), level(0.0)).x;
    float3 _4904 = float3(_1631, _1633, _1615);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4904, float3(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4904, float3(0.0), isnan(_4904)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4920 = float2(_1629, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4920, float2(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4920, float2(0.0), isnan(_4920)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    out.m_68.x = _463;
    out.m_68.y = _465;
    out.m_68.z = _467;
    out.m_68.w = _469;
    float _1658 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1664 = _507 > 0.5;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1670 = _501 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1676 = _503 > 0.5;
    float _1678 = 1.0 / _1662;
    float _1680 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1682 = 1.0 / _1668;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1684;
    float _1688 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1680);
    float _1690 = -_175;
    int _1692 = _1670 ? as_type<int>(_1690) : as_type<int>(_175);
    bool _1694 = _505 > 0.5;
    float _1696 = 1.0 / _1674;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1702;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1708 = _1706 != 0;
    float _1710 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1714 = _1712 != 0;
    float _1716 = _1700 * _1678;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1720 = _1718 != 0;
    float _1722 = _1704 * _1682;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1726 = _1724 != 0;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1730 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1732 = isnan(_499);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    bool _1742 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_499);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    bool _1754 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1756 = isnan(_499);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = _1686 * _1696;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _499 + _1772;
    float _1776 = -_1752;
    float _1778 = _1776 + 1.0;
    float _1780 = _1752 * _1768;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _499 + _1782;
    float _1786 = fma(_1770, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1788 = _1764 * _1778;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = -_1764;
    float _1794 = _1792 + 1.0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _499 + _1796;
    float _1800 = fma(_1716, _1784, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = -_179;
    int _1804 = _1676 ? as_type<int>(_1802) : as_type<int>(_179);
    float _1806 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1808 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1810 = isnan(_499);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1722, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1822 = !_1714;
    float _1824 = _1822 ? _179 : as_type<float>(_1804);
    float _1826 = exp2(_1658);
    bool _1828 = !_1708;
    float _1830 = _1828 ? _175 : as_type<float>(_1692);
    float _1832 = _1818 * _1794;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1824 + (-0.5);
    float _1840 = _1786 * _1832;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = -_1806;
    float _1846 = -_635;
    float _1848 = fma(_1844, _1838, _1846);
    float _1850 = _1830 + 0.5;
    float _1852 = -_179;
    int _1854 = _1664 ? as_type<int>(_1852) : as_type<int>(_179);
    float _1856 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1840);
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1860 = fma(_1842, _1850, _573);
    bool _1862 = !_1726;
    float _1864 = _1862 ? _179 : as_type<float>(_1854);
    float _1866 = _973 + (-10.0);
    float _1868 = fma(_1800, _1788, _1856);
    float _1870 = -_687;
    float _1872 = _1870 + 1.0;
    float _1874 = -_695;
    float _1876 = _1874 + 1.0;
    float _1878 = -_1864;
    float _1880 = _1878 + 0.5;
    float _1882 = abs(_1207);
    float _1884 = log2(_1882);
    float _1886 = precise::max(_957, _1866);
    float _1888 = fma(_1824, _1876, _1848);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1892 = -_175;
    int _1894 = _1694 ? as_type<int>(_1892) : as_type<int>(_175);
    float _1896 = fma(_1820, _1780, _1868);
    float _1898 = precise::min(_973, _1886);
    float _1900 = -_1872;
    float _1902 = fma(_1830, _1900, _1860);
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1906 = _1890 * _1858;
    bool _1908 = !_1720;
    float _1910 = _1908 ? _175 : as_type<float>(_1894);
    float _1912 = -_1866;
    float _1914 = _1912 + _1898;
    float _1916 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1896);
    float _1918 = _1910 + 0.5;
    float _1920 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1922 = fma(_1914, -0.100000001490116119384765625, 1.0);
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1928 = exp2(_1920);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1924 * _1904;
    float _1938 = _1926 * _1922;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1902;
    out.m_70.y = _1888;
    out.m_70.z = _1936;
    out.m_70.w = _1906;
    float _1946 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1948 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _1940;
    out.m_72.y = _1942;
    out.m_72.z = _1944;
    out.m_72.w = _1938;
    bool _1950 = _1207 <= 8000.0;
    bool _1952 = isnan(_1207);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(8000.0);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1826;
    float _1964 = _1962 + 1.0;
    float _1966 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1968 = precise::clamp(_1966, 0.0, 1.0);
    float _1970 = _1587 * 0.5;
    bool _1972 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1974 = isnan(_1339);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1980 = _1976 || _1978;
    float _1982 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1984 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1986 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1988 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = -_911;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1984);
    float _1994 = -_911;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1986);
    float _1998 = -_911;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1946);
    float _2002 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2004 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2008 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1992);
    float _2010 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1996);
    float _2012 = fma(_1968, -2.0, 3.0);
    float _2014 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2016 = _1968 * _1968;
    float _2018 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2000);
    float _2022 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2006);
    float _2026 = _2016 * _2012;
    float _2028 = _2018 * _2008;
    float _2030 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _2018 * _2010;
    float _2036 = _2018 * _2020;
    float _2038 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2040 = -_2026;
    float _2042 = _2040 + 1.0;
    float _2044 = in.m_74.x;
    float _2046 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2050 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2026);
    float _2052 = fma(_1617, -0.5, _1970);
    float _2054 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2056 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2058 = _1960 * _2050;
    float _2060 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2062 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = fma(_1948, _2056, _2034);
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2068 = fma(_1948, _2038, _2028);
    float _2070 = fma(_1948, _2062, _2036);
    float _2072 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1710);
    float _2074 = _2060 + _2064;
    float _2076 = _1585 + _1587;
    float _2078 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2024);
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1617;
    out.gl_Position.z = _2072;
    out.gl_Position.w = _1587;
    float _2080 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2082 = _2072 + _1587;
    float _2084 = _2078 + _2068;
    float _2086 = _2080 + _2070;
    float _2088 = _2082 * 0.5;
    float _2090 = _2076 * 0.5;
    out.m_76.x = _2084;
    out.m_76.y = _2074;
    out.m_76.z = _2086;
    out.m_78.x = _2090;
    out.m_78.y = _2052;
    out.m_78.z = _2088;
    out.m_78.w = _1587;
    float _2092 = _1587;
    float _2094 = _2072;
    float _2096 = _2052;
    float _2098 = _2090;
    if (!_1980)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2092;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_1980)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_1980)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_1980)
    {
        _2098 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _2098;
    float _2120 = -_1603;
    float _2122 = _2120 + 1.0;
    float _2124 = _2122 * _2066;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2126;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2132 = _2130 * _2044;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2134;
    float _2136 = _1982 * _1635;
    float _2138 = -_1982;
    float _2140 = _2138 + 1.0;
    float _2142 = _1646 * _2136;
    float _2144 = _1656 * _2136;
    float _2146 = _1646 * _2140;
    float _2148 = _1261 * _1315;
    float _2150 = fma(_1652, _2142, _1640);
    float _2152 = fma(_1654, _2142, _1642);
    float _2154 = fma(_1646, _2144, _1644);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = _2142;
    float _2160 = _2148;
    float _2162 = _2118;
    float _2164 = _2118;
    if (!_1980)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _2158;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_1980)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2160;
    out.m_82.x = _2150;
    out.m_82.y = _2152;
    out.m_82.z = _2154;
    out.m_82.w = _2146;
    bool _2174 = !_1980;
    float _2176 = _2172;
    float _2178 = _2172;
    if (!_2174)
    {
        bool _2180 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2182 = isnan(_1339);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2188 = _2184 || _2186;
        if (!_2188)
        {
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2192 = _1339 + _2190;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = 1.0 / _2196;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2220 = _2192 * _2202;
            float _2222 = precise::clamp(_2220, 0.0, 1.0);
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2228 = fma(_2222, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2230 = fma(_2222, _2226, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2222, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2222, _2210, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2236 = fma(_2222, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2238 = fma(_2222, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2164 = _2232;
            _2170 = _2236;
            _2116 = _2228;
            _2110 = _2234;
            _2104 = _2230;
            _2178 = _2238;
            _2240 = true;
        }
        else
        {
            bool _2242 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2244 = isnan(_1339);
            bool _2246 = _2242 || _2244;
            bool _2248 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2250 = _2246 || _2248;
            if (!_2250)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2252 = _2114;
            _2116 = _2252;
            if (!_2250)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2254 = _2162;
            _2164 = _2254;
            if (!_2250)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2256 = _2102;
            _2104 = _2256;
            if (!_2250)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2258 = _2108;
            _2110 = _2258;
            if (!_2250)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2260 = _2168;
            _2170 = _2260;
            if (!_2250)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2262 = _2176;
            bool _2264 = !_2250;
            _2178 = _2262;
            if (!_2264)
            {
                bool _2266 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2268 = isnan(_1339);
                bool _2270 = _2266 || _2268;
                bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2274 = _2270 || _2272;
                if (!_2274)
                {
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2278 = _1339 + _2276;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = 1.0 / _2282;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2306 = _2278 * _2288;
                    float _2308 = precise::clamp(_2306, 0.0, 1.0);
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2164 = _2318;
                    _2170 = _2322;
                    _2116 = _2314;
                    _2110 = _2320;
                    _2104 = _2316;
                    _2178 = _2324;
                    _2240 = true;
                }
                else
                {
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2240 = false;
    float _2326 = _2164;
    float _2328 = _2170;
    float _2330 = _2116;
    float _2332 = _2110;
    float _2334 = _2104;
    float _2336 = _2178;
    float _2338 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2340 = fma(_2074, -0.5, 0.5);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = -_2326;
    float _2346 = _2344 + _2328;
    float _2348 = -_2330;
    float _2350 = _2348 + _2332;
    out.m_84.x = 0.0;
    float _2352 = fma(_2342, _2346, _2326);
    float _2354 = -_2334;
    float _2356 = _2354 + _2336;
    float _2358 = fma(_2342, _2350, _2330);
    float _2360 = _2352 * 0.586610972881317138671875;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2342, _2356, _2334);
    out.m_49.x = _2338;
    float _2366 = fma(_2358, 0.298911988735198974609375, _2360);
    bool _2368 = _1261 > 0.0;
    bool _2370 = isnan(_1261);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = fma(_2364, 0.114477999508380889892578125, _2366);
    bool _2380 = _1315 <= 0.0;
    bool _2382 = !_2376;
    bool _2384 = _2380 || _2382;
    float _2386 = -_2378;
    float _2388 = _2358 + _2386;
    float _2390 = -_2378;
    float _2392 = _2352 + _2390;
    float _2394 = -_2378;
    float _2396 = _2364 + _2394;
    float _2398 = fma(_2388, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2400 = fma(_2392, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    bool _2404 = !_2362;
    if (!_2404)
    {
        float _2406 = -_1197;
        float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2410 = -_1199;
        float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2414 = -_1201;
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2418 = _2408 * _2408;
        float _2420 = fma(_2412, _2412, _2418);
        float _2422 = fma(_2416, _2416, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = rsqrt(_2422);
        float _2428 = -_2424;
        float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2434 = precise::clamp(_2432, 0.0, 1.0);
        float _2436 = _2412 * _2426;
        float _2438 = _2408 * _2426;
        float _2440 = abs(_2434);
        float _2442 = log2(_2440);
        float _2444 = _2416 * _2426;
        float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2448 = _2074 * _2438;
        float _2450 = -_2438;
        float _2452 = -_2446;
        float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
        float _2456 = fma(_2084, _2436, _2448);
        float _2458 = -_2444;
        float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
        float _2462 = fma(_2086, _2444, _2456);
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2468 = _2460 + _2466;
        float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = exp2(_2470);
        float _2478 = _2476 * _2474;
        float _2480 = _2464 * _2478;
        float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2482;
        out.m_84.y = _2484;
        out.m_84.z = _2486;
    }
    out.m_86.x = _2398;
    out.m_86.y = _2400;
    out.m_86.z = _2402;
    if (!_2384)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2240 = false;
    bool _491 = false;
    bool _303 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2545 = as_type<float>(_121);
        out.gl_Position.z = _2545;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2614 = as_type<float>(_159);
        out.gl_Position.z = _2614;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    bool _215 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _217 = isnan(_209);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _223 = _219 || _221;
    float _225 = float(_223);
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _227;
    float _231 = -_225;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _237 = 1.0 / _229;
    float _239 = _213 * _237;
    bool _241 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_209);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _257;
    float _261 = _251 * _233;
    float _263 = fma(_255, _239, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _265 = fma(_259, _239, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _263 * _261;
    float _273 = _265 * _261;
    float _275 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _271);
    float _277 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _273);
    float _279 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].x, _275);
    float _281 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[144].y, _277);
    bool _283 = !_235;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_105);
        float _307 = 1.0 / _305;
        float _309 = _139 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_58.x;
    float _315 = in.m_58.y;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _319 = _317 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _325 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _327 = isnan(_311);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _319;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _343 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _345 = isnan(_311);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _355;
    float _359 = -_335;
    float _361 = _359 + 1.0;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _365 = 1.0 / _323;
    float _367 = _353 * _361;
    float _369 = -_353;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _377 = _281 * _315;
    bool _379 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _381 = isnan(_311);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = 1.0 / _341;
    float _393 = _357 * _337;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _397 = _311 + _395;
    float _399 = _389 * _371;
    float _401 = -_389;
    float _403 = _401 + 1.0;
    float _405 = fma(_393, _397, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _409 = _311 + _407;
    float _411 = _375 * _365;
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _425;
    float _429 = _405 * _399;
    float _431 = fma(_411, _409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _435 = _311 + _433;
    float _437 = -_423;
    float _439 = _437 + 1.0;
    float _441 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[115].x, _429);
    float _443 = _427 * _391;
    float _445 = _335 * _439;
    float _447 = fma(_431, _367, _441);
    float _449 = fma(_443, _435, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _451 = _279 * _313;
    float _453 = fma(_449, _445, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _461 = fma(_423, (*spvDescriptorSet0.vp_c9)._m0[118].x, _453);
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _461 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _471 = !_363;
    float _489;
    if (!_471)
    {
        float _473 = in.m_56.x;
        float _475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _477 = _473 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _479 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _481 = _479 * _475;
        float _483 = floor(_481);
        float _485 = -_483;
        float _487 = _481 + _485;
        _489 = _487;
        _491 = true;
    }
    else
    {
        float _493 = float(_105);
        float _495 = 1.0 / _493;
        float _497 = _139 * _495;
        _489 = _497;
    }
    _491 = false;
    float _499 = _489;
    float _501 = in.m_56.x;
    float _503 = in.m_56.y;
    float _505 = in.m_56.z;
    float _507 = in.m_56.w;
    float _509 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _521 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    bool _535 = !_529;
    int _537 = _535 ? 0 : 1;
    bool _539 = !_525;
    int _541 = _539 ? 0 : 1;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    int _553 = abs(_537);
    float _555 = _505 * 2.0;
    float _557 = _501 * 2.0;
    float _559 = _503 * 2.0;
    float _561 = float(_553);
    float _563 = -_519;
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[77].x, _563);
    float _567 = floor(_555);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = -_139;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[76].x, _565);
    float _575 = floor(_559);
    float _577 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _579 = log2(_577);
    bool _581 = _567 > 0.0;
    float _583 = _503 + _505;
    bool _585 = _567 >= 0.0;
    bool _587 = isnan(_567);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = _503 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _597 = _583 + (-1.0);
    float _599 = floor(_557);
    float _601 = fma(_595, -2.0, _569);
    int _603 = _593 ? 0 : 1;
    float _605 = _503 + _501;
    bool _607 = _575 >= 0.0;
    bool _609 = isnan(_575);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _619 = ~_603;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    float _625 = _605 + (-1.0);
    int _627 = _623;
    if (!_581)
    {
        int _629 = ~_603;
        int _631 = _629 + 1;
        _627 = _631;
    }
    int _633 = _627;
    float _635 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _601);
    bool _637 = _575 > 0.0;
    float _639 = _579 * _139;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _643 = in.m_62.x;
    float _645 = in.m_62.y;
    float _647 = in.m_62.z;
    bool _649 = _599 > 0.0;
    float _651 = exp2(_639);
    bool _653 = _599 >= 0.0;
    bool _655 = isnan(_599);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _665 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _667 = isnan(1.0);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _673 = _669 || _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _677 = 1.0 + _675;
    float _679 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[78].z, _663);
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _683 = float(_633);
    float _685 = 1.0 / _677;
    float _687 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _679);
    float _689 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[78].w, _681);
    int _691 = abs(_541);
    int _693 = _615 ? 0 : 1;
    float _695 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _689);
    int _697 = _661 ? 0 : 1;
    float _699 = -_651;
    float _701 = _699 + 1.0;
    float _703 = float(_691);
    int _705 = ~_697;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    int _711 = _709;
    if (!_649)
    {
        int _713 = ~_697;
        int _715 = _713 + 1;
        _711 = _715;
    }
    int _717 = _711;
    float _719 = _703 * _683;
    float _721 = _551 ? _701 : 0.0;
    float _723 = in.m_46.x;
    float _725 = in.m_46.y;
    float _727 = in.m_46.z;
    float _729 = float(_717);
    float _731 = _719 * (-2.0);
    int _733 = ~_693;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    int _739 = _737;
    if (_673)
    {
        float _741 = _721 * _685;
        _143 = _741;
    }
    float _743 = _143;
    if (!_637)
    {
        int _745 = ~_693;
        int _747 = _745 + 1;
        _739 = _747;
    }
    int _749 = _739;
    float _751 = _561 * _729;
    float _753 = in.m_64.x;
    float _755 = in.m_64.y;
    float _757 = in.m_64.z;
    float _759 = in.m_64.w;
    float _761 = _501 + (-0.5);
    float _763 = fma(_731, _643, _643);
    float _765 = fma(_641, _731, _641);
    float _767 = _751 * (-2.0);
    bool _769 = !_533;
    int _771 = _769 ? 0 : 1;
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    float _775 = _503 + (-0.5);
    float _777 = fma(_767, _645, _645);
    float _779 = in.m_66.x;
    float _781 = in.m_66.y;
    float _783 = in.m_66.z;
    float _785 = in.m_66.w;
    int _787 = abs(_771);
    float _789 = fma(_617, _767, _617);
    float _791 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[196].y, _777);
    float _793 = float(_749);
    float _795 = _505 + _501;
    float _797 = fma(_765, _743, _773);
    float _799 = fma(_789, _743, _791);
    float _801 = _795 + (-1.0);
    float _803 = float(_787);
    float _805 = _797 * 0.15915493667125701904296875;
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _811 = _803 * _793;
    float _813 = _725 * _755;
    float _815 = _805 * 6.283185482025146484375;
    float _817 = cos(_815);
    float _819 = _811 * (-2.0);
    float _821 = fma(_723, _753, _813);
    float _823 = fma(_809, _819, _809);
    float _825 = fma(_819, _647, _647);
    float _827 = _505 + (-0.5);
    float _829 = _725 * _781;
    float _831 = _725 * _513;
    float _833 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[196].z, _825);
    float _837 = fma(_723, _779, _829);
    float _839 = fma(_727, _757, _821);
    float _841 = _807 * 6.283185482025146484375;
    float _843 = sin(_841);
    float _845 = fma(_823, _743, _835);
    float _847 = fma(_727, _783, _837);
    float _849 = fma(_723, _511, _831);
    float _851 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _833);
    float _853 = _845 * 0.15915493667125701904296875;
    float _855 = _847 + _785;
    float _857 = _839 + _759;
    float _859 = _807 * 6.283185482025146484375;
    float _861 = cos(_859);
    float _863 = fma(_727, _515, _849);
    float _865 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _867 = _855 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _871 = _857 + _869;
    float _873 = _863 + _517;
    float _875 = _867 * _867;
    float _877 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _879 = _805 * 6.283185482025146484375;
    float _881 = sin(_879);
    float _883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _885 = fma(_871, _871, _875);
    float _887 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _889 = _873 + _887;
    float _891 = _521 * _877;
    float _893 = _509 * _883;
    float _895 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _851);
    float _897 = fma(_889, _889, _885);
    float _899 = _853 * 6.283185482025146484375;
    float _901 = cos(_899);
    float _903 = _817 * _861;
    float _905 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _907 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[10].x, _905);
    float _909 = _853 * 6.283185482025146484375;
    float _911 = sin(_909);
    float _913 = _881 * _843;
    float _915 = _881 * _861;
    float _917 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _919 = _917 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _921 = _881 * _901;
    float _923 = _817 * _843;
    float _925 = _817 * _901;
    float _927 = _861 * _901;
    float _929 = _843 * _901;
    float _931 = sqrt(_895);
    float _933 = _925 * _891;
    float _935 = fma(_911, _903, _913);
    float _937 = -_923;
    float _939 = fma(_911, _915, _937);
    float _941 = -_915;
    float _943 = fma(_911, _923, _941);
    float _945 = fma(_911, _913, _903);
    float _947 = -_891;
    float _949 = _911 * _947;
    float _951 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _953 = fma(_935, _893, _933);
    float _955 = _921 * _891;
    float _957 = sqrt(_897);
    float _959 = fma(_927, _893, _949);
    float _961 = fma(_943, _951, _953);
    float _963 = fma(_939, _893, _955);
    float _965 = fma(_929, _951, _959);
    float _967 = _961 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _969 = fma(_945, _951, _963);
    float _971 = _961 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _973 = _931 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[26].x, _967);
    float _977 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _971);
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[11].x, _977);
    bool _985 = _957 < _973;
    float _987 = float(_985);
    float _989 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[24].z, _979);
    float _991 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _993 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _983);
    float _995 = _989 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_991, _987, _873);
    float _999 = _993 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1001 = fma(_995, _987, _857);
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1005 = _997 + _1003;
    float _1007 = 1.0 / _999;
    float _1009 = _919 + _999;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1013 = _1001 + _1011;
    float _1015 = _1005 * _1005;
    float _1017 = _961 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_1013, _1013, _1015);
    float _1021 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = sqrt(_1019);
    float _1025 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    bool _1027 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.5);
    bool _1035 = _1031 || _1033;
    bool _1037 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    float _1047 = _1009 * _1007;
    float _1049 = _1047 * 0.5;
    float _1051 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1055 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1053);
    float _1057 = fma(_1051, _987, _855);
    float _1059 = 1.0 / _1055;
    bool _1061 = _1023 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1063 = _1007;
    float _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1067 = _1001;
    float _1069 = _1023;
    float _1071 = _1055;
    float _1073 = _847;
    float _1075 = _855;
    if (!_1061)
    {
        _1063 = _1001;
    }
    float _1077 = _1063;
    float _1079 = _1077;
    if (!_1061)
    {
        _1065 = _997;
    }
    float _1081 = _1065;
    float _1083 = _1081;
    if (!_1061)
    {
        _1067 = _1057;
    }
    float _1085 = _1067;
    bool _1087 = !_1061;
    float _1089 = _1085;
    if (!_1087)
    {
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1095 = _1023 + _1093;
        float _1097 = rsqrt(_1019);
        float _1099 = _1095 * _1091;
        float _1101 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = _1099 * 0.15915493667125701904296875;
        float _1105 = _1103 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1103 * 6.283185482025146484375;
        float _1111 = sin(_1109);
        float _1113 = _1107 + (-1.0);
        float _1115 = fma(_1111, _1101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1117 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1119 = _1097 * _1115;
        float _1121 = fma(_1057, _1107, _1117);
        float _1123 = fma(_1013, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1125 = fma(_1005, _1119, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1079 = _1123;
        _1083 = _1125;
        _1089 = _1121;
        _1069 = _1103;
    }
    float _1127 = _1079;
    float _1129 = _1083;
    float _1131 = _1089;
    float _1133 = _1069;
    float _1135 = _1131;
    float _1137 = _1127;
    float _1139 = _1129;
    float _1141 = _1133;
    if (_1035)
    {
        _1071 = 1.0;
    }
    float _1143 = _1071;
    float _1145 = _1143;
    if (!_1045)
    {
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1149 = _855 + _1147;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1153 = _857 + _1151;
        float _1155 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1157 = -_857;
        float _1159 = _1157 + _1127;
        float _1161 = _1149 * _1149;
        float _1163 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1165 = _873 + _1163;
        float _1167 = -_873;
        float _1169 = _1167 + _1129;
        float _1171 = fma(_1153, _1153, _1161);
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1175 = fma(_1165, _1165, _1171);
        float _1177 = sqrt(_1175);
        float _1179 = _1155 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1181 = -_855;
        float _1183 = _1181 + _1131;
        float _1185 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1187 = _1185 * _1173;
        float _1189 = _1179 * _1187;
        float _1191 = fma(_1183, _1189, _855);
        float _1193 = fma(_1159, _1189, _857);
        float _1195 = fma(_1169, _1189, _873);
        _1135 = _1191;
        _1137 = _1193;
        _1139 = _1195;
    }
    float _1197 = _1135;
    float _1199 = _1137;
    float _1201 = _1139;
    if (_1035)
    {
        _1073 = 1.0;
    }
    float _1203 = _1073;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1059 * _1205;
    float _1209 = _1203;
    if (!_1035)
    {
        float _1211 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1215 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1213;
        float _1217 = _1211 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        float _1223 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1221;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1215;
        float _1247 = 1.0 / _1243;
        float _1249 = _1241 * _1247;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = fma(_1207, _1249, _1251);
        float _1255 = _1253 * _1245;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        _1141 = _1225;
        _1145 = _1257;
    }
    float _1259 = _1141;
    float _1261 = _1145;
    if (!_1035)
    {
        float _1263 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1265 = _1263 * 0.15915493667125701904296875;
        float _1267 = _1265 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1273 = _1271 * 0.15915493667125701904296875;
        float _1275 = _1265 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = 1.0 / _1269;
        float _1281 = _1273 * 6.283185482025146484375;
        float _1283 = cos(_1281);
        float _1285 = _1277 * _1279;
        float _1287 = _1273 * 6.283185482025146484375;
        float _1289 = sin(_1287);
        float _1291 = _1283 * _1285;
        float _1293 = 1.0 / _1291;
        float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1297 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1295;
        float _1299 = 1.0 / _1297;
        float _1301 = _1289 * _1293;
        float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1305 = fma(_1207, _1301, _1303);
        float _1307 = _1305 * _1299;
        float _1309 = precise::clamp(_1307, 0.0, 1.0);
        float _1311 = -_1309;
        float _1313 = _1311 + 1.0;
        _1209 = _1313;
    }
    float _1315 = _1209;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1197 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1199 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1327 = _1201 + _1325;
    float _1329 = _1319 * _1319;
    float _1331 = fma(_1323, _1323, _1329);
    float _1333 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1335 = fma(_1327, _1327, _1331);
    float _1337 = rsqrt(_1335);
    float _1339 = sqrt(_1335);
    float _1341 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1343 = _1323 * _1341;
    float _1345 = _1327 * _1341;
    float _1347 = _1343 * _1343;
    float _1349 = _1345 * _1345;
    float _1351 = _1347 + _1349;
    float _1353 = sqrt(_1351);
    bool _1355 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1357 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1353 + _1357;
    float _1361 = _1259;
    float _1363 = _1351;
    float _1365 = _1359;
    float _1367 = _1343;
    float _1369 = _1345;
    float _1371 = _1347;
    if (_1355)
    {
        float _1373 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1373;
    }
    float _1375 = _1361;
    if (_1355)
    {
        float _1377 = rsqrt(_1351);
        _1363 = _1377;
    }
    float _1379 = _1363;
    if (_1355)
    {
        float _1381 = _1359 * _1375;
        _1365 = _1381;
    }
    float _1383 = _1365;
    if (_1355)
    {
        float _1385 = _1383 * 0.15915493667125701904296875;
        _1075 = _1385;
    }
    float _1387 = _1075;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = _1057;
    float _1393 = _1389;
    if (_1355)
    {
        float _1395 = _1387 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        _1391 = _1397;
    }
    float _1399 = _1391;
    float _1401 = precise::max(0.0, _1389);
    float _1403 = _1383;
    float _1405 = _1401;
    if (_1355)
    {
        float _1407 = _1387 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        _1403 = _1409;
    }
    float _1411 = _1403;
    float _1413 = -_1341;
    float _1415 = -_1401;
    float _1417 = fma(_1319, _1413, _1415);
    float _1419 = _1417;
    if (_1355)
    {
        float _1421 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1405 = _1421;
    }
    float _1423 = _1405;
    float _1425 = _1399;
    if (_1355)
    {
        float _1427 = fma(_1399, _1423, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1433 = _1429;
    if (_1355)
    {
        float _1435 = _1379 * _1429;
        _1433 = _1435;
    }
    float _1437 = _1433;
    float _1439 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1431);
    float _1441 = _1411;
    if (_1355)
    {
        float _1443 = _1411 + (-1.0);
        _1393 = _1443;
    }
    float _1445 = _1393;
    float _1447 = _1445;
    if (_1355)
    {
        float _1449 = _1343 * _1437;
        _1367 = _1449;
    }
    float _1451 = _1367;
    if (_1355)
    {
        float _1453 = _1345 * _1437;
        _1369 = _1453;
    }
    float _1455 = _1369;
    float _1457 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1355)
    {
        float _1459 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1447 = _1459;
    }
    float _1461 = _1447;
    if (_1355)
    {
        float _1463 = _1451 * _1451;
        _1371 = _1463;
    }
    float _1465 = _1371;
    float _1467 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1439);
    float _1469 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1355)
    {
        float _1471 = fma(_1417, _1411, _1461);
        _1419 = _1471;
    }
    float _1473 = _1419;
    if (!_1355)
    {
        _1441 = _1349;
    }
    float _1475 = _1441;
    float _1477 = _1475;
    if (_1355)
    {
        float _1479 = _1455 * _1455;
        _1477 = _1479;
    }
    float _1481 = _1477;
    float _1483 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1485 = fma(_1473, _1473, _1465);
    float _1487 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1489 = floor(_1333);
    float _1491 = _1467 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1493 = _1485 + _1481;
    float _1495 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1487);
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1499 = fma(_1339, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1497);
    float _1501 = precise::clamp(_1499, 0.0, 1.0);
    float _1503 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1495);
    float _1505 = rsqrt(_1493);
    float _1507 = -_1501;
    float _1509 = _1507 + 1.0;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1515 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1517 = abs(_1509);
    float _1519 = log2(_1517);
    float _1521 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1523 = fma(_873, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1525 = -_1515;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1531 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1521);
    float _1533 = -_1489;
    float _1535 = _1333 + _1533;
    float _1537 = _1505 * _1451;
    float _1539 = _1505 * _1473;
    float _1541 = _1505 * _1455;
    float _1543 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = floor(_1523);
    float _1551 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1553 = -_1545;
    float _1555 = fma(_1539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1553);
    float _1557 = _1543 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1559 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1561 = -_1541;
    float _1563 = fma(_1561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1555);
    float _1565 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1567 = log2(_1527);
    float _1569 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1551);
    float _1571 = fma(_1563, -0.5, 0.5);
    float _1573 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1569);
    float _1575 = exp2(_1559);
    float _1577 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1579 = -_1549;
    float _1581 = _1523 + _1579;
    float _1583 = _1539 + 1.0;
    float _1585 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1587 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1577);
    float _1589 = fma(_1563, 0.5, 0.5);
    float _1591 = sqrt(_1571);
    float _1593 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1595 = fma(_1589, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1597 = _1567 * 0.693147182464599609375;
    float _1599 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1593);
    float _1601 = fma(_1589, _1595, -0.212114393711090087890625);
    float2 _4836 = float2(_1535, _1581);
    float _1603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4836, float2(0.0), isnan(_4836)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4836, float2(0.0), isnan(_4836)), level(0.0)).x;
    float _1605 = 1.0 / _1587;
    float _1607 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1599);
    float _1609 = -_1539;
    float _1611 = fma(_1575, _1583, _1609);
    float _1613 = fma(_1589, _1601, 1.570728778839111328125);
    float _1615 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1617 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1607);
    float _1619 = fma(_1611, 0.5, 0.5);
    float _1621 = _1591 * 0.636619746685028076171875;
    float _1623 = _1585 * _1605;
    float _1625 = _1617 * _1605;
    float _1627 = -_1613;
    float _1629 = fma(_1621, _1627, 1.0);
    float _1631 = fma(_1623, 0.5, 0.5);
    float _1633 = fma(_1625, -0.5, 0.5);
    float3 _4893 = float3(_1631, _1633, _1615);
    float _1635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4893, float3(0.0), isnan(_4893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4893, float3(0.0), isnan(_4893)), level(0.0)).x;
    float3 _4904 = float3(_1631, _1633, _1615);
    float4 _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4904, float3(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4904, float3(0.0), isnan(_4904)), level(0.0)).xyzw;
    float _1640 = _1638.x;
    float _1642 = _1638.y;
    float _1644 = _1638.z;
    float _1646 = _1638.w;
    float2 _4920 = float2(_1629, _1619);
    float3 _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4920, float2(0.0), isnan(_4920)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4920, float2(0.0), isnan(_4920)), level(0.0)).xyz;
    float _1652 = _1650.x;
    float _1654 = _1650.y;
    float _1656 = _1650.z;
    out.m_68.x = _463;
    out.m_68.y = _465;
    out.m_68.z = _467;
    out.m_68.w = _469;
    float _1658 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1664 = _507 > 0.5;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1670 = _501 > 0.5;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _1672 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1676 = _503 > 0.5;
    float _1678 = 1.0 / _1662;
    float _1680 = _1529 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1682 = 1.0 / _1668;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1684;
    float _1688 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1680);
    float _1690 = -_175;
    int _1692 = _1670 ? as_type<int>(_1690) : as_type<int>(_175);
    bool _1694 = _505 > 0.5;
    float _1696 = 1.0 / _1674;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1702;
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1708 = _1706 != 0;
    float _1710 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1688);
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1714 = _1712 != 0;
    float _1716 = _1700 * _1678;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1720 = _1718 != 0;
    float _1722 = _1704 * _1682;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1726 = _1724 != 0;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1730 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1732 = isnan(_499);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    bool _1742 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1744 = isnan(_499);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    bool _1754 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1756 = isnan(_499);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = _1686 * _1696;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1774 = _499 + _1772;
    float _1776 = -_1752;
    float _1778 = _1776 + 1.0;
    float _1780 = _1752 * _1768;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1784 = _499 + _1782;
    float _1786 = fma(_1770, _1774, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1788 = _1764 * _1778;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1792 = -_1764;
    float _1794 = _1792 + 1.0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1798 = _499 + _1796;
    float _1800 = fma(_1716, _1784, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1802 = -_179;
    int _1804 = _1676 ? as_type<int>(_1802) : as_type<int>(_179);
    float _1806 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1808 = _499 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1810 = isnan(_499);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1722, _1798, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _1822 = !_1714;
    float _1824 = _1822 ? _179 : as_type<float>(_1804);
    float _1826 = exp2(_1658);
    bool _1828 = !_1708;
    float _1830 = _1828 ? _175 : as_type<float>(_1692);
    float _1832 = _1818 * _1794;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1824 + (-0.5);
    float _1840 = _1786 * _1832;
    float _1842 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = -_1806;
    float _1846 = -_635;
    float _1848 = fma(_1844, _1838, _1846);
    float _1850 = _1830 + 0.5;
    float _1852 = -_179;
    int _1854 = _1664 ? as_type<int>(_1852) : as_type<int>(_179);
    float _1856 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1840);
    float _1858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1860 = fma(_1842, _1850, _573);
    bool _1862 = !_1726;
    float _1864 = _1862 ? _179 : as_type<float>(_1854);
    float _1866 = _973 + (-10.0);
    float _1868 = fma(_1800, _1788, _1856);
    float _1870 = -_687;
    float _1872 = _1870 + 1.0;
    float _1874 = -_695;
    float _1876 = _1874 + 1.0;
    float _1878 = -_1864;
    float _1880 = _1878 + 0.5;
    float _1882 = abs(_1207);
    float _1884 = log2(_1882);
    float _1886 = precise::max(_957, _1866);
    float _1888 = fma(_1824, _1876, _1848);
    float _1890 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1892 = -_175;
    int _1894 = _1694 ? as_type<int>(_1892) : as_type<int>(_175);
    float _1896 = fma(_1820, _1780, _1868);
    float _1898 = precise::min(_973, _1886);
    float _1900 = -_1872;
    float _1902 = fma(_1830, _1900, _1860);
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1906 = _1890 * _1858;
    bool _1908 = !_1720;
    float _1910 = _1908 ? _175 : as_type<float>(_1894);
    float _1912 = -_1866;
    float _1914 = _1912 + _1898;
    float _1916 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1896);
    float _1918 = _1910 + 0.5;
    float _1920 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1922 = fma(_1914, -0.100000001490116119384765625, 1.0);
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1926 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1928 = exp2(_1920);
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1936 = _1924 * _1904;
    float _1938 = _1926 * _1922;
    float _1940 = _1930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _1902;
    out.m_70.y = _1888;
    out.m_70.z = _1936;
    out.m_70.w = _1906;
    float _1946 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1948 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_72.x = _1940;
    out.m_72.y = _1942;
    out.m_72.z = _1944;
    out.m_72.w = _1938;
    bool _1950 = _1207 <= 8000.0;
    bool _1952 = isnan(_1207);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan(8000.0);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1826;
    float _1964 = _1962 + 1.0;
    float _1966 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1968 = precise::clamp(_1966, 0.0, 1.0);
    float _1970 = _1587 * 0.5;
    bool _1972 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1974 = isnan(_1339);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1980 = _1976 || _1978;
    float _1982 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1984 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1986 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1988 = _943 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1990 = -_911;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1984);
    float _1994 = -_911;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1986);
    float _1998 = -_911;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1946);
    float _2002 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1988);
    float _2004 = _935 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2006 = _943 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2008 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1992);
    float _2010 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1996);
    float _2012 = fma(_1968, -2.0, 3.0);
    float _2014 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2004);
    float _2016 = _1968 * _1968;
    float _2018 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2020 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2000);
    float _2022 = _943 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2024 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2006);
    float _2026 = _2016 * _2012;
    float _2028 = _2018 * _2008;
    float _2030 = _935 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2032 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2022);
    float _2034 = _2018 * _2010;
    float _2036 = _2018 * _2020;
    float _2038 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2014);
    float _2040 = -_2026;
    float _2042 = _2040 + 1.0;
    float _2044 = in.m_74.x;
    float _2046 = _935 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2030);
    float _2050 = fma(_2042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2026);
    float _2052 = fma(_1617, -0.5, _1970);
    float _2054 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2056 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2048);
    float _2058 = _1960 * _2050;
    float _2060 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2062 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = fma(_1948, _2056, _2034);
    float _2066 = _2058 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2068 = fma(_1948, _2038, _2028);
    float _2070 = fma(_1948, _2062, _2036);
    float _2072 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1710);
    float _2074 = _2060 + _2064;
    float _2076 = _1585 + _1587;
    float _2078 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2024);
    out.gl_Position.x = _1585;
    out.gl_Position.y = _1617;
    out.gl_Position.z = _2072;
    out.gl_Position.w = _1587;
    float _2080 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2032);
    float _2082 = _2072 + _1587;
    float _2084 = _2078 + _2068;
    float _2086 = _2080 + _2070;
    float _2088 = _2082 * 0.5;
    float _2090 = _2076 * 0.5;
    out.m_76.x = _2084;
    out.m_76.y = _2074;
    out.m_76.z = _2086;
    out.m_78.x = _2090;
    out.m_78.y = _2052;
    out.m_78.z = _2088;
    out.m_78.w = _1587;
    float _2092 = _1587;
    float _2094 = _2072;
    float _2096 = _2052;
    float _2098 = _2090;
    if (!_1980)
    {
        _2092 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2100 = _2092;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_1980)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2106 = _2094;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_1980)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_1980)
    {
        _2098 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2118 = _2098;
    float _2120 = -_1603;
    float _2122 = _2120 + 1.0;
    float _2124 = _2122 * _2066;
    float _2126 = precise::clamp(_2124, 0.0, 1.0);
    float _2128 = -_2126;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2132 = _2130 * _2044;
    float _2134 = _2132 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2134;
    float _2136 = _1982 * _1635;
    float _2138 = -_1982;
    float _2140 = _2138 + 1.0;
    float _2142 = _1646 * _2136;
    float _2144 = _1656 * _2136;
    float _2146 = _1646 * _2140;
    float _2148 = _1261 * _1315;
    float _2150 = fma(_1652, _2142, _1640);
    float _2152 = fma(_1654, _2142, _1642);
    float _2154 = fma(_1646, _2144, _1644);
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = _2142;
    float _2160 = _2148;
    float _2162 = _2118;
    float _2164 = _2118;
    if (!_1980)
    {
        _2158 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2166 = _2158;
    float _2168 = _2166;
    float _2170 = _2166;
    if (!_1980)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2172 = _2160;
    out.m_82.x = _2150;
    out.m_82.y = _2152;
    out.m_82.z = _2154;
    out.m_82.w = _2146;
    bool _2174 = !_1980;
    float _2176 = _2172;
    float _2178 = _2172;
    if (!_2174)
    {
        bool _2180 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2182 = isnan(_1339);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2188 = _2184 || _2186;
        if (!_2188)
        {
            float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2192 = _1339 + _2190;
            float _2194 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2196 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2194;
            float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2200 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2202 = 1.0 / _2196;
            float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2206 = _2204 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2220 = _2192 * _2202;
            float _2222 = precise::clamp(_2220, 0.0, 1.0);
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2228 = fma(_2222, _2200, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2230 = fma(_2222, _2226, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2232 = fma(_2222, _2206, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2234 = fma(_2222, _2210, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2236 = fma(_2222, _2214, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2238 = fma(_2222, _2218, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2164 = _2232;
            _2170 = _2236;
            _2116 = _2228;
            _2110 = _2234;
            _2104 = _2230;
            _2178 = _2238;
            _2240 = true;
        }
        else
        {
            bool _2242 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2244 = isnan(_1339);
            bool _2246 = _2242 || _2244;
            bool _2248 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2250 = _2246 || _2248;
            if (!_2250)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2252 = _2114;
            _2116 = _2252;
            if (!_2250)
            {
                _2162 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2254 = _2162;
            _2164 = _2254;
            if (!_2250)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2256 = _2102;
            _2104 = _2256;
            if (!_2250)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2258 = _2108;
            _2110 = _2258;
            if (!_2250)
            {
                _2168 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2260 = _2168;
            _2170 = _2260;
            if (!_2250)
            {
                _2176 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2262 = _2176;
            bool _2264 = !_2250;
            _2178 = _2262;
            if (!_2264)
            {
                bool _2266 = _1339 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2268 = isnan(_1339);
                bool _2270 = _2266 || _2268;
                bool _2272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2274 = _2270 || _2272;
                if (!_2274)
                {
                    float _2276 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2278 = _1339 + _2276;
                    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2282 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2280;
                    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2288 = 1.0 / _2282;
                    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2300 = _2298 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2306 = _2278 * _2288;
                    float _2308 = precise::clamp(_2306, 0.0, 1.0);
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2314 = fma(_2308, _2286, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2316 = fma(_2308, _2312, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2318 = fma(_2308, _2292, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2320 = fma(_2308, _2296, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2322 = fma(_2308, _2300, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2324 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2164 = _2318;
                    _2170 = _2322;
                    _2116 = _2314;
                    _2110 = _2320;
                    _2104 = _2316;
                    _2178 = _2324;
                    _2240 = true;
                }
                else
                {
                    _2164 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2170 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2178 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2240 = false;
    float _2326 = _2164;
    float _2328 = _2170;
    float _2330 = _2116;
    float _2332 = _2110;
    float _2334 = _2104;
    float _2336 = _2178;
    float _2338 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2340 = fma(_2074, -0.5, 0.5);
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = -_2326;
    float _2346 = _2344 + _2328;
    float _2348 = -_2330;
    float _2350 = _2348 + _2332;
    out.m_84.x = 0.0;
    float _2352 = fma(_2342, _2346, _2326);
    float _2354 = -_2334;
    float _2356 = _2354 + _2336;
    float _2358 = fma(_2342, _2350, _2330);
    float _2360 = _2352 * 0.586610972881317138671875;
    bool _2362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2364 = fma(_2342, _2356, _2334);
    out.m_49.x = _2338;
    float _2366 = fma(_2358, 0.298911988735198974609375, _2360);
    bool _2368 = _1261 > 0.0;
    bool _2370 = isnan(_1261);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = fma(_2364, 0.114477999508380889892578125, _2366);
    bool _2380 = _1315 <= 0.0;
    bool _2382 = !_2376;
    bool _2384 = _2380 || _2382;
    float _2386 = -_2378;
    float _2388 = _2358 + _2386;
    float _2390 = -_2378;
    float _2392 = _2352 + _2390;
    float _2394 = -_2378;
    float _2396 = _2364 + _2394;
    float _2398 = fma(_2388, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2400 = fma(_2392, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    float _2402 = fma(_2396, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2378);
    bool _2404 = !_2362;
    if (!_2404)
    {
        float _2406 = -_1197;
        float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2410 = -_1199;
        float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2414 = -_1201;
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2418 = _2408 * _2408;
        float _2420 = fma(_2412, _2412, _2418);
        float _2422 = fma(_2416, _2416, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = rsqrt(_2422);
        float _2428 = -_2424;
        float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2432 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2434 = precise::clamp(_2432, 0.0, 1.0);
        float _2436 = _2412 * _2426;
        float _2438 = _2408 * _2426;
        float _2440 = abs(_2434);
        float _2442 = log2(_2440);
        float _2444 = _2416 * _2426;
        float _2446 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2448 = _2074 * _2438;
        float _2450 = -_2438;
        float _2452 = -_2446;
        float _2454 = fma(_2450, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2452);
        float _2456 = fma(_2084, _2436, _2448);
        float _2458 = -_2444;
        float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2454);
        float _2462 = fma(_2086, _2444, _2456);
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2468 = _2460 + _2466;
        float _2470 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2472 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2474 = precise::clamp(_2472, 0.0, 1.0);
        float _2476 = exp2(_2470);
        float _2478 = _2476 * _2474;
        float _2480 = _2464 * _2478;
        float _2482 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2482;
        out.m_84.y = _2484;
        out.m_84.z = _2486;
    }
    out.m_86.x = _2398;
    out.m_86.y = _2400;
    out.m_86.z = _2402;
    if (!_2384)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2488 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2488;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

