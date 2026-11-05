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
    float4 m_27 [[user(locn1)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_22 [[attribute(0)]];
    float4 m_24 [[attribute(1)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _133 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _129;
    float _131;
    if (!_111)
    {
        float _113 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _117 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _113);
        float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _115);
        float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _117);
        float _123 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _119);
        float _125 = _121 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _129 = _127;
        _131 = _125;
        _133 = true;
    }
    else
    {
        int _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _138 = _136 != 0;
        float _140 = _53;
        float _142 = _51;
        if (!_138)
        {
            float _144 = in.m_24.x;
            float _146 = in.m_24.y;
            _140 = _144;
            _142 = _146;
        }
        float _148 = _140;
        float _150 = _142;
        bool _152 = !_138;
        _129 = _150;
        _131 = _148;
        if (!_152)
        {
            int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _156 = _154 != 0;
            float _158 = _148;
            float _160 = _150;
            if (!_156)
            {
                float _162 = in.m_24.x;
                float _164 = in.m_24.y;
                _158 = _162;
                _160 = _164;
            }
            float _166 = _158;
            float _168 = _160;
            bool _170 = !_156;
            float _172 = _168;
            float _174 = _166;
            int _176 = as_type<int>(_166);
            float _178 = _168;
            if (!_170)
            {
                float _180 = in.m_24.x;
                float _182 = in.m_24.y;
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _190 = _188 != 0;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _202 = _200 != 0;
                if (_186)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _204 = _172;
                float _206 = _204;
                if (_186)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _208 = _174;
                float _210 = _208;
                if (!_186)
                {
                    _206 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _206;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _210;
                float _216 = _212 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _220 = _180;
                float _222 = _182;
                if (_198)
                {
                    float _224 = _216 * _180;
                    _220 = _224;
                }
                float _226 = _220;
                float _228 = -_216;
                float _230 = _228 + 1.0;
                int _232 = as_type<int>(_226);
                if (_202)
                {
                    float _234 = _218 * _182;
                    _222 = _234;
                }
                float _236 = _222;
                float _238 = -_218;
                float _240 = _238 + 1.0;
                float _242 = _236;
                if (_190)
                {
                    float _244 = _226 + _230;
                    _232 = as_type<int>(_244);
                }
                int _246 = _232;
                if (_194)
                {
                    float _248 = _236 + _240;
                    _242 = _248;
                }
                float _250 = _242;
                _176 = _246;
                _178 = _250;
            }
            int _252 = _176;
            float _254 = _178;
            int _256 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _258 = _256 != 0;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _266 = _264 != 0;
            int _268 = _252;
            int _270 = as_type<int>(_254);
            if (_262)
            {
                float _272 = -as_type<float>(_252);
                float _274 = _272 + 1.0;
                _268 = as_type<int>(_274);
            }
            int _276 = _268;
            if (_266)
            {
                float _278 = -_254;
                float _280 = _278 + 1.0;
                _270 = as_type<int>(_280);
            }
            int _282 = _270;
            bool _284 = !_258;
            float _286 = _284 ? as_type<float>(_276) : as_type<float>(_282);
            bool _288 = !_258;
            float _290 = _288 ? as_type<float>(_282) : as_type<float>(_276);
            _129 = _290;
            _131 = _286;
        }
    }
    _133 = false;
    float _292 = _129;
    float _294 = _131;
    float _296 = _292 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _298 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _300 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[8].x, _296);
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[7].x, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _308 = -_304;
    float _310 = _308 + 1.0;
    out.m_27.x = _306;
    out.m_27.y = _310;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _133 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _129;
    float _131;
    if (!_111)
    {
        float _113 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _117 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _113);
        float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _115);
        float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _117);
        float _123 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _119);
        float _125 = _121 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _129 = _127;
        _131 = _125;
        _133 = true;
    }
    else
    {
        int _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _138 = _136 != 0;
        float _140 = _53;
        float _142 = _51;
        if (!_138)
        {
            float _144 = in.m_24.x;
            float _146 = in.m_24.y;
            _140 = _144;
            _142 = _146;
        }
        float _148 = _140;
        float _150 = _142;
        bool _152 = !_138;
        _129 = _150;
        _131 = _148;
        if (!_152)
        {
            int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _156 = _154 != 0;
            float _158 = _148;
            float _160 = _150;
            if (!_156)
            {
                float _162 = in.m_24.x;
                float _164 = in.m_24.y;
                _158 = _162;
                _160 = _164;
            }
            float _166 = _158;
            float _168 = _160;
            bool _170 = !_156;
            float _172 = _168;
            float _174 = _166;
            int _176 = as_type<int>(_166);
            float _178 = _168;
            if (!_170)
            {
                float _180 = in.m_24.x;
                float _182 = in.m_24.y;
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _190 = _188 != 0;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _202 = _200 != 0;
                if (_186)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _204 = _172;
                float _206 = _204;
                if (_186)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _208 = _174;
                float _210 = _208;
                if (!_186)
                {
                    _206 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _206;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _210;
                float _216 = _212 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _220 = _180;
                float _222 = _182;
                if (_198)
                {
                    float _224 = _216 * _180;
                    _220 = _224;
                }
                float _226 = _220;
                float _228 = -_216;
                float _230 = _228 + 1.0;
                int _232 = as_type<int>(_226);
                if (_202)
                {
                    float _234 = _218 * _182;
                    _222 = _234;
                }
                float _236 = _222;
                float _238 = -_218;
                float _240 = _238 + 1.0;
                float _242 = _236;
                if (_190)
                {
                    float _244 = _226 + _230;
                    _232 = as_type<int>(_244);
                }
                int _246 = _232;
                if (_194)
                {
                    float _248 = _236 + _240;
                    _242 = _248;
                }
                float _250 = _242;
                _176 = _246;
                _178 = _250;
            }
            int _252 = _176;
            float _254 = _178;
            int _256 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _258 = _256 != 0;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _266 = _264 != 0;
            int _268 = _252;
            int _270 = as_type<int>(_254);
            if (_262)
            {
                float _272 = -as_type<float>(_252);
                float _274 = _272 + 1.0;
                _268 = as_type<int>(_274);
            }
            int _276 = _268;
            if (_266)
            {
                float _278 = -_254;
                float _280 = _278 + 1.0;
                _270 = as_type<int>(_280);
            }
            int _282 = _270;
            bool _284 = !_258;
            float _286 = _284 ? as_type<float>(_276) : as_type<float>(_282);
            bool _288 = !_258;
            float _290 = _288 ? as_type<float>(_282) : as_type<float>(_276);
            _129 = _290;
            _131 = _286;
        }
    }
    _133 = false;
    float _292 = _129;
    float _294 = _131;
    float _296 = _292 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _298 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _300 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[8].x, _296);
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[7].x, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _308 = -_304;
    float _310 = _308 + 1.0;
    out.m_27.x = _306;
    out.m_27.y = _310;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    bool _133 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _41 = in.m_22.x;
    float _43 = in.m_22.y;
    float _45 = in.m_22.z;
    bool _49 = 0 != as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].x);
    float _51 = _43 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
    float _53 = _41 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
    float _55 = _51 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _57 = _51 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _59 = _51 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _61 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[5].x, _55);
    float _63 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[4].x, _57);
    float _65 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[6].x, _59);
    float _67 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[5].z, _61);
    float _69 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[4].z, _63);
    float _71 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[6].z, _65);
    float _73 = _67 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _75 = _69 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _77 = _71 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _79 = _73 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _83 = _73 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _85 = _73 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _87 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[1].x, _79);
    float _89 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[0].x, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[2].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.vp_c3)._m0[3].x, _85);
    float _95 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[1].z, _87);
    float _97 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[0].z, _89);
    float _99 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[2].z, _91);
    float _101 = fma(_77, (*spvDescriptorSet0.vp_c3)._m0[3].z, _93);
    float _103 = _95 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _105 = _97 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _105;
    out.gl_Position.y = _103;
    out.gl_Position.z = _107;
    out.gl_Position.w = _109;
    bool _111 = !_49;
    float _129;
    float _131;
    if (!_111)
    {
        float _113 = _51 * (*spvDescriptorSet0.vp_c3)._m0[14].y;
        float _115 = _51 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
        float _117 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[14].x, _113);
        float _119 = fma(_53, (*spvDescriptorSet0.vp_c3)._m0[15].x, _115);
        float _121 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[14].z, _117);
        float _123 = fma(_45, (*spvDescriptorSet0.vp_c3)._m0[15].z, _119);
        float _125 = _121 + (*spvDescriptorSet0.vp_c3)._m0[14].w;
        float _127 = _123 + (*spvDescriptorSet0.vp_c3)._m0[15].w;
        _129 = _127;
        _131 = _125;
        _133 = true;
    }
    else
    {
        int _136 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 1;
        bool _138 = _136 != 0;
        float _140 = _53;
        float _142 = _51;
        if (!_138)
        {
            float _144 = in.m_24.x;
            float _146 = in.m_24.y;
            _140 = _144;
            _142 = _146;
        }
        float _148 = _140;
        float _150 = _142;
        bool _152 = !_138;
        _129 = _150;
        _131 = _148;
        if (!_152)
        {
            int _154 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 2;
            bool _156 = _154 != 0;
            float _158 = _148;
            float _160 = _150;
            if (!_156)
            {
                float _162 = in.m_24.x;
                float _164 = in.m_24.y;
                _158 = _162;
                _160 = _164;
            }
            float _166 = _158;
            float _168 = _160;
            bool _170 = !_156;
            float _172 = _168;
            float _174 = _166;
            int _176 = as_type<int>(_166);
            float _178 = _168;
            if (!_170)
            {
                float _180 = in.m_24.x;
                float _182 = in.m_24.y;
                int _184 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
                bool _186 = _184 != 0;
                int _188 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 4;
                bool _190 = _188 != 0;
                int _192 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 8;
                bool _194 = _192 != 0;
                int _196 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 16;
                bool _198 = _196 != 0;
                int _200 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 32;
                bool _202 = _200 != 0;
                if (_186)
                {
                    _172 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _204 = _172;
                float _206 = _204;
                if (_186)
                {
                    _174 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _208 = _174;
                float _210 = _208;
                if (!_186)
                {
                    _206 = (*spvDescriptorSet0.vp_c3)._m0[28].x;
                }
                float _212 = _206;
                if (!_186)
                {
                    _210 = (*spvDescriptorSet0.vp_c3)._m0[28].y;
                }
                float _214 = _210;
                float _216 = _212 * (*spvDescriptorSet0.vp_c3)._m0[33].x;
                float _218 = _214 * (*spvDescriptorSet0.vp_c3)._m0[33].y;
                float _220 = _180;
                float _222 = _182;
                if (_198)
                {
                    float _224 = _216 * _180;
                    _220 = _224;
                }
                float _226 = _220;
                float _228 = -_216;
                float _230 = _228 + 1.0;
                int _232 = as_type<int>(_226);
                if (_202)
                {
                    float _234 = _218 * _182;
                    _222 = _234;
                }
                float _236 = _222;
                float _238 = -_218;
                float _240 = _238 + 1.0;
                float _242 = _236;
                if (_190)
                {
                    float _244 = _226 + _230;
                    _232 = as_type<int>(_244);
                }
                int _246 = _232;
                if (_194)
                {
                    float _248 = _236 + _240;
                    _242 = _248;
                }
                float _250 = _242;
                _176 = _246;
                _178 = _250;
            }
            int _252 = _176;
            float _254 = _178;
            int _256 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 65536;
            bool _258 = _256 != 0;
            int _260 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 131072;
            bool _262 = _260 != 0;
            int _264 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[34].w) & 262144;
            bool _266 = _264 != 0;
            int _268 = _252;
            int _270 = as_type<int>(_254);
            if (_262)
            {
                float _272 = -as_type<float>(_252);
                float _274 = _272 + 1.0;
                _268 = as_type<int>(_274);
            }
            int _276 = _268;
            if (_266)
            {
                float _278 = -_254;
                float _280 = _278 + 1.0;
                _270 = as_type<int>(_280);
            }
            int _282 = _270;
            bool _284 = !_258;
            float _286 = _284 ? as_type<float>(_276) : as_type<float>(_282);
            bool _288 = !_258;
            float _290 = _288 ? as_type<float>(_282) : as_type<float>(_276);
            _129 = _290;
            _131 = _286;
        }
    }
    _133 = false;
    float _292 = _129;
    float _294 = _131;
    float _296 = _292 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _298 = _292 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _300 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[8].x, _296);
    float _302 = fma(_294, (*spvDescriptorSet0.vp_c3)._m0[7].x, _298);
    float _304 = _300 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _306 = _302 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _308 = -_304;
    float _310 = _308 + 1.0;
    out.m_27.x = _306;
    out.m_27.y = _310;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

