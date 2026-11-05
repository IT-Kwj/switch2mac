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
    float4 m_37 [[attribute(5)]];
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
        float _548 = as_type<float>(_79);
        out.gl_Position.z = _548;
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
    if (_93)
    {
        float _99 = float(_63);
        _71 = _99;
    }
    float _101 = _71;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_33.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _617 = as_type<float>(_115);
        out.gl_Position.z = _617;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_37.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = _151;
    if (!_129)
    {
        float _161 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_129;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _119 * _171;
        float _181 = exp2(_179);
        float _183 = _177 * 0.693147182464599609375;
        float _185 = 1.0 / _183;
        float _187 = 1.0 / _175;
        float _189 = _181 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _185, _119);
        float _195 = _193 * _187;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_129;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _119 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _145 = _221;
    }
    float _223 = _145;
    float _225 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _227 = as_type<int>(_131) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_131) & 2;
    bool _233 = _231 != 0;
    float _235 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_223, _139, _225);
    float _241 = fma(_223, _137, _235);
    float _243 = fma(_223, _141, _237);
    bool _245 = !_233;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = _135 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _251 = !_229;
    float _253 = _251 ? (-0.5) : 0.5;
    float _255 = _133 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = fma(_239, _117, _155);
    float _259 = _249 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _247);
    float _263 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _253);
    float _267 = fma(_243, _117, _157);
    float _269 = _259 * _261;
    float _271 = fma(_241, _117, _153);
    float _273 = _263 * _265;
    float _275 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _279 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _281 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _277);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _283);
    float _293 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _287);
    float _297 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _289);
    float _299 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _291);
    float _301 = _293 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _303 = _295 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _305 = _297 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _307 = _299 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _309 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _311 = _301 + _303;
    float _313 = _305 + _307;
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    float _317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _323 = _313 + _321;
    float _325 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _327 = _319 * _319;
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _331 = fma(_323, _323, _327);
    float _333 = _269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _335 = sqrt(_331);
    float _337 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _333);
    float _339 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _337);
    float _341 = _339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _343 = _329 + _341;
    bool _345 = _335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _347 = _273;
    float _349 = _341;
    float _351 = _339;
    if (!_345)
    {
        _347 = _313;
    }
    float _353 = _347;
    float _355 = _353;
    if (!_345)
    {
        _349 = _311;
    }
    float _357 = _349;
    float _359 = _357;
    if (!_345)
    {
        _351 = _343;
    }
    float _361 = _351;
    bool _363 = !_345;
    float _365 = _361;
    if (!_363)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _371 = _335 + _369;
        float _373 = rsqrt(_331);
        float _375 = _371 * _367;
        float _377 = _343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _379 = _375 * 0.15915493667125701904296875;
        float _381 = _379 * 6.283185482025146484375;
        float _383 = cos(_381);
        float _385 = _379 * 6.283185482025146484375;
        float _387 = sin(_385);
        float _389 = _383 + (-1.0);
        float _391 = _389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _393 = fma(_387, _377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _395 = fma(_343, _383, _391);
        float _397 = _373 * _393;
        float _399 = fma(_323, _397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _401 = fma(_319, _397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _365 = _395;
        _355 = _399;
        _359 = _401;
    }
    float _403 = _365;
    float _405 = _355;
    float _407 = _359;
    float _409 = _403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _413 = _403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _415 = _403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _411);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _413);
    float _423 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _415);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _423);
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _439 = _433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[5].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[6].x, _441);
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[4].x, _443);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[7].x, _445);
    float _455 = _431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[5].z, _447);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[6].z, _449);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[4].z, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[7].z, _453);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _461);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _463);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _467 + _471;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _489 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _491 = _481 * 0.5;
    out.m_42.x = _483;
    out.m_42.y = _479;
    out.m_42.z = _485;
    out.m_42.w = _487;
    out.m_33.x = _489;
    out.gl_Position.x = _469;
    out.gl_Position.y = _465;
    out.gl_Position.z = _467;
    out.gl_Position.w = _471;
    out.m_44.z = _491;
    out.m_44.w = _471;
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
        float _548 = as_type<float>(_79);
        out.gl_Position.z = _548;
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
    if (_93)
    {
        float _99 = float(_63);
        _71 = _99;
    }
    float _101 = _71;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_33.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _617 = as_type<float>(_115);
        out.gl_Position.z = _617;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_37.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = _151;
    if (!_129)
    {
        float _161 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_129;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _119 * _171;
        float _181 = exp2(_179);
        float _183 = _177 * 0.693147182464599609375;
        float _185 = 1.0 / _183;
        float _187 = 1.0 / _175;
        float _189 = _181 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _185, _119);
        float _195 = _193 * _187;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_129;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _119 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _145 = _221;
    }
    float _223 = _145;
    float _225 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _227 = as_type<int>(_131) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_131) & 2;
    bool _233 = _231 != 0;
    float _235 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_223, _139, _225);
    float _241 = fma(_223, _137, _235);
    float _243 = fma(_223, _141, _237);
    bool _245 = !_233;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = _135 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _251 = !_229;
    float _253 = _251 ? (-0.5) : 0.5;
    float _255 = _133 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = fma(_239, _117, _155);
    float _259 = _249 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _247);
    float _263 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _253);
    float _267 = fma(_243, _117, _157);
    float _269 = _259 * _261;
    float _271 = fma(_241, _117, _153);
    float _273 = _263 * _265;
    float _275 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _279 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _281 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _277);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _283);
    float _293 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _287);
    float _297 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _289);
    float _299 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _291);
    float _301 = _293 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _303 = _295 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _305 = _297 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _307 = _299 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _309 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _311 = _301 + _303;
    float _313 = _305 + _307;
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    float _317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _323 = _313 + _321;
    float _325 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _327 = _319 * _319;
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _331 = fma(_323, _323, _327);
    float _333 = _269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _335 = sqrt(_331);
    float _337 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _333);
    float _339 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _337);
    float _341 = _339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _343 = _329 + _341;
    bool _345 = _335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _347 = _273;
    float _349 = _341;
    float _351 = _339;
    if (!_345)
    {
        _347 = _313;
    }
    float _353 = _347;
    float _355 = _353;
    if (!_345)
    {
        _349 = _311;
    }
    float _357 = _349;
    float _359 = _357;
    if (!_345)
    {
        _351 = _343;
    }
    float _361 = _351;
    bool _363 = !_345;
    float _365 = _361;
    if (!_363)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _371 = _335 + _369;
        float _373 = rsqrt(_331);
        float _375 = _371 * _367;
        float _377 = _343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _379 = _375 * 0.15915493667125701904296875;
        float _381 = _379 * 6.283185482025146484375;
        float _383 = cos(_381);
        float _385 = _379 * 6.283185482025146484375;
        float _387 = sin(_385);
        float _389 = _383 + (-1.0);
        float _391 = _389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _393 = fma(_387, _377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _395 = fma(_343, _383, _391);
        float _397 = _373 * _393;
        float _399 = fma(_323, _397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _401 = fma(_319, _397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _365 = _395;
        _355 = _399;
        _359 = _401;
    }
    float _403 = _365;
    float _405 = _355;
    float _407 = _359;
    float _409 = _403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _413 = _403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _415 = _403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _411);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _413);
    float _423 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _415);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _423);
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _439 = _433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[5].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[6].x, _441);
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[4].x, _443);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[7].x, _445);
    float _455 = _431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[5].z, _447);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[6].z, _449);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[4].z, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[7].z, _453);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _461);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _463);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _467 + _471;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _489 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _491 = _481 * 0.5;
    out.m_42.x = _483;
    out.m_42.y = _479;
    out.m_42.z = _485;
    out.m_42.w = _487;
    out.m_33.x = _489;
    out.gl_Position.x = _469;
    out.gl_Position.y = _465;
    out.gl_Position.z = _467;
    out.gl_Position.w = _471;
    out.m_44.z = _491;
    out.m_44.w = _471;
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
        float _548 = as_type<float>(_79);
        out.gl_Position.z = _548;
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
    if (_93)
    {
        float _99 = float(_63);
        _71 = _99;
    }
    float _101 = _71;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_33.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _617 = as_type<float>(_115);
        out.gl_Position.z = _617;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_37.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_35.x;
    float _139 = in.m_35.y;
    float _141 = in.m_35.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = in.m_30.x;
    float _155 = in.m_30.y;
    float _157 = in.m_30.z;
    float _159 = _151;
    if (!_129)
    {
        float _161 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = !_129;
    float _167 = _163;
    if (!_165)
    {
        float _169 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _171 = log2(_169);
        float _173 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _175 = _173 + 1.0;
        float _177 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _179 = _119 * _171;
        float _181 = exp2(_179);
        float _183 = _177 * 0.693147182464599609375;
        float _185 = 1.0 / _183;
        float _187 = 1.0 / _175;
        float _189 = _181 + (-1.0);
        float _191 = -_189;
        float _193 = fma(_191, _185, _119);
        float _195 = _193 * _187;
        float _197 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _197;
    }
    float _199 = _167;
    bool _201 = !_129;
    if (!_201)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = 1.0 / _209;
        float _213 = _119 * _205;
        float _215 = exp2(_213);
        float _217 = -_215;
        float _219 = _217 + 1.0;
        float _221 = _219 * _211;
        _145 = _221;
    }
    float _223 = _145;
    float _225 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _227 = as_type<int>(_131) & 1;
    bool _229 = _227 != 0;
    int _231 = as_type<int>(_131) & 2;
    bool _233 = _231 != 0;
    float _235 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _237 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_223, _139, _225);
    float _241 = fma(_223, _137, _235);
    float _243 = fma(_223, _141, _237);
    bool _245 = !_233;
    float _247 = _245 ? (-0.5) : 0.5;
    float _249 = _135 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _251 = !_229;
    float _253 = _251 ? (-0.5) : 0.5;
    float _255 = _133 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _257 = fma(_239, _117, _155);
    float _259 = _249 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _247);
    float _263 = _255 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _253);
    float _267 = fma(_243, _117, _157);
    float _269 = _259 * _261;
    float _271 = fma(_241, _117, _153);
    float _273 = _263 * _265;
    float _275 = _257 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _279 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _281 = _257 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _283 = _269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _277);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[24].x, _283);
    float _293 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _295 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[26].z, _287);
    float _297 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _289);
    float _299 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[24].z, _291);
    float _301 = _293 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _303 = _295 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _305 = _297 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _307 = _299 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _309 = _257 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _311 = _301 + _303;
    float _313 = _305 + _307;
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].x, _309);
    float _317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _323 = _313 + _321;
    float _325 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _315);
    float _327 = _319 * _319;
    float _329 = _325 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _331 = fma(_323, _323, _327);
    float _333 = _269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _335 = sqrt(_331);
    float _337 = fma(_273, (*spvDescriptorSet0.vp_c8)._m0[25].x, _333);
    float _339 = fma(_279, (*spvDescriptorSet0.vp_c8)._m0[25].z, _337);
    float _341 = _339 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _343 = _329 + _341;
    bool _345 = _335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _347 = _273;
    float _349 = _341;
    float _351 = _339;
    if (!_345)
    {
        _347 = _313;
    }
    float _353 = _347;
    float _355 = _353;
    if (!_345)
    {
        _349 = _311;
    }
    float _357 = _349;
    float _359 = _357;
    if (!_345)
    {
        _351 = _343;
    }
    float _361 = _351;
    bool _363 = !_345;
    float _365 = _361;
    if (!_363)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _369 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _371 = _335 + _369;
        float _373 = rsqrt(_331);
        float _375 = _371 * _367;
        float _377 = _343 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _379 = _375 * 0.15915493667125701904296875;
        float _381 = _379 * 6.283185482025146484375;
        float _383 = cos(_381);
        float _385 = _379 * 6.283185482025146484375;
        float _387 = sin(_385);
        float _389 = _383 + (-1.0);
        float _391 = _389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _393 = fma(_387, _377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _395 = fma(_343, _383, _391);
        float _397 = _373 * _393;
        float _399 = fma(_323, _397, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _401 = fma(_319, _397, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _365 = _395;
        _355 = _399;
        _359 = _401;
    }
    float _403 = _365;
    float _405 = _355;
    float _407 = _359;
    float _409 = _403 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _411 = _403 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _413 = _403 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _415 = _403 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _417 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[1].x, _409);
    float _419 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[0].x, _411);
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[2].x, _413);
    float _423 = fma(_405, (*spvDescriptorSet0.vp_c8)._m0[3].x, _415);
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _417);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _419);
    float _429 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _421);
    float _431 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _423);
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _437 = _429 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _439 = _433 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _441 = _433 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _443 = _433 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _445 = _433 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[5].x, _439);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[6].x, _441);
    float _451 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[4].x, _443);
    float _453 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[7].x, _445);
    float _455 = _431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[5].z, _447);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[6].z, _449);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[4].z, _451);
    float _463 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[7].z, _453);
    float _465 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[5].w, _457);
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[6].w, _459);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[4].w, _461);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[7].w, _463);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _479 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = _467 + _471;
    float _483 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _485 = _477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _489 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _491 = _481 * 0.5;
    out.m_42.x = _483;
    out.m_42.y = _479;
    out.m_42.z = _485;
    out.m_42.w = _487;
    out.m_33.x = _489;
    out.gl_Position.x = _469;
    out.gl_Position.y = _465;
    out.gl_Position.z = _467;
    out.gl_Position.w = _471;
    out.m_44.z = _491;
    out.m_44.w = _471;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

