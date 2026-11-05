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
    float4 m_57 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2236 = false;
    bool _673 = false;
    bool _427 = false;
    bool _281 = false;
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
        float _2904 = as_type<float>(_105);
        out.gl_Position.z = _2904;
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
        out.m_47.x = 0.0;
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
        float _2973 = as_type<float>(_143);
        out.gl_Position.z = _2973;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _149 * _147;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = _163 * 6.283185482025146484375;
    float _167 = floor(_163);
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    int _199 = abs(_187);
    bool _201 = !_159;
    int _203 = _201 ? 0 : 1;
    float _205 = -_167;
    float _207 = _163 + _205;
    bool _209 = !_175;
    int _211 = _209 ? 0 : 1;
    int _213 = abs(_203);
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_199);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _223 = abs(_211);
    float _225 = fma(_195, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _219 * _227;
    bool _231 = _207 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _249 = fma(_239, _237, _229);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _253 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _255 = abs(_243);
    float _257 = fma(_245, _255, _249);
    bool _259 = !_221;
    float _261 = _247;
    float _263 = _253;
    float _279;
    if (!_259)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_89);
        float _285 = 1.0 / _283;
        float _287 = _123 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    bool _307 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_289);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _321;
    bool _333 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_289);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _353 = _343 * _349;
    float _355 = 1.0 / _325;
    float _357 = -_343;
    float _359 = _357 + 1.0;
    float _361 = _293 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _289 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_369, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _379 = _365 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _375 * _353;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _377 * _353;
    float _393 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _397 = fma(_389, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = fma(_393, _345, _395);
    float _403 = fma(_397, _345, _399);
    float _405 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    bool _409 = !_351;
    float _425;
    if (!_409)
    {
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_89);
        float _431 = 1.0 / _429;
        float _433 = _123 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = _435 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _435 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _457;
    float _461 = 1.0 / _451;
    bool _463 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_435);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _459;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = 1.0 / _455;
    float _481 = _439 * _461;
    bool _483 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _485 = isnan(_435);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _495;
    float _499 = fma(_497, _481, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _501 = _443 * _475;
    bool _503 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _505 = isnan(_435);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_513;
    float _521 = _519 + 1.0;
    float _523 = _513 * _517;
    float _525 = _447 * _479;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = _473 * _521;
    float _541 = fma(_529, _481, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_533, _481, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _545 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _547 = isnan(_435);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_473;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _569 = fma(_537, _525, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = _555 * _559;
    float _573 = fma(_563, _525, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _575 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _577 = _499 * _571;
    float _579 = _541 * _571;
    float _581 = -_555;
    float _583 = _581 + 1.0;
    float _585 = _543 * _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _591;
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].x, _577);
    float _597 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].y, _579);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _605 = fma(_589, _501, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _607 = fma(_573, _539, _595);
    float _609 = fma(_593, _501, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _611 = fma(_601, _501, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _613 = fma(_569, _539, _597);
    float _615 = fma(_575, _539, _603);
    float _617 = fma(_605, _523, _607);
    float _619 = in.m_55.x;
    float _621 = in.m_55.y;
    float _623 = fma(_609, _523, _613);
    float _625 = fma(_611, _523, _615);
    float _627 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].x, _617);
    float _629 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].y, _623);
    float _631 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].z, _625);
    float _633 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _641;
    out.m_57.y = _643;
    out.m_57.z = _645;
    out.m_57.w = _639;
    float _647 = _407 * _621;
    float _649 = _405 * _619;
    bool _651 = !_477;
    float _669;
    float _671;
    if (!_651)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _659 = _657 * _653;
        float _661 = float(_89);
        float _663 = floor(_659);
        float _665 = -_663;
        float _667 = _659 + _665;
        _669 = _667;
        _671 = _661;
        _673 = true;
    }
    else
    {
        float _675 = float(_89);
        float _677 = 1.0 / _675;
        float _679 = _123 * _677;
        _669 = _679;
        _671 = _675;
    }
    _673 = false;
    float _681 = _669;
    float _683 = _671;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_51.y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = _681 + _695;
    float _699 = as_type<float>(int(gl_VertexIndex));
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _707 = in.m_51.z;
    float _709 = 1.0 / _683;
    float _711 = float(_687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _717;
    float _721 = 1.0 / _711;
    float _723 = float(uint(_703));
    float _725 = _689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _727 = ~_703;
    int _729 = _727 + 1;
    int _731 = ~_703;
    int _733 = _731 + 1;
    float _735 = fma(_725, -2.0, _705);
    bool _737 = _703 == 0;
    float _739 = 1.0 / _723;
    float _741 = _145 + _707;
    float _743 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _735);
    float _745 = _741 + (-1.0);
    float _747 = _721 * _123;
    float _749 = trunc(_747);
    int _751 = int(_749);
    int _753 = as_type<int>(_739) + (-2);
    float _755 = float(uint(_751));
    float _757 = as_type<float>(_753) * _755;
    float _759 = trunc(_757);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = float(_703);
    int _768 = _729 * int(_764);
    int _770 = _768 + _751;
    float _772 = float(uint(_770));
    float _774 = as_type<float>(_753) * _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = trunc(_774);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    bool _786 = !_778;
    float _788 = _786 ? 7.345489978790283203125 : 1.0;
    float _790 = _788 * _145;
    float _792 = floor(_790);
    int _794 = int(_764) + int(_784);
    float _796 = float(_751);
    int _798 = _733 * _794;
    int _800 = _798 + _751;
    bool _802 = _796 >= _766;
    bool _804 = isnan(_796);
    bool _806 = _802 || _804;
    bool _808 = isnan(_766);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    bool _814 = uint(_800) >= uint(_703);
    float _816 = trunc(_812);
    int _818 = int(_816);
    float _820 = -_792;
    float _822 = _790 + _820;
    bool _824 = !_814;
    int _826 = _824 ? 0 : (-1);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    int _840 = ~_794;
    int _842 = _840 + _826;
    int _844 = _842 + 1;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _848 = _846 != 0;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = _703 * _844;
    int _856 = _854 + _751;
    bool _858 = !_737;
    int _860 = _858 ? _856 : (-1);
    float _862 = _822 * _766;
    int _864 = ~_818;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = _766 * _123;
    bool _872 = !_848;
    int _874 = _872 ? 0 : 1;
    float _876 = trunc(_862);
    int _878 = int(_876);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    int _884 = _860 * _868;
    float _886 = _870 * _709;
    int _888 = _703 + (-1);
    int _890 = abs(_874);
    int _892 = _818 * _888;
    int _894 = _892 + _884;
    float _896 = trunc(_886);
    int _898 = int(_896);
    bool _900 = !_834;
    int _902 = _900 ? 0 : 1;
    int _904 = abs(_852);
    int _906 = abs(_902);
    int _908 = _878 * _890;
    int _910 = _908 + _751;
    bool _912 = !_838;
    int _914 = _912 ? 0 : 1;
    bool _916 = !_882;
    int _918 = _916 ? 0 : 1;
    int _920 = _894 * _906;
    int _922 = abs(_914);
    int _924 = abs(_918);
    int _926 = _898 * _904;
    int _928 = _926 + _920;
    int _930 = ~_703;
    int _932 = _930 + 1;
    int _934 = _910 * _922;
    int _936 = _934 + _928;
    float _938 = float(uint(_910));
    int _940 = _878 * _924;
    int _942 = _940 + _936;
    float _944 = as_type<float>(_753) * _938;
    float _946 = float(uint(_942));
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = trunc(_944);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    float _956 = as_type<float>(_753) * _946;
    float _958 = trunc(_956);
    float _960 = precise::max(_958, 0.0);
    uint _962 = uint(_960);
    int _964 = ~_703;
    int _966 = _964 + 1;
    int _968 = _932 * int(_962);
    int _970 = _968 + _942;
    float _972 = float(uint(_970));
    float _974 = as_type<float>(_753) * _972;
    float _976 = trunc(_974);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = int(_962) + int(_980);
    int _984 = _966 * _982;
    int _986 = _984 + _942;
    float _988 = _145 * 2.0;
    bool _990 = uint(_986) >= uint(_703);
    int _992 = ~_703;
    int _994 = _992 + 1;
    float _996 = floor(_988);
    bool _998 = !_990;
    int _1000 = _998 ? 0 : (-1);
    int _1002 = _994 * int(_954);
    int _1004 = _1002 + _910;
    int _1006 = ~_982;
    int _1008 = _1006 + _1000;
    int _1010 = _1008 + 1;
    float _1012 = _689 * 2.0;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = float(uint(_1004));
    int _1020 = _703 * _1010;
    int _1022 = _1020 + _942;
    float _1024 = as_type<float>(_753) * _1018;
    bool _1026 = !_737;
    int _1028 = _1026 ? _1022 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _996 > 0.0;
    int _1034 = _1028 & 3;
    bool _1036 = _1034 != 0;
    int _1038 = _1028 & 3;
    bool _1040 = _1038 != 0;
    int _1042 = _1036 ? 0 : 1;
    float _1044 = _1016 * _123;
    bool _1046 = uint(_1038) > 1u;
    float _1048 = trunc(_1024);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = _1038 != 3;
    bool _1056 = _996 >= 0.0;
    bool _1058 = isnan(_996);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    bool _1066 = uint(_1038) >= 2u;
    int _1068 = _1064 ? 0 : 1;
    float _1070 = exp2(_1044);
    int _1072 = _1066 ? 0 : 1;
    bool _1074 = _1030 >= 0.0;
    bool _1076 = isnan(_1030);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    bool _1084 = _1030 > 0.0;
    int _1086 = ~_1042;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1082 ? 0 : 1;
    int _1100 = _1090;
    int _1102 = _1096;
    if (!_1046)
    {
        int _1104 = ~_1042;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    if (_1054)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1102 = _1112;
    }
    int _1114 = _1102;
    float _1116 = -_1070;
    float _1118 = _1116 + 1.0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_44.x;
    float _1134 = in.m_44.y;
    float _1136 = in.m_44.z;
    int _1138 = ~_1068;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    int _1144 = _1142;
    if (!_1032)
    {
        int _1146 = ~_1068;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    int _1152 = int(_954) + int(_1052);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1156 = _1154 != 0;
    int _1158 = ~_703;
    int _1160 = _1158 + 1;
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _1160 * _1152;
    int _1168 = _1166 + _910;
    bool _1170 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1178 = _1174 || _1176;
    int _1180 = ~_1098;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (!_1084)
    {
        int _1188 = ~_1098;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1194;
    float _1198 = _1178 ? _1118 : 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = uint(_1168) >= uint(_703);
    float _1206 = 1.0 / _1196;
    float _1208 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1212 = !_1204;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1218 = as_type<int>(_699) & 1;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>(_699) & 2;
    bool _1224 = _1222 != 0;
    float _1226 = _707 * 2.0;
    bool _1228 = !_1126;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = 1.0 / _1202;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1234;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1240 = -_948;
    float _1242 = fma(_1216, 2.0, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1246 = _681 + _1244;
    bool _1248 = !_1130;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1238);
    float _1254 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    float _1256 = 1.0 / _1236;
    float _1258 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1260 = _145 + _689;
    float _1262 = _697 * _1206;
    float _1264 = _1260 + (-1.0);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1266;
    float _1270 = floor(_1226);
    float _1272 = _693 * _1232;
    float _1274 = _689 + _707;
    float _1276 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _1274 + (-1.0);
    int _1280 = abs(_1250);
    float _1282 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = _1246 * _1256;
    bool _1286 = !_1122;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1292;
    float _1296 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1254);
    float _1298 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    bool _1300 = _1270 >= 0.0;
    bool _1302 = isnan(_1270);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1316 = _1308 ? 0 : 1;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1322 = _1270 > 0.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = fma(_1320, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1334 = ~_1316;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1326, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1342 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = fma(_1314, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1346;
    int _1350 = _1028 >> 31;
    float _1352 = fma(_1330, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1354 = fma(_715, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = fma(_1348, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1358 = _1350 & 3;
    float _1360 = fma(_719, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1362 = _1338;
    if (!_1322)
    {
        int _1364 = ~_1316;
        int _1366 = _1364 + 1;
        _1362 = _1366;
    }
    int _1368 = _1362;
    float _1370 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1258);
    float _1372 = -_123;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    int _1376 = _1028 + _1358;
    float _1378 = _1298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1382 = _1376 >> 2;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    bool _1388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1390 = isnan(1.0);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1396 = _1392 || _1394;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1400 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1380);
    int _1402 = _1382 << 4;
    int _1404 = _1402 + 368;
    float _1406 = in.m_62.x;
    float _1408 = in.m_62.y;
    float _1410 = in.m_62.z;
    int _1412 = abs(_1230);
    float _1414 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1398);
    float _1416 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1400);
    uint _1418 = uint(int(uint(_1404) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = abs(_1288);
    float _1436 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1438 = float(_1192);
    float _1440 = 1.0 / _1386;
    float _1442 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1444 = float(_1150);
    float _1446 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1448 = float(_1412);
    float _1450 = float(_1280);
    float _1452 = float(_1434);
    float _1454 = _1448 * _1444;
    float _1456 = float(_1368);
    float _1458 = _1450 * _1438;
    int _1460 = abs(_1164);
    int _1462 = _1404 + 8;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    uint _1466 = uint(int(uint(int(_1464)) >> uint(2)));
    int _1468 = int(_1464) & 3;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[int(_1466)][_1468];
    int _1472 = int(_1464) + 1;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    int _1476 = _1472 & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = ~_1152;
    int _1482 = _1480 + _1214;
    int _1484 = _1482 + 1;
    float _1486 = _1452 * _1456;
    if (_1396)
    {
        float _1488 = _1198 * _1440;
        _127 = _1488;
    }
    float _1490 = _127;
    float _1492 = _1454 * (-2.0);
    bool _1494 = !_1040;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = _1486 * (-2.0);
    bool _1500 = _1038 != 3;
    float _1502 = fma(_1492, _1408, _1408);
    float _1504 = fma(_1290, _1492, _1290);
    float _1506 = fma(_1276, _1498, _1276);
    float _1508 = fma(_1498, _1406, _1406);
    float _1510 = _1458 * (-2.0);
    bool _1512 = !_1500;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    bool _1520 = _145 > 0.5;
    float _1522 = fma(_1282, _1510, _1282);
    int _1524 = abs(_1108);
    float _1526 = _145 + (-0.5);
    float _1528 = fma(_1510, _1410, _1410);
    bool _1530 = _689 > 0.5;
    float _1532 = _689 + (-0.5);
    int _1534 = ~_1524;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    int _1542 = abs(_1496);
    float _1544 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1502);
    float _1546 = _707 + (-0.5);
    int _1548 = abs(_1114);
    float _1550 = fma(_1506, _1490, _1540);
    int _1552 = abs(_1514);
    int _1554 = _1538 * as_type<int>(_1432);
    float _1556 = fma(_1504, _1490, _1544);
    int _1558 = ~_1548;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    int _1566 = ~_1542;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = _1556 * 0.15915493667125701904296875;
    int _1574 = ~_1460;
    int _1576 = _1574 + 1;
    int _1578 = _1576 + 1;
    float _1580 = fma(_1522, _1490, _1564);
    bool _1582 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1584 = isnan(_681);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    int _1594 = _1570 * as_type<int>(_1424);
    int _1596 = _1594 + _1554;
    int _1598 = ~_1552;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    int _1604 = _703 * _1484;
    int _1606 = _1604 + _910;
    float _1608 = float(uint(_1518));
    float _1610 = _1572 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    bool _1614 = !_1220;
    float _1616 = _1614 ? (-0.5) : 0.5;
    float _1618 = _1550 * 0.15915493667125701904296875;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1622 = _1620 != 0;
    int _1624 = _1562 * as_type<int>(_1470);
    int _1626 = _1624 + _1596;
    int _1628 = abs(_1518);
    float _1630 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1632 = !_1224;
    float _1634 = _1632 ? (-0.5) : 0.5;
    int _1636 = _1602 * as_type<int>(_1478);
    int _1638 = _1636 + _1626;
    bool _1640 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1642 = isnan(_681);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = 1.0 / _1608;
    float _1654 = float(uint(_1628));
    int _1656 = _1638 * _1578;
    bool _1658 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_681);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = -_1592;
    float _1672 = _1670 + 1.0;
    float _1674 = -_1634;
    int _1676 = _1530 ? as_type<int>(_1674) : as_type<int>(_1634);
    float _1678 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1680 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1682 = isnan(_681);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1668 * _1672;
    float _1694 = -_1668;
    float _1696 = _1694 + 1.0;
    float _1698 = -_1616;
    int _1700 = _1520 ? as_type<int>(_1698) : as_type<int>(_1616);
    float _1702 = _1572 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1708 = _1706 != 0;
    float _1710 = _1650 * _1696;
    bool _1712 = !_1622;
    float _1714 = _1712 ? _1616 : as_type<float>(_1700);
    float _1716 = -_1650;
    float _1718 = _1716 + 1.0;
    bool _1720 = !_1708;
    float _1722 = _1720 ? _1634 : as_type<float>(_1676);
    int _1724 = as_type<int>(_1652) + (-2);
    float _1726 = 1.0 / _1654;
    float _1728 = _1580 * 0.15915493667125701904296875;
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1616);
    bool _1732 = !_737;
    int _1734 = _1732 ? _1606 : (-1);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1634);
    bool _1738 = _1518 == 0;
    float _1740 = _1630 * _1730;
    float _1742 = _1618 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    int _1746 = _1734 * _1460;
    int _1748 = _1746 + _1656;
    float _1750 = _1678 * _1736;
    float _1752 = _1690 * _1718;
    float _1754 = -_1690;
    float _1756 = _1754 + 1.0;
    float _1758 = float(uint(_1748));
    float _1760 = _1310 * _1752;
    float _1762 = _1618 * 6.283185482025146484375;
    float _1764 = cos(_1762);
    float _1766 = _1340 * _1752;
    int _1768 = abs(_1748);
    float _1770 = as_type<float>(_1724) * _1758;
    int _1772 = as_type<int>(_1726) + (-2);
    float _1774 = _1342 * _1752;
    float _1776 = float(uint(_1768));
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1760);
    float _1780 = _1728 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1744 * _1704;
    int _1786 = ~_1518;
    int _1788 = _1786 + 1;
    float _1790 = as_type<float>(_1772) * _1776;
    float _1792 = _1728 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    float _1796 = _1764 * _1612;
    float _1798 = _1764 * _1704;
    float _1800 = trunc(_1770);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = -_1796;
    float _1808 = fma(_1782, _1784, _1806);
    float _1810 = -_1784;
    float _1812 = fma(_1782, _1796, _1810);
    float _1814 = _1744 * _1612;
    float _1816 = _1794 * _1750;
    float _1818 = _1704 * _1794;
    float _1820 = _1612 * _1794;
    int _1822 = ~_1628;
    int _1824 = _1822 + 1;
    float _1826 = -_1750;
    float _1828 = _1782 * _1826;
    float _1830 = fma(_1782, _1798, _1814);
    float _1832 = _1764 * _1816;
    float _1834 = fma(_1782, _1814, _1798);
    float _1836 = trunc(_1790);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = _1744 * _1816;
    float _1844 = fma(_1830, _1740, _1832);
    float _1846 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1848 = _1788 * int(_1804);
    int _1850 = _1848 + _1748;
    float _1852 = fma(_1818, _1740, _1828);
    float _1854 = fma(_1808, _1740, _1842);
    float _1856 = fma(_1812, _1846, _1844);
    float _1858 = fma(_1820, _1846, _1852);
    float _1860 = float(uint(_1850));
    float _1862 = fma(_1834, _1846, _1854);
    float _1864 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1866 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1868 = ~_1628;
    int _1870 = _1868 + 1;
    float _1872 = as_type<float>(_1724) * _1860;
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1864);
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1866);
    int _1878 = _1824 * int(_1840);
    int _1880 = _1878 + _1768;
    float _1882 = trunc(_1872);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1890 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1892 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1766);
    float _1894 = float(uint(_1880));
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1900 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1902 = _1378 + _1896;
    float _1904 = as_type<float>(_1772) * _1894;
    float _1906 = _1442 + _1898;
    float _1908 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1774);
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1912 = _1902 + _1910;
    float _1914 = fma(_1344, _1710, _1778);
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1906 + _1916;
    float _1920 = trunc(_1904);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = fma(_1332, _1710, _1892);
    int _1928 = int(_1804) + int(_1886);
    float _1930 = _1912 * _1912;
    float _1932 = _1918 * _1918;
    int _1934 = ~_1518;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1352, _1710, _1908);
    float _1940 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1900);
    float _1942 = _1930 + _1932;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1946 = _1936 * _1928;
    int _1948 = _1946 + _1748;
    float _1950 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _1952 = fma(_1354, _1692, _1914);
    bool _1954 = uint(_1948) >= uint(_1518);
    float _1956 = sqrt(_1942);
    int _1958 = int(_1840) + int(_1924);
    int _1960 = _1870 * _1958;
    int _1962 = _1960 + _1768;
    float _1964 = fma(_1356, _1692, _1926);
    bool _1966 = !_1954;
    int _1968 = _1966 ? 0 : (-1);
    float _1970 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1972 = uint(_1962) >= uint(_1628);
    int _1974 = _1748 ^ _1518;
    int _1976 = ~_1928;
    int _1978 = _1976 + _1968;
    int _1980 = _1978 + 1;
    bool _1982 = _1956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1984 = !_1972;
    int _1986 = _1984 ? 0 : (-1);
    int _1988 = _1518 * _1980;
    int _1990 = _1988 + _1748;
    uint _1992 = uint(int(uint(_1974) >> uint(31)));
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1996 = ~_1986;
    int _1998 = _1958 + _1996;
    int _2000 = _1998 + 1;
    int _2002 = ~int(_1992);
    int _2004 = _2002 + 1;
    float _2006 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2008 = _1518 == 0;
    int _2010 = _2000 ^ _2004;
    float _2012 = _1446 + _2006;
    float _2014 = _1900;
    float _2016 = as_type<float>(_2004);
    float _2018 = _2006;
    float _2020 = _1930;
    float _2022 = _1722;
    if (!_1982)
    {
        _2014 = _1932;
    }
    float _2024 = _2014;
    bool _2026 = !_2008;
    float _2028 = _2026 ? as_type<float>(_1990) : as_type<float>(0xffffffffu /* nan */);
    int _2030 = ~_2004;
    int _2032 = _2030 + _2010;
    int _2034 = _2032 + 1;
    float _2036 = _2028;
    float _2038 = _2024;
    if (!_1982)
    {
        _2016 = _1930;
    }
    float _2040 = _2016;
    float _2042 = float(as_type<int>(_2028));
    float _2044 = _2040;
    if (!_1982)
    {
        _2018 = _1902;
    }
    float _2046 = _2018;
    float _2048 = _2046;
    if (!_1982)
    {
        _2020 = _1906;
    }
    float _2050 = _2020;
    float _2052 = _2050;
    if (!_1982)
    {
        _2036 = _2012;
    }
    float _2054 = _2036;
    bool _2056 = !_1982;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _1956 + _2062;
        float _2066 = rsqrt(_1942);
        float _2068 = _2064 * _2060;
        float _2070 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2072 = _2068 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        float _2082 = fma(_2076, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2084 = _2066 * _2082;
        float _2086 = fma(_1912, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2088 = _2080 + (-1.0);
        float _2090 = fma(_1918, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2094 = _2086 + _2092;
        float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2100 = _2090 + _2098;
        float _2102 = _2094 * _2094;
        float _2104 = fma(_2012, _2080, _2096);
        float _2106 = _2100 * _2100;
        _2058 = _2104;
        _2044 = _2102;
        _2038 = _2106;
        _2048 = _2086;
        _2052 = _2090;
    }
    float _2108 = _2058;
    float _2110 = _2044;
    float _2112 = _2038;
    float _2114 = _2048;
    float _2116 = _2052;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2120 = _2108 + _2118;
    bool _2122 = !_1738;
    int _2124 = _2122 ? _2034 : (-1);
    float _2126 = fma(_1970, _2042, _1374);
    float _2128 = _1714 + 0.5;
    float _2130 = fma(_2120, _2120, _2110);
    float _2132 = float(_2124);
    float _2134 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = fma(_1360, _1692, _1938);
    float _2138 = _2130 + _2112;
    float _2140 = fma(_1970, _2128, _2126);
    float _2142 = -_743;
    float _2144 = fma(_2134, _2132, _2142);
    float _2146 = -_1416;
    float _2148 = _2146 + 1.0;
    float _2150 = _1722 + (-0.5);
    float _2152 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1952);
    float _2154 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1964);
    float _2156 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].z, _2136);
    float _2158 = sqrt(_2138);
    float _2160 = -_2134;
    float _2162 = fma(_2160, _2150, _2144);
    float _2164 = -_2148;
    float _2166 = fma(_1714, _2164, _2140);
    float _2168 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2170 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2172 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2174 = -_1436;
    float _2176 = _2174 + 1.0;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2186 = fma(_1722, _2176, _2162);
    out.m_64.x = _2180;
    out.m_64.y = _2182;
    out.m_64.z = _2184;
    out.m_64.w = _2178;
    bool _2188 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2190 = isnan(_2158);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2196 = _2192 || _2194;
    out.m_66.x = _2166;
    out.m_66.y = _2186;
    float _2198 = _2180;
    float _2200 = _2182;
    if (!_2196)
    {
        _2022 = 1.0;
    }
    float _2202 = _2022;
    bool _2204 = !_2196;
    float _2206 = _2202;
    if (!_2204)
    {
        bool _2208 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2210 = isnan(_2158);
        bool _2212 = _2208 || _2210;
        bool _2214 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2216 = _2212 || _2214;
        if (!_2216)
        {
            float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2220 = _2158 + _2218;
            float _2222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2224 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2230 = 1.0 / _2224;
            float _2232 = _2220 * _2230;
            float _2234 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2206 = _2234;
            _2198 = _2228;
            _2236 = true;
        }
        else
        {
            bool _2238 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2240 = isnan(_2158);
            bool _2242 = _2238 || _2240;
            bool _2244 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2246 = _2242 || _2244;
            if (!_2246)
            {
                float _2248 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2250 = _2158 + _2248;
                float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2254 = _2252 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2258 = _2256 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2260 = 1.0 / _2254;
                float _2262 = _2250 * _2260;
                float _2264 = fma(_2262, _2258, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2206 = _2264;
                _2198 = _2258;
                _2236 = true;
            }
            else
            {
                _2206 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2236 = false;
    float _2266 = _2206;
    float _2268 = _2198;
    float _2270 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2272 = _2108 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2276 = _2114 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2280 = _2116 + _2278;
    float _2282 = fma(_2272, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2284 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2286 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2288 = -_1446;
    float _2290 = _2288 + _2282;
    float _2292 = -_1378;
    float _2294 = _2292 + _2284;
    float _2296 = -_1442;
    float _2298 = _2296 + _2286;
    float _2300 = _2290 * _2290;
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = fma(_2298, _2298, _2302);
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > 0.0;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2290;
    if (!_2308)
    {
        _2320 = _2284;
    }
    float _2326 = _2320;
    float _2328 = _2326;
    if (!_2308)
    {
        _2200 = _2282;
    }
    float _2330 = _2200;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2308)
    {
        _2322 = _2286;
    }
    float _2336 = _2322;
    bool _2338 = !_2308;
    float _2340 = _2336;
    float _2342 = _2336;
    if (!_2338)
    {
        float _2344 = _251 * _251;
        float _2346 = rsqrt(_2304);
        float _2348 = fma(_247, _247, _2344);
        float _2350 = fma(_253, _253, _2348);
        float _2352 = sqrt(_2350);
        float _2354 = _2294 * _2346;
        float _2356 = _2290 * _2346;
        float _2358 = _2298 * _2346;
        bool _2360 = _2352 > 0.0;
        float _2362 = _2352;
        _2324 = _2356;
        if (!_2360)
        {
            _2362 = _2284;
        }
        float _2364 = _2362;
        _2328 = _2364;
        if (!_2360)
        {
            _2332 = _2282;
        }
        float _2366 = _2332;
        _2334 = _2366;
        if (!_2360)
        {
            _2340 = _2286;
        }
        float _2368 = _2340;
        bool _2370 = !_2360;
        _2342 = _2368;
        if (!_2370)
        {
            float _2372 = rsqrt(_2350);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _251 * _2372;
            float _2378 = _247 * _2372;
            float _2380 = _2356 * _2376;
            float _2382 = _253 * _2372;
            float _2384 = fma(_2354, _2378, _2380);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2358, _2382, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_247, _2390, _2284);
            float _2394 = fma(_251, _2390, _2282);
            float _2396 = fma(_253, _2390, _2286);
            _2328 = _2392;
            _2334 = _2394;
            _2342 = _2396;
        }
    }
    float _2398 = _2328;
    float _2400 = _2334;
    float _2402 = _2342;
    float _2404 = _2324;
    float _2406 = _2400;
    float _2408 = _2398;
    float _2410 = _2402;
    float _2412 = _2404;
    if (!_2318)
    {
        float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2416 = _1446 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2420 = _1378 + _2418;
        float _2422 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2416 * _2416;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2428 = _1442 + _2426;
        float _2430 = fma(_2420, _2420, _2424);
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2434 = fma(_2428, _2428, _2430);
        float _2436 = sqrt(_2434);
        float _2438 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2440 = precise::min(_2436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2442 = _2440 * _2432;
        float _2444 = -_1378;
        float _2446 = _2444 + _2398;
        float _2448 = _2438 * _2442;
        float _2450 = -_1446;
        float _2452 = _2450 + _2400;
        float _2454 = -_1442;
        float _2456 = _2454 + _2402;
        float _2458 = fma(_2446, _2448, _1378);
        float _2460 = fma(_2452, _2448, _1446);
        float _2462 = fma(_2456, _2448, _1442);
        _2406 = _2460;
        _2408 = _2458;
        _2410 = _2462;
        _261 = _2448;
    }
    float _2464 = _2406;
    float _2466 = _2408;
    float _2468 = _2410;
    float _2470 = _261;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2474 = _2464 + _2472;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2478 = _2466 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2468 + _2480;
    float _2484 = _2474 * _2474;
    float _2486 = fma(_2478, _2478, _2484);
    float _2488 = fma(_2482, _2482, _2486);
    float _2490 = rsqrt(_2488);
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2494 = _2478 * _2492;
    float _2496 = _2482 * _2492;
    float _2498 = _2494 * _2494;
    float _2500 = _2496 * _2496;
    float _2502 = _2498 + _2500;
    float _2504 = sqrt(_2502);
    bool _2506 = _2504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2510 = _2504 + _2508;
    float _2512 = _2490;
    float _2514 = _2470;
    float _2516 = _2510;
    float _2518 = _2474;
    float _2520 = _2492;
    float _2522 = _2494;
    if (_2506)
    {
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2524;
    }
    float _2526 = _2512;
    if (_2506)
    {
        float _2528 = rsqrt(_2502);
        _2514 = _2528;
    }
    float _2530 = _2514;
    float _2532 = _2530;
    if (_2506)
    {
        float _2534 = _2510 * _2526;
        _2516 = _2534;
    }
    float _2536 = _2516;
    if (_2506)
    {
        float _2538 = _2536 * 0.15915493667125701904296875;
        _263 = _2538;
    }
    float _2540 = _263;
    float _2542 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2544 = _2526;
    if (_2506)
    {
        float _2546 = _2540 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        _2544 = _2548;
    }
    float _2550 = _2544;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2554 = precise::max(0.0, _2552);
    float _2556 = _2482;
    float _2558 = _2554;
    if (_2506)
    {
        float _2560 = _2540 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        _2556 = _2562;
    }
    float _2564 = _2556;
    float _2566 = -_2492;
    float _2568 = -_2554;
    float _2570 = fma(_2474, _2566, _2568);
    if (!_2506)
    {
        _2518 = _2498;
    }
    float _2572 = _2518;
    float _2574 = _2572;
    if (_2506)
    {
        float _2576 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = sqrt(_2488);
    float _2582 = _2550;
    float _2584 = _2578;
    if (_2506)
    {
        float _2586 = fma(_2550, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2582 = _2586;
    }
    float _2588 = _2582;
    float _2590 = _2588;
    if (_2506)
    {
        float _2592 = _2564 + (-1.0);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = _2594;
    if (_2506)
    {
        float _2598 = _2530 * _2588;
        _2412 = _2598;
    }
    float _2600 = _2412;
    if (!_2506)
    {
        _2532 = _2570;
    }
    float _2602 = _2532;
    float _2604 = _2602;
    if (_2506)
    {
        float _2606 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2606;
    }
    float _2608 = _2520;
    if (_2506)
    {
        float _2610 = _2494 * _2600;
        _2522 = _2610;
    }
    float _2612 = _2522;
    if (!_2506)
    {
        _2590 = _2496;
    }
    float _2614 = _2590;
    float _2616 = _2614;
    if (_2506)
    {
        float _2618 = _2496 * _2600;
        _2616 = _2618;
    }
    float _2620 = _2616;
    if (_2506)
    {
        float _2622 = fma(_2570, _2564, _2608);
        _2604 = _2622;
    }
    float _2624 = _2604;
    if (_2506)
    {
        float _2626 = _2612 * _2612;
        _2574 = _2626;
    }
    float _2628 = _2574;
    if (!_2506)
    {
        _2596 = _2500;
    }
    float _2630 = _2596;
    float _2632 = _2630;
    if (_2506)
    {
        float _2634 = _2620 * _2620;
        _2632 = _2634;
    }
    float _2636 = _2632;
    float _2638 = fma(_2624, _2624, _2628);
    float _2640 = _2638 + _2636;
    float _2642 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = rsqrt(_2640);
    float _2652 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2642);
    float _2654 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2662 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2654);
    float _2666 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2668 = abs(_2658);
    float _2670 = log2(_2668);
    float _2672 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2664);
    float _2676 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2666);
    float _2678 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2684 = _2650 * _2612;
    float _2686 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2688 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2650 * _2624;
    float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2700 = _2650 * _2620;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2542, 1.0);
    float _2712 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2714 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2716 = -_2700;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2720 = exp2(_2706);
    float _2722 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2714);
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2730 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2732 = log2(_2710);
    float _2734 = fma(_2718, 0.5, 0.5);
    float _2736 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2728);
    float _2738 = _2692 + 1.0;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2730);
    float _2742 = fma(_2734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2736);
    float _2746 = 1.0 / _2724;
    float _2748 = -_2692;
    float _2750 = fma(_2720, _2738, _2748);
    float _2752 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2754 = fma(_2734, _2742, -0.212114393711090087890625);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2744);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = fma(_2734, _2754, 1.570728778839111328125);
    float _2762 = sqrt(_2726);
    float _2764 = _2732 * 0.693147182464599609375;
    float _2766 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = _2752 * _2746;
    float _2770 = _2756 * _2746;
    float _2772 = fma(_2768, 0.5, 0.5);
    float _2774 = fma(_2770, -0.5, 0.5);
    float _2776 = _2762 * 0.636619746685028076171875;
    float3 _7011 = float3(_2772, _2774, _2766);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7011, float3(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7011, float3(0.0), isnan(_7011)), level(0.0)).x;
    float3 _7022 = float3(_2772, _2774, _2766);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7022, float3(0.0), isnan(_7022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7022, float3(0.0), isnan(_7022)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float _2791 = -_2760;
    float _2793 = fma(_2776, _2791, 1.0);
    float2 _7044 = float2(_2793, _2758);
    float3 _2797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7044, float2(0.0), isnan(_7044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7044, float2(0.0), isnan(_7044)), level(0.0)).xyz;
    float _2799 = _2797.x;
    float _2801 = _2797.y;
    float _2803 = _2797.z;
    float _2805 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2809 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2811 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2807);
    float _2813 = exp2(_2805);
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2817 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2811);
    float _2819 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2817);
    out.m_47.x = _2815;
    float _2821 = _2819 + _2724;
    out.gl_Position.x = _2752;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2819;
    out.gl_Position.w = _2724;
    float _2823 = _2821 * 0.5;
    float _2825 = -_2813;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2823;
    out.m_68.w = _2724;
    float _2831 = _2829 * _2778;
    float _2833 = -_2829;
    float _2835 = _2833 + 1.0;
    float _2837 = _2789 * _2831;
    float _2839 = _2803 * _2831;
    float _2841 = fma(_2799, _2837, _2783);
    float _2843 = fma(_2801, _2837, _2785);
    float _2845 = _2789 * _2835;
    float _2847 = fma(_2789, _2839, _2787);
    out.m_70.x = _2841;
    out.m_70.y = _2843;
    out.m_70.z = _2847;
    out.m_70.w = _2845;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2236 = false;
    bool _673 = false;
    bool _427 = false;
    bool _281 = false;
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
        float _2904 = as_type<float>(_105);
        out.gl_Position.z = _2904;
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
        out.m_47.x = 0.0;
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
        float _2973 = as_type<float>(_143);
        out.gl_Position.z = _2973;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _149 * _147;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = _163 * 6.283185482025146484375;
    float _167 = floor(_163);
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    int _199 = abs(_187);
    bool _201 = !_159;
    int _203 = _201 ? 0 : 1;
    float _205 = -_167;
    float _207 = _163 + _205;
    bool _209 = !_175;
    int _211 = _209 ? 0 : 1;
    int _213 = abs(_203);
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_199);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _223 = abs(_211);
    float _225 = fma(_195, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _219 * _227;
    bool _231 = _207 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _249 = fma(_239, _237, _229);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _253 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _255 = abs(_243);
    float _257 = fma(_245, _255, _249);
    bool _259 = !_221;
    float _261 = _247;
    float _263 = _253;
    float _279;
    if (!_259)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_89);
        float _285 = 1.0 / _283;
        float _287 = _123 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    bool _307 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_289);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _321;
    bool _333 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_289);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _353 = _343 * _349;
    float _355 = 1.0 / _325;
    float _357 = -_343;
    float _359 = _357 + 1.0;
    float _361 = _293 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _289 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_369, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _379 = _365 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _375 * _353;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _377 * _353;
    float _393 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _397 = fma(_389, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = fma(_393, _345, _395);
    float _403 = fma(_397, _345, _399);
    float _405 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    bool _409 = !_351;
    float _425;
    if (!_409)
    {
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_89);
        float _431 = 1.0 / _429;
        float _433 = _123 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = _435 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _435 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _457;
    float _461 = 1.0 / _451;
    bool _463 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_435);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _459;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = 1.0 / _455;
    float _481 = _439 * _461;
    bool _483 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _485 = isnan(_435);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _495;
    float _499 = fma(_497, _481, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _501 = _443 * _475;
    bool _503 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _505 = isnan(_435);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_513;
    float _521 = _519 + 1.0;
    float _523 = _513 * _517;
    float _525 = _447 * _479;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = _473 * _521;
    float _541 = fma(_529, _481, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_533, _481, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _545 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _547 = isnan(_435);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_473;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _569 = fma(_537, _525, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = _555 * _559;
    float _573 = fma(_563, _525, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _575 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _577 = _499 * _571;
    float _579 = _541 * _571;
    float _581 = -_555;
    float _583 = _581 + 1.0;
    float _585 = _543 * _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _591;
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].x, _577);
    float _597 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].y, _579);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _605 = fma(_589, _501, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _607 = fma(_573, _539, _595);
    float _609 = fma(_593, _501, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _611 = fma(_601, _501, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _613 = fma(_569, _539, _597);
    float _615 = fma(_575, _539, _603);
    float _617 = fma(_605, _523, _607);
    float _619 = in.m_55.x;
    float _621 = in.m_55.y;
    float _623 = fma(_609, _523, _613);
    float _625 = fma(_611, _523, _615);
    float _627 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].x, _617);
    float _629 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].y, _623);
    float _631 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].z, _625);
    float _633 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _641;
    out.m_57.y = _643;
    out.m_57.z = _645;
    out.m_57.w = _639;
    float _647 = _407 * _621;
    float _649 = _405 * _619;
    bool _651 = !_477;
    float _669;
    float _671;
    if (!_651)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _659 = _657 * _653;
        float _661 = float(_89);
        float _663 = floor(_659);
        float _665 = -_663;
        float _667 = _659 + _665;
        _669 = _667;
        _671 = _661;
        _673 = true;
    }
    else
    {
        float _675 = float(_89);
        float _677 = 1.0 / _675;
        float _679 = _123 * _677;
        _669 = _679;
        _671 = _675;
    }
    _673 = false;
    float _681 = _669;
    float _683 = _671;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_51.y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = _681 + _695;
    float _699 = as_type<float>(int(gl_VertexIndex));
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _707 = in.m_51.z;
    float _709 = 1.0 / _683;
    float _711 = float(_687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _717;
    float _721 = 1.0 / _711;
    float _723 = float(uint(_703));
    float _725 = _689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _727 = ~_703;
    int _729 = _727 + 1;
    int _731 = ~_703;
    int _733 = _731 + 1;
    float _735 = fma(_725, -2.0, _705);
    bool _737 = _703 == 0;
    float _739 = 1.0 / _723;
    float _741 = _145 + _707;
    float _743 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _735);
    float _745 = _741 + (-1.0);
    float _747 = _721 * _123;
    float _749 = trunc(_747);
    int _751 = int(_749);
    int _753 = as_type<int>(_739) + (-2);
    float _755 = float(uint(_751));
    float _757 = as_type<float>(_753) * _755;
    float _759 = trunc(_757);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = float(_703);
    int _768 = _729 * int(_764);
    int _770 = _768 + _751;
    float _772 = float(uint(_770));
    float _774 = as_type<float>(_753) * _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = trunc(_774);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    bool _786 = !_778;
    float _788 = _786 ? 7.345489978790283203125 : 1.0;
    float _790 = _788 * _145;
    float _792 = floor(_790);
    int _794 = int(_764) + int(_784);
    float _796 = float(_751);
    int _798 = _733 * _794;
    int _800 = _798 + _751;
    bool _802 = _796 >= _766;
    bool _804 = isnan(_796);
    bool _806 = _802 || _804;
    bool _808 = isnan(_766);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    bool _814 = uint(_800) >= uint(_703);
    float _816 = trunc(_812);
    int _818 = int(_816);
    float _820 = -_792;
    float _822 = _790 + _820;
    bool _824 = !_814;
    int _826 = _824 ? 0 : (-1);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    int _840 = ~_794;
    int _842 = _840 + _826;
    int _844 = _842 + 1;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _848 = _846 != 0;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = _703 * _844;
    int _856 = _854 + _751;
    bool _858 = !_737;
    int _860 = _858 ? _856 : (-1);
    float _862 = _822 * _766;
    int _864 = ~_818;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = _766 * _123;
    bool _872 = !_848;
    int _874 = _872 ? 0 : 1;
    float _876 = trunc(_862);
    int _878 = int(_876);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    int _884 = _860 * _868;
    float _886 = _870 * _709;
    int _888 = _703 + (-1);
    int _890 = abs(_874);
    int _892 = _818 * _888;
    int _894 = _892 + _884;
    float _896 = trunc(_886);
    int _898 = int(_896);
    bool _900 = !_834;
    int _902 = _900 ? 0 : 1;
    int _904 = abs(_852);
    int _906 = abs(_902);
    int _908 = _878 * _890;
    int _910 = _908 + _751;
    bool _912 = !_838;
    int _914 = _912 ? 0 : 1;
    bool _916 = !_882;
    int _918 = _916 ? 0 : 1;
    int _920 = _894 * _906;
    int _922 = abs(_914);
    int _924 = abs(_918);
    int _926 = _898 * _904;
    int _928 = _926 + _920;
    int _930 = ~_703;
    int _932 = _930 + 1;
    int _934 = _910 * _922;
    int _936 = _934 + _928;
    float _938 = float(uint(_910));
    int _940 = _878 * _924;
    int _942 = _940 + _936;
    float _944 = as_type<float>(_753) * _938;
    float _946 = float(uint(_942));
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = trunc(_944);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    float _956 = as_type<float>(_753) * _946;
    float _958 = trunc(_956);
    float _960 = precise::max(_958, 0.0);
    uint _962 = uint(_960);
    int _964 = ~_703;
    int _966 = _964 + 1;
    int _968 = _932 * int(_962);
    int _970 = _968 + _942;
    float _972 = float(uint(_970));
    float _974 = as_type<float>(_753) * _972;
    float _976 = trunc(_974);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = int(_962) + int(_980);
    int _984 = _966 * _982;
    int _986 = _984 + _942;
    float _988 = _145 * 2.0;
    bool _990 = uint(_986) >= uint(_703);
    int _992 = ~_703;
    int _994 = _992 + 1;
    float _996 = floor(_988);
    bool _998 = !_990;
    int _1000 = _998 ? 0 : (-1);
    int _1002 = _994 * int(_954);
    int _1004 = _1002 + _910;
    int _1006 = ~_982;
    int _1008 = _1006 + _1000;
    int _1010 = _1008 + 1;
    float _1012 = _689 * 2.0;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = float(uint(_1004));
    int _1020 = _703 * _1010;
    int _1022 = _1020 + _942;
    float _1024 = as_type<float>(_753) * _1018;
    bool _1026 = !_737;
    int _1028 = _1026 ? _1022 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _996 > 0.0;
    int _1034 = _1028 & 3;
    bool _1036 = _1034 != 0;
    int _1038 = _1028 & 3;
    bool _1040 = _1038 != 0;
    int _1042 = _1036 ? 0 : 1;
    float _1044 = _1016 * _123;
    bool _1046 = uint(_1038) > 1u;
    float _1048 = trunc(_1024);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = _1038 != 3;
    bool _1056 = _996 >= 0.0;
    bool _1058 = isnan(_996);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    bool _1066 = uint(_1038) >= 2u;
    int _1068 = _1064 ? 0 : 1;
    float _1070 = exp2(_1044);
    int _1072 = _1066 ? 0 : 1;
    bool _1074 = _1030 >= 0.0;
    bool _1076 = isnan(_1030);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    bool _1084 = _1030 > 0.0;
    int _1086 = ~_1042;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1082 ? 0 : 1;
    int _1100 = _1090;
    int _1102 = _1096;
    if (!_1046)
    {
        int _1104 = ~_1042;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    if (_1054)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1102 = _1112;
    }
    int _1114 = _1102;
    float _1116 = -_1070;
    float _1118 = _1116 + 1.0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_44.x;
    float _1134 = in.m_44.y;
    float _1136 = in.m_44.z;
    int _1138 = ~_1068;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    int _1144 = _1142;
    if (!_1032)
    {
        int _1146 = ~_1068;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    int _1152 = int(_954) + int(_1052);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1156 = _1154 != 0;
    int _1158 = ~_703;
    int _1160 = _1158 + 1;
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _1160 * _1152;
    int _1168 = _1166 + _910;
    bool _1170 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1178 = _1174 || _1176;
    int _1180 = ~_1098;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (!_1084)
    {
        int _1188 = ~_1098;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1194;
    float _1198 = _1178 ? _1118 : 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = uint(_1168) >= uint(_703);
    float _1206 = 1.0 / _1196;
    float _1208 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1212 = !_1204;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1218 = as_type<int>(_699) & 1;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>(_699) & 2;
    bool _1224 = _1222 != 0;
    float _1226 = _707 * 2.0;
    bool _1228 = !_1126;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = 1.0 / _1202;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1234;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1240 = -_948;
    float _1242 = fma(_1216, 2.0, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1246 = _681 + _1244;
    bool _1248 = !_1130;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1238);
    float _1254 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    float _1256 = 1.0 / _1236;
    float _1258 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1260 = _145 + _689;
    float _1262 = _697 * _1206;
    float _1264 = _1260 + (-1.0);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1266;
    float _1270 = floor(_1226);
    float _1272 = _693 * _1232;
    float _1274 = _689 + _707;
    float _1276 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _1274 + (-1.0);
    int _1280 = abs(_1250);
    float _1282 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = _1246 * _1256;
    bool _1286 = !_1122;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1292;
    float _1296 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1254);
    float _1298 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    bool _1300 = _1270 >= 0.0;
    bool _1302 = isnan(_1270);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1316 = _1308 ? 0 : 1;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1322 = _1270 > 0.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = fma(_1320, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1334 = ~_1316;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1326, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1342 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = fma(_1314, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1346;
    int _1350 = _1028 >> 31;
    float _1352 = fma(_1330, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1354 = fma(_715, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = fma(_1348, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1358 = _1350 & 3;
    float _1360 = fma(_719, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1362 = _1338;
    if (!_1322)
    {
        int _1364 = ~_1316;
        int _1366 = _1364 + 1;
        _1362 = _1366;
    }
    int _1368 = _1362;
    float _1370 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1258);
    float _1372 = -_123;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    int _1376 = _1028 + _1358;
    float _1378 = _1298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1382 = _1376 >> 2;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    bool _1388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1390 = isnan(1.0);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1396 = _1392 || _1394;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1400 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1380);
    int _1402 = _1382 << 4;
    int _1404 = _1402 + 368;
    float _1406 = in.m_62.x;
    float _1408 = in.m_62.y;
    float _1410 = in.m_62.z;
    int _1412 = abs(_1230);
    float _1414 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1398);
    float _1416 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1400);
    uint _1418 = uint(int(uint(_1404) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = abs(_1288);
    float _1436 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1438 = float(_1192);
    float _1440 = 1.0 / _1386;
    float _1442 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1444 = float(_1150);
    float _1446 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1448 = float(_1412);
    float _1450 = float(_1280);
    float _1452 = float(_1434);
    float _1454 = _1448 * _1444;
    float _1456 = float(_1368);
    float _1458 = _1450 * _1438;
    int _1460 = abs(_1164);
    int _1462 = _1404 + 8;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    uint _1466 = uint(int(uint(int(_1464)) >> uint(2)));
    int _1468 = int(_1464) & 3;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[int(_1466)][_1468];
    int _1472 = int(_1464) + 1;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    int _1476 = _1472 & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = ~_1152;
    int _1482 = _1480 + _1214;
    int _1484 = _1482 + 1;
    float _1486 = _1452 * _1456;
    if (_1396)
    {
        float _1488 = _1198 * _1440;
        _127 = _1488;
    }
    float _1490 = _127;
    float _1492 = _1454 * (-2.0);
    bool _1494 = !_1040;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = _1486 * (-2.0);
    bool _1500 = _1038 != 3;
    float _1502 = fma(_1492, _1408, _1408);
    float _1504 = fma(_1290, _1492, _1290);
    float _1506 = fma(_1276, _1498, _1276);
    float _1508 = fma(_1498, _1406, _1406);
    float _1510 = _1458 * (-2.0);
    bool _1512 = !_1500;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    bool _1520 = _145 > 0.5;
    float _1522 = fma(_1282, _1510, _1282);
    int _1524 = abs(_1108);
    float _1526 = _145 + (-0.5);
    float _1528 = fma(_1510, _1410, _1410);
    bool _1530 = _689 > 0.5;
    float _1532 = _689 + (-0.5);
    int _1534 = ~_1524;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    int _1542 = abs(_1496);
    float _1544 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1502);
    float _1546 = _707 + (-0.5);
    int _1548 = abs(_1114);
    float _1550 = fma(_1506, _1490, _1540);
    int _1552 = abs(_1514);
    int _1554 = _1538 * as_type<int>(_1432);
    float _1556 = fma(_1504, _1490, _1544);
    int _1558 = ~_1548;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    int _1566 = ~_1542;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = _1556 * 0.15915493667125701904296875;
    int _1574 = ~_1460;
    int _1576 = _1574 + 1;
    int _1578 = _1576 + 1;
    float _1580 = fma(_1522, _1490, _1564);
    bool _1582 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1584 = isnan(_681);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    int _1594 = _1570 * as_type<int>(_1424);
    int _1596 = _1594 + _1554;
    int _1598 = ~_1552;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    int _1604 = _703 * _1484;
    int _1606 = _1604 + _910;
    float _1608 = float(uint(_1518));
    float _1610 = _1572 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    bool _1614 = !_1220;
    float _1616 = _1614 ? (-0.5) : 0.5;
    float _1618 = _1550 * 0.15915493667125701904296875;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1622 = _1620 != 0;
    int _1624 = _1562 * as_type<int>(_1470);
    int _1626 = _1624 + _1596;
    int _1628 = abs(_1518);
    float _1630 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1632 = !_1224;
    float _1634 = _1632 ? (-0.5) : 0.5;
    int _1636 = _1602 * as_type<int>(_1478);
    int _1638 = _1636 + _1626;
    bool _1640 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1642 = isnan(_681);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = 1.0 / _1608;
    float _1654 = float(uint(_1628));
    int _1656 = _1638 * _1578;
    bool _1658 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_681);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = -_1592;
    float _1672 = _1670 + 1.0;
    float _1674 = -_1634;
    int _1676 = _1530 ? as_type<int>(_1674) : as_type<int>(_1634);
    float _1678 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1680 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1682 = isnan(_681);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1668 * _1672;
    float _1694 = -_1668;
    float _1696 = _1694 + 1.0;
    float _1698 = -_1616;
    int _1700 = _1520 ? as_type<int>(_1698) : as_type<int>(_1616);
    float _1702 = _1572 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1708 = _1706 != 0;
    float _1710 = _1650 * _1696;
    bool _1712 = !_1622;
    float _1714 = _1712 ? _1616 : as_type<float>(_1700);
    float _1716 = -_1650;
    float _1718 = _1716 + 1.0;
    bool _1720 = !_1708;
    float _1722 = _1720 ? _1634 : as_type<float>(_1676);
    int _1724 = as_type<int>(_1652) + (-2);
    float _1726 = 1.0 / _1654;
    float _1728 = _1580 * 0.15915493667125701904296875;
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1616);
    bool _1732 = !_737;
    int _1734 = _1732 ? _1606 : (-1);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1634);
    bool _1738 = _1518 == 0;
    float _1740 = _1630 * _1730;
    float _1742 = _1618 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    int _1746 = _1734 * _1460;
    int _1748 = _1746 + _1656;
    float _1750 = _1678 * _1736;
    float _1752 = _1690 * _1718;
    float _1754 = -_1690;
    float _1756 = _1754 + 1.0;
    float _1758 = float(uint(_1748));
    float _1760 = _1310 * _1752;
    float _1762 = _1618 * 6.283185482025146484375;
    float _1764 = cos(_1762);
    float _1766 = _1340 * _1752;
    int _1768 = abs(_1748);
    float _1770 = as_type<float>(_1724) * _1758;
    int _1772 = as_type<int>(_1726) + (-2);
    float _1774 = _1342 * _1752;
    float _1776 = float(uint(_1768));
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1760);
    float _1780 = _1728 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1744 * _1704;
    int _1786 = ~_1518;
    int _1788 = _1786 + 1;
    float _1790 = as_type<float>(_1772) * _1776;
    float _1792 = _1728 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    float _1796 = _1764 * _1612;
    float _1798 = _1764 * _1704;
    float _1800 = trunc(_1770);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = -_1796;
    float _1808 = fma(_1782, _1784, _1806);
    float _1810 = -_1784;
    float _1812 = fma(_1782, _1796, _1810);
    float _1814 = _1744 * _1612;
    float _1816 = _1794 * _1750;
    float _1818 = _1704 * _1794;
    float _1820 = _1612 * _1794;
    int _1822 = ~_1628;
    int _1824 = _1822 + 1;
    float _1826 = -_1750;
    float _1828 = _1782 * _1826;
    float _1830 = fma(_1782, _1798, _1814);
    float _1832 = _1764 * _1816;
    float _1834 = fma(_1782, _1814, _1798);
    float _1836 = trunc(_1790);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = _1744 * _1816;
    float _1844 = fma(_1830, _1740, _1832);
    float _1846 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1848 = _1788 * int(_1804);
    int _1850 = _1848 + _1748;
    float _1852 = fma(_1818, _1740, _1828);
    float _1854 = fma(_1808, _1740, _1842);
    float _1856 = fma(_1812, _1846, _1844);
    float _1858 = fma(_1820, _1846, _1852);
    float _1860 = float(uint(_1850));
    float _1862 = fma(_1834, _1846, _1854);
    float _1864 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1866 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1868 = ~_1628;
    int _1870 = _1868 + 1;
    float _1872 = as_type<float>(_1724) * _1860;
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1864);
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1866);
    int _1878 = _1824 * int(_1840);
    int _1880 = _1878 + _1768;
    float _1882 = trunc(_1872);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1890 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1892 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1766);
    float _1894 = float(uint(_1880));
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1900 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1902 = _1378 + _1896;
    float _1904 = as_type<float>(_1772) * _1894;
    float _1906 = _1442 + _1898;
    float _1908 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1774);
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1912 = _1902 + _1910;
    float _1914 = fma(_1344, _1710, _1778);
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1906 + _1916;
    float _1920 = trunc(_1904);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = fma(_1332, _1710, _1892);
    int _1928 = int(_1804) + int(_1886);
    float _1930 = _1912 * _1912;
    float _1932 = _1918 * _1918;
    int _1934 = ~_1518;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1352, _1710, _1908);
    float _1940 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1900);
    float _1942 = _1930 + _1932;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1946 = _1936 * _1928;
    int _1948 = _1946 + _1748;
    float _1950 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _1952 = fma(_1354, _1692, _1914);
    bool _1954 = uint(_1948) >= uint(_1518);
    float _1956 = sqrt(_1942);
    int _1958 = int(_1840) + int(_1924);
    int _1960 = _1870 * _1958;
    int _1962 = _1960 + _1768;
    float _1964 = fma(_1356, _1692, _1926);
    bool _1966 = !_1954;
    int _1968 = _1966 ? 0 : (-1);
    float _1970 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1972 = uint(_1962) >= uint(_1628);
    int _1974 = _1748 ^ _1518;
    int _1976 = ~_1928;
    int _1978 = _1976 + _1968;
    int _1980 = _1978 + 1;
    bool _1982 = _1956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1984 = !_1972;
    int _1986 = _1984 ? 0 : (-1);
    int _1988 = _1518 * _1980;
    int _1990 = _1988 + _1748;
    uint _1992 = uint(int(uint(_1974) >> uint(31)));
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1996 = ~_1986;
    int _1998 = _1958 + _1996;
    int _2000 = _1998 + 1;
    int _2002 = ~int(_1992);
    int _2004 = _2002 + 1;
    float _2006 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2008 = _1518 == 0;
    int _2010 = _2000 ^ _2004;
    float _2012 = _1446 + _2006;
    float _2014 = _1900;
    float _2016 = as_type<float>(_2004);
    float _2018 = _2006;
    float _2020 = _1930;
    float _2022 = _1722;
    if (!_1982)
    {
        _2014 = _1932;
    }
    float _2024 = _2014;
    bool _2026 = !_2008;
    float _2028 = _2026 ? as_type<float>(_1990) : as_type<float>(0xffffffffu /* nan */);
    int _2030 = ~_2004;
    int _2032 = _2030 + _2010;
    int _2034 = _2032 + 1;
    float _2036 = _2028;
    float _2038 = _2024;
    if (!_1982)
    {
        _2016 = _1930;
    }
    float _2040 = _2016;
    float _2042 = float(as_type<int>(_2028));
    float _2044 = _2040;
    if (!_1982)
    {
        _2018 = _1902;
    }
    float _2046 = _2018;
    float _2048 = _2046;
    if (!_1982)
    {
        _2020 = _1906;
    }
    float _2050 = _2020;
    float _2052 = _2050;
    if (!_1982)
    {
        _2036 = _2012;
    }
    float _2054 = _2036;
    bool _2056 = !_1982;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _1956 + _2062;
        float _2066 = rsqrt(_1942);
        float _2068 = _2064 * _2060;
        float _2070 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2072 = _2068 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        float _2082 = fma(_2076, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2084 = _2066 * _2082;
        float _2086 = fma(_1912, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2088 = _2080 + (-1.0);
        float _2090 = fma(_1918, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2094 = _2086 + _2092;
        float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2100 = _2090 + _2098;
        float _2102 = _2094 * _2094;
        float _2104 = fma(_2012, _2080, _2096);
        float _2106 = _2100 * _2100;
        _2058 = _2104;
        _2044 = _2102;
        _2038 = _2106;
        _2048 = _2086;
        _2052 = _2090;
    }
    float _2108 = _2058;
    float _2110 = _2044;
    float _2112 = _2038;
    float _2114 = _2048;
    float _2116 = _2052;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2120 = _2108 + _2118;
    bool _2122 = !_1738;
    int _2124 = _2122 ? _2034 : (-1);
    float _2126 = fma(_1970, _2042, _1374);
    float _2128 = _1714 + 0.5;
    float _2130 = fma(_2120, _2120, _2110);
    float _2132 = float(_2124);
    float _2134 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = fma(_1360, _1692, _1938);
    float _2138 = _2130 + _2112;
    float _2140 = fma(_1970, _2128, _2126);
    float _2142 = -_743;
    float _2144 = fma(_2134, _2132, _2142);
    float _2146 = -_1416;
    float _2148 = _2146 + 1.0;
    float _2150 = _1722 + (-0.5);
    float _2152 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1952);
    float _2154 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1964);
    float _2156 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].z, _2136);
    float _2158 = sqrt(_2138);
    float _2160 = -_2134;
    float _2162 = fma(_2160, _2150, _2144);
    float _2164 = -_2148;
    float _2166 = fma(_1714, _2164, _2140);
    float _2168 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2170 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2172 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2174 = -_1436;
    float _2176 = _2174 + 1.0;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2186 = fma(_1722, _2176, _2162);
    out.m_64.x = _2180;
    out.m_64.y = _2182;
    out.m_64.z = _2184;
    out.m_64.w = _2178;
    bool _2188 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2190 = isnan(_2158);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2196 = _2192 || _2194;
    out.m_66.x = _2166;
    out.m_66.y = _2186;
    float _2198 = _2180;
    float _2200 = _2182;
    if (!_2196)
    {
        _2022 = 1.0;
    }
    float _2202 = _2022;
    bool _2204 = !_2196;
    float _2206 = _2202;
    if (!_2204)
    {
        bool _2208 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2210 = isnan(_2158);
        bool _2212 = _2208 || _2210;
        bool _2214 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2216 = _2212 || _2214;
        if (!_2216)
        {
            float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2220 = _2158 + _2218;
            float _2222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2224 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2230 = 1.0 / _2224;
            float _2232 = _2220 * _2230;
            float _2234 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2206 = _2234;
            _2198 = _2228;
            _2236 = true;
        }
        else
        {
            bool _2238 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2240 = isnan(_2158);
            bool _2242 = _2238 || _2240;
            bool _2244 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2246 = _2242 || _2244;
            if (!_2246)
            {
                float _2248 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2250 = _2158 + _2248;
                float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2254 = _2252 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2258 = _2256 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2260 = 1.0 / _2254;
                float _2262 = _2250 * _2260;
                float _2264 = fma(_2262, _2258, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2206 = _2264;
                _2198 = _2258;
                _2236 = true;
            }
            else
            {
                _2206 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2236 = false;
    float _2266 = _2206;
    float _2268 = _2198;
    float _2270 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2272 = _2108 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2276 = _2114 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2280 = _2116 + _2278;
    float _2282 = fma(_2272, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2284 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2286 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2288 = -_1446;
    float _2290 = _2288 + _2282;
    float _2292 = -_1378;
    float _2294 = _2292 + _2284;
    float _2296 = -_1442;
    float _2298 = _2296 + _2286;
    float _2300 = _2290 * _2290;
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = fma(_2298, _2298, _2302);
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > 0.0;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2290;
    if (!_2308)
    {
        _2320 = _2284;
    }
    float _2326 = _2320;
    float _2328 = _2326;
    if (!_2308)
    {
        _2200 = _2282;
    }
    float _2330 = _2200;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2308)
    {
        _2322 = _2286;
    }
    float _2336 = _2322;
    bool _2338 = !_2308;
    float _2340 = _2336;
    float _2342 = _2336;
    if (!_2338)
    {
        float _2344 = _251 * _251;
        float _2346 = rsqrt(_2304);
        float _2348 = fma(_247, _247, _2344);
        float _2350 = fma(_253, _253, _2348);
        float _2352 = sqrt(_2350);
        float _2354 = _2294 * _2346;
        float _2356 = _2290 * _2346;
        float _2358 = _2298 * _2346;
        bool _2360 = _2352 > 0.0;
        float _2362 = _2352;
        _2324 = _2356;
        if (!_2360)
        {
            _2362 = _2284;
        }
        float _2364 = _2362;
        _2328 = _2364;
        if (!_2360)
        {
            _2332 = _2282;
        }
        float _2366 = _2332;
        _2334 = _2366;
        if (!_2360)
        {
            _2340 = _2286;
        }
        float _2368 = _2340;
        bool _2370 = !_2360;
        _2342 = _2368;
        if (!_2370)
        {
            float _2372 = rsqrt(_2350);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _251 * _2372;
            float _2378 = _247 * _2372;
            float _2380 = _2356 * _2376;
            float _2382 = _253 * _2372;
            float _2384 = fma(_2354, _2378, _2380);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2358, _2382, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_247, _2390, _2284);
            float _2394 = fma(_251, _2390, _2282);
            float _2396 = fma(_253, _2390, _2286);
            _2328 = _2392;
            _2334 = _2394;
            _2342 = _2396;
        }
    }
    float _2398 = _2328;
    float _2400 = _2334;
    float _2402 = _2342;
    float _2404 = _2324;
    float _2406 = _2400;
    float _2408 = _2398;
    float _2410 = _2402;
    float _2412 = _2404;
    if (!_2318)
    {
        float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2416 = _1446 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2420 = _1378 + _2418;
        float _2422 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2416 * _2416;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2428 = _1442 + _2426;
        float _2430 = fma(_2420, _2420, _2424);
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2434 = fma(_2428, _2428, _2430);
        float _2436 = sqrt(_2434);
        float _2438 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2440 = precise::min(_2436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2442 = _2440 * _2432;
        float _2444 = -_1378;
        float _2446 = _2444 + _2398;
        float _2448 = _2438 * _2442;
        float _2450 = -_1446;
        float _2452 = _2450 + _2400;
        float _2454 = -_1442;
        float _2456 = _2454 + _2402;
        float _2458 = fma(_2446, _2448, _1378);
        float _2460 = fma(_2452, _2448, _1446);
        float _2462 = fma(_2456, _2448, _1442);
        _2406 = _2460;
        _2408 = _2458;
        _2410 = _2462;
        _261 = _2448;
    }
    float _2464 = _2406;
    float _2466 = _2408;
    float _2468 = _2410;
    float _2470 = _261;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2474 = _2464 + _2472;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2478 = _2466 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2468 + _2480;
    float _2484 = _2474 * _2474;
    float _2486 = fma(_2478, _2478, _2484);
    float _2488 = fma(_2482, _2482, _2486);
    float _2490 = rsqrt(_2488);
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2494 = _2478 * _2492;
    float _2496 = _2482 * _2492;
    float _2498 = _2494 * _2494;
    float _2500 = _2496 * _2496;
    float _2502 = _2498 + _2500;
    float _2504 = sqrt(_2502);
    bool _2506 = _2504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2510 = _2504 + _2508;
    float _2512 = _2490;
    float _2514 = _2470;
    float _2516 = _2510;
    float _2518 = _2474;
    float _2520 = _2492;
    float _2522 = _2494;
    if (_2506)
    {
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2524;
    }
    float _2526 = _2512;
    if (_2506)
    {
        float _2528 = rsqrt(_2502);
        _2514 = _2528;
    }
    float _2530 = _2514;
    float _2532 = _2530;
    if (_2506)
    {
        float _2534 = _2510 * _2526;
        _2516 = _2534;
    }
    float _2536 = _2516;
    if (_2506)
    {
        float _2538 = _2536 * 0.15915493667125701904296875;
        _263 = _2538;
    }
    float _2540 = _263;
    float _2542 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2544 = _2526;
    if (_2506)
    {
        float _2546 = _2540 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        _2544 = _2548;
    }
    float _2550 = _2544;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2554 = precise::max(0.0, _2552);
    float _2556 = _2482;
    float _2558 = _2554;
    if (_2506)
    {
        float _2560 = _2540 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        _2556 = _2562;
    }
    float _2564 = _2556;
    float _2566 = -_2492;
    float _2568 = -_2554;
    float _2570 = fma(_2474, _2566, _2568);
    if (!_2506)
    {
        _2518 = _2498;
    }
    float _2572 = _2518;
    float _2574 = _2572;
    if (_2506)
    {
        float _2576 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = sqrt(_2488);
    float _2582 = _2550;
    float _2584 = _2578;
    if (_2506)
    {
        float _2586 = fma(_2550, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2582 = _2586;
    }
    float _2588 = _2582;
    float _2590 = _2588;
    if (_2506)
    {
        float _2592 = _2564 + (-1.0);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = _2594;
    if (_2506)
    {
        float _2598 = _2530 * _2588;
        _2412 = _2598;
    }
    float _2600 = _2412;
    if (!_2506)
    {
        _2532 = _2570;
    }
    float _2602 = _2532;
    float _2604 = _2602;
    if (_2506)
    {
        float _2606 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2606;
    }
    float _2608 = _2520;
    if (_2506)
    {
        float _2610 = _2494 * _2600;
        _2522 = _2610;
    }
    float _2612 = _2522;
    if (!_2506)
    {
        _2590 = _2496;
    }
    float _2614 = _2590;
    float _2616 = _2614;
    if (_2506)
    {
        float _2618 = _2496 * _2600;
        _2616 = _2618;
    }
    float _2620 = _2616;
    if (_2506)
    {
        float _2622 = fma(_2570, _2564, _2608);
        _2604 = _2622;
    }
    float _2624 = _2604;
    if (_2506)
    {
        float _2626 = _2612 * _2612;
        _2574 = _2626;
    }
    float _2628 = _2574;
    if (!_2506)
    {
        _2596 = _2500;
    }
    float _2630 = _2596;
    float _2632 = _2630;
    if (_2506)
    {
        float _2634 = _2620 * _2620;
        _2632 = _2634;
    }
    float _2636 = _2632;
    float _2638 = fma(_2624, _2624, _2628);
    float _2640 = _2638 + _2636;
    float _2642 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = rsqrt(_2640);
    float _2652 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2642);
    float _2654 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2662 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2654);
    float _2666 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2668 = abs(_2658);
    float _2670 = log2(_2668);
    float _2672 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2664);
    float _2676 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2666);
    float _2678 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2684 = _2650 * _2612;
    float _2686 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2688 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2650 * _2624;
    float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2700 = _2650 * _2620;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2542, 1.0);
    float _2712 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2714 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2716 = -_2700;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2720 = exp2(_2706);
    float _2722 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2714);
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2730 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2732 = log2(_2710);
    float _2734 = fma(_2718, 0.5, 0.5);
    float _2736 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2728);
    float _2738 = _2692 + 1.0;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2730);
    float _2742 = fma(_2734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2736);
    float _2746 = 1.0 / _2724;
    float _2748 = -_2692;
    float _2750 = fma(_2720, _2738, _2748);
    float _2752 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2754 = fma(_2734, _2742, -0.212114393711090087890625);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2744);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = fma(_2734, _2754, 1.570728778839111328125);
    float _2762 = sqrt(_2726);
    float _2764 = _2732 * 0.693147182464599609375;
    float _2766 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = _2752 * _2746;
    float _2770 = _2756 * _2746;
    float _2772 = fma(_2768, 0.5, 0.5);
    float _2774 = fma(_2770, -0.5, 0.5);
    float _2776 = _2762 * 0.636619746685028076171875;
    float3 _7011 = float3(_2772, _2774, _2766);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7011, float3(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7011, float3(0.0), isnan(_7011)), level(0.0)).x;
    float3 _7022 = float3(_2772, _2774, _2766);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7022, float3(0.0), isnan(_7022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7022, float3(0.0), isnan(_7022)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float _2791 = -_2760;
    float _2793 = fma(_2776, _2791, 1.0);
    float2 _7044 = float2(_2793, _2758);
    float3 _2797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7044, float2(0.0), isnan(_7044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7044, float2(0.0), isnan(_7044)), level(0.0)).xyz;
    float _2799 = _2797.x;
    float _2801 = _2797.y;
    float _2803 = _2797.z;
    float _2805 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2809 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2811 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2807);
    float _2813 = exp2(_2805);
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2817 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2811);
    float _2819 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2817);
    out.m_47.x = _2815;
    float _2821 = _2819 + _2724;
    out.gl_Position.x = _2752;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2819;
    out.gl_Position.w = _2724;
    float _2823 = _2821 * 0.5;
    float _2825 = -_2813;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2823;
    out.m_68.w = _2724;
    float _2831 = _2829 * _2778;
    float _2833 = -_2829;
    float _2835 = _2833 + 1.0;
    float _2837 = _2789 * _2831;
    float _2839 = _2803 * _2831;
    float _2841 = fma(_2799, _2837, _2783);
    float _2843 = fma(_2801, _2837, _2785);
    float _2845 = _2789 * _2835;
    float _2847 = fma(_2789, _2839, _2787);
    out.m_70.x = _2841;
    out.m_70.y = _2843;
    out.m_70.z = _2847;
    out.m_70.w = _2845;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2236 = false;
    bool _673 = false;
    bool _427 = false;
    bool _281 = false;
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
        float _2904 = as_type<float>(_105);
        out.gl_Position.z = _2904;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2973 = as_type<float>(_143);
        out.gl_Position.z = _2973;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = in.m_53.x;
    float _153 = in.m_53.y;
    float _155 = in.m_53.z;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _149 * _147;
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = _163 * 6.283185482025146484375;
    float _167 = floor(_163);
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _171 = _169 != 0;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _175 = _173 != 0;
    float _177 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _165 * 0.15915493667125701904296875;
    float _181 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _191 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = _179 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    int _199 = abs(_187);
    bool _201 = !_159;
    int _203 = _201 ? 0 : 1;
    float _205 = -_167;
    float _207 = _163 + _205;
    bool _209 = !_175;
    int _211 = _209 ? 0 : 1;
    int _213 = abs(_203);
    float _215 = -_207;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_199);
    bool _221 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _223 = abs(_211);
    float _225 = fma(_195, 0.5, 0.5);
    float _227 = abs(_217);
    float _229 = _219 * _227;
    bool _231 = _207 < 0.5;
    float _233 = float(_231);
    float _235 = -_225;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_213);
    float _241 = -_233;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _249 = fma(_239, _237, _229);
    float _251 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _253 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    float _255 = abs(_243);
    float _257 = fma(_245, _255, _249);
    bool _259 = !_221;
    float _261 = _247;
    float _263 = _253;
    float _279;
    if (!_259)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_89);
        float _285 = 1.0 / _283;
        float _287 = _123 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    bool _307 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_289);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _321;
    bool _333 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_289);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = _317 * _329;
    float _347 = -_317;
    float _349 = _347 + 1.0;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _353 = _343 * _349;
    float _355 = 1.0 / _325;
    float _357 = -_343;
    float _359 = _357 + 1.0;
    float _361 = _293 * _331;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _289 + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_369, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = fma(_373, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _379 = _365 * _355;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _385 = _375 * _353;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = _377 * _353;
    float _393 = fma(_383, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].x, _385);
    float _397 = fma(_389, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[143].y, _391);
    float _401 = fma(_393, _345, _395);
    float _403 = fma(_397, _345, _399);
    float _405 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _403);
    bool _409 = !_351;
    float _425;
    if (!_409)
    {
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_89);
        float _431 = 1.0 / _429;
        float _433 = _123 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _443 = _435 + _441;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _447 = _435 + _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _457;
    float _461 = 1.0 / _451;
    bool _463 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_435);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = 1.0 / _459;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _479 = 1.0 / _455;
    float _481 = _439 * _461;
    bool _483 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _485 = isnan(_435);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _495;
    float _499 = fma(_497, _481, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _501 = _443 * _475;
    bool _503 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _505 = isnan(_435);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_493;
    float _517 = _515 + 1.0;
    float _519 = -_513;
    float _521 = _519 + 1.0;
    float _523 = _513 * _517;
    float _525 = _447 * _479;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _539 = _473 * _521;
    float _541 = fma(_529, _481, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _543 = fma(_533, _481, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _545 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _547 = isnan(_435);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_473;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _569 = fma(_537, _525, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = _555 * _559;
    float _573 = fma(_563, _525, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _575 = fma(_567, _525, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _577 = _499 * _571;
    float _579 = _541 * _571;
    float _581 = -_555;
    float _583 = _581 + 1.0;
    float _585 = _543 * _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _591;
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].x, _577);
    float _597 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].y, _579);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[107].z, _585);
    float _605 = fma(_589, _501, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _607 = fma(_573, _539, _595);
    float _609 = fma(_593, _501, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _611 = fma(_601, _501, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _613 = fma(_569, _539, _597);
    float _615 = fma(_575, _539, _603);
    float _617 = fma(_605, _523, _607);
    float _619 = in.m_55.x;
    float _621 = in.m_55.y;
    float _623 = fma(_609, _523, _613);
    float _625 = fma(_611, _523, _615);
    float _627 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].x, _617);
    float _629 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].y, _623);
    float _631 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[110].z, _625);
    float _633 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _641;
    out.m_57.y = _643;
    out.m_57.z = _645;
    out.m_57.w = _639;
    float _647 = _407 * _621;
    float _649 = _405 * _619;
    bool _651 = !_477;
    float _669;
    float _671;
    if (!_651)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _659 = _657 * _653;
        float _661 = float(_89);
        float _663 = floor(_659);
        float _665 = -_663;
        float _667 = _659 + _665;
        _669 = _667;
        _671 = _661;
        _673 = true;
    }
    else
    {
        float _675 = float(_89);
        float _677 = 1.0 / _675;
        float _679 = _123 * _677;
        _669 = _679;
        _671 = _675;
    }
    _673 = false;
    float _681 = _669;
    float _683 = _671;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _687 = int(_685);
    float _689 = in.m_51.y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _681 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = _681 + _695;
    float _699 = as_type<float>(int(gl_VertexIndex));
    float _701 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _703 = int(_701);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _707 = in.m_51.z;
    float _709 = 1.0 / _683;
    float _711 = float(_687);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _713;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _717;
    float _721 = 1.0 / _711;
    float _723 = float(uint(_703));
    float _725 = _689 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _727 = ~_703;
    int _729 = _727 + 1;
    int _731 = ~_703;
    int _733 = _731 + 1;
    float _735 = fma(_725, -2.0, _705);
    bool _737 = _703 == 0;
    float _739 = 1.0 / _723;
    float _741 = _145 + _707;
    float _743 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _735);
    float _745 = _741 + (-1.0);
    float _747 = _721 * _123;
    float _749 = trunc(_747);
    int _751 = int(_749);
    int _753 = as_type<int>(_739) + (-2);
    float _755 = float(uint(_751));
    float _757 = as_type<float>(_753) * _755;
    float _759 = trunc(_757);
    float _761 = precise::max(_759, 0.0);
    uint _764 = uint(_761);
    float _766 = float(_703);
    int _768 = _729 * int(_764);
    int _770 = _768 + _751;
    float _772 = float(uint(_770));
    float _774 = as_type<float>(_753) * _772;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _778 = _776 != 0;
    float _780 = trunc(_774);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    bool _786 = !_778;
    float _788 = _786 ? 7.345489978790283203125 : 1.0;
    float _790 = _788 * _145;
    float _792 = floor(_790);
    int _794 = int(_764) + int(_784);
    float _796 = float(_751);
    int _798 = _733 * _794;
    int _800 = _798 + _751;
    bool _802 = _796 >= _766;
    bool _804 = isnan(_796);
    bool _806 = _802 || _804;
    bool _808 = isnan(_766);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    bool _814 = uint(_800) >= uint(_703);
    float _816 = trunc(_812);
    int _818 = int(_816);
    float _820 = -_792;
    float _822 = _790 + _820;
    bool _824 = !_814;
    int _826 = _824 ? 0 : (-1);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    int _840 = ~_794;
    int _842 = _840 + _826;
    int _844 = _842 + 1;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _848 = _846 != 0;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = _703 * _844;
    int _856 = _854 + _751;
    bool _858 = !_737;
    int _860 = _858 ? _856 : (-1);
    float _862 = _822 * _766;
    int _864 = ~_818;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    float _870 = _766 * _123;
    bool _872 = !_848;
    int _874 = _872 ? 0 : 1;
    float _876 = trunc(_862);
    int _878 = int(_876);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    int _884 = _860 * _868;
    float _886 = _870 * _709;
    int _888 = _703 + (-1);
    int _890 = abs(_874);
    int _892 = _818 * _888;
    int _894 = _892 + _884;
    float _896 = trunc(_886);
    int _898 = int(_896);
    bool _900 = !_834;
    int _902 = _900 ? 0 : 1;
    int _904 = abs(_852);
    int _906 = abs(_902);
    int _908 = _878 * _890;
    int _910 = _908 + _751;
    bool _912 = !_838;
    int _914 = _912 ? 0 : 1;
    bool _916 = !_882;
    int _918 = _916 ? 0 : 1;
    int _920 = _894 * _906;
    int _922 = abs(_914);
    int _924 = abs(_918);
    int _926 = _898 * _904;
    int _928 = _926 + _920;
    int _930 = ~_703;
    int _932 = _930 + 1;
    int _934 = _910 * _922;
    int _936 = _934 + _928;
    float _938 = float(uint(_910));
    int _940 = _878 * _924;
    int _942 = _940 + _936;
    float _944 = as_type<float>(_753) * _938;
    float _946 = float(uint(_942));
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = trunc(_944);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    float _956 = as_type<float>(_753) * _946;
    float _958 = trunc(_956);
    float _960 = precise::max(_958, 0.0);
    uint _962 = uint(_960);
    int _964 = ~_703;
    int _966 = _964 + 1;
    int _968 = _932 * int(_962);
    int _970 = _968 + _942;
    float _972 = float(uint(_970));
    float _974 = as_type<float>(_753) * _972;
    float _976 = trunc(_974);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    int _982 = int(_962) + int(_980);
    int _984 = _966 * _982;
    int _986 = _984 + _942;
    float _988 = _145 * 2.0;
    bool _990 = uint(_986) >= uint(_703);
    int _992 = ~_703;
    int _994 = _992 + 1;
    float _996 = floor(_988);
    bool _998 = !_990;
    int _1000 = _998 ? 0 : (-1);
    int _1002 = _994 * int(_954);
    int _1004 = _1002 + _910;
    int _1006 = ~_982;
    int _1008 = _1006 + _1000;
    int _1010 = _1008 + 1;
    float _1012 = _689 * 2.0;
    float _1014 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1016 = log2(_1014);
    float _1018 = float(uint(_1004));
    int _1020 = _703 * _1010;
    int _1022 = _1020 + _942;
    float _1024 = as_type<float>(_753) * _1018;
    bool _1026 = !_737;
    int _1028 = _1026 ? _1022 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _996 > 0.0;
    int _1034 = _1028 & 3;
    bool _1036 = _1034 != 0;
    int _1038 = _1028 & 3;
    bool _1040 = _1038 != 0;
    int _1042 = _1036 ? 0 : 1;
    float _1044 = _1016 * _123;
    bool _1046 = uint(_1038) > 1u;
    float _1048 = trunc(_1024);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = _1038 != 3;
    bool _1056 = _996 >= 0.0;
    bool _1058 = isnan(_996);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    bool _1066 = uint(_1038) >= 2u;
    int _1068 = _1064 ? 0 : 1;
    float _1070 = exp2(_1044);
    int _1072 = _1066 ? 0 : 1;
    bool _1074 = _1030 >= 0.0;
    bool _1076 = isnan(_1030);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    bool _1084 = _1030 > 0.0;
    int _1086 = ~_1042;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    int _1092 = ~_1072;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1082 ? 0 : 1;
    int _1100 = _1090;
    int _1102 = _1096;
    if (!_1046)
    {
        int _1104 = ~_1042;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    if (_1054)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1102 = _1112;
    }
    int _1114 = _1102;
    float _1116 = -_1070;
    float _1118 = _1116 + 1.0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1126 = _1124 != 0;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_44.x;
    float _1134 = in.m_44.y;
    float _1136 = in.m_44.z;
    int _1138 = ~_1068;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    int _1144 = _1142;
    if (!_1032)
    {
        int _1146 = ~_1068;
        int _1148 = _1146 + 1;
        _1144 = _1148;
    }
    int _1150 = _1144;
    int _1152 = int(_954) + int(_1052);
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1156 = _1154 != 0;
    int _1158 = ~_703;
    int _1160 = _1158 + 1;
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : 1;
    int _1166 = _1160 * _1152;
    int _1168 = _1166 + _910;
    bool _1170 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1172 = isnan(0.0);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1178 = _1174 || _1176;
    int _1180 = ~_1098;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = _1184;
    if (!_1084)
    {
        int _1188 = ~_1098;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1194;
    float _1198 = _1178 ? _1118 : 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1204 = uint(_1168) >= uint(_703);
    float _1206 = 1.0 / _1196;
    float _1208 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1210 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1212 = !_1204;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1218 = as_type<int>(_699) & 1;
    bool _1220 = _1218 != 0;
    int _1222 = as_type<int>(_699) & 2;
    bool _1224 = _1222 != 0;
    float _1226 = _707 * 2.0;
    bool _1228 = !_1126;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = 1.0 / _1202;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1234;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1240 = -_948;
    float _1242 = fma(_1216, 2.0, _1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1246 = _681 + _1244;
    bool _1248 = !_1130;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1238);
    float _1254 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1210);
    float _1256 = 1.0 / _1236;
    float _1258 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1208);
    float _1260 = _145 + _689;
    float _1262 = _697 * _1206;
    float _1264 = _1260 + (-1.0);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1266;
    float _1270 = floor(_1226);
    float _1272 = _693 * _1232;
    float _1274 = _689 + _707;
    float _1276 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _1274 + (-1.0);
    int _1280 = abs(_1250);
    float _1282 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = _1246 * _1256;
    bool _1286 = !_1122;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1292;
    float _1296 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1254);
    float _1298 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    bool _1300 = _1270 >= 0.0;
    bool _1302 = isnan(_1270);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _1316 = _1308 ? 0 : 1;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1322 = _1270 > 0.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = fma(_1320, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1334 = ~_1316;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1326, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1342 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1344 = fma(_1314, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1346;
    int _1350 = _1028 >> 31;
    float _1352 = fma(_1330, _1272, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1354 = fma(_715, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1356 = fma(_1348, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1358 = _1350 & 3;
    float _1360 = fma(_719, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1362 = _1338;
    if (!_1322)
    {
        int _1364 = ~_1316;
        int _1366 = _1364 + 1;
        _1362 = _1366;
    }
    int _1368 = _1362;
    float _1370 = fma(_1136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1258);
    float _1372 = -_123;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    int _1376 = _1028 + _1358;
    float _1378 = _1298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1382 = _1376 >> 2;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1386 = 1.0 + _1384;
    bool _1388 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1390 = isnan(1.0);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1396 = _1392 || _1394;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1400 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1380);
    int _1402 = _1382 << 4;
    int _1404 = _1402 + 368;
    float _1406 = in.m_62.x;
    float _1408 = in.m_62.y;
    float _1410 = in.m_62.z;
    int _1412 = abs(_1230);
    float _1414 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1398);
    float _1416 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1400);
    uint _1418 = uint(int(uint(_1404) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[int(_1428)][_1430];
    int _1434 = abs(_1288);
    float _1436 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1414);
    float _1438 = float(_1192);
    float _1440 = 1.0 / _1386;
    float _1442 = _1296 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1444 = float(_1150);
    float _1446 = _1370 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1448 = float(_1412);
    float _1450 = float(_1280);
    float _1452 = float(_1434);
    float _1454 = _1448 * _1444;
    float _1456 = float(_1368);
    float _1458 = _1450 * _1438;
    int _1460 = abs(_1164);
    int _1462 = _1404 + 8;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    uint _1466 = uint(int(uint(int(_1464)) >> uint(2)));
    int _1468 = int(_1464) & 3;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[int(_1466)][_1468];
    int _1472 = int(_1464) + 1;
    uint _1474 = uint(int(uint(_1472) >> uint(2)));
    int _1476 = _1472 & 3;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[int(_1474)][_1476];
    int _1480 = ~_1152;
    int _1482 = _1480 + _1214;
    int _1484 = _1482 + 1;
    float _1486 = _1452 * _1456;
    if (_1396)
    {
        float _1488 = _1198 * _1440;
        _127 = _1488;
    }
    float _1490 = _127;
    float _1492 = _1454 * (-2.0);
    bool _1494 = !_1040;
    int _1496 = _1494 ? 0 : 1;
    float _1498 = _1486 * (-2.0);
    bool _1500 = _1038 != 3;
    float _1502 = fma(_1492, _1408, _1408);
    float _1504 = fma(_1290, _1492, _1290);
    float _1506 = fma(_1276, _1498, _1276);
    float _1508 = fma(_1498, _1406, _1406);
    float _1510 = _1458 * (-2.0);
    bool _1512 = !_1500;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1518 = int(_1516);
    bool _1520 = _145 > 0.5;
    float _1522 = fma(_1282, _1510, _1282);
    int _1524 = abs(_1108);
    float _1526 = _145 + (-0.5);
    float _1528 = fma(_1510, _1410, _1410);
    bool _1530 = _689 > 0.5;
    float _1532 = _689 + (-0.5);
    int _1534 = ~_1524;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    int _1542 = abs(_1496);
    float _1544 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1502);
    float _1546 = _707 + (-0.5);
    int _1548 = abs(_1114);
    float _1550 = fma(_1506, _1490, _1540);
    int _1552 = abs(_1514);
    int _1554 = _1538 * as_type<int>(_1432);
    float _1556 = fma(_1504, _1490, _1544);
    int _1558 = ~_1548;
    int _1560 = _1558 + 1;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1528);
    int _1566 = ~_1542;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = _1556 * 0.15915493667125701904296875;
    int _1574 = ~_1460;
    int _1576 = _1574 + 1;
    int _1578 = _1576 + 1;
    float _1580 = fma(_1522, _1490, _1564);
    bool _1582 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1584 = isnan(_681);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    int _1594 = _1570 * as_type<int>(_1424);
    int _1596 = _1594 + _1554;
    int _1598 = ~_1552;
    int _1600 = _1598 + 1;
    int _1602 = _1600 + 1;
    int _1604 = _703 * _1484;
    int _1606 = _1604 + _910;
    float _1608 = float(uint(_1518));
    float _1610 = _1572 * 6.283185482025146484375;
    float _1612 = sin(_1610);
    bool _1614 = !_1220;
    float _1616 = _1614 ? (-0.5) : 0.5;
    float _1618 = _1550 * 0.15915493667125701904296875;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1622 = _1620 != 0;
    int _1624 = _1562 * as_type<int>(_1470);
    int _1626 = _1624 + _1596;
    int _1628 = abs(_1518);
    float _1630 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1632 = !_1224;
    float _1634 = _1632 ? (-0.5) : 0.5;
    int _1636 = _1602 * as_type<int>(_1478);
    int _1638 = _1636 + _1626;
    bool _1640 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1642 = isnan(_681);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = 1.0 / _1608;
    float _1654 = float(uint(_1628));
    int _1656 = _1638 * _1578;
    bool _1658 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_681);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = -_1592;
    float _1672 = _1670 + 1.0;
    float _1674 = -_1634;
    int _1676 = _1530 ? as_type<int>(_1674) : as_type<int>(_1634);
    float _1678 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1680 = _681 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1682 = isnan(_681);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1668 * _1672;
    float _1694 = -_1668;
    float _1696 = _1694 + 1.0;
    float _1698 = -_1616;
    int _1700 = _1520 ? as_type<int>(_1698) : as_type<int>(_1616);
    float _1702 = _1572 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1708 = _1706 != 0;
    float _1710 = _1650 * _1696;
    bool _1712 = !_1622;
    float _1714 = _1712 ? _1616 : as_type<float>(_1700);
    float _1716 = -_1650;
    float _1718 = _1716 + 1.0;
    bool _1720 = !_1708;
    float _1722 = _1720 ? _1634 : as_type<float>(_1676);
    int _1724 = as_type<int>(_1652) + (-2);
    float _1726 = 1.0 / _1654;
    float _1728 = _1580 * 0.15915493667125701904296875;
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1616);
    bool _1732 = !_737;
    int _1734 = _1732 ? _1606 : (-1);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1634);
    bool _1738 = _1518 == 0;
    float _1740 = _1630 * _1730;
    float _1742 = _1618 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    int _1746 = _1734 * _1460;
    int _1748 = _1746 + _1656;
    float _1750 = _1678 * _1736;
    float _1752 = _1690 * _1718;
    float _1754 = -_1690;
    float _1756 = _1754 + 1.0;
    float _1758 = float(uint(_1748));
    float _1760 = _1310 * _1752;
    float _1762 = _1618 * 6.283185482025146484375;
    float _1764 = cos(_1762);
    float _1766 = _1340 * _1752;
    int _1768 = abs(_1748);
    float _1770 = as_type<float>(_1724) * _1758;
    int _1772 = as_type<int>(_1726) + (-2);
    float _1774 = _1342 * _1752;
    float _1776 = float(uint(_1768));
    float _1778 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1760);
    float _1780 = _1728 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1744 * _1704;
    int _1786 = ~_1518;
    int _1788 = _1786 + 1;
    float _1790 = as_type<float>(_1772) * _1776;
    float _1792 = _1728 * 6.283185482025146484375;
    float _1794 = cos(_1792);
    float _1796 = _1764 * _1612;
    float _1798 = _1764 * _1704;
    float _1800 = trunc(_1770);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    float _1806 = -_1796;
    float _1808 = fma(_1782, _1784, _1806);
    float _1810 = -_1784;
    float _1812 = fma(_1782, _1796, _1810);
    float _1814 = _1744 * _1612;
    float _1816 = _1794 * _1750;
    float _1818 = _1704 * _1794;
    float _1820 = _1612 * _1794;
    int _1822 = ~_1628;
    int _1824 = _1822 + 1;
    float _1826 = -_1750;
    float _1828 = _1782 * _1826;
    float _1830 = fma(_1782, _1798, _1814);
    float _1832 = _1764 * _1816;
    float _1834 = fma(_1782, _1814, _1798);
    float _1836 = trunc(_1790);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = _1744 * _1816;
    float _1844 = fma(_1830, _1740, _1832);
    float _1846 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1848 = _1788 * int(_1804);
    int _1850 = _1848 + _1748;
    float _1852 = fma(_1818, _1740, _1828);
    float _1854 = fma(_1808, _1740, _1842);
    float _1856 = fma(_1812, _1846, _1844);
    float _1858 = fma(_1820, _1846, _1852);
    float _1860 = float(uint(_1850));
    float _1862 = fma(_1834, _1846, _1854);
    float _1864 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1866 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1868 = ~_1628;
    int _1870 = _1868 + 1;
    float _1872 = as_type<float>(_1724) * _1860;
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1864);
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1866);
    int _1878 = _1824 * int(_1840);
    int _1880 = _1878 + _1768;
    float _1882 = trunc(_1872);
    float _1884 = precise::max(_1882, 0.0);
    uint _1886 = uint(_1884);
    float _1888 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1874);
    float _1890 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1892 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1766);
    float _1894 = float(uint(_1880));
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1898 = _1890 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1900 = _1856 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1902 = _1378 + _1896;
    float _1904 = as_type<float>(_1772) * _1894;
    float _1906 = _1442 + _1898;
    float _1908 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1774);
    float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1912 = _1902 + _1910;
    float _1914 = fma(_1344, _1710, _1778);
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1918 = _1906 + _1916;
    float _1920 = trunc(_1904);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = fma(_1332, _1710, _1892);
    int _1928 = int(_1804) + int(_1886);
    float _1930 = _1912 * _1912;
    float _1932 = _1918 * _1918;
    int _1934 = ~_1518;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1352, _1710, _1908);
    float _1940 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1900);
    float _1942 = _1930 + _1932;
    float _1944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1946 = _1936 * _1928;
    int _1948 = _1946 + _1748;
    float _1950 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _1952 = fma(_1354, _1692, _1914);
    bool _1954 = uint(_1948) >= uint(_1518);
    float _1956 = sqrt(_1942);
    int _1958 = int(_1840) + int(_1924);
    int _1960 = _1870 * _1958;
    int _1962 = _1960 + _1768;
    float _1964 = fma(_1356, _1692, _1926);
    bool _1966 = !_1954;
    int _1968 = _1966 ? 0 : (-1);
    float _1970 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1972 = uint(_1962) >= uint(_1628);
    int _1974 = _1748 ^ _1518;
    int _1976 = ~_1928;
    int _1978 = _1976 + _1968;
    int _1980 = _1978 + 1;
    bool _1982 = _1956 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1984 = !_1972;
    int _1986 = _1984 ? 0 : (-1);
    int _1988 = _1518 * _1980;
    int _1990 = _1988 + _1748;
    uint _1992 = uint(int(uint(_1974) >> uint(31)));
    float _1994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1996 = ~_1986;
    int _1998 = _1958 + _1996;
    int _2000 = _1998 + 1;
    int _2002 = ~int(_1992);
    int _2004 = _2002 + 1;
    float _2006 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2008 = _1518 == 0;
    int _2010 = _2000 ^ _2004;
    float _2012 = _1446 + _2006;
    float _2014 = _1900;
    float _2016 = as_type<float>(_2004);
    float _2018 = _2006;
    float _2020 = _1930;
    float _2022 = _1722;
    if (!_1982)
    {
        _2014 = _1932;
    }
    float _2024 = _2014;
    bool _2026 = !_2008;
    float _2028 = _2026 ? as_type<float>(_1990) : as_type<float>(0xffffffffu /* nan */);
    int _2030 = ~_2004;
    int _2032 = _2030 + _2010;
    int _2034 = _2032 + 1;
    float _2036 = _2028;
    float _2038 = _2024;
    if (!_1982)
    {
        _2016 = _1930;
    }
    float _2040 = _2016;
    float _2042 = float(as_type<int>(_2028));
    float _2044 = _2040;
    if (!_1982)
    {
        _2018 = _1902;
    }
    float _2046 = _2018;
    float _2048 = _2046;
    if (!_1982)
    {
        _2020 = _1906;
    }
    float _2050 = _2020;
    float _2052 = _2050;
    if (!_1982)
    {
        _2036 = _2012;
    }
    float _2054 = _2036;
    bool _2056 = !_1982;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _1956 + _2062;
        float _2066 = rsqrt(_1942);
        float _2068 = _2064 * _2060;
        float _2070 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2072 = _2068 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        float _2082 = fma(_2076, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2084 = _2066 * _2082;
        float _2086 = fma(_1912, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2088 = _2080 + (-1.0);
        float _2090 = fma(_1918, _2084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2092 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2094 = _2086 + _2092;
        float _2096 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2100 = _2090 + _2098;
        float _2102 = _2094 * _2094;
        float _2104 = fma(_2012, _2080, _2096);
        float _2106 = _2100 * _2100;
        _2058 = _2104;
        _2044 = _2102;
        _2038 = _2106;
        _2048 = _2086;
        _2052 = _2090;
    }
    float _2108 = _2058;
    float _2110 = _2044;
    float _2112 = _2038;
    float _2114 = _2048;
    float _2116 = _2052;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2120 = _2108 + _2118;
    bool _2122 = !_1738;
    int _2124 = _2122 ? _2034 : (-1);
    float _2126 = fma(_1970, _2042, _1374);
    float _2128 = _1714 + 0.5;
    float _2130 = fma(_2120, _2120, _2110);
    float _2132 = float(_2124);
    float _2134 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = fma(_1360, _1692, _1938);
    float _2138 = _2130 + _2112;
    float _2140 = fma(_1970, _2128, _2126);
    float _2142 = -_743;
    float _2144 = fma(_2134, _2132, _2142);
    float _2146 = -_1416;
    float _2148 = _2146 + 1.0;
    float _2150 = _1722 + (-0.5);
    float _2152 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1952);
    float _2154 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1964);
    float _2156 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[126].z, _2136);
    float _2158 = sqrt(_2138);
    float _2160 = -_2134;
    float _2162 = fma(_2160, _2150, _2144);
    float _2164 = -_2148;
    float _2166 = fma(_1714, _2164, _2140);
    float _2168 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2170 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2172 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2174 = -_1436;
    float _2176 = _2174 + 1.0;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2180 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2182 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2186 = fma(_1722, _2176, _2162);
    out.m_64.x = _2180;
    out.m_64.y = _2182;
    out.m_64.z = _2184;
    out.m_64.w = _2178;
    bool _2188 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2190 = isnan(_2158);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2196 = _2192 || _2194;
    out.m_66.x = _2166;
    out.m_66.y = _2186;
    float _2198 = _2180;
    float _2200 = _2182;
    if (!_2196)
    {
        _2022 = 1.0;
    }
    float _2202 = _2022;
    bool _2204 = !_2196;
    float _2206 = _2202;
    if (!_2204)
    {
        bool _2208 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2210 = isnan(_2158);
        bool _2212 = _2208 || _2210;
        bool _2214 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2216 = _2212 || _2214;
        if (!_2216)
        {
            float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2220 = _2158 + _2218;
            float _2222 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2224 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2222;
            float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2228 = _2226 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2230 = 1.0 / _2224;
            float _2232 = _2220 * _2230;
            float _2234 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2206 = _2234;
            _2198 = _2228;
            _2236 = true;
        }
        else
        {
            bool _2238 = _2158 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2240 = isnan(_2158);
            bool _2242 = _2238 || _2240;
            bool _2244 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2246 = _2242 || _2244;
            if (!_2246)
            {
                float _2248 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2250 = _2158 + _2248;
                float _2252 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2254 = _2252 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2256 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2258 = _2256 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2260 = 1.0 / _2254;
                float _2262 = _2250 * _2260;
                float _2264 = fma(_2262, _2258, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2206 = _2264;
                _2198 = _2258;
                _2236 = true;
            }
            else
            {
                _2206 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2236 = false;
    float _2266 = _2206;
    float _2268 = _2198;
    float _2270 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2272 = _2108 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2276 = _2114 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2280 = _2116 + _2278;
    float _2282 = fma(_2272, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2284 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2286 = fma(_2280, _2266, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2288 = -_1446;
    float _2290 = _2288 + _2282;
    float _2292 = -_1378;
    float _2294 = _2292 + _2284;
    float _2296 = -_1442;
    float _2298 = _2296 + _2286;
    float _2300 = _2290 * _2290;
    float _2302 = fma(_2294, _2294, _2300);
    float _2304 = fma(_2298, _2298, _2302);
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > 0.0;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2290;
    if (!_2308)
    {
        _2320 = _2284;
    }
    float _2326 = _2320;
    float _2328 = _2326;
    if (!_2308)
    {
        _2200 = _2282;
    }
    float _2330 = _2200;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2308)
    {
        _2322 = _2286;
    }
    float _2336 = _2322;
    bool _2338 = !_2308;
    float _2340 = _2336;
    float _2342 = _2336;
    if (!_2338)
    {
        float _2344 = _251 * _251;
        float _2346 = rsqrt(_2304);
        float _2348 = fma(_247, _247, _2344);
        float _2350 = fma(_253, _253, _2348);
        float _2352 = sqrt(_2350);
        float _2354 = _2294 * _2346;
        float _2356 = _2290 * _2346;
        float _2358 = _2298 * _2346;
        bool _2360 = _2352 > 0.0;
        float _2362 = _2352;
        _2324 = _2356;
        if (!_2360)
        {
            _2362 = _2284;
        }
        float _2364 = _2362;
        _2328 = _2364;
        if (!_2360)
        {
            _2332 = _2282;
        }
        float _2366 = _2332;
        _2334 = _2366;
        if (!_2360)
        {
            _2340 = _2286;
        }
        float _2368 = _2340;
        bool _2370 = !_2360;
        _2342 = _2368;
        if (!_2370)
        {
            float _2372 = rsqrt(_2350);
            float _2374 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2376 = _251 * _2372;
            float _2378 = _247 * _2372;
            float _2380 = _2356 * _2376;
            float _2382 = _253 * _2372;
            float _2384 = fma(_2354, _2378, _2380);
            float _2386 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2388 = fma(_2358, _2382, _2384);
            float _2390 = _2388 * _2386;
            float _2392 = fma(_247, _2390, _2284);
            float _2394 = fma(_251, _2390, _2282);
            float _2396 = fma(_253, _2390, _2286);
            _2328 = _2392;
            _2334 = _2394;
            _2342 = _2396;
        }
    }
    float _2398 = _2328;
    float _2400 = _2334;
    float _2402 = _2342;
    float _2404 = _2324;
    float _2406 = _2400;
    float _2408 = _2398;
    float _2410 = _2402;
    float _2412 = _2404;
    if (!_2318)
    {
        float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2416 = _1446 + _2414;
        float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2420 = _1378 + _2418;
        float _2422 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2416 * _2416;
        float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2428 = _1442 + _2426;
        float _2430 = fma(_2420, _2420, _2424);
        float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2434 = fma(_2428, _2428, _2430);
        float _2436 = sqrt(_2434);
        float _2438 = _2422 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2440 = precise::min(_2436, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2442 = _2440 * _2432;
        float _2444 = -_1378;
        float _2446 = _2444 + _2398;
        float _2448 = _2438 * _2442;
        float _2450 = -_1446;
        float _2452 = _2450 + _2400;
        float _2454 = -_1442;
        float _2456 = _2454 + _2402;
        float _2458 = fma(_2446, _2448, _1378);
        float _2460 = fma(_2452, _2448, _1446);
        float _2462 = fma(_2456, _2448, _1442);
        _2406 = _2460;
        _2408 = _2458;
        _2410 = _2462;
        _261 = _2448;
    }
    float _2464 = _2406;
    float _2466 = _2408;
    float _2468 = _2410;
    float _2470 = _261;
    float _2472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2474 = _2464 + _2472;
    float _2476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2478 = _2466 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2482 = _2468 + _2480;
    float _2484 = _2474 * _2474;
    float _2486 = fma(_2478, _2478, _2484);
    float _2488 = fma(_2482, _2482, _2486);
    float _2490 = rsqrt(_2488);
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2494 = _2478 * _2492;
    float _2496 = _2482 * _2492;
    float _2498 = _2494 * _2494;
    float _2500 = _2496 * _2496;
    float _2502 = _2498 + _2500;
    float _2504 = sqrt(_2502);
    bool _2506 = _2504 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2510 = _2504 + _2508;
    float _2512 = _2490;
    float _2514 = _2470;
    float _2516 = _2510;
    float _2518 = _2474;
    float _2520 = _2492;
    float _2522 = _2494;
    if (_2506)
    {
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2524;
    }
    float _2526 = _2512;
    if (_2506)
    {
        float _2528 = rsqrt(_2502);
        _2514 = _2528;
    }
    float _2530 = _2514;
    float _2532 = _2530;
    if (_2506)
    {
        float _2534 = _2510 * _2526;
        _2516 = _2534;
    }
    float _2536 = _2516;
    if (_2506)
    {
        float _2538 = _2536 * 0.15915493667125701904296875;
        _263 = _2538;
    }
    float _2540 = _263;
    float _2542 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2544 = _2526;
    if (_2506)
    {
        float _2546 = _2540 * 6.283185482025146484375;
        float _2548 = sin(_2546);
        _2544 = _2548;
    }
    float _2550 = _2544;
    float _2552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2554 = precise::max(0.0, _2552);
    float _2556 = _2482;
    float _2558 = _2554;
    if (_2506)
    {
        float _2560 = _2540 * 6.283185482025146484375;
        float _2562 = cos(_2560);
        _2556 = _2562;
    }
    float _2564 = _2556;
    float _2566 = -_2492;
    float _2568 = -_2554;
    float _2570 = fma(_2474, _2566, _2568);
    if (!_2506)
    {
        _2518 = _2498;
    }
    float _2572 = _2518;
    float _2574 = _2572;
    if (_2506)
    {
        float _2576 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2558 = _2576;
    }
    float _2578 = _2558;
    float _2580 = sqrt(_2488);
    float _2582 = _2550;
    float _2584 = _2578;
    if (_2506)
    {
        float _2586 = fma(_2550, _2578, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2582 = _2586;
    }
    float _2588 = _2582;
    float _2590 = _2588;
    if (_2506)
    {
        float _2592 = _2564 + (-1.0);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = _2594;
    if (_2506)
    {
        float _2598 = _2530 * _2588;
        _2412 = _2598;
    }
    float _2600 = _2412;
    if (!_2506)
    {
        _2532 = _2570;
    }
    float _2602 = _2532;
    float _2604 = _2602;
    if (_2506)
    {
        float _2606 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2606;
    }
    float _2608 = _2520;
    if (_2506)
    {
        float _2610 = _2494 * _2600;
        _2522 = _2610;
    }
    float _2612 = _2522;
    if (!_2506)
    {
        _2590 = _2496;
    }
    float _2614 = _2590;
    float _2616 = _2614;
    if (_2506)
    {
        float _2618 = _2496 * _2600;
        _2616 = _2618;
    }
    float _2620 = _2616;
    if (_2506)
    {
        float _2622 = fma(_2570, _2564, _2608);
        _2604 = _2622;
    }
    float _2624 = _2604;
    if (_2506)
    {
        float _2626 = _2612 * _2612;
        _2574 = _2626;
    }
    float _2628 = _2574;
    if (!_2506)
    {
        _2596 = _2500;
    }
    float _2630 = _2596;
    float _2632 = _2630;
    if (_2506)
    {
        float _2634 = _2620 * _2620;
        _2632 = _2634;
    }
    float _2636 = _2632;
    float _2638 = fma(_2624, _2624, _2628);
    float _2640 = _2638 + _2636;
    float _2642 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = rsqrt(_2640);
    float _2652 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2642);
    float _2654 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2652);
    float _2662 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2664 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2654);
    float _2666 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2668 = abs(_2658);
    float _2670 = log2(_2668);
    float _2672 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2662);
    float _2674 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2664);
    float _2676 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2666);
    float _2678 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2672);
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2684 = _2650 * _2612;
    float _2686 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2676);
    float _2688 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2690 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2692 = _2650 * _2624;
    float _2694 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2690);
    float _2700 = _2650 * _2620;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2542, 1.0);
    float _2712 = _2686 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2714 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2698);
    float _2716 = -_2700;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2720 = exp2(_2706);
    float _2722 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2724 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2714);
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2730 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2722);
    float _2732 = log2(_2710);
    float _2734 = fma(_2718, 0.5, 0.5);
    float _2736 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2728);
    float _2738 = _2692 + 1.0;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2730);
    float _2742 = fma(_2734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2736);
    float _2746 = 1.0 / _2724;
    float _2748 = -_2692;
    float _2750 = fma(_2720, _2738, _2748);
    float _2752 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2740);
    float _2754 = fma(_2734, _2742, -0.212114393711090087890625);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2744);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = fma(_2734, _2754, 1.570728778839111328125);
    float _2762 = sqrt(_2726);
    float _2764 = _2732 * 0.693147182464599609375;
    float _2766 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2768 = _2752 * _2746;
    float _2770 = _2756 * _2746;
    float _2772 = fma(_2768, 0.5, 0.5);
    float _2774 = fma(_2770, -0.5, 0.5);
    float _2776 = _2762 * 0.636619746685028076171875;
    float3 _7011 = float3(_2772, _2774, _2766);
    float _2778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7011, float3(0.0), isnan(_7011)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7011, float3(0.0), isnan(_7011)), level(0.0)).x;
    float3 _7022 = float3(_2772, _2774, _2766);
    float4 _2781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7022, float3(0.0), isnan(_7022)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7022, float3(0.0), isnan(_7022)), level(0.0)).xyzw;
    float _2783 = _2781.x;
    float _2785 = _2781.y;
    float _2787 = _2781.z;
    float _2789 = _2781.w;
    float _2791 = -_2760;
    float _2793 = fma(_2776, _2791, 1.0);
    float2 _7044 = float2(_2793, _2758);
    float3 _2797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7044, float2(0.0), isnan(_7044)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7044, float2(0.0), isnan(_7044)), level(0.0)).xyz;
    float _2799 = _2797.x;
    float _2801 = _2797.y;
    float _2803 = _2797.z;
    float _2805 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = _2682 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2809 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2811 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2807);
    float _2813 = exp2(_2805);
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2817 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2811);
    float _2819 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2817);
    out.m_47.x = _2815;
    float _2821 = _2819 + _2724;
    out.gl_Position.x = _2752;
    out.gl_Position.y = _2756;
    out.gl_Position.z = _2819;
    out.gl_Position.w = _2724;
    float _2823 = _2821 * 0.5;
    float _2825 = -_2813;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2823;
    out.m_68.w = _2724;
    float _2831 = _2829 * _2778;
    float _2833 = -_2829;
    float _2835 = _2833 + 1.0;
    float _2837 = _2789 * _2831;
    float _2839 = _2803 * _2831;
    float _2841 = fma(_2799, _2837, _2783);
    float _2843 = fma(_2801, _2837, _2785);
    float _2845 = _2789 * _2835;
    float _2847 = fma(_2789, _2839, _2787);
    out.m_70.x = _2841;
    out.m_70.y = _2843;
    out.m_70.z = _2847;
    out.m_70.w = _2845;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

