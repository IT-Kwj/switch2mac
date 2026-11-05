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
    float4 m_25 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _47 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _49 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[5].x, _43);
    float _51 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[4].x, _45);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[6].x, _47);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[5].z, _49);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[4].z, _51);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[6].z, _53);
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = _55 * _55;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _69 = -_61;
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].y, _69);
    float _73 = fma(_57, _57, _63);
    float _75 = -_65;
    float _77 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].y, _75);
    float _79 = -_67;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].y, _79);
    bool _85 = _41 > 0.0;
    float _87 = fma(_59, _59, _73);
    float _89 = _77 * _77;
    bool _91 = _41 >= 0.0;
    bool _93 = isnan(_41);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = rsqrt(_87);
    float _103 = fma(_71, _71, _89);
    bool _105 = _39 > 0.0;
    bool _107 = _39 >= 0.0;
    bool _109 = isnan(_39);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_81, _81, _103);
    float _119 = sqrt(_87);
    int _122 = _115 ? 0 : 1;
    float _124 = rsqrt(_117);
    float _126 = -_101;
    float _128 = _57 * _126;
    float _130 = _119 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _132 = _130 * _41;
    float _134 = _130 * _39;
    float _136 = -_101;
    float _138 = _55 * _136;
    float _140 = _81 * _124;
    float _142 = _71 * _124;
    float _144 = _77 * _124;
    float _146 = -_101;
    float _148 = _59 * _146;
    float _150 = _140 * _128;
    float _152 = _142 * _138;
    int _154 = ~_122;
    int _156 = _154 + 1;
    int _158 = _156 + 1;
    float _160 = _144 * _148;
    float _162 = -_150;
    float _164 = fma(_142, _148, _162);
    float _166 = -_152;
    float _168 = fma(_144, _128, _166);
    int _170 = _158;
    if (!_105)
    {
        int _172 = ~_122;
        int _174 = _172 + 1;
        _170 = _174;
    }
    int _176 = _170;
    float _178 = -_160;
    float _180 = fma(_140, _138, _178);
    float _182 = _164 * _132;
    float _184 = _180 * _132;
    float _186 = fma(_144, _134, _182);
    float _188 = _168 * _132;
    int _190 = _99 ? 0 : 1;
    float _192 = fma(_142, _134, _184);
    float _194 = _138 + _186;
    float _196 = fma(_140, _134, _188);
    int _198 = ~_190;
    int _200 = _198 + 1;
    int _202 = _200 + 1;
    float _204 = _128 + _192;
    float _206 = _55 + _194;
    float _208 = _148 + _196;
    int _210 = _202;
    if (!_85)
    {
        int _212 = ~_190;
        int _214 = _212 + 1;
        _210 = _214;
    }
    int _216 = _210;
    float _218 = _57 + _204;
    float _220 = _206 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _222 = _206 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _224 = _206 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _226 = _206 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _228 = _59 + _208;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[0].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[1].x, _222);
    float _234 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[2].x, _224);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[3].x, _226);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[0].z, _230);
    float _240 = float(_176);
    float _242 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[1].z, _232);
    float _244 = float(_216);
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[2].z, _234);
    float _248 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[3].z, _236);
    float _250 = fma(_240, 0.5, 0.5);
    float _252 = _238 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _254 = fma(_244, -0.5, 0.5);
    float _256 = _242 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _258 = _246 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _260 = _248 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _250;
    out.m_25.y = _254;
    out.gl_Position.x = _252;
    out.gl_Position.y = _256;
    out.gl_Position.z = _258;
    out.gl_Position.w = _260;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _47 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _49 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[5].x, _43);
    float _51 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[4].x, _45);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[6].x, _47);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[5].z, _49);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[4].z, _51);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[6].z, _53);
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = _55 * _55;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _69 = -_61;
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].y, _69);
    float _73 = fma(_57, _57, _63);
    float _75 = -_65;
    float _77 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].y, _75);
    float _79 = -_67;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].y, _79);
    bool _85 = _41 > 0.0;
    float _87 = fma(_59, _59, _73);
    float _89 = _77 * _77;
    bool _91 = _41 >= 0.0;
    bool _93 = isnan(_41);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = rsqrt(_87);
    float _103 = fma(_71, _71, _89);
    bool _105 = _39 > 0.0;
    bool _107 = _39 >= 0.0;
    bool _109 = isnan(_39);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_81, _81, _103);
    float _119 = sqrt(_87);
    int _122 = _115 ? 0 : 1;
    float _124 = rsqrt(_117);
    float _126 = -_101;
    float _128 = _57 * _126;
    float _130 = _119 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _132 = _130 * _41;
    float _134 = _130 * _39;
    float _136 = -_101;
    float _138 = _55 * _136;
    float _140 = _81 * _124;
    float _142 = _71 * _124;
    float _144 = _77 * _124;
    float _146 = -_101;
    float _148 = _59 * _146;
    float _150 = _140 * _128;
    float _152 = _142 * _138;
    int _154 = ~_122;
    int _156 = _154 + 1;
    int _158 = _156 + 1;
    float _160 = _144 * _148;
    float _162 = -_150;
    float _164 = fma(_142, _148, _162);
    float _166 = -_152;
    float _168 = fma(_144, _128, _166);
    int _170 = _158;
    if (!_105)
    {
        int _172 = ~_122;
        int _174 = _172 + 1;
        _170 = _174;
    }
    int _176 = _170;
    float _178 = -_160;
    float _180 = fma(_140, _138, _178);
    float _182 = _164 * _132;
    float _184 = _180 * _132;
    float _186 = fma(_144, _134, _182);
    float _188 = _168 * _132;
    int _190 = _99 ? 0 : 1;
    float _192 = fma(_142, _134, _184);
    float _194 = _138 + _186;
    float _196 = fma(_140, _134, _188);
    int _198 = ~_190;
    int _200 = _198 + 1;
    int _202 = _200 + 1;
    float _204 = _128 + _192;
    float _206 = _55 + _194;
    float _208 = _148 + _196;
    int _210 = _202;
    if (!_85)
    {
        int _212 = ~_190;
        int _214 = _212 + 1;
        _210 = _214;
    }
    int _216 = _210;
    float _218 = _57 + _204;
    float _220 = _206 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _222 = _206 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _224 = _206 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _226 = _206 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _228 = _59 + _208;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[0].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[1].x, _222);
    float _234 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[2].x, _224);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[3].x, _226);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[0].z, _230);
    float _240 = float(_176);
    float _242 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[1].z, _232);
    float _244 = float(_216);
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[2].z, _234);
    float _248 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[3].z, _236);
    float _250 = fma(_240, 0.5, 0.5);
    float _252 = _238 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _254 = fma(_244, -0.5, 0.5);
    float _256 = _242 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _258 = _246 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _260 = _248 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _250;
    out.m_25.y = _254;
    out.gl_Position.x = _252;
    out.gl_Position.y = _256;
    out.gl_Position.z = _258;
    out.gl_Position.w = _260;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = in.m_22.x;
    float _41 = in.m_22.y;
    float _43 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _45 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _47 = (*spvDescriptorSet0.vp_c3)._m0[7].y * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _49 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[5].x, _43);
    float _51 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[4].x, _45);
    float _53 = fma((*spvDescriptorSet0.vp_c3)._m0[7].x, (*spvDescriptorSet0.vp_c3)._m0[6].x, _47);
    float _55 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[5].z, _49);
    float _57 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[4].z, _51);
    float _59 = fma((*spvDescriptorSet0.vp_c3)._m0[7].z, (*spvDescriptorSet0.vp_c3)._m0[6].z, _53);
    float _61 = _55 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _63 = _55 * _55;
    float _65 = _59 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _67 = _57 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _69 = -_61;
    float _71 = fma(_59, (*spvDescriptorSet0.vp_c3)._m0[5].y, _69);
    float _73 = fma(_57, _57, _63);
    float _75 = -_65;
    float _77 = fma(_57, (*spvDescriptorSet0.vp_c3)._m0[6].y, _75);
    float _79 = -_67;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c3)._m0[4].y, _79);
    bool _85 = _41 > 0.0;
    float _87 = fma(_59, _59, _73);
    float _89 = _77 * _77;
    bool _91 = _41 >= 0.0;
    bool _93 = isnan(_41);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = rsqrt(_87);
    float _103 = fma(_71, _71, _89);
    bool _105 = _39 > 0.0;
    bool _107 = _39 >= 0.0;
    bool _109 = isnan(_39);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_81, _81, _103);
    float _119 = sqrt(_87);
    int _122 = _115 ? 0 : 1;
    float _124 = rsqrt(_117);
    float _126 = -_101;
    float _128 = _57 * _126;
    float _130 = _119 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _132 = _130 * _41;
    float _134 = _130 * _39;
    float _136 = -_101;
    float _138 = _55 * _136;
    float _140 = _81 * _124;
    float _142 = _71 * _124;
    float _144 = _77 * _124;
    float _146 = -_101;
    float _148 = _59 * _146;
    float _150 = _140 * _128;
    float _152 = _142 * _138;
    int _154 = ~_122;
    int _156 = _154 + 1;
    int _158 = _156 + 1;
    float _160 = _144 * _148;
    float _162 = -_150;
    float _164 = fma(_142, _148, _162);
    float _166 = -_152;
    float _168 = fma(_144, _128, _166);
    int _170 = _158;
    if (!_105)
    {
        int _172 = ~_122;
        int _174 = _172 + 1;
        _170 = _174;
    }
    int _176 = _170;
    float _178 = -_160;
    float _180 = fma(_140, _138, _178);
    float _182 = _164 * _132;
    float _184 = _180 * _132;
    float _186 = fma(_144, _134, _182);
    float _188 = _168 * _132;
    int _190 = _99 ? 0 : 1;
    float _192 = fma(_142, _134, _184);
    float _194 = _138 + _186;
    float _196 = fma(_140, _134, _188);
    int _198 = ~_190;
    int _200 = _198 + 1;
    int _202 = _200 + 1;
    float _204 = _128 + _192;
    float _206 = _55 + _194;
    float _208 = _148 + _196;
    int _210 = _202;
    if (!_85)
    {
        int _212 = ~_190;
        int _214 = _212 + 1;
        _210 = _214;
    }
    int _216 = _210;
    float _218 = _57 + _204;
    float _220 = _206 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _222 = _206 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _224 = _206 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _226 = _206 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _228 = _59 + _208;
    float _230 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[0].x, _220);
    float _232 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[1].x, _222);
    float _234 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[2].x, _224);
    float _236 = fma(_218, (*spvDescriptorSet0.vp_c3)._m0[3].x, _226);
    float _238 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[0].z, _230);
    float _240 = float(_176);
    float _242 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[1].z, _232);
    float _244 = float(_216);
    float _246 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[2].z, _234);
    float _248 = fma(_228, (*spvDescriptorSet0.vp_c3)._m0[3].z, _236);
    float _250 = fma(_240, 0.5, 0.5);
    float _252 = _238 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _254 = fma(_244, -0.5, 0.5);
    float _256 = _242 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _258 = _246 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _260 = _248 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.m_25.x = _250;
    out.m_25.y = _254;
    out.gl_Position.x = _252;
    out.gl_Position.y = _256;
    out.gl_Position.z = _258;
    out.gl_Position.w = _260;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

