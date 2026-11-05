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
    float4 m_55 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _745 = false;
    bool _601 = false;
    bool _427 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2896 = as_type<float>(_103);
        out.gl_Position.z = _2896;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_141);
        out.gl_Position.z = _2966;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = _147 * _145;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _159 * 0.15915493667125701904296875;
    float _171 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _185 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _187 = _169 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_175;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _197 = !_165;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_193);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_179;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_199);
    float _213 = float(_201);
    float _215 = -_205;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_189, 0.5, 0.5);
    int _223 = abs(_209);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _239 = float(_211);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _249 = fma(_239, _231, _227);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _253 = abs(_243);
    float _255 = fma(_245, _253, _249);
    bool _257 = !_219;
    float _259 = _237;
    float _261 = _251;
    float _263 = _247;
    float _279;
    if (!_257)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_87);
        float _285 = 1.0 / _283;
        float _287 = _121 * _285;
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
        float _413 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_87);
        float _431 = 1.0 / _429;
        float _433 = _121 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_53.x;
    float _439 = in.m_53.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _459;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _463;
    float _483 = _407 * _439;
    float _485 = -_455;
    float _487 = _485 + 1.0;
    float _489 = _443 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _435 + _491;
    bool _495 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = _405 * _437;
    float _513 = _505 * _487;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = fma(_509, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _475 * _517;
    float _531 = fma(_521, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_525, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _493 * _481;
    float _537 = _527 * _529;
    float _539 = _531 * _529;
    float _541 = _533 * _529;
    float _543 = -_475;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _563 = fma(_549, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_553, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = fma(_557, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _569 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _537);
    float _571 = fma(_563, _513, _559);
    float _573 = fma(_565, _513, _561);
    float _575 = fma(_567, _513, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_479;
    float _599;
    if (!_583)
    {
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_87);
        float _605 = 1.0 / _603;
        float _607 = _121 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    bool _651 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _653 = isnan(_609);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _617;
    float _665 = -_629;
    float _667 = _665 + 1.0;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _645 * _667;
    float _673 = -_645;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _633;
    float _679 = _649 * _663;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _685 = fma(_679, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = _683 * _677;
    float _689 = _685 * _671;
    float _691 = -_661;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _609 + _695;
    float _699 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _703 = _629 * _693;
    float _705 = fma(_687, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _707 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _709 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_705, _703, _701);
    float _713 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    float _719 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _709;
    out.m_55.y = _719;
    out.m_55.z = _715;
    out.m_55.w = _721;
    bool _723 = !_669;
    float _741;
    float _743;
    if (!_723)
    {
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _727 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _729 = float(_87);
        float _731 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _733 = _731 * _725;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _729;
        _743 = _739;
        _745 = true;
    }
    else
    {
        float _747 = float(_87);
        float _749 = 1.0 / _747;
        float _751 = _121 * _749;
        _741 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _741;
    float _755 = _743;
    float _757 = in.m_49.z;
    float _759 = _143 * 2.0;
    float _761 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _763 = in.m_49.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    float _777 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _779 = int(_777);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _783 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _785 = !_771;
    int _787 = _785 ? 0 : 1;
    float _789 = -_781;
    float _791 = fma(_761, 2.0, _789);
    float _793 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _795 = floor(_759);
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_121;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _807 = !_775;
    int _809 = _807 ? 0 : 1;
    float _811 = float(_779);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = _757 * 2.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _821 = 1.0 + _819;
    float _823 = _763 * 2.0;
    float _825 = _763 + _757;
    bool _827 = _795 > 0.0;
    float _829 = floor(_817);
    bool _831 = _795 >= 0.0;
    bool _833 = isnan(_795);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _825 + (-1.0);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _855 = _853 != 0;
    float _857 = fma(_841, -2.0, _805);
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _861 = floor(_823);
    int _863 = _839 ? 0 : 1;
    bool _865 = !_851;
    int _867 = _865 ? 0 : 1;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    int _879 = abs(_867);
    float _881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _883 = log2(_881);
    bool _885 = _829 >= 0.0;
    bool _887 = isnan(_829);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    bool _895 = _829 > 0.0;
    int _897 = ~_863;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _893 ? 0 : 1;
    float _905 = 1.0 / _811;
    int _907 = _901;
    if (!_827)
    {
        int _909 = ~_863;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    bool _915 = _861 > 0.0;
    bool _917 = _861 >= 0.0;
    bool _919 = isnan(_861);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = float(_913);
    float _929 = _883 * _121;
    float _931 = float(_879);
    float _933 = 1.0 / _821;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _931 * _927;
    int _943 = _939;
    if (!_895)
    {
        int _945 = ~_903;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    float _955 = in.m_57.z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = exp2(_929);
    float _961 = _905 * _121;
    float _963 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    bool _965 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _973 = _969 || _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _977 = !_847;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _963);
    float _983 = float(_815);
    float _985 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _975);
    int _987 = abs(_979);
    float _989 = float(_949);
    float _991 = _983 * _121;
    float _993 = float(_987);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    int _1001 = _925 ? 0 : 1;
    float _1003 = _941 * (-2.0);
    float _1005 = _993 * _989;
    float _1007 = _973 ? _997 : 0.0;
    float _1009 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _985);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = _1005 * (-2.0);
    int _1019 = _1015;
    if (!_915)
    {
        int _1021 = ~_1001;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    if (_877)
    {
        float _1027 = _1007 * _933;
        _123 = _1027;
    }
    float _1029 = _123;
    bool _1031 = !_855;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = fma(_1003, _953, _953);
    float _1037 = _143 + _763;
    int _1039 = abs(_1033);
    float _1041 = fma(_859, _1003, _859);
    float _1043 = _763 + (-0.5);
    float _1045 = _1037 + (-1.0);
    float _1047 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1035);
    float _1049 = float(_1039);
    float _1051 = float(_1025);
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1055 = fma(_1041, _1029, _1047);
    float _1057 = fma(_1017, _951, _951);
    float _1059 = as_type<float>(int(gl_VertexIndex));
    float _1061 = fma(_1053, _1017, _1053);
    float _1063 = _143 + (-0.5);
    float _1065 = _143 + _757;
    float _1067 = _1049 * _1051;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1071 = _1065 + (-1.0);
    float _1073 = _1067 * (-2.0);
    float _1075 = _757 + (-0.5);
    float _1077 = fma(_1061, _1029, _1069);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1081 = fma(_1073, _955, _955);
    float _1083 = _1055 * 0.15915493667125701904296875;
    float _1085 = _1077 * 0.15915493667125701904296875;
    float _1087 = fma(_1079, _1073, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1081);
    float _1091 = _1083 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = fma(_1087, _1029, _1089);
    float _1097 = _1095 * 0.15915493667125701904296875;
    int _1099 = as_type<int>(_1059) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1059) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = _1085 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    bool _1111 = !_1105;
    float _1113 = _1111 ? (-0.5) : 0.5;
    bool _1115 = !_1101;
    float _1117 = _1115 ? (-0.5) : 0.5;
    float _1119 = _1085 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    float _1125 = _783 * _1123;
    float _1127 = _1097 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = in.m_42.x;
    float _1133 = in.m_42.y;
    float _1135 = in.m_42.z;
    float _1137 = _1109 * _1093;
    float _1139 = _1083 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = _1097 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1117);
    float _1149 = _1093 * _1129;
    float _1151 = _1129 * _1125;
    float _1153 = _793 * _1147;
    float _1155 = _1121 * _1093;
    float _1157 = _1121 * _1151;
    float _1159 = _1109 * _1141;
    float _1161 = _1121 * _1141;
    float _1163 = _1141 * _1129;
    float _1165 = -_1155;
    float _1167 = fma(_1145, _1159, _1165);
    float _1169 = fma(_1145, _1161, _1137);
    float _1171 = -_1159;
    float _1173 = fma(_1145, _1155, _1171);
    float _1175 = -_1125;
    float _1177 = _1145 * _1175;
    float _1179 = _1109 * _1151;
    float _1181 = fma(_1169, _1153, _1157);
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1163, _1153, _1177);
    float _1187 = fma(_1145, _1137, _1161);
    float _1189 = fma(_1167, _1153, _1179);
    float _1191 = fma(_1173, _1183, _1181);
    float _1193 = fma(_1149, _1183, _1185);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1197 = fma(_1187, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1203 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1195);
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1201);
    float _1211 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1203);
    float _1213 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1205);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1221 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1213);
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1227 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1231 = _1219 + _1223;
    float _1233 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = _1225 + _1229;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1245 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1249 = _1237 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1257 = fma(_1249, _1249, _1251);
    float _1259 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1261 = sqrt(_1257);
    float _1263 = _1255 + _1259;
    bool _1265 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1251;
    float _1269 = _1135;
    float _1271 = _1237;
    float _1273 = _1225;
    if (!_1265)
    {
        _1267 = _1237;
    }
    float _1275 = _1267;
    float _1277 = _1275;
    if (!_1265)
    {
        _1269 = _1231;
    }
    float _1279 = _1269;
    float _1281 = _1279;
    if (!_1265)
    {
        _1271 = _1263;
    }
    float _1283 = _1271;
    bool _1285 = !_1265;
    float _1287 = _1283;
    if (!_1285)
    {
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1293 = _1261 + _1291;
        float _1295 = rsqrt(_1257);
        float _1297 = _1293 * _1289;
        float _1299 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = _1297 * 0.15915493667125701904296875;
        float _1303 = _1301 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1305 + (-1.0);
        float _1313 = fma(_1309, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = _1295 * _1313;
        float _1319 = fma(_1263, _1305, _1315);
        float _1321 = fma(_1249, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1323 = fma(_1241, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1287 = _1319;
        _1277 = _1321;
        _1281 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1277;
    float _1329 = _1281;
    float _1331 = -_1255;
    float _1333 = _1331 + _1325;
    float _1335 = -_1225;
    float _1337 = _1335 + _1327;
    float _1339 = -_1219;
    float _1341 = _1339 + _1329;
    float _1343 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1333 * _1333;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1359 = fma(_1337, _1337, _1345);
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1357);
    float _1373 = fma(_1341, _1341, _1359);
    float _1375 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1379 = sqrt(_1373);
    float _1381 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1385 = 1.0 / _1377;
    float _1387 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1389 = _1387 + _1377;
    bool _1391 = _1379 > 0.0;
    float _1393 = _1389 * _1385;
    float _1395 = _1393 * 0.5;
    bool _1397 = !_1391;
    float _1399 = _1327;
    float _1401 = _1325;
    float _1403 = _1329;
    float _1405 = _1379;
    float _1407 = _1387;
    if (!_1397)
    {
        float _1409 = _237 * _237;
        float _1411 = fma(_247, _247, _1409);
        float _1413 = fma(_251, _251, _1411);
        float _1415 = rsqrt(_1373);
        float _1417 = sqrt(_1413);
        float _1419 = _1337 * _1415;
        float _1421 = _1333 * _1415;
        float _1423 = _1341 * _1415;
        bool _1425 = _1417 > 0.0;
        bool _1427 = !_1425;
        _1405 = _1419;
        _1407 = _1415;
        if (!_1427)
        {
            float _1429 = rsqrt(_1413);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _237 * _1429;
            float _1435 = _247 * _1429;
            float _1437 = _251 * _1429;
            float _1439 = _1421 * _1433;
            float _1441 = fma(_1419, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1423, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_247, _1447, _1327);
            float _1451 = fma(_237, _1447, _1325);
            float _1453 = fma(_251, _1447, _1329);
            _1399 = _1449;
            _1401 = _1451;
            _1403 = _1453;
            _1407 = _1447;
        }
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1403;
    float _1461 = _1405;
    float _1463 = _1407;
    float _1465 = _1463;
    float _1467 = _1455;
    float _1469 = _1461;
    if (_1369)
    {
        _1465 = 1.0;
    }
    float _1471 = _1465;
    float _1473 = _1471;
    if (_1355)
    {
        _259 = _1455;
    }
    float _1475 = _259;
    float _1477 = _1475;
    if (_1355)
    {
        _261 = _1457;
    }
    float _1479 = _261;
    float _1481 = _1479;
    if (_1355)
    {
        _263 = _1459;
    }
    float _1483 = _263;
    float _1485 = _1483;
    if (!_1355)
    {
        float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1489 = _1255 + _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1493 = _1225 + _1491;
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1497 = -_1225;
        float _1499 = _1497 + _1455;
        float _1501 = _1489 * _1489;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1505 = _1219 + _1503;
        float _1507 = -_1219;
        float _1509 = _1507 + _1459;
        float _1511 = fma(_1493, _1493, _1501);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1505, _1505, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1523 = _1521 * _1513;
        float _1525 = _1519 * _1523;
        float _1527 = -_1255;
        float _1529 = _1527 + _1457;
        float _1531 = fma(_1499, _1525, _1225);
        float _1533 = fma(_1529, _1525, _1255);
        float _1535 = fma(_1509, _1525, _1219);
        _1481 = _1533;
        _1477 = _1531;
        _1485 = _1535;
        _1467 = _1499;
    }
    float _1537 = _1481;
    float _1539 = _1477;
    float _1541 = _1485;
    float _1543 = _1467;
    float _1545 = _1543;
    if (!_1369)
    {
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1553);
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1551 * 0.15915493667125701904296875;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = 1.0 / _1559;
        float _1569 = _1561 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1565 * _1567;
        float _1575 = _1561 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1555;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = 1.0 / _1579;
        float _1589 = 1.0 / _1585;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1593 = _1581 * _1591;
        float _1595 = _1577 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1593, _1597);
        float _1601 = _1599 * _1589;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1545 = _1587;
        _1273 = _1585;
        _1473 = _1603;
    }
    float _1605 = _1545;
    float _1607 = _1273;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1537 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1539 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1541 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = sqrt(_1627);
    float _1633 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1635 = _1617 * _1633;
    float _1637 = _1621 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 + _1641;
    float _1645 = sqrt(_1643);
    bool _1647 = _1645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = _1645 + _1649;
    float _1653 = _1629;
    float _1655 = _1607;
    float _1657 = _1651;
    float _1659 = _1605;
    float _1661 = _1613;
    if (_1647)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1653 = _1663;
    }
    float _1665 = _1653;
    if (_1647)
    {
        float _1667 = rsqrt(_1643);
        _1655 = _1667;
    }
    float _1669 = _1655;
    float _1671 = _1669;
    if (_1647)
    {
        float _1673 = _1651 * _1665;
        _1657 = _1673;
    }
    float _1675 = _1657;
    if (_1647)
    {
        float _1677 = _1675 * 0.15915493667125701904296875;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1665;
    float _1683 = _1679;
    if (_1647)
    {
        float _1685 = _1679 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1693 = precise::max(0.0, _1691);
    float _1695 = _1621;
    float _1697 = _1693;
    if (_1647)
    {
        float _1699 = _1679 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = -_1633;
    float _1707 = -_1693;
    float _1709 = fma(_1613, _1705, _1707);
    if (!_1647)
    {
        _1661 = _1637;
    }
    float _1711 = _1661;
    float _1713 = _1711;
    if (_1647)
    {
        float _1715 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1715;
    }
    float _1717 = _1697;
    float _1719 = _1689;
    float _1721 = _1717;
    if (_1647)
    {
        float _1723 = fma(_1689, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    float _1729 = _1703;
    if (_1647)
    {
        float _1731 = _1703 + (-1.0);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1647)
    {
        float _1737 = _1669 * _1725;
        _1469 = _1737;
    }
    float _1739 = _1469;
    if (!_1647)
    {
        _1671 = _1635;
    }
    float _1741 = _1671;
    float _1743 = _1741;
    if (_1647)
    {
        float _1745 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1745;
    }
    float _1747 = _1683;
    if (_1647)
    {
        float _1749 = _1635 * _1739;
        _1743 = _1749;
    }
    float _1751 = _1743;
    if (!_1647)
    {
        _1727 = _1709;
    }
    float _1753 = _1727;
    float _1755 = _1753;
    if (_1647)
    {
        float _1757 = _1637 * _1739;
        _1713 = _1757;
    }
    float _1759 = _1713;
    if (!_1647)
    {
        _1735 = _1639;
    }
    float _1761 = _1735;
    float _1763 = _1761;
    if (_1647)
    {
        float _1765 = fma(_1709, _1703, _1747);
        _1755 = _1765;
    }
    float _1767 = _1755;
    if (_1647)
    {
        float _1769 = _1751 * _1751;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1647)
    {
        _1729 = _1641;
    }
    float _1773 = _1729;
    float _1775 = _1773;
    if (_1647)
    {
        float _1777 = _1759 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = fma(_1767, _1767, _1771);
    float _1783 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1785 = _1781 + _1779;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1789 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1787);
    float _1791 = precise::clamp(_1789, 0.0, 1.0);
    float _1793 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1783);
    float _1795 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = rsqrt(_1785);
    float _1799 = -_1791;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1793);
    float _1805 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1807 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1813 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1805);
    float _1821 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1827 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = -_1823;
    float _1833 = fma(_1831, _1809, 1.0);
    float _1835 = _1797 * _1751;
    float _1837 = _1797 * _1767;
    float _1839 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1825);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = _1797 * _1759;
    float _1849 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1857 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = log2(_1833);
    float _1861 = -_1847;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1863, -0.5, 0.5);
    float _1871 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1873 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1875 = exp2(_1857);
    float _1877 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1863, 0.5, 0.5);
    float _1881 = _1837 + 1.0;
    float _1883 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1885 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1887 = 1.0 / _1871;
    float _1889 = fma(_1879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1885);
    float _1893 = _1859 * 0.693147182464599609375;
    float _1895 = fma(_1879, _1889, -0.212114393711090087890625);
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1899 = sqrt(_1869);
    float _1901 = -_1837;
    float _1903 = fma(_1875, _1881, _1901);
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1883);
    float _1907 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1909 = fma(_1879, _1895, 1.570728778839111328125);
    float _1911 = fma(_1903, 0.5, 0.5);
    float _1913 = _1905 * _1887;
    float _1915 = _1907 * _1887;
    float _1917 = fma(_1913, 0.5, 0.5);
    float _1919 = fma(_1915, -0.5, 0.5);
    float _1921 = _1899 * 0.636619746685028076171875;
    float _1923 = -_1909;
    float _1925 = fma(_1921, _1923, 1.0);
    float3 _5735 = float3(_1917, _1919, _1897);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5735, float3(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5735, float3(0.0), isnan(_5735)), level(0.0)).x;
    float3 _5746 = float3(_1917, _1919, _1897);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5746, float3(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5746, float3(0.0), isnan(_5746)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float2 _5763 = float2(_1925, _1911);
    float3 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).xyz;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = float(uint(_815));
    float _1952 = trunc(_961);
    int _1954 = int(_1952);
    int _1956 = ~_815;
    int _1958 = _1956 + 1;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1962 = ~_815;
    int _1964 = _1962 + 1;
    float _1966 = -_1009;
    float _1968 = _1966 + 1.0;
    int _1970 = abs(_799);
    float _1972 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    int _1974 = abs(_809);
    float _1976 = 1.0 / _1950;
    float _1978 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1980 = -_981;
    float _1982 = _1980 + 1.0;
    float _1984 = float(uint(_1954));
    float _1986 = float(_1954);
    bool _1988 = _1986 >= _983;
    bool _1990 = isnan(_1986);
    bool _1992 = _1988 || _1990;
    bool _1994 = isnan(_983);
    bool _1996 = _1992 || _1994;
    float _1998 = float(_1996);
    int _2000 = as_type<int>(_1976) + (-2);
    float _2002 = trunc(_1998);
    int _2004 = int(_2002);
    float _2006 = as_type<float>(_2000) * _1984;
    float _2008 = trunc(_2006);
    float _2010 = precise::max(_2008, 0.0);
    uint _2013 = uint(_2010);
    int _2015 = _1958 * int(_2013);
    int _2017 = _2015 + _1954;
    float _2019 = float(uint(_2017));
    float _2021 = as_type<float>(_2000) * _2019;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _753;
    bool _2029 = !_2025;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = _2031 * _143;
    float _2041 = floor(_2039);
    float _2043 = _991 * _2027;
    int _2045 = int(_2013) + int(_2037);
    float _2047 = trunc(_2043);
    int _2049 = int(_2047);
    int _2051 = _1964 * _2045;
    int _2053 = _2051 + _1954;
    float _2055 = -_2041;
    float _2057 = _2039 + _2055;
    int _2059 = _815 + (-1);
    bool _2061 = uint(_2053) >= uint(_815);
    bool _2063 = !_2061;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _815 == 0;
    int _2069 = ~_2045;
    int _2071 = _2069 + _2065;
    int _2073 = _2071 + 1;
    float _2075 = _2057 * _983;
    int _2077 = _815 * _2073;
    int _2079 = _2077 + _1954;
    float _2081 = trunc(_2075);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2004;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2067;
    int _2097 = _2095 ? _2079 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    int _2107 = _2097 * _2093;
    int _2109 = abs(_787);
    int _2111 = abs(_2101);
    int _2113 = _2004 * _2059;
    int _2115 = _2113 + _2107;
    bool _2117 = !_2105;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _2083 * _2111;
    int _2123 = _2121 + _1954;
    int _2125 = _2115 * _2109;
    int _2127 = abs(_2119);
    int _2129 = _2049 * _1970;
    int _2131 = _2129 + _2125;
    int _2133 = ~_815;
    int _2135 = _2133 + 1;
    int _2137 = ~_815;
    int _2139 = _2137 + 1;
    int _2141 = _2123 * _1974;
    int _2143 = _2141 + _2131;
    int _2145 = ~_815;
    int _2147 = _2145 + 1;
    int _2149 = _2083 * _2127;
    int _2151 = _2149 + _2143;
    float _2153 = float(uint(_2151));
    float _2155 = as_type<float>(_2000) * _2153;
    float _2157 = trunc(_2155);
    float _2159 = precise::max(_2157, 0.0);
    uint _2161 = uint(_2159);
    int _2163 = _2135 * int(_2161);
    int _2165 = _2163 + _2151;
    float _2167 = float(uint(_2165));
    float _2169 = as_type<float>(_2000) * _2167;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    int _2177 = int(_2161) + int(_2175);
    float _2179 = float(uint(_2123));
    int _2181 = _2139 * _2177;
    int _2183 = _2181 + _2151;
    float _2185 = as_type<float>(_2000) * _2179;
    bool _2187 = uint(_2183) >= uint(_815);
    float _2189 = trunc(_2185);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    bool _2195 = !_2187;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = ~_2177;
    int _2201 = _2199 + _2197;
    int _2203 = _2201 + 1;
    int _2205 = _815 * _2203;
    int _2207 = _2205 + _2151;
    int _2209 = ~_815;
    int _2211 = _2209 + 1;
    bool _2213 = !_2067;
    int _2215 = _2213 ? _2207 : (-1);
    int _2217 = _2211 * int(_2193);
    int _2219 = _2217 + _2123;
    int _2221 = _2215 >> 31;
    float _2223 = float(uint(_2219));
    int _2225 = _2221 & 3;
    int _2227 = _2215 & 3;
    bool _2229 = _2227 != 0;
    float _2231 = as_type<float>(_2000) * _2223;
    int _2233 = _2215 + _2225;
    bool _2235 = uint(_2227) > 1u;
    int _2237 = _2233 >> 2;
    float _2239 = trunc(_2231);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2215 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2237 << 4;
    int _2251 = _2249 + 368;
    int _2253 = _2247 ? 0 : 1;
    uint _2255 = uint(int(uint(_2251) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    bool _2271 = _2227 != 3;
    bool _2273 = uint(_2227) >= 2u;
    int _2275 = _2251 + 8;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
    int _2281 = int(_2277) & 3;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[int(_2279)][_2281];
    int _2285 = int(_2277) + 1;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    int _2289 = _2285 & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2193) + int(_2243);
    int _2295 = ~_2253;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = _2299;
    if (!_2235)
    {
        int _2303 = ~_2253;
        int _2305 = _2303 + 1;
        _2301 = _2305;
    }
    int _2307 = _2301;
    int _2309 = _2147 * _2293;
    int _2311 = _2309 + _2123;
    bool _2313 = !_2229;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2319 = int(_2317);
    int _2321 = _2273 ? 0 : 1;
    bool _2323 = uint(_2311) >= uint(_815);
    bool _2325 = _2227 != 3;
    bool _2327 = !_2323;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = ~_2321;
    int _2333 = _2331 + 1;
    int _2335 = _2333 + 1;
    int _2337 = ~_2293;
    int _2339 = _2337 + _2329;
    int _2341 = _2339 + 1;
    int _2343 = abs(_2307);
    int _2345 = abs(_2315);
    int _2347 = _815 * _2341;
    int _2349 = _2347 + _2123;
    int _2351 = ~_2343;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _2335;
    if (_2271)
    {
        int _2359 = ~_2321;
        int _2361 = _2359 + 1;
        _2357 = _2361;
    }
    int _2363 = _2357;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2367 = _2365 != 0;
    bool _2369 = !_2325;
    int _2371 = _2369 ? 0 : (-1);
    int _2373 = ~_2345;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = abs(_2363);
    int _2381 = _2355 * as_type<int>(_2269);
    bool _2383 = !_2367;
    int _2385 = _2383 ? 0 : 1;
    int _2387 = abs(_2371);
    int _2389 = _2377 * as_type<int>(_2261);
    int _2391 = _2389 + _2381;
    int _2393 = abs(_2385);
    int _2395 = ~_2379;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = float(uint(_2319));
    int _2403 = _2399 * as_type<int>(_2283);
    int _2405 = _2403 + _2391;
    int _2407 = ~_2387;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    int _2413 = abs(_2319);
    float _2415 = 1.0 / _2401;
    int _2417 = _2411 * as_type<int>(_2291);
    int _2419 = _2417 + _2405;
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    bool _2427 = !_2067;
    int _2429 = _2427 ? _2349 : (-1);
    int _2431 = _2419 * _2425;
    float _2433 = float(uint(_2413));
    int _2435 = _2429 * _2393;
    int _2437 = _2435 + _2431;
    float _2439 = 1.0 / _2433;
    bool _2441 = _143 > 0.5;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2445 = _755 + _2443;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2447;
    int _2451 = as_type<int>(_2415) + (-2);
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2455 = _2453 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2457 = float(uint(_2437));
    float _2459 = 1.0 / _2449;
    int _2461 = ~_2319;
    int _2463 = _2461 + 1;
    float _2465 = as_type<float>(_2451) * _2457;
    int _2467 = abs(_2437);
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2471 = _2469 != 0;
    int _2473 = as_type<int>(_2439) + (-2);
    float _2475 = trunc(_2465);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = float(uint(_2467));
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    bool _2487 = _763 > 0.5;
    float _2489 = as_type<float>(_2473) * _2481;
    float _2491 = _2445 * _2459;
    float _2493 = 1.0 / _2455;
    int _2495 = ~_2413;
    int _2497 = _2495 + 1;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _755 + _2499;
    bool _2503 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2505 = isnan(_755);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = trunc(_2489);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    int _2521 = _2463 * int(_2479);
    int _2523 = _2521 + _2437;
    float _2525 = -_2513;
    float _2527 = _2525 + 1.0;
    float _2529 = float(uint(_2523));
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2531;
    float _2535 = _2501 * _2493;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2537;
    float _2541 = as_type<float>(_2451) * _2529;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2543;
    float _2547 = fma(_2533, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2549 = fma(_2539, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2497 * int(_2519);
    int _2559 = _2557 + _2467;
    float _2561 = fma(_2545, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2563 = float(uint(_2559));
    bool _2565 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2567 = isnan(_755);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = -_1117;
    int _2579 = _2441 ? as_type<int>(_2577) : as_type<int>(_1117);
    float _2581 = as_type<float>(_2473) * _2563;
    bool _2583 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2585 = isnan(_755);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    float _2595 = -_2575;
    float _2597 = _2595 + 1.0;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2601 = _2599 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2603 = _2575 * _2527;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2607 = _2605 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2609 = trunc(_2581);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2617 = _2615 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2619 = _2593 * _2597;
    float _2621 = fma(_2601, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = fma(_2607, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2625 = fma(_2617, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2627 = ~_2319;
    int _2629 = _2627 + 1;
    float _2631 = _2561 * _2619;
    float _2633 = _2547 * _2619;
    float _2635 = _2549 * _2619;
    int _2637 = int(_2479) + int(_2555);
    float _2639 = -_2593;
    float _2641 = _2639 + 1.0;
    int _2643 = ~_2413;
    int _2645 = _2643 + 1;
    bool _2647 = !_2471;
    float _2649 = _2647 ? _1117 : as_type<float>(_2579);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2631);
    int _2653 = int(_2519) + int(_2613);
    float _2655 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2633);
    float _2657 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2635);
    int _2659 = _2645 * _2653;
    int _2661 = _2659 + _2467;
    float _2663 = fma(_2623, _2603, _2651);
    int _2665 = _2629 * _2637;
    int _2667 = _2665 + _2437;
    float _2669 = fma(_2621, _2603, _2655);
    float _2671 = fma(_2625, _2603, _2657);
    bool _2673 = uint(_2661) >= uint(_2413);
    float _2675 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2663);
    bool _2677 = uint(_2667) >= uint(_2319);
    float _2679 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2669);
    bool _2681 = !_2673;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2671);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2693 = ~_2683;
    int _2695 = _2653 + _2693;
    int _2697 = _2695 + 1;
    float _2699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2701 = ~_2637;
    int _2703 = _2701 + _2689;
    int _2705 = _2703 + 1;
    float _2707 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2709 = _2437 ^ _2319;
    float _2711 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2713 = _2319 == 0;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2437;
    uint _2719 = uint(int(uint(_2709) >> uint(31)));
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2723 = _2319 == 0;
    float _2725 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2727 = ~int(_2719);
    int _2729 = _2727 + 1;
    float _2731 = _2675 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2733 = -_1113;
    int _2735 = _2487 ? as_type<int>(_2733) : as_type<int>(_1113);
    float _2737 = _2707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2739 = _2697 ^ _2729;
    float _2741 = exp2(_2725);
    bool _2743 = !_2485;
    float _2745 = _2743 ? _1113 : as_type<float>(_2735);
    float _2747 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2729;
    int _2751 = _2749 + _2739;
    int _2753 = _2751 + 1;
    float _2755 = _2699 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2757 = !_2713;
    int _2759 = _2757 ? _2717 : (-1);
    bool _2761 = !_2723;
    int _2763 = _2761 ? _2753 : (-1);
    float _2765 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2767 = float(_2759);
    out.m_62.x = _2711;
    out.m_62.y = _2747;
    out.m_62.z = _2737;
    float _2769 = float(_2763);
    bool _2771 = _1609 > 0.0;
    bool _2773 = isnan(_1609);
    bool _2775 = _2771 || _2773;
    bool _2777 = isnan(0.0);
    bool _2779 = _2775 || _2777;
    float _2781 = fma(_2755, _2767, _803);
    float _2783 = -_2741;
    float _2785 = _2783 + 1.0;
    float _2787 = -_999;
    float _2789 = fma(_2765, _2769, _2787);
    float _2791 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1978);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2795 = _2649 + 0.5;
    float _2797 = _2745 + (-0.5);
    float _2799 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2793 * _1927;
    float _2803 = fma(_2755, _2795, _2781);
    float _2805 = -_2765;
    float _2807 = fma(_2805, _2797, _2789);
    float _2809 = _2791 + _1871;
    float _2811 = _255 * _2799;
    float _2813 = fma(_2745, _1968, _2807);
    float _2815 = _2809 * 0.5;
    float _2817 = _1938 * _2801;
    float _2819 = _1948 * _2801;
    float _2821 = -_2793;
    float _2823 = _2821 + 1.0;
    out.gl_Position.x = _1905;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _2791;
    out.gl_Position.w = _1871;
    float _2825 = -_1982;
    float _2827 = fma(_2649, _2825, _2803);
    float _2829 = _2811 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _2815;
    out.m_64.w = _1871;
    out.m_66.x = _2827;
    out.m_66.y = _2813;
    out.m_45.x = _2829;
    float _2831 = fma(_1944, _2817, _1932);
    float _2833 = fma(_1946, _2817, _1934);
    float _2835 = _1938 * _2823;
    float _2837 = fma(_1938, _2819, _1936);
    out.m_68.x = _2831;
    out.m_68.y = _2833;
    out.m_68.z = _2837;
    out.m_68.w = _2835;
    if (_2779)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2839;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _745 = false;
    bool _601 = false;
    bool _427 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2896 = as_type<float>(_103);
        out.gl_Position.z = _2896;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_141);
        out.gl_Position.z = _2966;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = _147 * _145;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _159 * 0.15915493667125701904296875;
    float _171 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _185 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _187 = _169 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_175;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _197 = !_165;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_193);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_179;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_199);
    float _213 = float(_201);
    float _215 = -_205;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_189, 0.5, 0.5);
    int _223 = abs(_209);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _239 = float(_211);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _249 = fma(_239, _231, _227);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _253 = abs(_243);
    float _255 = fma(_245, _253, _249);
    bool _257 = !_219;
    float _259 = _237;
    float _261 = _251;
    float _263 = _247;
    float _279;
    if (!_257)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_87);
        float _285 = 1.0 / _283;
        float _287 = _121 * _285;
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
        float _413 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_87);
        float _431 = 1.0 / _429;
        float _433 = _121 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_53.x;
    float _439 = in.m_53.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _459;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _463;
    float _483 = _407 * _439;
    float _485 = -_455;
    float _487 = _485 + 1.0;
    float _489 = _443 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _435 + _491;
    bool _495 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = _405 * _437;
    float _513 = _505 * _487;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = fma(_509, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _475 * _517;
    float _531 = fma(_521, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_525, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _493 * _481;
    float _537 = _527 * _529;
    float _539 = _531 * _529;
    float _541 = _533 * _529;
    float _543 = -_475;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _563 = fma(_549, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_553, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = fma(_557, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _569 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _537);
    float _571 = fma(_563, _513, _559);
    float _573 = fma(_565, _513, _561);
    float _575 = fma(_567, _513, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_479;
    float _599;
    if (!_583)
    {
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_87);
        float _605 = 1.0 / _603;
        float _607 = _121 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    bool _651 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _653 = isnan(_609);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _617;
    float _665 = -_629;
    float _667 = _665 + 1.0;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _645 * _667;
    float _673 = -_645;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _633;
    float _679 = _649 * _663;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _685 = fma(_679, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = _683 * _677;
    float _689 = _685 * _671;
    float _691 = -_661;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _609 + _695;
    float _699 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _703 = _629 * _693;
    float _705 = fma(_687, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _707 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _709 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_705, _703, _701);
    float _713 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    float _719 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _709;
    out.m_55.y = _719;
    out.m_55.z = _715;
    out.m_55.w = _721;
    bool _723 = !_669;
    float _741;
    float _743;
    if (!_723)
    {
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _727 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _729 = float(_87);
        float _731 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _733 = _731 * _725;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _729;
        _743 = _739;
        _745 = true;
    }
    else
    {
        float _747 = float(_87);
        float _749 = 1.0 / _747;
        float _751 = _121 * _749;
        _741 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _741;
    float _755 = _743;
    float _757 = in.m_49.z;
    float _759 = _143 * 2.0;
    float _761 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _763 = in.m_49.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    float _777 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _779 = int(_777);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _783 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _785 = !_771;
    int _787 = _785 ? 0 : 1;
    float _789 = -_781;
    float _791 = fma(_761, 2.0, _789);
    float _793 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _795 = floor(_759);
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_121;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _807 = !_775;
    int _809 = _807 ? 0 : 1;
    float _811 = float(_779);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = _757 * 2.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _821 = 1.0 + _819;
    float _823 = _763 * 2.0;
    float _825 = _763 + _757;
    bool _827 = _795 > 0.0;
    float _829 = floor(_817);
    bool _831 = _795 >= 0.0;
    bool _833 = isnan(_795);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _825 + (-1.0);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _855 = _853 != 0;
    float _857 = fma(_841, -2.0, _805);
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _861 = floor(_823);
    int _863 = _839 ? 0 : 1;
    bool _865 = !_851;
    int _867 = _865 ? 0 : 1;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    int _879 = abs(_867);
    float _881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _883 = log2(_881);
    bool _885 = _829 >= 0.0;
    bool _887 = isnan(_829);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    bool _895 = _829 > 0.0;
    int _897 = ~_863;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _893 ? 0 : 1;
    float _905 = 1.0 / _811;
    int _907 = _901;
    if (!_827)
    {
        int _909 = ~_863;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    bool _915 = _861 > 0.0;
    bool _917 = _861 >= 0.0;
    bool _919 = isnan(_861);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = float(_913);
    float _929 = _883 * _121;
    float _931 = float(_879);
    float _933 = 1.0 / _821;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _931 * _927;
    int _943 = _939;
    if (!_895)
    {
        int _945 = ~_903;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    float _955 = in.m_57.z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = exp2(_929);
    float _961 = _905 * _121;
    float _963 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    bool _965 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _973 = _969 || _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _977 = !_847;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _963);
    float _983 = float(_815);
    float _985 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _975);
    int _987 = abs(_979);
    float _989 = float(_949);
    float _991 = _983 * _121;
    float _993 = float(_987);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    int _1001 = _925 ? 0 : 1;
    float _1003 = _941 * (-2.0);
    float _1005 = _993 * _989;
    float _1007 = _973 ? _997 : 0.0;
    float _1009 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _985);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = _1005 * (-2.0);
    int _1019 = _1015;
    if (!_915)
    {
        int _1021 = ~_1001;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    if (_877)
    {
        float _1027 = _1007 * _933;
        _123 = _1027;
    }
    float _1029 = _123;
    bool _1031 = !_855;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = fma(_1003, _953, _953);
    float _1037 = _143 + _763;
    int _1039 = abs(_1033);
    float _1041 = fma(_859, _1003, _859);
    float _1043 = _763 + (-0.5);
    float _1045 = _1037 + (-1.0);
    float _1047 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1035);
    float _1049 = float(_1039);
    float _1051 = float(_1025);
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1055 = fma(_1041, _1029, _1047);
    float _1057 = fma(_1017, _951, _951);
    float _1059 = as_type<float>(int(gl_VertexIndex));
    float _1061 = fma(_1053, _1017, _1053);
    float _1063 = _143 + (-0.5);
    float _1065 = _143 + _757;
    float _1067 = _1049 * _1051;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1071 = _1065 + (-1.0);
    float _1073 = _1067 * (-2.0);
    float _1075 = _757 + (-0.5);
    float _1077 = fma(_1061, _1029, _1069);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1081 = fma(_1073, _955, _955);
    float _1083 = _1055 * 0.15915493667125701904296875;
    float _1085 = _1077 * 0.15915493667125701904296875;
    float _1087 = fma(_1079, _1073, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1081);
    float _1091 = _1083 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = fma(_1087, _1029, _1089);
    float _1097 = _1095 * 0.15915493667125701904296875;
    int _1099 = as_type<int>(_1059) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1059) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = _1085 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    bool _1111 = !_1105;
    float _1113 = _1111 ? (-0.5) : 0.5;
    bool _1115 = !_1101;
    float _1117 = _1115 ? (-0.5) : 0.5;
    float _1119 = _1085 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    float _1125 = _783 * _1123;
    float _1127 = _1097 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = in.m_42.x;
    float _1133 = in.m_42.y;
    float _1135 = in.m_42.z;
    float _1137 = _1109 * _1093;
    float _1139 = _1083 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = _1097 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1117);
    float _1149 = _1093 * _1129;
    float _1151 = _1129 * _1125;
    float _1153 = _793 * _1147;
    float _1155 = _1121 * _1093;
    float _1157 = _1121 * _1151;
    float _1159 = _1109 * _1141;
    float _1161 = _1121 * _1141;
    float _1163 = _1141 * _1129;
    float _1165 = -_1155;
    float _1167 = fma(_1145, _1159, _1165);
    float _1169 = fma(_1145, _1161, _1137);
    float _1171 = -_1159;
    float _1173 = fma(_1145, _1155, _1171);
    float _1175 = -_1125;
    float _1177 = _1145 * _1175;
    float _1179 = _1109 * _1151;
    float _1181 = fma(_1169, _1153, _1157);
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1163, _1153, _1177);
    float _1187 = fma(_1145, _1137, _1161);
    float _1189 = fma(_1167, _1153, _1179);
    float _1191 = fma(_1173, _1183, _1181);
    float _1193 = fma(_1149, _1183, _1185);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1197 = fma(_1187, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1203 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1195);
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1201);
    float _1211 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1203);
    float _1213 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1205);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1221 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1213);
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1227 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1231 = _1219 + _1223;
    float _1233 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = _1225 + _1229;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1245 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1249 = _1237 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1257 = fma(_1249, _1249, _1251);
    float _1259 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1261 = sqrt(_1257);
    float _1263 = _1255 + _1259;
    bool _1265 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1251;
    float _1269 = _1135;
    float _1271 = _1237;
    float _1273 = _1225;
    if (!_1265)
    {
        _1267 = _1237;
    }
    float _1275 = _1267;
    float _1277 = _1275;
    if (!_1265)
    {
        _1269 = _1231;
    }
    float _1279 = _1269;
    float _1281 = _1279;
    if (!_1265)
    {
        _1271 = _1263;
    }
    float _1283 = _1271;
    bool _1285 = !_1265;
    float _1287 = _1283;
    if (!_1285)
    {
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1293 = _1261 + _1291;
        float _1295 = rsqrt(_1257);
        float _1297 = _1293 * _1289;
        float _1299 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = _1297 * 0.15915493667125701904296875;
        float _1303 = _1301 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1305 + (-1.0);
        float _1313 = fma(_1309, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = _1295 * _1313;
        float _1319 = fma(_1263, _1305, _1315);
        float _1321 = fma(_1249, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1323 = fma(_1241, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1287 = _1319;
        _1277 = _1321;
        _1281 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1277;
    float _1329 = _1281;
    float _1331 = -_1255;
    float _1333 = _1331 + _1325;
    float _1335 = -_1225;
    float _1337 = _1335 + _1327;
    float _1339 = -_1219;
    float _1341 = _1339 + _1329;
    float _1343 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1333 * _1333;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1359 = fma(_1337, _1337, _1345);
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1357);
    float _1373 = fma(_1341, _1341, _1359);
    float _1375 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1379 = sqrt(_1373);
    float _1381 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1385 = 1.0 / _1377;
    float _1387 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1389 = _1387 + _1377;
    bool _1391 = _1379 > 0.0;
    float _1393 = _1389 * _1385;
    float _1395 = _1393 * 0.5;
    bool _1397 = !_1391;
    float _1399 = _1327;
    float _1401 = _1325;
    float _1403 = _1329;
    float _1405 = _1379;
    float _1407 = _1387;
    if (!_1397)
    {
        float _1409 = _237 * _237;
        float _1411 = fma(_247, _247, _1409);
        float _1413 = fma(_251, _251, _1411);
        float _1415 = rsqrt(_1373);
        float _1417 = sqrt(_1413);
        float _1419 = _1337 * _1415;
        float _1421 = _1333 * _1415;
        float _1423 = _1341 * _1415;
        bool _1425 = _1417 > 0.0;
        bool _1427 = !_1425;
        _1405 = _1419;
        _1407 = _1415;
        if (!_1427)
        {
            float _1429 = rsqrt(_1413);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _237 * _1429;
            float _1435 = _247 * _1429;
            float _1437 = _251 * _1429;
            float _1439 = _1421 * _1433;
            float _1441 = fma(_1419, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1423, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_247, _1447, _1327);
            float _1451 = fma(_237, _1447, _1325);
            float _1453 = fma(_251, _1447, _1329);
            _1399 = _1449;
            _1401 = _1451;
            _1403 = _1453;
            _1407 = _1447;
        }
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1403;
    float _1461 = _1405;
    float _1463 = _1407;
    float _1465 = _1463;
    float _1467 = _1455;
    float _1469 = _1461;
    if (_1369)
    {
        _1465 = 1.0;
    }
    float _1471 = _1465;
    float _1473 = _1471;
    if (_1355)
    {
        _259 = _1455;
    }
    float _1475 = _259;
    float _1477 = _1475;
    if (_1355)
    {
        _261 = _1457;
    }
    float _1479 = _261;
    float _1481 = _1479;
    if (_1355)
    {
        _263 = _1459;
    }
    float _1483 = _263;
    float _1485 = _1483;
    if (!_1355)
    {
        float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1489 = _1255 + _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1493 = _1225 + _1491;
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1497 = -_1225;
        float _1499 = _1497 + _1455;
        float _1501 = _1489 * _1489;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1505 = _1219 + _1503;
        float _1507 = -_1219;
        float _1509 = _1507 + _1459;
        float _1511 = fma(_1493, _1493, _1501);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1505, _1505, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1523 = _1521 * _1513;
        float _1525 = _1519 * _1523;
        float _1527 = -_1255;
        float _1529 = _1527 + _1457;
        float _1531 = fma(_1499, _1525, _1225);
        float _1533 = fma(_1529, _1525, _1255);
        float _1535 = fma(_1509, _1525, _1219);
        _1481 = _1533;
        _1477 = _1531;
        _1485 = _1535;
        _1467 = _1499;
    }
    float _1537 = _1481;
    float _1539 = _1477;
    float _1541 = _1485;
    float _1543 = _1467;
    float _1545 = _1543;
    if (!_1369)
    {
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1553);
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1551 * 0.15915493667125701904296875;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = 1.0 / _1559;
        float _1569 = _1561 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1565 * _1567;
        float _1575 = _1561 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1555;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = 1.0 / _1579;
        float _1589 = 1.0 / _1585;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1593 = _1581 * _1591;
        float _1595 = _1577 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1593, _1597);
        float _1601 = _1599 * _1589;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1545 = _1587;
        _1273 = _1585;
        _1473 = _1603;
    }
    float _1605 = _1545;
    float _1607 = _1273;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1537 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1539 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1541 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = sqrt(_1627);
    float _1633 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1635 = _1617 * _1633;
    float _1637 = _1621 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 + _1641;
    float _1645 = sqrt(_1643);
    bool _1647 = _1645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = _1645 + _1649;
    float _1653 = _1629;
    float _1655 = _1607;
    float _1657 = _1651;
    float _1659 = _1605;
    float _1661 = _1613;
    if (_1647)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1653 = _1663;
    }
    float _1665 = _1653;
    if (_1647)
    {
        float _1667 = rsqrt(_1643);
        _1655 = _1667;
    }
    float _1669 = _1655;
    float _1671 = _1669;
    if (_1647)
    {
        float _1673 = _1651 * _1665;
        _1657 = _1673;
    }
    float _1675 = _1657;
    if (_1647)
    {
        float _1677 = _1675 * 0.15915493667125701904296875;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1665;
    float _1683 = _1679;
    if (_1647)
    {
        float _1685 = _1679 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1693 = precise::max(0.0, _1691);
    float _1695 = _1621;
    float _1697 = _1693;
    if (_1647)
    {
        float _1699 = _1679 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = -_1633;
    float _1707 = -_1693;
    float _1709 = fma(_1613, _1705, _1707);
    if (!_1647)
    {
        _1661 = _1637;
    }
    float _1711 = _1661;
    float _1713 = _1711;
    if (_1647)
    {
        float _1715 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1715;
    }
    float _1717 = _1697;
    float _1719 = _1689;
    float _1721 = _1717;
    if (_1647)
    {
        float _1723 = fma(_1689, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    float _1729 = _1703;
    if (_1647)
    {
        float _1731 = _1703 + (-1.0);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1647)
    {
        float _1737 = _1669 * _1725;
        _1469 = _1737;
    }
    float _1739 = _1469;
    if (!_1647)
    {
        _1671 = _1635;
    }
    float _1741 = _1671;
    float _1743 = _1741;
    if (_1647)
    {
        float _1745 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1745;
    }
    float _1747 = _1683;
    if (_1647)
    {
        float _1749 = _1635 * _1739;
        _1743 = _1749;
    }
    float _1751 = _1743;
    if (!_1647)
    {
        _1727 = _1709;
    }
    float _1753 = _1727;
    float _1755 = _1753;
    if (_1647)
    {
        float _1757 = _1637 * _1739;
        _1713 = _1757;
    }
    float _1759 = _1713;
    if (!_1647)
    {
        _1735 = _1639;
    }
    float _1761 = _1735;
    float _1763 = _1761;
    if (_1647)
    {
        float _1765 = fma(_1709, _1703, _1747);
        _1755 = _1765;
    }
    float _1767 = _1755;
    if (_1647)
    {
        float _1769 = _1751 * _1751;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1647)
    {
        _1729 = _1641;
    }
    float _1773 = _1729;
    float _1775 = _1773;
    if (_1647)
    {
        float _1777 = _1759 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = fma(_1767, _1767, _1771);
    float _1783 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1785 = _1781 + _1779;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1789 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1787);
    float _1791 = precise::clamp(_1789, 0.0, 1.0);
    float _1793 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1783);
    float _1795 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = rsqrt(_1785);
    float _1799 = -_1791;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1793);
    float _1805 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1807 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1813 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1805);
    float _1821 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1827 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = -_1823;
    float _1833 = fma(_1831, _1809, 1.0);
    float _1835 = _1797 * _1751;
    float _1837 = _1797 * _1767;
    float _1839 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1825);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = _1797 * _1759;
    float _1849 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1857 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = log2(_1833);
    float _1861 = -_1847;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1863, -0.5, 0.5);
    float _1871 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1873 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1875 = exp2(_1857);
    float _1877 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1863, 0.5, 0.5);
    float _1881 = _1837 + 1.0;
    float _1883 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1885 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1887 = 1.0 / _1871;
    float _1889 = fma(_1879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1885);
    float _1893 = _1859 * 0.693147182464599609375;
    float _1895 = fma(_1879, _1889, -0.212114393711090087890625);
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1899 = sqrt(_1869);
    float _1901 = -_1837;
    float _1903 = fma(_1875, _1881, _1901);
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1883);
    float _1907 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1909 = fma(_1879, _1895, 1.570728778839111328125);
    float _1911 = fma(_1903, 0.5, 0.5);
    float _1913 = _1905 * _1887;
    float _1915 = _1907 * _1887;
    float _1917 = fma(_1913, 0.5, 0.5);
    float _1919 = fma(_1915, -0.5, 0.5);
    float _1921 = _1899 * 0.636619746685028076171875;
    float _1923 = -_1909;
    float _1925 = fma(_1921, _1923, 1.0);
    float3 _5735 = float3(_1917, _1919, _1897);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5735, float3(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5735, float3(0.0), isnan(_5735)), level(0.0)).x;
    float3 _5746 = float3(_1917, _1919, _1897);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5746, float3(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5746, float3(0.0), isnan(_5746)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float2 _5763 = float2(_1925, _1911);
    float3 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).xyz;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = float(uint(_815));
    float _1952 = trunc(_961);
    int _1954 = int(_1952);
    int _1956 = ~_815;
    int _1958 = _1956 + 1;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1962 = ~_815;
    int _1964 = _1962 + 1;
    float _1966 = -_1009;
    float _1968 = _1966 + 1.0;
    int _1970 = abs(_799);
    float _1972 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    int _1974 = abs(_809);
    float _1976 = 1.0 / _1950;
    float _1978 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1980 = -_981;
    float _1982 = _1980 + 1.0;
    float _1984 = float(uint(_1954));
    float _1986 = float(_1954);
    bool _1988 = _1986 >= _983;
    bool _1990 = isnan(_1986);
    bool _1992 = _1988 || _1990;
    bool _1994 = isnan(_983);
    bool _1996 = _1992 || _1994;
    float _1998 = float(_1996);
    int _2000 = as_type<int>(_1976) + (-2);
    float _2002 = trunc(_1998);
    int _2004 = int(_2002);
    float _2006 = as_type<float>(_2000) * _1984;
    float _2008 = trunc(_2006);
    float _2010 = precise::max(_2008, 0.0);
    uint _2013 = uint(_2010);
    int _2015 = _1958 * int(_2013);
    int _2017 = _2015 + _1954;
    float _2019 = float(uint(_2017));
    float _2021 = as_type<float>(_2000) * _2019;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _753;
    bool _2029 = !_2025;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = _2031 * _143;
    float _2041 = floor(_2039);
    float _2043 = _991 * _2027;
    int _2045 = int(_2013) + int(_2037);
    float _2047 = trunc(_2043);
    int _2049 = int(_2047);
    int _2051 = _1964 * _2045;
    int _2053 = _2051 + _1954;
    float _2055 = -_2041;
    float _2057 = _2039 + _2055;
    int _2059 = _815 + (-1);
    bool _2061 = uint(_2053) >= uint(_815);
    bool _2063 = !_2061;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _815 == 0;
    int _2069 = ~_2045;
    int _2071 = _2069 + _2065;
    int _2073 = _2071 + 1;
    float _2075 = _2057 * _983;
    int _2077 = _815 * _2073;
    int _2079 = _2077 + _1954;
    float _2081 = trunc(_2075);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2004;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2067;
    int _2097 = _2095 ? _2079 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    int _2107 = _2097 * _2093;
    int _2109 = abs(_787);
    int _2111 = abs(_2101);
    int _2113 = _2004 * _2059;
    int _2115 = _2113 + _2107;
    bool _2117 = !_2105;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _2083 * _2111;
    int _2123 = _2121 + _1954;
    int _2125 = _2115 * _2109;
    int _2127 = abs(_2119);
    int _2129 = _2049 * _1970;
    int _2131 = _2129 + _2125;
    int _2133 = ~_815;
    int _2135 = _2133 + 1;
    int _2137 = ~_815;
    int _2139 = _2137 + 1;
    int _2141 = _2123 * _1974;
    int _2143 = _2141 + _2131;
    int _2145 = ~_815;
    int _2147 = _2145 + 1;
    int _2149 = _2083 * _2127;
    int _2151 = _2149 + _2143;
    float _2153 = float(uint(_2151));
    float _2155 = as_type<float>(_2000) * _2153;
    float _2157 = trunc(_2155);
    float _2159 = precise::max(_2157, 0.0);
    uint _2161 = uint(_2159);
    int _2163 = _2135 * int(_2161);
    int _2165 = _2163 + _2151;
    float _2167 = float(uint(_2165));
    float _2169 = as_type<float>(_2000) * _2167;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    int _2177 = int(_2161) + int(_2175);
    float _2179 = float(uint(_2123));
    int _2181 = _2139 * _2177;
    int _2183 = _2181 + _2151;
    float _2185 = as_type<float>(_2000) * _2179;
    bool _2187 = uint(_2183) >= uint(_815);
    float _2189 = trunc(_2185);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    bool _2195 = !_2187;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = ~_2177;
    int _2201 = _2199 + _2197;
    int _2203 = _2201 + 1;
    int _2205 = _815 * _2203;
    int _2207 = _2205 + _2151;
    int _2209 = ~_815;
    int _2211 = _2209 + 1;
    bool _2213 = !_2067;
    int _2215 = _2213 ? _2207 : (-1);
    int _2217 = _2211 * int(_2193);
    int _2219 = _2217 + _2123;
    int _2221 = _2215 >> 31;
    float _2223 = float(uint(_2219));
    int _2225 = _2221 & 3;
    int _2227 = _2215 & 3;
    bool _2229 = _2227 != 0;
    float _2231 = as_type<float>(_2000) * _2223;
    int _2233 = _2215 + _2225;
    bool _2235 = uint(_2227) > 1u;
    int _2237 = _2233 >> 2;
    float _2239 = trunc(_2231);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2215 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2237 << 4;
    int _2251 = _2249 + 368;
    int _2253 = _2247 ? 0 : 1;
    uint _2255 = uint(int(uint(_2251) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    bool _2271 = _2227 != 3;
    bool _2273 = uint(_2227) >= 2u;
    int _2275 = _2251 + 8;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
    int _2281 = int(_2277) & 3;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[int(_2279)][_2281];
    int _2285 = int(_2277) + 1;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    int _2289 = _2285 & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2193) + int(_2243);
    int _2295 = ~_2253;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = _2299;
    if (!_2235)
    {
        int _2303 = ~_2253;
        int _2305 = _2303 + 1;
        _2301 = _2305;
    }
    int _2307 = _2301;
    int _2309 = _2147 * _2293;
    int _2311 = _2309 + _2123;
    bool _2313 = !_2229;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2319 = int(_2317);
    int _2321 = _2273 ? 0 : 1;
    bool _2323 = uint(_2311) >= uint(_815);
    bool _2325 = _2227 != 3;
    bool _2327 = !_2323;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = ~_2321;
    int _2333 = _2331 + 1;
    int _2335 = _2333 + 1;
    int _2337 = ~_2293;
    int _2339 = _2337 + _2329;
    int _2341 = _2339 + 1;
    int _2343 = abs(_2307);
    int _2345 = abs(_2315);
    int _2347 = _815 * _2341;
    int _2349 = _2347 + _2123;
    int _2351 = ~_2343;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _2335;
    if (_2271)
    {
        int _2359 = ~_2321;
        int _2361 = _2359 + 1;
        _2357 = _2361;
    }
    int _2363 = _2357;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2367 = _2365 != 0;
    bool _2369 = !_2325;
    int _2371 = _2369 ? 0 : (-1);
    int _2373 = ~_2345;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = abs(_2363);
    int _2381 = _2355 * as_type<int>(_2269);
    bool _2383 = !_2367;
    int _2385 = _2383 ? 0 : 1;
    int _2387 = abs(_2371);
    int _2389 = _2377 * as_type<int>(_2261);
    int _2391 = _2389 + _2381;
    int _2393 = abs(_2385);
    int _2395 = ~_2379;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = float(uint(_2319));
    int _2403 = _2399 * as_type<int>(_2283);
    int _2405 = _2403 + _2391;
    int _2407 = ~_2387;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    int _2413 = abs(_2319);
    float _2415 = 1.0 / _2401;
    int _2417 = _2411 * as_type<int>(_2291);
    int _2419 = _2417 + _2405;
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    bool _2427 = !_2067;
    int _2429 = _2427 ? _2349 : (-1);
    int _2431 = _2419 * _2425;
    float _2433 = float(uint(_2413));
    int _2435 = _2429 * _2393;
    int _2437 = _2435 + _2431;
    float _2439 = 1.0 / _2433;
    bool _2441 = _143 > 0.5;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2445 = _755 + _2443;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2447;
    int _2451 = as_type<int>(_2415) + (-2);
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2455 = _2453 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2457 = float(uint(_2437));
    float _2459 = 1.0 / _2449;
    int _2461 = ~_2319;
    int _2463 = _2461 + 1;
    float _2465 = as_type<float>(_2451) * _2457;
    int _2467 = abs(_2437);
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2471 = _2469 != 0;
    int _2473 = as_type<int>(_2439) + (-2);
    float _2475 = trunc(_2465);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = float(uint(_2467));
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    bool _2487 = _763 > 0.5;
    float _2489 = as_type<float>(_2473) * _2481;
    float _2491 = _2445 * _2459;
    float _2493 = 1.0 / _2455;
    int _2495 = ~_2413;
    int _2497 = _2495 + 1;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _755 + _2499;
    bool _2503 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2505 = isnan(_755);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = trunc(_2489);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    int _2521 = _2463 * int(_2479);
    int _2523 = _2521 + _2437;
    float _2525 = -_2513;
    float _2527 = _2525 + 1.0;
    float _2529 = float(uint(_2523));
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2531;
    float _2535 = _2501 * _2493;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2537;
    float _2541 = as_type<float>(_2451) * _2529;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2543;
    float _2547 = fma(_2533, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2549 = fma(_2539, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2497 * int(_2519);
    int _2559 = _2557 + _2467;
    float _2561 = fma(_2545, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2563 = float(uint(_2559));
    bool _2565 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2567 = isnan(_755);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = -_1117;
    int _2579 = _2441 ? as_type<int>(_2577) : as_type<int>(_1117);
    float _2581 = as_type<float>(_2473) * _2563;
    bool _2583 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2585 = isnan(_755);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    float _2595 = -_2575;
    float _2597 = _2595 + 1.0;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2601 = _2599 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2603 = _2575 * _2527;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2607 = _2605 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2609 = trunc(_2581);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2617 = _2615 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2619 = _2593 * _2597;
    float _2621 = fma(_2601, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = fma(_2607, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2625 = fma(_2617, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2627 = ~_2319;
    int _2629 = _2627 + 1;
    float _2631 = _2561 * _2619;
    float _2633 = _2547 * _2619;
    float _2635 = _2549 * _2619;
    int _2637 = int(_2479) + int(_2555);
    float _2639 = -_2593;
    float _2641 = _2639 + 1.0;
    int _2643 = ~_2413;
    int _2645 = _2643 + 1;
    bool _2647 = !_2471;
    float _2649 = _2647 ? _1117 : as_type<float>(_2579);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2631);
    int _2653 = int(_2519) + int(_2613);
    float _2655 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2633);
    float _2657 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2635);
    int _2659 = _2645 * _2653;
    int _2661 = _2659 + _2467;
    float _2663 = fma(_2623, _2603, _2651);
    int _2665 = _2629 * _2637;
    int _2667 = _2665 + _2437;
    float _2669 = fma(_2621, _2603, _2655);
    float _2671 = fma(_2625, _2603, _2657);
    bool _2673 = uint(_2661) >= uint(_2413);
    float _2675 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2663);
    bool _2677 = uint(_2667) >= uint(_2319);
    float _2679 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2669);
    bool _2681 = !_2673;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2671);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2693 = ~_2683;
    int _2695 = _2653 + _2693;
    int _2697 = _2695 + 1;
    float _2699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2701 = ~_2637;
    int _2703 = _2701 + _2689;
    int _2705 = _2703 + 1;
    float _2707 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2709 = _2437 ^ _2319;
    float _2711 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2713 = _2319 == 0;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2437;
    uint _2719 = uint(int(uint(_2709) >> uint(31)));
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2723 = _2319 == 0;
    float _2725 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2727 = ~int(_2719);
    int _2729 = _2727 + 1;
    float _2731 = _2675 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2733 = -_1113;
    int _2735 = _2487 ? as_type<int>(_2733) : as_type<int>(_1113);
    float _2737 = _2707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2739 = _2697 ^ _2729;
    float _2741 = exp2(_2725);
    bool _2743 = !_2485;
    float _2745 = _2743 ? _1113 : as_type<float>(_2735);
    float _2747 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2729;
    int _2751 = _2749 + _2739;
    int _2753 = _2751 + 1;
    float _2755 = _2699 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2757 = !_2713;
    int _2759 = _2757 ? _2717 : (-1);
    bool _2761 = !_2723;
    int _2763 = _2761 ? _2753 : (-1);
    float _2765 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2767 = float(_2759);
    out.m_62.x = _2711;
    out.m_62.y = _2747;
    out.m_62.z = _2737;
    float _2769 = float(_2763);
    bool _2771 = _1609 > 0.0;
    bool _2773 = isnan(_1609);
    bool _2775 = _2771 || _2773;
    bool _2777 = isnan(0.0);
    bool _2779 = _2775 || _2777;
    float _2781 = fma(_2755, _2767, _803);
    float _2783 = -_2741;
    float _2785 = _2783 + 1.0;
    float _2787 = -_999;
    float _2789 = fma(_2765, _2769, _2787);
    float _2791 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1978);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2795 = _2649 + 0.5;
    float _2797 = _2745 + (-0.5);
    float _2799 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2793 * _1927;
    float _2803 = fma(_2755, _2795, _2781);
    float _2805 = -_2765;
    float _2807 = fma(_2805, _2797, _2789);
    float _2809 = _2791 + _1871;
    float _2811 = _255 * _2799;
    float _2813 = fma(_2745, _1968, _2807);
    float _2815 = _2809 * 0.5;
    float _2817 = _1938 * _2801;
    float _2819 = _1948 * _2801;
    float _2821 = -_2793;
    float _2823 = _2821 + 1.0;
    out.gl_Position.x = _1905;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _2791;
    out.gl_Position.w = _1871;
    float _2825 = -_1982;
    float _2827 = fma(_2649, _2825, _2803);
    float _2829 = _2811 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _2815;
    out.m_64.w = _1871;
    out.m_66.x = _2827;
    out.m_66.y = _2813;
    out.m_45.x = _2829;
    float _2831 = fma(_1944, _2817, _1932);
    float _2833 = fma(_1946, _2817, _1934);
    float _2835 = _1938 * _2823;
    float _2837 = fma(_1938, _2819, _1936);
    out.m_68.x = _2831;
    out.m_68.y = _2833;
    out.m_68.z = _2837;
    out.m_68.w = _2835;
    if (_2779)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2839;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _745 = false;
    bool _601 = false;
    bool _427 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2896 = as_type<float>(_103);
        out.gl_Position.z = _2896;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2966 = as_type<float>(_141);
        out.gl_Position.z = _2966;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = in.m_51.x;
    float _151 = in.m_51.y;
    float _153 = in.m_51.z;
    float _155 = _147 * _145;
    float _157 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = _157 * 6.283185482025146484375;
    float _161 = floor(_157);
    int _163 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _165 = _163 != 0;
    float _167 = _151 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _159 * 0.15915493667125701904296875;
    float _171 = _151 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _175 = _173 != 0;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _179 = _177 != 0;
    float _181 = _151 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _185 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].x, _171);
    float _187 = _169 * 6.283185482025146484375;
    float _189 = cos(_187);
    bool _191 = !_175;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].x, _181);
    bool _197 = !_165;
    int _199 = _197 ? 0 : 1;
    int _201 = abs(_193);
    float _203 = -_161;
    float _205 = _157 + _203;
    bool _207 = !_179;
    int _209 = _207 ? 0 : 1;
    int _211 = abs(_199);
    float _213 = float(_201);
    float _215 = -_205;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_189, 0.5, 0.5);
    int _223 = abs(_209);
    float _225 = abs(_217);
    float _227 = _213 * _225;
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _233 = _205 < 0.5;
    float _235 = float(_233);
    float _237 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _239 = float(_211);
    float _241 = -_235;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _245 = float(_223);
    float _247 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _249 = fma(_239, _231, _227);
    float _251 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _253 = abs(_243);
    float _255 = fma(_245, _253, _249);
    bool _257 = !_219;
    float _259 = _237;
    float _261 = _251;
    float _263 = _247;
    float _279;
    if (!_257)
    {
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_87);
        float _285 = 1.0 / _283;
        float _287 = _121 * _285;
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
        float _413 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_87);
        float _431 = 1.0 / _429;
        float _433 = _121 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_53.x;
    float _439 = in.m_53.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _465 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _467 = isnan(_435);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _459;
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _481 = 1.0 / _463;
    float _483 = _407 * _439;
    float _485 = -_455;
    float _487 = _485 + 1.0;
    float _489 = _443 * _477;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _435 + _491;
    bool _495 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _497 = isnan(_435);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _507;
    float _511 = _405 * _437;
    float _513 = _505 * _487;
    float _515 = -_505;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _523;
    float _527 = fma(_509, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _529 = _475 * _517;
    float _531 = fma(_521, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_525, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _493 * _481;
    float _537 = _527 * _529;
    float _539 = _531 * _529;
    float _541 = _533 * _529;
    float _543 = -_475;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _561 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _563 = fma(_549, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_553, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _567 = fma(_557, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _569 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[107].z, _537);
    float _571 = fma(_563, _513, _559);
    float _573 = fma(_565, _513, _561);
    float _575 = fma(_567, _513, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_479;
    float _599;
    if (!_583)
    {
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _587 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_87);
        float _605 = 1.0 / _603;
        float _607 = _121 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _613 = _609 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _635 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _637 = isnan(_609);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _647;
    bool _651 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _653 = isnan(_609);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _617;
    float _665 = -_629;
    float _667 = _665 + 1.0;
    bool _669 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _671 = _645 * _667;
    float _673 = -_645;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _633;
    float _679 = _649 * _663;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _683 = _681 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _685 = fma(_679, _613, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _687 = _683 * _677;
    float _689 = _685 * _671;
    float _691 = -_661;
    float _693 = _691 + 1.0;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _697 = _609 + _695;
    float _699 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _701 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _689);
    float _703 = _629 * _693;
    float _705 = fma(_687, _697, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _707 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _709 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = fma(_705, _703, _701);
    float _713 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[117].x, _711);
    float _719 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _709;
    out.m_55.y = _719;
    out.m_55.z = _715;
    out.m_55.w = _721;
    bool _723 = !_669;
    float _741;
    float _743;
    if (!_723)
    {
        float _725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _727 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _729 = float(_87);
        float _731 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _733 = _731 * _725;
        float _735 = floor(_733);
        float _737 = -_735;
        float _739 = _733 + _737;
        _741 = _729;
        _743 = _739;
        _745 = true;
    }
    else
    {
        float _747 = float(_87);
        float _749 = 1.0 / _747;
        float _751 = _121 * _749;
        _741 = _747;
        _743 = _751;
    }
    _745 = false;
    float _753 = _741;
    float _755 = _743;
    float _757 = in.m_49.z;
    float _759 = _143 * 2.0;
    float _761 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _763 = in.m_49.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _775 = _773 != 0;
    float _777 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _779 = int(_777);
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _783 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _785 = !_771;
    int _787 = _785 ? 0 : 1;
    float _789 = -_781;
    float _791 = fma(_761, 2.0, _789);
    float _793 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _795 = floor(_759);
    bool _797 = !_767;
    int _799 = _797 ? 0 : 1;
    float _801 = -_121;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _791);
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _807 = !_775;
    int _809 = _807 ? 0 : 1;
    float _811 = float(_779);
    float _813 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _815 = int(_813);
    float _817 = _757 * 2.0;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _821 = 1.0 + _819;
    float _823 = _763 * 2.0;
    float _825 = _763 + _757;
    bool _827 = _795 > 0.0;
    float _829 = floor(_817);
    bool _831 = _795 >= 0.0;
    bool _833 = isnan(_795);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _763 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _843 = _825 + (-1.0);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _855 = _853 != 0;
    float _857 = fma(_841, -2.0, _805);
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _861 = floor(_823);
    int _863 = _839 ? 0 : 1;
    bool _865 = !_851;
    int _867 = _865 ? 0 : 1;
    bool _869 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _871 = isnan(1.0);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _877 = _873 || _875;
    int _879 = abs(_867);
    float _881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _883 = log2(_881);
    bool _885 = _829 >= 0.0;
    bool _887 = isnan(_829);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    bool _895 = _829 > 0.0;
    int _897 = ~_863;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _893 ? 0 : 1;
    float _905 = 1.0 / _811;
    int _907 = _901;
    if (!_827)
    {
        int _909 = ~_863;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    bool _915 = _861 > 0.0;
    bool _917 = _861 >= 0.0;
    bool _919 = isnan(_861);
    bool _921 = _917 || _919;
    bool _923 = isnan(0.0);
    bool _925 = _921 || _923;
    float _927 = float(_913);
    float _929 = _883 * _121;
    float _931 = float(_879);
    float _933 = 1.0 / _821;
    int _935 = ~_903;
    int _937 = _935 + 1;
    int _939 = _937 + 1;
    float _941 = _931 * _927;
    int _943 = _939;
    if (!_895)
    {
        int _945 = ~_903;
        int _947 = _945 + 1;
        _943 = _947;
    }
    int _949 = _943;
    float _951 = in.m_57.x;
    float _953 = in.m_57.y;
    float _955 = in.m_57.z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = exp2(_929);
    float _961 = _905 * _121;
    float _963 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    bool _965 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _973 = _969 || _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _977 = !_847;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _963);
    float _983 = float(_815);
    float _985 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[78].w, _975);
    int _987 = abs(_979);
    float _989 = float(_949);
    float _991 = _983 * _121;
    float _993 = float(_987);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    int _1001 = _925 ? 0 : 1;
    float _1003 = _941 * (-2.0);
    float _1005 = _993 * _989;
    float _1007 = _973 ? _997 : 0.0;
    float _1009 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _985);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    float _1017 = _1005 * (-2.0);
    int _1019 = _1015;
    if (!_915)
    {
        int _1021 = ~_1001;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    if (_877)
    {
        float _1027 = _1007 * _933;
        _123 = _1027;
    }
    float _1029 = _123;
    bool _1031 = !_855;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = fma(_1003, _953, _953);
    float _1037 = _143 + _763;
    int _1039 = abs(_1033);
    float _1041 = fma(_859, _1003, _859);
    float _1043 = _763 + (-0.5);
    float _1045 = _1037 + (-1.0);
    float _1047 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1035);
    float _1049 = float(_1039);
    float _1051 = float(_1025);
    float _1053 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1055 = fma(_1041, _1029, _1047);
    float _1057 = fma(_1017, _951, _951);
    float _1059 = as_type<float>(int(gl_VertexIndex));
    float _1061 = fma(_1053, _1017, _1053);
    float _1063 = _143 + (-0.5);
    float _1065 = _143 + _757;
    float _1067 = _1049 * _1051;
    float _1069 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1071 = _1065 + (-1.0);
    float _1073 = _1067 * (-2.0);
    float _1075 = _757 + (-0.5);
    float _1077 = fma(_1061, _1029, _1069);
    float _1079 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1081 = fma(_1073, _955, _955);
    float _1083 = _1055 * 0.15915493667125701904296875;
    float _1085 = _1077 * 0.15915493667125701904296875;
    float _1087 = fma(_1079, _1073, _1079);
    float _1089 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1081);
    float _1091 = _1083 * 6.283185482025146484375;
    float _1093 = sin(_1091);
    float _1095 = fma(_1087, _1029, _1089);
    float _1097 = _1095 * 0.15915493667125701904296875;
    int _1099 = as_type<int>(_1059) & 1;
    bool _1101 = _1099 != 0;
    int _1103 = as_type<int>(_1059) & 2;
    bool _1105 = _1103 != 0;
    float _1107 = _1085 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    bool _1111 = !_1105;
    float _1113 = _1111 ? (-0.5) : 0.5;
    bool _1115 = !_1101;
    float _1117 = _1115 ? (-0.5) : 0.5;
    float _1119 = _1085 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1113);
    float _1125 = _783 * _1123;
    float _1127 = _1097 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = in.m_42.x;
    float _1133 = in.m_42.y;
    float _1135 = in.m_42.z;
    float _1137 = _1109 * _1093;
    float _1139 = _1083 * 6.283185482025146484375;
    float _1141 = cos(_1139);
    float _1143 = _1097 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1117);
    float _1149 = _1093 * _1129;
    float _1151 = _1129 * _1125;
    float _1153 = _793 * _1147;
    float _1155 = _1121 * _1093;
    float _1157 = _1121 * _1151;
    float _1159 = _1109 * _1141;
    float _1161 = _1121 * _1141;
    float _1163 = _1141 * _1129;
    float _1165 = -_1155;
    float _1167 = fma(_1145, _1159, _1165);
    float _1169 = fma(_1145, _1161, _1137);
    float _1171 = -_1159;
    float _1173 = fma(_1145, _1155, _1171);
    float _1175 = -_1125;
    float _1177 = _1145 * _1175;
    float _1179 = _1109 * _1151;
    float _1181 = fma(_1169, _1153, _1157);
    float _1183 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1185 = fma(_1163, _1153, _1177);
    float _1187 = fma(_1145, _1137, _1161);
    float _1189 = fma(_1167, _1153, _1179);
    float _1191 = fma(_1173, _1183, _1181);
    float _1193 = fma(_1149, _1183, _1185);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1197 = fma(_1187, _1183, _1189);
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1201 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1203 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1195);
    float _1205 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1199);
    float _1209 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1201);
    float _1211 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1203);
    float _1213 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1205);
    float _1215 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1207);
    float _1217 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1209);
    float _1219 = _1211 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1221 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1213);
    float _1223 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1225 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1227 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1231 = _1219 + _1223;
    float _1233 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1235 = fma(_1131, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = _1225 + _1229;
    float _1239 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1241 = _1231 + _1239;
    float _1243 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1233);
    float _1245 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1249 = _1237 + _1247;
    float _1251 = _1241 * _1241;
    float _1253 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1243);
    float _1255 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1257 = fma(_1249, _1249, _1251);
    float _1259 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1261 = sqrt(_1257);
    float _1263 = _1255 + _1259;
    bool _1265 = _1261 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = _1251;
    float _1269 = _1135;
    float _1271 = _1237;
    float _1273 = _1225;
    if (!_1265)
    {
        _1267 = _1237;
    }
    float _1275 = _1267;
    float _1277 = _1275;
    if (!_1265)
    {
        _1269 = _1231;
    }
    float _1279 = _1269;
    float _1281 = _1279;
    if (!_1265)
    {
        _1271 = _1263;
    }
    float _1283 = _1271;
    bool _1285 = !_1265;
    float _1287 = _1283;
    if (!_1285)
    {
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1293 = _1261 + _1291;
        float _1295 = rsqrt(_1257);
        float _1297 = _1293 * _1289;
        float _1299 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = _1297 * 0.15915493667125701904296875;
        float _1303 = _1301 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        float _1307 = _1301 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1305 + (-1.0);
        float _1313 = fma(_1309, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1315 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = _1295 * _1313;
        float _1319 = fma(_1263, _1305, _1315);
        float _1321 = fma(_1249, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1323 = fma(_1241, _1317, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1287 = _1319;
        _1277 = _1321;
        _1281 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1277;
    float _1329 = _1281;
    float _1331 = -_1255;
    float _1333 = _1331 + _1325;
    float _1335 = -_1225;
    float _1337 = _1335 + _1327;
    float _1339 = -_1219;
    float _1341 = _1339 + _1329;
    float _1343 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1333 * _1333;
    bool _1347 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1359 = fma(_1337, _1337, _1345);
    bool _1361 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1363 = isnan(0.5);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1369 = _1365 || _1367;
    float _1371 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1357);
    float _1373 = fma(_1341, _1341, _1359);
    float _1375 = _1255 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1379 = sqrt(_1373);
    float _1381 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1383 = fma(_1219, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1381);
    float _1385 = 1.0 / _1377;
    float _1387 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1389 = _1387 + _1377;
    bool _1391 = _1379 > 0.0;
    float _1393 = _1389 * _1385;
    float _1395 = _1393 * 0.5;
    bool _1397 = !_1391;
    float _1399 = _1327;
    float _1401 = _1325;
    float _1403 = _1329;
    float _1405 = _1379;
    float _1407 = _1387;
    if (!_1397)
    {
        float _1409 = _237 * _237;
        float _1411 = fma(_247, _247, _1409);
        float _1413 = fma(_251, _251, _1411);
        float _1415 = rsqrt(_1373);
        float _1417 = sqrt(_1413);
        float _1419 = _1337 * _1415;
        float _1421 = _1333 * _1415;
        float _1423 = _1341 * _1415;
        bool _1425 = _1417 > 0.0;
        bool _1427 = !_1425;
        _1405 = _1419;
        _1407 = _1415;
        if (!_1427)
        {
            float _1429 = rsqrt(_1413);
            float _1431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1433 = _237 * _1429;
            float _1435 = _247 * _1429;
            float _1437 = _251 * _1429;
            float _1439 = _1421 * _1433;
            float _1441 = fma(_1419, _1435, _1439);
            float _1443 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1445 = fma(_1423, _1437, _1441);
            float _1447 = _1445 * _1443;
            float _1449 = fma(_247, _1447, _1327);
            float _1451 = fma(_237, _1447, _1325);
            float _1453 = fma(_251, _1447, _1329);
            _1399 = _1449;
            _1401 = _1451;
            _1403 = _1453;
            _1407 = _1447;
        }
    }
    float _1455 = _1399;
    float _1457 = _1401;
    float _1459 = _1403;
    float _1461 = _1405;
    float _1463 = _1407;
    float _1465 = _1463;
    float _1467 = _1455;
    float _1469 = _1461;
    if (_1369)
    {
        _1465 = 1.0;
    }
    float _1471 = _1465;
    float _1473 = _1471;
    if (_1355)
    {
        _259 = _1455;
    }
    float _1475 = _259;
    float _1477 = _1475;
    if (_1355)
    {
        _261 = _1457;
    }
    float _1479 = _261;
    float _1481 = _1479;
    if (_1355)
    {
        _263 = _1459;
    }
    float _1483 = _263;
    float _1485 = _1483;
    if (!_1355)
    {
        float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1489 = _1255 + _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1493 = _1225 + _1491;
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1497 = -_1225;
        float _1499 = _1497 + _1455;
        float _1501 = _1489 * _1489;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1505 = _1219 + _1503;
        float _1507 = -_1219;
        float _1509 = _1507 + _1459;
        float _1511 = fma(_1493, _1493, _1501);
        float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1515 = fma(_1505, _1505, _1511);
        float _1517 = sqrt(_1515);
        float _1519 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1521 = precise::min(_1517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1523 = _1521 * _1513;
        float _1525 = _1519 * _1523;
        float _1527 = -_1255;
        float _1529 = _1527 + _1457;
        float _1531 = fma(_1499, _1525, _1225);
        float _1533 = fma(_1529, _1525, _1255);
        float _1535 = fma(_1509, _1525, _1219);
        _1481 = _1533;
        _1477 = _1531;
        _1485 = _1535;
        _1467 = _1499;
    }
    float _1537 = _1481;
    float _1539 = _1477;
    float _1541 = _1485;
    float _1543 = _1467;
    float _1545 = _1543;
    if (!_1369)
    {
        float _1547 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1553);
        float _1557 = _1549 * 6.283185482025146484375;
        float _1559 = cos(_1557);
        float _1561 = _1551 * 0.15915493667125701904296875;
        float _1563 = _1549 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        float _1567 = 1.0 / _1559;
        float _1569 = _1561 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        float _1573 = _1565 * _1567;
        float _1575 = _1561 * 6.283185482025146484375;
        float _1577 = sin(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1555;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = 1.0 / _1579;
        float _1589 = 1.0 / _1585;
        float _1591 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1593 = _1581 * _1591;
        float _1595 = _1577 * _1587;
        float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1599 = fma(_1595, _1593, _1597);
        float _1601 = _1599 * _1589;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1545 = _1587;
        _1273 = _1585;
        _1473 = _1603;
    }
    float _1605 = _1545;
    float _1607 = _1273;
    float _1609 = _1473;
    float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1613 = _1537 + _1611;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1617 = _1539 + _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1621 = _1541 + _1619;
    float _1623 = _1613 * _1613;
    float _1625 = fma(_1617, _1617, _1623);
    float _1627 = fma(_1621, _1621, _1625);
    float _1629 = rsqrt(_1627);
    float _1631 = sqrt(_1627);
    float _1633 = _1629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1635 = _1617 * _1633;
    float _1637 = _1621 * _1633;
    float _1639 = _1635 * _1635;
    float _1641 = _1637 * _1637;
    float _1643 = _1639 + _1641;
    float _1645 = sqrt(_1643);
    bool _1647 = _1645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1651 = _1645 + _1649;
    float _1653 = _1629;
    float _1655 = _1607;
    float _1657 = _1651;
    float _1659 = _1605;
    float _1661 = _1613;
    if (_1647)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1653 = _1663;
    }
    float _1665 = _1653;
    if (_1647)
    {
        float _1667 = rsqrt(_1643);
        _1655 = _1667;
    }
    float _1669 = _1655;
    float _1671 = _1669;
    if (_1647)
    {
        float _1673 = _1651 * _1665;
        _1657 = _1673;
    }
    float _1675 = _1657;
    if (_1647)
    {
        float _1677 = _1675 * 0.15915493667125701904296875;
        _1659 = _1677;
    }
    float _1679 = _1659;
    float _1681 = _1665;
    float _1683 = _1679;
    if (_1647)
    {
        float _1685 = _1679 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        _1681 = _1687;
    }
    float _1689 = _1681;
    float _1691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1693 = precise::max(0.0, _1691);
    float _1695 = _1621;
    float _1697 = _1693;
    if (_1647)
    {
        float _1699 = _1679 * 6.283185482025146484375;
        float _1701 = cos(_1699);
        _1695 = _1701;
    }
    float _1703 = _1695;
    float _1705 = -_1633;
    float _1707 = -_1693;
    float _1709 = fma(_1613, _1705, _1707);
    if (!_1647)
    {
        _1661 = _1637;
    }
    float _1711 = _1661;
    float _1713 = _1711;
    if (_1647)
    {
        float _1715 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1715;
    }
    float _1717 = _1697;
    float _1719 = _1689;
    float _1721 = _1717;
    if (_1647)
    {
        float _1723 = fma(_1689, _1717, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1719 = _1723;
    }
    float _1725 = _1719;
    float _1727 = _1725;
    float _1729 = _1703;
    if (_1647)
    {
        float _1731 = _1703 + (-1.0);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1647)
    {
        float _1737 = _1669 * _1725;
        _1469 = _1737;
    }
    float _1739 = _1469;
    if (!_1647)
    {
        _1671 = _1635;
    }
    float _1741 = _1671;
    float _1743 = _1741;
    if (_1647)
    {
        float _1745 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1745;
    }
    float _1747 = _1683;
    if (_1647)
    {
        float _1749 = _1635 * _1739;
        _1743 = _1749;
    }
    float _1751 = _1743;
    if (!_1647)
    {
        _1727 = _1709;
    }
    float _1753 = _1727;
    float _1755 = _1753;
    if (_1647)
    {
        float _1757 = _1637 * _1739;
        _1713 = _1757;
    }
    float _1759 = _1713;
    if (!_1647)
    {
        _1735 = _1639;
    }
    float _1761 = _1735;
    float _1763 = _1761;
    if (_1647)
    {
        float _1765 = fma(_1709, _1703, _1747);
        _1755 = _1765;
    }
    float _1767 = _1755;
    if (_1647)
    {
        float _1769 = _1751 * _1751;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (!_1647)
    {
        _1729 = _1641;
    }
    float _1773 = _1729;
    float _1775 = _1773;
    if (_1647)
    {
        float _1777 = _1759 * _1759;
        _1775 = _1777;
    }
    float _1779 = _1775;
    float _1781 = fma(_1767, _1767, _1771);
    float _1783 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1785 = _1781 + _1779;
    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1789 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1787);
    float _1791 = precise::clamp(_1789, 0.0, 1.0);
    float _1793 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1783);
    float _1795 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = rsqrt(_1785);
    float _1799 = -_1791;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1793);
    float _1805 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1807 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1795);
    float _1809 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1811 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1813 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = abs(_1801);
    float _1817 = log2(_1815);
    float _1819 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1805);
    float _1821 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1807);
    float _1823 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1825 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1827 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = -_1823;
    float _1833 = fma(_1831, _1809, 1.0);
    float _1835 = _1797 * _1751;
    float _1837 = _1797 * _1767;
    float _1839 = fma(_1541, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1825);
    float _1841 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1845 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = _1797 * _1759;
    float _1849 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1851 = -_1843;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1851);
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    float _1857 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1859 = log2(_1833);
    float _1861 = -_1847;
    float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1853);
    float _1865 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    float _1867 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1869 = fma(_1863, -0.5, 0.5);
    float _1871 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1865);
    float _1873 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1867);
    float _1875 = exp2(_1857);
    float _1877 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1879 = fma(_1863, 0.5, 0.5);
    float _1881 = _1837 + 1.0;
    float _1883 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1873);
    float _1885 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1877);
    float _1887 = 1.0 / _1871;
    float _1889 = fma(_1879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1891 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1885);
    float _1893 = _1859 * 0.693147182464599609375;
    float _1895 = fma(_1879, _1889, -0.212114393711090087890625);
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1899 = sqrt(_1869);
    float _1901 = -_1837;
    float _1903 = fma(_1875, _1881, _1901);
    float _1905 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1883);
    float _1907 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1891);
    float _1909 = fma(_1879, _1895, 1.570728778839111328125);
    float _1911 = fma(_1903, 0.5, 0.5);
    float _1913 = _1905 * _1887;
    float _1915 = _1907 * _1887;
    float _1917 = fma(_1913, 0.5, 0.5);
    float _1919 = fma(_1915, -0.5, 0.5);
    float _1921 = _1899 * 0.636619746685028076171875;
    float _1923 = -_1909;
    float _1925 = fma(_1921, _1923, 1.0);
    float3 _5735 = float3(_1917, _1919, _1897);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5735, float3(0.0), isnan(_5735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5735, float3(0.0), isnan(_5735)), level(0.0)).x;
    float3 _5746 = float3(_1917, _1919, _1897);
    float4 _1930 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5746, float3(0.0), isnan(_5746)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5746, float3(0.0), isnan(_5746)), level(0.0)).xyzw;
    float _1932 = _1930.x;
    float _1934 = _1930.y;
    float _1936 = _1930.z;
    float _1938 = _1930.w;
    float2 _5763 = float2(_1925, _1911);
    float3 _1942 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5763, float2(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5763, float2(0.0), isnan(_5763)), level(0.0)).xyz;
    float _1944 = _1942.x;
    float _1946 = _1942.y;
    float _1948 = _1942.z;
    float _1950 = float(uint(_815));
    float _1952 = trunc(_961);
    int _1954 = int(_1952);
    int _1956 = ~_815;
    int _1958 = _1956 + 1;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1962 = ~_815;
    int _1964 = _1962 + 1;
    float _1966 = -_1009;
    float _1968 = _1966 + 1.0;
    int _1970 = abs(_799);
    float _1972 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    int _1974 = abs(_809);
    float _1976 = 1.0 / _1950;
    float _1978 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1972);
    float _1980 = -_981;
    float _1982 = _1980 + 1.0;
    float _1984 = float(uint(_1954));
    float _1986 = float(_1954);
    bool _1988 = _1986 >= _983;
    bool _1990 = isnan(_1986);
    bool _1992 = _1988 || _1990;
    bool _1994 = isnan(_983);
    bool _1996 = _1992 || _1994;
    float _1998 = float(_1996);
    int _2000 = as_type<int>(_1976) + (-2);
    float _2002 = trunc(_1998);
    int _2004 = int(_2002);
    float _2006 = as_type<float>(_2000) * _1984;
    float _2008 = trunc(_2006);
    float _2010 = precise::max(_2008, 0.0);
    uint _2013 = uint(_2010);
    int _2015 = _1958 * int(_2013);
    int _2017 = _2015 + _1954;
    float _2019 = float(uint(_2017));
    float _2021 = as_type<float>(_2000) * _2019;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _753;
    bool _2029 = !_2025;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = _2031 * _143;
    float _2041 = floor(_2039);
    float _2043 = _991 * _2027;
    int _2045 = int(_2013) + int(_2037);
    float _2047 = trunc(_2043);
    int _2049 = int(_2047);
    int _2051 = _1964 * _2045;
    int _2053 = _2051 + _1954;
    float _2055 = -_2041;
    float _2057 = _2039 + _2055;
    int _2059 = _815 + (-1);
    bool _2061 = uint(_2053) >= uint(_815);
    bool _2063 = !_2061;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _815 == 0;
    int _2069 = ~_2045;
    int _2071 = _2069 + _2065;
    int _2073 = _2071 + 1;
    float _2075 = _2057 * _983;
    int _2077 = _815 * _2073;
    int _2079 = _2077 + _1954;
    float _2081 = trunc(_2075);
    int _2083 = int(_2081);
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2087 = _2085 != 0;
    int _2089 = ~_2004;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    bool _2095 = !_2067;
    int _2097 = _2095 ? _2079 : (-1);
    bool _2099 = !_2087;
    int _2101 = _2099 ? 0 : 1;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2105 = _2103 != 0;
    int _2107 = _2097 * _2093;
    int _2109 = abs(_787);
    int _2111 = abs(_2101);
    int _2113 = _2004 * _2059;
    int _2115 = _2113 + _2107;
    bool _2117 = !_2105;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _2083 * _2111;
    int _2123 = _2121 + _1954;
    int _2125 = _2115 * _2109;
    int _2127 = abs(_2119);
    int _2129 = _2049 * _1970;
    int _2131 = _2129 + _2125;
    int _2133 = ~_815;
    int _2135 = _2133 + 1;
    int _2137 = ~_815;
    int _2139 = _2137 + 1;
    int _2141 = _2123 * _1974;
    int _2143 = _2141 + _2131;
    int _2145 = ~_815;
    int _2147 = _2145 + 1;
    int _2149 = _2083 * _2127;
    int _2151 = _2149 + _2143;
    float _2153 = float(uint(_2151));
    float _2155 = as_type<float>(_2000) * _2153;
    float _2157 = trunc(_2155);
    float _2159 = precise::max(_2157, 0.0);
    uint _2161 = uint(_2159);
    int _2163 = _2135 * int(_2161);
    int _2165 = _2163 + _2151;
    float _2167 = float(uint(_2165));
    float _2169 = as_type<float>(_2000) * _2167;
    float _2171 = trunc(_2169);
    float _2173 = precise::max(_2171, 0.0);
    uint _2175 = uint(_2173);
    int _2177 = int(_2161) + int(_2175);
    float _2179 = float(uint(_2123));
    int _2181 = _2139 * _2177;
    int _2183 = _2181 + _2151;
    float _2185 = as_type<float>(_2000) * _2179;
    bool _2187 = uint(_2183) >= uint(_815);
    float _2189 = trunc(_2185);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    bool _2195 = !_2187;
    int _2197 = _2195 ? 0 : (-1);
    int _2199 = ~_2177;
    int _2201 = _2199 + _2197;
    int _2203 = _2201 + 1;
    int _2205 = _815 * _2203;
    int _2207 = _2205 + _2151;
    int _2209 = ~_815;
    int _2211 = _2209 + 1;
    bool _2213 = !_2067;
    int _2215 = _2213 ? _2207 : (-1);
    int _2217 = _2211 * int(_2193);
    int _2219 = _2217 + _2123;
    int _2221 = _2215 >> 31;
    float _2223 = float(uint(_2219));
    int _2225 = _2221 & 3;
    int _2227 = _2215 & 3;
    bool _2229 = _2227 != 0;
    float _2231 = as_type<float>(_2000) * _2223;
    int _2233 = _2215 + _2225;
    bool _2235 = uint(_2227) > 1u;
    int _2237 = _2233 >> 2;
    float _2239 = trunc(_2231);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2215 & 3;
    bool _2247 = _2245 != 0;
    int _2249 = _2237 << 4;
    int _2251 = _2249 + 368;
    int _2253 = _2247 ? 0 : 1;
    uint _2255 = uint(int(uint(_2251) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    bool _2271 = _2227 != 3;
    bool _2273 = uint(_2227) >= 2u;
    int _2275 = _2251 + 8;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    uint _2279 = uint(int(uint(int(_2277)) >> uint(2)));
    int _2281 = int(_2277) & 3;
    float _2283 = (*spvDescriptorSet0.vp_c9)._m0[int(_2279)][_2281];
    int _2285 = int(_2277) + 1;
    uint _2287 = uint(int(uint(_2285) >> uint(2)));
    int _2289 = _2285 & 3;
    float _2291 = (*spvDescriptorSet0.vp_c9)._m0[int(_2287)][_2289];
    int _2293 = int(_2193) + int(_2243);
    int _2295 = ~_2253;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = _2299;
    if (!_2235)
    {
        int _2303 = ~_2253;
        int _2305 = _2303 + 1;
        _2301 = _2305;
    }
    int _2307 = _2301;
    int _2309 = _2147 * _2293;
    int _2311 = _2309 + _2123;
    bool _2313 = !_2229;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2319 = int(_2317);
    int _2321 = _2273 ? 0 : 1;
    bool _2323 = uint(_2311) >= uint(_815);
    bool _2325 = _2227 != 3;
    bool _2327 = !_2323;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = ~_2321;
    int _2333 = _2331 + 1;
    int _2335 = _2333 + 1;
    int _2337 = ~_2293;
    int _2339 = _2337 + _2329;
    int _2341 = _2339 + 1;
    int _2343 = abs(_2307);
    int _2345 = abs(_2315);
    int _2347 = _815 * _2341;
    int _2349 = _2347 + _2123;
    int _2351 = ~_2343;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    int _2357 = _2335;
    if (_2271)
    {
        int _2359 = ~_2321;
        int _2361 = _2359 + 1;
        _2357 = _2361;
    }
    int _2363 = _2357;
    int _2365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2367 = _2365 != 0;
    bool _2369 = !_2325;
    int _2371 = _2369 ? 0 : (-1);
    int _2373 = ~_2345;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    int _2379 = abs(_2363);
    int _2381 = _2355 * as_type<int>(_2269);
    bool _2383 = !_2367;
    int _2385 = _2383 ? 0 : 1;
    int _2387 = abs(_2371);
    int _2389 = _2377 * as_type<int>(_2261);
    int _2391 = _2389 + _2381;
    int _2393 = abs(_2385);
    int _2395 = ~_2379;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = float(uint(_2319));
    int _2403 = _2399 * as_type<int>(_2283);
    int _2405 = _2403 + _2391;
    int _2407 = ~_2387;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    int _2413 = abs(_2319);
    float _2415 = 1.0 / _2401;
    int _2417 = _2411 * as_type<int>(_2291);
    int _2419 = _2417 + _2405;
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    bool _2427 = !_2067;
    int _2429 = _2427 ? _2349 : (-1);
    int _2431 = _2419 * _2425;
    float _2433 = float(uint(_2413));
    int _2435 = _2429 * _2393;
    int _2437 = _2435 + _2431;
    float _2439 = 1.0 / _2433;
    bool _2441 = _143 > 0.5;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2445 = _755 + _2443;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2447;
    int _2451 = as_type<int>(_2415) + (-2);
    float _2453 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2455 = _2453 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2457 = float(uint(_2437));
    float _2459 = 1.0 / _2449;
    int _2461 = ~_2319;
    int _2463 = _2461 + 1;
    float _2465 = as_type<float>(_2451) * _2457;
    int _2467 = abs(_2437);
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2471 = _2469 != 0;
    int _2473 = as_type<int>(_2439) + (-2);
    float _2475 = trunc(_2465);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    float _2481 = float(uint(_2467));
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    bool _2487 = _763 > 0.5;
    float _2489 = as_type<float>(_2473) * _2481;
    float _2491 = _2445 * _2459;
    float _2493 = 1.0 / _2455;
    int _2495 = ~_2413;
    int _2497 = _2495 + 1;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2501 = _755 + _2499;
    bool _2503 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2505 = isnan(_755);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = trunc(_2489);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    int _2521 = _2463 * int(_2479);
    int _2523 = _2521 + _2437;
    float _2525 = -_2513;
    float _2527 = _2525 + 1.0;
    float _2529 = float(uint(_2523));
    float _2531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2531;
    float _2535 = _2501 * _2493;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2537;
    float _2541 = as_type<float>(_2451) * _2529;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2543;
    float _2547 = fma(_2533, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2549 = fma(_2539, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2497 * int(_2519);
    int _2559 = _2557 + _2467;
    float _2561 = fma(_2545, _2491, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2563 = float(uint(_2559));
    bool _2565 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2567 = isnan(_755);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = -_1117;
    int _2579 = _2441 ? as_type<int>(_2577) : as_type<int>(_1117);
    float _2581 = as_type<float>(_2473) * _2563;
    bool _2583 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2585 = isnan(_755);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2591 = _2587 || _2589;
    float _2593 = float(_2591);
    float _2595 = -_2575;
    float _2597 = _2595 + 1.0;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2601 = _2599 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2603 = _2575 * _2527;
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2607 = _2605 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2609 = trunc(_2581);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2617 = _2615 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2619 = _2593 * _2597;
    float _2621 = fma(_2601, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = fma(_2607, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2625 = fma(_2617, _2535, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2627 = ~_2319;
    int _2629 = _2627 + 1;
    float _2631 = _2561 * _2619;
    float _2633 = _2547 * _2619;
    float _2635 = _2549 * _2619;
    int _2637 = int(_2479) + int(_2555);
    float _2639 = -_2593;
    float _2641 = _2639 + 1.0;
    int _2643 = ~_2413;
    int _2645 = _2643 + 1;
    bool _2647 = !_2471;
    float _2649 = _2647 ? _1117 : as_type<float>(_2579);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2631);
    int _2653 = int(_2519) + int(_2613);
    float _2655 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2633);
    float _2657 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2635);
    int _2659 = _2645 * _2653;
    int _2661 = _2659 + _2467;
    float _2663 = fma(_2623, _2603, _2651);
    int _2665 = _2629 * _2637;
    int _2667 = _2665 + _2437;
    float _2669 = fma(_2621, _2603, _2655);
    float _2671 = fma(_2625, _2603, _2657);
    bool _2673 = uint(_2661) >= uint(_2413);
    float _2675 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2663);
    bool _2677 = uint(_2667) >= uint(_2319);
    float _2679 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2669);
    bool _2681 = !_2673;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = fma(_2513, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2671);
    bool _2687 = !_2677;
    int _2689 = _2687 ? 0 : (-1);
    float _2691 = _2679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2693 = ~_2683;
    int _2695 = _2653 + _2693;
    int _2697 = _2695 + 1;
    float _2699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2701 = ~_2637;
    int _2703 = _2701 + _2689;
    int _2705 = _2703 + 1;
    float _2707 = _2685 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2709 = _2437 ^ _2319;
    float _2711 = _2691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2713 = _2319 == 0;
    int _2715 = _2319 * _2705;
    int _2717 = _2715 + _2437;
    uint _2719 = uint(int(uint(_2709) >> uint(31)));
    float _2721 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2723 = _2319 == 0;
    float _2725 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2727 = ~int(_2719);
    int _2729 = _2727 + 1;
    float _2731 = _2675 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2733 = -_1113;
    int _2735 = _2487 ? as_type<int>(_2733) : as_type<int>(_1113);
    float _2737 = _2707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2739 = _2697 ^ _2729;
    float _2741 = exp2(_2725);
    bool _2743 = !_2485;
    float _2745 = _2743 ? _1113 : as_type<float>(_2735);
    float _2747 = _2731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2749 = ~_2729;
    int _2751 = _2749 + _2739;
    int _2753 = _2751 + 1;
    float _2755 = _2699 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2757 = !_2713;
    int _2759 = _2757 ? _2717 : (-1);
    bool _2761 = !_2723;
    int _2763 = _2761 ? _2753 : (-1);
    float _2765 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2767 = float(_2759);
    out.m_62.x = _2711;
    out.m_62.y = _2747;
    out.m_62.z = _2737;
    float _2769 = float(_2763);
    bool _2771 = _1609 > 0.0;
    bool _2773 = isnan(_1609);
    bool _2775 = _2771 || _2773;
    bool _2777 = isnan(0.0);
    bool _2779 = _2775 || _2777;
    float _2781 = fma(_2755, _2767, _803);
    float _2783 = -_2741;
    float _2785 = _2783 + 1.0;
    float _2787 = -_999;
    float _2789 = fma(_2765, _2769, _2787);
    float _2791 = fma(_1849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1978);
    float _2793 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2795 = _2649 + 0.5;
    float _2797 = _2745 + (-0.5);
    float _2799 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2801 = _2793 * _1927;
    float _2803 = fma(_2755, _2795, _2781);
    float _2805 = -_2765;
    float _2807 = fma(_2805, _2797, _2789);
    float _2809 = _2791 + _1871;
    float _2811 = _255 * _2799;
    float _2813 = fma(_2745, _1968, _2807);
    float _2815 = _2809 * 0.5;
    float _2817 = _1938 * _2801;
    float _2819 = _1948 * _2801;
    float _2821 = -_2793;
    float _2823 = _2821 + 1.0;
    out.gl_Position.x = _1905;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _2791;
    out.gl_Position.w = _1871;
    float _2825 = -_1982;
    float _2827 = fma(_2649, _2825, _2803);
    float _2829 = _2811 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _2815;
    out.m_64.w = _1871;
    out.m_66.x = _2827;
    out.m_66.y = _2813;
    out.m_45.x = _2829;
    float _2831 = fma(_1944, _2817, _1932);
    float _2833 = fma(_1946, _2817, _1934);
    float _2835 = _1938 * _2823;
    float _2837 = fma(_1938, _2819, _1936);
    out.m_68.x = _2831;
    out.m_68.y = _2833;
    out.m_68.z = _2837;
    out.m_68.w = _2835;
    if (_2779)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2839;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

