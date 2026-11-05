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
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    const device _23* vp_s0 [[id(2)]];
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
    float _58 = in.m_34.x;
    float _60 = in.m_34.y;
    float _62 = in.m_34.z;
    int _64 = _56 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _66 = _64 * 80;
    int _68 = _66 + 32;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_71)];
    float _73 = as_type<float>(_dmw0.x);
    int _75 = _66 + 4;
    uint _77 = uint(int(uint(_75) >> uint(2)));
    float _79 = as_type<float>(_dmw0.y);
    int _81 = _66 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    float _85 = as_type<float>(_dmw0.z);
    int _87 = _66 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    float _91 = as_type<float>(_dmw0.w);
    uint _93 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_93)];
    float _95 = as_type<float>(_dmw2.x);
    int _97 = _68 + 4;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw2.y);
    int _103 = _68 + 8;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw2.z);
    int _109 = _68 + 12;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw2.w);
    int _115 = _66 + 16;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_117)];
    float _119 = as_type<float>(_dmw1.x);
    int _121 = _115 + 4;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.y);
    int _127 = _115 + 8;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.z);
    int _133 = _115 + 12;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw1.w);
    int _139 = _66 + 64;
    int _141 = _139 + 4;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_143)]);
    int _147 = _139 + 8;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_149)]);
    float _153 = _79 * _60;
    float _155 = _101 * _60;
    float _157 = fma(_95, _58, _155);
    float _159 = fma(_73, _58, _153);
    float _161 = fma(_107, _62, _157);
    float _163 = fma(_85, _62, _159);
    float _165 = _113 + _161;
    float _167 = _91 + _163;
    float _169 = -(*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _171 = _165 + _169;
    float _173 = -(*spvDescriptorSet0.vp_c3)._m0[4].x;
    float _175 = _167 + _173;
    float _177 = _171 * _171;
    float _179 = fma(_175, _175, _177);
    float _181 = sqrt(_179);
    bool _185 = _181 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _187 = -(*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _189 = _181 + _187;
    float _191 = _95;
    float _193 = _189;
    float _195 = _58;
    if (_185)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _125 * _60;
    float _203 = fma(_119, _58, _201);
    float _205 = _119;
    if (_185)
    {
        float _207 = _189 * _199;
        _193 = _207;
    }
    float _209 = _193;
    float _211 = _209;
    if (_185)
    {
        float _213 = _209 * 0.15915493667125701904296875;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = _60;
    if (_185)
    {
        float _219 = _215 * 6.283185482025146484375;
        float _221 = sin(_219);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = fma(_131, _62, _203);
    float _227 = _199;
    float _229 = _225;
    if (_185)
    {
        float _231 = _215 * 6.283185482025146484375;
        float _233 = cos(_231);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = _137 + _225;
    float _239 = _179;
    float _241 = _237;
    if (_185)
    {
        float _243 = rsqrt(_179);
        _239 = _243;
    }
    float _245 = _239;
    if (_185)
    {
        float _247 = _237 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _205 = _247;
    }
    float _249 = _205;
    float _251 = _223;
    float _253 = _249;
    if (_185)
    {
        float _255 = fma(_223, _249, (*spvDescriptorSet0.vp_c3)._m0[4].w);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = _257;
    if (_185)
    {
        float _261 = _235 + (-1.0);
        _253 = _261;
    }
    float _263 = _253;
    float _265 = _263;
    if (_185)
    {
        float _267 = _263 * (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _195 = _267;
    }
    float _269 = _195;
    if (!_185)
    {
        _229 = _167;
    }
    float _271 = _229;
    float _273 = _271;
    if (_185)
    {
        float _275 = _245 * _257;
        _259 = _275;
    }
    float _277 = _259;
    if (_185)
    {
        float _279 = fma(_237, _235, _269);
        _241 = _279;
    }
    float _281 = _241;
    if (!_185)
    {
        _265 = _165;
    }
    float _283 = _265;
    float _285 = _283;
    if (_185)
    {
        float _287 = fma(_175, _277, (*spvDescriptorSet0.vp_c3)._m0[4].x);
        _273 = _287;
    }
    float _289 = _273;
    if (_185)
    {
        float _291 = fma(_171, _277, (*spvDescriptorSet0.vp_c3)._m0[4].z);
        _285 = _291;
    }
    float _293 = _285;
    float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _299 = _281 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _301 = _281 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[0].x, _295);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[1].x, _297);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[2].x, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[3].x, _301);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[0].z, _303);
    float _313 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[1].z, _305);
    float _315 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[2].z, _307);
    float _317 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[3].z, _309);
    float _319 = _311 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_37.x = _145;
    out.m_37.y = _151;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _323;
    out.gl_Position.w = _325;
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
    float _58 = in.m_34.x;
    float _60 = in.m_34.y;
    float _62 = in.m_34.z;
    int _64 = _56 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _66 = _64 * 80;
    int _68 = _66 + 32;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_71)];
    float _73 = as_type<float>(_dmw0.x);
    int _75 = _66 + 4;
    uint _77 = uint(int(uint(_75) >> uint(2)));
    float _79 = as_type<float>(_dmw0.y);
    int _81 = _66 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    float _85 = as_type<float>(_dmw0.z);
    int _87 = _66 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    float _91 = as_type<float>(_dmw0.w);
    uint _93 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_93)];
    float _95 = as_type<float>(_dmw2.x);
    int _97 = _68 + 4;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw2.y);
    int _103 = _68 + 8;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw2.z);
    int _109 = _68 + 12;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw2.w);
    int _115 = _66 + 16;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_117)];
    float _119 = as_type<float>(_dmw1.x);
    int _121 = _115 + 4;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.y);
    int _127 = _115 + 8;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.z);
    int _133 = _115 + 12;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw1.w);
    int _139 = _66 + 64;
    int _141 = _139 + 4;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_143)]);
    int _147 = _139 + 8;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_149)]);
    float _153 = _79 * _60;
    float _155 = _101 * _60;
    float _157 = fma(_95, _58, _155);
    float _159 = fma(_73, _58, _153);
    float _161 = fma(_107, _62, _157);
    float _163 = fma(_85, _62, _159);
    float _165 = _113 + _161;
    float _167 = _91 + _163;
    float _169 = -(*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _171 = _165 + _169;
    float _173 = -(*spvDescriptorSet0.vp_c3)._m0[4].x;
    float _175 = _167 + _173;
    float _177 = _171 * _171;
    float _179 = fma(_175, _175, _177);
    float _181 = sqrt(_179);
    bool _185 = _181 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _187 = -(*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _189 = _181 + _187;
    float _191 = _95;
    float _193 = _189;
    float _195 = _58;
    if (_185)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _125 * _60;
    float _203 = fma(_119, _58, _201);
    float _205 = _119;
    if (_185)
    {
        float _207 = _189 * _199;
        _193 = _207;
    }
    float _209 = _193;
    float _211 = _209;
    if (_185)
    {
        float _213 = _209 * 0.15915493667125701904296875;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = _60;
    if (_185)
    {
        float _219 = _215 * 6.283185482025146484375;
        float _221 = sin(_219);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = fma(_131, _62, _203);
    float _227 = _199;
    float _229 = _225;
    if (_185)
    {
        float _231 = _215 * 6.283185482025146484375;
        float _233 = cos(_231);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = _137 + _225;
    float _239 = _179;
    float _241 = _237;
    if (_185)
    {
        float _243 = rsqrt(_179);
        _239 = _243;
    }
    float _245 = _239;
    if (_185)
    {
        float _247 = _237 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _205 = _247;
    }
    float _249 = _205;
    float _251 = _223;
    float _253 = _249;
    if (_185)
    {
        float _255 = fma(_223, _249, (*spvDescriptorSet0.vp_c3)._m0[4].w);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = _257;
    if (_185)
    {
        float _261 = _235 + (-1.0);
        _253 = _261;
    }
    float _263 = _253;
    float _265 = _263;
    if (_185)
    {
        float _267 = _263 * (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _195 = _267;
    }
    float _269 = _195;
    if (!_185)
    {
        _229 = _167;
    }
    float _271 = _229;
    float _273 = _271;
    if (_185)
    {
        float _275 = _245 * _257;
        _259 = _275;
    }
    float _277 = _259;
    if (_185)
    {
        float _279 = fma(_237, _235, _269);
        _241 = _279;
    }
    float _281 = _241;
    if (!_185)
    {
        _265 = _165;
    }
    float _283 = _265;
    float _285 = _283;
    if (_185)
    {
        float _287 = fma(_175, _277, (*spvDescriptorSet0.vp_c3)._m0[4].x);
        _273 = _287;
    }
    float _289 = _273;
    if (_185)
    {
        float _291 = fma(_171, _277, (*spvDescriptorSet0.vp_c3)._m0[4].z);
        _285 = _291;
    }
    float _293 = _285;
    float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _299 = _281 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _301 = _281 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[0].x, _295);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[1].x, _297);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[2].x, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[3].x, _301);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[0].z, _303);
    float _313 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[1].z, _305);
    float _315 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[2].z, _307);
    float _317 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[3].z, _309);
    float _319 = _311 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_37.x = _145;
    out.m_37.y = _151;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _323;
    out.gl_Position.w = _325;
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
    float _58 = in.m_34.x;
    float _60 = in.m_34.y;
    float _62 = in.m_34.z;
    int _64 = _56 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _66 = _64 * 80;
    int _68 = _66 + 32;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_71)];
    float _73 = as_type<float>(_dmw0.x);
    int _75 = _66 + 4;
    uint _77 = uint(int(uint(_75) >> uint(2)));
    float _79 = as_type<float>(_dmw0.y);
    int _81 = _66 + 8;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    float _85 = as_type<float>(_dmw0.z);
    int _87 = _66 + 12;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    float _91 = as_type<float>(_dmw0.w);
    uint _93 = uint(int(uint(_68) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_93)];
    float _95 = as_type<float>(_dmw2.x);
    int _97 = _68 + 4;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw2.y);
    int _103 = _68 + 8;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>(_dmw2.z);
    int _109 = _68 + 12;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>(_dmw2.w);
    int _115 = _66 + 16;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_117)];
    float _119 = as_type<float>(_dmw1.x);
    int _121 = _115 + 4;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    float _125 = as_type<float>(_dmw1.y);
    int _127 = _115 + 8;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw1.z);
    int _133 = _115 + 12;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw1.w);
    int _139 = _66 + 64;
    int _141 = _139 + 4;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_143)]);
    int _147 = _139 + 8;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    float _151 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_149)]);
    float _153 = _79 * _60;
    float _155 = _101 * _60;
    float _157 = fma(_95, _58, _155);
    float _159 = fma(_73, _58, _153);
    float _161 = fma(_107, _62, _157);
    float _163 = fma(_85, _62, _159);
    float _165 = _113 + _161;
    float _167 = _91 + _163;
    float _169 = -(*spvDescriptorSet0.vp_c3)._m0[4].z;
    float _171 = _165 + _169;
    float _173 = -(*spvDescriptorSet0.vp_c3)._m0[4].x;
    float _175 = _167 + _173;
    float _177 = _171 * _171;
    float _179 = fma(_175, _175, _177);
    float _181 = sqrt(_179);
    bool _185 = _181 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _187 = -(*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _189 = _181 + _187;
    float _191 = _95;
    float _193 = _189;
    float _195 = _58;
    if (_185)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _191 = _197;
    }
    float _199 = _191;
    float _201 = _125 * _60;
    float _203 = fma(_119, _58, _201);
    float _205 = _119;
    if (_185)
    {
        float _207 = _189 * _199;
        _193 = _207;
    }
    float _209 = _193;
    float _211 = _209;
    if (_185)
    {
        float _213 = _209 * 0.15915493667125701904296875;
        _211 = _213;
    }
    float _215 = _211;
    float _217 = _60;
    if (_185)
    {
        float _219 = _215 * 6.283185482025146484375;
        float _221 = sin(_219);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = fma(_131, _62, _203);
    float _227 = _199;
    float _229 = _225;
    if (_185)
    {
        float _231 = _215 * 6.283185482025146484375;
        float _233 = cos(_231);
        _227 = _233;
    }
    float _235 = _227;
    float _237 = _137 + _225;
    float _239 = _179;
    float _241 = _237;
    if (_185)
    {
        float _243 = rsqrt(_179);
        _239 = _243;
    }
    float _245 = _239;
    if (_185)
    {
        float _247 = _237 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _205 = _247;
    }
    float _249 = _205;
    float _251 = _223;
    float _253 = _249;
    if (_185)
    {
        float _255 = fma(_223, _249, (*spvDescriptorSet0.vp_c3)._m0[4].w);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = _257;
    if (_185)
    {
        float _261 = _235 + (-1.0);
        _253 = _261;
    }
    float _263 = _253;
    float _265 = _263;
    if (_185)
    {
        float _267 = _263 * (*spvDescriptorSet0.vp_c3)._m0[5].w;
        _195 = _267;
    }
    float _269 = _195;
    if (!_185)
    {
        _229 = _167;
    }
    float _271 = _229;
    float _273 = _271;
    if (_185)
    {
        float _275 = _245 * _257;
        _259 = _275;
    }
    float _277 = _259;
    if (_185)
    {
        float _279 = fma(_237, _235, _269);
        _241 = _279;
    }
    float _281 = _241;
    if (!_185)
    {
        _265 = _165;
    }
    float _283 = _265;
    float _285 = _283;
    if (_185)
    {
        float _287 = fma(_175, _277, (*spvDescriptorSet0.vp_c3)._m0[4].x);
        _273 = _287;
    }
    float _289 = _273;
    if (_185)
    {
        float _291 = fma(_171, _277, (*spvDescriptorSet0.vp_c3)._m0[4].z);
        _285 = _291;
    }
    float _293 = _285;
    float _295 = _281 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _297 = _281 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _299 = _281 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _301 = _281 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _303 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[0].x, _295);
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[1].x, _297);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[2].x, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c3)._m0[3].x, _301);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[0].z, _303);
    float _313 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[1].z, _305);
    float _315 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[2].z, _307);
    float _317 = fma(_293, (*spvDescriptorSet0.vp_c3)._m0[3].z, _309);
    float _319 = _311 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_37.x = _145;
    out.m_37.y = _151;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _323;
    out.gl_Position.w = _325;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

