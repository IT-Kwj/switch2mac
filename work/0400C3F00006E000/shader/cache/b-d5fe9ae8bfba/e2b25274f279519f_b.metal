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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 m_29 [[user(locn5)]];
    float4 m_31 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_26.x;
    float _47 = in.m_26.y;
    float _49 = in.m_26.z;
    float _51 = _47 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _55 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _57 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[0].x, _53);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].z, _55);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _63 = _47 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _65 = _59 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[1].x, _63);
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _73 = _65 + _71;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = _67 + _75;
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].z, _69);
    float _81 = _73 * _73;
    float _83 = _79 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _85 = fma(_77, _77, _81);
    float _87 = _83 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _89 = sqrt(_85);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[2].x, _87);
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].z, _91);
    float _95 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _99 = _89 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _101 = _49;
    float _103 = _47;
    float _105 = _45;
    float _107 = _93;
    if (!_99)
    {
        _101 = _95;
    }
    float _109 = _101;
    float _111 = _109;
    if (!_99)
    {
        _103 = _67;
    }
    float _113 = _103;
    float _115 = _113;
    if (!_99)
    {
        _105 = _83;
    }
    float _117 = _105;
    float _119 = _117;
    if (!_99)
    {
        _107 = _65;
    }
    float _121 = _107;
    bool _123 = !_99;
    float _125 = _121;
    if (!_123)
    {
        float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _131 = _89 + _129;
        float _133 = _83 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = rsqrt(_85);
        float _137 = _131 * _127;
        float _139 = _137 * 0.15915493667125701904296875;
        float _141 = _139 * 6.283185482025146484375;
        float _143 = cos(_141);
        float _145 = _139 * 6.283185482025146484375;
        float _147 = sin(_145);
        float _149 = _143 + (-1.0);
        float _151 = fma(_147, _133, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _135 * _151;
        float _157 = fma(_83, _143, _153);
        float _159 = fma(_77, _155, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _161 = _157 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _163 = fma(_73, _155, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _165 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[2].x, _161);
        float _167 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[2].z, _165);
        float _169 = _167 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _119 = _157;
        _115 = _159;
        _125 = _163;
        _111 = _169;
    }
    float _171 = _119;
    float _173 = _115;
    float _175 = _125;
    float _177 = _111;
    float _179 = _171 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_29.x = _67;
    out.m_29.y = _83;
    out.m_29.z = _65;
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[1].x, _179);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[0].x, _181);
    out.m_31.w = _95;
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[1].z, _183);
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[0].z, _185);
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _193 = _189 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _195 = _191 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].x, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[7].z, _203);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[8].z, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[10].z, _209);
    float _219 = _211 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _221 = _213 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _223 = _215 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _219;
    out.gl_Position.y = _221;
    out.gl_Position.z = _223;
    out.gl_Position.w = _225;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_26.x;
    float _47 = in.m_26.y;
    float _49 = in.m_26.z;
    float _51 = _47 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _55 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _57 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[0].x, _53);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].z, _55);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _63 = _47 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _65 = _59 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[1].x, _63);
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _73 = _65 + _71;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = _67 + _75;
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].z, _69);
    float _81 = _73 * _73;
    float _83 = _79 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _85 = fma(_77, _77, _81);
    float _87 = _83 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _89 = sqrt(_85);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[2].x, _87);
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].z, _91);
    float _95 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _99 = _89 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _101 = _49;
    float _103 = _47;
    float _105 = _45;
    float _107 = _93;
    if (!_99)
    {
        _101 = _95;
    }
    float _109 = _101;
    float _111 = _109;
    if (!_99)
    {
        _103 = _67;
    }
    float _113 = _103;
    float _115 = _113;
    if (!_99)
    {
        _105 = _83;
    }
    float _117 = _105;
    float _119 = _117;
    if (!_99)
    {
        _107 = _65;
    }
    float _121 = _107;
    bool _123 = !_99;
    float _125 = _121;
    if (!_123)
    {
        float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _131 = _89 + _129;
        float _133 = _83 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = rsqrt(_85);
        float _137 = _131 * _127;
        float _139 = _137 * 0.15915493667125701904296875;
        float _141 = _139 * 6.283185482025146484375;
        float _143 = cos(_141);
        float _145 = _139 * 6.283185482025146484375;
        float _147 = sin(_145);
        float _149 = _143 + (-1.0);
        float _151 = fma(_147, _133, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _135 * _151;
        float _157 = fma(_83, _143, _153);
        float _159 = fma(_77, _155, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _161 = _157 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _163 = fma(_73, _155, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _165 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[2].x, _161);
        float _167 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[2].z, _165);
        float _169 = _167 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _119 = _157;
        _115 = _159;
        _125 = _163;
        _111 = _169;
    }
    float _171 = _119;
    float _173 = _115;
    float _175 = _125;
    float _177 = _111;
    float _179 = _171 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_29.x = _67;
    out.m_29.y = _83;
    out.m_29.z = _65;
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[1].x, _179);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[0].x, _181);
    out.m_31.w = _95;
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[1].z, _183);
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[0].z, _185);
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _193 = _189 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _195 = _191 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].x, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[7].z, _203);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[8].z, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[10].z, _209);
    float _219 = _211 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _221 = _213 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _223 = _215 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _219;
    out.gl_Position.y = _221;
    out.gl_Position.z = _223;
    out.gl_Position.w = _225;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = in.m_26.x;
    float _47 = in.m_26.y;
    float _49 = in.m_26.z;
    float _51 = _47 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _53 = _47 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _55 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[2].x, _51);
    float _57 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[0].x, _53);
    float _59 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[2].z, _55);
    float _61 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[0].z, _57);
    float _63 = _47 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _65 = _59 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _67 = _61 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c7)._m0[1].x, _63);
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _73 = _65 + _71;
    float _75 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _77 = _67 + _75;
    float _79 = fma(_49, (*spvDescriptorSet0.vp_c7)._m0[1].z, _69);
    float _81 = _73 * _73;
    float _83 = _79 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _85 = fma(_77, _77, _81);
    float _87 = _83 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _89 = sqrt(_85);
    float _91 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[2].x, _87);
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[2].z, _91);
    float _95 = _93 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _99 = _89 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _101 = _49;
    float _103 = _47;
    float _105 = _45;
    float _107 = _93;
    if (!_99)
    {
        _101 = _95;
    }
    float _109 = _101;
    float _111 = _109;
    if (!_99)
    {
        _103 = _67;
    }
    float _113 = _103;
    float _115 = _113;
    if (!_99)
    {
        _105 = _83;
    }
    float _117 = _105;
    float _119 = _117;
    if (!_99)
    {
        _107 = _65;
    }
    float _121 = _107;
    bool _123 = !_99;
    float _125 = _121;
    if (!_123)
    {
        float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _131 = _89 + _129;
        float _133 = _83 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _135 = rsqrt(_85);
        float _137 = _131 * _127;
        float _139 = _137 * 0.15915493667125701904296875;
        float _141 = _139 * 6.283185482025146484375;
        float _143 = cos(_141);
        float _145 = _139 * 6.283185482025146484375;
        float _147 = sin(_145);
        float _149 = _143 + (-1.0);
        float _151 = fma(_147, _133, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _153 = _149 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _155 = _135 * _151;
        float _157 = fma(_83, _143, _153);
        float _159 = fma(_77, _155, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _161 = _157 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _163 = fma(_73, _155, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _165 = fma(_159, (*spvDescriptorSet0.vp_c4)._m0[2].x, _161);
        float _167 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[2].z, _165);
        float _169 = _167 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _119 = _157;
        _115 = _159;
        _125 = _163;
        _111 = _169;
    }
    float _171 = _119;
    float _173 = _115;
    float _175 = _125;
    float _177 = _111;
    float _179 = _171 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _181 = _171 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_29.x = _67;
    out.m_29.y = _83;
    out.m_29.z = _65;
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[1].x, _179);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c4)._m0[0].x, _181);
    out.m_31.w = _95;
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[1].z, _183);
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c4)._m0[0].z, _185);
    float _191 = _187 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _193 = _189 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _195 = _191 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[7].x, _195);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[8].x, _197);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[9].x, _199);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[10].x, _201);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[7].z, _203);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[8].z, _205);
    float _215 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[9].z, _207);
    float _217 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[10].z, _209);
    float _219 = _211 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _221 = _213 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _223 = _215 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _219;
    out.gl_Position.y = _221;
    out.gl_Position.z = _223;
    out.gl_Position.w = _225;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

