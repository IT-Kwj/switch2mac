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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_27 [[user(locn3)]];
    float4 m_29 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _69 = fma(2.0, _67, 1.0);
    float _71 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _73 = fma(2.0, _71, 1.0);
    float _75 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _77 = _69 * _69;
    out.m_27.x = 0.0;
    float _79 = fma(_73, _73, _77);
    float _81 = 0.0;
    if (_63)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _49 >= 0.100000001490116119384765625;
    bool _89 = isnan(_49);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _49;
    if (_63)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _51;
    if (!_95)
    {
        float _107 = _51 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _65;
    if (!_95)
    {
        float _113 = _65 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    int _118 = as_type<int>(_115);
    if (!_95)
    {
        float _120 = _49 + (-0.007000000216066837310791015625);
        _99 = _120;
    }
    float _122 = _99;
    float _124 = _109 + (-0.5);
    float _126 = _115 + (-0.5);
    float _128 = _115 * _115;
    float _130 = _103;
    if (_63)
    {
        float _132 = _103 * _85;
        float _134 = precise::clamp(_132, 0.0, 1.0);
        _130 = _134;
    }
    float _136 = _130;
    float _138 = _73 + _124;
    float _140 = _122 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _142 = _69 + _126;
    float _144 = fma(_109, _109, _128);
    float _146 = _122 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _148 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _140);
    float _150 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _152 = _75 + _142;
    float _154 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _146);
    float _156 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _148);
    float _158 = sqrt(_144);
    float _160 = _122 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _162 = _150 + _138;
    float _164 = _156 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _166 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _154);
    float _168 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _160);
    float _170 = -_75;
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c4)._m0[26].y, _170);
    float _174 = _164 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _176 = -_150;
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[26].y, _176);
    float _180 = _166 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _182 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _168);
    float _184 = _122 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _186 = _178 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[11].x, _174);
    float _190 = _182 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _192 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _194 = fma(2.0, _192, 0.5);
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _198 = _158 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _200 = isnan(_158);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _206 = _202 || _204;
    float _208 = _172 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _210 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[11].z, _188);
    float _212 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _214 = fma(2.0, _212, 0.5);
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _218 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _220 = fma(_196, 10.0, _218);
    float _222 = _136;
    if (_63)
    {
        float _224 = -_136;
        float _226 = _224 + 1.0;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _232 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _234 = fma(_216, 10.0, _232);
    float _236 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _238 = _220 * 0.15915493667125701904296875;
    float _240 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[5].w, _230);
    float _242 = _234 * 0.15915493667125701904296875;
    float _244 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[5].w, _236);
    float _246 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _184);
    float _248 = _238 * 6.283185482025146484375;
    float _250 = sin(_248);
    float _252 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _254 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _246);
    float _256 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _258 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _264 = _256 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _266 = _242 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = _115 * 0.89999997615814208984375;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[11].w, _210);
    float _274 = fma(_115, -0.449999988079071044921875, 0.5);
    float _276 = fma(_258, 0.5, 0.5);
    int _278 = as_type<int>(_228);
    if (_63)
    {
        float _280 = _228 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _278 = as_type<int>(_280);
    }
    int _282 = _278;
    out.m_29.x = _240;
    out.m_29.y = _244;
    out.m_29.z = _260;
    out.m_29.w = _264;
    if (_206)
    {
        _118 = as_type<int>(_272);
    }
    int _284 = _118;
    float _286 = fma(_250, 0.0350000001490116119384765625, _196);
    int _288 = _284;
    if (!_206)
    {
        _288 = 0;
    }
    int _290 = _288;
    out.gl_Position.x = _258;
    out.gl_Position.y = _270;
    out.gl_Position.z = 1.0;
    out.m_31.x = _276;
    out.m_31.y = _274;
    float _292 = fma(_268, -0.01750000007450580596923828125, _216);
    if (_63)
    {
        out.m_27.x = as_type<float>(_282);
    }
    out.m_33.x = _286;
    out.m_33.y = _292;
    out.m_35.x = as_type<float>(_290);
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _69 = fma(2.0, _67, 1.0);
    float _71 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _73 = fma(2.0, _71, 1.0);
    float _75 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _77 = _69 * _69;
    out.m_27.x = 0.0;
    float _79 = fma(_73, _73, _77);
    float _81 = 0.0;
    if (_63)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _49 >= 0.100000001490116119384765625;
    bool _89 = isnan(_49);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _49;
    if (_63)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _51;
    if (!_95)
    {
        float _107 = _51 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _65;
    if (!_95)
    {
        float _113 = _65 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    int _118 = as_type<int>(_115);
    if (!_95)
    {
        float _120 = _49 + (-0.007000000216066837310791015625);
        _99 = _120;
    }
    float _122 = _99;
    float _124 = _109 + (-0.5);
    float _126 = _115 + (-0.5);
    float _128 = _115 * _115;
    float _130 = _103;
    if (_63)
    {
        float _132 = _103 * _85;
        float _134 = precise::clamp(_132, 0.0, 1.0);
        _130 = _134;
    }
    float _136 = _130;
    float _138 = _73 + _124;
    float _140 = _122 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _142 = _69 + _126;
    float _144 = fma(_109, _109, _128);
    float _146 = _122 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _148 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _140);
    float _150 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _152 = _75 + _142;
    float _154 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _146);
    float _156 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _148);
    float _158 = sqrt(_144);
    float _160 = _122 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _162 = _150 + _138;
    float _164 = _156 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _166 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _154);
    float _168 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _160);
    float _170 = -_75;
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c4)._m0[26].y, _170);
    float _174 = _164 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _176 = -_150;
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[26].y, _176);
    float _180 = _166 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _182 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _168);
    float _184 = _122 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _186 = _178 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[11].x, _174);
    float _190 = _182 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _192 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _194 = fma(2.0, _192, 0.5);
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _198 = _158 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _200 = isnan(_158);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _206 = _202 || _204;
    float _208 = _172 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _210 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[11].z, _188);
    float _212 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _214 = fma(2.0, _212, 0.5);
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _218 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _220 = fma(_196, 10.0, _218);
    float _222 = _136;
    if (_63)
    {
        float _224 = -_136;
        float _226 = _224 + 1.0;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _232 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _234 = fma(_216, 10.0, _232);
    float _236 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _238 = _220 * 0.15915493667125701904296875;
    float _240 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[5].w, _230);
    float _242 = _234 * 0.15915493667125701904296875;
    float _244 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[5].w, _236);
    float _246 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _184);
    float _248 = _238 * 6.283185482025146484375;
    float _250 = sin(_248);
    float _252 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _254 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _246);
    float _256 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _258 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _264 = _256 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _266 = _242 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = _115 * 0.89999997615814208984375;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[11].w, _210);
    float _274 = fma(_115, -0.449999988079071044921875, 0.5);
    float _276 = fma(_258, 0.5, 0.5);
    int _278 = as_type<int>(_228);
    if (_63)
    {
        float _280 = _228 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _278 = as_type<int>(_280);
    }
    int _282 = _278;
    out.m_29.x = _240;
    out.m_29.y = _244;
    out.m_29.z = _260;
    out.m_29.w = _264;
    if (_206)
    {
        _118 = as_type<int>(_272);
    }
    int _284 = _118;
    float _286 = fma(_250, 0.0350000001490116119384765625, _196);
    int _288 = _284;
    if (!_206)
    {
        _288 = 0;
    }
    int _290 = _288;
    out.gl_Position.x = _258;
    out.gl_Position.y = _270;
    out.gl_Position.z = 1.0;
    out.m_31.x = _276;
    out.m_31.y = _274;
    float _292 = fma(_268, -0.01750000007450580596923828125, _216);
    if (_63)
    {
        out.m_27.x = as_type<float>(_282);
    }
    out.m_33.x = _286;
    out.m_33.y = _292;
    out.m_35.x = as_type<float>(_290);
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _69 = fma(2.0, _67, 1.0);
    float _71 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _73 = fma(2.0, _71, 1.0);
    float _75 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _77 = _69 * _69;
    out.m_27.x = 0.0;
    float _79 = fma(_73, _73, _77);
    float _81 = 0.0;
    if (_63)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _49 >= 0.100000001490116119384765625;
    bool _89 = isnan(_49);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _49;
    if (_63)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _51;
    if (!_95)
    {
        float _107 = _51 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _65;
    if (!_95)
    {
        float _113 = _65 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    int _118 = as_type<int>(_115);
    if (!_95)
    {
        float _120 = _49 + (-0.007000000216066837310791015625);
        _99 = _120;
    }
    float _122 = _99;
    float _124 = _109 + (-0.5);
    float _126 = _115 + (-0.5);
    float _128 = _115 * _115;
    float _130 = _103;
    if (_63)
    {
        float _132 = _103 * _85;
        float _134 = precise::clamp(_132, 0.0, 1.0);
        _130 = _134;
    }
    float _136 = _130;
    float _138 = _73 + _124;
    float _140 = _122 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _142 = _69 + _126;
    float _144 = fma(_109, _109, _128);
    float _146 = _122 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _148 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _140);
    float _150 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _152 = _75 + _142;
    float _154 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _146);
    float _156 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _148);
    float _158 = sqrt(_144);
    float _160 = _122 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _162 = _150 + _138;
    float _164 = _156 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _166 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _154);
    float _168 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _160);
    float _170 = -_75;
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c4)._m0[26].y, _170);
    float _174 = _164 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _176 = -_150;
    float _178 = fma(_162, (*spvDescriptorSet0.vp_c4)._m0[26].y, _176);
    float _180 = _166 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _182 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _168);
    float _184 = _122 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _186 = _178 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[11].x, _174);
    float _190 = _182 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _192 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _194 = fma(2.0, _192, 0.5);
    float _196 = _186 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _198 = _158 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _200 = isnan(_158);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _206 = _202 || _204;
    float _208 = _172 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _210 = fma(_190, (*spvDescriptorSet0.vp_c3)._m0[11].z, _188);
    float _212 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _214 = fma(2.0, _212, 0.5);
    float _216 = _208 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _218 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _220 = fma(_196, 10.0, _218);
    float _222 = _136;
    if (_63)
    {
        float _224 = -_136;
        float _226 = _224 + 1.0;
        _222 = _226;
    }
    float _228 = _222;
    float _230 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _232 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _234 = fma(_216, 10.0, _232);
    float _236 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _238 = _220 * 0.15915493667125701904296875;
    float _240 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[5].w, _230);
    float _242 = _234 * 0.15915493667125701904296875;
    float _244 = fma(_214, (*spvDescriptorSet0.vp_c4)._m0[5].w, _236);
    float _246 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _184);
    float _248 = _238 * 6.283185482025146484375;
    float _250 = sin(_248);
    float _252 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _254 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _246);
    float _256 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _258 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _262 = _254 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _264 = _256 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _266 = _242 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = _115 * 0.89999997615814208984375;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c3)._m0[11].w, _210);
    float _274 = fma(_115, -0.449999988079071044921875, 0.5);
    float _276 = fma(_258, 0.5, 0.5);
    int _278 = as_type<int>(_228);
    if (_63)
    {
        float _280 = _228 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _278 = as_type<int>(_280);
    }
    int _282 = _278;
    out.m_29.x = _240;
    out.m_29.y = _244;
    out.m_29.z = _260;
    out.m_29.w = _264;
    if (_206)
    {
        _118 = as_type<int>(_272);
    }
    int _284 = _118;
    float _286 = fma(_250, 0.0350000001490116119384765625, _196);
    int _288 = _284;
    if (!_206)
    {
        _288 = 0;
    }
    int _290 = _288;
    out.gl_Position.x = _258;
    out.gl_Position.y = _270;
    out.gl_Position.z = 1.0;
    out.m_31.x = _276;
    out.m_31.y = _274;
    float _292 = fma(_268, -0.01750000007450580596923828125, _216);
    if (_63)
    {
        out.m_27.x = as_type<float>(_282);
    }
    out.m_33.x = _286;
    out.m_33.y = _292;
    out.m_35.x = as_type<float>(_290);
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

