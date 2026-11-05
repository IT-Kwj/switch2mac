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
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _53 = _49 * _49;
    float _55 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _57 = fma(_51, _51, _53);
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = precise::max(0.0, _55);
    float _67 = sqrt(_57);
    float _69 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _71 = -_65;
    float _73 = fma(_69, (*spvDescriptorSet0.vp_c9)._m0[26].w, _71);
    bool _77 = _67 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _79 = 0.0;
    float _81 = _65;
    float _83 = _73;
    if (!_77)
    {
        float _85 = -_51;
        float _87 = _85 + (-0.0);
        _79 = _87;
    }
    float _89 = _79;
    float _91 = _89;
    if (!_77)
    {
        float _93 = -_49;
        float _95 = _93 + (-0.0);
        _81 = _95;
    }
    float _97 = _81;
    bool _99 = !_77;
    float _101 = _97;
    if (!_99)
    {
        float _103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _105 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _107 = _67 + _105;
        float _109 = rsqrt(_57);
        float _111 = _107 * _103;
        float _113 = _73 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _115 = _111 * 0.15915493667125701904296875;
        float _117 = _115 * 6.283185482025146484375;
        float _119 = cos(_117);
        float _121 = _115 * 6.283185482025146484375;
        float _123 = sin(_121);
        float _125 = _119 + (-1.0);
        float _127 = _125 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = fma(_123, _113, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _131 = fma(_73, _119, _127);
        float _133 = -_129;
        float _135 = _109 * _133;
        float _137 = _51 * _135;
        float _139 = _49 * _135;
        _83 = _131;
        _91 = _137;
        _101 = _139;
    }
    float _141 = _83;
    float _143 = _91;
    float _145 = _101;
    float _147 = _141 * _141;
    float _149 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _151 = _61 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _153 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _155 = fma(_143, _143, _147);
    float _157 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _149);
    float _159 = _59 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _161 = _151 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _163 = fma(_145, _145, _155);
    float _165 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _167 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _157);
    float _169 = _151 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = rsqrt(_163);
    float _173 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _165);
    float _175 = _151 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _153);
    float _179 = _63 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[1].x, _161);
    float _183 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _173);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _189 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _177);
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _181);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _185);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _187);
    float _197 = _191 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _199 = _171 * _141;
    float _201 = _171 * _143;
    float _203 = _171 * _145;
    float _205 = _193 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _207 = _167 + _199;
    float _209 = _183 + _201;
    float _211 = _189 + _203;
    float _213 = _195 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _215 = -_199;
    float _217 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[15].z, _215);
    float _219 = -_201;
    float _221 = fma(_209, (*spvDescriptorSet0.vp_c7)._m0[15].z, _219);
    float _223 = -_203;
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c7)._m0[15].z, _223);
    float _227 = in.m_28.x;
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _241 = _197 + _231;
    float _243 = _205 + _235;
    float _245 = _213 + _239;
    float _247 = in.m_28.y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_31.x = _243;
    out.m_31.y = _241;
    out.m_31.z = _245;
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _251);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[2].x, _253);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _255);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _257);
    float _265 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
    float _267 = _261 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _269 = _263 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _271 = _265 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_33.x = _227;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _275 = _267 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _267 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_35.w = _271;
    float _279 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[10].x, _273);
    float _281 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _283 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    out.m_33.y = _247;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _281);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _283);
    float _291 = _285 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _297 = _291 * 0.999998986721038818359375;
    out.gl_Position.x = _293;
    out.gl_Position.y = _295;
    out.gl_Position.z = _297;
    out.gl_Position.w = _291;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _53 = _49 * _49;
    float _55 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _57 = fma(_51, _51, _53);
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = precise::max(0.0, _55);
    float _67 = sqrt(_57);
    float _69 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _71 = -_65;
    float _73 = fma(_69, (*spvDescriptorSet0.vp_c9)._m0[26].w, _71);
    bool _77 = _67 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _79 = 0.0;
    float _81 = _65;
    float _83 = _73;
    if (!_77)
    {
        float _85 = -_51;
        float _87 = _85 + (-0.0);
        _79 = _87;
    }
    float _89 = _79;
    float _91 = _89;
    if (!_77)
    {
        float _93 = -_49;
        float _95 = _93 + (-0.0);
        _81 = _95;
    }
    float _97 = _81;
    bool _99 = !_77;
    float _101 = _97;
    if (!_99)
    {
        float _103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _105 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _107 = _67 + _105;
        float _109 = rsqrt(_57);
        float _111 = _107 * _103;
        float _113 = _73 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _115 = _111 * 0.15915493667125701904296875;
        float _117 = _115 * 6.283185482025146484375;
        float _119 = cos(_117);
        float _121 = _115 * 6.283185482025146484375;
        float _123 = sin(_121);
        float _125 = _119 + (-1.0);
        float _127 = _125 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = fma(_123, _113, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _131 = fma(_73, _119, _127);
        float _133 = -_129;
        float _135 = _109 * _133;
        float _137 = _51 * _135;
        float _139 = _49 * _135;
        _83 = _131;
        _91 = _137;
        _101 = _139;
    }
    float _141 = _83;
    float _143 = _91;
    float _145 = _101;
    float _147 = _141 * _141;
    float _149 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _151 = _61 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _153 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _155 = fma(_143, _143, _147);
    float _157 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _149);
    float _159 = _59 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _161 = _151 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _163 = fma(_145, _145, _155);
    float _165 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _167 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _157);
    float _169 = _151 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = rsqrt(_163);
    float _173 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _165);
    float _175 = _151 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _153);
    float _179 = _63 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[1].x, _161);
    float _183 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _173);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _189 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _177);
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _181);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _185);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _187);
    float _197 = _191 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _199 = _171 * _141;
    float _201 = _171 * _143;
    float _203 = _171 * _145;
    float _205 = _193 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _207 = _167 + _199;
    float _209 = _183 + _201;
    float _211 = _189 + _203;
    float _213 = _195 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _215 = -_199;
    float _217 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[15].z, _215);
    float _219 = -_201;
    float _221 = fma(_209, (*spvDescriptorSet0.vp_c7)._m0[15].z, _219);
    float _223 = -_203;
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c7)._m0[15].z, _223);
    float _227 = in.m_28.x;
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _241 = _197 + _231;
    float _243 = _205 + _235;
    float _245 = _213 + _239;
    float _247 = in.m_28.y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_31.x = _243;
    out.m_31.y = _241;
    out.m_31.z = _245;
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _251);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[2].x, _253);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _255);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _257);
    float _265 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
    float _267 = _261 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _269 = _263 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _271 = _265 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_33.x = _227;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _275 = _267 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _267 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_35.w = _271;
    float _279 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[10].x, _273);
    float _281 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _283 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    out.m_33.y = _247;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _281);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _283);
    float _291 = _285 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _297 = _291 * 0.999998986721038818359375;
    out.gl_Position.x = _293;
    out.gl_Position.y = _295;
    out.gl_Position.z = _297;
    out.gl_Position.w = _291;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _53 = _49 * _49;
    float _55 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _57 = fma(_51, _51, _53);
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = precise::max(0.0, _55);
    float _67 = sqrt(_57);
    float _69 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _71 = -_65;
    float _73 = fma(_69, (*spvDescriptorSet0.vp_c9)._m0[26].w, _71);
    bool _77 = _67 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _79 = 0.0;
    float _81 = _65;
    float _83 = _73;
    if (!_77)
    {
        float _85 = -_51;
        float _87 = _85 + (-0.0);
        _79 = _87;
    }
    float _89 = _79;
    float _91 = _89;
    if (!_77)
    {
        float _93 = -_49;
        float _95 = _93 + (-0.0);
        _81 = _95;
    }
    float _97 = _81;
    bool _99 = !_77;
    float _101 = _97;
    if (!_99)
    {
        float _103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _105 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _107 = _67 + _105;
        float _109 = rsqrt(_57);
        float _111 = _107 * _103;
        float _113 = _73 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _115 = _111 * 0.15915493667125701904296875;
        float _117 = _115 * 6.283185482025146484375;
        float _119 = cos(_117);
        float _121 = _115 * 6.283185482025146484375;
        float _123 = sin(_121);
        float _125 = _119 + (-1.0);
        float _127 = _125 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _129 = fma(_123, _113, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _131 = fma(_73, _119, _127);
        float _133 = -_129;
        float _135 = _109 * _133;
        float _137 = _51 * _135;
        float _139 = _49 * _135;
        _83 = _131;
        _91 = _137;
        _101 = _139;
    }
    float _141 = _83;
    float _143 = _91;
    float _145 = _101;
    float _147 = _141 * _141;
    float _149 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _151 = _61 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _153 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _155 = fma(_143, _143, _147);
    float _157 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _149);
    float _159 = _59 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _161 = _151 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _163 = fma(_145, _145, _155);
    float _165 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _167 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _157);
    float _169 = _151 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _171 = rsqrt(_163);
    float _173 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _165);
    float _175 = _151 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _153);
    float _179 = _63 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[1].x, _161);
    float _183 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _173);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[0].x, _169);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _189 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _177);
    float _191 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _181);
    float _193 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _185);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _187);
    float _197 = _191 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _199 = _171 * _141;
    float _201 = _171 * _143;
    float _203 = _171 * _145;
    float _205 = _193 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _207 = _167 + _199;
    float _209 = _183 + _201;
    float _211 = _189 + _203;
    float _213 = _195 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _215 = -_199;
    float _217 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[15].z, _215);
    float _219 = -_201;
    float _221 = fma(_209, (*spvDescriptorSet0.vp_c7)._m0[15].z, _219);
    float _223 = -_203;
    float _225 = fma(_211, (*spvDescriptorSet0.vp_c7)._m0[15].z, _223);
    float _227 = in.m_28.x;
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _233 = -_221;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _237 = -_225;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _241 = _197 + _231;
    float _243 = _205 + _235;
    float _245 = _213 + _239;
    float _247 = in.m_28.y;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    out.m_31.x = _243;
    out.m_31.y = _241;
    out.m_31.z = _245;
    float _255 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _251);
    float _259 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[2].x, _253);
    float _261 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _255);
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _257);
    float _265 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
    float _267 = _261 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _269 = _263 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _271 = _265 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    out.m_33.x = _227;
    float _273 = _267 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _275 = _267 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _267 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_35.w = _271;
    float _279 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[10].x, _273);
    float _281 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _283 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    out.m_33.y = _247;
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _287 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _281);
    float _289 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _283);
    float _291 = _285 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _297 = _291 * 0.999998986721038818359375;
    out.gl_Position.x = _293;
    out.gl_Position.y = _295;
    out.gl_Position.z = _297;
    out.gl_Position.w = _291;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

