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
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    uint4 m_23 [[attribute(2)]];
    uint4 m_25 [[attribute(3)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _60 = _58 << 4;
    int _62 = _60 + 224;
    int _64 = ~as_type<int>(_49);
    int _66 = _64 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _70 = _66 != 0;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(_62) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _87 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _89 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _91 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = _93 * _93;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _91);
    bool _107 = false;
    if (_70)
    {
        _107 = false;
    }
    bool _109 = _107;
    float _111 = fma(_95, _95, _103);
    float _113 = fma(_105, _105, _111);
    int _115 = 0;
    bool _117 = _109;
    if (!_70)
    {
        int _119 = ~_101;
        int _121 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _123 = _121 != 0;
        _115 = _123 ? (-1) : 0;
    }
    int _125 = _115;
    if (!_70)
    {
        int _127 = ~_125;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    uint _131 = uint(int(uint(as_type<int>(_83)) >> uint(5)));
    int _133 = int(_131) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _135 = as_type<int>(_83) & 31;
    bool _137 = uint(_135) < 32u;
    int _139 = 1 << _135;
    int _141 = _137 ? _139 : 0;
    int _143 = _133 << 4;
    int _145 = _143 + 224;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    uint _153 = uint(int(uint(_145) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    float _161 = rsqrt(_113);
    float _163 = _149 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _149 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].x, _163);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[2].z, _171);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[3].z, _173);
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[4].z, _175);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[5].z, _177);
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _189 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _193 = _185 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _195 = _95 * _161;
    float _197 = _93 * _161;
    float _199 = _105 * _161;
    out.gl_Position.x = _187;
    out.gl_Position.y = _189;
    out.gl_Position.z = _191;
    out.gl_Position.w = _193;
    out.m_33.x = _195;
    out.m_33.y = _197;
    out.m_33.z = _199;
    int _201 = _141 & as_type<int>(_159);
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_183);
    if (!_203)
    {
        _205 = -1082130432;
    }
    int _207 = _205;
    if (!_203)
    {
        float _539 = as_type<float>(_207);
        out.gl_Position.w = _539;
    }
    if (!_129)
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _60 = _58 << 4;
    int _62 = _60 + 224;
    int _64 = ~as_type<int>(_49);
    int _66 = _64 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _70 = _66 != 0;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(_62) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _87 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _89 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _91 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = _93 * _93;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _91);
    bool _107 = false;
    if (_70)
    {
        _107 = false;
    }
    bool _109 = _107;
    float _111 = fma(_95, _95, _103);
    float _113 = fma(_105, _105, _111);
    int _115 = 0;
    bool _117 = _109;
    if (!_70)
    {
        int _119 = ~_101;
        int _121 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _123 = _121 != 0;
        _115 = _123 ? (-1) : 0;
    }
    int _125 = _115;
    if (!_70)
    {
        int _127 = ~_125;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    uint _131 = uint(int(uint(as_type<int>(_83)) >> uint(5)));
    int _133 = int(_131) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _135 = as_type<int>(_83) & 31;
    bool _137 = uint(_135) < 32u;
    int _139 = 1 << _135;
    int _141 = _137 ? _139 : 0;
    int _143 = _133 << 4;
    int _145 = _143 + 224;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    uint _153 = uint(int(uint(_145) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    float _161 = rsqrt(_113);
    float _163 = _149 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _149 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].x, _163);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[2].z, _171);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[3].z, _173);
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[4].z, _175);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[5].z, _177);
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _189 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _193 = _185 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _195 = _95 * _161;
    float _197 = _93 * _161;
    float _199 = _105 * _161;
    out.gl_Position.x = _187;
    out.gl_Position.y = _189;
    out.gl_Position.z = _191;
    out.gl_Position.w = _193;
    out.m_33.x = _195;
    out.m_33.y = _197;
    out.m_33.z = _199;
    int _201 = _141 & as_type<int>(_159);
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_183);
    if (!_203)
    {
        _205 = -1082130432;
    }
    int _207 = _205;
    if (!_203)
    {
        float _539 = as_type<float>(_207);
        out.gl_Position.w = _539;
    }
    if (!_129)
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = as_type<float>(in.m_23.x);
    float _49 = as_type<float>(in.m_25.x);
    float _51 = in.m_28.x;
    float _53 = in.m_28.y;
    float _55 = in.m_28.z;
    int _58 = as_type<int>(_47) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].y);
    int _60 = _58 << 4;
    int _62 = _60 + 224;
    int _64 = ~as_type<int>(_49);
    int _66 = _64 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[9].x);
    bool _70 = _66 != 0;
    float _72 = _53 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _74 = _53 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    uint _77 = uint(int(uint(_62) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.vp_c3)._m0[int(_79)][_81];
    float _85 = _53 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _87 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[7].x, _72);
    float _89 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[6].x, _74);
    float _91 = fma(_51, (*spvDescriptorSet0.vp_c3)._m0[8].x, _85);
    float _93 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[7].z, _87);
    float _95 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[6].z, _89);
    int _97 = 0;
    if (!_70)
    {
        float _99 = as_type<float>(in.m_25.y);
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    float _103 = _93 * _93;
    float _105 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[8].z, _91);
    bool _107 = false;
    if (_70)
    {
        _107 = false;
    }
    bool _109 = _107;
    float _111 = fma(_95, _95, _103);
    float _113 = fma(_105, _105, _111);
    int _115 = 0;
    bool _117 = _109;
    if (!_70)
    {
        int _119 = ~_101;
        int _121 = _119 & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[10].x);
        bool _123 = _121 != 0;
        _115 = _123 ? (-1) : 0;
    }
    int _125 = _115;
    if (!_70)
    {
        int _127 = ~_125;
        _117 = _127 != 0;
    }
    bool _129 = _117;
    uint _131 = uint(int(uint(as_type<int>(_83)) >> uint(5)));
    int _133 = int(_131) + as_type<int>((*spvDescriptorSet0.vp_c3)._m0[13].x);
    int _135 = as_type<int>(_83) & 31;
    bool _137 = uint(_135) < 32u;
    int _139 = 1 << _135;
    int _141 = _137 ? _139 : 0;
    int _143 = _133 << 4;
    int _145 = _143 + 224;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    uint _153 = uint(int(uint(_145) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c3)._m0[int(_155)][_157];
    float _161 = rsqrt(_113);
    float _163 = _149 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _165 = _149 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _149 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _149 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[2].x, _163);
    float _173 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[2].z, _171);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[3].z, _173);
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[4].z, _175);
    float _185 = fma(_151, (*spvDescriptorSet0.vp_c3)._m0[5].z, _177);
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _189 = _181 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _191 = _183 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _193 = _185 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _195 = _95 * _161;
    float _197 = _93 * _161;
    float _199 = _105 * _161;
    out.gl_Position.x = _187;
    out.gl_Position.y = _189;
    out.gl_Position.z = _191;
    out.gl_Position.w = _193;
    out.m_33.x = _195;
    out.m_33.y = _197;
    out.m_33.z = _199;
    int _201 = _141 & as_type<int>(_159);
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_183);
    if (!_203)
    {
        _205 = -1082130432;
    }
    int _207 = _205;
    if (!_203)
    {
        float _539 = as_type<float>(_207);
        out.gl_Position.w = _539;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.gl_Position.w = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

