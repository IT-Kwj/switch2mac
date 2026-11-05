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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c7 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_32 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = in.m_32.x;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _161 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _163 = in.m_32.y;
    float _165 = fma(_147, _151, _159);
    float _167 = fma(_147, _149, _161);
    float _169 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _171 = _165 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _175 = fma(_147, _153, _169);
    float _177 = _165 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _179 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[0].x, _173);
    out.m_35.x = _157;
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[2].x, _177);
    float _185 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    out.m_35.y = _163;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].z, _183);
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _195 = _189 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].x, _197);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
    float _209 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[1].z, _203);
    float _211 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[0].z, _205);
    float _213 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _223);
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _237 = _233 * 10000.0;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _239 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _245 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _247 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _243);
    float _251 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _255 = 1.0 / _247;
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _251);
    float _261 = _257 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _263 = _259 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _265 = _235 * _255;
    float _267 = _253 * _265;
    out.gl_Position.x = _261;
    out.gl_Position.y = _263;
    out.gl_Position.z = _267;
    out.gl_Position.w = _235;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = in.m_32.x;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _161 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _163 = in.m_32.y;
    float _165 = fma(_147, _151, _159);
    float _167 = fma(_147, _149, _161);
    float _169 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _171 = _165 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _175 = fma(_147, _153, _169);
    float _177 = _165 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _179 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[0].x, _173);
    out.m_35.x = _157;
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[2].x, _177);
    float _185 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    out.m_35.y = _163;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].z, _183);
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _195 = _189 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].x, _197);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
    float _209 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[1].z, _203);
    float _211 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[0].z, _205);
    float _213 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _223);
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _237 = _233 * 10000.0;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _239 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _245 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _247 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _243);
    float _251 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _255 = 1.0 / _247;
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _251);
    float _261 = _257 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _263 = _259 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _265 = _235 * _255;
    float _267 = _253 * _265;
    out.gl_Position.x = _261;
    out.gl_Position.y = _263;
    out.gl_Position.z = _267;
    out.gl_Position.w = _235;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _117 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _51 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _49;
    float _53 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _55 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _53;
    float _57 = _51 * _51;
    float _59 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _61 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _59;
    float _63 = fma(_55, _55, _57);
    float _65 = fma(_61, _61, _63);
    float _67 = sqrt(_65);
    bool _71 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _79 = _75 || _77;
    float _81 = _61;
    if (!_79)
    {
        _81 = 1.0;
    }
    float _83 = _81;
    bool _85 = !_79;
    float _87 = _83;
    if (!_85)
    {
        bool _89 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _91 = isnan(_67);
        bool _93 = _89 || _91;
        bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _97 = _93 || _95;
        if (!_97)
        {
            float _99 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _101 = _67 + _99;
            float _103 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _105 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _103;
            float _107 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _109 = _107 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _111 = 1.0 / _105;
            float _113 = _101 * _111;
            float _115 = fma(_113, _109, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _87 = _115;
            _117 = true;
        }
        else
        {
            bool _119 = _67 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _121 = isnan(_67);
            bool _123 = _119 || _121;
            bool _125 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _127 = _123 || _125;
            if (!_127)
            {
                float _129 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _131 = _67 + _129;
                float _133 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _135 = _133 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _137 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _139 = _137 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _141 = 1.0 / _135;
                float _143 = _131 * _141;
                float _145 = fma(_143, _139, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _87 = _145;
                _117 = true;
            }
            else
            {
                _87 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _117 = false;
    float _147 = _87;
    float _149 = in.m_30.x;
    float _151 = in.m_30.y;
    float _153 = in.m_30.z;
    float _155 = _147 + (-1.0);
    float _157 = in.m_32.x;
    float _159 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _161 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _163 = in.m_32.y;
    float _165 = fma(_147, _151, _159);
    float _167 = fma(_147, _149, _161);
    float _169 = _155 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _171 = _165 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _173 = _165 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _175 = fma(_147, _153, _169);
    float _177 = _165 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _179 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[1].x, _171);
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[0].x, _173);
    out.m_35.x = _157;
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c7)._m0[2].x, _177);
    float _185 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].z, _179);
    float _187 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    out.m_35.y = _163;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].z, _183);
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _195 = _189 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _197 = _191 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _199 = _191 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _201 = _191 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].x, _197);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].x, _201);
    float _209 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[1].z, _203);
    float _211 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[0].z, _205);
    float _213 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _219 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _221 = _215 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _223 = _215 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _225 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].x, _221);
    float _227 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].x, _223);
    float _229 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[9].z, _225);
    float _231 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[10].z, _227);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _235 = _231 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _237 = _233 * 10000.0;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _239 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _243 = _215 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _245 = _215 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _247 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[10].z, _235);
    float _249 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].x, _243);
    float _251 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].x, _245);
    float _253 = fma(_241, (*spvDescriptorSet0.vp_c4)._m0[9].z, _233);
    float _255 = 1.0 / _247;
    float _257 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[7].z, _249);
    float _259 = fma(_219, (*spvDescriptorSet0.vp_c4)._m0[8].z, _251);
    float _261 = _257 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _263 = _259 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _265 = _235 * _255;
    float _267 = _253 * _265;
    out.gl_Position.x = _261;
    out.gl_Position.y = _263;
    out.gl_Position.z = _267;
    out.gl_Position.w = _235;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

