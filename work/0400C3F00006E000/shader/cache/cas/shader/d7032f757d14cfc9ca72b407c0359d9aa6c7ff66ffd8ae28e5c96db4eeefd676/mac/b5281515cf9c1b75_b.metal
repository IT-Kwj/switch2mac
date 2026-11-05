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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    float _73 = as_type<float>(_65);
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _71;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _75 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _566 = as_type<float>(_81);
        out.gl_Position.z = _566;
    }
    if (!_69)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _73 = _101;
    }
    float _103 = _73;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _635 = as_type<float>(_117);
        out.gl_Position.z = _635;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_35.x;
    float _121 = in.m_35.y;
    float _123 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_37.w;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _133 = _131 != 0;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _151 = in.m_37.y;
    float _153 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _155 = in.m_33.x;
    float _157 = in.m_33.y;
    float _159 = in.m_33.z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _163 = in.m_28.x;
    float _165 = in.m_28.y;
    float _167 = in.m_28.z;
    float _169 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _171 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _173 = _119 > 0.5;
    float _175 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _153);
    float _177 = -_149;
    float _179 = fma(_169, 2.0, _177);
    float _181 = _169;
    float _183 = _123;
    if (!_145)
    {
        float _185 = _123 * _123;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = _121 > 0.5;
    float _193 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].w, _161);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _197 = _189;
    if (!_145)
    {
        float _199 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = fma(_171, -2.0, _195);
    bool _205 = !_145;
    float _207 = _201;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _123 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _123);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_145;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _123 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    float _265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _175);
    float _267 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _203);
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = -_99;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[76].x, _179);
    float _279 = fma(_263, _155, _269);
    float _281 = fma(_263, _157, _271);
    float _283 = fma(_263, _159, _273);
    int _285 = as_type<int>(_135) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>(_135) & 2;
    bool _291 = _289 != 0;
    float _293 = fma(_279, _125, _163);
    float _295 = fma(_281, _125, _165);
    float _297 = fma(_283, _125, _167);
    float _299 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _193);
    float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _303 = _147 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _307 = !_287;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _313 = !_291;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = -_309;
    int _321 = _173 ? as_type<int>(_319) : as_type<int>(_309);
    float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _325 = _305 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = -_315;
    int _329 = _191 ? as_type<int>(_327) : as_type<int>(_315);
    float _331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _309);
    float _333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _315);
    bool _335 = !_129;
    float _337 = _335 ? _309 : as_type<float>(_321);
    float _339 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _311);
    bool _341 = !_133;
    float _343 = _341 ? _315 : as_type<float>(_329);
    float _345 = _317 * _331;
    float _347 = _325 * _333;
    float _349 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _355 = _337 + 0.5;
    float _357 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = _343 + (-0.5);
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _363 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _365 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _367 = _347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = fma(_353, _355, _277);
    float _371 = -_361;
    float _373 = -_267;
    float _375 = fma(_371, _359, _373);
    float _377 = _347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _379 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    float _381 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[9].x, _367);
    float _383 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _385 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    float _387 = -_265;
    float _389 = _387 + 1.0;
    float _391 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _393 = _347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _379 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _397 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[9].z, _381);
    float _399 = -_389;
    float _401 = fma(_337, _399, _369);
    float _403 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _391);
    float _407 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _409 = _395 + _397;
    float _411 = -_299;
    float _413 = _411 + 1.0;
    float _415 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _417 = _385 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = _407 + _405;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _423 = fma(_343, _413, _375);
    float _425 = _417 + _415;
    float _427 = _409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _429 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _431 = _409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _433 = _409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _427);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _429);
    float _439 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _431);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _433);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _435);
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _447 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _439);
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _441);
    float _451 = _443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _453 = _445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _459 = _447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _453);
    float _463 = _445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _455);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _457);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _461);
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _471, _401);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _463);
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _465);
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _467);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[19].z;
    float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _481, _423);
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _475);
    float _487 = _449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _477);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _479);
    float _507 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _469);
    float _509 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _485);
    out.m_42.x = _495;
    out.m_42.y = _499;
    out.m_42.z = _501;
    out.m_42.w = _497;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _473;
    out.m_44.y = _483;
    out.m_46.x = _419;
    out.m_46.y = _409;
    out.gl_Position.x = _503;
    out.gl_Position.y = _505;
    out.gl_Position.z = _507;
    out.gl_Position.w = _509;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    float _73 = as_type<float>(_65);
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _71;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _75 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _566 = as_type<float>(_81);
        out.gl_Position.z = _566;
    }
    if (!_69)
    {
        return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _73 = _101;
    }
    float _103 = _73;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _635 = as_type<float>(_117);
        out.gl_Position.z = _635;
    }
    if (_109)
    {
        return out;
    }
    float _119 = in.m_35.x;
    float _121 = in.m_35.y;
    float _123 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_37.w;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _133 = _131 != 0;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _151 = in.m_37.y;
    float _153 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _155 = in.m_33.x;
    float _157 = in.m_33.y;
    float _159 = in.m_33.z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _163 = in.m_28.x;
    float _165 = in.m_28.y;
    float _167 = in.m_28.z;
    float _169 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _171 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _173 = _119 > 0.5;
    float _175 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _153);
    float _177 = -_149;
    float _179 = fma(_169, 2.0, _177);
    float _181 = _169;
    float _183 = _123;
    if (!_145)
    {
        float _185 = _123 * _123;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = _121 > 0.5;
    float _193 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].w, _161);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _197 = _189;
    if (!_145)
    {
        float _199 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = fma(_171, -2.0, _195);
    bool _205 = !_145;
    float _207 = _201;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _123 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _123);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_145;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _123 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    float _265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _175);
    float _267 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _203);
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = -_99;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[76].x, _179);
    float _279 = fma(_263, _155, _269);
    float _281 = fma(_263, _157, _271);
    float _283 = fma(_263, _159, _273);
    int _285 = as_type<int>(_135) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>(_135) & 2;
    bool _291 = _289 != 0;
    float _293 = fma(_279, _125, _163);
    float _295 = fma(_281, _125, _165);
    float _297 = fma(_283, _125, _167);
    float _299 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _193);
    float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _303 = _147 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _307 = !_287;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _313 = !_291;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = -_309;
    int _321 = _173 ? as_type<int>(_319) : as_type<int>(_309);
    float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _325 = _305 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = -_315;
    int _329 = _191 ? as_type<int>(_327) : as_type<int>(_315);
    float _331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _309);
    float _333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _315);
    bool _335 = !_129;
    float _337 = _335 ? _309 : as_type<float>(_321);
    float _339 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _311);
    bool _341 = !_133;
    float _343 = _341 ? _315 : as_type<float>(_329);
    float _345 = _317 * _331;
    float _347 = _325 * _333;
    float _349 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _355 = _337 + 0.5;
    float _357 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = _343 + (-0.5);
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _363 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _365 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _367 = _347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = fma(_353, _355, _277);
    float _371 = -_361;
    float _373 = -_267;
    float _375 = fma(_371, _359, _373);
    float _377 = _347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _379 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    float _381 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[9].x, _367);
    float _383 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _385 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    float _387 = -_265;
    float _389 = _387 + 1.0;
    float _391 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _393 = _347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _379 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _397 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[9].z, _381);
    float _399 = -_389;
    float _401 = fma(_337, _399, _369);
    float _403 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _391);
    float _407 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _409 = _395 + _397;
    float _411 = -_299;
    float _413 = _411 + 1.0;
    float _415 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _417 = _385 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = _407 + _405;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _423 = fma(_343, _413, _375);
    float _425 = _417 + _415;
    float _427 = _409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _429 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _431 = _409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _433 = _409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _427);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _429);
    float _439 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _431);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _433);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _435);
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _447 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _439);
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _441);
    float _451 = _443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _453 = _445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _459 = _447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _453);
    float _463 = _445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _455);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _457);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _461);
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _471, _401);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _463);
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _465);
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _467);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[19].z;
    float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _481, _423);
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _475);
    float _487 = _449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _477);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _479);
    float _507 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _469);
    float _509 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _485);
    out.m_42.x = _495;
    out.m_42.y = _499;
    out.m_42.z = _501;
    out.m_42.w = _497;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _473;
    out.m_44.y = _483;
    out.m_46.x = _419;
    out.m_46.y = _409;
    out.gl_Position.x = _503;
    out.gl_Position.y = _505;
    out.gl_Position.z = _507;
    out.gl_Position.w = _509;
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_28.w;
    float _62 = trunc(_60);
    int _65 = int(_62);
    bool _69 = _65 >= 1;
    float _71 = 0.0;
    float _73 = as_type<float>(_65);
    if (!_69)
    {
        _71 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _71;
    if (!_69)
    {
        out.m_31.x = 0.0;
    }
    int _77 = 0;
    if (!_69)
    {
        float _79 = _75 * 5.0;
        _77 = as_type<int>(_79);
    }
    int _81 = _77;
    int _83 = _81;
    if (!_69)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _566 = as_type<float>(_81);
        out.gl_Position.z = _566;
    }
    if (!_69)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_65);
        _73 = _101;
    }
    float _103 = _73;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    if (_109)
    {
        float _115 = _113 * 5.0;
        _83 = as_type<int>(_115);
    }
    int _117 = _83;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _635 = as_type<float>(_117);
        out.gl_Position.z = _635;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_35.x;
    float _121 = in.m_35.y;
    float _123 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _125 = in.m_37.w;
    int _127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _129 = _127 != 0;
    int _131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _133 = _131 != 0;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _151 = in.m_37.y;
    float _153 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _155 = in.m_33.x;
    float _157 = in.m_33.y;
    float _159 = in.m_33.z;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _163 = in.m_28.x;
    float _165 = in.m_28.y;
    float _167 = in.m_28.z;
    float _169 = _119 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _171 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _173 = _119 > 0.5;
    float _175 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[78].z, _153);
    float _177 = -_149;
    float _179 = fma(_169, 2.0, _177);
    float _181 = _169;
    float _183 = _123;
    if (!_145)
    {
        float _185 = _123 * _123;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = _121 > 0.5;
    float _193 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].w, _161);
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _197 = _189;
    if (!_145)
    {
        float _199 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = fma(_171, -2.0, _195);
    bool _205 = !_145;
    float _207 = _201;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _123 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _123);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_145;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _123 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    float _265 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _175);
    float _267 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _203);
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = -_99;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[76].x, _179);
    float _279 = fma(_263, _155, _269);
    float _281 = fma(_263, _157, _271);
    float _283 = fma(_263, _159, _273);
    int _285 = as_type<int>(_135) & 1;
    bool _287 = _285 != 0;
    int _289 = as_type<int>(_135) & 2;
    bool _291 = _289 != 0;
    float _293 = fma(_279, _125, _163);
    float _295 = fma(_281, _125, _165);
    float _297 = fma(_283, _125, _167);
    float _299 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _193);
    float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _303 = _147 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _305 = _151 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _307 = !_287;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _313 = !_291;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = _303 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = -_309;
    int _321 = _173 ? as_type<int>(_319) : as_type<int>(_309);
    float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _325 = _305 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _327 = -_315;
    int _329 = _191 ? as_type<int>(_327) : as_type<int>(_315);
    float _331 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _309);
    float _333 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _315);
    bool _335 = !_129;
    float _337 = _335 ? _309 : as_type<float>(_321);
    float _339 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _311);
    bool _341 = !_133;
    float _343 = _341 ? _315 : as_type<float>(_329);
    float _345 = _317 * _331;
    float _347 = _325 * _333;
    float _349 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _351 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _355 = _337 + 0.5;
    float _357 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _349);
    float _359 = _343 + (-0.5);
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _363 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _351);
    float _365 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _367 = _347 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _369 = fma(_353, _355, _277);
    float _371 = -_361;
    float _373 = -_267;
    float _375 = fma(_371, _359, _373);
    float _377 = _347 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _379 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _363);
    float _381 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[9].x, _367);
    float _383 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _357);
    float _385 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _339);
    float _387 = -_265;
    float _389 = _387 + 1.0;
    float _391 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _393 = _347 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _395 = _379 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _397 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[9].z, _381);
    float _399 = -_389;
    float _401 = fma(_337, _399, _369);
    float _403 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[10].x, _393);
    float _405 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[8].z, _391);
    float _407 = _383 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _409 = _395 + _397;
    float _411 = -_299;
    float _413 = _411 + 1.0;
    float _415 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[10].z, _403);
    float _417 = _385 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = _407 + _405;
    float _421 = _409 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _423 = fma(_343, _413, _375);
    float _425 = _417 + _415;
    float _427 = _409 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _429 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _431 = _409 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _433 = _409 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _435 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[0].x, _427);
    float _437 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[1].z, _429);
    float _439 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[2].x, _431);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c8)._m0[3].x, _433);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[0].z, _435);
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _447 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[2].z, _439);
    float _449 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[3].z, _441);
    float _451 = _443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _453 = _445 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _455 = _445 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _459 = _447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _461 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _453);
    float _463 = _445 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _465 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _455);
    float _467 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _457);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _461);
    float _471 = -(*spvDescriptorSet0.vp_c15)._m0[19].y;
    float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _471, _401);
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _463);
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _465);
    float _479 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _467);
    float _481 = -(*spvDescriptorSet0.vp_c15)._m0[19].z;
    float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _481, _423);
    float _485 = fma(_459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _475);
    float _487 = _449 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _499 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[4].w, _477);
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[5].w, _479);
    float _507 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[6].w, _469);
    float _509 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[7].w, _485);
    out.m_42.x = _495;
    out.m_42.y = _499;
    out.m_42.z = _501;
    out.m_42.w = _497;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _473;
    out.m_44.y = _483;
    out.m_46.x = _419;
    out.m_46.y = _409;
    out.gl_Position.x = _503;
    out.gl_Position.y = _505;
    out.gl_Position.z = _507;
    out.gl_Position.w = _509;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

