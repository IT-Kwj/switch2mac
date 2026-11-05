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
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_26 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _66 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _69 = uint(int(uint(_60) >> uint(2)));
    uint _71 = uint(int(uint(int(_69)) >> uint(2)));
    int _73 = int(_69) & 3;
    float _75 = (*spvDescriptorSet0.vp_c3)._m0[int(_71)][_73];
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _64);
    float _81 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    float _83 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _79);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _81);
    float _89 = _83 * _83;
    float _91 = fma(_85, _85, _89);
    int _93 = as_type<int>(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _95 = _93 << 4;
    int _97 = _95 + 144;
    uint _99 = uint(int(uint(as_type<int>(_75)) >> uint(5)));
    int _101 = int(_99) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _97 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _101 << 4;
    int _121 = _119 + 144;
    float _123 = in.m_28.x;
    float _125 = in.m_28.y;
    float _127 = in.m_28.z;
    uint _129 = uint(int(uint(_97) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_121) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_87, _87, _91);
    float _147 = rsqrt(_145);
    float _149 = _125 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _151 = _125 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = _125 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _155 = _125 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[1].x, _149);
    float _159 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[3].x, _153);
    float _163 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[4].x, _155);
    int _165 = as_type<int>(_75) & 31;
    bool _169 = uint(_165) < 32u;
    int _171 = 1 << _165;
    int _173 = _169 ? _171 : 0;
    float _175 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[1].z, _157);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _179 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[3].z, _161);
    float _181 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[4].z, _163);
    float _183 = _85 * _147;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _189 = _83 * _147;
    float _191 = _87 * _147;
    uint _193 = extract_bits(uint(_117), 0u, 8u);
    float _195 = float(_193);
    out.m_31.x = _183;
    out.m_31.y = _189;
    out.m_31.z = _191;
    uint _197 = extract_bits(as_type<uint>(_135), 24u, 8u);
    float _199 = float(_197);
    uint _201 = extract_bits(as_type<uint>(_135), 16u, 8u);
    float _203 = float(_201);
    int _205 = _173 & as_type<int>(_143);
    bool _207 = _205 != 0;
    float _209 = _175 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _211 = _181 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _213 = _195 * 0.0039215688593685626983642578125;
    uint _215 = extract_bits(as_type<uint>(_135), 8u, 8u);
    float _217 = float(_215);
    float _219 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _209;
    out.gl_Position.y = _185;
    out.gl_Position.z = _187;
    out.gl_Position.w = _211;
    float _221 = _203 * 0.0039215688593685626983642578125;
    float _223 = _217 * 0.0039215688593685626983642578125;
    out.m_33.x = _219;
    out.m_33.y = _221;
    out.m_33.z = _223;
    out.m_33.w = _213;
    if (_207)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.gl_Position.w = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _66 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _69 = uint(int(uint(_60) >> uint(2)));
    uint _71 = uint(int(uint(int(_69)) >> uint(2)));
    int _73 = int(_69) & 3;
    float _75 = (*spvDescriptorSet0.vp_c3)._m0[int(_71)][_73];
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _64);
    float _81 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    float _83 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _79);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _81);
    float _89 = _83 * _83;
    float _91 = fma(_85, _85, _89);
    int _93 = as_type<int>(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _95 = _93 << 4;
    int _97 = _95 + 144;
    uint _99 = uint(int(uint(as_type<int>(_75)) >> uint(5)));
    int _101 = int(_99) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _97 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _101 << 4;
    int _121 = _119 + 144;
    float _123 = in.m_28.x;
    float _125 = in.m_28.y;
    float _127 = in.m_28.z;
    uint _129 = uint(int(uint(_97) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_121) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_87, _87, _91);
    float _147 = rsqrt(_145);
    float _149 = _125 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _151 = _125 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = _125 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _155 = _125 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[1].x, _149);
    float _159 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[3].x, _153);
    float _163 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[4].x, _155);
    int _165 = as_type<int>(_75) & 31;
    bool _169 = uint(_165) < 32u;
    int _171 = 1 << _165;
    int _173 = _169 ? _171 : 0;
    float _175 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[1].z, _157);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _179 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[3].z, _161);
    float _181 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[4].z, _163);
    float _183 = _85 * _147;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _189 = _83 * _147;
    float _191 = _87 * _147;
    uint _193 = extract_bits(uint(_117), 0u, 8u);
    float _195 = float(_193);
    out.m_31.x = _183;
    out.m_31.y = _189;
    out.m_31.z = _191;
    uint _197 = extract_bits(as_type<uint>(_135), 24u, 8u);
    float _199 = float(_197);
    uint _201 = extract_bits(as_type<uint>(_135), 16u, 8u);
    float _203 = float(_201);
    int _205 = _173 & as_type<int>(_143);
    bool _207 = _205 != 0;
    float _209 = _175 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _211 = _181 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _213 = _195 * 0.0039215688593685626983642578125;
    uint _215 = extract_bits(as_type<uint>(_135), 8u, 8u);
    float _217 = float(_215);
    float _219 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _209;
    out.gl_Position.y = _185;
    out.gl_Position.z = _187;
    out.gl_Position.w = _211;
    float _221 = _203 * 0.0039215688593685626983642578125;
    float _223 = _217 * 0.0039215688593685626983642578125;
    out.m_33.x = _219;
    out.m_33.y = _221;
    out.m_33.z = _223;
    out.m_33.w = _213;
    if (_207)
    {
        return out;
    }
    out.gl_Position.w = -1.0;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = in.m_26.x;
    float _51 = in.m_26.y;
    float _53 = in.m_26.z;
    int _56 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    int _58 = _56 << 4;
    int _60 = _58 + 144;
    float _62 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _64 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _66 = _51 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    uint _69 = uint(int(uint(_60) >> uint(2)));
    uint _71 = uint(int(uint(int(_69)) >> uint(2)));
    int _73 = int(_69) & 3;
    float _75 = (*spvDescriptorSet0.vp_c3)._m0[int(_71)][_73];
    float _77 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[6].x, _62);
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[5].x, _64);
    float _81 = fma(_49, (*spvDescriptorSet0.vp_c3)._m0[7].x, _66);
    float _83 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].z, _77);
    float _85 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].z, _79);
    float _87 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[7].z, _81);
    float _89 = _83 * _83;
    float _91 = fma(_85, _85, _89);
    int _93 = as_type<int>(_75) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].x);
    int _95 = _93 << 4;
    int _97 = _95 + 144;
    uint _99 = uint(int(uint(as_type<int>(_75)) >> uint(5)));
    int _101 = int(_99) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].y);
    uint _103 = uint(int(uint(_97) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.vp_c3)._m0[int(_105)][_107];
    int _111 = _97 & 3;
    int _113 = _111 << 3;
    uint _115 = uint(int(uint(as_type<int>(_109)) >> uint(_113)));
    int _117 = int(_115) & 255;
    int _119 = _101 << 4;
    int _121 = _119 + 144;
    float _123 = in.m_28.x;
    float _125 = in.m_28.y;
    float _127 = in.m_28.z;
    uint _129 = uint(int(uint(_97) >> uint(2)));
    uint _131 = uint(int(uint(int(_129)) >> uint(2)));
    int _133 = int(_129) & 3;
    float _135 = (*spvDescriptorSet0.vp_c3)._m0[int(_131)][_133];
    uint _137 = uint(int(uint(_121) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.vp_c3)._m0[int(_139)][_141];
    float _145 = fma(_87, _87, _91);
    float _147 = rsqrt(_145);
    float _149 = _125 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _151 = _125 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _153 = _125 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _155 = _125 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _157 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[1].x, _149);
    float _159 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[2].x, _151);
    float _161 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[3].x, _153);
    float _163 = fma(_123, (*spvDescriptorSet0.vp_c3)._m0[4].x, _155);
    int _165 = as_type<int>(_75) & 31;
    bool _169 = uint(_165) < 32u;
    int _171 = 1 << _165;
    int _173 = _169 ? _171 : 0;
    float _175 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[1].z, _157);
    float _177 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[2].z, _159);
    float _179 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[3].z, _161);
    float _181 = fma(_127, (*spvDescriptorSet0.vp_c3)._m0[4].z, _163);
    float _183 = _85 * _147;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _189 = _83 * _147;
    float _191 = _87 * _147;
    uint _193 = extract_bits(uint(_117), 0u, 8u);
    float _195 = float(_193);
    out.m_31.x = _183;
    out.m_31.y = _189;
    out.m_31.z = _191;
    uint _197 = extract_bits(as_type<uint>(_135), 24u, 8u);
    float _199 = float(_197);
    uint _201 = extract_bits(as_type<uint>(_135), 16u, 8u);
    float _203 = float(_201);
    int _205 = _173 & as_type<int>(_143);
    bool _207 = _205 != 0;
    float _209 = _175 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _211 = _181 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _213 = _195 * 0.0039215688593685626983642578125;
    uint _215 = extract_bits(as_type<uint>(_135), 8u, 8u);
    float _217 = float(_215);
    float _219 = _199 * 0.0039215688593685626983642578125;
    out.gl_Position.x = _209;
    out.gl_Position.y = _185;
    out.gl_Position.z = _187;
    out.gl_Position.w = _211;
    float _221 = _203 * 0.0039215688593685626983642578125;
    float _223 = _217 * 0.0039215688593685626983642578125;
    out.m_33.x = _219;
    out.m_33.y = _221;
    out.m_33.z = _223;
    out.m_33.w = _213;
    if (_207)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

