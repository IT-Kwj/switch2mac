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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    const device _25* vp_s0 [[id(3)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_36 [[attribute(0)]];
    float4 m_38 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_InstanceIndex));
    float _57 = as_type<float>(int(gl_BaseInstance));
    int _60 = as_type<int>(_55) - as_type<int>(_57);
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    int _68 = _60 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 32;
    uint _75 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_75)];
    float _77 = as_type<float>(_dmw0.x);
    int _79 = _70 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    float _83 = as_type<float>(_dmw0.y);
    int _85 = _70 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.z);
    int _91 = _70 + 12;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.w);
    uint _97 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw2.x);
    int _101 = _72 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw2.y);
    int _107 = _72 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw2.z);
    int _113 = _72 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw2.w);
    int _119 = _70 + 16;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_121)];
    float _123 = as_type<float>(_dmw1.x);
    int _125 = _119 + 4;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    float _129 = as_type<float>(_dmw1.y);
    int _131 = _119 + 8;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    float _135 = as_type<float>(_dmw1.z);
    int _137 = _119 + 12;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw1.w);
    float _143 = _83 * _64;
    float _145 = _105 * _64;
    float _147 = fma(_99, _62, _145);
    float _149 = fma(_77, _62, _143);
    float _151 = fma(_111, _66, _147);
    float _153 = fma(_89, _66, _149);
    float _155 = _117 + _151;
    float _157 = _95 + _153;
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = _155 + _159;
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _165 = _157 + _163;
    float _167 = _161 * _161;
    float _169 = fma(_165, _165, _167);
    float _171 = sqrt(_169);
    bool _175 = _171 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _179 = _171 + _177;
    float _181 = 0.0;
    float _183 = _179;
    float _185 = _62;
    if (_175)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _181 = _187;
    }
    float _189 = _181;
    float _191 = _129 * _64;
    float _193 = fma(_123, _62, _191);
    float _195 = _123;
    if (_175)
    {
        float _197 = _179 * _189;
        _183 = _197;
    }
    float _199 = _183;
    float _201 = _199;
    if (_175)
    {
        float _203 = _199 * 0.15915493667125701904296875;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _189;
    if (_175)
    {
        float _209 = _205 * 6.283185482025146484375;
        float _211 = cos(_209);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = fma(_135, _66, _193);
    float _217 = _64;
    float _219 = _215;
    if (_175)
    {
        float _221 = _205 * 6.283185482025146484375;
        float _223 = sin(_221);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = _141 + _215;
    float _229 = _169;
    float _231 = _227;
    if (_175)
    {
        float _233 = rsqrt(_169);
        _229 = _233;
    }
    float _235 = _229;
    if (_175)
    {
        float _237 = _227 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _195 = _237;
    }
    float _239 = _195;
    float _241 = _239;
    if (_175)
    {
        float _243 = _213 + (-1.0);
        _219 = _243;
    }
    float _245 = _219;
    float _247 = _225;
    float _249 = _245;
    if (_175)
    {
        float _251 = fma(_225, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _247 = _251;
    }
    float _253 = _247;
    if (_175)
    {
        float _255 = _245 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _241 = _255;
    }
    float _257 = _241;
    float _259 = _257;
    if (!_175)
    {
        _249 = _157;
    }
    float _261 = _249;
    float _263 = _261;
    if (_175)
    {
        float _265 = fma(_227, _213, _257);
        _231 = _265;
    }
    float _267 = _231;
    if (_175)
    {
        float _269 = _235 * _253;
        _185 = _269;
    }
    float _271 = _185;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_175)
    {
        float _275 = fma(_165, _271, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _263 = _275;
    }
    float _277 = _263;
    if (!_175)
    {
        _259 = _155;
    }
    float _279 = _259;
    float _281 = _267 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _283 = _279;
    if (_175)
    {
        float _285 = fma(_161, _271, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _283 = _285;
    }
    float _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _291 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[0].x, _281);
    float _295 = in.m_38.x;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _289);
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].x, _291);
    float _301 = in.m_38.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _293);
    float _305 = _297 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _309 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _317 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = _307 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _311);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _315);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _329 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[8].z, _321);
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[7].z, _323);
    float _333 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[9].z, _325);
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[10].z, _327);
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _341 = _333 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _343 = _335 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _295;
    out.m_41.y = _301;
    out.gl_Position.x = _339;
    out.gl_Position.y = _337;
    out.gl_Position.z = _341;
    out.gl_Position.w = _343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_InstanceIndex));
    float _57 = as_type<float>(int(gl_BaseInstance));
    int _60 = as_type<int>(_55) - as_type<int>(_57);
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    int _68 = _60 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 32;
    uint _75 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_75)];
    float _77 = as_type<float>(_dmw0.x);
    int _79 = _70 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    float _83 = as_type<float>(_dmw0.y);
    int _85 = _70 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.z);
    int _91 = _70 + 12;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.w);
    uint _97 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw2.x);
    int _101 = _72 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw2.y);
    int _107 = _72 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw2.z);
    int _113 = _72 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw2.w);
    int _119 = _70 + 16;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_121)];
    float _123 = as_type<float>(_dmw1.x);
    int _125 = _119 + 4;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    float _129 = as_type<float>(_dmw1.y);
    int _131 = _119 + 8;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    float _135 = as_type<float>(_dmw1.z);
    int _137 = _119 + 12;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw1.w);
    float _143 = _83 * _64;
    float _145 = _105 * _64;
    float _147 = fma(_99, _62, _145);
    float _149 = fma(_77, _62, _143);
    float _151 = fma(_111, _66, _147);
    float _153 = fma(_89, _66, _149);
    float _155 = _117 + _151;
    float _157 = _95 + _153;
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = _155 + _159;
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _165 = _157 + _163;
    float _167 = _161 * _161;
    float _169 = fma(_165, _165, _167);
    float _171 = sqrt(_169);
    bool _175 = _171 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _179 = _171 + _177;
    float _181 = 0.0;
    float _183 = _179;
    float _185 = _62;
    if (_175)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _181 = _187;
    }
    float _189 = _181;
    float _191 = _129 * _64;
    float _193 = fma(_123, _62, _191);
    float _195 = _123;
    if (_175)
    {
        float _197 = _179 * _189;
        _183 = _197;
    }
    float _199 = _183;
    float _201 = _199;
    if (_175)
    {
        float _203 = _199 * 0.15915493667125701904296875;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _189;
    if (_175)
    {
        float _209 = _205 * 6.283185482025146484375;
        float _211 = cos(_209);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = fma(_135, _66, _193);
    float _217 = _64;
    float _219 = _215;
    if (_175)
    {
        float _221 = _205 * 6.283185482025146484375;
        float _223 = sin(_221);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = _141 + _215;
    float _229 = _169;
    float _231 = _227;
    if (_175)
    {
        float _233 = rsqrt(_169);
        _229 = _233;
    }
    float _235 = _229;
    if (_175)
    {
        float _237 = _227 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _195 = _237;
    }
    float _239 = _195;
    float _241 = _239;
    if (_175)
    {
        float _243 = _213 + (-1.0);
        _219 = _243;
    }
    float _245 = _219;
    float _247 = _225;
    float _249 = _245;
    if (_175)
    {
        float _251 = fma(_225, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _247 = _251;
    }
    float _253 = _247;
    if (_175)
    {
        float _255 = _245 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _241 = _255;
    }
    float _257 = _241;
    float _259 = _257;
    if (!_175)
    {
        _249 = _157;
    }
    float _261 = _249;
    float _263 = _261;
    if (_175)
    {
        float _265 = fma(_227, _213, _257);
        _231 = _265;
    }
    float _267 = _231;
    if (_175)
    {
        float _269 = _235 * _253;
        _185 = _269;
    }
    float _271 = _185;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_175)
    {
        float _275 = fma(_165, _271, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _263 = _275;
    }
    float _277 = _263;
    if (!_175)
    {
        _259 = _155;
    }
    float _279 = _259;
    float _281 = _267 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _283 = _279;
    if (_175)
    {
        float _285 = fma(_161, _271, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _283 = _285;
    }
    float _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _291 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[0].x, _281);
    float _295 = in.m_38.x;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _289);
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].x, _291);
    float _301 = in.m_38.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _293);
    float _305 = _297 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _309 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _317 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = _307 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _311);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _315);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _329 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[8].z, _321);
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[7].z, _323);
    float _333 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[9].z, _325);
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[10].z, _327);
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _341 = _333 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _343 = _335 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _295;
    out.m_41.y = _301;
    out.gl_Position.x = _339;
    out.gl_Position.y = _337;
    out.gl_Position.z = _341;
    out.gl_Position.w = _343;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_InstanceIndex));
    float _57 = as_type<float>(int(gl_BaseInstance));
    int _60 = as_type<int>(_55) - as_type<int>(_57);
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    int _68 = _60 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _70 = _68 * 80;
    int _72 = _70 + 32;
    uint _75 = uint(int(uint(_70) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_75)];
    float _77 = as_type<float>(_dmw0.x);
    int _79 = _70 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    float _83 = as_type<float>(_dmw0.y);
    int _85 = _70 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw0.z);
    int _91 = _70 + 12;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw0.w);
    uint _97 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_97)];
    float _99 = as_type<float>(_dmw2.x);
    int _101 = _72 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    float _105 = as_type<float>(_dmw2.y);
    int _107 = _72 + 8;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw2.z);
    int _113 = _72 + 12;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw2.w);
    int _119 = _70 + 16;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_121)];
    float _123 = as_type<float>(_dmw1.x);
    int _125 = _119 + 4;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    float _129 = as_type<float>(_dmw1.y);
    int _131 = _119 + 8;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    float _135 = as_type<float>(_dmw1.z);
    int _137 = _119 + 12;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>(_dmw1.w);
    float _143 = _83 * _64;
    float _145 = _105 * _64;
    float _147 = fma(_99, _62, _145);
    float _149 = fma(_77, _62, _143);
    float _151 = fma(_111, _66, _147);
    float _153 = fma(_89, _66, _149);
    float _155 = _117 + _151;
    float _157 = _95 + _153;
    float _159 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _161 = _155 + _159;
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _165 = _157 + _163;
    float _167 = _161 * _161;
    float _169 = fma(_165, _165, _167);
    float _171 = sqrt(_169);
    bool _175 = _171 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _179 = _171 + _177;
    float _181 = 0.0;
    float _183 = _179;
    float _185 = _62;
    if (_175)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _181 = _187;
    }
    float _189 = _181;
    float _191 = _129 * _64;
    float _193 = fma(_123, _62, _191);
    float _195 = _123;
    if (_175)
    {
        float _197 = _179 * _189;
        _183 = _197;
    }
    float _199 = _183;
    float _201 = _199;
    if (_175)
    {
        float _203 = _199 * 0.15915493667125701904296875;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _189;
    if (_175)
    {
        float _209 = _205 * 6.283185482025146484375;
        float _211 = cos(_209);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = fma(_135, _66, _193);
    float _217 = _64;
    float _219 = _215;
    if (_175)
    {
        float _221 = _205 * 6.283185482025146484375;
        float _223 = sin(_221);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = _141 + _215;
    float _229 = _169;
    float _231 = _227;
    if (_175)
    {
        float _233 = rsqrt(_169);
        _229 = _233;
    }
    float _235 = _229;
    if (_175)
    {
        float _237 = _227 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _195 = _237;
    }
    float _239 = _195;
    float _241 = _239;
    if (_175)
    {
        float _243 = _213 + (-1.0);
        _219 = _243;
    }
    float _245 = _219;
    float _247 = _225;
    float _249 = _245;
    if (_175)
    {
        float _251 = fma(_225, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _247 = _251;
    }
    float _253 = _247;
    if (_175)
    {
        float _255 = _245 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _241 = _255;
    }
    float _257 = _241;
    float _259 = _257;
    if (!_175)
    {
        _249 = _157;
    }
    float _261 = _249;
    float _263 = _261;
    if (_175)
    {
        float _265 = fma(_227, _213, _257);
        _231 = _265;
    }
    float _267 = _231;
    if (_175)
    {
        float _269 = _235 * _253;
        _185 = _269;
    }
    float _271 = _185;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (_175)
    {
        float _275 = fma(_165, _271, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _263 = _275;
    }
    float _277 = _263;
    if (!_175)
    {
        _259 = _155;
    }
    float _279 = _259;
    float _281 = _267 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _283 = _279;
    if (_175)
    {
        float _285 = fma(_161, _271, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _283 = _285;
    }
    float _287 = _283;
    float _289 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _291 = _267 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _293 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[0].x, _281);
    float _295 = in.m_38.x;
    float _297 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].z, _289);
    float _299 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].x, _291);
    float _301 = in.m_38.y;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].z, _293);
    float _305 = _297 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _307 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _309 = _303 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _311 = _305 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _313 = _305 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _315 = _305 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _317 = _305 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = _307 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[8].x, _311);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[7].x, _313);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[9].x, _315);
    float _327 = fma(_309, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _329 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[8].z, _321);
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[7].z, _323);
    float _333 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[9].z, _325);
    float _335 = fma(_319, (*spvDescriptorSet0.vp_c4)._m0[10].z, _327);
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _339 = _331 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _341 = _333 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _343 = _335 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _295;
    out.m_41.y = _301;
    out.gl_Position.x = _339;
    out.gl_Position.y = _337;
    out.gl_Position.z = _341;
    out.gl_Position.w = _343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

