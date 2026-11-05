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
    float4 m_62 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_74 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2719 = as_type<float>(_109);
        out.gl_Position.z = _2719;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_47.w;
    float _115 = float(_93);
    float _117 = in.m_49.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_51.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _121;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    float _149 = _121 * _139;
    float _151 = _149;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_147);
        out.gl_Position.z = _2793;
    }
    out.m_53.x = _149;
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_42.x;
    float _167 = _157 * _153;
    float _169 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    int _173 = as_type<int>(_155) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_155) & 2;
    bool _179 = _177 != 0;
    float _181 = floor(_169);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _171 * 0.15915493667125701904296875;
    float _189 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _203 = _201 != 0;
    float _205 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _213 = !_185;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    out.m_60.x = _165;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_181;
    float _229 = _169 + _227;
    int _231 = abs(_221);
    float _233 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _223);
    int _235 = abs(_215);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _241 = !_203;
    int _243 = _241 ? 0 : 1;
    float _245 = float(_231);
    float _247 = fma(_209, 0.5, 0.5);
    int _249 = abs(_243);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = abs(_239);
    float _257 = _245 * _255;
    float _259 = float(_235);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = -_253;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _269 = !_175;
    float _271 = _269 ? (-0.5) : 0.5;
    float _273 = fma(_259, _263, _257);
    float _275 = float(_249);
    float _277 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _217);
    float _279 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    float _281 = abs(_267);
    float _283 = fma(_275, _281, _273);
    bool _285 = !_225;
    float _287 = _279;
    float _289 = _233;
    float _291 = _277;
    float _307;
    if (!_285)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _149;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_311);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _343 = 1.0 / _323;
    out.m_62.w = _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _319;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = _315 * _347;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _311 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _311 + _369;
    float _373 = _367 * _343;
    float _375 = -_339;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _371 * _361;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _359 * _377;
    float _403 = fma(_381, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_387, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _407 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_311);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_359;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = -_399;
    float _433 = _431 + 1.0;
    float _435 = _399 * _421;
    float _437 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_429, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _417 * _433;
    float _443 = in.m_64.x;
    float _445 = in.m_64.y;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = _405 * _441;
    float _453 = _403 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _467 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_461, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_439, _435, _463);
    float _473 = fma(_437, _435, _465);
    float _475 = fma(_467, _401, _471);
    float _477 = fma(_469, _401, _473);
    float _479 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _477);
    float _483 = _479 * _445;
    float _485 = _481 * _443;
    bool _487 = !_345;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _491 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _151 = _501;
    }
    float _503 = _151;
    float _505 = in.m_49.z;
    float _507 = _117 * 2.0;
    float _509 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _511 = in.m_49.y;
    float _513 = floor(_507);
    float _515 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _527 = int(_525);
    float _529 = -_523;
    float _531 = fma(_509, 2.0, _529);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = -_121;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _531);
    bool _541 = _513 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _545 = _505 * 2.0;
    bool _547 = _513 >= 0.0;
    bool _549 = isnan(_513);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _559 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _561 = int(_559);
    float _563 = _511 * 2.0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _579 = _511 + _505;
    float _581 = _511 + (-0.5);
    float _583 = fma(_577, -2.0, _533);
    float _585 = floor(_545);
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    float _591 = _579 + (-1.0);
    bool _593 = !_567;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_575;
    int _599 = _597 ? 0 : 1;
    float _601 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _555 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _605 = floor(_563);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _617 = _615 != 0;
    float _619 = _591;
    float _621 = _603;
    if (!_519)
    {
        _619 = _511;
    }
    float _623 = _619;
    float _625 = _623;
    if (_519)
    {
        _625 = _117;
    }
    float _627 = _625;
    bool _629 = !_613;
    int _631 = _629 ? 0 : 1;
    int _633 = ~as_type<int>(_603);
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    int _639 = _637;
    if (!_541)
    {
        int _641 = ~as_type<int>(_603);
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    bool _647 = _585 > 0.0;
    bool _649 = _585 >= 0.0;
    bool _651 = isnan(_585);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    bool _659 = _605 > 0.0;
    bool _661 = _605 >= 0.0;
    bool _663 = isnan(_605);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_519)
    {
        _621 = _505;
    }
    float _673 = _621;
    float _675 = _673;
    if (_519)
    {
        _675 = _511;
    }
    float _677 = _675;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].z, _671);
    float _681 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _683 = _669 ? 0 : 1;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _691 = _677;
    if (!_519)
    {
        _691 = _505;
    }
    float _693 = _691;
    float _695 = -_543;
    float _697 = fma(_681, 2.0, _695);
    int _699 = ~_683;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _707 = _693;
    int _709 = _703;
    if (_519)
    {
        _707 = _511;
    }
    float _711 = _707;
    if (!_659)
    {
        int _713 = ~_683;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    float _719 = float(_561);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _723 = abs(_631);
    int _725 = _657 ? 0 : 1;
    float _727 = fma(_721, -2.0, _557);
    float _729 = _687 * _121;
    float _731 = float(_645);
    float _733 = 1.0 / _719;
    float _735 = float(_723);
    int _737 = ~_725;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _735 * _731;
    int _745 = _741;
    if (!_647)
    {
        int _747 = ~_725;
        int _749 = _747 + 1;
        _745 = _749;
    }
    int _751 = _745;
    float _753 = exp2(_729);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _765 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _761);
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _789 = 1.0 + _787;
    float _791 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _763);
    float _793 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    bool _795 = !_609;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _789;
    float _801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _583);
    float _803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _791);
    int _805 = abs(_797);
    float _807 = -_753;
    float _809 = _807 + 1.0;
    float _811 = _743 * (-2.0);
    bool _813 = !_617;
    int _815 = _813 ? 0 : 1;
    float _817 = _733 * _121;
    float _819 = float(_527);
    float _821 = -_121;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _825 = _773 ? _809 : 0.0;
    float _827 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _689);
    float _829 = fma(_811, _757, _757);
    float _831 = float(_751);
    float _833 = _819 * _121;
    float _835 = float(_805);
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _727);
    int _839 = abs(_815);
    if (_785)
    {
        float _841 = _825 * _799;
        _141 = _841;
    }
    float _843 = _141;
    float _845 = fma(_601, _811, _601);
    float _847 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _829);
    float _849 = _835 * _831;
    float _851 = _117 + _511;
    float _853 = fma(_845, _843, _847);
    float _855 = _851 + (-1.0);
    float _857 = float(_839);
    float _859 = _849 * (-2.0);
    float _861 = float(_717);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _117 + _505;
    float _867 = _853 * 0.15915493667125701904296875;
    float _869 = fma(_859, _755, _755);
    float _871 = _857 * _861;
    float _873 = _117 + (-0.5);
    float _875 = _865 + (-1.0);
    float _877 = _871 * (-2.0);
    float _879 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _869);
    float _881 = fma(_863, _859, _863);
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _885 = fma(_877, _759, _759);
    float _887 = _505 + (-0.5);
    float _889 = fma(_881, _843, _879);
    float _891 = fma(_883, _877, _883);
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].z, _885);
    float _899 = _889 * 0.15915493667125701904296875;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _271);
    float _905 = fma(_891, _843, _897);
    float _907 = in.m_42.z;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = _521 * _903;
    float _917 = in.m_42.y;
    float _919 = _913 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _515 * _901;
    float _925 = _899 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _899 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _921 * _923;
    float _935 = _895 * _921;
    float _937 = _913 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _927 * _895;
    float _943 = _931 * _911;
    float _945 = _931 * _895;
    float _947 = _927 * _911;
    float _949 = _931 * _933;
    float _951 = _911 * _921;
    float _953 = _927 * _933;
    float _955 = _917 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = fma(_939, _943, _941);
    float _959 = -_945;
    float _961 = fma(_939, _947, _959);
    float _963 = -_947;
    float _965 = fma(_939, _945, _963);
    float _967 = -_923;
    float _969 = _939 * _967;
    float _971 = fma(_957, _915, _949);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_939, _941, _943);
    float _977 = fma(_951, _915, _969);
    float _979 = fma(_961, _915, _953);
    float _981 = fma(_965, _973, _971);
    float _983 = _917 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _985 = fma(_935, _973, _977);
    float _987 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = fma(_975, _973, _979);
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _995 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _983);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _999 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _987);
    float _1001 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _993);
    float _1003 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _995);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1015 = _917 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1017 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1021 = _1007 + _1013;
    float _1023 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1015);
    float _1025 = _1011 + _1017;
    float _1027 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1019);
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1031 = _1021 + _1029;
    float _1033 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1037 = _1025 + _1035;
    float _1039 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1027);
    float _1041 = _1031 * _1031;
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1045 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1047 = fma(_1037, _1037, _1041);
    float _1049 = _1043 + _1045;
    float _1051 = sqrt(_1047);
    bool _1053 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1023;
    float _1057 = _1045;
    float _1059 = _1019;
    float _1061 = _915;
    if (!_1053)
    {
        _1055 = _1025;
    }
    float _1063 = _1055;
    float _1065 = _1063;
    if (!_1053)
    {
        _1057 = _1021;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    if (!_1053)
    {
        _1059 = _1049;
    }
    float _1071 = _1059;
    bool _1073 = !_1053;
    float _1075 = _1071;
    if (!_1073)
    {
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1081 = _1051 + _1079;
        float _1083 = _1049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = rsqrt(_1047);
        float _1087 = _1081 * _1077;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = _1089 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = _1089 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        float _1099 = _1093 + (-1.0);
        float _1101 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = fma(_1097, _1083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1105 = fma(_1049, _1093, _1101);
        float _1107 = _1085 * _1103;
        float _1109 = fma(_1037, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1111 = fma(_1031, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1075 = _1105;
        _1065 = _1109;
        _1069 = _1111;
    }
    float _1113 = _1075;
    float _1115 = _1065;
    float _1117 = _1069;
    float _1119 = -_1043;
    float _1121 = _1119 + _1113;
    float _1123 = -_1011;
    float _1125 = _1123 + _1115;
    float _1127 = -_1007;
    float _1129 = _1127 + _1117;
    float _1131 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = _1121 * _1121;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1147 = fma(_1125, _1125, _1133);
    bool _1149 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1151 = isnan(0.5);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1157 = _1153 || _1155;
    float _1159 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1161 = fma(_1129, _1129, _1147);
    float _1163 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1167 = sqrt(_1161);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1171 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1169);
    float _1173 = 1.0 / _1165;
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1177 = _1175 + _1165;
    bool _1179 = _1167 > 0.0;
    float _1181 = _1177 * _1173;
    float _1183 = _1181 * 0.5;
    bool _1185 = !_1179;
    float _1187 = _1115;
    float _1189 = _1113;
    float _1191 = _1117;
    float _1193 = _1129;
    if (!_1185)
    {
        float _1195 = _279 * _279;
        float _1197 = fma(_277, _277, _1195);
        float _1199 = fma(_233, _233, _1197);
        float _1201 = rsqrt(_1161);
        float _1203 = sqrt(_1199);
        float _1205 = _1125 * _1201;
        float _1207 = _1121 * _1201;
        float _1209 = _1129 * _1201;
        bool _1211 = _1203 > 0.0;
        bool _1213 = !_1211;
        if (!_1213)
        {
            float _1215 = rsqrt(_1199);
            float _1217 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1219 = _279 * _1215;
            float _1221 = _277 * _1215;
            float _1223 = _233 * _1215;
            float _1225 = _1207 * _1219;
            float _1227 = fma(_1205, _1221, _1225);
            float _1229 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1231 = fma(_1209, _1223, _1227);
            float _1233 = _1231 * _1229;
            float _1235 = fma(_277, _1233, _1115);
            float _1237 = fma(_279, _1233, _1113);
            float _1239 = fma(_233, _1233, _1117);
            _1187 = _1235;
            _1189 = _1237;
            _1191 = _1239;
            _1193 = _1233;
        }
    }
    float _1241 = _1187;
    float _1243 = _1189;
    float _1245 = _1191;
    float _1247 = _1193;
    float _1249 = _1247;
    float _1251 = _1245;
    if (_1157)
    {
        _1249 = 1.0;
    }
    float _1253 = _1249;
    float _1255 = _1253;
    if (_1143)
    {
        _287 = _1241;
    }
    float _1257 = _287;
    float _1259 = _1257;
    if (_1143)
    {
        _289 = _1243;
    }
    float _1261 = _289;
    float _1263 = _1261;
    if (_1143)
    {
        _291 = _1245;
    }
    float _1265 = _291;
    float _1267 = _1265;
    if (!_1143)
    {
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1271 = _1043 + _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1275 = _1011 + _1273;
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1271 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1007 + _1281;
        float _1285 = fma(_1275, _1275, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1011;
        float _1301 = _1299 + _1241;
        float _1303 = -_1043;
        float _1305 = _1303 + _1243;
        float _1307 = -_1007;
        float _1309 = _1307 + _1245;
        float _1311 = _1293 * _1297;
        float _1313 = fma(_1301, _1311, _1011);
        float _1315 = fma(_1305, _1311, _1043);
        float _1317 = fma(_1309, _1311, _1007);
        _1263 = _1315;
        _1259 = _1313;
        _1267 = _1317;
    }
    float _1319 = _1263;
    float _1321 = _1259;
    float _1323 = _1267;
    if (!_1157)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = _1325 * 0.15915493667125701904296875;
        float _1329 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1333 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
        float _1335 = _1327 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1329 * 0.15915493667125701904296875;
        float _1341 = _1327 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1337;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1333;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        _1251 = _1339;
        _1255 = _1381;
    }
    float _1383 = _1251;
    float _1385 = _1255;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1319 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1321 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1323 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = sqrt(_1403);
    float _1409 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1411 = _1393 * _1409;
    float _1413 = _1397 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 * _1413;
    float _1419 = _1415 + _1417;
    float _1421 = sqrt(_1419);
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1427 = _1421 + _1425;
    float _1429 = _1401;
    float _1431 = _1405;
    float _1433 = _1427;
    float _1435 = _1383;
    float _1437 = _1389;
    if (_1423)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1429 = _1439;
    }
    float _1441 = _1429;
    if (_1423)
    {
        float _1443 = rsqrt(_1419);
        _1431 = _1443;
    }
    float _1445 = _1431;
    float _1447 = _1445;
    if (_1423)
    {
        float _1449 = _1427 * _1441;
        _1433 = _1449;
    }
    float _1451 = _1433;
    if (_1423)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1397;
    float _1459 = _1455;
    if (_1423)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1441;
    float _1473 = _1469;
    if (_1423)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1409;
    float _1483 = -_1469;
    float _1485 = fma(_1389, _1481, _1483);
    if (_1423)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1437 = _1487;
    }
    float _1489 = _1437;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1423)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1423)
    {
        _1493 = _1415;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    float _1505 = _1479;
    if (_1423)
    {
        float _1507 = _1479 + (-1.0);
        _1473 = _1507;
    }
    float _1509 = _1473;
    float _1511 = _1509;
    if (_1423)
    {
        float _1513 = _1445 * _1497;
        _1061 = _1513;
    }
    float _1515 = _1061;
    if (!_1423)
    {
        _1447 = _1411;
    }
    float _1517 = _1447;
    float _1519 = _1517;
    if (_1423)
    {
        float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1521;
    }
    float _1523 = _1459;
    if (_1423)
    {
        float _1525 = _1411 * _1515;
        _1519 = _1525;
    }
    float _1527 = _1519;
    if (!_1423)
    {
        _1499 = _1485;
    }
    float _1529 = _1499;
    float _1531 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1533 = _1529;
    if (!_1423)
    {
        _1511 = _1413;
    }
    float _1535 = _1511;
    float _1537 = _1535;
    if (_1423)
    {
        float _1539 = fma(_1485, _1479, _1523);
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (_1423)
    {
        float _1543 = _1413 * _1515;
        _1537 = _1543;
    }
    float _1545 = _1537;
    if (_1423)
    {
        float _1547 = _1527 * _1527;
        _1503 = _1547;
    }
    float _1549 = _1503;
    if (!_1423)
    {
        _1505 = _1417;
    }
    float _1551 = _1505;
    float _1553 = _1551;
    if (_1423)
    {
        float _1555 = _1545 * _1545;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1541, _1541, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1531);
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1575 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = rsqrt(_1561);
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1589 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1595 = abs(_1581);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1605 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1607 = -_1599;
    float _1609 = fma(_1607, _1573, 1.0);
    float _1611 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1577 * _1527;
    float _1617 = _1577 * _1541;
    float _1619 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1577 * _1545;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1629 = log2(_1609);
    float _1631 = -_1623;
    float _1633 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1639 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1637);
    float _1649 = exp2(_1635);
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1639);
    float _1655 = fma(_1643, 0.5, 0.5);
    float _1657 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1659 = _1617 + 1.0;
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = 1.0 / _1647;
    float _1665 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1667 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1669 = fma(_1655, _1665, -0.212114393711090087890625);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1673 = sqrt(_1651);
    float _1675 = -_1617;
    float _1677 = fma(_1649, _1659, _1675);
    float _1679 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1681 = _1629 * 0.693147182464599609375;
    float _1683 = fma(_1655, _1669, 1.570728778839111328125);
    float _1685 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1687 = _1671 * _1663;
    float _1689 = _1679 * _1663;
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1689, -0.5, 0.5);
    float _1695 = _1673 * 0.636619746685028076171875;
    float _1697 = fma(_1677, 0.5, 0.5);
    float _1699 = -_1683;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _5234 = float3(_1691, _1693, _1685);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1691, _1693, _1685);
    float4 _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1708 = _1706.x;
    float _1710 = _1706.y;
    float _1712 = _1706.z;
    float _1714 = _1706.w;
    float2 _5262 = float2(_1701, _1697);
    float3 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = float(uint(_527));
    float _1728 = trunc(_817);
    int _1730 = int(_1728);
    int _1732 = ~_527;
    int _1734 = _1732 + 1;
    float _1736 = _833 * _139;
    int _1738 = ~_527;
    int _1740 = _1738 + 1;
    float _1742 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1744 = abs(_599);
    float _1746 = -_705;
    float _1748 = _1746 + 1.0;
    bool _1750 = _117 > 0.5;
    float _1752 = 1.0 / _1726;
    bool _1754 = _505 > 0.5;
    float _1756 = -_803;
    float _1758 = _1756 + 1.0;
    float _1760 = -_827;
    float _1762 = _1760 + 1.0;
    float _1764 = -_793;
    float _1766 = _1764 + 1.0;
    float _1768 = -_271;
    int _1770 = _1754 ? as_type<int>(_1768) : as_type<int>(_271);
    float _1772 = float(uint(_1730));
    float _1774 = trunc(_1736);
    int _1776 = int(_1774);
    float _1778 = float(_1730);
    bool _1780 = _1778 >= _819;
    bool _1782 = isnan(_1778);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(_819);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    int _1792 = as_type<int>(_1752) + (-2);
    float _1794 = exp2(_1742);
    float _1796 = as_type<float>(_1792) * _1772;
    float _1798 = trunc(_1790);
    int _1800 = int(_1798);
    float _1802 = trunc(_1796);
    float _1804 = precise::max(_1802, 0.0);
    uint _1807 = uint(_1804);
    float _1809 = -_1794;
    float _1811 = _1809 + 1.0;
    int _1813 = _1734 * int(_1807);
    int _1815 = _1813 + _1730;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1792) * _1817;
    bool _1821 = !_519;
    float _1823 = _1821 ? 7.345489978790283203125 : 1.0;
    float _1825 = trunc(_1819);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = _1823 * _117;
    float _1833 = floor(_1831);
    int _1835 = int(_1807) + int(_1829);
    int _1837 = _1740 * _1835;
    int _1839 = _1837 + _1730;
    float _1841 = -_1833;
    float _1843 = _1831 + _1841;
    int _1845 = _527 + (-1);
    bool _1847 = uint(_1839) >= uint(_527);
    bool _1849 = !_1847;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _527 == 0;
    int _1855 = ~_1835;
    int _1857 = _1855 + _1851;
    int _1859 = _1857 + 1;
    float _1861 = _1843 * _819;
    int _1863 = ~_1800;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    int _1869 = _527 * _1859;
    int _1871 = _1869 + _1730;
    float _1873 = trunc(_1861);
    int _1875 = int(_1873);
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1883 = _1881 != 0;
    bool _1885 = !_1853;
    int _1887 = _1885 ? _1871 : (-1);
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1867;
    int _1899 = abs(_589);
    int _1901 = abs(_1891);
    int _1903 = _1800 * _1845;
    int _1905 = _1903 + _1897;
    bool _1907 = !_1895;
    int _1909 = _1907 ? 0 : 1;
    int _1911 = abs(_595);
    int _1913 = _1905 * _1899;
    int _1915 = ~_527;
    int _1917 = _1915 + 1;
    int _1919 = _1875 * _1901;
    int _1921 = _1919 + _1730;
    int _1923 = abs(_1909);
    int _1925 = _1776 * _1911;
    int _1927 = _1925 + _1913;
    int _1929 = ~_527;
    int _1931 = _1929 + 1;
    int _1933 = _1921 * _1744;
    int _1935 = _1933 + _1927;
    int _1937 = _1875 * _1923;
    int _1939 = _1937 + _1935;
    int _1941 = ~_527;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1939));
    float _1947 = as_type<float>(_1792) * _1945;
    float _1949 = trunc(_1947);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1943 * int(_1953);
    int _1957 = _1955 + _1939;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1792) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1953) + int(_1967);
    float _1971 = float(uint(_1921));
    int _1973 = _1931 * _1969;
    int _1975 = _1973 + _1939;
    float _1977 = as_type<float>(_1792) * _1971;
    bool _1979 = uint(_1975) >= uint(_527);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1969;
    int _1993 = _1991 + _1989;
    int _1995 = _1993 + 1;
    int _1997 = _527 * _1995;
    int _1999 = _1997 + _1939;
    int _2001 = ~_527;
    int _2003 = _2001 + 1;
    bool _2005 = !_1853;
    int _2007 = _2005 ? _1999 : (-1);
    int _2009 = _2003 * int(_1985);
    int _2011 = _2009 + _1921;
    int _2013 = _2007 >> 31;
    float _2015 = float(uint(_2011));
    int _2017 = _2013 & 3;
    int _2019 = _2007 & 3;
    bool _2021 = _2019 != 0;
    float _2023 = as_type<float>(_1792) * _2015;
    int _2025 = _2007 + _2017;
    int _2027 = _2007 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = _2025 >> 2;
    float _2033 = trunc(_2023);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = uint(_2027) > 1u;
    int _2041 = _2031 << 4;
    int _2043 = _2041 + 368;
    int _2045 = _2021 ? 0 : 1;
    uint _2047 = uint(int(uint(_2043) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    int _2063 = _2043 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_1985) + int(_2037);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    int _2089 = _2087;
    if (!_2039)
    {
        int _2091 = ~_2045;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _1917 * _2081;
    int _2099 = _2097 + _1921;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2103 = int(_2101);
    bool _2105 = uint(_2027) >= 2u;
    int _2107 = abs(_2095);
    bool _2109 = uint(_2099) >= uint(_527);
    int _2111 = ~_2107;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2109;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _2027 != 3;
    int _2123 = ~_2081;
    int _2125 = _2123 + _2119;
    int _2127 = _2125 + 1;
    int _2129 = _2105 ? 0 : 1;
    bool _2131 = _2027 != 3;
    int _2133 = _527 * _2127;
    int _2135 = _2133 + _1921;
    bool _2137 = !_2029;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = ~_2129;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    int _2147 = abs(_2139);
    int _2149 = _2145;
    if (_2121)
    {
        int _2151 = ~_2129;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2155);
    int _2163 = ~_2147;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = _2115 * as_type<int>(_2061);
    bool _2171 = !_2131;
    int _2173 = _2171 ? 0 : (-1);
    int _2175 = abs(_2103);
    int _2177 = _2167 * as_type<int>(_2053);
    int _2179 = _2177 + _2169;
    float _2181 = float(uint(_2103));
    bool _2183 = !_2159;
    int _2185 = _2183 ? 0 : 1;
    int _2187 = abs(_2173);
    float _2189 = 1.0 / _2181;
    int _2191 = ~_2161;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = ~_2187;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2195 * as_type<int>(_2071);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1853;
    int _2209 = _2207 ? _2135 : (-1);
    float _2211 = in.m_49.w;
    int _2213 = abs(_2185);
    int _2215 = _2201 * as_type<int>(_2079);
    int _2217 = _2215 + _2205;
    float _2219 = float(uint(_2175));
    int _2221 = ~_2213;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = 1.0 / _2219;
    int _2229 = _2217 * _2225;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2235 = as_type<int>(_2189) + (-2);
    int _2237 = _2209 * _2213;
    int _2239 = _2237 + _2229;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2243 = _2241 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2245 = 1.0 / _2233;
    bool _2247 = _511 > 0.5;
    float _2249 = float(uint(_2239));
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2251;
    int _2255 = ~_2103;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2261 = _2259 != 0;
    float _2263 = 1.0 / _2243;
    int _2265 = abs(_2239);
    float _2267 = as_type<float>(_2235) * _2249;
    int _2269 = as_type<int>(_2227) + (-2);
    float _2271 = float(uint(_2265));
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2275 = _2273 != 0;
    float _2277 = trunc(_2267);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = _2253 * _2245;
    float _2285 = as_type<float>(_2269) * _2271;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2293 = _2291 != 0;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2297 = _503 + _2295;
    float _2299 = trunc(_2285);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2289 * _2263;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2309 = _2307 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2311 = ~_2175;
    int _2313 = _2311 + 1;
    float _2315 = -_271;
    int _2317 = _1750 ? as_type<int>(_2315) : as_type<int>(_271);
    int _2319 = _2257 * int(_2281);
    int _2321 = _2319 + _2239;
    bool _2323 = _2211 > 0.5;
    float _2325 = fma(_2283, _2297, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2327 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_503);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = 1.0 / _2309;
    float _2341 = float(uint(_2321));
    bool _2343 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2345 = isnan(_503);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    int _2355 = _2313 * int(_2303);
    int _2357 = _2355 + _2265;
    float _2359 = -_2337;
    float _2361 = _2359 + 1.0;
    float _2363 = as_type<float>(_2235) * _2341;
    bool _2365 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2367 = isnan(_503);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2379 = float(uint(_2357));
    float _2381 = _2353 * _2361;
    float _2383 = -_2353;
    float _2385 = _2383 + 1.0;
    float _2387 = -_2375;
    float _2389 = _2387 + 1.0;
    bool _2391 = !_1883;
    float _2393 = _2391 ? _271 : as_type<float>(_2317);
    float _2395 = as_type<float>(_2269) * _2379;
    bool _2397 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2399 = isnan(_503);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = _2375 * _2385;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2411;
    float _2415 = trunc(_2363);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _2407 * _2389;
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2425 = _503 + _2423;
    float _2427 = -_2407;
    float _2429 = _2427 + 1.0;
    float _2431 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2433 = trunc(_2395);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2413 * _2339;
    bool _2441 = !_2275;
    float _2443 = _2441 ? _271 : as_type<float>(_1770);
    float _2445 = _2325 * _2421;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2449 = _503 + _2447;
    float _2451 = -_193;
    int _2453 = _2247 ? as_type<int>(_2451) : as_type<int>(_193);
    float _2455 = -_193;
    int _2457 = _2323 ? as_type<int>(_2455) : as_type<int>(_193);
    float _2459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2461 = fma(_2305, _2449, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2463 = fma(_2439, _2425, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2465 = int(_2281) + int(_2419);
    float _2467 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2445);
    int _2469 = ~_2103;
    int _2471 = _2469 + 1;
    float _2473 = _2443 + 0.5;
    int _2475 = ~_2175;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2461, _2409, _2467);
    int _2481 = int(_2303) + int(_2437);
    float _2483 = fma(_2431, _2473, _823);
    bool _2485 = !_2261;
    float _2487 = _2485 ? _193 : as_type<float>(_2453);
    float _2489 = fma(_2463, _2381, _2479);
    bool _2491 = !_2293;
    float _2493 = _2491 ? _193 : as_type<float>(_2457);
    int _2495 = _2477 * _2481;
    int _2497 = _2495 + _2265;
    float _2499 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2501 = _2471 * _2465;
    int _2503 = _2501 + _2239;
    float _2505 = _2493 + (-0.5);
    bool _2507 = uint(_2497) >= uint(_2175);
    float _2509 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2489);
    int _2511 = _2239 ^ _2103;
    float _2513 = -_2499;
    float _2515 = -_837;
    float _2517 = fma(_2513, _2505, _2515);
    bool _2519 = uint(_2503) >= uint(_2103);
    float _2521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2523 = !_2507;
    int _2525 = _2523 ? 0 : (-1);
    float _2527 = fma(_2493, _1762, _2517);
    bool _2529 = !_2519;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2535 = uint(int(uint(_2511) >> uint(31)));
    int _2537 = ~_2465;
    int _2539 = _2537 + _2531;
    int _2541 = _2539 + 1;
    int _2543 = ~_2525;
    int _2545 = _2481 + _2543;
    int _2547 = _2545 + 1;
    out.m_68.w = _2533;
    int _2549 = ~int(_2535);
    int _2551 = _2549 + 1;
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2555 = _2103 * _2541;
    int _2557 = _2555 + _2239;
    bool _2559 = _2103 == 0;
    float _2561 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2563 = _2547 ^ _2551;
    float _2565 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2103 == 0;
    float _2569 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    int _2571 = ~_2551;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    float _2577 = _283 * _2565;
    bool _2579 = !_2559;
    int _2581 = _2579 ? _2557 : (-1);
    float _2583 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    bool _2585 = !_2567;
    int _2587 = _2585 ? _2575 : (-1);
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2591 = float(_2581);
    float _2593 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2595 = float(_2587);
    float _2597 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2599 = -_1748;
    float _2601 = fma(_2443, _2599, _2483);
    float _2603 = fma(_2593, _2591, _539);
    float _2605 = _2393 + 0.5;
    float _2607 = -_801;
    float _2609 = fma(_2597, _2595, _2607);
    float _2611 = _2487 + (-0.5);
    bool _2613 = _1385 > 0.0;
    bool _2615 = isnan(_1385);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(0.0);
    bool _2621 = _2617 || _2619;
    float _2623 = fma(_2593, _2605, _2603);
    float _2625 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2583);
    float _2627 = -_2597;
    float _2629 = fma(_2627, _2611, _2609);
    float _2631 = -_1766;
    float _2633 = fma(_2393, _2631, _2623);
    float _2635 = _2625 + _1647;
    float _2637 = fma(_2487, _1758, _2629);
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1679;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1647;
    float _2639 = _2635 * 0.5;
    float _2641 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2633;
    out.m_70.y = _2637;
    out.m_70.z = _2601;
    out.m_70.w = _2527;
    float _2643 = _2641 * _1703;
    float _2645 = -_2641;
    float _2647 = _2645 + 1.0;
    out.m_72.z = _2639;
    out.m_72.w = _1647;
    float _2649 = _1714 * _2643;
    float _2651 = _1724 * _2643;
    float _2653 = _1714 * _2647;
    float _2655 = fma(_1720, _2649, _1708);
    float _2657 = fma(_1722, _2649, _1710);
    float _2659 = fma(_1714, _2651, _1712);
    out.m_45.x = _2589;
    out.m_74.x = _2655;
    out.m_74.y = _2657;
    out.m_74.z = _2659;
    out.m_74.w = _2653;
    if (_2621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2661;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2719 = as_type<float>(_109);
        out.gl_Position.z = _2719;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_47.w;
    float _115 = float(_93);
    float _117 = in.m_49.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_51.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _121;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    float _149 = _121 * _139;
    float _151 = _149;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_147);
        out.gl_Position.z = _2793;
    }
    out.m_53.x = _149;
    if (_137)
    {
        return out;
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_42.x;
    float _167 = _157 * _153;
    float _169 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    int _173 = as_type<int>(_155) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_155) & 2;
    bool _179 = _177 != 0;
    float _181 = floor(_169);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _171 * 0.15915493667125701904296875;
    float _189 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _203 = _201 != 0;
    float _205 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _213 = !_185;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    out.m_60.x = _165;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_181;
    float _229 = _169 + _227;
    int _231 = abs(_221);
    float _233 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _223);
    int _235 = abs(_215);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _241 = !_203;
    int _243 = _241 ? 0 : 1;
    float _245 = float(_231);
    float _247 = fma(_209, 0.5, 0.5);
    int _249 = abs(_243);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = abs(_239);
    float _257 = _245 * _255;
    float _259 = float(_235);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = -_253;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _269 = !_175;
    float _271 = _269 ? (-0.5) : 0.5;
    float _273 = fma(_259, _263, _257);
    float _275 = float(_249);
    float _277 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _217);
    float _279 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    float _281 = abs(_267);
    float _283 = fma(_275, _281, _273);
    bool _285 = !_225;
    float _287 = _279;
    float _289 = _233;
    float _291 = _277;
    float _307;
    if (!_285)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _149;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_311);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _343 = 1.0 / _323;
    out.m_62.w = _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _319;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = _315 * _347;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _311 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _311 + _369;
    float _373 = _367 * _343;
    float _375 = -_339;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _371 * _361;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _359 * _377;
    float _403 = fma(_381, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_387, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _407 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_311);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_359;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = -_399;
    float _433 = _431 + 1.0;
    float _435 = _399 * _421;
    float _437 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_429, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _417 * _433;
    float _443 = in.m_64.x;
    float _445 = in.m_64.y;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = _405 * _441;
    float _453 = _403 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _467 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_461, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_439, _435, _463);
    float _473 = fma(_437, _435, _465);
    float _475 = fma(_467, _401, _471);
    float _477 = fma(_469, _401, _473);
    float _479 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _477);
    float _483 = _479 * _445;
    float _485 = _481 * _443;
    bool _487 = !_345;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _491 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _151 = _501;
    }
    float _503 = _151;
    float _505 = in.m_49.z;
    float _507 = _117 * 2.0;
    float _509 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _511 = in.m_49.y;
    float _513 = floor(_507);
    float _515 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _527 = int(_525);
    float _529 = -_523;
    float _531 = fma(_509, 2.0, _529);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = -_121;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _531);
    bool _541 = _513 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _545 = _505 * 2.0;
    bool _547 = _513 >= 0.0;
    bool _549 = isnan(_513);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _559 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _561 = int(_559);
    float _563 = _511 * 2.0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _579 = _511 + _505;
    float _581 = _511 + (-0.5);
    float _583 = fma(_577, -2.0, _533);
    float _585 = floor(_545);
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    float _591 = _579 + (-1.0);
    bool _593 = !_567;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_575;
    int _599 = _597 ? 0 : 1;
    float _601 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _555 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _605 = floor(_563);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _617 = _615 != 0;
    float _619 = _591;
    float _621 = _603;
    if (!_519)
    {
        _619 = _511;
    }
    float _623 = _619;
    float _625 = _623;
    if (_519)
    {
        _625 = _117;
    }
    float _627 = _625;
    bool _629 = !_613;
    int _631 = _629 ? 0 : 1;
    int _633 = ~as_type<int>(_603);
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    int _639 = _637;
    if (!_541)
    {
        int _641 = ~as_type<int>(_603);
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    bool _647 = _585 > 0.0;
    bool _649 = _585 >= 0.0;
    bool _651 = isnan(_585);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    bool _659 = _605 > 0.0;
    bool _661 = _605 >= 0.0;
    bool _663 = isnan(_605);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_519)
    {
        _621 = _505;
    }
    float _673 = _621;
    float _675 = _673;
    if (_519)
    {
        _675 = _511;
    }
    float _677 = _675;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].z, _671);
    float _681 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _683 = _669 ? 0 : 1;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _691 = _677;
    if (!_519)
    {
        _691 = _505;
    }
    float _693 = _691;
    float _695 = -_543;
    float _697 = fma(_681, 2.0, _695);
    int _699 = ~_683;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _707 = _693;
    int _709 = _703;
    if (_519)
    {
        _707 = _511;
    }
    float _711 = _707;
    if (!_659)
    {
        int _713 = ~_683;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    float _719 = float(_561);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _723 = abs(_631);
    int _725 = _657 ? 0 : 1;
    float _727 = fma(_721, -2.0, _557);
    float _729 = _687 * _121;
    float _731 = float(_645);
    float _733 = 1.0 / _719;
    float _735 = float(_723);
    int _737 = ~_725;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _735 * _731;
    int _745 = _741;
    if (!_647)
    {
        int _747 = ~_725;
        int _749 = _747 + 1;
        _745 = _749;
    }
    int _751 = _745;
    float _753 = exp2(_729);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _765 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _761);
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _789 = 1.0 + _787;
    float _791 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _763);
    float _793 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    bool _795 = !_609;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _789;
    float _801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _583);
    float _803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _791);
    int _805 = abs(_797);
    float _807 = -_753;
    float _809 = _807 + 1.0;
    float _811 = _743 * (-2.0);
    bool _813 = !_617;
    int _815 = _813 ? 0 : 1;
    float _817 = _733 * _121;
    float _819 = float(_527);
    float _821 = -_121;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _825 = _773 ? _809 : 0.0;
    float _827 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _689);
    float _829 = fma(_811, _757, _757);
    float _831 = float(_751);
    float _833 = _819 * _121;
    float _835 = float(_805);
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _727);
    int _839 = abs(_815);
    if (_785)
    {
        float _841 = _825 * _799;
        _141 = _841;
    }
    float _843 = _141;
    float _845 = fma(_601, _811, _601);
    float _847 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _829);
    float _849 = _835 * _831;
    float _851 = _117 + _511;
    float _853 = fma(_845, _843, _847);
    float _855 = _851 + (-1.0);
    float _857 = float(_839);
    float _859 = _849 * (-2.0);
    float _861 = float(_717);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _117 + _505;
    float _867 = _853 * 0.15915493667125701904296875;
    float _869 = fma(_859, _755, _755);
    float _871 = _857 * _861;
    float _873 = _117 + (-0.5);
    float _875 = _865 + (-1.0);
    float _877 = _871 * (-2.0);
    float _879 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _869);
    float _881 = fma(_863, _859, _863);
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _885 = fma(_877, _759, _759);
    float _887 = _505 + (-0.5);
    float _889 = fma(_881, _843, _879);
    float _891 = fma(_883, _877, _883);
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].z, _885);
    float _899 = _889 * 0.15915493667125701904296875;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _271);
    float _905 = fma(_891, _843, _897);
    float _907 = in.m_42.z;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = _521 * _903;
    float _917 = in.m_42.y;
    float _919 = _913 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _515 * _901;
    float _925 = _899 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _899 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _921 * _923;
    float _935 = _895 * _921;
    float _937 = _913 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _927 * _895;
    float _943 = _931 * _911;
    float _945 = _931 * _895;
    float _947 = _927 * _911;
    float _949 = _931 * _933;
    float _951 = _911 * _921;
    float _953 = _927 * _933;
    float _955 = _917 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = fma(_939, _943, _941);
    float _959 = -_945;
    float _961 = fma(_939, _947, _959);
    float _963 = -_947;
    float _965 = fma(_939, _945, _963);
    float _967 = -_923;
    float _969 = _939 * _967;
    float _971 = fma(_957, _915, _949);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_939, _941, _943);
    float _977 = fma(_951, _915, _969);
    float _979 = fma(_961, _915, _953);
    float _981 = fma(_965, _973, _971);
    float _983 = _917 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _985 = fma(_935, _973, _977);
    float _987 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = fma(_975, _973, _979);
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _995 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _983);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _999 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _987);
    float _1001 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _993);
    float _1003 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _995);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1015 = _917 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1017 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1021 = _1007 + _1013;
    float _1023 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1015);
    float _1025 = _1011 + _1017;
    float _1027 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1019);
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1031 = _1021 + _1029;
    float _1033 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1037 = _1025 + _1035;
    float _1039 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1027);
    float _1041 = _1031 * _1031;
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1045 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1047 = fma(_1037, _1037, _1041);
    float _1049 = _1043 + _1045;
    float _1051 = sqrt(_1047);
    bool _1053 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1023;
    float _1057 = _1045;
    float _1059 = _1019;
    float _1061 = _915;
    if (!_1053)
    {
        _1055 = _1025;
    }
    float _1063 = _1055;
    float _1065 = _1063;
    if (!_1053)
    {
        _1057 = _1021;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    if (!_1053)
    {
        _1059 = _1049;
    }
    float _1071 = _1059;
    bool _1073 = !_1053;
    float _1075 = _1071;
    if (!_1073)
    {
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1081 = _1051 + _1079;
        float _1083 = _1049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = rsqrt(_1047);
        float _1087 = _1081 * _1077;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = _1089 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = _1089 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        float _1099 = _1093 + (-1.0);
        float _1101 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = fma(_1097, _1083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1105 = fma(_1049, _1093, _1101);
        float _1107 = _1085 * _1103;
        float _1109 = fma(_1037, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1111 = fma(_1031, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1075 = _1105;
        _1065 = _1109;
        _1069 = _1111;
    }
    float _1113 = _1075;
    float _1115 = _1065;
    float _1117 = _1069;
    float _1119 = -_1043;
    float _1121 = _1119 + _1113;
    float _1123 = -_1011;
    float _1125 = _1123 + _1115;
    float _1127 = -_1007;
    float _1129 = _1127 + _1117;
    float _1131 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = _1121 * _1121;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1147 = fma(_1125, _1125, _1133);
    bool _1149 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1151 = isnan(0.5);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1157 = _1153 || _1155;
    float _1159 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1161 = fma(_1129, _1129, _1147);
    float _1163 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1167 = sqrt(_1161);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1171 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1169);
    float _1173 = 1.0 / _1165;
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1177 = _1175 + _1165;
    bool _1179 = _1167 > 0.0;
    float _1181 = _1177 * _1173;
    float _1183 = _1181 * 0.5;
    bool _1185 = !_1179;
    float _1187 = _1115;
    float _1189 = _1113;
    float _1191 = _1117;
    float _1193 = _1129;
    if (!_1185)
    {
        float _1195 = _279 * _279;
        float _1197 = fma(_277, _277, _1195);
        float _1199 = fma(_233, _233, _1197);
        float _1201 = rsqrt(_1161);
        float _1203 = sqrt(_1199);
        float _1205 = _1125 * _1201;
        float _1207 = _1121 * _1201;
        float _1209 = _1129 * _1201;
        bool _1211 = _1203 > 0.0;
        bool _1213 = !_1211;
        if (!_1213)
        {
            float _1215 = rsqrt(_1199);
            float _1217 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1219 = _279 * _1215;
            float _1221 = _277 * _1215;
            float _1223 = _233 * _1215;
            float _1225 = _1207 * _1219;
            float _1227 = fma(_1205, _1221, _1225);
            float _1229 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1231 = fma(_1209, _1223, _1227);
            float _1233 = _1231 * _1229;
            float _1235 = fma(_277, _1233, _1115);
            float _1237 = fma(_279, _1233, _1113);
            float _1239 = fma(_233, _1233, _1117);
            _1187 = _1235;
            _1189 = _1237;
            _1191 = _1239;
            _1193 = _1233;
        }
    }
    float _1241 = _1187;
    float _1243 = _1189;
    float _1245 = _1191;
    float _1247 = _1193;
    float _1249 = _1247;
    float _1251 = _1245;
    if (_1157)
    {
        _1249 = 1.0;
    }
    float _1253 = _1249;
    float _1255 = _1253;
    if (_1143)
    {
        _287 = _1241;
    }
    float _1257 = _287;
    float _1259 = _1257;
    if (_1143)
    {
        _289 = _1243;
    }
    float _1261 = _289;
    float _1263 = _1261;
    if (_1143)
    {
        _291 = _1245;
    }
    float _1265 = _291;
    float _1267 = _1265;
    if (!_1143)
    {
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1271 = _1043 + _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1275 = _1011 + _1273;
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1271 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1007 + _1281;
        float _1285 = fma(_1275, _1275, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1011;
        float _1301 = _1299 + _1241;
        float _1303 = -_1043;
        float _1305 = _1303 + _1243;
        float _1307 = -_1007;
        float _1309 = _1307 + _1245;
        float _1311 = _1293 * _1297;
        float _1313 = fma(_1301, _1311, _1011);
        float _1315 = fma(_1305, _1311, _1043);
        float _1317 = fma(_1309, _1311, _1007);
        _1263 = _1315;
        _1259 = _1313;
        _1267 = _1317;
    }
    float _1319 = _1263;
    float _1321 = _1259;
    float _1323 = _1267;
    if (!_1157)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = _1325 * 0.15915493667125701904296875;
        float _1329 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1333 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
        float _1335 = _1327 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1329 * 0.15915493667125701904296875;
        float _1341 = _1327 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1337;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1333;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        _1251 = _1339;
        _1255 = _1381;
    }
    float _1383 = _1251;
    float _1385 = _1255;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1319 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1321 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1323 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = sqrt(_1403);
    float _1409 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1411 = _1393 * _1409;
    float _1413 = _1397 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 * _1413;
    float _1419 = _1415 + _1417;
    float _1421 = sqrt(_1419);
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1427 = _1421 + _1425;
    float _1429 = _1401;
    float _1431 = _1405;
    float _1433 = _1427;
    float _1435 = _1383;
    float _1437 = _1389;
    if (_1423)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1429 = _1439;
    }
    float _1441 = _1429;
    if (_1423)
    {
        float _1443 = rsqrt(_1419);
        _1431 = _1443;
    }
    float _1445 = _1431;
    float _1447 = _1445;
    if (_1423)
    {
        float _1449 = _1427 * _1441;
        _1433 = _1449;
    }
    float _1451 = _1433;
    if (_1423)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1397;
    float _1459 = _1455;
    if (_1423)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1441;
    float _1473 = _1469;
    if (_1423)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1409;
    float _1483 = -_1469;
    float _1485 = fma(_1389, _1481, _1483);
    if (_1423)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1437 = _1487;
    }
    float _1489 = _1437;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1423)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1423)
    {
        _1493 = _1415;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    float _1505 = _1479;
    if (_1423)
    {
        float _1507 = _1479 + (-1.0);
        _1473 = _1507;
    }
    float _1509 = _1473;
    float _1511 = _1509;
    if (_1423)
    {
        float _1513 = _1445 * _1497;
        _1061 = _1513;
    }
    float _1515 = _1061;
    if (!_1423)
    {
        _1447 = _1411;
    }
    float _1517 = _1447;
    float _1519 = _1517;
    if (_1423)
    {
        float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1521;
    }
    float _1523 = _1459;
    if (_1423)
    {
        float _1525 = _1411 * _1515;
        _1519 = _1525;
    }
    float _1527 = _1519;
    if (!_1423)
    {
        _1499 = _1485;
    }
    float _1529 = _1499;
    float _1531 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1533 = _1529;
    if (!_1423)
    {
        _1511 = _1413;
    }
    float _1535 = _1511;
    float _1537 = _1535;
    if (_1423)
    {
        float _1539 = fma(_1485, _1479, _1523);
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (_1423)
    {
        float _1543 = _1413 * _1515;
        _1537 = _1543;
    }
    float _1545 = _1537;
    if (_1423)
    {
        float _1547 = _1527 * _1527;
        _1503 = _1547;
    }
    float _1549 = _1503;
    if (!_1423)
    {
        _1505 = _1417;
    }
    float _1551 = _1505;
    float _1553 = _1551;
    if (_1423)
    {
        float _1555 = _1545 * _1545;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1541, _1541, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1531);
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1575 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = rsqrt(_1561);
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1589 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1595 = abs(_1581);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1605 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1607 = -_1599;
    float _1609 = fma(_1607, _1573, 1.0);
    float _1611 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1577 * _1527;
    float _1617 = _1577 * _1541;
    float _1619 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1577 * _1545;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1629 = log2(_1609);
    float _1631 = -_1623;
    float _1633 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1639 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1637);
    float _1649 = exp2(_1635);
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1639);
    float _1655 = fma(_1643, 0.5, 0.5);
    float _1657 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1659 = _1617 + 1.0;
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = 1.0 / _1647;
    float _1665 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1667 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1669 = fma(_1655, _1665, -0.212114393711090087890625);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1673 = sqrt(_1651);
    float _1675 = -_1617;
    float _1677 = fma(_1649, _1659, _1675);
    float _1679 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1681 = _1629 * 0.693147182464599609375;
    float _1683 = fma(_1655, _1669, 1.570728778839111328125);
    float _1685 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1687 = _1671 * _1663;
    float _1689 = _1679 * _1663;
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1689, -0.5, 0.5);
    float _1695 = _1673 * 0.636619746685028076171875;
    float _1697 = fma(_1677, 0.5, 0.5);
    float _1699 = -_1683;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _5234 = float3(_1691, _1693, _1685);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1691, _1693, _1685);
    float4 _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1708 = _1706.x;
    float _1710 = _1706.y;
    float _1712 = _1706.z;
    float _1714 = _1706.w;
    float2 _5262 = float2(_1701, _1697);
    float3 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = float(uint(_527));
    float _1728 = trunc(_817);
    int _1730 = int(_1728);
    int _1732 = ~_527;
    int _1734 = _1732 + 1;
    float _1736 = _833 * _139;
    int _1738 = ~_527;
    int _1740 = _1738 + 1;
    float _1742 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1744 = abs(_599);
    float _1746 = -_705;
    float _1748 = _1746 + 1.0;
    bool _1750 = _117 > 0.5;
    float _1752 = 1.0 / _1726;
    bool _1754 = _505 > 0.5;
    float _1756 = -_803;
    float _1758 = _1756 + 1.0;
    float _1760 = -_827;
    float _1762 = _1760 + 1.0;
    float _1764 = -_793;
    float _1766 = _1764 + 1.0;
    float _1768 = -_271;
    int _1770 = _1754 ? as_type<int>(_1768) : as_type<int>(_271);
    float _1772 = float(uint(_1730));
    float _1774 = trunc(_1736);
    int _1776 = int(_1774);
    float _1778 = float(_1730);
    bool _1780 = _1778 >= _819;
    bool _1782 = isnan(_1778);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(_819);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    int _1792 = as_type<int>(_1752) + (-2);
    float _1794 = exp2(_1742);
    float _1796 = as_type<float>(_1792) * _1772;
    float _1798 = trunc(_1790);
    int _1800 = int(_1798);
    float _1802 = trunc(_1796);
    float _1804 = precise::max(_1802, 0.0);
    uint _1807 = uint(_1804);
    float _1809 = -_1794;
    float _1811 = _1809 + 1.0;
    int _1813 = _1734 * int(_1807);
    int _1815 = _1813 + _1730;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1792) * _1817;
    bool _1821 = !_519;
    float _1823 = _1821 ? 7.345489978790283203125 : 1.0;
    float _1825 = trunc(_1819);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = _1823 * _117;
    float _1833 = floor(_1831);
    int _1835 = int(_1807) + int(_1829);
    int _1837 = _1740 * _1835;
    int _1839 = _1837 + _1730;
    float _1841 = -_1833;
    float _1843 = _1831 + _1841;
    int _1845 = _527 + (-1);
    bool _1847 = uint(_1839) >= uint(_527);
    bool _1849 = !_1847;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _527 == 0;
    int _1855 = ~_1835;
    int _1857 = _1855 + _1851;
    int _1859 = _1857 + 1;
    float _1861 = _1843 * _819;
    int _1863 = ~_1800;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    int _1869 = _527 * _1859;
    int _1871 = _1869 + _1730;
    float _1873 = trunc(_1861);
    int _1875 = int(_1873);
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1883 = _1881 != 0;
    bool _1885 = !_1853;
    int _1887 = _1885 ? _1871 : (-1);
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1867;
    int _1899 = abs(_589);
    int _1901 = abs(_1891);
    int _1903 = _1800 * _1845;
    int _1905 = _1903 + _1897;
    bool _1907 = !_1895;
    int _1909 = _1907 ? 0 : 1;
    int _1911 = abs(_595);
    int _1913 = _1905 * _1899;
    int _1915 = ~_527;
    int _1917 = _1915 + 1;
    int _1919 = _1875 * _1901;
    int _1921 = _1919 + _1730;
    int _1923 = abs(_1909);
    int _1925 = _1776 * _1911;
    int _1927 = _1925 + _1913;
    int _1929 = ~_527;
    int _1931 = _1929 + 1;
    int _1933 = _1921 * _1744;
    int _1935 = _1933 + _1927;
    int _1937 = _1875 * _1923;
    int _1939 = _1937 + _1935;
    int _1941 = ~_527;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1939));
    float _1947 = as_type<float>(_1792) * _1945;
    float _1949 = trunc(_1947);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1943 * int(_1953);
    int _1957 = _1955 + _1939;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1792) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1953) + int(_1967);
    float _1971 = float(uint(_1921));
    int _1973 = _1931 * _1969;
    int _1975 = _1973 + _1939;
    float _1977 = as_type<float>(_1792) * _1971;
    bool _1979 = uint(_1975) >= uint(_527);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1969;
    int _1993 = _1991 + _1989;
    int _1995 = _1993 + 1;
    int _1997 = _527 * _1995;
    int _1999 = _1997 + _1939;
    int _2001 = ~_527;
    int _2003 = _2001 + 1;
    bool _2005 = !_1853;
    int _2007 = _2005 ? _1999 : (-1);
    int _2009 = _2003 * int(_1985);
    int _2011 = _2009 + _1921;
    int _2013 = _2007 >> 31;
    float _2015 = float(uint(_2011));
    int _2017 = _2013 & 3;
    int _2019 = _2007 & 3;
    bool _2021 = _2019 != 0;
    float _2023 = as_type<float>(_1792) * _2015;
    int _2025 = _2007 + _2017;
    int _2027 = _2007 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = _2025 >> 2;
    float _2033 = trunc(_2023);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = uint(_2027) > 1u;
    int _2041 = _2031 << 4;
    int _2043 = _2041 + 368;
    int _2045 = _2021 ? 0 : 1;
    uint _2047 = uint(int(uint(_2043) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    int _2063 = _2043 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_1985) + int(_2037);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    int _2089 = _2087;
    if (!_2039)
    {
        int _2091 = ~_2045;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _1917 * _2081;
    int _2099 = _2097 + _1921;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2103 = int(_2101);
    bool _2105 = uint(_2027) >= 2u;
    int _2107 = abs(_2095);
    bool _2109 = uint(_2099) >= uint(_527);
    int _2111 = ~_2107;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2109;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _2027 != 3;
    int _2123 = ~_2081;
    int _2125 = _2123 + _2119;
    int _2127 = _2125 + 1;
    int _2129 = _2105 ? 0 : 1;
    bool _2131 = _2027 != 3;
    int _2133 = _527 * _2127;
    int _2135 = _2133 + _1921;
    bool _2137 = !_2029;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = ~_2129;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    int _2147 = abs(_2139);
    int _2149 = _2145;
    if (_2121)
    {
        int _2151 = ~_2129;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2155);
    int _2163 = ~_2147;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = _2115 * as_type<int>(_2061);
    bool _2171 = !_2131;
    int _2173 = _2171 ? 0 : (-1);
    int _2175 = abs(_2103);
    int _2177 = _2167 * as_type<int>(_2053);
    int _2179 = _2177 + _2169;
    float _2181 = float(uint(_2103));
    bool _2183 = !_2159;
    int _2185 = _2183 ? 0 : 1;
    int _2187 = abs(_2173);
    float _2189 = 1.0 / _2181;
    int _2191 = ~_2161;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = ~_2187;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2195 * as_type<int>(_2071);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1853;
    int _2209 = _2207 ? _2135 : (-1);
    float _2211 = in.m_49.w;
    int _2213 = abs(_2185);
    int _2215 = _2201 * as_type<int>(_2079);
    int _2217 = _2215 + _2205;
    float _2219 = float(uint(_2175));
    int _2221 = ~_2213;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = 1.0 / _2219;
    int _2229 = _2217 * _2225;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2235 = as_type<int>(_2189) + (-2);
    int _2237 = _2209 * _2213;
    int _2239 = _2237 + _2229;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2243 = _2241 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2245 = 1.0 / _2233;
    bool _2247 = _511 > 0.5;
    float _2249 = float(uint(_2239));
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2251;
    int _2255 = ~_2103;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2261 = _2259 != 0;
    float _2263 = 1.0 / _2243;
    int _2265 = abs(_2239);
    float _2267 = as_type<float>(_2235) * _2249;
    int _2269 = as_type<int>(_2227) + (-2);
    float _2271 = float(uint(_2265));
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2275 = _2273 != 0;
    float _2277 = trunc(_2267);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = _2253 * _2245;
    float _2285 = as_type<float>(_2269) * _2271;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2293 = _2291 != 0;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2297 = _503 + _2295;
    float _2299 = trunc(_2285);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2289 * _2263;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2309 = _2307 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2311 = ~_2175;
    int _2313 = _2311 + 1;
    float _2315 = -_271;
    int _2317 = _1750 ? as_type<int>(_2315) : as_type<int>(_271);
    int _2319 = _2257 * int(_2281);
    int _2321 = _2319 + _2239;
    bool _2323 = _2211 > 0.5;
    float _2325 = fma(_2283, _2297, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2327 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_503);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = 1.0 / _2309;
    float _2341 = float(uint(_2321));
    bool _2343 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2345 = isnan(_503);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    int _2355 = _2313 * int(_2303);
    int _2357 = _2355 + _2265;
    float _2359 = -_2337;
    float _2361 = _2359 + 1.0;
    float _2363 = as_type<float>(_2235) * _2341;
    bool _2365 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2367 = isnan(_503);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2379 = float(uint(_2357));
    float _2381 = _2353 * _2361;
    float _2383 = -_2353;
    float _2385 = _2383 + 1.0;
    float _2387 = -_2375;
    float _2389 = _2387 + 1.0;
    bool _2391 = !_1883;
    float _2393 = _2391 ? _271 : as_type<float>(_2317);
    float _2395 = as_type<float>(_2269) * _2379;
    bool _2397 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2399 = isnan(_503);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = _2375 * _2385;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2411;
    float _2415 = trunc(_2363);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _2407 * _2389;
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2425 = _503 + _2423;
    float _2427 = -_2407;
    float _2429 = _2427 + 1.0;
    float _2431 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2433 = trunc(_2395);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2413 * _2339;
    bool _2441 = !_2275;
    float _2443 = _2441 ? _271 : as_type<float>(_1770);
    float _2445 = _2325 * _2421;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2449 = _503 + _2447;
    float _2451 = -_193;
    int _2453 = _2247 ? as_type<int>(_2451) : as_type<int>(_193);
    float _2455 = -_193;
    int _2457 = _2323 ? as_type<int>(_2455) : as_type<int>(_193);
    float _2459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2461 = fma(_2305, _2449, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2463 = fma(_2439, _2425, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2465 = int(_2281) + int(_2419);
    float _2467 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2445);
    int _2469 = ~_2103;
    int _2471 = _2469 + 1;
    float _2473 = _2443 + 0.5;
    int _2475 = ~_2175;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2461, _2409, _2467);
    int _2481 = int(_2303) + int(_2437);
    float _2483 = fma(_2431, _2473, _823);
    bool _2485 = !_2261;
    float _2487 = _2485 ? _193 : as_type<float>(_2453);
    float _2489 = fma(_2463, _2381, _2479);
    bool _2491 = !_2293;
    float _2493 = _2491 ? _193 : as_type<float>(_2457);
    int _2495 = _2477 * _2481;
    int _2497 = _2495 + _2265;
    float _2499 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2501 = _2471 * _2465;
    int _2503 = _2501 + _2239;
    float _2505 = _2493 + (-0.5);
    bool _2507 = uint(_2497) >= uint(_2175);
    float _2509 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2489);
    int _2511 = _2239 ^ _2103;
    float _2513 = -_2499;
    float _2515 = -_837;
    float _2517 = fma(_2513, _2505, _2515);
    bool _2519 = uint(_2503) >= uint(_2103);
    float _2521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2523 = !_2507;
    int _2525 = _2523 ? 0 : (-1);
    float _2527 = fma(_2493, _1762, _2517);
    bool _2529 = !_2519;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2535 = uint(int(uint(_2511) >> uint(31)));
    int _2537 = ~_2465;
    int _2539 = _2537 + _2531;
    int _2541 = _2539 + 1;
    int _2543 = ~_2525;
    int _2545 = _2481 + _2543;
    int _2547 = _2545 + 1;
    out.m_68.w = _2533;
    int _2549 = ~int(_2535);
    int _2551 = _2549 + 1;
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2555 = _2103 * _2541;
    int _2557 = _2555 + _2239;
    bool _2559 = _2103 == 0;
    float _2561 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2563 = _2547 ^ _2551;
    float _2565 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2103 == 0;
    float _2569 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    int _2571 = ~_2551;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    float _2577 = _283 * _2565;
    bool _2579 = !_2559;
    int _2581 = _2579 ? _2557 : (-1);
    float _2583 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    bool _2585 = !_2567;
    int _2587 = _2585 ? _2575 : (-1);
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2591 = float(_2581);
    float _2593 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2595 = float(_2587);
    float _2597 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2599 = -_1748;
    float _2601 = fma(_2443, _2599, _2483);
    float _2603 = fma(_2593, _2591, _539);
    float _2605 = _2393 + 0.5;
    float _2607 = -_801;
    float _2609 = fma(_2597, _2595, _2607);
    float _2611 = _2487 + (-0.5);
    bool _2613 = _1385 > 0.0;
    bool _2615 = isnan(_1385);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(0.0);
    bool _2621 = _2617 || _2619;
    float _2623 = fma(_2593, _2605, _2603);
    float _2625 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2583);
    float _2627 = -_2597;
    float _2629 = fma(_2627, _2611, _2609);
    float _2631 = -_1766;
    float _2633 = fma(_2393, _2631, _2623);
    float _2635 = _2625 + _1647;
    float _2637 = fma(_2487, _1758, _2629);
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1679;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1647;
    float _2639 = _2635 * 0.5;
    float _2641 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2633;
    out.m_70.y = _2637;
    out.m_70.z = _2601;
    out.m_70.w = _2527;
    float _2643 = _2641 * _1703;
    float _2645 = -_2641;
    float _2647 = _2645 + 1.0;
    out.m_72.z = _2639;
    out.m_72.w = _1647;
    float _2649 = _1714 * _2643;
    float _2651 = _1724 * _2643;
    float _2653 = _1714 * _2647;
    float _2655 = fma(_1720, _2649, _1708);
    float _2657 = fma(_1722, _2649, _1710);
    float _2659 = fma(_1714, _2651, _1712);
    out.m_45.x = _2589;
    out.m_74.x = _2655;
    out.m_74.y = _2657;
    out.m_74.z = _2659;
    out.m_74.w = _2653;
    if (_2621)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2661;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    if (!_97)
    {
        out.m_45.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _103 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2719 = as_type<float>(_109);
        out.gl_Position.z = _2719;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_47.w;
    float _115 = float(_93);
    float _117 = in.m_49.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_51.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _121;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _101;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    float _149 = _121 * _139;
    float _151 = _149;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_147);
        out.gl_Position.z = _2793;
    }
    out.m_53.x = _149;
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_42.x;
    float _167 = _157 * _153;
    float _169 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = _169 * 6.283185482025146484375;
    int _173 = as_type<int>(_155) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_155) & 2;
    bool _179 = _177 != 0;
    float _181 = floor(_169);
    int _183 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _185 = _183 != 0;
    float _187 = _171 * 0.15915493667125701904296875;
    float _189 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _191 = !_179;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _203 = _201 != 0;
    float _205 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    float _211 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    bool _213 = !_185;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    bool _219 = !_199;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    out.m_60.x = _165;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _227 = -_181;
    float _229 = _169 + _227;
    int _231 = abs(_221);
    float _233 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _223);
    int _235 = abs(_215);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _241 = !_203;
    int _243 = _241 ? 0 : 1;
    float _245 = float(_231);
    float _247 = fma(_209, 0.5, 0.5);
    int _249 = abs(_243);
    bool _251 = _229 < 0.5;
    float _253 = float(_251);
    float _255 = abs(_239);
    float _257 = _245 * _255;
    float _259 = float(_235);
    float _261 = -_247;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = -_253;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _269 = !_175;
    float _271 = _269 ? (-0.5) : 0.5;
    float _273 = fma(_259, _263, _257);
    float _275 = float(_249);
    float _277 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _217);
    float _279 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _211);
    float _281 = abs(_267);
    float _283 = fma(_275, _281, _273);
    bool _285 = !_225;
    float _287 = _279;
    float _289 = _233;
    float _291 = _277;
    float _307;
    if (!_285)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _149;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_311);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _343 = 1.0 / _323;
    out.m_62.w = _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _319;
    bool _349 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _351 = isnan(_311);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _327;
    float _363 = _315 * _347;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _311 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _311 + _369;
    float _373 = _367 * _343;
    float _375 = -_339;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _371 * _361;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    bool _389 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _391 = isnan(_311);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = _359 * _377;
    float _403 = fma(_381, _363, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_387, _363, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _407 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_311);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -_359;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = -_399;
    float _433 = _431 + 1.0;
    float _435 = _399 * _421;
    float _437 = fma(_425, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_429, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = _417 * _433;
    float _443 = in.m_64.x;
    float _445 = in.m_64.y;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = _405 * _441;
    float _453 = _403 * _441;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _459;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _453);
    float _467 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_461, _383, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _471 = fma(_439, _435, _463);
    float _473 = fma(_437, _435, _465);
    float _475 = fma(_467, _401, _471);
    float _477 = fma(_469, _401, _473);
    float _479 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _475);
    float _481 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _477);
    float _483 = _479 * _445;
    float _485 = _481 * _443;
    bool _487 = !_345;
    if (!_487)
    {
        float _489 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _491 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _495 = _493 * _489;
        float _497 = floor(_495);
        float _499 = -_497;
        float _501 = _495 + _499;
        _151 = _501;
    }
    float _503 = _151;
    float _505 = in.m_49.z;
    float _507 = _117 * 2.0;
    float _509 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _511 = in.m_49.y;
    float _513 = floor(_507);
    float _515 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _485 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _527 = int(_525);
    float _529 = -_523;
    float _531 = fma(_509, 2.0, _529);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = -_121;
    float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _531);
    bool _541 = _513 > 0.0;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _545 = _505 * 2.0;
    bool _547 = _513 >= 0.0;
    bool _549 = isnan(_513);
    bool _551 = _547 || _549;
    bool _553 = isnan(0.0);
    bool _555 = _551 || _553;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _559 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _561 = int(_559);
    float _563 = _511 * 2.0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _571 = _569 != 0;
    int _573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _575 = _573 != 0;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _579 = _511 + _505;
    float _581 = _511 + (-0.5);
    float _583 = fma(_577, -2.0, _533);
    float _585 = floor(_545);
    bool _587 = !_571;
    int _589 = _587 ? 0 : 1;
    float _591 = _579 + (-1.0);
    bool _593 = !_567;
    int _595 = _593 ? 0 : 1;
    bool _597 = !_575;
    int _599 = _597 ? 0 : 1;
    float _601 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _603 = _555 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _605 = floor(_563);
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _609 = _607 != 0;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _613 = _611 != 0;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _617 = _615 != 0;
    float _619 = _591;
    float _621 = _603;
    if (!_519)
    {
        _619 = _511;
    }
    float _623 = _619;
    float _625 = _623;
    if (_519)
    {
        _625 = _117;
    }
    float _627 = _625;
    bool _629 = !_613;
    int _631 = _629 ? 0 : 1;
    int _633 = ~as_type<int>(_603);
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    int _639 = _637;
    if (!_541)
    {
        int _641 = ~as_type<int>(_603);
        int _643 = _641 + 1;
        _639 = _643;
    }
    int _645 = _639;
    bool _647 = _585 > 0.0;
    bool _649 = _585 >= 0.0;
    bool _651 = isnan(_585);
    bool _653 = _649 || _651;
    bool _655 = isnan(0.0);
    bool _657 = _653 || _655;
    bool _659 = _605 > 0.0;
    bool _661 = _605 >= 0.0;
    bool _663 = isnan(_605);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_519)
    {
        _621 = _505;
    }
    float _673 = _621;
    float _675 = _673;
    if (_519)
    {
        _675 = _511;
    }
    float _677 = _675;
    float _679 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[83].z, _671);
    float _681 = _627 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _683 = _669 ? 0 : 1;
    float _685 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _687 = log2(_685);
    float _689 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _691 = _677;
    if (!_519)
    {
        _691 = _505;
    }
    float _693 = _691;
    float _695 = -_543;
    float _697 = fma(_681, 2.0, _695);
    int _699 = ~_683;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _679);
    float _707 = _693;
    int _709 = _703;
    if (_519)
    {
        _707 = _511;
    }
    float _711 = _707;
    if (!_659)
    {
        int _713 = ~_683;
        int _715 = _713 + 1;
        _709 = _715;
    }
    int _717 = _709;
    float _719 = float(_561);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _723 = abs(_631);
    int _725 = _657 ? 0 : 1;
    float _727 = fma(_721, -2.0, _557);
    float _729 = _687 * _121;
    float _731 = float(_645);
    float _733 = 1.0 / _719;
    float _735 = float(_723);
    int _737 = ~_725;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _735 * _731;
    int _745 = _741;
    if (!_647)
    {
        int _747 = ~_725;
        int _749 = _747 + 1;
        _745 = _749;
    }
    int _751 = _745;
    float _753 = exp2(_729);
    float _755 = in.m_66.x;
    float _757 = in.m_66.y;
    float _759 = in.m_66.z;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _765 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _773 = _769 || _771;
    float _775 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _761);
    bool _777 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _779 = isnan(1.0);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _785 = _781 || _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _789 = 1.0 + _787;
    float _791 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _763);
    float _793 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    bool _795 = !_609;
    int _797 = _795 ? 0 : 1;
    float _799 = 1.0 / _789;
    float _801 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _583);
    float _803 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _791);
    int _805 = abs(_797);
    float _807 = -_753;
    float _809 = _807 + 1.0;
    float _811 = _743 * (-2.0);
    bool _813 = !_617;
    int _815 = _813 ? 0 : 1;
    float _817 = _733 * _121;
    float _819 = float(_527);
    float _821 = -_121;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[81].x, _697);
    float _825 = _773 ? _809 : 0.0;
    float _827 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _689);
    float _829 = fma(_811, _757, _757);
    float _831 = float(_751);
    float _833 = _819 * _121;
    float _835 = float(_805);
    float _837 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _727);
    int _839 = abs(_815);
    if (_785)
    {
        float _841 = _825 * _799;
        _141 = _841;
    }
    float _843 = _141;
    float _845 = fma(_601, _811, _601);
    float _847 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].y, _829);
    float _849 = _835 * _831;
    float _851 = _117 + _511;
    float _853 = fma(_845, _843, _847);
    float _855 = _851 + (-1.0);
    float _857 = float(_839);
    float _859 = _849 * (-2.0);
    float _861 = float(_717);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = _117 + _505;
    float _867 = _853 * 0.15915493667125701904296875;
    float _869 = fma(_859, _755, _755);
    float _871 = _857 * _861;
    float _873 = _117 + (-0.5);
    float _875 = _865 + (-1.0);
    float _877 = _871 * (-2.0);
    float _879 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].x, _869);
    float _881 = fma(_863, _859, _863);
    float _883 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _885 = fma(_877, _759, _759);
    float _887 = _505 + (-0.5);
    float _889 = fma(_881, _843, _879);
    float _891 = fma(_883, _877, _883);
    float _893 = _867 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].z, _885);
    float _899 = _889 * 0.15915493667125701904296875;
    float _901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _271);
    float _905 = fma(_891, _843, _897);
    float _907 = in.m_42.z;
    float _909 = _867 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _905 * 0.15915493667125701904296875;
    float _915 = _521 * _903;
    float _917 = in.m_42.y;
    float _919 = _913 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _515 * _901;
    float _925 = _899 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = _899 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _921 * _923;
    float _935 = _895 * _921;
    float _937 = _913 * 6.283185482025146484375;
    float _939 = sin(_937);
    float _941 = _927 * _895;
    float _943 = _931 * _911;
    float _945 = _931 * _895;
    float _947 = _927 * _911;
    float _949 = _931 * _933;
    float _951 = _911 * _921;
    float _953 = _927 * _933;
    float _955 = _917 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _957 = fma(_939, _943, _941);
    float _959 = -_945;
    float _961 = fma(_939, _947, _959);
    float _963 = -_947;
    float _965 = fma(_939, _945, _963);
    float _967 = -_923;
    float _969 = _939 * _967;
    float _971 = fma(_957, _915, _949);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_939, _941, _943);
    float _977 = fma(_951, _915, _969);
    float _979 = fma(_961, _915, _953);
    float _981 = fma(_965, _973, _971);
    float _983 = _917 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _985 = fma(_935, _973, _977);
    float _987 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _955);
    float _989 = _981 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _991 = fma(_975, _973, _979);
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _995 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _983);
    float _997 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[26].x, _989);
    float _999 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[6].z, _987);
    float _1001 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[24].x, _993);
    float _1003 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[4].z, _995);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].z, _997);
    float _1007 = _999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1013 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1015 = _917 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1017 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1019 = _981 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1021 = _1007 + _1013;
    float _1023 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1015);
    float _1025 = _1011 + _1017;
    float _1027 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1019);
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1031 = _1021 + _1029;
    float _1033 = fma(_907, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1023);
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1037 = _1025 + _1035;
    float _1039 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1027);
    float _1041 = _1031 * _1031;
    float _1043 = _1033 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1045 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1047 = fma(_1037, _1037, _1041);
    float _1049 = _1043 + _1045;
    float _1051 = sqrt(_1047);
    bool _1053 = _1051 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1055 = _1023;
    float _1057 = _1045;
    float _1059 = _1019;
    float _1061 = _915;
    if (!_1053)
    {
        _1055 = _1025;
    }
    float _1063 = _1055;
    float _1065 = _1063;
    if (!_1053)
    {
        _1057 = _1021;
    }
    float _1067 = _1057;
    float _1069 = _1067;
    if (!_1053)
    {
        _1059 = _1049;
    }
    float _1071 = _1059;
    bool _1073 = !_1053;
    float _1075 = _1071;
    if (!_1073)
    {
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1081 = _1051 + _1079;
        float _1083 = _1049 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = rsqrt(_1047);
        float _1087 = _1081 * _1077;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = _1089 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = _1089 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        float _1099 = _1093 + (-1.0);
        float _1101 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1103 = fma(_1097, _1083, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1105 = fma(_1049, _1093, _1101);
        float _1107 = _1085 * _1103;
        float _1109 = fma(_1037, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1111 = fma(_1031, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1075 = _1105;
        _1065 = _1109;
        _1069 = _1111;
    }
    float _1113 = _1075;
    float _1115 = _1065;
    float _1117 = _1069;
    float _1119 = -_1043;
    float _1121 = _1119 + _1113;
    float _1123 = -_1011;
    float _1125 = _1123 + _1115;
    float _1127 = -_1007;
    float _1129 = _1127 + _1117;
    float _1131 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1133 = _1121 * _1121;
    bool _1135 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1137 = isnan(0.5);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1143 = _1139 || _1141;
    float _1145 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1131);
    float _1147 = fma(_1125, _1125, _1133);
    bool _1149 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1151 = isnan(0.5);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1157 = _1153 || _1155;
    float _1159 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1145);
    float _1161 = fma(_1129, _1129, _1147);
    float _1163 = _1043 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1167 = sqrt(_1161);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1163);
    float _1171 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1169);
    float _1173 = 1.0 / _1165;
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1177 = _1175 + _1165;
    bool _1179 = _1167 > 0.0;
    float _1181 = _1177 * _1173;
    float _1183 = _1181 * 0.5;
    bool _1185 = !_1179;
    float _1187 = _1115;
    float _1189 = _1113;
    float _1191 = _1117;
    float _1193 = _1129;
    if (!_1185)
    {
        float _1195 = _279 * _279;
        float _1197 = fma(_277, _277, _1195);
        float _1199 = fma(_233, _233, _1197);
        float _1201 = rsqrt(_1161);
        float _1203 = sqrt(_1199);
        float _1205 = _1125 * _1201;
        float _1207 = _1121 * _1201;
        float _1209 = _1129 * _1201;
        bool _1211 = _1203 > 0.0;
        bool _1213 = !_1211;
        if (!_1213)
        {
            float _1215 = rsqrt(_1199);
            float _1217 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1219 = _279 * _1215;
            float _1221 = _277 * _1215;
            float _1223 = _233 * _1215;
            float _1225 = _1207 * _1219;
            float _1227 = fma(_1205, _1221, _1225);
            float _1229 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1231 = fma(_1209, _1223, _1227);
            float _1233 = _1231 * _1229;
            float _1235 = fma(_277, _1233, _1115);
            float _1237 = fma(_279, _1233, _1113);
            float _1239 = fma(_233, _1233, _1117);
            _1187 = _1235;
            _1189 = _1237;
            _1191 = _1239;
            _1193 = _1233;
        }
    }
    float _1241 = _1187;
    float _1243 = _1189;
    float _1245 = _1191;
    float _1247 = _1193;
    float _1249 = _1247;
    float _1251 = _1245;
    if (_1157)
    {
        _1249 = 1.0;
    }
    float _1253 = _1249;
    float _1255 = _1253;
    if (_1143)
    {
        _287 = _1241;
    }
    float _1257 = _287;
    float _1259 = _1257;
    if (_1143)
    {
        _289 = _1243;
    }
    float _1261 = _289;
    float _1263 = _1261;
    if (_1143)
    {
        _291 = _1245;
    }
    float _1265 = _291;
    float _1267 = _1265;
    if (!_1143)
    {
        float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1271 = _1043 + _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1275 = _1011 + _1273;
        float _1277 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1279 = _1271 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1283 = _1007 + _1281;
        float _1285 = fma(_1275, _1275, _1279);
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1289 = fma(_1283, _1283, _1285);
        float _1291 = sqrt(_1289);
        float _1293 = _1277 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1295 = precise::min(_1291, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1297 = _1295 * _1287;
        float _1299 = -_1011;
        float _1301 = _1299 + _1241;
        float _1303 = -_1043;
        float _1305 = _1303 + _1243;
        float _1307 = -_1007;
        float _1309 = _1307 + _1245;
        float _1311 = _1293 * _1297;
        float _1313 = fma(_1301, _1311, _1011);
        float _1315 = fma(_1305, _1311, _1043);
        float _1317 = fma(_1309, _1311, _1007);
        _1263 = _1315;
        _1259 = _1313;
        _1267 = _1317;
    }
    float _1319 = _1263;
    float _1321 = _1259;
    float _1323 = _1267;
    if (!_1157)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = _1325 * 0.15915493667125701904296875;
        float _1329 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1333 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1331);
        float _1335 = _1327 * 6.283185482025146484375;
        float _1337 = cos(_1335);
        float _1339 = _1329 * 0.15915493667125701904296875;
        float _1341 = _1327 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1337;
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1339 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1333;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        _1251 = _1339;
        _1255 = _1381;
    }
    float _1383 = _1251;
    float _1385 = _1255;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1319 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1393 = _1321 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1397 = _1323 + _1395;
    float _1399 = _1389 * _1389;
    float _1401 = fma(_1393, _1393, _1399);
    float _1403 = fma(_1397, _1397, _1401);
    float _1405 = rsqrt(_1403);
    float _1407 = sqrt(_1403);
    float _1409 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1411 = _1393 * _1409;
    float _1413 = _1397 * _1409;
    float _1415 = _1411 * _1411;
    float _1417 = _1413 * _1413;
    float _1419 = _1415 + _1417;
    float _1421 = sqrt(_1419);
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1427 = _1421 + _1425;
    float _1429 = _1401;
    float _1431 = _1405;
    float _1433 = _1427;
    float _1435 = _1383;
    float _1437 = _1389;
    if (_1423)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1429 = _1439;
    }
    float _1441 = _1429;
    if (_1423)
    {
        float _1443 = rsqrt(_1419);
        _1431 = _1443;
    }
    float _1445 = _1431;
    float _1447 = _1445;
    if (_1423)
    {
        float _1449 = _1427 * _1441;
        _1433 = _1449;
    }
    float _1451 = _1433;
    if (_1423)
    {
        float _1453 = _1451 * 0.15915493667125701904296875;
        _1435 = _1453;
    }
    float _1455 = _1435;
    float _1457 = _1397;
    float _1459 = _1455;
    if (_1423)
    {
        float _1461 = _1455 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1457 = _1463;
    }
    float _1465 = _1457;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1441;
    float _1473 = _1469;
    if (_1423)
    {
        float _1475 = _1455 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1409;
    float _1483 = -_1469;
    float _1485 = fma(_1389, _1481, _1483);
    if (_1423)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1437 = _1487;
    }
    float _1489 = _1437;
    float _1491 = _1489;
    float _1493 = _1465;
    if (_1423)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1491 = _1495;
    }
    float _1497 = _1491;
    float _1499 = _1497;
    if (!_1423)
    {
        _1493 = _1415;
    }
    float _1501 = _1493;
    float _1503 = _1501;
    float _1505 = _1479;
    if (_1423)
    {
        float _1507 = _1479 + (-1.0);
        _1473 = _1507;
    }
    float _1509 = _1473;
    float _1511 = _1509;
    if (_1423)
    {
        float _1513 = _1445 * _1497;
        _1061 = _1513;
    }
    float _1515 = _1061;
    if (!_1423)
    {
        _1447 = _1411;
    }
    float _1517 = _1447;
    float _1519 = _1517;
    if (_1423)
    {
        float _1521 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1459 = _1521;
    }
    float _1523 = _1459;
    if (_1423)
    {
        float _1525 = _1411 * _1515;
        _1519 = _1525;
    }
    float _1527 = _1519;
    if (!_1423)
    {
        _1499 = _1485;
    }
    float _1529 = _1499;
    float _1531 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1533 = _1529;
    if (!_1423)
    {
        _1511 = _1413;
    }
    float _1535 = _1511;
    float _1537 = _1535;
    if (_1423)
    {
        float _1539 = fma(_1485, _1479, _1523);
        _1533 = _1539;
    }
    float _1541 = _1533;
    if (_1423)
    {
        float _1543 = _1413 * _1515;
        _1537 = _1543;
    }
    float _1545 = _1537;
    if (_1423)
    {
        float _1547 = _1527 * _1527;
        _1503 = _1547;
    }
    float _1549 = _1503;
    if (!_1423)
    {
        _1505 = _1417;
    }
    float _1551 = _1505;
    float _1553 = _1551;
    if (_1423)
    {
        float _1555 = _1545 * _1545;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1541, _1541, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1531);
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1407, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1575 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = rsqrt(_1561);
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1585 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1587 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1589 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1583);
    float _1593 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1585);
    float _1595 = abs(_1581);
    float _1597 = log2(_1595);
    float _1599 = _1587 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1591);
    float _1605 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1607 = -_1599;
    float _1609 = fma(_1607, _1573, 1.0);
    float _1611 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1615 = _1577 * _1527;
    float _1617 = _1577 * _1541;
    float _1619 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1577 * _1545;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1629 = log2(_1609);
    float _1631 = -_1623;
    float _1633 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1631);
    float _1635 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1627);
    float _1639 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1641 = -_1621;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1633);
    float _1645 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1647 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1637);
    float _1649 = exp2(_1635);
    float _1651 = fma(_1643, -0.5, 0.5);
    float _1653 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1639);
    float _1655 = fma(_1643, 0.5, 0.5);
    float _1657 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1645);
    float _1659 = _1617 + 1.0;
    float _1661 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = 1.0 / _1647;
    float _1665 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1667 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1657);
    float _1669 = fma(_1655, _1665, -0.212114393711090087890625);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1673 = sqrt(_1651);
    float _1675 = -_1617;
    float _1677 = fma(_1649, _1659, _1675);
    float _1679 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1681 = _1629 * 0.693147182464599609375;
    float _1683 = fma(_1655, _1669, 1.570728778839111328125);
    float _1685 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1687 = _1671 * _1663;
    float _1689 = _1679 * _1663;
    float _1691 = fma(_1687, 0.5, 0.5);
    float _1693 = fma(_1689, -0.5, 0.5);
    float _1695 = _1673 * 0.636619746685028076171875;
    float _1697 = fma(_1677, 0.5, 0.5);
    float _1699 = -_1683;
    float _1701 = fma(_1695, _1699, 1.0);
    float3 _5234 = float3(_1691, _1693, _1685);
    float _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5234, float3(0.0), isnan(_5234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5234, float3(0.0), isnan(_5234)), level(0.0)).x;
    float3 _5245 = float3(_1691, _1693, _1685);
    float4 _1706 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).xyzw;
    float _1708 = _1706.x;
    float _1710 = _1706.y;
    float _1712 = _1706.z;
    float _1714 = _1706.w;
    float2 _5262 = float2(_1701, _1697);
    float3 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5262, float2(0.0), isnan(_5262)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5262, float2(0.0), isnan(_5262)), level(0.0)).xyz;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = float(uint(_527));
    float _1728 = trunc(_817);
    int _1730 = int(_1728);
    int _1732 = ~_527;
    int _1734 = _1732 + 1;
    float _1736 = _833 * _139;
    int _1738 = ~_527;
    int _1740 = _1738 + 1;
    float _1742 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1744 = abs(_599);
    float _1746 = -_705;
    float _1748 = _1746 + 1.0;
    bool _1750 = _117 > 0.5;
    float _1752 = 1.0 / _1726;
    bool _1754 = _505 > 0.5;
    float _1756 = -_803;
    float _1758 = _1756 + 1.0;
    float _1760 = -_827;
    float _1762 = _1760 + 1.0;
    float _1764 = -_793;
    float _1766 = _1764 + 1.0;
    float _1768 = -_271;
    int _1770 = _1754 ? as_type<int>(_1768) : as_type<int>(_271);
    float _1772 = float(uint(_1730));
    float _1774 = trunc(_1736);
    int _1776 = int(_1774);
    float _1778 = float(_1730);
    bool _1780 = _1778 >= _819;
    bool _1782 = isnan(_1778);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(_819);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    int _1792 = as_type<int>(_1752) + (-2);
    float _1794 = exp2(_1742);
    float _1796 = as_type<float>(_1792) * _1772;
    float _1798 = trunc(_1790);
    int _1800 = int(_1798);
    float _1802 = trunc(_1796);
    float _1804 = precise::max(_1802, 0.0);
    uint _1807 = uint(_1804);
    float _1809 = -_1794;
    float _1811 = _1809 + 1.0;
    int _1813 = _1734 * int(_1807);
    int _1815 = _1813 + _1730;
    float _1817 = float(uint(_1815));
    float _1819 = as_type<float>(_1792) * _1817;
    bool _1821 = !_519;
    float _1823 = _1821 ? 7.345489978790283203125 : 1.0;
    float _1825 = trunc(_1819);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    float _1831 = _1823 * _117;
    float _1833 = floor(_1831);
    int _1835 = int(_1807) + int(_1829);
    int _1837 = _1740 * _1835;
    int _1839 = _1837 + _1730;
    float _1841 = -_1833;
    float _1843 = _1831 + _1841;
    int _1845 = _527 + (-1);
    bool _1847 = uint(_1839) >= uint(_527);
    bool _1849 = !_1847;
    int _1851 = _1849 ? 0 : (-1);
    bool _1853 = _527 == 0;
    int _1855 = ~_1835;
    int _1857 = _1855 + _1851;
    int _1859 = _1857 + 1;
    float _1861 = _1843 * _819;
    int _1863 = ~_1800;
    int _1865 = _1863 + 1;
    int _1867 = _1865 + 1;
    int _1869 = _527 * _1859;
    int _1871 = _1869 + _1730;
    float _1873 = trunc(_1861);
    int _1875 = int(_1873);
    int _1877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1879 = _1877 != 0;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1883 = _1881 != 0;
    bool _1885 = !_1853;
    int _1887 = _1885 ? _1871 : (-1);
    bool _1889 = !_1879;
    int _1891 = _1889 ? 0 : 1;
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1867;
    int _1899 = abs(_589);
    int _1901 = abs(_1891);
    int _1903 = _1800 * _1845;
    int _1905 = _1903 + _1897;
    bool _1907 = !_1895;
    int _1909 = _1907 ? 0 : 1;
    int _1911 = abs(_595);
    int _1913 = _1905 * _1899;
    int _1915 = ~_527;
    int _1917 = _1915 + 1;
    int _1919 = _1875 * _1901;
    int _1921 = _1919 + _1730;
    int _1923 = abs(_1909);
    int _1925 = _1776 * _1911;
    int _1927 = _1925 + _1913;
    int _1929 = ~_527;
    int _1931 = _1929 + 1;
    int _1933 = _1921 * _1744;
    int _1935 = _1933 + _1927;
    int _1937 = _1875 * _1923;
    int _1939 = _1937 + _1935;
    int _1941 = ~_527;
    int _1943 = _1941 + 1;
    float _1945 = float(uint(_1939));
    float _1947 = as_type<float>(_1792) * _1945;
    float _1949 = trunc(_1947);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1943 * int(_1953);
    int _1957 = _1955 + _1939;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1792) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = int(_1953) + int(_1967);
    float _1971 = float(uint(_1921));
    int _1973 = _1931 * _1969;
    int _1975 = _1973 + _1939;
    float _1977 = as_type<float>(_1792) * _1971;
    bool _1979 = uint(_1975) >= uint(_527);
    float _1981 = trunc(_1977);
    float _1983 = precise::max(_1981, 0.0);
    uint _1985 = uint(_1983);
    bool _1987 = !_1979;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1969;
    int _1993 = _1991 + _1989;
    int _1995 = _1993 + 1;
    int _1997 = _527 * _1995;
    int _1999 = _1997 + _1939;
    int _2001 = ~_527;
    int _2003 = _2001 + 1;
    bool _2005 = !_1853;
    int _2007 = _2005 ? _1999 : (-1);
    int _2009 = _2003 * int(_1985);
    int _2011 = _2009 + _1921;
    int _2013 = _2007 >> 31;
    float _2015 = float(uint(_2011));
    int _2017 = _2013 & 3;
    int _2019 = _2007 & 3;
    bool _2021 = _2019 != 0;
    float _2023 = as_type<float>(_1792) * _2015;
    int _2025 = _2007 + _2017;
    int _2027 = _2007 & 3;
    bool _2029 = _2027 != 0;
    int _2031 = _2025 >> 2;
    float _2033 = trunc(_2023);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = uint(_2027) > 1u;
    int _2041 = _2031 << 4;
    int _2043 = _2041 + 368;
    int _2045 = _2021 ? 0 : 1;
    uint _2047 = uint(int(uint(_2043) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    int _2063 = _2043 + 8;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
    int _2069 = int(_2065) & 3;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[int(_2067)][_2069];
    int _2073 = int(_2065) + 1;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    int _2077 = _2073 & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_1985) + int(_2037);
    int _2083 = ~_2045;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    int _2089 = _2087;
    if (!_2039)
    {
        int _2091 = ~_2045;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _1917 * _2081;
    int _2099 = _2097 + _1921;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2103 = int(_2101);
    bool _2105 = uint(_2027) >= 2u;
    int _2107 = abs(_2095);
    bool _2109 = uint(_2099) >= uint(_527);
    int _2111 = ~_2107;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2109;
    int _2119 = _2117 ? 0 : (-1);
    bool _2121 = _2027 != 3;
    int _2123 = ~_2081;
    int _2125 = _2123 + _2119;
    int _2127 = _2125 + 1;
    int _2129 = _2105 ? 0 : 1;
    bool _2131 = _2027 != 3;
    int _2133 = _527 * _2127;
    int _2135 = _2133 + _1921;
    bool _2137 = !_2029;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = ~_2129;
    int _2143 = _2141 + 1;
    int _2145 = _2143 + 1;
    int _2147 = abs(_2139);
    int _2149 = _2145;
    if (_2121)
    {
        int _2151 = ~_2129;
        int _2153 = _2151 + 1;
        _2149 = _2153;
    }
    int _2155 = _2149;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2155);
    int _2163 = ~_2147;
    int _2165 = _2163 + 1;
    int _2167 = _2165 + 1;
    int _2169 = _2115 * as_type<int>(_2061);
    bool _2171 = !_2131;
    int _2173 = _2171 ? 0 : (-1);
    int _2175 = abs(_2103);
    int _2177 = _2167 * as_type<int>(_2053);
    int _2179 = _2177 + _2169;
    float _2181 = float(uint(_2103));
    bool _2183 = !_2159;
    int _2185 = _2183 ? 0 : 1;
    int _2187 = abs(_2173);
    float _2189 = 1.0 / _2181;
    int _2191 = ~_2161;
    int _2193 = _2191 + 1;
    int _2195 = _2193 + 1;
    int _2197 = ~_2187;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    int _2203 = _2195 * as_type<int>(_2071);
    int _2205 = _2203 + _2179;
    bool _2207 = !_1853;
    int _2209 = _2207 ? _2135 : (-1);
    float _2211 = in.m_49.w;
    int _2213 = abs(_2185);
    int _2215 = _2201 * as_type<int>(_2079);
    int _2217 = _2215 + _2205;
    float _2219 = float(uint(_2175));
    int _2221 = ~_2213;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = 1.0 / _2219;
    int _2229 = _2217 * _2225;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2235 = as_type<int>(_2189) + (-2);
    int _2237 = _2209 * _2213;
    int _2239 = _2237 + _2229;
    float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2243 = _2241 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2245 = 1.0 / _2233;
    bool _2247 = _511 > 0.5;
    float _2249 = float(uint(_2239));
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2251;
    int _2255 = ~_2103;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2261 = _2259 != 0;
    float _2263 = 1.0 / _2243;
    int _2265 = abs(_2239);
    float _2267 = as_type<float>(_2235) * _2249;
    int _2269 = as_type<int>(_2227) + (-2);
    float _2271 = float(uint(_2265));
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2275 = _2273 != 0;
    float _2277 = trunc(_2267);
    float _2279 = precise::max(_2277, 0.0);
    uint _2281 = uint(_2279);
    float _2283 = _2253 * _2245;
    float _2285 = as_type<float>(_2269) * _2271;
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2293 = _2291 != 0;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2297 = _503 + _2295;
    float _2299 = trunc(_2285);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _2289 * _2263;
    float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2309 = _2307 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2311 = ~_2175;
    int _2313 = _2311 + 1;
    float _2315 = -_271;
    int _2317 = _1750 ? as_type<int>(_2315) : as_type<int>(_271);
    int _2319 = _2257 * int(_2281);
    int _2321 = _2319 + _2239;
    bool _2323 = _2211 > 0.5;
    float _2325 = fma(_2283, _2297, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2327 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2329 = isnan(_503);
    bool _2331 = _2327 || _2329;
    bool _2333 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2335 = _2331 || _2333;
    float _2337 = float(_2335);
    float _2339 = 1.0 / _2309;
    float _2341 = float(uint(_2321));
    bool _2343 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2345 = isnan(_503);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2351 = _2347 || _2349;
    float _2353 = float(_2351);
    int _2355 = _2313 * int(_2303);
    int _2357 = _2355 + _2265;
    float _2359 = -_2337;
    float _2361 = _2359 + 1.0;
    float _2363 = as_type<float>(_2235) * _2341;
    bool _2365 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2367 = isnan(_503);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2379 = float(uint(_2357));
    float _2381 = _2353 * _2361;
    float _2383 = -_2353;
    float _2385 = _2383 + 1.0;
    float _2387 = -_2375;
    float _2389 = _2387 + 1.0;
    bool _2391 = !_1883;
    float _2393 = _2391 ? _271 : as_type<float>(_2317);
    float _2395 = as_type<float>(_2269) * _2379;
    bool _2397 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2399 = isnan(_503);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = _2375 * _2385;
    float _2411 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2411;
    float _2415 = trunc(_2363);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _2407 * _2389;
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2425 = _503 + _2423;
    float _2427 = -_2407;
    float _2429 = _2427 + 1.0;
    float _2431 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2433 = trunc(_2395);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _2413 * _2339;
    bool _2441 = !_2275;
    float _2443 = _2441 ? _271 : as_type<float>(_1770);
    float _2445 = _2325 * _2421;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2449 = _503 + _2447;
    float _2451 = -_193;
    int _2453 = _2247 ? as_type<int>(_2451) : as_type<int>(_193);
    float _2455 = -_193;
    int _2457 = _2323 ? as_type<int>(_2455) : as_type<int>(_193);
    float _2459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2461 = fma(_2305, _2449, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2463 = fma(_2439, _2425, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2465 = int(_2281) + int(_2419);
    float _2467 = fma(_2429, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2445);
    int _2469 = ~_2103;
    int _2471 = _2469 + 1;
    float _2473 = _2443 + 0.5;
    int _2475 = ~_2175;
    int _2477 = _2475 + 1;
    float _2479 = fma(_2461, _2409, _2467);
    int _2481 = int(_2303) + int(_2437);
    float _2483 = fma(_2431, _2473, _823);
    bool _2485 = !_2261;
    float _2487 = _2485 ? _193 : as_type<float>(_2453);
    float _2489 = fma(_2463, _2381, _2479);
    bool _2491 = !_2293;
    float _2493 = _2491 ? _193 : as_type<float>(_2457);
    int _2495 = _2477 * _2481;
    int _2497 = _2495 + _2265;
    float _2499 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2501 = _2471 * _2465;
    int _2503 = _2501 + _2239;
    float _2505 = _2493 + (-0.5);
    bool _2507 = uint(_2497) >= uint(_2175);
    float _2509 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2489);
    int _2511 = _2239 ^ _2103;
    float _2513 = -_2499;
    float _2515 = -_837;
    float _2517 = fma(_2513, _2505, _2515);
    bool _2519 = uint(_2503) >= uint(_2103);
    float _2521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2523 = !_2507;
    int _2525 = _2523 ? 0 : (-1);
    float _2527 = fma(_2493, _1762, _2517);
    bool _2529 = !_2519;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = _2509 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2535 = uint(int(uint(_2511) >> uint(31)));
    int _2537 = ~_2465;
    int _2539 = _2537 + _2531;
    int _2541 = _2539 + 1;
    int _2543 = ~_2525;
    int _2545 = _2481 + _2543;
    int _2547 = _2545 + 1;
    out.m_68.w = _2533;
    int _2549 = ~int(_2535);
    int _2551 = _2549 + 1;
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2555 = _2103 * _2541;
    int _2557 = _2555 + _2239;
    bool _2559 = _2103 == 0;
    float _2561 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2563 = _2547 ^ _2551;
    float _2565 = _1385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2103 == 0;
    float _2569 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    int _2571 = ~_2551;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    float _2577 = _283 * _2565;
    bool _2579 = !_2559;
    int _2581 = _2579 ? _2557 : (-1);
    float _2583 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    bool _2585 = !_2567;
    int _2587 = _2585 ? _2575 : (-1);
    float _2589 = _2577 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2591 = float(_2581);
    float _2593 = _2521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2595 = float(_2587);
    float _2597 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2599 = -_1748;
    float _2601 = fma(_2443, _2599, _2483);
    float _2603 = fma(_2593, _2591, _539);
    float _2605 = _2393 + 0.5;
    float _2607 = -_801;
    float _2609 = fma(_2597, _2595, _2607);
    float _2611 = _2487 + (-0.5);
    bool _2613 = _1385 > 0.0;
    bool _2615 = isnan(_1385);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(0.0);
    bool _2621 = _2617 || _2619;
    float _2623 = fma(_2593, _2605, _2603);
    float _2625 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2583);
    float _2627 = -_2597;
    float _2629 = fma(_2627, _2611, _2609);
    float _2631 = -_1766;
    float _2633 = fma(_2393, _2631, _2623);
    float _2635 = _2625 + _1647;
    float _2637 = fma(_2487, _1758, _2629);
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1679;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _1647;
    float _2639 = _2635 * 0.5;
    float _2641 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _2633;
    out.m_70.y = _2637;
    out.m_70.z = _2601;
    out.m_70.w = _2527;
    float _2643 = _2641 * _1703;
    float _2645 = -_2641;
    float _2647 = _2645 + 1.0;
    out.m_72.z = _2639;
    out.m_72.w = _1647;
    float _2649 = _1714 * _2643;
    float _2651 = _1724 * _2643;
    float _2653 = _1714 * _2647;
    float _2655 = fma(_1720, _2649, _1708);
    float _2657 = fma(_1722, _2649, _1710);
    float _2659 = fma(_1714, _2651, _1712);
    out.m_45.x = _2589;
    out.m_74.x = _2655;
    out.m_74.y = _2657;
    out.m_74.z = _2659;
    out.m_74.w = _2653;
    if (_2621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2661;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

