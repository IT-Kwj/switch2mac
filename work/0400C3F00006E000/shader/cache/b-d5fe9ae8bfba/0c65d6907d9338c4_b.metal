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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    const device _23* vp_s0 [[id(1)]];
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(int(gl_InstanceIndex));
    float _53 = as_type<float>(int(gl_BaseInstance));
    int _56 = as_type<int>(_51) - as_type<int>(_53);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[10]);
    int _62 = _56 << 3;
    int _64 = _62 + 448;
    int _66 = _64 + 4;
    uint _69 = uint(int(uint(_66) >> uint(2)));
    float _71 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_69)]);
    float _73 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[76]);
    float _75 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[77]);
    float _77 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[92]);
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[93]);
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[73]);
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[89]);
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[80]);
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[96]);
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[74]);
    float _91 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[90]);
    float _93 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[1]);
    int _95 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x));
    float _97 = float(uint(_95));
    float _99 = 1.0 / _97;
    int _101 = abs(_56);
    float _103 = float(uint(_101));
    int _105 = as_type<int>(_99) + (-2);
    float _107 = as_type<float>(_105) * _103;
    float _109 = trunc(_107);
    float _111 = precise::max(_109, 0.0);
    uint _113 = uint(_111);
    int _115 = ~int(_113);
    int _117 = _115 + 1;
    int _119 = _117 * _95;
    int _121 = _119 + _101;
    float _123 = float(uint(_121));
    float _125 = as_type<float>(_105) * _123;
    float _127 = trunc(_125);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    int _133 = int(_113) + int(_131);
    int _135 = ~_133;
    int _137 = _135 + 1;
    bool _141 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _143 = -_58;
    float _145 = _143 + (*spvDescriptorSet0.vp_c3)._m0[44].x;
    float _147 = in.m_34.x;
    float _149 = in.m_34.y;
    float _151 = in.m_34.z;
    float _153 = _60 * _145;
    int _155 = _137 * _95;
    int _157 = _155 + _101;
    bool _159 = uint(_157) >= uint(_95);
    bool _161 = !_159;
    int _163 = _161 ? 0 : (-1);
    float _165 = abs(_71);
    bool _167 = _165 >= _153;
    bool _169 = isnan(_165);
    bool _171 = _167 || _169;
    bool _173 = isnan(_153);
    bool _175 = _171 || _173;
    int _177 = _56 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _179 = abs(_71);
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c3)._m0[43].w, _179);
    uint _183 = uint(int(uint(_177) >> uint(31)));
    int _185 = ~_163;
    int _187 = _133 + _185;
    int _189 = _187 + 1;
    int _191 = ~int(_183);
    int _193 = _191 + 1;
    float _195 = precise::min(_181, 1.0);
    int _197 = _189 ^ _193;
    bool _199 = _151 >= 0.0;
    bool _201 = isnan(_151);
    bool _203 = _199 || _201;
    bool _205 = isnan(0.0);
    bool _207 = _203 || _205;
    int _209 = as_type<int>(_151);
    int _211 = as_type<int>(_71);
    if (_175)
    {
        _209 = as_type<int>(_195);
    }
    int _213 = _209;
    int _215 = ~_193;
    int _217 = _215 + _197;
    int _219 = _217 + 1;
    int _221 = _213;
    if (_175)
    {
        float _223 = abs(_71);
        float _225 = _223 + (-0.0);
        _211 = as_type<int>(_225);
    }
    int _227 = _211;
    int _229 = _227;
    if (!_175)
    {
        _229 = 1065353216;
    }
    int _231 = _229;
    if (!_175)
    {
        _221 = 1065353216;
    }
    int _233 = _221;
    bool _235 = !_141;
    int _237 = _235 ? _219 : (-1);
    float _239 = -_73;
    float _241 = _239 + _77;
    bool _243 = !_207;
    float _245 = _243 ? as_type<float>(_233) : as_type<float>(_231);
    int _247 = ~_237;
    int _249 = _247 + 1;
    bool _251 = _149 < 0.0;
    float _253 = float(_251);
    float _255 = fma(_245, _241, _73);
    float _257 = -_75;
    float _259 = _257 + _79;
    int _261 = _249 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    int _263 = _261 + _56;
    float _265 = float(_237);
    float _267 = -_81;
    float _269 = _267 + _83;
    bool _271 = _147 >= 0.0;
    bool _273 = isnan(_147);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.0);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_85;
    float _285 = _283 + _87;
    float _287 = float(_263);
    float _289 = fma(_245, _259, _75);
    float _291 = fma(_245, _269, _81);
    float _293 = _253 + _265;
    float _295 = fma(_245, _285, _85);
    float _297 = _281 + _287;
    float _299 = -_289;
    float _301 = _291 + _299;
    float _303 = _293 * (*spvDescriptorSet0.vp_c3)._m0[40].w;
    float _305 = -_255;
    float _307 = _305 + _295;
    float _309 = _297 * (*spvDescriptorSet0.vp_c3)._m0[40].z;
    float _311 = fma(_303, _301, _289);
    float _313 = -_89;
    float _315 = _313 + _91;
    float _317 = fma(_309, _307, _255);
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[37].y;
    float _321 = _311 * (*spvDescriptorSet0.vp_c3)._m0[35].y;
    float _323 = _311 * (*spvDescriptorSet0.vp_c3)._m0[36].y;
    float _325 = fma(_245, _315, _89);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[37].x, _319);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[35].x, _321);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[36].x, _323);
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[37].z, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[36].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[35].z, _329);
    float _339 = _93 * (-0.9900000095367431640625);
    float _341 = _335 + (*spvDescriptorSet0.vp_c3)._m0[36].w;
    float _343 = _333 + (*spvDescriptorSet0.vp_c3)._m0[37].w;
    float _345 = _337 + (*spvDescriptorSet0.vp_c3)._m0[35].w;
    float _347 = _341 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
    float _349 = _341 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
    float _351 = _341 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c3)._m0[34].y;
    float _355 = precise::max(_343, _339);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[31].x, _347);
    float _359 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[32].x, _349);
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[33].x, _351);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[34].x, _353);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[31].z, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[32].z, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[33].z, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[34].z, _363);
    float _373 = _365 + (*spvDescriptorSet0.vp_c3)._m0[31].w;
    float _375 = _367 + (*spvDescriptorSet0.vp_c3)._m0[32].w;
    float _377 = _369 + (*spvDescriptorSet0.vp_c3)._m0[33].w;
    float _379 = _371 + (*spvDescriptorSet0.vp_c3)._m0[34].w;
    out.m_37.y = _303;
    out.m_37.w = 0.5;
    out.m_37.x = _309;
    out.gl_Position.x = _373;
    out.gl_Position.y = _375;
    out.gl_Position.z = _377;
    out.gl_Position.w = _379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(int(gl_InstanceIndex));
    float _53 = as_type<float>(int(gl_BaseInstance));
    int _56 = as_type<int>(_51) - as_type<int>(_53);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[10]);
    int _62 = _56 << 3;
    int _64 = _62 + 448;
    int _66 = _64 + 4;
    uint _69 = uint(int(uint(_66) >> uint(2)));
    float _71 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_69)]);
    float _73 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[76]);
    float _75 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[77]);
    float _77 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[92]);
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[93]);
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[73]);
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[89]);
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[80]);
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[96]);
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[74]);
    float _91 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[90]);
    float _93 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[1]);
    int _95 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x));
    float _97 = float(uint(_95));
    float _99 = 1.0 / _97;
    int _101 = abs(_56);
    float _103 = float(uint(_101));
    int _105 = as_type<int>(_99) + (-2);
    float _107 = as_type<float>(_105) * _103;
    float _109 = trunc(_107);
    float _111 = precise::max(_109, 0.0);
    uint _113 = uint(_111);
    int _115 = ~int(_113);
    int _117 = _115 + 1;
    int _119 = _117 * _95;
    int _121 = _119 + _101;
    float _123 = float(uint(_121));
    float _125 = as_type<float>(_105) * _123;
    float _127 = trunc(_125);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    int _133 = int(_113) + int(_131);
    int _135 = ~_133;
    int _137 = _135 + 1;
    bool _141 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _143 = -_58;
    float _145 = _143 + (*spvDescriptorSet0.vp_c3)._m0[44].x;
    float _147 = in.m_34.x;
    float _149 = in.m_34.y;
    float _151 = in.m_34.z;
    float _153 = _60 * _145;
    int _155 = _137 * _95;
    int _157 = _155 + _101;
    bool _159 = uint(_157) >= uint(_95);
    bool _161 = !_159;
    int _163 = _161 ? 0 : (-1);
    float _165 = abs(_71);
    bool _167 = _165 >= _153;
    bool _169 = isnan(_165);
    bool _171 = _167 || _169;
    bool _173 = isnan(_153);
    bool _175 = _171 || _173;
    int _177 = _56 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _179 = abs(_71);
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c3)._m0[43].w, _179);
    uint _183 = uint(int(uint(_177) >> uint(31)));
    int _185 = ~_163;
    int _187 = _133 + _185;
    int _189 = _187 + 1;
    int _191 = ~int(_183);
    int _193 = _191 + 1;
    float _195 = precise::min(_181, 1.0);
    int _197 = _189 ^ _193;
    bool _199 = _151 >= 0.0;
    bool _201 = isnan(_151);
    bool _203 = _199 || _201;
    bool _205 = isnan(0.0);
    bool _207 = _203 || _205;
    int _209 = as_type<int>(_151);
    int _211 = as_type<int>(_71);
    if (_175)
    {
        _209 = as_type<int>(_195);
    }
    int _213 = _209;
    int _215 = ~_193;
    int _217 = _215 + _197;
    int _219 = _217 + 1;
    int _221 = _213;
    if (_175)
    {
        float _223 = abs(_71);
        float _225 = _223 + (-0.0);
        _211 = as_type<int>(_225);
    }
    int _227 = _211;
    int _229 = _227;
    if (!_175)
    {
        _229 = 1065353216;
    }
    int _231 = _229;
    if (!_175)
    {
        _221 = 1065353216;
    }
    int _233 = _221;
    bool _235 = !_141;
    int _237 = _235 ? _219 : (-1);
    float _239 = -_73;
    float _241 = _239 + _77;
    bool _243 = !_207;
    float _245 = _243 ? as_type<float>(_233) : as_type<float>(_231);
    int _247 = ~_237;
    int _249 = _247 + 1;
    bool _251 = _149 < 0.0;
    float _253 = float(_251);
    float _255 = fma(_245, _241, _73);
    float _257 = -_75;
    float _259 = _257 + _79;
    int _261 = _249 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    int _263 = _261 + _56;
    float _265 = float(_237);
    float _267 = -_81;
    float _269 = _267 + _83;
    bool _271 = _147 >= 0.0;
    bool _273 = isnan(_147);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.0);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_85;
    float _285 = _283 + _87;
    float _287 = float(_263);
    float _289 = fma(_245, _259, _75);
    float _291 = fma(_245, _269, _81);
    float _293 = _253 + _265;
    float _295 = fma(_245, _285, _85);
    float _297 = _281 + _287;
    float _299 = -_289;
    float _301 = _291 + _299;
    float _303 = _293 * (*spvDescriptorSet0.vp_c3)._m0[40].w;
    float _305 = -_255;
    float _307 = _305 + _295;
    float _309 = _297 * (*spvDescriptorSet0.vp_c3)._m0[40].z;
    float _311 = fma(_303, _301, _289);
    float _313 = -_89;
    float _315 = _313 + _91;
    float _317 = fma(_309, _307, _255);
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[37].y;
    float _321 = _311 * (*spvDescriptorSet0.vp_c3)._m0[35].y;
    float _323 = _311 * (*spvDescriptorSet0.vp_c3)._m0[36].y;
    float _325 = fma(_245, _315, _89);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[37].x, _319);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[35].x, _321);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[36].x, _323);
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[37].z, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[36].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[35].z, _329);
    float _339 = _93 * (-0.9900000095367431640625);
    float _341 = _335 + (*spvDescriptorSet0.vp_c3)._m0[36].w;
    float _343 = _333 + (*spvDescriptorSet0.vp_c3)._m0[37].w;
    float _345 = _337 + (*spvDescriptorSet0.vp_c3)._m0[35].w;
    float _347 = _341 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
    float _349 = _341 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
    float _351 = _341 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c3)._m0[34].y;
    float _355 = precise::max(_343, _339);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[31].x, _347);
    float _359 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[32].x, _349);
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[33].x, _351);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[34].x, _353);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[31].z, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[32].z, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[33].z, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[34].z, _363);
    float _373 = _365 + (*spvDescriptorSet0.vp_c3)._m0[31].w;
    float _375 = _367 + (*spvDescriptorSet0.vp_c3)._m0[32].w;
    float _377 = _369 + (*spvDescriptorSet0.vp_c3)._m0[33].w;
    float _379 = _371 + (*spvDescriptorSet0.vp_c3)._m0[34].w;
    out.m_37.y = _303;
    out.m_37.w = 0.5;
    out.m_37.x = _309;
    out.gl_Position.x = _373;
    out.gl_Position.y = _375;
    out.gl_Position.z = _377;
    out.gl_Position.w = _379;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(int(gl_InstanceIndex));
    float _53 = as_type<float>(int(gl_BaseInstance));
    int _56 = as_type<int>(_51) - as_type<int>(_53);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[10]);
    int _62 = _56 << 3;
    int _64 = _62 + 448;
    int _66 = _64 + 4;
    uint _69 = uint(int(uint(_66) >> uint(2)));
    float _71 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_69)]);
    float _73 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[76]);
    float _75 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[77]);
    float _77 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[92]);
    float _79 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[93]);
    float _81 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[73]);
    float _83 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[89]);
    float _85 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[80]);
    float _87 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[96]);
    float _89 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[74]);
    float _91 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[90]);
    float _93 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[1]);
    int _95 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x));
    float _97 = float(uint(_95));
    float _99 = 1.0 / _97;
    int _101 = abs(_56);
    float _103 = float(uint(_101));
    int _105 = as_type<int>(_99) + (-2);
    float _107 = as_type<float>(_105) * _103;
    float _109 = trunc(_107);
    float _111 = precise::max(_109, 0.0);
    uint _113 = uint(_111);
    int _115 = ~int(_113);
    int _117 = _115 + 1;
    int _119 = _117 * _95;
    int _121 = _119 + _101;
    float _123 = float(uint(_121));
    float _125 = as_type<float>(_105) * _123;
    float _127 = trunc(_125);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    int _133 = int(_113) + int(_131);
    int _135 = ~_133;
    int _137 = _135 + 1;
    bool _141 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _143 = -_58;
    float _145 = _143 + (*spvDescriptorSet0.vp_c3)._m0[44].x;
    float _147 = in.m_34.x;
    float _149 = in.m_34.y;
    float _151 = in.m_34.z;
    float _153 = _60 * _145;
    int _155 = _137 * _95;
    int _157 = _155 + _101;
    bool _159 = uint(_157) >= uint(_95);
    bool _161 = !_159;
    int _163 = _161 ? 0 : (-1);
    float _165 = abs(_71);
    bool _167 = _165 >= _153;
    bool _169 = isnan(_165);
    bool _171 = _167 || _169;
    bool _173 = isnan(_153);
    bool _175 = _171 || _173;
    int _177 = _56 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    float _179 = abs(_71);
    float _181 = fma(_60, (*spvDescriptorSet0.vp_c3)._m0[43].w, _179);
    uint _183 = uint(int(uint(_177) >> uint(31)));
    int _185 = ~_163;
    int _187 = _133 + _185;
    int _189 = _187 + 1;
    int _191 = ~int(_183);
    int _193 = _191 + 1;
    float _195 = precise::min(_181, 1.0);
    int _197 = _189 ^ _193;
    bool _199 = _151 >= 0.0;
    bool _201 = isnan(_151);
    bool _203 = _199 || _201;
    bool _205 = isnan(0.0);
    bool _207 = _203 || _205;
    int _209 = as_type<int>(_151);
    int _211 = as_type<int>(_71);
    if (_175)
    {
        _209 = as_type<int>(_195);
    }
    int _213 = _209;
    int _215 = ~_193;
    int _217 = _215 + _197;
    int _219 = _217 + 1;
    int _221 = _213;
    if (_175)
    {
        float _223 = abs(_71);
        float _225 = _223 + (-0.0);
        _211 = as_type<int>(_225);
    }
    int _227 = _211;
    int _229 = _227;
    if (!_175)
    {
        _229 = 1065353216;
    }
    int _231 = _229;
    if (!_175)
    {
        _221 = 1065353216;
    }
    int _233 = _221;
    bool _235 = !_141;
    int _237 = _235 ? _219 : (-1);
    float _239 = -_73;
    float _241 = _239 + _77;
    bool _243 = !_207;
    float _245 = _243 ? as_type<float>(_233) : as_type<float>(_231);
    int _247 = ~_237;
    int _249 = _247 + 1;
    bool _251 = _149 < 0.0;
    float _253 = float(_251);
    float _255 = fma(_245, _241, _73);
    float _257 = -_75;
    float _259 = _257 + _79;
    int _261 = _249 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[40].x);
    int _263 = _261 + _56;
    float _265 = float(_237);
    float _267 = -_81;
    float _269 = _267 + _83;
    bool _271 = _147 >= 0.0;
    bool _273 = isnan(_147);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.0);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_85;
    float _285 = _283 + _87;
    float _287 = float(_263);
    float _289 = fma(_245, _259, _75);
    float _291 = fma(_245, _269, _81);
    float _293 = _253 + _265;
    float _295 = fma(_245, _285, _85);
    float _297 = _281 + _287;
    float _299 = -_289;
    float _301 = _291 + _299;
    float _303 = _293 * (*spvDescriptorSet0.vp_c3)._m0[40].w;
    float _305 = -_255;
    float _307 = _305 + _295;
    float _309 = _297 * (*spvDescriptorSet0.vp_c3)._m0[40].z;
    float _311 = fma(_303, _301, _289);
    float _313 = -_89;
    float _315 = _313 + _91;
    float _317 = fma(_309, _307, _255);
    float _319 = _311 * (*spvDescriptorSet0.vp_c3)._m0[37].y;
    float _321 = _311 * (*spvDescriptorSet0.vp_c3)._m0[35].y;
    float _323 = _311 * (*spvDescriptorSet0.vp_c3)._m0[36].y;
    float _325 = fma(_245, _315, _89);
    float _327 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[37].x, _319);
    float _329 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[35].x, _321);
    float _331 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[36].x, _323);
    float _333 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[37].z, _327);
    float _335 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[36].z, _331);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[35].z, _329);
    float _339 = _93 * (-0.9900000095367431640625);
    float _341 = _335 + (*spvDescriptorSet0.vp_c3)._m0[36].w;
    float _343 = _333 + (*spvDescriptorSet0.vp_c3)._m0[37].w;
    float _345 = _337 + (*spvDescriptorSet0.vp_c3)._m0[35].w;
    float _347 = _341 * (*spvDescriptorSet0.vp_c3)._m0[31].y;
    float _349 = _341 * (*spvDescriptorSet0.vp_c3)._m0[32].y;
    float _351 = _341 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _353 = _341 * (*spvDescriptorSet0.vp_c3)._m0[34].y;
    float _355 = precise::max(_343, _339);
    float _357 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[31].x, _347);
    float _359 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[32].x, _349);
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[33].x, _351);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c3)._m0[34].x, _353);
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[31].z, _357);
    float _367 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[32].z, _359);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[33].z, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c3)._m0[34].z, _363);
    float _373 = _365 + (*spvDescriptorSet0.vp_c3)._m0[31].w;
    float _375 = _367 + (*spvDescriptorSet0.vp_c3)._m0[32].w;
    float _377 = _369 + (*spvDescriptorSet0.vp_c3)._m0[33].w;
    float _379 = _371 + (*spvDescriptorSet0.vp_c3)._m0[34].w;
    out.m_37.y = _303;
    out.m_37.w = 0.5;
    out.m_37.x = _309;
    out.gl_Position.x = _373;
    out.gl_Position.y = _375;
    out.gl_Position.z = _377;
    out.gl_Position.w = _379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

