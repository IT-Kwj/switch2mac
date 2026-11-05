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
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    const device _23* vp_s0 [[id(2)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_36 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_VertexIndex));
    float _57 = as_type<float>(int(gl_InstanceIndex));
    float _59 = as_type<float>(int(gl_BaseInstance));
    int _62 = as_type<int>(_57) - as_type<int>(_59);
    int _64 = as_type<int>(_55) >> 31;
    int _66 = as_type<int>(_55) * 4;
    int _68 = _64 & 3;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c1)._m0[int(_73)][_75];
    int _79 = _62 * 64;
    int _81 = as_type<int>(_55) + _68;
    int _83 = _79 + 44;
    int _85 = _81 >> 2;
    int _87 = _85 * (-4);
    int _89 = _87 + as_type<int>(_55);
    int _91 = _89 << 3;
    int _93 = _91 + 16;
    int _95 = _79 + 60;
    uint _97 = uint(int(uint(_83) >> uint(2)));
    float _99 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_97)]);
    uint _101 = uint(int(uint(_93) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c1)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c1)._m0[int(_111)][_113];
    uint _117 = uint(int(uint(_95) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_117)]);
    int _121 = _79 + 40;
    uint _123 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw0.x);
    int _127 = _79 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw0.y);
    int _133 = _79 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw0.z);
    int _139 = _79 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw0.w);
    int _145 = as_type<int>(_77) << 2;
    int _147 = _145 + _79;
    int _149 = _147 + 32;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_151)]);
    uint _155 = uint(int(uint(_121) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_155)]);
    int _159 = as_type<int>(_107) << 2;
    int _161 = _159 + _79;
    int _163 = as_type<int>(_115) * 4;
    int _165 = _163 + _79;
    float _167 = in.m_36.x;
    float _169 = in.m_36.y;
    int _171 = _161 + 16;
    int _173 = _165 + 16;
    uint _175 = uint(int(uint(_171) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_175)]);
    uint _179 = uint(int(uint(_173) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_179)]);
    float _183 = float(as_type<int>(_77));
    float _185 = -_99;
    float _187 = fma(_183, _185, _119);
    float _189 = fma(_125, _167, _137);
    float _191 = fma(_131, _169, _143);
    float _193 = _187 + _189;
    float _195 = _191 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[0].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    uint _211 = uint(int(uint(as_type<int>(_153)) >> uint(8)));
    uint _213 = uint(int(uint(as_type<int>(_153)) >> uint(16)));
    int _215 = as_type<int>(_153) & 255;
    int _217 = int(_211) & 255;
    uint _219 = uint(int(uint(as_type<int>(_153)) >> uint(24)));
    int _221 = int(_213) & 255;
    bool _225 = as_type<int>(_157) >= 0;
    float _227 = float(_215);
    float _229 = float(_217);
    float _231 = float(int(_219));
    float _233 = float(_221);
    float _235 = _227 * 0.0039215688593685626983642578125;
    float _237 = _203 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _239 = _229 * 0.0039215688593685626983642578125;
    float _241 = _205 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _245 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _231 * 0.0039215688593685626983642578125;
    float _249 = _233 * 0.0039215688593685626983642578125;
    float _251 = float(as_type<int>(_157));
    out.gl_Position.x = _237;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    out.m_39.x = _235;
    out.m_39.y = _239;
    out.m_39.z = _249;
    out.m_39.w = _247;
    out.m_41.x = _177;
    out.m_41.y = _181;
    out.m_41.z = _251;
    if (_225)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _253 = -_247;
    float _255 = _253 + (-0.0);
    float _257 = -_251;
    float _259 = _257 + (-1.0);
    out.m_39.w = _255;
    out.m_41.z = _259;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_VertexIndex));
    float _57 = as_type<float>(int(gl_InstanceIndex));
    float _59 = as_type<float>(int(gl_BaseInstance));
    int _62 = as_type<int>(_57) - as_type<int>(_59);
    int _64 = as_type<int>(_55) >> 31;
    int _66 = as_type<int>(_55) * 4;
    int _68 = _64 & 3;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c1)._m0[int(_73)][_75];
    int _79 = _62 * 64;
    int _81 = as_type<int>(_55) + _68;
    int _83 = _79 + 44;
    int _85 = _81 >> 2;
    int _87 = _85 * (-4);
    int _89 = _87 + as_type<int>(_55);
    int _91 = _89 << 3;
    int _93 = _91 + 16;
    int _95 = _79 + 60;
    uint _97 = uint(int(uint(_83) >> uint(2)));
    float _99 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_97)]);
    uint _101 = uint(int(uint(_93) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c1)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c1)._m0[int(_111)][_113];
    uint _117 = uint(int(uint(_95) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_117)]);
    int _121 = _79 + 40;
    uint _123 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw0.x);
    int _127 = _79 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw0.y);
    int _133 = _79 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw0.z);
    int _139 = _79 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw0.w);
    int _145 = as_type<int>(_77) << 2;
    int _147 = _145 + _79;
    int _149 = _147 + 32;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_151)]);
    uint _155 = uint(int(uint(_121) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_155)]);
    int _159 = as_type<int>(_107) << 2;
    int _161 = _159 + _79;
    int _163 = as_type<int>(_115) * 4;
    int _165 = _163 + _79;
    float _167 = in.m_36.x;
    float _169 = in.m_36.y;
    int _171 = _161 + 16;
    int _173 = _165 + 16;
    uint _175 = uint(int(uint(_171) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_175)]);
    uint _179 = uint(int(uint(_173) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_179)]);
    float _183 = float(as_type<int>(_77));
    float _185 = -_99;
    float _187 = fma(_183, _185, _119);
    float _189 = fma(_125, _167, _137);
    float _191 = fma(_131, _169, _143);
    float _193 = _187 + _189;
    float _195 = _191 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[0].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    uint _211 = uint(int(uint(as_type<int>(_153)) >> uint(8)));
    uint _213 = uint(int(uint(as_type<int>(_153)) >> uint(16)));
    int _215 = as_type<int>(_153) & 255;
    int _217 = int(_211) & 255;
    uint _219 = uint(int(uint(as_type<int>(_153)) >> uint(24)));
    int _221 = int(_213) & 255;
    bool _225 = as_type<int>(_157) >= 0;
    float _227 = float(_215);
    float _229 = float(_217);
    float _231 = float(int(_219));
    float _233 = float(_221);
    float _235 = _227 * 0.0039215688593685626983642578125;
    float _237 = _203 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _239 = _229 * 0.0039215688593685626983642578125;
    float _241 = _205 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _245 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _231 * 0.0039215688593685626983642578125;
    float _249 = _233 * 0.0039215688593685626983642578125;
    float _251 = float(as_type<int>(_157));
    out.gl_Position.x = _237;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    out.m_39.x = _235;
    out.m_39.y = _239;
    out.m_39.z = _249;
    out.m_39.w = _247;
    out.m_41.x = _177;
    out.m_41.y = _181;
    out.m_41.z = _251;
    if (_225)
    {
        return out;
    }
    float _253 = -_247;
    float _255 = _253 + (-0.0);
    float _257 = -_251;
    float _259 = _257 + (-1.0);
    out.m_39.w = _255;
    out.m_41.z = _259;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(int(gl_VertexIndex));
    float _57 = as_type<float>(int(gl_InstanceIndex));
    float _59 = as_type<float>(int(gl_BaseInstance));
    int _62 = as_type<int>(_57) - as_type<int>(_59);
    int _64 = as_type<int>(_55) >> 31;
    int _66 = as_type<int>(_55) * 4;
    int _68 = _64 & 3;
    uint _71 = uint(int(uint(_66) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.vp_c1)._m0[int(_73)][_75];
    int _79 = _62 * 64;
    int _81 = as_type<int>(_55) + _68;
    int _83 = _79 + 44;
    int _85 = _81 >> 2;
    int _87 = _85 * (-4);
    int _89 = _87 + as_type<int>(_55);
    int _91 = _89 << 3;
    int _93 = _91 + 16;
    int _95 = _79 + 60;
    uint _97 = uint(int(uint(_83) >> uint(2)));
    float _99 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_97)]);
    uint _101 = uint(int(uint(_93) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.vp_c1)._m0[int(_103)][_105];
    int _109 = int(_101) + 1;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    int _113 = _109 & 3;
    float _115 = (*spvDescriptorSet0.vp_c1)._m0[int(_111)][_113];
    uint _117 = uint(int(uint(_95) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_117)]);
    int _121 = _79 + 40;
    uint _123 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw0.x);
    int _127 = _79 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw0.y);
    int _133 = _79 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw0.z);
    int _139 = _79 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw0.w);
    int _145 = as_type<int>(_77) << 2;
    int _147 = _145 + _79;
    int _149 = _147 + 32;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_151)]);
    uint _155 = uint(int(uint(_121) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_155)]);
    int _159 = as_type<int>(_107) << 2;
    int _161 = _159 + _79;
    int _163 = as_type<int>(_115) * 4;
    int _165 = _163 + _79;
    float _167 = in.m_36.x;
    float _169 = in.m_36.y;
    int _171 = _161 + 16;
    int _173 = _165 + 16;
    uint _175 = uint(int(uint(_171) >> uint(2)));
    float _177 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_175)]);
    uint _179 = uint(int(uint(_173) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_179)]);
    float _183 = float(as_type<int>(_77));
    float _185 = -_99;
    float _187 = fma(_183, _185, _119);
    float _189 = fma(_125, _167, _137);
    float _191 = fma(_131, _169, _143);
    float _193 = _187 + _189;
    float _195 = _191 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[0].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[1].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[2].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c3)._m0[3].x, _201);
    uint _211 = uint(int(uint(as_type<int>(_153)) >> uint(8)));
    uint _213 = uint(int(uint(as_type<int>(_153)) >> uint(16)));
    int _215 = as_type<int>(_153) & 255;
    int _217 = int(_211) & 255;
    uint _219 = uint(int(uint(as_type<int>(_153)) >> uint(24)));
    int _221 = int(_213) & 255;
    bool _225 = as_type<int>(_157) >= 0;
    float _227 = float(_215);
    float _229 = float(_217);
    float _231 = float(int(_219));
    float _233 = float(_221);
    float _235 = _227 * 0.0039215688593685626983642578125;
    float _237 = _203 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _239 = _229 * 0.0039215688593685626983642578125;
    float _241 = _205 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _243 = _207 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _245 = _209 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _247 = _231 * 0.0039215688593685626983642578125;
    float _249 = _233 * 0.0039215688593685626983642578125;
    float _251 = float(as_type<int>(_157));
    out.gl_Position.x = _237;
    out.gl_Position.y = _241;
    out.gl_Position.z = _243;
    out.gl_Position.w = _245;
    out.m_39.x = _235;
    out.m_39.y = _239;
    out.m_39.z = _249;
    out.m_39.w = _247;
    out.m_41.x = _177;
    out.m_41.y = _181;
    out.m_41.z = _251;
    if (_225)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _253 = -_247;
    float _255 = _253 + (-0.0);
    float _257 = -_251;
    float _259 = _257 + (-1.0);
    out.m_39.w = _255;
    out.m_41.z = _259;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

