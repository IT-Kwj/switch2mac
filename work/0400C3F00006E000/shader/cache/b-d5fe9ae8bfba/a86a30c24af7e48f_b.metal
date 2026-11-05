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
    float4 m_55 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _371 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1458 = as_type<float>(_101);
        out.gl_Position.z = _1458;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_137);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_279);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _299;
    float _325 = _315 * _303;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _283 * _323;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    float _337 = fma(_319, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = _337 * _325;
    float _343 = _339 * _325;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_321;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _117 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _379 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _405 = 1.0 / _395;
    bool _407 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_379);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _399;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _423 = 1.0 / _403;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _383 * _405;
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _387 * _419;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = -_449;
    float _463 = _461 + 1.0;
    float _465 = _449 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _391 * _423;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _483;
    float _487 = _417 * _463;
    float _489 = -_417;
    float _491 = _489 + 1.0;
    float _493 = fma(_481, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _495 = fma(_485, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _497 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_379);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _513 = fma(_469, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_475, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = _507 * _491;
    float _519 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = _471 * _517;
    float _527 = _493 * _517;
    float _529 = _495 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _531;
    float _535 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _549 = fma(_533, _437, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _551 = fma(_541, _437, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _553 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _555 = fma(_519, _487, _535);
    float _557 = fma(_513, _487, _537);
    float _559 = fma(_515, _487, _547);
    float _561 = fma(_549, _465, _555);
    float _563 = fma(_551, _465, _557);
    float _565 = fma(_553, _465, _559);
    float _567 = in.m_53.x;
    float _569 = in.m_53.y;
    float _571 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].x, _561);
    float _573 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].y, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].z, _565);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _585;
    out.m_55.y = _587;
    out.m_55.z = _589;
    out.m_55.w = _577;
    float _591 = _351 * _569;
    float _593 = _349 * _567;
    bool _595 = !_421;
    float _611;
    if (!_595)
    {
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _599 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _117 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = in.m_42.x;
    float _627 = in.m_42.y;
    float _629 = in.m_42.z;
    int _631 = as_type<int>(_623) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_623) & 2;
    bool _637 = _635 != 0;
    float _639 = _251 * _591;
    float _641 = _251 * _593;
    float _643 = _627 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _645 = !_637;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _651 = !_633;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[6].x, _643);
    float _659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _663 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _649 * _659;
    float _667 = _627 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = _655 * _661;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = _665 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _675 = _665 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _679 = _627 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _681 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _673);
    float _683 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[5].x, _679);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _681);
    float _691 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _683);
    float _695 = _685 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _697 = _689 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _699 = _665 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _705 = _691 + _697;
    float _707 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _709 = _695 + _701;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _715 * _715;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _727 = fma(_721, _721, _723);
    float _729 = _711 + _725;
    float _731 = sqrt(_727);
    bool _733 = _731 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _671;
    float _737 = _723;
    float _739 = _625;
    float _741 = _705;
    if (!_733)
    {
        _735 = _709;
    }
    float _743 = _735;
    float _745 = _743;
    if (!_733)
    {
        _737 = _705;
    }
    float _747 = _737;
    float _749 = _747;
    if (!_733)
    {
        _739 = _729;
    }
    float _751 = _739;
    bool _753 = !_733;
    float _755 = _751;
    if (!_753)
    {
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _761 = _731 + _759;
        float _763 = _729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = rsqrt(_727);
        float _767 = _761 * _757;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = _769 * 6.283185482025146484375;
        float _777 = sin(_775);
        float _779 = _773 + (-1.0);
        float _781 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = fma(_777, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _785 = fma(_729, _773, _781);
        float _787 = _765 * _783;
        float _789 = fma(_721, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _791 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _755 = _785;
        _745 = _789;
        _749 = _791;
    }
    float _793 = _755;
    float _795 = _745;
    float _797 = _749;
    float _799 = -_711;
    float _801 = _799 + _793;
    float _803 = -_695;
    float _805 = _803 + _795;
    float _807 = -_691;
    float _809 = _807 + _797;
    float _811 = _801 * _801;
    float _813 = fma(_805, _805, _811);
    float _815 = fma(_809, _809, _813);
    float _817 = sqrt(_815);
    bool _819 = _817 > 0.0;
    bool _821 = !_819;
    float _823 = _793;
    float _825 = _795;
    float _827 = _797;
    float _829 = _805;
    if (!_821)
    {
        float _831 = _245 * _245;
        float _833 = fma(_197, _197, _831);
        float _835 = fma(_247, _247, _833);
        float _837 = rsqrt(_815);
        float _839 = sqrt(_835);
        float _841 = _805 * _837;
        float _843 = _801 * _837;
        float _845 = _809 * _837;
        bool _847 = _839 > 0.0;
        bool _849 = !_847;
        if (!_849)
        {
            float _851 = rsqrt(_835);
            float _853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _855 = _245 * _851;
            float _857 = _197 * _851;
            float _859 = _247 * _851;
            float _861 = _843 * _855;
            float _863 = fma(_841, _857, _861);
            float _865 = _853 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _867 = fma(_845, _859, _863);
            float _869 = _867 * _865;
            float _871 = fma(_197, _869, _795);
            float _873 = fma(_245, _869, _793);
            float _875 = fma(_247, _869, _797);
            _823 = _873;
            _825 = _871;
            _827 = _875;
            _829 = _863;
        }
    }
    float _877 = _823;
    float _879 = _825;
    float _881 = _827;
    float _883 = _829;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _877 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _881 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _895;
    float _927 = _915;
    float _929 = _923;
    float _931 = _883;
    float _933 = _905;
    float _935 = _907;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _939;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _897;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    float _983 = _981;
    if (_919)
    {
        float _985 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _985;
    }
    float _987 = _969;
    float _989 = sqrt(_901);
    float _991 = _961;
    float _993 = _987;
    if (_919)
    {
        float _995 = fma(_961, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (_919)
    {
        float _1001 = _975 + (-1.0);
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _1003;
    if (_919)
    {
        float _1007 = _943 * _997;
        _741 = _1007;
    }
    float _1009 = _741;
    if (!_919)
    {
        _999 = _981;
    }
    float _1011 = _999;
    float _1013 = _1011;
    if (_919)
    {
        float _1015 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _1015;
    }
    float _1017 = _933;
    if (_919)
    {
        float _1019 = _907 * _1009;
        _935 = _1019;
    }
    float _1021 = _935;
    if (!_919)
    {
        _1005 = _909;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_919)
    {
        float _1027 = _909 * _1009;
        _1025 = _1027;
    }
    float _1029 = _1025;
    if (!_919)
    {
        _945 = _911;
    }
    float _1031 = _945;
    float _1033 = _1031;
    if (_919)
    {
        float _1035 = fma(_981, _975, _1017);
        _1013 = _1035;
    }
    float _1037 = _1013;
    if (_919)
    {
        float _1039 = _1021 * _1021;
        _1033 = _1039;
    }
    float _1041 = _1033;
    if (!_919)
    {
        _983 = _913;
    }
    float _1043 = _983;
    float _1045 = _1043;
    if (_919)
    {
        float _1047 = _1029 * _1029;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1051 + _1049;
    float _1055 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1059 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1057);
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1065 = rsqrt(_1053);
    float _1067 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1055);
    float _1069 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1067);
    float _1077 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1081 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1083 = abs(_1073);
    float _1085 = log2(_1083);
    float _1087 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1091 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1081);
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1095 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1099 = _1065 * _1021;
    float _1101 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1111 = _1065 * _1029;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = _1065 * _1037;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1119 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1123 = -_1107;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1123);
    float _1127 = -_1117;
    float _1129 = fma(_1127, _1063, 1.0);
    float _1131 = exp2(_1119);
    float _1133 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1121);
    float _1135 = -_1111;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1125);
    float _1139 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = fma(_1137, -0.5, 0.5);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = log2(_1129);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1145, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1155 = _1115 + 1.0;
    float _1157 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1159 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1161 = fma(_1145, _1153, -0.212114393711090087890625);
    float _1163 = 1.0 / _1133;
    float _1165 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1157);
    float _1167 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1169 = fma(_1145, _1161, 1.570728778839111328125);
    float _1171 = -_1115;
    float _1173 = fma(_1131, _1155, _1171);
    float _1175 = sqrt(_1143);
    float _1177 = _1147 * 0.693147182464599609375;
    float _1179 = fma(_1173, 0.5, 0.5);
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1183 = _1165 * _1163;
    float _1185 = _1167 * _1163;
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = fma(_1185, -0.5, 0.5);
    float _1191 = _1175 * 0.636619746685028076171875;
    float3 _3254 = float3(_1187, _1189, _1181);
    float _1193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).x;
    float3 _3265 = float3(_1187, _1189, _1181);
    float4 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3265, float3(0.0), isnan(_3265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3265, float3(0.0), isnan(_3265)), level(0.0)).xyzw;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = _1196.w;
    float _1206 = -_1169;
    float _1208 = fma(_1191, _1206, 1.0);
    float2 _3287 = float2(_1208, _1179);
    float3 _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3287, float2(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3287, float2(0.0), isnan(_3287)), level(0.0)).xyz;
    float _1214 = _1212.x;
    float _1216 = _1212.y;
    float _1218 = _1212.z;
    float _1220 = in.m_49.y;
    float _1222 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1224 = _139 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1228 = _621 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1230;
    float _1234 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1236 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1222);
    float _1238 = 1.0 / _1232;
    float _1240 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1240);
    float _1248 = -_653;
    int _1250 = _1224 ? as_type<int>(_1248) : as_type<int>(_653);
    float _1252 = exp2(_1234);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    bool _1258 = !_1244;
    float _1260 = _1258 ? _653 : as_type<float>(_1250);
    float _1262 = _1228 * _1238;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1266 = _1220 > 0.5;
    float _1268 = _1260 + 0.5;
    bool _1270 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1272 = isnan(_621);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1282;
    bool _1286 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1288 = isnan(_621);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1302;
    float _1306 = -_1280;
    float _1308 = _1306 + 1.0;
    float _1310 = fma(_1284, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = fma(_1300, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1314 = fma(_1304, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1316 = _1296 * _1308;
    float _1318 = -_647;
    int _1320 = _1266 ? as_type<int>(_1318) : as_type<int>(_647);
    float _1322 = -_1296;
    float _1324 = _1322 + 1.0;
    float _1326 = -_1252;
    float _1328 = _1326 + 1.0;
    float _1330 = _1310 * _1316;
    float _1332 = _1312 * _1316;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1314 * _1316;
    bool _1338 = !_1256;
    float _1340 = _1338 ? _647 : as_type<float>(_1320);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1348 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1350 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1342);
    float _1352 = -_1340;
    float _1354 = _1352 + 0.5;
    float _1356 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1344);
    float _1358 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1348);
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1362 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = _1246 + _1133;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1362 * _1264;
    float _1376 = _1364 * _1334;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1370 * 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1374;
    out.m_60.y = _1376;
    out.m_62.x = _1372;
    out.m_62.y = _1378;
    out.m_62.z = _1380;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1133;
    out.m_64.z = _1382;
    out.m_64.w = _1133;
    out.m_45.x = _1384;
    float _1386 = _1346 * _1193;
    float _1388 = -_1346;
    float _1390 = _1388 + 1.0;
    float _1392 = _1204 * _1386;
    float _1394 = _1218 * _1386;
    float _1396 = fma(_1214, _1392, _1198);
    float _1398 = fma(_1216, _1392, _1200);
    float _1400 = _1204 * _1390;
    float _1402 = fma(_1204, _1394, _1202);
    out.m_66.x = _1396;
    out.m_66.y = _1398;
    out.m_66.z = _1402;
    out.m_66.w = _1400;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _371 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1458 = as_type<float>(_101);
        out.gl_Position.z = _1458;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_137);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_279);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _299;
    float _325 = _315 * _303;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _283 * _323;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    float _337 = fma(_319, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = _337 * _325;
    float _343 = _339 * _325;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_321;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _117 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _379 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _405 = 1.0 / _395;
    bool _407 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_379);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _399;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _423 = 1.0 / _403;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _383 * _405;
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _387 * _419;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = -_449;
    float _463 = _461 + 1.0;
    float _465 = _449 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _391 * _423;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _483;
    float _487 = _417 * _463;
    float _489 = -_417;
    float _491 = _489 + 1.0;
    float _493 = fma(_481, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _495 = fma(_485, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _497 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_379);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _513 = fma(_469, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_475, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = _507 * _491;
    float _519 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = _471 * _517;
    float _527 = _493 * _517;
    float _529 = _495 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _531;
    float _535 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _549 = fma(_533, _437, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _551 = fma(_541, _437, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _553 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _555 = fma(_519, _487, _535);
    float _557 = fma(_513, _487, _537);
    float _559 = fma(_515, _487, _547);
    float _561 = fma(_549, _465, _555);
    float _563 = fma(_551, _465, _557);
    float _565 = fma(_553, _465, _559);
    float _567 = in.m_53.x;
    float _569 = in.m_53.y;
    float _571 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].x, _561);
    float _573 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].y, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].z, _565);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _585;
    out.m_55.y = _587;
    out.m_55.z = _589;
    out.m_55.w = _577;
    float _591 = _351 * _569;
    float _593 = _349 * _567;
    bool _595 = !_421;
    float _611;
    if (!_595)
    {
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _599 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _117 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = in.m_42.x;
    float _627 = in.m_42.y;
    float _629 = in.m_42.z;
    int _631 = as_type<int>(_623) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_623) & 2;
    bool _637 = _635 != 0;
    float _639 = _251 * _591;
    float _641 = _251 * _593;
    float _643 = _627 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _645 = !_637;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _651 = !_633;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[6].x, _643);
    float _659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _663 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _649 * _659;
    float _667 = _627 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = _655 * _661;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = _665 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _675 = _665 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _679 = _627 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _681 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _673);
    float _683 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[5].x, _679);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _681);
    float _691 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _683);
    float _695 = _685 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _697 = _689 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _699 = _665 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _705 = _691 + _697;
    float _707 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _709 = _695 + _701;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _715 * _715;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _727 = fma(_721, _721, _723);
    float _729 = _711 + _725;
    float _731 = sqrt(_727);
    bool _733 = _731 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _671;
    float _737 = _723;
    float _739 = _625;
    float _741 = _705;
    if (!_733)
    {
        _735 = _709;
    }
    float _743 = _735;
    float _745 = _743;
    if (!_733)
    {
        _737 = _705;
    }
    float _747 = _737;
    float _749 = _747;
    if (!_733)
    {
        _739 = _729;
    }
    float _751 = _739;
    bool _753 = !_733;
    float _755 = _751;
    if (!_753)
    {
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _761 = _731 + _759;
        float _763 = _729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = rsqrt(_727);
        float _767 = _761 * _757;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = _769 * 6.283185482025146484375;
        float _777 = sin(_775);
        float _779 = _773 + (-1.0);
        float _781 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = fma(_777, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _785 = fma(_729, _773, _781);
        float _787 = _765 * _783;
        float _789 = fma(_721, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _791 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _755 = _785;
        _745 = _789;
        _749 = _791;
    }
    float _793 = _755;
    float _795 = _745;
    float _797 = _749;
    float _799 = -_711;
    float _801 = _799 + _793;
    float _803 = -_695;
    float _805 = _803 + _795;
    float _807 = -_691;
    float _809 = _807 + _797;
    float _811 = _801 * _801;
    float _813 = fma(_805, _805, _811);
    float _815 = fma(_809, _809, _813);
    float _817 = sqrt(_815);
    bool _819 = _817 > 0.0;
    bool _821 = !_819;
    float _823 = _793;
    float _825 = _795;
    float _827 = _797;
    float _829 = _805;
    if (!_821)
    {
        float _831 = _245 * _245;
        float _833 = fma(_197, _197, _831);
        float _835 = fma(_247, _247, _833);
        float _837 = rsqrt(_815);
        float _839 = sqrt(_835);
        float _841 = _805 * _837;
        float _843 = _801 * _837;
        float _845 = _809 * _837;
        bool _847 = _839 > 0.0;
        bool _849 = !_847;
        if (!_849)
        {
            float _851 = rsqrt(_835);
            float _853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _855 = _245 * _851;
            float _857 = _197 * _851;
            float _859 = _247 * _851;
            float _861 = _843 * _855;
            float _863 = fma(_841, _857, _861);
            float _865 = _853 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _867 = fma(_845, _859, _863);
            float _869 = _867 * _865;
            float _871 = fma(_197, _869, _795);
            float _873 = fma(_245, _869, _793);
            float _875 = fma(_247, _869, _797);
            _823 = _873;
            _825 = _871;
            _827 = _875;
            _829 = _863;
        }
    }
    float _877 = _823;
    float _879 = _825;
    float _881 = _827;
    float _883 = _829;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _877 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _881 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _895;
    float _927 = _915;
    float _929 = _923;
    float _931 = _883;
    float _933 = _905;
    float _935 = _907;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _939;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _897;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    float _983 = _981;
    if (_919)
    {
        float _985 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _985;
    }
    float _987 = _969;
    float _989 = sqrt(_901);
    float _991 = _961;
    float _993 = _987;
    if (_919)
    {
        float _995 = fma(_961, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (_919)
    {
        float _1001 = _975 + (-1.0);
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _1003;
    if (_919)
    {
        float _1007 = _943 * _997;
        _741 = _1007;
    }
    float _1009 = _741;
    if (!_919)
    {
        _999 = _981;
    }
    float _1011 = _999;
    float _1013 = _1011;
    if (_919)
    {
        float _1015 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _1015;
    }
    float _1017 = _933;
    if (_919)
    {
        float _1019 = _907 * _1009;
        _935 = _1019;
    }
    float _1021 = _935;
    if (!_919)
    {
        _1005 = _909;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_919)
    {
        float _1027 = _909 * _1009;
        _1025 = _1027;
    }
    float _1029 = _1025;
    if (!_919)
    {
        _945 = _911;
    }
    float _1031 = _945;
    float _1033 = _1031;
    if (_919)
    {
        float _1035 = fma(_981, _975, _1017);
        _1013 = _1035;
    }
    float _1037 = _1013;
    if (_919)
    {
        float _1039 = _1021 * _1021;
        _1033 = _1039;
    }
    float _1041 = _1033;
    if (!_919)
    {
        _983 = _913;
    }
    float _1043 = _983;
    float _1045 = _1043;
    if (_919)
    {
        float _1047 = _1029 * _1029;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1051 + _1049;
    float _1055 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1059 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1057);
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1065 = rsqrt(_1053);
    float _1067 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1055);
    float _1069 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1067);
    float _1077 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1081 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1083 = abs(_1073);
    float _1085 = log2(_1083);
    float _1087 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1091 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1081);
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1095 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1099 = _1065 * _1021;
    float _1101 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1111 = _1065 * _1029;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = _1065 * _1037;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1119 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1123 = -_1107;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1123);
    float _1127 = -_1117;
    float _1129 = fma(_1127, _1063, 1.0);
    float _1131 = exp2(_1119);
    float _1133 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1121);
    float _1135 = -_1111;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1125);
    float _1139 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = fma(_1137, -0.5, 0.5);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = log2(_1129);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1145, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1155 = _1115 + 1.0;
    float _1157 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1159 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1161 = fma(_1145, _1153, -0.212114393711090087890625);
    float _1163 = 1.0 / _1133;
    float _1165 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1157);
    float _1167 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1169 = fma(_1145, _1161, 1.570728778839111328125);
    float _1171 = -_1115;
    float _1173 = fma(_1131, _1155, _1171);
    float _1175 = sqrt(_1143);
    float _1177 = _1147 * 0.693147182464599609375;
    float _1179 = fma(_1173, 0.5, 0.5);
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1183 = _1165 * _1163;
    float _1185 = _1167 * _1163;
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = fma(_1185, -0.5, 0.5);
    float _1191 = _1175 * 0.636619746685028076171875;
    float3 _3254 = float3(_1187, _1189, _1181);
    float _1193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).x;
    float3 _3265 = float3(_1187, _1189, _1181);
    float4 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3265, float3(0.0), isnan(_3265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3265, float3(0.0), isnan(_3265)), level(0.0)).xyzw;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = _1196.w;
    float _1206 = -_1169;
    float _1208 = fma(_1191, _1206, 1.0);
    float2 _3287 = float2(_1208, _1179);
    float3 _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3287, float2(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3287, float2(0.0), isnan(_3287)), level(0.0)).xyz;
    float _1214 = _1212.x;
    float _1216 = _1212.y;
    float _1218 = _1212.z;
    float _1220 = in.m_49.y;
    float _1222 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1224 = _139 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1228 = _621 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1230;
    float _1234 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1236 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1222);
    float _1238 = 1.0 / _1232;
    float _1240 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1240);
    float _1248 = -_653;
    int _1250 = _1224 ? as_type<int>(_1248) : as_type<int>(_653);
    float _1252 = exp2(_1234);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    bool _1258 = !_1244;
    float _1260 = _1258 ? _653 : as_type<float>(_1250);
    float _1262 = _1228 * _1238;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1266 = _1220 > 0.5;
    float _1268 = _1260 + 0.5;
    bool _1270 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1272 = isnan(_621);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1282;
    bool _1286 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1288 = isnan(_621);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1302;
    float _1306 = -_1280;
    float _1308 = _1306 + 1.0;
    float _1310 = fma(_1284, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = fma(_1300, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1314 = fma(_1304, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1316 = _1296 * _1308;
    float _1318 = -_647;
    int _1320 = _1266 ? as_type<int>(_1318) : as_type<int>(_647);
    float _1322 = -_1296;
    float _1324 = _1322 + 1.0;
    float _1326 = -_1252;
    float _1328 = _1326 + 1.0;
    float _1330 = _1310 * _1316;
    float _1332 = _1312 * _1316;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1314 * _1316;
    bool _1338 = !_1256;
    float _1340 = _1338 ? _647 : as_type<float>(_1320);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1348 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1350 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1342);
    float _1352 = -_1340;
    float _1354 = _1352 + 0.5;
    float _1356 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1344);
    float _1358 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1348);
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1362 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = _1246 + _1133;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1362 * _1264;
    float _1376 = _1364 * _1334;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1370 * 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1374;
    out.m_60.y = _1376;
    out.m_62.x = _1372;
    out.m_62.y = _1378;
    out.m_62.z = _1380;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1133;
    out.m_64.z = _1382;
    out.m_64.w = _1133;
    out.m_45.x = _1384;
    float _1386 = _1346 * _1193;
    float _1388 = -_1346;
    float _1390 = _1388 + 1.0;
    float _1392 = _1204 * _1386;
    float _1394 = _1218 * _1386;
    float _1396 = fma(_1214, _1392, _1198);
    float _1398 = fma(_1216, _1392, _1200);
    float _1400 = _1204 * _1390;
    float _1402 = fma(_1204, _1394, _1202);
    out.m_66.x = _1396;
    out.m_66.y = _1398;
    out.m_66.z = _1402;
    out.m_66.w = _1400;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _371 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1458 = as_type<float>(_101);
        out.gl_Position.z = _1458;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_85);
        _95 = _119;
    }
    float _121 = _95;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_127)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1527 = as_type<float>(_137);
        out.gl_Position.z = _1527;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    float _159 = floor(_157);
    float _161 = _157 * 6.283185482025146484375;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _161 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_165;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    bool _185 = !_169;
    int _187 = _185 ? 0 : 1;
    float _189 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _191 = _175 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_187);
    float _201 = -_159;
    float _203 = _157 + _201;
    int _205 = abs(_181);
    bool _207 = !_155;
    int _209 = _207 ? 0 : 1;
    float _211 = -_203;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _217 = abs(_209);
    float _219 = float(_205);
    float _221 = fma(_193, 0.5, 0.5);
    bool _223 = _203 < 0.5;
    float _225 = float(_223);
    float _227 = abs(_213);
    float _229 = _219 * _227;
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_217);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_199);
    float _243 = fma(_235, _233, _229);
    float _245 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _189);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _243);
    bool _253 = !_215;
    float _269;
    if (!_253)
    {
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_85);
        float _275 = 1.0 / _273;
        float _277 = _117 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    bool _285 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_279);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -_295;
    float _303 = _301 + 1.0;
    bool _305 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _307 = isnan(_279);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    bool _321 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _323 = 1.0 / _299;
    float _325 = _315 * _303;
    float _327 = -_315;
    float _329 = _327 + 1.0;
    float _331 = _283 * _323;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    float _337 = fma(_319, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _339 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _341 = _337 * _325;
    float _343 = _339 * _325;
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _341);
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].x, _345);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[144].y, _347);
    bool _353 = !_321;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _117 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _391 = _379 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _405 = 1.0 / _395;
    bool _407 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_379);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _399;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _423 = 1.0 / _403;
    bool _425 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _427 = isnan(_379);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = _383 * _405;
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _387 * _419;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = -_449;
    float _463 = _461 + 1.0;
    float _465 = _449 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _471 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = _391 * _423;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _483;
    float _487 = _417 * _463;
    float _489 = -_417;
    float _491 = _489 + 1.0;
    float _493 = fma(_481, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _495 = fma(_485, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _497 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _499 = isnan(_379);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _513 = fma(_469, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_475, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = _507 * _491;
    float _519 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = _471 * _517;
    float _527 = _493 * _517;
    float _529 = _495 * _517;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _531;
    float _535 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _537 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _543;
    float _547 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[107].z, _529);
    float _549 = fma(_533, _437, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _551 = fma(_541, _437, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _553 = fma(_545, _437, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _555 = fma(_519, _487, _535);
    float _557 = fma(_513, _487, _537);
    float _559 = fma(_515, _487, _547);
    float _561 = fma(_549, _465, _555);
    float _563 = fma(_551, _465, _557);
    float _565 = fma(_553, _465, _559);
    float _567 = in.m_53.x;
    float _569 = in.m_53.y;
    float _571 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].x, _561);
    float _573 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].y, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[110].z, _565);
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _579 = _571 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = _573 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _585;
    out.m_55.y = _587;
    out.m_55.z = _589;
    out.m_55.w = _577;
    float _591 = _351 * _569;
    float _593 = _349 * _567;
    bool _595 = !_421;
    float _611;
    if (!_595)
    {
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _599 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _117 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = in.m_42.x;
    float _627 = in.m_42.y;
    float _629 = in.m_42.z;
    int _631 = as_type<int>(_623) & 1;
    bool _633 = _631 != 0;
    int _635 = as_type<int>(_623) & 2;
    bool _637 = _635 != 0;
    float _639 = _251 * _591;
    float _641 = _251 * _593;
    float _643 = _627 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _645 = !_637;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _651 = !_633;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[6].x, _643);
    float _659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _663 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _649 * _659;
    float _667 = _627 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _669 = _655 * _661;
    float _671 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _673 = _665 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _675 = _665 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[4].x, _667);
    float _679 = _627 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _681 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _673);
    float _683 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _685 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    float _687 = fma(_625, (*spvDescriptorSet0.vp_c10)._m0[5].x, _679);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _681);
    float _691 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _683);
    float _695 = _685 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _697 = _689 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _699 = _665 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _703 = fma(_629, (*spvDescriptorSet0.vp_c10)._m0[5].z, _687);
    float _705 = _691 + _697;
    float _707 = fma(_669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _699);
    float _709 = _695 + _701;
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _715 = _705 + _713;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _715 * _715;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _727 = fma(_721, _721, _723);
    float _729 = _711 + _725;
    float _731 = sqrt(_727);
    bool _733 = _731 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = _671;
    float _737 = _723;
    float _739 = _625;
    float _741 = _705;
    if (!_733)
    {
        _735 = _709;
    }
    float _743 = _735;
    float _745 = _743;
    if (!_733)
    {
        _737 = _705;
    }
    float _747 = _737;
    float _749 = _747;
    if (!_733)
    {
        _739 = _729;
    }
    float _751 = _739;
    bool _753 = !_733;
    float _755 = _751;
    if (!_753)
    {
        float _757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _761 = _731 + _759;
        float _763 = _729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _765 = rsqrt(_727);
        float _767 = _761 * _757;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = cos(_771);
        float _775 = _769 * 6.283185482025146484375;
        float _777 = sin(_775);
        float _779 = _773 + (-1.0);
        float _781 = _779 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = fma(_777, _763, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _785 = fma(_729, _773, _781);
        float _787 = _765 * _783;
        float _789 = fma(_721, _787, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _791 = fma(_715, _787, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _755 = _785;
        _745 = _789;
        _749 = _791;
    }
    float _793 = _755;
    float _795 = _745;
    float _797 = _749;
    float _799 = -_711;
    float _801 = _799 + _793;
    float _803 = -_695;
    float _805 = _803 + _795;
    float _807 = -_691;
    float _809 = _807 + _797;
    float _811 = _801 * _801;
    float _813 = fma(_805, _805, _811);
    float _815 = fma(_809, _809, _813);
    float _817 = sqrt(_815);
    bool _819 = _817 > 0.0;
    bool _821 = !_819;
    float _823 = _793;
    float _825 = _795;
    float _827 = _797;
    float _829 = _805;
    if (!_821)
    {
        float _831 = _245 * _245;
        float _833 = fma(_197, _197, _831);
        float _835 = fma(_247, _247, _833);
        float _837 = rsqrt(_815);
        float _839 = sqrt(_835);
        float _841 = _805 * _837;
        float _843 = _801 * _837;
        float _845 = _809 * _837;
        bool _847 = _839 > 0.0;
        bool _849 = !_847;
        if (!_849)
        {
            float _851 = rsqrt(_835);
            float _853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _855 = _245 * _851;
            float _857 = _197 * _851;
            float _859 = _247 * _851;
            float _861 = _843 * _855;
            float _863 = fma(_841, _857, _861);
            float _865 = _853 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _867 = fma(_845, _859, _863);
            float _869 = _867 * _865;
            float _871 = fma(_197, _869, _795);
            float _873 = fma(_245, _869, _793);
            float _875 = fma(_247, _869, _797);
            _823 = _873;
            _825 = _871;
            _827 = _875;
            _829 = _863;
        }
    }
    float _877 = _823;
    float _879 = _825;
    float _881 = _827;
    float _883 = _829;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _877 + _885;
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _891 = _879 + _889;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _895 = _881 + _893;
    float _897 = _887 * _887;
    float _899 = fma(_891, _891, _897);
    float _901 = fma(_895, _895, _899);
    float _903 = rsqrt(_901);
    float _905 = _903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _907 = _891 * _905;
    float _909 = _895 * _905;
    float _911 = _907 * _907;
    float _913 = _909 * _909;
    float _915 = _911 + _913;
    float _917 = sqrt(_915);
    bool _919 = _917 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _923 = _917 + _921;
    float _925 = _895;
    float _927 = _915;
    float _929 = _923;
    float _931 = _883;
    float _933 = _905;
    float _935 = _907;
    if (_919)
    {
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _925 = _937;
    }
    float _939 = _925;
    if (_919)
    {
        float _941 = rsqrt(_915);
        _927 = _941;
    }
    float _943 = _927;
    float _945 = _943;
    if (_919)
    {
        float _947 = _923 * _939;
        _929 = _947;
    }
    float _949 = _929;
    if (_919)
    {
        float _951 = _949 * 0.15915493667125701904296875;
        _931 = _951;
    }
    float _953 = _931;
    float _955 = _939;
    if (_919)
    {
        float _957 = _953 * 6.283185482025146484375;
        float _959 = sin(_957);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _965 = precise::max(0.0, _963);
    float _967 = _897;
    float _969 = _965;
    if (_919)
    {
        float _971 = _953 * 6.283185482025146484375;
        float _973 = cos(_971);
        _967 = _973;
    }
    float _975 = _967;
    float _977 = -_905;
    float _979 = -_965;
    float _981 = fma(_887, _977, _979);
    float _983 = _981;
    if (_919)
    {
        float _985 = _981 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _969 = _985;
    }
    float _987 = _969;
    float _989 = sqrt(_901);
    float _991 = _961;
    float _993 = _987;
    if (_919)
    {
        float _995 = fma(_961, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _997;
    if (_919)
    {
        float _1001 = _975 + (-1.0);
        _993 = _1001;
    }
    float _1003 = _993;
    float _1005 = _1003;
    if (_919)
    {
        float _1007 = _943 * _997;
        _741 = _1007;
    }
    float _1009 = _741;
    if (!_919)
    {
        _999 = _981;
    }
    float _1011 = _999;
    float _1013 = _1011;
    if (_919)
    {
        float _1015 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _933 = _1015;
    }
    float _1017 = _933;
    if (_919)
    {
        float _1019 = _907 * _1009;
        _935 = _1019;
    }
    float _1021 = _935;
    if (!_919)
    {
        _1005 = _909;
    }
    float _1023 = _1005;
    float _1025 = _1023;
    if (_919)
    {
        float _1027 = _909 * _1009;
        _1025 = _1027;
    }
    float _1029 = _1025;
    if (!_919)
    {
        _945 = _911;
    }
    float _1031 = _945;
    float _1033 = _1031;
    if (_919)
    {
        float _1035 = fma(_981, _975, _1017);
        _1013 = _1035;
    }
    float _1037 = _1013;
    if (_919)
    {
        float _1039 = _1021 * _1021;
        _1033 = _1039;
    }
    float _1041 = _1033;
    if (!_919)
    {
        _983 = _913;
    }
    float _1043 = _983;
    float _1045 = _1043;
    if (_919)
    {
        float _1047 = _1029 * _1029;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = fma(_1037, _1037, _1041);
    float _1053 = _1051 + _1049;
    float _1055 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1059 = fma(_989, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1057);
    float _1061 = precise::clamp(_1059, 0.0, 1.0);
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1065 = rsqrt(_1053);
    float _1067 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1055);
    float _1069 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1071 = -_1061;
    float _1073 = _1071 + 1.0;
    float _1075 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1067);
    float _1077 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1079 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1069);
    float _1081 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1083 = abs(_1073);
    float _1085 = log2(_1083);
    float _1087 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1077);
    float _1089 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1091 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1081);
    float _1093 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1095 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1099 = _1065 * _1021;
    float _1101 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1103 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1111 = _1065 * _1029;
    float _1113 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = _1065 * _1037;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1119 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1121 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1123 = -_1107;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1123);
    float _1127 = -_1117;
    float _1129 = fma(_1127, _1063, 1.0);
    float _1131 = exp2(_1119);
    float _1133 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1121);
    float _1135 = -_1111;
    float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1125);
    float _1139 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = fma(_1137, -0.5, 0.5);
    float _1145 = fma(_1137, 0.5, 0.5);
    float _1147 = log2(_1129);
    float _1149 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1145, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1155 = _1115 + 1.0;
    float _1157 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1159 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1161 = fma(_1145, _1153, -0.212114393711090087890625);
    float _1163 = 1.0 / _1133;
    float _1165 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1157);
    float _1167 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1169 = fma(_1145, _1161, 1.570728778839111328125);
    float _1171 = -_1115;
    float _1173 = fma(_1131, _1155, _1171);
    float _1175 = sqrt(_1143);
    float _1177 = _1147 * 0.693147182464599609375;
    float _1179 = fma(_1173, 0.5, 0.5);
    float _1181 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1183 = _1165 * _1163;
    float _1185 = _1167 * _1163;
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = fma(_1185, -0.5, 0.5);
    float _1191 = _1175 * 0.636619746685028076171875;
    float3 _3254 = float3(_1187, _1189, _1181);
    float _1193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3254, float3(0.0), isnan(_3254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3254, float3(0.0), isnan(_3254)), level(0.0)).x;
    float3 _3265 = float3(_1187, _1189, _1181);
    float4 _1196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3265, float3(0.0), isnan(_3265)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3265, float3(0.0), isnan(_3265)), level(0.0)).xyzw;
    float _1198 = _1196.x;
    float _1200 = _1196.y;
    float _1202 = _1196.z;
    float _1204 = _1196.w;
    float _1206 = -_1169;
    float _1208 = fma(_1191, _1206, 1.0);
    float2 _3287 = float2(_1208, _1179);
    float3 _1212 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3287, float2(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3287, float2(0.0), isnan(_3287)), level(0.0)).xyz;
    float _1214 = _1212.x;
    float _1216 = _1212.y;
    float _1218 = _1212.z;
    float _1220 = in.m_49.y;
    float _1222 = _1097 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1224 = _139 > 0.5;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1228 = _621 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1230;
    float _1234 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1236 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1222);
    float _1238 = 1.0 / _1232;
    float _1240 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1236);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1240);
    float _1248 = -_653;
    int _1250 = _1224 ? as_type<int>(_1248) : as_type<int>(_653);
    float _1252 = exp2(_1234);
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    bool _1258 = !_1244;
    float _1260 = _1258 ? _653 : as_type<float>(_1250);
    float _1262 = _1228 * _1238;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1266 = _1220 > 0.5;
    float _1268 = _1260 + 0.5;
    bool _1270 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1272 = isnan(_621);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1282;
    bool _1286 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1288 = isnan(_621);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1302;
    float _1306 = -_1280;
    float _1308 = _1306 + 1.0;
    float _1310 = fma(_1284, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1312 = fma(_1300, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1314 = fma(_1304, _1262, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1316 = _1296 * _1308;
    float _1318 = -_647;
    int _1320 = _1266 ? as_type<int>(_1318) : as_type<int>(_647);
    float _1322 = -_1296;
    float _1324 = _1322 + 1.0;
    float _1326 = -_1252;
    float _1328 = _1326 + 1.0;
    float _1330 = _1310 * _1316;
    float _1332 = _1312 * _1316;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1336 = _1314 * _1316;
    bool _1338 = !_1256;
    float _1340 = _1338 ? _647 : as_type<float>(_1320);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1330);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1348 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1350 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1342);
    float _1352 = -_1340;
    float _1354 = _1352 + 0.5;
    float _1356 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1344);
    float _1358 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1348);
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1362 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = _1246 + _1133;
    float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1374 = _1362 * _1264;
    float _1376 = _1364 * _1334;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1370 * 0.5;
    float _1384 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1374;
    out.m_60.y = _1376;
    out.m_62.x = _1372;
    out.m_62.y = _1378;
    out.m_62.z = _1380;
    out.gl_Position.x = _1165;
    out.gl_Position.y = _1167;
    out.gl_Position.z = _1246;
    out.gl_Position.w = _1133;
    out.m_64.z = _1382;
    out.m_64.w = _1133;
    out.m_45.x = _1384;
    float _1386 = _1346 * _1193;
    float _1388 = -_1346;
    float _1390 = _1388 + 1.0;
    float _1392 = _1204 * _1386;
    float _1394 = _1218 * _1386;
    float _1396 = fma(_1214, _1392, _1198);
    float _1398 = fma(_1216, _1392, _1200);
    float _1400 = _1204 * _1390;
    float _1402 = fma(_1204, _1394, _1202);
    out.m_66.x = _1396;
    out.m_66.y = _1398;
    out.m_66.z = _1402;
    out.m_66.w = _1400;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

