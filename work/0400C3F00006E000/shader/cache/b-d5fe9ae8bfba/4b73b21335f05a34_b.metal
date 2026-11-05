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
    float4 m_33 [[user(locn0)]];
    float4 m_27 [[user(locn2)]];
    float4 m_29 [[user(locn4)]];
    float4 m_31 [[user(locn5)]];
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.y;
    float _49 = in.m_24.x;
    bool _53 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _55 = isnan(0.0);
    bool _57 = _53 || _55;
    bool _59 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _61 = _57 || _59;
    float _63 = in.m_24.z;
    float _65 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _67 = fma(2.0, _65, 1.0);
    float _69 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _71 = fma(2.0, _69, 1.0);
    out.m_27.x = 0.0;
    float _73 = _71 * _71;
    float _75 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _77 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _79 = fma(_67, _67, _73);
    float _81 = 0.0;
    if (_61)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _47 >= 0.100000001490116119384765625;
    bool _89 = isnan(_47);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _47;
    if (_61)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _49;
    if (!_95)
    {
        float _107 = _49 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _63;
    if (!_95)
    {
        float _113 = _63 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    if (!_95)
    {
        float _117 = _47 + (-0.007000000216066837310791015625);
        _99 = _117;
    }
    float _119 = _99;
    float _121 = _109 + (-0.5);
    float _123 = _115 * _115;
    float _125 = _115 + (-0.5);
    float _127 = _103;
    if (_61)
    {
        float _129 = _103 * _85;
        float _131 = precise::clamp(_129, 0.0, 1.0);
        _127 = _131;
    }
    float _133 = _127;
    float _135 = _67 + _121;
    float _137 = _119 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _139 = fma(_109, _109, _123);
    float _141 = _71 + _125;
    float _143 = _119 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _147 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _149 = _133;
    if (_61)
    {
        float _151 = -_133;
        float _153 = _151 + 1.0;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _143);
    float _159 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _145);
    float _161 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _163 = _147 + _135;
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _157);
    float _167 = _159 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _169 = _161 + _141;
    float _171 = -_147;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[26].y, _171);
    float _175 = sqrt(_139);
    float _177 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _179 = _167 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _181 = -_161;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[26].y, _181);
    float _185 = _119 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _187 = _173 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _179);
    float _191 = _119 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _193 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _185);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _197 = _183 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _199 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _201 = fma(2.0, _199, 0.5);
    float _203 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _193);
    float _205 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _207 = fma(_195, 10.0, _205);
    float _209 = _197 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _211 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _191);
    float _213 = _203 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    bool _215 = _175 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _217 = isnan(_175);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _223 = _219 || _221;
    float _225 = _207 * 0.15915493667125701904296875;
    float _227 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    float _229 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[11].z, _189);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_209, 10.0, _231);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[5].w, _75);
    float _237 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _239 = fma(2.0, _237, 0.5);
    float _241 = _225 * 6.283185482025146484375;
    float _243 = sin(_241);
    float _245 = _233 * 0.15915493667125701904296875;
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _249 = _227 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _251 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _253 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _255 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].w, _229);
    float _257 = _245 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c4)._m0[5].w, _77);
    float _263 = _251 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _265 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _267 = _115 * 0.89999997615814208984375;
    int _270 = as_type<int>(_155);
    int _272 = as_type<int>(_255);
    if (_61)
    {
        float _274 = _155 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _270 = as_type<int>(_274);
    }
    int _276 = _270;
    if (!_223)
    {
        _272 = 0;
    }
    int _278 = _272;
    out.m_29.x = _235;
    out.m_29.y = _261;
    out.m_29.z = _253;
    out.m_29.w = _263;
    float _280 = fma(_243, 0.0350000001490116119384765625, _195);
    out.gl_Position.x = _265;
    out.gl_Position.y = _267;
    out.gl_Position.z = 1.0;
    if (_61)
    {
        out.m_27.x = as_type<float>(_276);
    }
    float _282 = fma(_259, -0.01750000007450580596923828125, _209);
    out.m_31.x = as_type<float>(_278);
    out.m_33.x = _280;
    out.m_33.y = _282;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.y;
    float _49 = in.m_24.x;
    bool _53 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _55 = isnan(0.0);
    bool _57 = _53 || _55;
    bool _59 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _61 = _57 || _59;
    float _63 = in.m_24.z;
    float _65 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _67 = fma(2.0, _65, 1.0);
    float _69 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _71 = fma(2.0, _69, 1.0);
    out.m_27.x = 0.0;
    float _73 = _71 * _71;
    float _75 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _77 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _79 = fma(_67, _67, _73);
    float _81 = 0.0;
    if (_61)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _47 >= 0.100000001490116119384765625;
    bool _89 = isnan(_47);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _47;
    if (_61)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _49;
    if (!_95)
    {
        float _107 = _49 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _63;
    if (!_95)
    {
        float _113 = _63 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    if (!_95)
    {
        float _117 = _47 + (-0.007000000216066837310791015625);
        _99 = _117;
    }
    float _119 = _99;
    float _121 = _109 + (-0.5);
    float _123 = _115 * _115;
    float _125 = _115 + (-0.5);
    float _127 = _103;
    if (_61)
    {
        float _129 = _103 * _85;
        float _131 = precise::clamp(_129, 0.0, 1.0);
        _127 = _131;
    }
    float _133 = _127;
    float _135 = _67 + _121;
    float _137 = _119 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _139 = fma(_109, _109, _123);
    float _141 = _71 + _125;
    float _143 = _119 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _147 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _149 = _133;
    if (_61)
    {
        float _151 = -_133;
        float _153 = _151 + 1.0;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _143);
    float _159 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _145);
    float _161 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _163 = _147 + _135;
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _157);
    float _167 = _159 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _169 = _161 + _141;
    float _171 = -_147;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[26].y, _171);
    float _175 = sqrt(_139);
    float _177 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _179 = _167 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _181 = -_161;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[26].y, _181);
    float _185 = _119 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _187 = _173 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _179);
    float _191 = _119 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _193 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _185);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _197 = _183 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _199 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _201 = fma(2.0, _199, 0.5);
    float _203 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _193);
    float _205 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _207 = fma(_195, 10.0, _205);
    float _209 = _197 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _211 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _191);
    float _213 = _203 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    bool _215 = _175 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _217 = isnan(_175);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _223 = _219 || _221;
    float _225 = _207 * 0.15915493667125701904296875;
    float _227 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    float _229 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[11].z, _189);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_209, 10.0, _231);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[5].w, _75);
    float _237 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _239 = fma(2.0, _237, 0.5);
    float _241 = _225 * 6.283185482025146484375;
    float _243 = sin(_241);
    float _245 = _233 * 0.15915493667125701904296875;
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _249 = _227 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _251 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _253 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _255 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].w, _229);
    float _257 = _245 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c4)._m0[5].w, _77);
    float _263 = _251 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _265 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _267 = _115 * 0.89999997615814208984375;
    int _270 = as_type<int>(_155);
    int _272 = as_type<int>(_255);
    if (_61)
    {
        float _274 = _155 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _270 = as_type<int>(_274);
    }
    int _276 = _270;
    if (!_223)
    {
        _272 = 0;
    }
    int _278 = _272;
    out.m_29.x = _235;
    out.m_29.y = _261;
    out.m_29.z = _253;
    out.m_29.w = _263;
    float _280 = fma(_243, 0.0350000001490116119384765625, _195);
    out.gl_Position.x = _265;
    out.gl_Position.y = _267;
    out.gl_Position.z = 1.0;
    if (_61)
    {
        out.m_27.x = as_type<float>(_276);
    }
    float _282 = fma(_259, -0.01750000007450580596923828125, _209);
    out.m_31.x = as_type<float>(_278);
    out.m_33.x = _280;
    out.m_33.y = _282;
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = in.m_24.y;
    float _49 = in.m_24.x;
    bool _53 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _55 = isnan(0.0);
    bool _57 = _53 || _55;
    bool _59 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _61 = _57 || _59;
    float _63 = in.m_24.z;
    float _65 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _67 = fma(2.0, _65, 1.0);
    float _69 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _71 = fma(2.0, _69, 1.0);
    out.m_27.x = 0.0;
    float _73 = _71 * _71;
    float _75 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _77 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _79 = fma(_67, _67, _73);
    float _81 = 0.0;
    if (_61)
    {
        float _83 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _81 = _83;
    }
    float _85 = _81;
    bool _87 = _47 >= 0.100000001490116119384765625;
    bool _89 = isnan(_47);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.100000001490116119384765625);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _47;
    if (_61)
    {
        float _101 = sqrt(_79);
        _97 = _101;
    }
    float _103 = _97;
    float _105 = _49;
    if (!_95)
    {
        float _107 = _49 * 1.0499999523162841796875;
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _63;
    if (!_95)
    {
        float _113 = _63 * 1.0499999523162841796875;
        _111 = _113;
    }
    float _115 = _111;
    if (!_95)
    {
        float _117 = _47 + (-0.007000000216066837310791015625);
        _99 = _117;
    }
    float _119 = _99;
    float _121 = _109 + (-0.5);
    float _123 = _115 * _115;
    float _125 = _115 + (-0.5);
    float _127 = _103;
    if (_61)
    {
        float _129 = _103 * _85;
        float _131 = precise::clamp(_129, 0.0, 1.0);
        _127 = _131;
    }
    float _133 = _127;
    float _135 = _67 + _121;
    float _137 = _119 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _139 = fma(_109, _109, _123);
    float _141 = _71 + _125;
    float _143 = _119 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _145 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[5].x, _137);
    float _147 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _149 = _133;
    if (_61)
    {
        float _151 = -_133;
        float _153 = _151 + 1.0;
        _149 = _153;
    }
    float _155 = _149;
    float _157 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[4].x, _143);
    float _159 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[5].z, _145);
    float _161 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _163 = _147 + _135;
    float _165 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[4].z, _157);
    float _167 = _159 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _169 = _161 + _141;
    float _171 = -_147;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c4)._m0[26].y, _171);
    float _175 = sqrt(_139);
    float _177 = _165 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _179 = _167 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _181 = -_161;
    float _183 = fma(_169, (*spvDescriptorSet0.vp_c4)._m0[26].y, _181);
    float _185 = _119 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _187 = _173 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _189 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[11].x, _179);
    float _191 = _119 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _193 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[6].x, _185);
    float _195 = _187 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _197 = _183 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _199 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _201 = fma(2.0, _199, 0.5);
    float _203 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[6].z, _193);
    float _205 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _207 = fma(_195, 10.0, _205);
    float _209 = _197 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _211 = fma(_109, (*spvDescriptorSet0.vp_c3)._m0[7].x, _191);
    float _213 = _203 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    bool _215 = _175 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _217 = isnan(_175);
    bool _219 = _215 || _217;
    bool _221 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _223 = _219 || _221;
    float _225 = _207 * 0.15915493667125701904296875;
    float _227 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[7].z, _211);
    float _229 = fma(_213, (*spvDescriptorSet0.vp_c3)._m0[11].z, _189);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_209, 10.0, _231);
    float _235 = fma(_201, (*spvDescriptorSet0.vp_c4)._m0[5].w, _75);
    float _237 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _239 = fma(2.0, _237, 0.5);
    float _241 = _225 * 6.283185482025146484375;
    float _243 = sin(_241);
    float _245 = _233 * 0.15915493667125701904296875;
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _249 = _227 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _251 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _253 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _255 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].w, _229);
    float _257 = _245 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_239, (*spvDescriptorSet0.vp_c4)._m0[5].w, _77);
    float _263 = _251 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _265 = fma(_109, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _267 = _115 * 0.89999997615814208984375;
    int _270 = as_type<int>(_155);
    int _272 = as_type<int>(_255);
    if (_61)
    {
        float _274 = _155 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _270 = as_type<int>(_274);
    }
    int _276 = _270;
    if (!_223)
    {
        _272 = 0;
    }
    int _278 = _272;
    out.m_29.x = _235;
    out.m_29.y = _261;
    out.m_29.z = _253;
    out.m_29.w = _263;
    float _280 = fma(_243, 0.0350000001490116119384765625, _195);
    out.gl_Position.x = _265;
    out.gl_Position.y = _267;
    out.gl_Position.z = 1.0;
    if (_61)
    {
        out.m_27.x = as_type<float>(_276);
    }
    float _282 = fma(_259, -0.01750000007450580596923828125, _209);
    out.m_31.x = as_type<float>(_278);
    out.m_33.x = _280;
    out.m_33.y = _282;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

