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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_33 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_30 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = in.m_30.x;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = in.m_30.y;
    float _163 = fma(_145, _149, _157);
    float _165 = fma(_145, _147, _159);
    float _167 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _169 = _163 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _173 = fma(_145, _151, _167);
    float _175 = _163 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[1].x, _169);
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[0].x, _171);
    out.m_33.x = _155;
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].z, _179);
    out.m_33.y = _161;
    float _187 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _195 = _189 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _213 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _219 = _213 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _225 = _213 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].x, _219);
    float _229 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].x, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _227);
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _229);
    float _239 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _231);
    float _241 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _245 = _235 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _243;
    out.gl_Position.y = _245;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = in.m_30.x;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = in.m_30.y;
    float _163 = fma(_145, _149, _157);
    float _165 = fma(_145, _147, _159);
    float _167 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _169 = _163 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _173 = fma(_145, _151, _167);
    float _175 = _163 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[1].x, _169);
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[0].x, _171);
    out.m_33.x = _155;
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].z, _179);
    out.m_33.y = _161;
    float _187 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _195 = _189 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _213 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _219 = _213 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _225 = _213 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].x, _219);
    float _229 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].x, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _227);
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _229);
    float _239 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _231);
    float _241 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _245 = _235 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _243;
    out.gl_Position.y = _245;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
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
    bool _115 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _47 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _49 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _47;
    float _51 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _53 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _51;
    float _55 = _49 * _49;
    float _57 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _59 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _57;
    float _61 = fma(_53, _53, _55);
    float _63 = fma(_59, _59, _61);
    float _65 = sqrt(_63);
    bool _69 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _71 = isnan(_65);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _77 = _73 || _75;
    float _79 = _59;
    if (!_77)
    {
        _79 = 1.0;
    }
    float _81 = _79;
    bool _83 = !_77;
    float _85 = _81;
    if (!_83)
    {
        bool _87 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _89 = isnan(_65);
        bool _91 = _87 || _89;
        bool _93 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _95 = _91 || _93;
        if (!_95)
        {
            float _97 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _99 = _65 + _97;
            float _101 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _103 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _101;
            float _105 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _107 = _105 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _109 = 1.0 / _103;
            float _111 = _99 * _109;
            float _113 = fma(_111, _107, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _85 = _113;
            _115 = true;
        }
        else
        {
            bool _117 = _65 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _119 = isnan(_65);
            bool _121 = _117 || _119;
            bool _123 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _125 = _121 || _123;
            if (!_125)
            {
                float _127 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _129 = _65 + _127;
                float _131 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _133 = _131 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _135 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _137 = _135 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _139 = 1.0 / _133;
                float _141 = _129 * _139;
                float _143 = fma(_141, _137, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _85 = _143;
                _115 = true;
            }
            else
            {
                _85 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _115 = false;
    float _145 = _85;
    float _147 = in.m_28.x;
    float _149 = in.m_28.y;
    float _151 = in.m_28.z;
    float _153 = _145 + (-1.0);
    float _155 = in.m_30.x;
    float _157 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _159 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _161 = in.m_30.y;
    float _163 = fma(_145, _149, _157);
    float _165 = fma(_145, _147, _159);
    float _167 = _153 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _169 = _163 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _171 = _163 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _173 = fma(_145, _151, _167);
    float _175 = _163 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[1].x, _169);
    float _179 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[0].x, _171);
    out.m_33.x = _155;
    float _181 = fma(_165, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].z, _177);
    float _185 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].z, _179);
    out.m_33.y = _161;
    float _187 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _189 = _183 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _191 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _187 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _195 = _189 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _197 = _189 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _199 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _201 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[1].x, _195);
    float _203 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[0].x, _197);
    float _205 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _199);
    float _207 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[1].z, _201);
    float _209 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[0].z, _203);
    float _211 = fma(_193, (*spvDescriptorSet0.vp_c4)._m0[2].z, _205);
    float _213 = _207 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _215 = _209 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _217 = _211 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _219 = _213 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _221 = _213 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _223 = _213 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _225 = _213 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _227 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[8].x, _219);
    float _229 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[7].x, _221);
    float _231 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[9].x, _223);
    float _233 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[10].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[8].z, _227);
    float _237 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[7].z, _229);
    float _239 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[9].z, _231);
    float _241 = fma(_217, (*spvDescriptorSet0.vp_c4)._m0[10].z, _233);
    float _243 = _237 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _245 = _235 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _247 = _239 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _249 = _241 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _243;
    out.gl_Position.y = _245;
    out.gl_Position.z = _247;
    out.gl_Position.w = _249;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

