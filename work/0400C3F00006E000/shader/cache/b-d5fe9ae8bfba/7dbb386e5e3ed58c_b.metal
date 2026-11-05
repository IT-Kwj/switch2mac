#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_33 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_30.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    float _71 = as_type<float>(_63);
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _69;
    if (!_67)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _608 = as_type<float>(_79);
        out.gl_Position.z = _608;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_35.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = _97;
    if (_93)
    {
        float _101 = float(_63);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _99;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _677 = as_type<float>(_115);
        out.gl_Position.z = _677;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = in.m_40.x;
    float _121 = in.m_40.y;
    float _123 = in.m_30.x;
    float _125 = in.m_30.y;
    float _127 = in.m_30.z;
    int _129 = as_type<int>(_117) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_117) & 2;
    bool _135 = _133 != 0;
    float _137 = _119 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _139 = _121 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _147 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _149 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    bool _153 = !_131;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _145);
    float _159 = _137 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _161 = _147 * _151;
    float _163 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _167 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _149);
    float _169 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _171 = _161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _173 = _159 * _165;
    float _175 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _179 = _169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _181 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _183 = _161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _171);
    float _187 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _189 = _177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _191 = _179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _183);
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = _187 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _191);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _193);
    float _203 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _205 = _179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _207 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[11].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _211 = _197 + _203;
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _217 = _189 + _209;
    float _219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _221 = _211 + _219;
    float _223 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[10].z, _213);
    float _225 = 1.0 / _215;
    float _227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _229 = _217 + _227;
    float _231 = _221 * _221;
    float _233 = _223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _235 = _161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _239 = isnan(0.5);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _245 = _241 || _243;
    float _247 = fma(_229, _229, _231);
    float _249 = _233 + _215;
    float _251 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _235);
    float _253 = sqrt(_247);
    float _255 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _251);
    float _257 = _249 * _225;
    float _259 = _257 * 0.5;
    float _261 = _255 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _265 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _263);
    float _267 = _179 + _261;
    bool _269 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _271 = 1.0 / _265;
    float _273 = _261;
    float _275 = _267;
    float _277 = _217;
    if (!_269)
    {
        _273 = _211;
    }
    float _279 = _273;
    bool _281 = !_269;
    float _283 = _279;
    if (!_281)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _289 = _253 + _287;
        float _291 = rsqrt(_247);
        float _293 = _289 * _285;
        float _295 = _293 * 0.15915493667125701904296875;
        float _297 = _267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _299 = _295 * 6.283185482025146484375;
        float _301 = cos(_299);
        float _303 = _295 * 6.283185482025146484375;
        float _305 = sin(_303);
        float _307 = _301 + (-1.0);
        float _309 = _307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _311 = fma(_305, _297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _313 = fma(_267, _301, _309);
        float _315 = _291 * _311;
        float _317 = fma(_229, _315, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _319 = fma(_221, _315, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _275 = _313;
        _277 = _317;
        _283 = _319;
    }
    float _321 = _275;
    float _323 = _277;
    float _325 = _283;
    float _327 = _321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _329 = _321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _331 = _321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _329);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _331);
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _333);
    float _343 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _335);
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _337);
    float _347 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _339);
    float _349 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _341);
    float _351 = _341;
    float _353 = _325;
    if (_245)
    {
        _351 = 1.0;
    }
    float _355 = _351;
    float _357 = _343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _359 = _355;
    if (_245)
    {
        _353 = 1.0;
    }
    float _361 = _353;
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _365 = _271 * _363;
    float _367 = _361;
    if (!_245)
    {
        float _369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _371 = _369 * 0.15915493667125701904296875;
        float _373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _375 = _371 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 0.15915493667125701904296875;
        float _381 = _371 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = 1.0 / _377;
        float _387 = _379 * 6.283185482025146484375;
        float _389 = cos(_387);
        float _391 = _383 * _385;
        float _393 = _379 * 6.283185482025146484375;
        float _395 = sin(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _399 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _397;
        float _401 = _389 * _391;
        float _403 = 1.0 / _399;
        float _405 = 1.0 / _401;
        float _407 = _395 * _405;
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _411 = fma(_365, _407, _409);
        float _413 = _411 * _403;
        float _415 = precise::clamp(_413, 0.0, 1.0);
        _359 = _415;
    }
    float _417 = _359;
    if (!_245)
    {
        float _419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _421 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _423 = _419 * 0.15915493667125701904296875;
        float _425 = _421 * 0.15915493667125701904296875;
        float _427 = _423 * 6.283185482025146484375;
        float _429 = cos(_427);
        float _431 = _423 * 6.283185482025146484375;
        float _433 = sin(_431);
        float _435 = 1.0 / _429;
        float _437 = _425 * 6.283185482025146484375;
        float _439 = cos(_437);
        float _441 = _433 * _435;
        float _443 = _425 * 6.283185482025146484375;
        float _445 = sin(_443);
        float _447 = _439 * _441;
        float _449 = 1.0 / _447;
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _451;
        float _455 = 1.0 / _453;
        float _457 = _445 * _449;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _461 = fma(_365, _457, _459);
        float _463 = _461 * _455;
        float _465 = precise::clamp(_463, 0.0, 1.0);
        float _467 = -_465;
        float _469 = _467 + 1.0;
        _367 = _469;
    }
    float _471 = _367;
    float _473 = _345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _475 = _357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _477 = _357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _479 = _347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _481 = _357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _475);
    bool _485 = _417 > 0.0;
    bool _487 = isnan(_417);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _497 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _477);
    float _499 = _349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[4].z, _483);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _505 = _417 * _471;
    bool _507 = _471 <= 0.0;
    bool _509 = !_493;
    bool _511 = _507 || _509;
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _495);
    float _515 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[5].z, _497);
    float _517 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _501);
    float _519 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[6].z, _503);
    float _521 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[7].z, _513);
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _515);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _519);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _539 = _525 + _529;
    float _541 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _549 = _539 * 0.5;
    out.m_42.x = _541;
    out.m_42.y = _535;
    out.m_42.z = _543;
    out.m_42.w = _545;
    out.m_33.x = _547;
    out.gl_Position.x = _517;
    out.gl_Position.y = _523;
    out.gl_Position.z = _525;
    out.gl_Position.w = _529;
    out.m_44.z = _549;
    out.m_44.w = _529;
    if (!_511)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _551;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_30.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    float _71 = as_type<float>(_63);
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _69;
    if (!_67)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _608 = as_type<float>(_79);
        out.gl_Position.z = _608;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_35.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = _97;
    if (_93)
    {
        float _101 = float(_63);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _99;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _677 = as_type<float>(_115);
        out.gl_Position.z = _677;
    }
    if (_109)
    {
        return out;
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = in.m_40.x;
    float _121 = in.m_40.y;
    float _123 = in.m_30.x;
    float _125 = in.m_30.y;
    float _127 = in.m_30.z;
    int _129 = as_type<int>(_117) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_117) & 2;
    bool _135 = _133 != 0;
    float _137 = _119 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _139 = _121 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _147 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _149 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    bool _153 = !_131;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _145);
    float _159 = _137 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _161 = _147 * _151;
    float _163 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _167 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _149);
    float _169 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _171 = _161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _173 = _159 * _165;
    float _175 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _179 = _169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _181 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _183 = _161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _171);
    float _187 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _189 = _177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _191 = _179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _183);
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = _187 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _191);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _193);
    float _203 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _205 = _179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _207 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[11].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _211 = _197 + _203;
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _217 = _189 + _209;
    float _219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _221 = _211 + _219;
    float _223 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[10].z, _213);
    float _225 = 1.0 / _215;
    float _227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _229 = _217 + _227;
    float _231 = _221 * _221;
    float _233 = _223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _235 = _161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _239 = isnan(0.5);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _245 = _241 || _243;
    float _247 = fma(_229, _229, _231);
    float _249 = _233 + _215;
    float _251 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _235);
    float _253 = sqrt(_247);
    float _255 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _251);
    float _257 = _249 * _225;
    float _259 = _257 * 0.5;
    float _261 = _255 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _265 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _263);
    float _267 = _179 + _261;
    bool _269 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _271 = 1.0 / _265;
    float _273 = _261;
    float _275 = _267;
    float _277 = _217;
    if (!_269)
    {
        _273 = _211;
    }
    float _279 = _273;
    bool _281 = !_269;
    float _283 = _279;
    if (!_281)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _289 = _253 + _287;
        float _291 = rsqrt(_247);
        float _293 = _289 * _285;
        float _295 = _293 * 0.15915493667125701904296875;
        float _297 = _267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _299 = _295 * 6.283185482025146484375;
        float _301 = cos(_299);
        float _303 = _295 * 6.283185482025146484375;
        float _305 = sin(_303);
        float _307 = _301 + (-1.0);
        float _309 = _307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _311 = fma(_305, _297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _313 = fma(_267, _301, _309);
        float _315 = _291 * _311;
        float _317 = fma(_229, _315, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _319 = fma(_221, _315, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _275 = _313;
        _277 = _317;
        _283 = _319;
    }
    float _321 = _275;
    float _323 = _277;
    float _325 = _283;
    float _327 = _321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _329 = _321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _331 = _321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _329);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _331);
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _333);
    float _343 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _335);
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _337);
    float _347 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _339);
    float _349 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _341);
    float _351 = _341;
    float _353 = _325;
    if (_245)
    {
        _351 = 1.0;
    }
    float _355 = _351;
    float _357 = _343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _359 = _355;
    if (_245)
    {
        _353 = 1.0;
    }
    float _361 = _353;
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _365 = _271 * _363;
    float _367 = _361;
    if (!_245)
    {
        float _369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _371 = _369 * 0.15915493667125701904296875;
        float _373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _375 = _371 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 0.15915493667125701904296875;
        float _381 = _371 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = 1.0 / _377;
        float _387 = _379 * 6.283185482025146484375;
        float _389 = cos(_387);
        float _391 = _383 * _385;
        float _393 = _379 * 6.283185482025146484375;
        float _395 = sin(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _399 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _397;
        float _401 = _389 * _391;
        float _403 = 1.0 / _399;
        float _405 = 1.0 / _401;
        float _407 = _395 * _405;
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _411 = fma(_365, _407, _409);
        float _413 = _411 * _403;
        float _415 = precise::clamp(_413, 0.0, 1.0);
        _359 = _415;
    }
    float _417 = _359;
    if (!_245)
    {
        float _419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _421 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _423 = _419 * 0.15915493667125701904296875;
        float _425 = _421 * 0.15915493667125701904296875;
        float _427 = _423 * 6.283185482025146484375;
        float _429 = cos(_427);
        float _431 = _423 * 6.283185482025146484375;
        float _433 = sin(_431);
        float _435 = 1.0 / _429;
        float _437 = _425 * 6.283185482025146484375;
        float _439 = cos(_437);
        float _441 = _433 * _435;
        float _443 = _425 * 6.283185482025146484375;
        float _445 = sin(_443);
        float _447 = _439 * _441;
        float _449 = 1.0 / _447;
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _451;
        float _455 = 1.0 / _453;
        float _457 = _445 * _449;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _461 = fma(_365, _457, _459);
        float _463 = _461 * _455;
        float _465 = precise::clamp(_463, 0.0, 1.0);
        float _467 = -_465;
        float _469 = _467 + 1.0;
        _367 = _469;
    }
    float _471 = _367;
    float _473 = _345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _475 = _357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _477 = _357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _479 = _347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _481 = _357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _475);
    bool _485 = _417 > 0.0;
    bool _487 = isnan(_417);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _497 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _477);
    float _499 = _349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[4].z, _483);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _505 = _417 * _471;
    bool _507 = _471 <= 0.0;
    bool _509 = !_493;
    bool _511 = _507 || _509;
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _495);
    float _515 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[5].z, _497);
    float _517 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _501);
    float _519 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[6].z, _503);
    float _521 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[7].z, _513);
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _515);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _519);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _539 = _525 + _529;
    float _541 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _549 = _539 * 0.5;
    out.m_42.x = _541;
    out.m_42.y = _535;
    out.m_42.z = _543;
    out.m_42.w = _545;
    out.m_33.x = _547;
    out.gl_Position.x = _517;
    out.gl_Position.y = _523;
    out.gl_Position.z = _525;
    out.gl_Position.w = _529;
    out.m_44.z = _549;
    out.m_44.w = _529;
    if (!_511)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _551;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_30.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    float _71 = as_type<float>(_63);
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _73 = _69;
    if (!_67)
    {
        out.m_33.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _73 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _608 = as_type<float>(_79);
        out.gl_Position.z = _608;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_35.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = _97;
    if (_93)
    {
        float _101 = float(_63);
        _71 = _101;
    }
    float _103 = _71;
    bool _105 = _97 >= _103;
    bool _107 = !_93;
    bool _109 = _105 || _107;
    if (_109)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _99;
    if (_109)
    {
        out.m_33.x = 0.0;
    }
    if (_109)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _677 = as_type<float>(_115);
        out.gl_Position.z = _677;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = as_type<float>(int(gl_VertexIndex));
    float _119 = in.m_40.x;
    float _121 = in.m_40.y;
    float _123 = in.m_30.x;
    float _125 = in.m_30.y;
    float _127 = in.m_30.z;
    int _129 = as_type<int>(_117) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_117) & 2;
    bool _135 = _133 != 0;
    float _137 = _119 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _139 = _121 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    float _145 = _125 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _147 = _139 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _149 = _125 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    bool _153 = !_131;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[5].x, _145);
    float _159 = _137 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _161 = _147 * _151;
    float _163 = _125 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _155);
    float _167 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[4].x, _149);
    float _169 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _171 = _161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _173 = _159 * _165;
    float _175 = fma(_123, (*spvDescriptorSet0.vp_c10)._m0[6].x, _163);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _179 = _169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _181 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _183 = _161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[26].x, _171);
    float _187 = fma(_127, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _189 = _177 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _191 = _179 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _193 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[24].x, _183);
    float _195 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[26].z, _185);
    float _197 = _187 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[11].x, _191);
    float _201 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[24].z, _193);
    float _203 = _195 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _205 = _179 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _207 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[11].z, _199);
    float _209 = _201 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _211 = _197 + _203;
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c8)._m0[10].x, _205);
    float _215 = _207 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _217 = _189 + _209;
    float _219 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _221 = _211 + _219;
    float _223 = fma(_197, (*spvDescriptorSet0.vp_c8)._m0[10].z, _213);
    float _225 = 1.0 / _215;
    float _227 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _229 = _217 + _227;
    float _231 = _221 * _221;
    float _233 = _223 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _235 = _161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _237 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _239 = isnan(0.5);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _245 = _241 || _243;
    float _247 = fma(_229, _229, _231);
    float _249 = _233 + _215;
    float _251 = fma(_173, (*spvDescriptorSet0.vp_c8)._m0[25].x, _235);
    float _253 = sqrt(_247);
    float _255 = fma(_181, (*spvDescriptorSet0.vp_c8)._m0[25].z, _251);
    float _257 = _249 * _225;
    float _259 = _257 * 0.5;
    float _261 = _255 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _265 = fma(_259, (*spvDescriptorSet0.vp_c8)._m0[30].w, _263);
    float _267 = _179 + _261;
    bool _269 = _253 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _271 = 1.0 / _265;
    float _273 = _261;
    float _275 = _267;
    float _277 = _217;
    if (!_269)
    {
        _273 = _211;
    }
    float _279 = _273;
    bool _281 = !_269;
    float _283 = _279;
    if (!_281)
    {
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _287 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _289 = _253 + _287;
        float _291 = rsqrt(_247);
        float _293 = _289 * _285;
        float _295 = _293 * 0.15915493667125701904296875;
        float _297 = _267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _299 = _295 * 6.283185482025146484375;
        float _301 = cos(_299);
        float _303 = _295 * 6.283185482025146484375;
        float _305 = sin(_303);
        float _307 = _301 + (-1.0);
        float _309 = _307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _311 = fma(_305, _297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _313 = fma(_267, _301, _309);
        float _315 = _291 * _311;
        float _317 = fma(_229, _315, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _319 = fma(_221, _315, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _275 = _313;
        _277 = _317;
        _283 = _319;
    }
    float _321 = _275;
    float _323 = _277;
    float _325 = _283;
    float _327 = _321 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _329 = _321 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _331 = _321 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _333 = _321 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _335 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[1].x, _327);
    float _337 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[0].x, _329);
    float _339 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[2].x, _331);
    float _341 = fma(_323, (*spvDescriptorSet0.vp_c8)._m0[3].x, _333);
    float _343 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[1].z, _335);
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[0].z, _337);
    float _347 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[2].z, _339);
    float _349 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[3].z, _341);
    float _351 = _341;
    float _353 = _325;
    if (_245)
    {
        _351 = 1.0;
    }
    float _355 = _351;
    float _357 = _343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _359 = _355;
    if (_245)
    {
        _353 = 1.0;
    }
    float _361 = _353;
    float _363 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _365 = _271 * _363;
    float _367 = _361;
    if (!_245)
    {
        float _369 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _371 = _369 * 0.15915493667125701904296875;
        float _373 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _375 = _371 * 6.283185482025146484375;
        float _377 = cos(_375);
        float _379 = _373 * 0.15915493667125701904296875;
        float _381 = _371 * 6.283185482025146484375;
        float _383 = sin(_381);
        float _385 = 1.0 / _377;
        float _387 = _379 * 6.283185482025146484375;
        float _389 = cos(_387);
        float _391 = _383 * _385;
        float _393 = _379 * 6.283185482025146484375;
        float _395 = sin(_393);
        float _397 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _399 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _397;
        float _401 = _389 * _391;
        float _403 = 1.0 / _399;
        float _405 = 1.0 / _401;
        float _407 = _395 * _405;
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _411 = fma(_365, _407, _409);
        float _413 = _411 * _403;
        float _415 = precise::clamp(_413, 0.0, 1.0);
        _359 = _415;
    }
    float _417 = _359;
    if (!_245)
    {
        float _419 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _421 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _423 = _419 * 0.15915493667125701904296875;
        float _425 = _421 * 0.15915493667125701904296875;
        float _427 = _423 * 6.283185482025146484375;
        float _429 = cos(_427);
        float _431 = _423 * 6.283185482025146484375;
        float _433 = sin(_431);
        float _435 = 1.0 / _429;
        float _437 = _425 * 6.283185482025146484375;
        float _439 = cos(_437);
        float _441 = _433 * _435;
        float _443 = _425 * 6.283185482025146484375;
        float _445 = sin(_443);
        float _447 = _439 * _441;
        float _449 = 1.0 / _447;
        float _451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _453 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _451;
        float _455 = 1.0 / _453;
        float _457 = _445 * _449;
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _461 = fma(_365, _457, _459);
        float _463 = _461 * _455;
        float _465 = precise::clamp(_463, 0.0, 1.0);
        float _467 = -_465;
        float _469 = _467 + 1.0;
        _367 = _469;
    }
    float _471 = _367;
    float _473 = _345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _475 = _357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _477 = _357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _479 = _347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _481 = _357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _483 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[4].x, _475);
    bool _485 = _417 > 0.0;
    bool _487 = isnan(_417);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    float _495 = _357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _497 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[5].x, _477);
    float _499 = _349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _501 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[4].z, _483);
    float _503 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[6].x, _481);
    float _505 = _417 * _471;
    bool _507 = _471 <= 0.0;
    bool _509 = !_493;
    bool _511 = _507 || _509;
    float _513 = fma(_473, (*spvDescriptorSet0.vp_c8)._m0[7].x, _495);
    float _515 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[5].z, _497);
    float _517 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _501);
    float _519 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[6].z, _503);
    float _521 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[7].z, _513);
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _515);
    float _525 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _519);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _529 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _539 = _525 + _529;
    float _541 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _547 = _537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _549 = _539 * 0.5;
    out.m_42.x = _541;
    out.m_42.y = _535;
    out.m_42.z = _543;
    out.m_42.w = _545;
    out.m_33.x = _547;
    out.gl_Position.x = _517;
    out.gl_Position.y = _523;
    out.gl_Position.z = _525;
    out.gl_Position.w = _529;
    out.m_44.z = _549;
    out.m_44.w = _529;
    if (!_511)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _551 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _551;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

