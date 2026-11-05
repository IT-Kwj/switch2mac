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
    float4 m_35 [[user(locn5)]];
    float4 m_31 [[user(locn6)]];
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    float _53 = in.m_24.z;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _57 = fma(2.0, _55, 0.5);
    float _59 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _63 = fma(2.0, _61, 0.5);
    float _65 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _77 = _73 || _75;
    float _79 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[5].w, _59);
    float _81 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _83 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[5].w, _65);
    float _85 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    out.m_27.x = 0.0;
    float _87 = _81 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _89 = _85 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _91 = _49 >= 0.100000001490116119384765625;
    bool _93 = isnan(_49);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.100000001490116119384765625);
    bool _99 = _95 || _97;
    float _101 = _49 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _103 = _49 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _105 = _49 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    out.m_29.x = _79;
    out.m_29.y = _83;
    out.m_29.z = _89;
    out.m_29.w = _87;
    float _107 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[33].x, _101);
    float _109 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[32].x, _103);
    float _111 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[34].x, _105);
    float _113 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[33].z, _107);
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[32].z, _109);
    float _117 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[34].z, _111);
    float _119 = 0.0;
    float _121 = _101;
    if (_99)
    {
        _119 = _51;
    }
    float _123 = _119;
    float _125 = _123;
    if (!_99)
    {
        float _127 = _51 * 1.0499999523162841796875;
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _113 * _113;
    float _133 = 0.0;
    if (_99)
    {
        _133 = _53;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_99)
    {
        float _139 = _53 * 1.0499999523162841796875;
        _137 = _139;
    }
    float _141 = _137;
    float _143 = _129 + (-0.5);
    float _145 = fma(_115, _115, _131);
    if (_99)
    {
        _121 = _49;
    }
    float _147 = _121;
    float _149 = _147;
    if (!_99)
    {
        float _151 = _49 + (-0.007000000216066837310791015625);
        _149 = _151;
    }
    float _153 = _149;
    float _155 = _143 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _157 = fma(_117, _117, _145);
    float _159 = _141 * _141;
    float _161 = _141 + (-0.5);
    float _163 = _155 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _165 = _153 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _167 = fma(_129, _129, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _171 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _173 = fma(_163, 10.0, _171);
    float _175 = _153 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _177 = sqrt(_167);
    float _179 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[5].x, _165);
    float _181 = _173 * 0.15915493667125701904296875;
    float _183 = _153 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _185 = _153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _187 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].x, _175);
    float _189 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[5].z, _179);
    float _191 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[6].x, _183);
    float _193 = _145;
    if (_77)
    {
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _169 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _201 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _203 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[4].z, _187);
    float _205 = _189 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _207 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_199, 10.0, _207);
    float _211 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[6].z, _191);
    float _213 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _215 = rsqrt(_157);
    float _217 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    bool _223 = _177 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _225 = isnan(_177);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _231 = _227 || _229;
    float _233 = _211 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _235 = _205 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _239 = _181 * 6.283185482025146484375;
    float _241 = sin(_239);
    float _243 = _209 * 0.15915493667125701904296875;
    float _245 = _205 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _247 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _221);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _235);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _253 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[8].x, _245);
    float _255 = _213 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _257 = _243 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[10].z, _247);
    float _263 = _197;
    int _266 = as_type<int>(_205);
    if (_77)
    {
        float _268 = _177 * _197;
        float _270 = precise::clamp(_268, 0.0, 1.0);
        _263 = _270;
    }
    float _272 = _263;
    float _274 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[8].z, _253);
    float _276 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[9].z, _249);
    float _278 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _280 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[10].w, _261);
    float _282 = _272;
    if (_77)
    {
        float _284 = -_272;
        float _286 = _284 + 1.0;
        _282 = _286;
    }
    float _288 = _282;
    float _290 = fma(_241, 0.0350000001490116119384765625, _163);
    float _292 = _113 * _215;
    float _294 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[8].w, _274);
    float _296 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[9].w, _276);
    int _298 = as_type<int>(_288);
    if (_231)
    {
        _266 = as_type<int>(_278);
    }
    int _300 = _266;
    float _302 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[45].y, _280);
    int _306 = _300;
    if (_77)
    {
        float _308 = _288 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _298 = as_type<int>(_308);
    }
    int _310 = _298;
    float _312 = fma(_259, -0.01750000007450580596923828125, _199);
    if (!_231)
    {
        _306 = 0;
    }
    int _314 = _306;
    out.m_31.x = _292;
    out.gl_Position.x = _294;
    out.gl_Position.y = _296;
    out.gl_Position.z = _304;
    out.gl_Position.w = _278;
    if (_77)
    {
        out.m_27.x = as_type<float>(_310);
    }
    out.m_33.x = _290;
    out.m_33.y = _312;
    out.m_35.x = as_type<float>(_314);
    if (!_231)
    {
        out.gl_Position.w = 0.0;
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    float _53 = in.m_24.z;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _57 = fma(2.0, _55, 0.5);
    float _59 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _63 = fma(2.0, _61, 0.5);
    float _65 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _77 = _73 || _75;
    float _79 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[5].w, _59);
    float _81 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _83 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[5].w, _65);
    float _85 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    out.m_27.x = 0.0;
    float _87 = _81 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _89 = _85 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _91 = _49 >= 0.100000001490116119384765625;
    bool _93 = isnan(_49);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.100000001490116119384765625);
    bool _99 = _95 || _97;
    float _101 = _49 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _103 = _49 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _105 = _49 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    out.m_29.x = _79;
    out.m_29.y = _83;
    out.m_29.z = _89;
    out.m_29.w = _87;
    float _107 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[33].x, _101);
    float _109 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[32].x, _103);
    float _111 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[34].x, _105);
    float _113 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[33].z, _107);
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[32].z, _109);
    float _117 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[34].z, _111);
    float _119 = 0.0;
    float _121 = _101;
    if (_99)
    {
        _119 = _51;
    }
    float _123 = _119;
    float _125 = _123;
    if (!_99)
    {
        float _127 = _51 * 1.0499999523162841796875;
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _113 * _113;
    float _133 = 0.0;
    if (_99)
    {
        _133 = _53;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_99)
    {
        float _139 = _53 * 1.0499999523162841796875;
        _137 = _139;
    }
    float _141 = _137;
    float _143 = _129 + (-0.5);
    float _145 = fma(_115, _115, _131);
    if (_99)
    {
        _121 = _49;
    }
    float _147 = _121;
    float _149 = _147;
    if (!_99)
    {
        float _151 = _49 + (-0.007000000216066837310791015625);
        _149 = _151;
    }
    float _153 = _149;
    float _155 = _143 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _157 = fma(_117, _117, _145);
    float _159 = _141 * _141;
    float _161 = _141 + (-0.5);
    float _163 = _155 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _165 = _153 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _167 = fma(_129, _129, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _171 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _173 = fma(_163, 10.0, _171);
    float _175 = _153 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _177 = sqrt(_167);
    float _179 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[5].x, _165);
    float _181 = _173 * 0.15915493667125701904296875;
    float _183 = _153 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _185 = _153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _187 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].x, _175);
    float _189 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[5].z, _179);
    float _191 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[6].x, _183);
    float _193 = _145;
    if (_77)
    {
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _169 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _201 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _203 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[4].z, _187);
    float _205 = _189 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _207 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_199, 10.0, _207);
    float _211 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[6].z, _191);
    float _213 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _215 = rsqrt(_157);
    float _217 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    bool _223 = _177 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _225 = isnan(_177);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _231 = _227 || _229;
    float _233 = _211 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _235 = _205 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _239 = _181 * 6.283185482025146484375;
    float _241 = sin(_239);
    float _243 = _209 * 0.15915493667125701904296875;
    float _245 = _205 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _247 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _221);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _235);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _253 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[8].x, _245);
    float _255 = _213 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _257 = _243 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[10].z, _247);
    float _263 = _197;
    int _266 = as_type<int>(_205);
    if (_77)
    {
        float _268 = _177 * _197;
        float _270 = precise::clamp(_268, 0.0, 1.0);
        _263 = _270;
    }
    float _272 = _263;
    float _274 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[8].z, _253);
    float _276 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[9].z, _249);
    float _278 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _280 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[10].w, _261);
    float _282 = _272;
    if (_77)
    {
        float _284 = -_272;
        float _286 = _284 + 1.0;
        _282 = _286;
    }
    float _288 = _282;
    float _290 = fma(_241, 0.0350000001490116119384765625, _163);
    float _292 = _113 * _215;
    float _294 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[8].w, _274);
    float _296 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[9].w, _276);
    int _298 = as_type<int>(_288);
    if (_231)
    {
        _266 = as_type<int>(_278);
    }
    int _300 = _266;
    float _302 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[45].y, _280);
    int _306 = _300;
    if (_77)
    {
        float _308 = _288 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _298 = as_type<int>(_308);
    }
    int _310 = _298;
    float _312 = fma(_259, -0.01750000007450580596923828125, _199);
    if (!_231)
    {
        _306 = 0;
    }
    int _314 = _306;
    out.m_31.x = _292;
    out.gl_Position.x = _294;
    out.gl_Position.y = _296;
    out.gl_Position.z = _304;
    out.gl_Position.w = _278;
    if (_77)
    {
        out.m_27.x = as_type<float>(_310);
    }
    out.m_33.x = _290;
    out.m_33.y = _312;
    out.m_35.x = as_type<float>(_314);
    if (!_231)
    {
        out.gl_Position.w = 0.0;
    }
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.x;
    float _53 = in.m_24.z;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _57 = fma(2.0, _55, 0.5);
    float _59 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _63 = fma(2.0, _61, 0.5);
    float _65 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _77 = _73 || _75;
    float _79 = fma(_57, (*spvDescriptorSet0.vp_c4)._m0[5].w, _59);
    float _81 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _83 = fma(_63, (*spvDescriptorSet0.vp_c4)._m0[5].w, _65);
    float _85 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    out.m_27.x = 0.0;
    float _87 = _81 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _89 = _85 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _91 = _49 >= 0.100000001490116119384765625;
    bool _93 = isnan(_49);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.100000001490116119384765625);
    bool _99 = _95 || _97;
    float _101 = _49 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _103 = _49 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _105 = _49 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    out.m_29.x = _79;
    out.m_29.y = _83;
    out.m_29.z = _89;
    out.m_29.w = _87;
    float _107 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[33].x, _101);
    float _109 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[32].x, _103);
    float _111 = fma(_51, (*spvDescriptorSet0.vp_c4)._m0[34].x, _105);
    float _113 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[33].z, _107);
    float _115 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[32].z, _109);
    float _117 = fma(_53, (*spvDescriptorSet0.vp_c4)._m0[34].z, _111);
    float _119 = 0.0;
    float _121 = _101;
    if (_99)
    {
        _119 = _51;
    }
    float _123 = _119;
    float _125 = _123;
    if (!_99)
    {
        float _127 = _51 * 1.0499999523162841796875;
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _113 * _113;
    float _133 = 0.0;
    if (_99)
    {
        _133 = _53;
    }
    float _135 = _133;
    float _137 = _135;
    if (!_99)
    {
        float _139 = _53 * 1.0499999523162841796875;
        _137 = _139;
    }
    float _141 = _137;
    float _143 = _129 + (-0.5);
    float _145 = fma(_115, _115, _131);
    if (_99)
    {
        _121 = _49;
    }
    float _147 = _121;
    float _149 = _147;
    if (!_99)
    {
        float _151 = _49 + (-0.007000000216066837310791015625);
        _149 = _151;
    }
    float _153 = _149;
    float _155 = _143 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _157 = fma(_117, _117, _145);
    float _159 = _141 * _141;
    float _161 = _141 + (-0.5);
    float _163 = _155 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _165 = _153 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _167 = fma(_129, _129, _159);
    float _169 = _161 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _171 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _173 = fma(_163, 10.0, _171);
    float _175 = _153 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _177 = sqrt(_167);
    float _179 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[5].x, _165);
    float _181 = _173 * 0.15915493667125701904296875;
    float _183 = _153 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _185 = _153 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _187 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[4].x, _175);
    float _189 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[5].z, _179);
    float _191 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[6].x, _183);
    float _193 = _145;
    if (_77)
    {
        float _195 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _169 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _201 = fma(_129, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _203 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[4].z, _187);
    float _205 = _189 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _207 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_199, 10.0, _207);
    float _211 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[6].z, _191);
    float _213 = fma(_141, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _215 = rsqrt(_157);
    float _217 = _203 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _219 = _205 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _221 = _205 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    bool _223 = _177 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _225 = isnan(_177);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _231 = _227 || _229;
    float _233 = _211 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _235 = _205 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[11].x, _219);
    float _239 = _181 * 6.283185482025146484375;
    float _241 = sin(_239);
    float _243 = _209 * 0.15915493667125701904296875;
    float _245 = _205 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _247 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[10].x, _221);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[9].x, _235);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[11].z, _237);
    float _253 = fma(_217, (*spvDescriptorSet0.vp_c3)._m0[8].x, _245);
    float _255 = _213 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _257 = _243 * 6.283185482025146484375;
    float _259 = sin(_257);
    float _261 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[10].z, _247);
    float _263 = _197;
    int _266 = as_type<int>(_205);
    if (_77)
    {
        float _268 = _177 * _197;
        float _270 = precise::clamp(_268, 0.0, 1.0);
        _263 = _270;
    }
    float _272 = _263;
    float _274 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[8].z, _253);
    float _276 = fma(_233, (*spvDescriptorSet0.vp_c3)._m0[9].z, _249);
    float _278 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _280 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[10].w, _261);
    float _282 = _272;
    if (_77)
    {
        float _284 = -_272;
        float _286 = _284 + 1.0;
        _282 = _286;
    }
    float _288 = _282;
    float _290 = fma(_241, 0.0350000001490116119384765625, _163);
    float _292 = _113 * _215;
    float _294 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[8].w, _274);
    float _296 = fma(_255, (*spvDescriptorSet0.vp_c3)._m0[9].w, _276);
    int _298 = as_type<int>(_288);
    if (_231)
    {
        _266 = as_type<int>(_278);
    }
    int _300 = _266;
    float _302 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[45].y, _280);
    int _306 = _300;
    if (_77)
    {
        float _308 = _288 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _298 = as_type<int>(_308);
    }
    int _310 = _298;
    float _312 = fma(_259, -0.01750000007450580596923828125, _199);
    if (!_231)
    {
        _306 = 0;
    }
    int _314 = _306;
    out.m_31.x = _292;
    out.gl_Position.x = _294;
    out.gl_Position.y = _296;
    out.gl_Position.z = _304;
    out.gl_Position.w = _278;
    if (_77)
    {
        out.m_27.x = as_type<float>(_310);
    }
    out.m_33.x = _290;
    out.m_33.y = _312;
    out.m_35.x = as_type<float>(_314);
    if (!_231)
    {
        out.gl_Position.w = 0.0;
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

